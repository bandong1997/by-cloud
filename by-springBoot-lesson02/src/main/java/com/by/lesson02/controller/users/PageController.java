package com.by.lesson02.controller.users;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author bandd
 * @date2026年02月28日14:30
 */
@Controller
@Tag(name = "页面", description = "测试用页面")
public class PageController {

    @Operation(summary = "登录页")
    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @Operation(summary = "当前用户页（需已登录）")
    @GetMapping("/user")
    public String userPage() {
        return "user";
    }
}