package com.by.upms.controller;


import com.by.common.exception.BusinessException;
import com.by.common.result.Result;
import com.by.common.result.ResultCode;
import com.by.upms.dto.UserPageDto;
import com.by.upms.entity.SysUser;
import com.by.upms.service.SysUserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author bdd
 * @since 2025-08-24
 */
@RestController
@RequestMapping("/sysUser")
@Tag(name = "用户管理", description = "用户相关的CRUD操作")
public class SysUserController {

    @Autowired
    private SysUserService sysUserService;

    @PostMapping("/listPage")
    @Operation(summary = "分页查询", description = "分页查询")
    public Result listPage(@RequestBody UserPageDto userPageDto) {
        return sysUserService.listPage(userPageDto);
    }

    @GetMapping("/list")
    @Operation(summary = "获取所有用户", description = "查询系统中的所有用户信息")
    public Result list() {
        List<SysUser> list = sysUserService.list();
        if (list.isEmpty()) {
            throw new BusinessException(ResultCode.NOT_FOUND.getCode(), "用户不存在");
        }
        return Result.success(sysUserService.list());
    }

    @GetMapping("/{id}")
    @Operation(summary = "根据ID获取用户", description = "根据ID获取用户")
    public Result getById(@PathVariable Long id) {
        return Result.success(sysUserService.getById(id));
    }

    @PostMapping
    @Operation(summary = "添加用户", description = "添加用户")
    public Result save(@RequestBody SysUser user) {
        return sysUserService.saveUser(user);
    }

    @PutMapping
    @Operation(summary = "修改用户", description = "修改用户")
    public Result update(@RequestBody SysUser user) {
        return Result.success(sysUserService.updateById(user));
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "删除用户", description = "删除用户")
    public Result delete(@PathVariable Long id) {
        return Result.success(sysUserService.removeById(id));
    }

}
