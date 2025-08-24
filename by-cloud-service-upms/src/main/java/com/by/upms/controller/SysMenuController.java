package com.by.upms.controller;


import com.by.common.result.Result;
import com.by.upms.service.SysMenuService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 菜单表 前端控制器
 * </p>
 *
 * @author bdd
 * @since 2025-08-24
 */
@RestController
@RequestMapping("/sysMenu")
@Tag(name = "菜单管理", description = "菜单相关的CRUD操作")
public class SysMenuController {

    @Autowired
    private SysMenuService sysMenuService;

    @GetMapping(value = "/findMenuTree")
    @Operation(summary = "获取菜单树", description = "获取菜单树")
    public Result findMenuTree() {
        return sysMenuService.findMenuTree();
    }

}
