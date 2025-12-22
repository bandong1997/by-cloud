package com.by.devtool.controller;


import com.by.devtool.result.Result;
import com.by.devtool.result.ResultCode;
import com.by.devtool.service.UserPoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author bandd
 * @since 2025-10-11
 */
@RestController
@RequestMapping("/sysUser")
@Tag(name = "用户管理", description = "用户相关的CRUD操作")
public class UserController {

    @Autowired
    private UserPoService userPoService;

    @GetMapping("/list")
    @Operation(summary = "获取所有用户", description = "findAllUser")
    public Result findAllUser(){
        return Result.success(userPoService.list());
    }


    @GetMapping("/findUserById")
    @Operation(summary = "根据id获取用户", description = "findUserById")
    public Result findUserById(Long id){
        return Result.success(userPoService.getById(id));
    }

}
