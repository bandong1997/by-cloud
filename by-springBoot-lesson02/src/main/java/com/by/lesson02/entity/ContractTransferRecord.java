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
 * 转让记录表
 * </p>
 *
 * @author bdd
 * @since 2026-01-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("contract_transfer_record")
public class ContractTransferRecord implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 转让记录唯一标识
     */
    @TableField("transfer_uid")
    private String transferUid;

    /**
     * 目标类型: CONTRACT/RIGHT/OBLIGATION
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
     * 转让类型: OWNER_CHANGE/RIGHT_TRANSFER
     */
    @TableField("transfer_type")
    private String transferType;

    /**
     * 转让原因
     */
    @TableField("transfer_reason")
    private String transferReason;

    /**
     * 转让内容
     */
    @TableField("transfer_content")
    private String transferContent;

    /**
     * 转让金额
     */
    @TableField("transfer_amount")
    private BigDecimal transferAmount;

    /**
     * 转出方类型: PERSON/DEPARTMENT/COMPANY
     */
    @TableField("from_party_type")
    private String fromPartyType;

    /**
     * 转出方ID
     */
    @TableField("from_party_id")
    private String fromPartyId;

    /**
     * 转出方名称
     */
    @TableField("from_party_name")
    private String fromPartyName;

    /**
     * 转出用户ID
     */
    @TableField("from_user_id")
    private Long fromUserId;

    /**
     * 转出用户姓名
     */
    @TableField("from_user_name")
    private String fromUserName;

    /**
     * 转入方类型
     */
    @TableField("to_party_type")
    private String toPartyType;

    /**
     * 转入方ID
     */
    @TableField("to_party_id")
    private String toPartyId;

    /**
     * 转入方名称
     */
    @TableField("to_party_name")
    private String toPartyName;

    /**
     * 转入用户ID
     */
    @TableField("to_user_id")
    private Long toUserId;

    /**
     * 转入用户姓名
     */
    @TableField("to_user_name")
    private String toUserName;

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
     * 转让时间
     */
    @TableField("transfer_time")
    private Date transferTime;

    /**
     * 生效时间
     */
    @TableField("effective_time")
    private Date effectiveTime;

    /**
     * 完成时间
     */
    @TableField("complete_time")
    private Date completeTime;

    /**
     * 附件ID列表
     */
    @TableField("attachment_ids")
    private String attachmentIds;

    /**
     * 转让协议附件
     */
    @TableField("contract_attachment")
    private String contractAttachment;

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
