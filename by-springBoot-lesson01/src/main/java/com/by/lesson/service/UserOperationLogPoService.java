package com.by.lesson.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.by.lesson.entity.UserOperationLogPo;

/**
 * <p>
 * 用户操作日志表 服务类
 * </p>
 *
 * @author bdd
 * @since 2025-12-22
 */
public interface UserOperationLogPoService extends IService<UserOperationLogPo> {

    void saveOperationLogAsync(String type);
}
