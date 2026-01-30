package com.by.lesson02.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;
import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 部门信息表
 * </p>
 *
 * @author bdd
 * @since 2026-01-30
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("by_department")
public class ByDepartment implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 部门ID（UUID去掉短横线）
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 部门编码
     */
    @TableField("department_code")
    private String departmentCode;

    /**
     * 部门名称
     */
    @TableField("department_name")
    private String departmentName;

    /**
     * 部门描述
     */
    @TableField("description")
    private String description;

    /**
     * 父部门ID
     */
    @TableField("parent_id")
    private String parentId;

    /**
     * 部门层级（从1开始）
     */
    @TableField("level")
    private Integer level;

    /**
     * 部门路径（ID路径，用/分隔）
     */
    @TableField("path")
    private String path;

    /**
     * 排序号
     */
    @TableField("sort_order")
    private Integer sortOrder;

    /**
     * 逻辑删除字段
     * 角色状态：1-启用，0-禁用
     */
    @TableLogic(value = "1", delval = "0")
    @TableField("status")
    private Integer status;

    /**
     * 负责人ID
     */
    @TableField("manager_id")
    private String managerId;

    /**
     * 负责人姓名
     */
    @TableField("manager_name")
    private String managerName;

    /**
     * 创建人
     */
    @TableField("created_by")
    private String createdBy;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @TableField("created_at")
    private Date createdAt;

    /**
     * 更新人
     */
    @TableField("updated_by")
    private String updatedBy;

    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @TableField("updated_at")
    private Date updatedAt;

    /**
     * 临时字段 - 数据库中没有
     * 用户部门列表树图
     */
    @TableField(exist = false)
    private List<ByDepartment> children;


}
