package com.by.lesson02.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 系统权限点信息表
 * </p>
 *
 * @author bdd
 * @since 2026-01-29
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("by_permission")
public class ByPermission implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 权限ID，UUID去掉横杠的32位字符串
     */
    @TableId(value = "permission_id", type = IdType.ASSIGN_ID)
    private String permissionId;

    /**
     * 权限编码，唯一标识，用于权限控制
     */
    @TableField("permission_code")
    private String permissionCode;

    /**
     * 权限名称，显示用
     */
    @TableField("permission_name")
    private String permissionName;

    /**
     * 权限类型：1-菜单权限，2-按钮权限，3-API接口权限
     */
    @TableField("permission_type")
    private Integer permissionType;

    /**
     * 父权限ID，用于构建权限树，0表示根节点
     */
    @TableField("parent_id")
    private String parentId;

    /**
     * 权限对应的URL地址或API路径
     */
    @TableField("url")
    private String url;

    /**
     * 权限图标，用于前端展示
     */
    @TableField("icon")
    private String icon;

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
     * 临时字段 - 数据库中没有
     * 用户权限列表树图
     */
    @TableField(exist = false)
    private List<ByPermission> children;


}
