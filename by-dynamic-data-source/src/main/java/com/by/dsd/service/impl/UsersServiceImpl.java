package com.by.dsd.service.impl;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.by.dsd.entity.Users;
import com.by.dsd.mapper.UsersMapper;
import com.by.dsd.result.Result;
import com.by.dsd.service.UsersService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2025-12-12
 */
@Service
public class UsersServiceImpl extends ServiceImpl<UsersMapper, Users> implements UsersService {


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
