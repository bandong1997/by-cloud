package com.by.lesson02.entity;

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
     * 角色状态：1-启用，0-禁用
     */
    @TableField("status")
    private Integer status;

    /**
     * 创建时间
     */
    @TableField("create_time")
    private Date createTime;


}
