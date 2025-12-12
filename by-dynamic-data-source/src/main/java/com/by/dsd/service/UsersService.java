package com.by.dsd.service;

import com.by.dsd.entity.Users;
import com.baomidou.mybatisplus.extension.service.IService;
import com.by.dsd.result.Result;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author bdd
 * @since 2025-12-12
 */
public interface UsersService extends IService<Users> {

    /**
     * 不指定 @DS，默认使用 primary 数据源（master）
     */
    Result findUserAllByDefault();

    /**
     * 显式指定使用 master 数据源
     */
    Result findUserAllByMaster();

    /**
     * 使用 db2 数据源
     */
    Result findUserAllByDb2();

}
