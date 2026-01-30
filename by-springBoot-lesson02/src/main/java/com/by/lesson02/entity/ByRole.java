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
 * 系统角色信息表
 * </p>
 *
 * @author bdd
 * @since 2026-01-29
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("by_role")
public class ByRole implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 角色ID，UUID去掉横杠的32位字符串
     */
    @TableId(value = "role_id", type = IdType.ASSIGN_ID)
    private String roleId;

    /**
     * 角色编码，唯一标识，用于权限控制
     */
    @TableField("role_code")
    private String roleCode;

    /**
     * 角色名称，显示用
     */
    @TableField("role_name")
    private String roleName;

    /**
     * 角色描述，详细说明角色权限范围
     */
    @TableField("role_desc")
    private String roleDesc;

    /**
     * 父角色ID，用于构建角色树，0表示根角色
     */
    @TableField("parent_id")
    private String parentId;

    /**
     * 角色层级，根角色为1，每增加一层加1
     */
    @TableField("role_level")
    private Integer roleLevel;

    /**
     * 是否继承父角色权限：1-继承，0-不继承
     */
    @TableField("is_inherit")
    private Integer isInherit;

    /**
     * 排序号，数字越小越靠前
     */
    @TableField("sort")
    private Integer sort;

    /**
     * 逻辑删除字段
     * 角色状态：1-启用，0-禁用
     */
    @TableLogic(value = "1", delval = "0")
    @TableField("status")
    private Integer status;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @TableField("create_time")
    private Date createTime;

    /**
     * 最后更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @TableField("update_time")
    private Date updateTime;

    /**
     * 临时字段 - 数据库中没有
     * 用户角色列表树图
     */
    @TableField(exist = false)
    private List<ByRole> children;


}
