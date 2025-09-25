package com.by.gateway.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.by.common.result.Result;
import com.by.common.result.ResultCode;
import com.by.gateway.dto.UserPageDto;
import com.by.gateway.entity.SysUser;
import com.by.gateway.mapper.SysUserMapper;
import com.by.gateway.service.SysUserService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2025-08-24
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    @Override
    public Result listPage(UserPageDto userPageDto) {

        LambdaQueryWrapper<SysUser> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SysUser::getDeleted, 0);

        Page<SysUser> page = new Page<>(userPageDto.getPage(), userPageDto.getNumber());

        Page<SysUser> pageList = baseMapper.selectPage(page, wrapper);

        return Result.success(pageList);
    }

    @Override
    public Result saveUser(SysUser user) {

        LambdaQueryWrapper<SysUser> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SysUser::getDeleted, 0);
        wrapper.eq(SysUser::getUsername, user.getUsername());
        List<SysUser> sysUsers = baseMapper.selectList(wrapper);
        if (!sysUsers.isEmpty()) {
            return Result.fail(ResultCode.USER_EXIST.getCode(), ResultCode.USER_EXIST.getMessage());
        }
        int insert = baseMapper.insert(user);
        if (insert > 0) {
            return Result.success(ResultCode.SUCCESS);
        }
        return Result.fail(ResultCode.FAIL.getCode(), ResultCode.FAIL.getMessage());
    }
}
