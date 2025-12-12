package com.by.dsd.controller;


import com.by.dsd.result.Result;
import com.by.dsd.service.UsersService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author bdd
 * @since 2025-12-12
 */
@RestController
@RequestMapping("/users")
@Tag(name = "用户信息", description = "多数据源测试")
public class UsersController {

    @Autowired
    private UsersService usersService;

    @GetMapping(value = "/findUserAllByDefault")
    @Operation(summary = "获取所有用户,不指定 @DS，默认使用 primary 数据源（master）", description = "findUserAllByDefault")
    public Result findUserAllByDefault(){
        return usersService.findUserAllByDefault();
    }

    @GetMapping(value = "/findUserAllByMaster")
    @Operation(summary = "获取所有用户,显式指定使用 master 数据源", description = "findUserAllByMaster")
    public Result findUserAllByMaster(){
        return usersService.findUserAllByMaster();
    }

    @GetMapping(value = "/findUserAllByDb2")
    @Operation(summary = "获取所有用户,指定使用 db2 数据源", description = "findUserAllByDb2")
    public Result findUserAllByDb2(){
        return usersService.findUserAllByDb2();
    }

}
