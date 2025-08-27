package com.by.upms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 角色实体类
 * 定义系统中的角色信息
 */
@Data
@TableName("sys_role")
public class Role implements Serializable {
    private static final long serialVersionUID = 1L;
    
    /**
     * 主键ID
     */
    private Long id;
    
    /**
     * 角色名称
     */
    private String name;
    
    /**
     * 角色编码
     * 唯一标识角色的编码
     */
    private String code;
    
    /**
     * 状态
     * 0:禁用 1:启用
     */
    private Integer status;
    
    /**
     * 创建时间
     */
    private Date createTime;
    
    /**
     * 更新时间
     */
    private Date updateTime;
    
    /**
     * 角色权限列表
     * 关联角色拥有的权限信息
     */
    private List<Permission> permissions;
}