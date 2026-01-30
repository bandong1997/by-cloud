package com.by.lesson02.service;

import com.by.lesson02.dto.RoleDto;
import com.by.lesson02.entity.ByRole;
import com.baomidou.mybatisplus.extension.service.IService;
import com.by.lesson02.result.Result;

/**
 * <p>
 * 系统角色信息表 服务类
 * </p>
 *
 * @author bdd
 * @since 2026-01-29
 */
public interface ByRoleService extends IService<ByRole> {

    Result finRoleTree(RoleDto dto);

    Result insertOrUpdateRole(ByRole role);

    Result deletRoleByRoleId(String roleId);
}
