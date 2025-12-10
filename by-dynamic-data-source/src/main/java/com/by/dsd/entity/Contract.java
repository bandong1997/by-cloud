package com.by.dsd.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * <p>
 * 合同信息表
 * </p>
 *
 * @author bdd
 * @since 2025-08-26
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("contract")
public class Contract implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 合同ID
     */
    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    private String id;

    /**
     * 合同名称
     */
    @TableField("contract_name")
    private String contractName;

    /**
     * 合同编号
     */
    @TableField("contract_code")
    private String contractCode;

    /**
     * 合同类型
     */
    @TableField("contract_type")
    private String contractType;

    /**
     * 甲方名称
     */
    @TableField("party_a_name")
    private String partyAName;

    /**
     * 甲方联系人
     */
    @TableField("party_a_contact")
    private String partyAContact;

    /**
     * 甲方联系电话
     */
    @TableField("party_a_phone")
    private String partyAPhone;

    /**
     * 甲方地址
     */
    @TableField("party_a_address")
    private String partyAAddress;

    /**
     * 乙方名称
     */
    @TableField("party_b_name")
    private String partyBName;

    /**
     * 乙方联系人
     */
    @TableField("party_b_contact")
    private String partyBContact;

    /**
     * 乙方联系电话
     */
    @TableField("party_b_phone")
    private String partyBPhone;

    /**
     * 乙方地址
     */
    @TableField("party_b_address")
    private String partyBAddress;

    /**
     * 合同总金额
     */
    @TableField("contract_amount")
    private BigDecimal contractAmount;

    /**
     * 货币类型
     */
    @TableField("currency")
    private String currency;

    /**
     * 付款条款
     */
    @TableField("payment_terms")
    private String paymentTerms;

    /**
     * 签订日期
     */
    @TableField("signed_date")
    private Date signedDate;

    /**
     * 生效日期
     */
    @TableField("effective_date")
    private Date effectiveDate;

    /**
     * 到期日期
     */
    @TableField("expiration_date")
    private Date expirationDate;

    /**
     * 合同状态：DRAFT(草稿), PENDING(待审核), APPROVED(已审核), EXECUTING(执行中), COMPLETED(已完成), TERMINATED(已终止), CANCELLED(已取消)
     */
    @TableField("contract_status")
    private String contractStatus;

    /**
     * 合同主要内容
     */
    @TableField("contract_content")
    private String contractContent;

    /**
     * 合同附件URL
     */
    @TableField("attachment_url")
    private String attachmentUrl;

    /**
     * 创建人
     */
    @TableField("created_by")
    private String createdBy;

    /**
     * 更新人
     */
    @TableField("updated_by")
    private String updatedBy;

    /**
     * 备注
     */
    @TableField("remark")
    private String remark;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updatedAt;

    /**
     * 是否删除(0:未删除,1:已删除)
     */
    @TableField("is_deleted")
    @TableLogic
    private Integer isDeleted;

    @TableField("aes_key")
    private String aesKey;


}
