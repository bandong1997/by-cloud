package com.by.contract.controller;


import com.by.common.result.Result;
import com.by.contract.dto.ContractPageDto;
import com.by.contract.entity.MctContractPo;
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

    @PostMapping("/enidContract")
    @Operation(summary = "编辑合同，根据ID存在更新，不存在新增", description = "enidContract")
    public Result enidContract(@RequestBody MctContractPo contractPo) {
        return contractService.enidContract(contractPo);
    }

    @PostMapping("/contractPage")
    @Operation(summary = "合同分页查询", description = "合同分页查询")
    public Result contractPage(@RequestBody ContractPageDto contractPageDto) {
        return contractService.contractPage(contractPageDto);
    }


}
