package com.by.lesson02.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 业务树形字典表
 * </p>
 *
 * @author bdd
 * @since 2026-02-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("by_tree_dict")
public class ByTreeDict implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * UUID主键（32位，无横线）
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 父级ID，0表示顶级
     */
    @TableField("parent_id")
    private String parentId;

    /**
     * 字典名称
     */
    @TableField("dict_name")
    private String dictName;

    /**
     * 字典编码
     */
    @TableField("dict_code")
    private String dictCode;

    /**
     * 字典值
     */
    @TableField("dict_value")
    private String dictValue;

    /**
     * 字典类型
     */
    @TableField("dict_type")
    private String dictType;

    /**
     * 类型名称
     */
    @TableField("type_name")
    private String typeName;

    /**
     * 层级路径
     */
    @TableField("level_path")
    private String levelPath;

    /**
     * 层级
     */
    @TableField("tree_level")
    private Integer treeLevel;

    /**
     * 排序
     */
    @TableField("sort_order")
    private Integer sortOrder;

    /**
     * 是否有子节点
     */
    @TableField("has_children")
    private String hasChildren;

    /**
     * 图标
     */
    @TableField("icon")
    private String icon;

    /**
     * 颜色标识
     */
    @TableField("color")
    private String color;

    /**
     * 状态(0禁用 1启用)
     */
    @TableField("status")
    private String status;

    /**
     * 是否默认
     */
    @TableField("is_default")
    private String isDefault;

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
     * 备注
     */
    @TableField("remark")
    private String remark;

    /**
     * 临时字段 - 数据库中没有
     * 封装树图
     */
    @TableField(exist = false)
    private List<ByTreeDict> children;



}
