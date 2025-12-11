package com.by.dsd.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 公文字段	
 * </p>
 *
 * @author bdd
 * @since 2025-12-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("mod_document_field")
public class ModDocumentField implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 字段分组id
     */
    @TableField("field_group_id")
    private String fieldGroupId;

    /**
     * 字段名称
     */
    @TableField("name")
    private String name;

    /**
     * 字段别名
     */
    @TableField("alias")
    private String alias;

    /**
     * 字段对应的值
     */
    @TableField("value")
    private String value;

    /**
     * 类型（varchar，number）
     */
    @TableField("type")
    private String type;

    /**
     * 是否有效（0：无效1：有效）
     */
    @TableField("effective_status")
    private BigDecimal effectiveStatus;

    /**
     * 创建人
     */
    @TableField("create_user")
    private String createUser;

    /**
     * 创建时间
     */
    @TableField("create_time")
    private String createTime;

    /**
     * 修改人
     */
    @TableField("modify_user")
    private String modifyUser;

    /**
     * 修改时间
     */
    @TableField("modify_time")
    private String modifyTime;

    /**
     * 删除状态
     */
    @TableField("del_status")
    private BigDecimal delStatus;

    /**
     * 删除人
     */
    @TableField("del_user")
    private String delUser;

    /**
     * 删除时间
     */
    @TableField("del_time")
    private String delTime;

    /**
     * 约束条件（多个用逗号隔开）
     */
    @TableField("constraint_condition")
    private String constraintCondition;

    /**
     * 字段长度
     */
    @TableField("field_length")
    private BigDecimal fieldLength;

    /**
     * 审核状态(-1:拒绝0：未审核1：同意)
     */
    @TableField("audit_status")
    private BigDecimal auditStatus;

    /**
     * 审核时间
     */
    @TableField("audit_time")
    private String auditTime;

    /**
     * 审核人
     */
    @TableField("audit_user")
    private String auditUser;

    /**
     * 备注
     */
    @TableField("remark")
    private String remark;

    /**
     * 正则校验
     */
    @TableField("regular")
    private String regular;


}
