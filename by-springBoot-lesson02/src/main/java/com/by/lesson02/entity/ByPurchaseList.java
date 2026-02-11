package com.by.lesson02.entity;

import java.math.BigDecimal;

import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 部门采购清单表
 * </p>
 *
 * @author bdd
 * @since 2026-02-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("by_purchase_list")
public class ByPurchaseList implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    private String id;

    @ExcelProperty(value = "部门ID", index = 0)
    @TableField("department_id")
    private String departmentId;

    @ExcelProperty(value = "部门名称", index = 1)
    @NotBlank(message = "部门名称不能为空")
    @Size(max = 20, message = "部门名称长度不能超过20")
    @TableField("department_name")
    private String departmentName;

    @ExcelProperty(value = "物品名称", index = 2)
    @TableField("item_name")
    private String itemName;

    @ExcelProperty(value = "物品分类", index = 3)
    @TableField("item_category")
    private String itemCategory;

    @ExcelProperty(value = "规格型号", index = 4)
    @TableField("specification")
    private String specification;

    @ExcelProperty(value = "单位", index = 5)
    @TableField("unit")
    private String unit;

    @ExcelProperty(value = "采购数量", index = 6)
    @TableField("quantity")
    private BigDecimal quantity;

    @ExcelProperty(value = "预估单价", index = 7)
    @TableField("estimated_price")
    private BigDecimal estimatedPrice;

    @ExcelProperty(value = "预估总价", index = 8)
    @TableField("estimated_total")
    private BigDecimal estimatedTotal;

    @ExcelProperty(value = "用途说明", index = 9)
    @TableField("purpose")
    private String purpose;

    @ExcelProperty(value = "紧急程度", index = 10)
    @TableField("urgency_level")
    private Integer urgencyLevel;

    @ExcelProperty(value = "需求日期", index = 11)
    @TableField("required_date")
    private Date requiredDate;

    /**
     * 状态（1：待审批，2：已批准，3：已驳回，4：已采购，5：已完成）
     */
    @ExcelProperty(value = "状态", index = 12)
    @TableField("status")
    private Integer status;

    @ExcelProperty(value = "申请人ID", index = 13)
    @TableField("applicant_id")
    private String applicantId;

    /**
     * 申请人姓名
     */
    @ExcelProperty(value = "申请人姓名", index = 14)
    @TableField("applicant_name")
    private String applicantName;

    @TableField("approver_id")
    private String approverId;

    @TableField("approver_name")
    private String approverName;

    @TableField("approval_time")
    private Date approvalTime;

    @TableField("approval_remark")
    private String approvalRemark;

    @TableField("actual_price")
    private BigDecimal actualPrice;

    @TableField("actual_total")
    private BigDecimal actualTotal;

    @TableField("supplier")
    private String supplier;

    @TableField("purchase_time")
    private Date purchaseTime;

    @TableField("receipt_time")
    private Date receiptTime;

    @TableField("storage_location")
    private String storageLocation;

    @TableField("remark")
    private String remark;

    /**
     * 创建时间
     */
    @TableField("create_time")
    private Date createTime;

    /**
     * 更新时间
     */
    @TableField("update_time")
    private Date updateTime;

    /**
     * 删除标记（0：正常，1：删除）
     */
    @TableField("is_deleted")
    private Integer isDeleted;


}
