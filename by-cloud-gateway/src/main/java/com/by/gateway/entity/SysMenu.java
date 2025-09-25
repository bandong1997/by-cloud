package com.by.gateway.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 菜单表
 * </p>
 *
 * @author bdd
 * @since 2025-08-24
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_menu")
public class SysMenu implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 所属上级
     */
    @TableField("parent_id")
    private Long parentId;

    /**
     * 菜单标题
     */
    @TableField("title")
    private String title;

    /**
     * 组件名称
     */
    @TableField("component")
    private String component;

    /**
     * 排序
     */
    @TableField("sort_value")
    private Integer sortValue;

    /**
     * 状态(0:禁止,1:正常)
     */
    @TableField("status")
    private Integer status;

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
     * 删除标记（0:可用 1:不可用）
     */
    @TableField("is_deleted")
    private Integer isDeleted;

    @TableField(exist = false)  // 关键注解，表示该字段不存在于数据库中
    private List<SysMenu> children;


}
