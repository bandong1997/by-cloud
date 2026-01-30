package com.by.lesson02.controller.users;


import com.by.lesson02.dto.RoleDto;
import com.by.lesson02.dto.UserPageDto;
import com.by.lesson02.entity.ByRole;
import com.by.lesson02.result.Result;
import com.by.lesson02.service.ByRoleService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 系统角色信息表 前端控制器
 * </p>
 *
 * @author bdd
 * @since 2026-01-29
 */
@RestController
@RequestMapping("/byRole")
@Tag(name = "系统角色基本信息表", description = "系统角色基本信息表")
public class ByRoleController {

    @Autowired
    private ByRoleService byRoleService;

    @Operation(summary = "角色树图", description = "finRoleTree")
    @PostMapping(value = "/finRoleTree")
    public Result finRoleTree(@RequestBody RoleDto dto) {
        return byRoleService.finRoleTree(dto);
    }

    @Operation(summary = "新增修改角色", description = "insertOrUpdateRole")
    @PostMapping(value = "/insertOrUpdateRole")
    public Result insertOrUpdateRole(@RequestBody ByRole role) {
        return byRoleService.insertOrUpdateRole(role);
    }

    @Operation(summary = "删除角色", description = "deletRoleByRoleId")
    @PostMapping(value = "/deletRoleByRoleId/{roleId}")
    public Result deletRoleByRoleId(@PathVariable("roleId") String roleId) {
        return byRoleService.deletRoleByRoleId(roleId);
    }

}
