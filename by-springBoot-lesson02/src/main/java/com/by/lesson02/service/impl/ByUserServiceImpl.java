package com.by.lesson02.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.by.common.constant.CommonStatus;
import com.by.common.utils.IdUtil;
import com.by.common.utils.md5.MD5Util;
import com.by.lesson02.dto.UserPageDto;
import com.by.lesson02.entity.ByUser;
import com.by.lesson02.mapper.ByUserMapper;
import com.by.lesson02.result.Result;
import com.by.lesson02.result.ResultCode;
import com.by.lesson02.service.ByOperateLogService;
import com.by.lesson02.service.ByUserService;
import com.by.common.utils.HttpContextUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 系统用户基本信息表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2026-01-29
 */
@Service
public class ByUserServiceImpl extends ServiceImpl<ByUserMapper, ByUser> implements ByUserService {

    @Autowired
    private ByOperateLogService logService;

    @Override
    public Result findPageUser(UserPageDto dto) {
        logService.saveOperateLogAsync("系统用户基本信息表", "QUERY", "QUERY", "findPageUser", HttpContextUtils.getHttpServletRequest());
        LambdaQueryWrapper<ByUser> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(ByUser::getStatus, CommonStatus.ACTIVE);
        if (!StringUtils.isEmpty(dto.getUsername())) {
            wrapper.like(ByUser::getUsername, dto.getUsername());
        }
        if (!StringUtils.isEmpty(dto.getEmail())) {
            wrapper.like(ByUser::getEmail, dto.getEmail());
        }
        if (!StringUtils.isEmpty(dto.getPhone())) {
            wrapper.like(ByUser::getPhone, dto.getPhone());
        }

        // 分页
        Page<ByUser> userPage = new Page<>(dto.getPageNumber(), dto.getPageSize());
        Page<ByUser> pageList = baseMapper.selectPage(userPage, wrapper);
        List<ByUser> list = pageList.getRecords();

        // 封装数据
        Map<String, Object> map = new HashMap<>();
        map.put("records", list);
        map.put("total", pageList.getTotal());
        map.put("size", pageList.getSize());
        map.put("current", pageList.getCurrent());
        map.put("pages", pageList.getPages());

        return Result.success(map);
    }

    @Override
    public Result insertOrUpdateUser(ByUser user) {

        if (!StringUtils.isEmpty(user.getUserId())) {
            // userId非空修改
            LambdaQueryWrapper<ByUser> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(ByUser::getUsername, user.getUsername());
            ByUser byUser = baseMapper.selectById(user.getUserId());
            // 验证密码是否一致
            boolean verify = MD5Util.verify(user.getPassword(), byUser.getPassword());
            if (verify) {
                System.out.println("密码一致");
            } else {
                // 对密码进行加密
                String encrypt = MD5Util.encrypt(user.getPassword());
                user.setPassword(encrypt);
            }
            baseMapper.updateById(user);
        } else {

            LambdaQueryWrapper<ByUser> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(ByUser::getUsername, user.getUsername());
            List<ByUser> byUsers = baseMapper.selectList(wrapper);
            if (!byUsers.isEmpty()) {
                return Result.fail(ResultCode.USER_EXIST.getCode(), ResultCode.USER_EXIST.getMessage());
            }

            String uuid = IdUtil.getUuid();
            user.setUserId(uuid);
            // 对密码进行加密
            String encrypt = MD5Util.encrypt(user.getPassword());
            user.setPassword(encrypt);
            baseMapper.insert(user);
        }
        return Result.success();
    }

    @Override
    public Result deleteByUserId(String userId) {
        try {
            return Result.success(baseMapper.deleteById(userId));
        } catch (Exception e) {
            return Result.fail(ResultCode.DELETE_ERROR.getCode(), ResultCode.DELETE_ERROR.getMessage());
        }
    }
}
