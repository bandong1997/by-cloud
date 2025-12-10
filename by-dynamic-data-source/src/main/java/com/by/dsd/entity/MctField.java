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
 * 模板对应灵活字段
 * </p>
 *
 * @author bdd
 * @since 2025-12-10
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("mct_field")
public class MctField implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 字段管理
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 版本
     */
    @TableField("version")
    private String version;

    /**
     * 来源（1公文2公示）
     */
    @TableField("source")
    private BigDecimal source;

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
     * 类型（varchar，number）
     */
    @TableField("type")
    private String type;

    /**
     * 长度
     */
    @TableField("length")
    private BigDecimal length;

    /**
     * 约束条件（多个用逗号隔开）
     */
    @TableField("constraint")
    private String constraint;

    /**
     * 所属分租
     */
    @TableField("group")
    private String group;

    /**
     * 是否必填(0不是2是)
     */
    @TableField("is_required")
    private BigDecimal isRequired;

    /**
     * 是否主键(0不是2是)
     */
    @TableField("is_primary_key")
    private BigDecimal isPrimaryKey;

    /**
     * 是否是基础信息（0不是1是）
     */
    @TableField("is_basic_info")
    private BigDecimal isBasicInfo;

    /**
     * 备注
     */
    @TableField("remark")
    private String remark;

    /**
     * 默认值
     */
    @TableField("value")
    private String value;

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
     * 使用频率
     */
    @TableField("frequency")
    private BigDecimal frequency;

    /**
     * 排序
     */
    @TableField("sort")
    private BigDecimal sort;

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
    @TableField("modify _user")
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


}
