package com.by.dsd.contract;

import com.by.dsd.result.Result;
import com.by.dsd.service.SysUserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author bandd
 * @date2025年12月10日16:10
 */
@RestController
@RequestMapping("test")
@Tag(name = "多数据源", description = "多数据源测试")
public class TestContract {


    @Autowired
    private SysUserService sysUserService;

    @GetMapping(value = "/findUserAllByDefault")
    @Operation(summary = "获取所有用户,不指定 @DS，默认使用 primary 数据源（master）", description = "findUserAllByDefault")
    public Result findUserAllByDefault(){
        return sysUserService.findUserAllByDefault();
    }

    @GetMapping(value = "/findUserAllByMaster")
    @Operation(summary = "获取所有用户,显式指定使用 master 数据源", description = "findUserAllByMaster")
    public Result findUserAllByMaster(){
        return sysUserService.findUserAllByMaster();
    }

    @GetMapping(value = "/findUserAllByDb2")
    @Operation(summary = "获取所有用户,指定使用 db2 数据源", description = "findUserAllByDb2")
    public Result findUserAllByDb2(){
        return sysUserService.findUserAllByDb2();
    }

}
