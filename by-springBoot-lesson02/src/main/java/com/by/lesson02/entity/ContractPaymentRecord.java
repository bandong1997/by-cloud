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
 * 合同付款记录表
 * </p>
 *
 * @author bdd
 * @since 2026-01-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("contract_payment_record")
public class ContractPaymentRecord implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 付款记录唯一标识
     */
    @TableField("payment_uid")
    private String paymentUid;

    /**
     * 合同唯一标识
     */
    @TableField("contract_uid")
    private String contractUid;

    /**
     * 合同编号
     */
    @TableField("contract_no")
    private String contractNo;

    /**
     * 合同名称
     */
    @TableField("contract_name")
    private String contractName;

    /**
     * 付款单号
     */
    @TableField("payment_no")
    private String paymentNo;

    /**
     * 付款类型
     */
    @TableField("payment_type")
    private String paymentType;

    /**
     * 付款金额
     */
    @TableField("payment_amount")
    private BigDecimal paymentAmount;

    /**
     * 已付金额
     */
    @TableField("paid_amount")
    private BigDecimal paidAmount;

    /**
     * 币种
     */
    @TableField("currency")
    private String currency;

    /**
     * 付款方ID
     */
    @TableField("payer_id")
    private String payerId;

    /**
     * 付款方名称
     */
    @TableField("payer_name")
    private String payerName;

    /**
     * 收款方ID
     */
    @TableField("payee_id")
    private String payeeId;

    /**
     * 收款方名称
     */
    @TableField("payee_name")
    private String payeeName;

    /**
     * 计划付款日期
     */
    @TableField("plan_pay_date")
    private Date planPayDate;

    /**
     * 实际付款日期
     */
    @TableField("actual_pay_date")
    private Date actualPayDate;

    /**
     * 到期日
     */
    @TableField("due_date")
    private Date dueDate;

    /**
     * 付款状态
     */
    @TableField("payment_status")
    private String paymentStatus;

    /**
     * 发票状态
     */
    @TableField("invoice_status")
    private String invoiceStatus;

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
     * 备注
     */
    @TableField("remark")
    private String remark;

    /**
     * 附件ID列表
     */
    @TableField("attachment_ids")
    private String attachmentIds;

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
