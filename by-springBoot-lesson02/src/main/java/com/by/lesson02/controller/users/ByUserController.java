package com.by.lesson02.controller.users;


import com.by.lesson02.dto.UserPageDto;
import com.by.lesson02.entity.ByUser;
import com.by.lesson02.result.Result;
import com.by.lesson02.service.ByUserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 系统用户基本信息表 前端控制器
 * </p>
 *
 * @author bdd
 * @since 2026-01-29
 */
@RestController
@RequestMapping("/byUser")
@Tag(name = "系统用户基本信息表", description = "系统用户基本信息表")
public class ByUserController {

    @Autowired
    ByUserService byUserService;

    @Operation(summary = "分页查询用户", description = "findPageUser")
    @PostMapping(value = "/findPageUser")
    public Result findPageUser(@RequestBody UserPageDto dto) {
        return byUserService.findPageUser(dto);
    }

    @Operation(summary = "新增or修改", description = "findPageUser")
    @PostMapping(value = "/insertOrUpdateUser")
    public Result insertOrUpdateUser(@RequestBody ByUser user) {
        return byUserService.insertOrUpdateUser(user);
    }

    @Operation(summary = "删除", description = "deleteByUserId")
    @PostMapping(value = "/deleteByUserId/{userId}")
    public Result deleteByUserId(@PathVariable("userId") String userId) {
        return byUserService.deleteByUserId(userId);
    }

}
