package com.by.upms.controller;

import com.by.common.result.Result;
import com.by.upms.entity.SysUser;
import com.by.upms.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/user")
@Tag(name = "用户注册", description = "用户注册")
public class UserController {
    
    @Autowired
    private UserService userService;

    @Operation(summary = "注册", description = "注册")
    @PostMapping("/register")
    public Result<Boolean> register(@RequestBody SysUser user) {
        boolean success = userService.register(user);
        if (success) {
            return Result.success(true);
        } else {
            return Result.fail("用户名已存在");
        }
    }

    @Operation(summary = "修改密码", description = "修改密码")
    @PutMapping("/password")
    public Result<Boolean> updatePassword(@RequestAttribute("userId") Long userId, 
                                         @RequestParam String oldPassword, 
                                         @RequestParam String newPassword) {
        boolean success = userService.updatePassword(userId, oldPassword, newPassword);
        if (success) {
            return Result.success(true);
        } else {
            return Result.fail("原密码错误");
        }
    }
}