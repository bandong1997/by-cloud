package com.by.contract.controller;


import com.by.common.result.Result;
import com.by.contract.dto.ContractDto;
import com.by.contract.dto.ContractPageDto;
import com.by.contract.service.ContractService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 合同信息表 前端控制器
 * </p>
 *
 * @author bdd
 * @since 2025-08-26
 */
@RestController
@RequestMapping("/contract")
@Tag(name = "合同管理", description = "合同相关的CRUD操作")
public class ContractController {

    @Autowired
    private ContractService contractService;

    @PostMapping("/saveContract")
    @Operation(summary = "保存合同", description = "保存合同")
    public Result saveContract(@RequestBody ContractDto contractDto) {
        return contractService.saveContract(contractDto);
    }

    @PostMapping("/contractPage")
    @Operation(summary = "合同分页查询", description = "合同分页查询")
    public Result contractPage(@RequestBody ContractPageDto contractPageDto) {
        return contractService.contractPage(contractPageDto);
    }


}
