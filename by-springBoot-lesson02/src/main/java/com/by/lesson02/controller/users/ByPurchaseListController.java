package com.by.lesson02.controller.users;


import com.by.lesson02.dto.PurchaseDto;
import com.by.lesson02.result.Result;
import com.by.lesson02.service.ByPurchaseListService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;


/**
 * <p>
 * 部门采购清单表 前端控制器
 * </p>
 *
 * @author bdd
 * @since 2026-02-06
 */
@RestController
@RequestMapping("/byPurchaseList")
@Tag(name = "部门采购清单信息表", description = "部门采购清单信息表")
public class ByPurchaseListController {

    @Autowired
    private ByPurchaseListService byPurchaseListService;

    /**
     * 导出采购清单数据到Excel文件
     * @param response HTTP响应对象，用于输出Excel文件
     * @throws IOException 导出过程中可能发生的IO异常
     */
    @Operation(summary = "导出", description = "export")
    @PostMapping("/export")
    public void exportExcel(HttpServletResponse response, @RequestBody PurchaseDto purchaseDto) throws IOException {
        byPurchaseListService.exportExcel(response, purchaseDto);
    }

    /**
     * 导入Excel文件中的采购清单数据
     * @param file 上传的Excel文件
     * @return 包含导入结果的Map对象，包含success、message、data、count等字段
     */
    @Operation(summary = "导入", description = "import")
    @PostMapping("/import")
    public Result importExcel(@RequestParam("file") MultipartFile file) throws IOException {
        return byPurchaseListService.importExcel(file.getInputStream());
    }

    /**
     * 批量导入Excel文件中的采购清单数据（大数据量场景）
     * @param file 上传的Excel文件
     * @return 包含导入结果的Map对象，包含success、message、data、count等字段
     */
    @Operation(summary = "批量导入", description = "import")
    @PostMapping("/import/batch")
    public Result importExcelBatch(@RequestParam("file") MultipartFile file) throws IOException {
        return  byPurchaseListService.importExcelBatch(file.getInputStream());
    }

    /**
     * 下载采购清单Excel模板文件
     * @param response HTTP响应对象，用于输出模板文件
     * @throws IOException 下载过程中可能发生的IO异常
     */
    @Operation(summary = "下载采模板文件", description = "template")
    @GetMapping("/template")
    public void downloadTemplate(HttpServletResponse response) throws IOException {
        byPurchaseListService.downloadTemplate(response);
    }

    @Operation(summary = "分页查询", description = "findPagePurchaseList")
    @PostMapping("/findPagePurchaseList")
    public Result findPagePurchaseList(@RequestBody PurchaseDto purchaseDto) {
        byPurchaseListService.findPagePurchaseList(purchaseDto);
    }

}
