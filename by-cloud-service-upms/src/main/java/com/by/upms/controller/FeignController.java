package com.by.upms.controller;


import com.by.common.result.Result;
import com.by.upms.feign.FileClent;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: 班东东
 * @Time: 2025/8/24 22:23
 * @description:
 */
@RestController
@RequestMapping("/feignTest")
@Tag(name = "远程调用", description = "远程调用")
public class FeignController {

    @Autowired
    private FileClent fileClent;

    @GetMapping(value = "/findFileBase64")
    @Operation(summary = "获取base64", description = "获取base64")
    public Result findFileBase64(String filePath) {
        return Result.success(fileClent.findFileBase64(filePath));
    }

    @GetMapping(value = "/testFeign")
    @Operation(summary = "测试feign", description = "测试feign")
    public Result testFeign() {
        return Result.success(fileClent.testFeign());
    }


}
