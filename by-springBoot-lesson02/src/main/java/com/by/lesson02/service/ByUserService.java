package com.by.lesson02.service;

import com.by.lesson02.dto.UserPageDto;
import com.by.lesson02.entity.ByUser;
import com.baomidou.mybatisplus.extension.service.IService;
import com.by.lesson02.result.Result;

/**
 * <p>
 * 系统用户基本信息表 服务类
 * </p>
 *
 * @author bdd
 * @since 2026-01-29
 */
public interface ByUserService extends IService<ByUser> {

    Result findPageUser(UserPageDto dto);

    Result insertOrUpdateUser(ByUser user);

    Result deleteByUserId(String userId);
}
