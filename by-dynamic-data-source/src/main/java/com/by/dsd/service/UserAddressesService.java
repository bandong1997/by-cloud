package com.by.dsd.service;

import com.by.dsd.entity.UserAddresses;
import com.baomidou.mybatisplus.extension.service.IService;
import com.by.dsd.result.Result;

/**
 * <p>
 * 用户地址表 服务类
 * </p>
 *
 * @author bdd
 * @since 2025-12-12
 */
public interface UserAddressesService extends IService<UserAddresses> {

    Result getUserAddressesById(Integer id);

    Result createUserAddresses(UserAddresses userAddresses);

    Result userAddressesService(Integer id);

}
