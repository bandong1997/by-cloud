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
 * 角色和权限关联关系表
 * </p>
 *
 * @author bdd
 * @since 2026-01-29
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("by_role_permission")
public class ByRolePermission implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 关联ID，UUID去掉横杠的32位字符串
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 角色ID，关联by_role表
     */
    @TableField("role_id")
    private String roleId;

    /**
     * 权限ID，关联by_permission表
     */
    @TableField("permission_id")
    private String permissionId;

    /**
     * 关联创建时间
     */
    @TableField("create_time")
    private Date createTime;


}
