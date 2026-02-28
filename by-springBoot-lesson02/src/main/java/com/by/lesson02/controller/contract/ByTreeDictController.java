package com.by.lesson02.controller.contract;


import com.by.lesson02.dto.ContractPageDto;
import com.by.lesson02.result.Result;
import com.by.lesson02.service.ByTreeDictService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 业务树形字典表 前端控制器
 * </p>
 *
 * @author bdd
 * @since 2026-02-28
 */
@RestController
@RequestMapping("/byTreeDict")
@Tag(name = "业务树形字典", description = "业务树形字典")
public class ByTreeDictController {

    @Autowired
    private ByTreeDictService byTreeDictService;

    @Operation(summary = "获取字典树状图", description = "findTreeDict")
    @GetMapping(value = "/findTreeDict")
    public Result findTreeDict() {
        return byTreeDictService.findTreeDict();
    }



}
