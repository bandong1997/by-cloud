package com.by.lesson02.controller.users;


import com.by.lesson02.dto.RoleDto;
import com.by.lesson02.result.Result;
import com.by.lesson02.service.ByPermissionService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 系统权限点信息表 前端控制器
 * </p>
 *
 * @author bdd
 * @since 2026-01-29
 */
@RestController
@RequestMapping("/byPermission")
@Tag(name = "系统菜单基本信息表", description = "系统菜单基本信息表")
public class ByPermissionController {

    @Autowired
    private ByPermissionService byPermissionService;

    @Operation(summary = "菜单树图", description = "finPermissionTree")
    @GetMapping(value = "/finPermissionTree")
    public Result finPermissionTree() {
        return byPermissionService.finPermissionTree();
    }

}
