package com.by.lesson02.controller.contract;


import com.by.lesson02.dto.ContractPageDto;
import com.by.lesson02.entity.Contract;
import com.by.lesson02.result.Result;
import com.by.lesson02.service.ContractService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 合同主表 前端控制器
 * </p>
 *
 * @author bdd
 * @since 2026-01-05
 */
@RestController
@RequestMapping("/contract")
@Tag(name = "合同主表", description = "合同主表")
public class ContractController {

    @Autowired
    private ContractService contractService;

    @Operation(summary = "获取合同列表", description = "findContractList")
    @PostMapping(value = "/findContractList")
    public Result findContractList(@RequestBody ContractPageDto dto) {
        return contractService.findContractList(dto);
    }

    @Operation(summary = "编辑保存合同", description = "editContract")
    @PostMapping(value = "/editContract")
    public Result editContract(@RequestBody Contract contractPo) {
        return contractService.editContract(contractPo);
    }




}
