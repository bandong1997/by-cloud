package com.by.lesson02.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 变更记录表
 * </p>
 *
 * @author bdd
 * @since 2026-01-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("contract_change_record")
public class ContractChangeRecord implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 变更记录唯一标识
     */
    @TableField("change_uid")
    private String changeUid;

    /**
     * 业务类型: CONTRACT/CLAUSE/PARTY/AMOUNT
     */
    @TableField("business_type")
    private String businessType;

    /**
     * 目标类型
     */
    @TableField("target_type")
    private String targetType;

    /**
     * 目标ID
     */
    @TableField("target_id")
    private String targetId;

    /**
     * 目标名称
     */
    @TableField("target_name")
    private String targetName;

    /**
     * 变更类型: FIELD_UPDATE/STATUS_CHANGE/AMOUNT_ADJUST
     */
    @TableField("change_type")
    private String changeType;

    /**
     * 变更版本
     */
    @TableField("change_version")
    private Integer changeVersion;

    /**
     * 变更标题
     */
    @TableField("change_title")
    private String changeTitle;

    /**
     * 变更原因
     */
    @TableField("change_reason")
    private String changeReason;

    /**
     * 变更内容
     */
    @TableField("change_content")
    private String changeContent;

    /**
     * 变更详情
     */
    @TableField("change_detail")
    private String changeDetail;

    /**
     * 影响字段
     */
    @TableField("affect_field")
    private String affectField;

    /**
     * 影响金额
     */
    @TableField("affect_amount")
    private BigDecimal affectAmount;

    /**
     * 审批状态
     */
    @TableField("approval_status")
    private String approvalStatus;

    /**
     * 审批流ID
     */
    @TableField("approval_flow_id")
    private String approvalFlowId;

    /**
     * 审批备注
     */
    @TableField("approval_remark")
    private String approvalRemark;

    /**
     * 申请人ID
     */
    @TableField("applicant_id")
    private Long applicantId;

    /**
     * 申请人姓名
     */
    @TableField("applicant_name")
    private String applicantName;

    /**
     * 审批人ID
     */
    @TableField("approver_id")
    private Long approverId;

    /**
     * 审批人姓名
     */
    @TableField("approver_name")
    private String approverName;

    /**
     * 审核人ID
     */
    @TableField("auditor_id")
    private Long auditorId;

    /**
     * 审核人姓名
     */
    @TableField("auditor_name")
    private String auditorName;

    /**
     * 申请时间
     */
    @TableField("apply_time")
    private Date applyTime;

    /**
     * 审批时间
     */
    @TableField("approval_time")
    private Date approvalTime;

    /**
     * 生效时间
     */
    @TableField("effective_time")
    private Date effectiveTime;

    /**
     * 创建人
     */
    @TableField("created_by")
    private Long createdBy;

    /**
     * 创建时间
     */
    @TableField("created_time")
    private Date createdTime;

    /**
     * 更新时间
     */
    @TableField("updated_time")
    private Date updatedTime;

    /**
     * 删除标志
     */
    @TableField("is_deleted")
    private Integer isDeleted;


}
