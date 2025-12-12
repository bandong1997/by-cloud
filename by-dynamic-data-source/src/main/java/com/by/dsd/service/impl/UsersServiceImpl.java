package com.by.dsd.service.impl;

import com.alibaba.fastjson2.JSON;
import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.dynamic.datasource.toolkit.DynamicDataSourceContextHolder;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.by.dsd.entity.UserOperationLogs;
import com.by.dsd.entity.Users;
import com.by.dsd.mapper.UserOperationLogsMapper;
import com.by.dsd.mapper.UsersMapper;
import com.by.dsd.result.Result;
import com.by.dsd.result.ResultCode;
import com.by.dsd.service.UsersService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fasterxml.jackson.databind.util.JSONPObject;
import netscape.javascript.JSObject;
import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.net.InetAddress;

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

    @Autowired
    private UserOperationLogsMapper userOperationLogsMapper;

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

    /**
     * 新增用户到master数据源，操作记录添加到 db2数据源
     * 动态切换数据源（编程式）
     */
    @Override
    public Result saveUser(Users users) {
        try {
            // 添加数据到master数据源
            // 1. 切换到 master 数据源
            DynamicDataSourceContextHolder.push("master");
            baseMapper.insert(users);
            Long userId = users.getId();

            // 2. 切换到 db2 数据源
            DynamicDataSourceContextHolder.push("db2");
            UserOperationLogs logs = new UserOperationLogs();
            logs.setUserId(userId);
            logs.setOperationType("INSERT");
            logs.setOperationContent(JSON.toJSONString(users));
            logs.setRequestMethod("POST");
            logs.setRequestUrl("/users/saveUser");
            logs.setRequestParams(JSON.toJSONString(users));
            InetAddress localHost = InetAddress.getLocalHost();
            logs.setIpAddress(localHost.getHostName());
            logs.setUserAgent(localHost.getHostAddress());
            userOperationLogsMapper.insert(logs);

            // 3.清除数据源上下文
            DynamicDataSourceContextHolder.clear();
            return Result.success(ResultCode.SUCCESS);
        } catch (Exception e) {
            // 确保清理上下文
            DynamicDataSourceContextHolder.clear();
            return Result.fail(e.getMessage());
        }

    }

    /**
     * 根据租户动态选择数据源
     */
    @Override
    public Result userSelectDataSource(String dsKey) {
        // 动态切换到对应租户的数据源
        DynamicDataSourceContextHolder.push(dsKey);
        try {
            // 执行租户特定操作
            return Result.success(baseMapper.selectList(new QueryWrapper<>()));
        } catch (Exception e) {
            DynamicDataSourceContextHolder.clear();
            return Result.fail(e.getMessage());
        } finally {
            DynamicDataSourceContextHolder.clear();
        }
    }

}
