package com.by.lesson02.controller.users;


import com.by.lesson02.mapper.ByPermissionMapper;
import com.by.lesson02.result.Result;
import com.by.lesson02.service.ByDepartmentService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 部门信息表 前端控制器
 * </p>
 *
 * @author bdd
 * @since 2026-01-30
 */
@RestController
@RequestMapping("/byDepartment")
@Tag(name = "系统部门基本信息表", description = "系统部门基本信息表")
public class ByDepartmentController {

    @Autowired
    private ByDepartmentService byDepartmentService;

    @Operation(summary = "部门树图", description = "finDepartmentTree")
    @GetMapping(value = "/finDepartmentTree")
    public Result finDepartmentTree() {
        return byDepartmentService.finDepartmentTree();
    }

}
