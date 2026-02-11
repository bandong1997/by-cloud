package com.by.lesson02.vo;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.format.DateTimeFormat;
import com.alibaba.excel.annotation.write.style.*;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 部门采购清单表
 * </p>
 *
 * @author bdd
 * @since 2026-02-06
 */
@Data
@HeadRowHeight(20)
@HeadFontStyle(fontName = "宋体", fontHeightInPoints = 12)  // 表头样式
@ContentRowHeight(18)
@ContentFontStyle(fontName = "宋体", fontHeightInPoints = 11)  // 内容样式
public class ByPurchaseListVo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ExcelProperty(value = "部门ID", index = 0)
    @ColumnWidth(15)
    private String departmentId;

    @ExcelProperty(value = "部门名称", index = 1)
    @ColumnWidth(20)
    private String departmentName;

    @ExcelProperty(value = "物品名称", index = 2)
    @ColumnWidth(20)
    private String itemName;

    @ExcelProperty(value = "物品分类", index = 3)
    @ColumnWidth(20)
    private String itemCategory;

    @ExcelProperty(value = "规格型号", index = 4)
    @ColumnWidth(20)
    private String specification;

    @ExcelProperty(value = "单位", index = 5)
    @ColumnWidth(20)
    private String unit;

    @ExcelProperty(value = "采购数量", index = 6)
    @ColumnWidth(20)
    private BigDecimal quantity;

    @ExcelProperty(value = "预估单价", index = 7)
    @ColumnWidth(20)
    private BigDecimal estimatedPrice;

    @ExcelProperty(value = "预估总价", index = 8)
    @ColumnWidth(20)
    private BigDecimal estimatedTotal;

    @ExcelProperty(value = "用途说明", index = 9)
    @ColumnWidth(20)
    private String purpose;

    @ExcelProperty(value = "紧急程度", index = 10)
    @ColumnWidth(20)
    private Integer urgencyLevel;

    @DateTimeFormat("yyyy-MM-dd")
    @ExcelProperty(value = "需求日期", index = 11)
    @ColumnWidth(20)
    private Date requiredDate;

    @ExcelProperty(value = "状态", index = 12)
    @ColumnWidth(10)
    private Integer status;

    @ExcelProperty(value = "申请人ID", index = 13)
    @ColumnWidth(20)
    private String applicantId;

    @ExcelProperty(value = "申请人姓名", index = 14)
    @ColumnWidth(20)
    private String applicantName;


}
