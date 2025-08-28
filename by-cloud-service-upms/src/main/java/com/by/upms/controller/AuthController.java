package com.by.upms.controller;

import com.by.common.constant.JwtConstant;
import com.by.common.dto.LoginDTO;
import com.by.common.dto.LoginResultDTO;
import com.by.common.result.Result;
import com.by.upms.entity.SysUser;
import com.by.upms.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/api/auth")
@Tag(name = "登录认证", description = "登录认证")
public class AuthController {
    
    @Autowired
    private UserService userService;

    @Operation(summary = "登录", description = "登录")
    @PostMapping("/login")
    public Result<LoginResultDTO> login(@Validated @RequestBody LoginDTO loginDTO, HttpServletRequest request) {
        LoginResultDTO loginResult = userService.login(loginDTO, request);
        return Result.success(loginResult);
    }

    @Operation(summary = "退出", description = "退出")
    @PostMapping("/logout")
    public Result<Void> logout(@RequestHeader(value = JwtConstant.HEADER_AUTHORIZATION, required = false) String token) {
        if (token != null && token.startsWith(JwtConstant.TOKEN_PREFIX)) {
            token = token.substring(JwtConstant.TOKEN_PREFIX.length());
            userService.logout(token);
        }
        return Result.success();
    }


    @Operation(summary = "info", description = "info")
    @GetMapping("/info")
    public Result<Object> getUserInfo(@RequestAttribute("userId") Long userId) {
        return Result.success(userService.getUserInfo(userId));
    }

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