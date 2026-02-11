package com.by.lesson02.service;

import com.by.lesson02.dto.PurchaseDto;
import com.by.lesson02.entity.ByPurchaseList;
import com.baomidou.mybatisplus.extension.service.IService;
import com.by.lesson02.listener.ByPurchaseListExcelListener;
import com.by.lesson02.result.Result;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * <p>
 * 部门采购清单表 服务类
 * </p>
 *
 * @author bdd
 * @since 2026-02-06
 */
public interface ByPurchaseListService extends IService<ByPurchaseList> {

    void exportExcel(HttpServletResponse response, PurchaseDto purchaseDto) throws IOException;

    Result importExcel(InputStream inputStream);

    void downloadTemplate(HttpServletResponse response) throws IOException;

    Result importExcelBatch(InputStream inputStream);

    Result findPagePurchaseList(PurchaseDto purchaseDto);
}
