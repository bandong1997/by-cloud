package com.by.devtool.controller;

import com.by.devtool.result.Result;
import com.by.devtool.result.ResultCode;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author bandd
 * @date2025年09月29日16:43
 */
@RestController
@RequestMapping("/test")
@Tag(name = "测试模块", description = "测试模块")
public class TestController {

    @GetMapping("/")
    public Result home() {
        return Result.success(ResultCode.SUCCESS);
    }

}
