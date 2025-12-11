package com.by.dsd.controller;


import com.by.dsd.entity.ModDocumentField;
import com.by.dsd.result.Result;
import com.by.dsd.service.ModDocumentFieldService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 公文字段	 前端控制器
 * </p>
 *
 * @author bdd
 * @since 2025-12-11
 */
@RestController
@RequestMapping("/modDocumentField")
@Tag(name = "公文字段", description = "公文字段")
public class ModDocumentFieldController {

    @Autowired
    private ModDocumentFieldService modDocumentFieldService;


    @GetMapping(value = "/getDocumentFieldInfo")
    @Operation(summary = "主从分离的业务, 读操作使用 db2（从库）", description = "getDocumentFieldInfo")
    public Result getDocumentFieldInfo(String id){
        return modDocumentFieldService.getDocumentFieldInfo(id);
    }


    @PostMapping(value = "/createDocumentField")
    @Operation(summary = "主从分离的业务, 写操作使用 master（主库）", description = "createDocumentField")
    public Result createDocumentField(@RequestBody ModDocumentField modDocumentField){
        return modDocumentFieldService.createDocumentField(modDocumentField);
    }

    @GetMapping(value = "/complexBusiness")
    @Operation(summary = "主从分离的业务, 复杂业务：需要操作多个数据源", description = "complexBusiness")
    public Result complexBusiness(String id){
        return modDocumentFieldService.modDocumentFieldService(id);
    }

}
