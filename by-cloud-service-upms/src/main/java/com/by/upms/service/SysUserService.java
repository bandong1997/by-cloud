package com.by.upms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.by.common.result.Result;
import com.by.upms.dto.UserPageDto;
import com.by.upms.entity.SysUser;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author bdd
 * @since 2025-08-24
 */
public interface SysUserService extends IService<SysUser> {

    Result listPage(UserPageDto userPageDto);

    Result saveUser(SysUser user);
}
