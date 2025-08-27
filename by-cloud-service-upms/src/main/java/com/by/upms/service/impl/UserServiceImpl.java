package com.by.upms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.by.common.constant.JwtConstant;
import com.by.common.dto.LoginDTO;
import com.by.common.dto.LoginResultDTO;
import com.by.upms.entity.LoginLog;
import com.by.upms.entity.SysUser;
import com.by.upms.mapper.LoginLogMapper;
import com.by.upms.mapper.SysUserMapper;
import com.by.upms.service.UserService;
import com.by.upms.utils.JwtUtils;
import com.by.upms.utils.RedisUtils;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Date;

@Service
public class UserServiceImpl extends ServiceImpl<SysUserMapper, SysUser>  implements UserService {

    @Value("${jwt.secret}")
    private String redisKeyPrefix;

    @Autowired
    private LoginLogMapper loginLogMapper;
    
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @Autowired
    private JwtUtils jwtUtils;
    
    @Autowired
    private RedisUtils redisUtils;
    
    @Override
    public LoginResultDTO login(LoginDTO loginDTO, HttpServletRequest request) {

        String username = loginDTO.getUsername();
        String password = loginDTO.getPassword();
        
        // 检查用户是否存在
        SysUser user = baseMapper.findByUsername(username);
        boolean matches = passwordEncoder.matches(password, user.getPassword());
        if (user == null || !passwordEncoder.matches(password, user.getPassword())) {
            recordLoginLog(username, request, 0, "用户名或密码错误");
            throw new RuntimeException("用户名或密码错误");
        }
        
        // 检查用户状态
        if (user.getStatus() != 1) {
            throw new RuntimeException("用户被禁用");
        }
        
        // 生成token
        String token = jwtUtils.generateToken(user.getId(), username);
        
        // 将token存入Redis
        String userTokenKey = JwtConstant.USER_TOKEN_PREFIX + user.getId();
        redisUtils.setToken(userTokenKey, token);
        
        // 记录登录日志
        recordLoginLog(username, request, 1, "登录成功");
        
        // 返回登录结果
        LoginResultDTO result = new LoginResultDTO();
        result.setToken(JwtConstant.TOKEN_PREFIX + token);
        result.setUsername(username);
        result.setNickname(user.getNickname());
        result.setExpireTime(System.currentTimeMillis() + 3600 * 1000);
        
        return result;
    }
    
    @Override
    public void logout(String token) {
        if (StringUtils.hasText(token)) {
            Long userId = jwtUtils.getUserIdFromToken(token);
            if (userId != null) {
                // 从Redis中删除token
                String userTokenKey = JwtConstant.USER_TOKEN_PREFIX + userId;
                redisUtils.delete(redisKeyPrefix + userTokenKey);
                
                // 将token加入黑名单
                String blacklistKey = JwtConstant.TOKEN_BLACKLIST_PREFIX + token;
                redisUtils.set(blacklistKey, "1", 3600);
            }
        }
    }
    
    @Override
    public SysUser getUserInfo(Long userId) {
        return baseMapper.selectById(userId);
    }
    
    @Override
    public boolean register(SysUser user) {

        if (baseMapper.existsByUsername(user.getUsername())) {
            return false;
        }
        // 加密密码
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setStatus(1);
        baseMapper.insert(user);
        return true;
    }
    
    @Override
    public boolean updatePassword(Long userId, String oldPassword, String newPassword) {
        SysUser user = baseMapper.selectById(userId);
        if (user == null || !passwordEncoder.matches(oldPassword, user.getPassword())) {
            return false;
        }
        
        user.setPassword(passwordEncoder.encode(newPassword));
        baseMapper.insert(user);

        // 强制用户重新登录
        String userTokenKey = JwtConstant.USER_TOKEN_PREFIX + userId;
        redisUtils.delete(userTokenKey);
        
        return true;
    }
    
    private void recordLoginLog(String username, HttpServletRequest request, Integer status, String message) {
        LoginLog loginLog = new LoginLog();
        loginLog.setUsername(username);
        loginLog.setIp(request.getRemoteAddr());
        loginLog.setUserAgent(request.getHeader("User-Agent"));
        loginLog.setLoginTime(new Date());
        loginLog.setStatus(status);
        loginLog.setMessage(message);
        
        // 如果登录成功，设置userId
        if (status == 1) {
            SysUser user = baseMapper.findByUsername(username);
            if (user != null) {
                loginLog.setUserId(user.getId());
            }
        }
        
        loginLogMapper.insert(loginLog);
    }
}