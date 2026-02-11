package com.by.lesson02.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.by.lesson02.entity.ByPurchaseList;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 部门采购清单表 Mapper 接口
 * </p>
 *
 * @author bdd
 * @since 2026-02-06
 */
public interface ByPurchaseListMapper extends BaseMapper<ByPurchaseList> {

    @Insert("<script>" +
            "INSERT INTO by_purchase_list (" +
            "department_id, department_name, item_name, item_category, specification, unit, quantity, " +
            "estimated_price, estimated_total, purpose, urgency_level, required_date, status, " +
            "applicant_id, applicant_name, approver_id, approver_name, approval_time, approval_remark, " +
            "actual_price, actual_total, supplier, purchase_time, receipt_time, storage_location, remark, is_deleted" +
            ") VALUES " +
            "<foreach collection='list' item='item' separator=','>" +
            "(#{item.departmentId}, #{item.departmentName}, #{item.itemName}, #{item.itemCategory}, " +
            "#{item.specification}, #{item.unit}, #{item.quantity}, #{item.estimatedPrice}, #{item.estimatedTotal}, " +
            "#{item.purpose}, #{item.urgencyLevel}, #{item.requiredDate}, #{item.status}, " +
            "#{item.applicantId}, #{item.applicantName}, #{item.approverId}, #{item.approverName}, " +
            "#{item.approvalTime}, #{item.approvalRemark}, #{item.actualPrice}, #{item.actualTotal}, " +
            "#{item.supplier}, #{item.purchaseTime}, #{item.receiptTime}, #{item.storageLocation}, " +
            "#{item.remark}, #{item.isDeleted})" +
            "</foreach>" +
            "</script>")
    void batchInsert(@Param("list") List<ByPurchaseList> list);

}
