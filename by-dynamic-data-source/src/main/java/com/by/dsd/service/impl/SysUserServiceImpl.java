package com.by.dsd.service.impl;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.by.dsd.entity.SysUser;
import com.by.dsd.mapper.SysUserMapper;
import com.by.dsd.result.Result;
import com.by.dsd.service.SysUserService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author bandd
 * @since 2025-10-11
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    /**
     * 不指定 @DS，默认使用 primary 数据源（master）
     */
    @Override
    public Result findUserAllByDefault() {
        return Result.success(baseMapper.selectList(new QueryWrapper<>()));
    }

    /**
     * 显式指定使用 master 数据源
     */
    @DS("master")
    @Override
    public Result findUserAllByMaster() {
        return Result.success(baseMapper.selectList(new QueryWrapper<>()));
    }

    /**
     * 使用 db2 数据源
     */
    @DS("db2")
    @Override
    public Result findUserAllByDb2() {
        return Result.success(baseMapper.selectList(new QueryWrapper<>()));
    }
}
