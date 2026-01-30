package com.by.lesson02.service;

import com.by.lesson02.entity.ByPermission;
import com.baomidou.mybatisplus.extension.service.IService;
import com.by.lesson02.result.Result;

/**
 * <p>
 * 系统权限点信息表 服务类
 * </p>
 *
 * @author bdd
 * @since 2026-01-29
 */
public interface ByPermissionService extends IService<ByPermission> {

    Result finPermissionTree();
}
