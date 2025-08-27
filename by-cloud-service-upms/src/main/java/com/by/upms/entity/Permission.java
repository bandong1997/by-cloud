package com.by.upms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.io.Serializable;
import java.util.Date;

/**
 * 权限实体类
 * 用于描述系统中的权限资源，包括菜单、按钮、API接口等
 */
@Data
@TableName("sys_permission")
public class Permission implements Serializable {
    private static final long serialVersionUID = 1L;
    
    /**
     * 主键ID
     */
    private Long id;
    
    /**
     * 权限名称
     * 如：用户管理、角色管理等
     */
    private String name;
    
    /**
     * 权限编码
     * 唯一标识权限的编码，如：user:view、user:create等
     */
    private String code;
    
    /**
     * 权限类型
     * 如：menu(菜单)、button(按钮)、api(接口)
     */
    private String type;
    
    /**
     * 访问路径
     * 菜单或接口的URL路径
     */
    private String path;
    
    /**
     * 父权限ID
     * 用于构建权限的层级关系
     */
    private Long parentId;
    
    /**
     * 排序字段
     * 用于权限的显示顺序
     */
    private Integer sort;
    
    /**
     * 创建时间
     */
    private Date createTime;
    
    /**
     * 更新时间
     */
    private Date updateTime;
}