package com.by.dsd.service.impl;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.dynamic.datasource.toolkit.DynamicDataSourceContextHolder;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.by.dsd.entity.UserAddresses;
import com.by.dsd.mapper.UserAddressesMapper;
import com.by.dsd.result.Result;
import com.by.dsd.service.UserAddressesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * <p>
 * 用户地址表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2025-12-12
 */
@Service
public class UserAddressesServiceImpl extends ServiceImpl<UserAddressesMapper, UserAddresses> implements UserAddressesService {


    // 读操作使用 db2（从库）
    @DS("db2")
    @Override
    public Result getUserAddressesById(Integer id) {
        LambdaQueryWrapper<UserAddresses> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(UserAddresses::getId, id);
        return Result.success(baseMapper.selectOne(wrapper));
    }

    // 写操作使用 master（主库）
    @DS("master")
    @Override
    public Result createUserAddresses(UserAddresses userAddresses) {
        userAddresses.setCreatedAt(new Date());
        userAddresses.setConsignee("admin");
        return Result.success(baseMapper.insert(userAddresses));
    }

    @Override
    public Result userAddressesService(Integer id) {

        try {
            // 1. 从 db2 查询
            // 手动切换数据源到db2
            DynamicDataSourceContextHolder.push("db2");
            LambdaQueryWrapper<UserAddresses> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(UserAddresses::getId, id);
            UserAddresses po = baseMapper.selectOne(wrapper);
            // // 2. 向 master 写入
            // 手动切换数据源到master
            DynamicDataSourceContextHolder.push("master");
            po.setCreatedAt(new Date());
            po.setConsignee("by");
            // 3. 清理数据源上下文
            DynamicDataSourceContextHolder.clear();
            return Result.success(baseMapper.insert(po));
        } catch (Exception e) {
            DynamicDataSourceContextHolder.clear();
            return Result.fail(e.getMessage());
        }
    }
}
