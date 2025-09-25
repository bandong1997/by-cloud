package com.by.gateway.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.by.common.result.Result;
import com.by.gateway.entity.SysMenu;

/**
 * <p>
 * 菜单表 服务类
 * </p>
 *
 * @author bdd
 * @since 2025-08-24
 */
public interface SysMenuService extends IService<SysMenu> {

    Result findMenuTree();
}
