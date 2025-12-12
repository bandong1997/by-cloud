package com.by.dsd.controller;


import com.by.dsd.entity.UserAddresses;
import com.by.dsd.result.Result;
import com.by.dsd.service.UserAddressesService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 用户地址表 前端控制器
 * </p>
 *
 * @author bdd
 * @since 2025-12-12
 */
@RestController
@RequestMapping("/userAddresses")
@Tag(name = "用户地址", description = "用户地址")
public class UserAddressesController {

    @Autowired
    private UserAddressesService userAddressesService;


    @GetMapping(value = "/getUserAddressesById")
    @Operation(summary = "主从分离的业务, 读操作使用 db2（从库）", description = "getUserAddressesById")
    public Result getUserAddressesById(Integer id){
        return userAddressesService.getUserAddressesById(id);
    }


    @PostMapping(value = "/createUserAddresses")
    @Operation(summary = "主从分离的业务, 写操作使用 master（主库）", description = "createUserAddresses")
    public Result createUserAddresses(@RequestBody UserAddresses userAddresses){
        return userAddressesService.createUserAddresses(userAddresses);
    }

    @GetMapping(value = "/complexBusiness")
    @Operation(summary = "主从分离的业务, 复杂业务：需要操作多个数据源", description = "complexBusiness")
    public Result complexBusiness(Integer id){
        return userAddressesService.userAddressesService(id);
    }

}
