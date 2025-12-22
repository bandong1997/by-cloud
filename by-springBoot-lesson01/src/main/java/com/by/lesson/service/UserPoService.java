package com.by.lesson.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.by.lesson.entity.UserPo;
import com.by.lesson.result.Result;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author bdd
 * @since 2025-12-12
 */
public interface UserPoService extends IService<UserPo> {

    Result findAll();
}
