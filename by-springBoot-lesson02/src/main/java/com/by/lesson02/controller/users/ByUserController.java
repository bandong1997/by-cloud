package com.by.lesson02.controller.users;


import com.by.lesson02.dto.UserPageDto;
import com.by.lesson02.entity.ByUser;
import com.by.lesson02.result.Result;
import com.by.lesson02.result.ResultCode;
import com.by.lesson02.service.ByRoleService;
import com.by.lesson02.service.ByUserService;
import com.by.lesson02.service.TokenService;
import com.by.lesson02.utils.Constants;
import com.by.lesson02.utils.UserContextHolder;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 系统用户基本信息表 前端控制器
 * </p>
 *
 * @author bdd
 * @since 2026-01-29
 */
@RestController
@RequestMapping("/byUser")
@Tag(name = "系统用户基本信息表", description = "系统用户基本信息表")
public class ByUserController {

    @Autowired
    private ByUserService byUserService;
    @Autowired
    private ByRoleService byRoleService;
    @Autowired
    private TokenService tokenService;
    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    private static final String CAPTCHA_REDIS_PREFIX = "captcha:";

    @Operation(summary = "分页查询用户", description = "findPageUser")
    @PostMapping(value = "/findPageUser")
    public Result findPageUser(@RequestBody UserPageDto dto) {
        return byUserService.findPageUser(dto);
    }

    @Operation(summary = "新增or修改", description = "findPageUser")
    @PostMapping(value = "/insertOrUpdateUser")
    public Result insertOrUpdateUser(@RequestBody ByUser user) {
        return byUserService.insertOrUpdateUser(user);
    }

    @Operation(summary = "删除", description = "deleteByUserId")
    @PostMapping(value = "/deleteByUserId/{userId}")
    public Result deleteByUserId(@PathVariable("userId") String userId) {
        return byUserService.deleteByUserId(userId);
    }

    @Operation(summary = "获取用户关联的角色信息", description = "findRoleByUserId")
    @PostMapping(value = "/findRoleByUserId/{userId}")
    public Result findRoleByUserId(@PathVariable("userId") String userId) {
        return byRoleService.findRoleByUserId(userId);
    }

    /**
     * 用户登录
     * 用户登录（需先通过 /captcha/image 获取验证码，登录时携带 captchaKey、captchaCode）
     * 账号：admin
     * 密码：123456
     */
    @Operation(summary = "用户登录", description = "login")
    @PostMapping("/login")
    public Result login(@RequestParam String username,
                        @RequestParam String password,
                        @RequestParam String captchaKey,
                        @RequestParam String captchaCode){

        // 为null表示验证通过，非null则存在错误细心
        Result captchaResult = verifyCaptcha(captchaKey, captchaCode);
        if (captchaResult != null) {
            return captchaResult;
        }

        ByUser byUser = byUserService.login(username, password);
        if (byUser == null) {
            return Result.fail(ResultCode.PASSWORD_ERROR.getCode(), "用户名或密码错误");
        }
        TokenService.TokenPair tokenPair = tokenService.createToken(byUser);
        Map<String, Object> data = new HashMap<>();
//        data.put("accessToken", Constants.BEARER + tokenPair.accessToken());
        data.put("accessToken", tokenPair.accessToken());
        data.put("refreshToken", tokenPair.refreshToken());
        data.put("accessExpire", tokenPair.accessExpireSeconds());
        data.put("refreshExpire", tokenPair.refreshExpireSeconds());
        byUser.setPassword(null);
        data.put("user", byUser);
        return Result.success(data);
    }

    /**
     * 校验登录验证码（从 Redis 读取，忽略大小写，通过后删除一次性使用）。
     *
     * @return 校验失败时返回对应 Result，通过时返回 null
     */
    private Result verifyCaptcha(String captchaKey, String captchaCode) {
        if (!StringUtils.hasText(captchaKey) || !StringUtils.hasText(captchaCode)) {
            return Result.fail(ResultCode.CAPTCHA_ERROR.getCode(), "验证码不能为空");
        }
        String stored = (String) redisTemplate.opsForValue().get(CAPTCHA_REDIS_PREFIX + captchaKey);
        if (stored == null) {
            return Result.fail(ResultCode.CAPTCHA_EXPIRED.getCode(), ResultCode.CAPTCHA_EXPIRED.getMessage());
        }
        if (!stored.equalsIgnoreCase(captchaCode.trim())) {
            return Result.fail(ResultCode.CAPTCHA_ERROR.getCode(), ResultCode.CAPTCHA_ERROR.getMessage());
        }
        redisTemplate.delete(CAPTCHA_REDIS_PREFIX + captchaKey);
        return null;
    }

    /**
     * 获取当前登录用户信息（需携带 Token）
     */
    @Operation(summary = "获取当前用户", description = "getCurrentUser")
    @GetMapping("/currentUser")
    public Result getCurrentUser() {
        ByUser user = UserContextHolder.getUser();
        if (user == null) {
            return Result.fail(ResultCode.UNAUTHORIZED.getCode(), ResultCode.UNAUTHORIZED.getMessage());
        }
        return Result.success(user);
    }

    /**
     * 用户退出登录
     */
    @Operation(summary = "用户退出", description = "logout")
    @PostMapping("/logout")
    public Result logout(@RequestHeader(value = "Authorization", required = false) String authorization) {
        String token = parseBearerToken(authorization);
        if (token != null) {
            tokenService.invalidate(token);
        }
        return Result.success();
    }

    /**
     * 刷新 Token
     */
    @Operation(summary = "刷新Token", description = "refreshToken")
    @PostMapping("/refreshToken")
    public Result refreshToken(@RequestParam String refreshToken) {
        TokenService.TokenPair tokenPair = tokenService.refreshToken(refreshToken);
        if (tokenPair == null) {
            return Result.fail(ResultCode.TOKEN_INVALID.getCode(), ResultCode.TOKEN_INVALID.getMessage());
        }
        Map<String, Object> data = new HashMap<>();
//        data.put("accessToken", Constants.BEARER + tokenPair.accessToken());
        data.put("accessToken", tokenPair.accessToken());
        data.put("refreshToken", tokenPair.refreshToken());
        data.put("accessExpire", tokenPair.accessExpireSeconds());
        data.put("refreshExpire", tokenPair.refreshExpireSeconds());
        return Result.success(data);
    }

    /**
     * 从 Authorization 请求头中解析出 Bearer Token。
     * <p>
     * 约定格式：Authorization: Bearer &lt;token&gt;
     *
     * @param authorization 完整的 Authorization 头内容
     * @return 成功解析出的 token，格式不正确或为空时返回 null
     */
    private String parseBearerToken(String authorization) {
        if (authorization == null || !authorization.startsWith(Constants.BEARER)) {
            return null;
        }
        return authorization.substring(7).trim();
    }



}
