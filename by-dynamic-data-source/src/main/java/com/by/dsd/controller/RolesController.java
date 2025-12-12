package com.by.dsd.controller;


import com.by.dsd.result.Result;
import com.by.dsd.service.RolesService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 角色表 前端控制器
 * </p>
 *
 * @author bdd
 * @since 2025-12-12
 */
@RestController
@RequestMapping("/roles")
@Tag(name = "角色管理", description = "角色管理")
public class RolesController {

    @Autowired
    private RolesService rolesService;

    @Operation(summary = "整个Mapper都使用,某个方法使用不同数据源，使用@DS可以覆盖", description = "selectFromMaster")
    @GetMapping(value = "/selectFromMaster")
    public Result selectFromMaster(Integer id){
        return rolesService.selectFromMaster(id);
    }

    @Operation(summary = "整个Mapper都使用,这个方法使用类级别的 db2 数据源", description = "selectByAllDeputy")
    @GetMapping(value = "/selectByAllDeputy")
    public Result selectByAllDeputy(){
        return rolesService.selectByAllDeputy();
    }

}
