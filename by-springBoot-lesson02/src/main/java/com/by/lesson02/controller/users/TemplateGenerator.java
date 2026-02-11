package com.by.lesson02.controller.users;


import com.alibaba.excel.EasyExcel;
import com.by.lesson02.entity.ByPurchaseList;

import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author bandd
 * @date2026年02月10日10:10
 * 模板生成
 */
public class TemplateGenerator {

    public static void main(String[] args) {
        String templatePath = "templates/采购清单模板.xlsx";
        File file = new File(templatePath);
        File parentDir = file.getParentFile();
        if (parentDir != null && !parentDir.exists()) {
            parentDir.mkdirs();
        }

        List<ByPurchaseList> templateData = createTemplateData();
        EasyExcel.write(templatePath, ByPurchaseList.class)
                .sheet("采购清单")
                .doWrite(templateData);

        System.out.println("模板文件生成成功: " + file.getAbsolutePath());
    }

    private static List<ByPurchaseList> createTemplateData() {
        List<ByPurchaseList> dataList = new ArrayList<>();

        ByPurchaseList example = new ByPurchaseList();
        example.setDepartmentId("DEPT001");
        example.setDepartmentName("技术部");
        example.setItemName("笔记本电脑");
        example.setItemCategory("电子设备");
        example.setSpecification("i7-12700H/16G/512G");
        example.setUnit("台");
        example.setQuantity(new BigDecimal("5"));
        example.setEstimatedPrice(new BigDecimal("6500.00"));
        example.setEstimatedTotal(new BigDecimal("32500.00"));
        example.setPurpose("开发人员办公使用");
        example.setUrgencyLevel(1);
        example.setRequiredDate(new Date(System.currentTimeMillis() + 7 * 86400000L));
        example.setStatus(1);
        example.setApplicantId("USER001");
        example.setApplicantName("张三");
        example.setApproverId("APPROVER001");
        example.setApproverName("李四");
        example.setApprovalTime(new Date());
        example.setActualPrice(new BigDecimal("6200.00"));
        example.setActualTotal(new BigDecimal("31000.00"));
        example.setSupplier("XX科技有限公司");
        example.setPurchaseTime(new Date());
        example.setReceiptTime(new Date());
        example.setStorageLocation("A区-01号货架");
        example.setRemark("请尽快采购");
        example.setIsDeleted(0);

        dataList.add(example);
        return dataList;
    }
}
