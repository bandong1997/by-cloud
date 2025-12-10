package com.by.dsd.controller;


import com.by.dsd.result.Result;
import com.by.dsd.service.MctContractTlpService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 合同模板表 前端控制器
 * </p>
 *
 * @author bdd
 * @since 2025-12-10
 */
@RestController
@RequestMapping("/mctContractTlp")
@Tag(name = "模板管理", description = "模板管理")
public class MctContractTlpController {

    @Autowired
    private MctContractTlpService mctContractTlpService;

    @Operation(summary = "整个Mapper都使用,某个方法使用不同数据源，使用@DS可以覆盖", description = "selectFromMaster")
    @GetMapping(value = "/selectFromMaster")
    public Result selectFromMaster(String id){
        return mctContractTlpService.selectFromMaster(id);
    }

    @Operation(summary = "整个Mapper都使用,这个方法使用类级别的 db2 数据源", description = "selectByAll")
    @GetMapping(value = "/selectByAll")
    public Result selectByAll(){
        return mctContractTlpService.selectByAll();
    }

}
