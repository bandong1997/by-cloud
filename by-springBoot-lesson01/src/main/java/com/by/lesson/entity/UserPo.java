package com.by.lesson.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 用户表
 * </p>
 *
 * @author bdd
 * @since 2025-12-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("users")
public class UserPo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 用户名
     */
    @TableField("username")
    private String username;

    /**
     * 邮箱
     */
    @TableField("email")
    private String email;

    /**
     * 手机号
     */
    @TableField("phone")
    private String phone;

    /**
     * 密码哈希
     */
    @TableField("password_hash")
    private String passwordHash;

    /**
     * 密码盐值
     */
    @TableField("password_salt")
    private String passwordSalt;

    /**
     * 真实姓名
     */
    @TableField("real_name")
    private String realName;

    /**
     * 昵称
     */
    @TableField("nickname")
    private String nickname;

    /**
     * 头像URL
     */
    @TableField("avatar_url")
    private String avatarUrl;

    /**
     * 性别: 0-未知, 1-男, 2-女
     */
    @TableField("gender")
    private Integer gender;

    /**
     * 出生日期
     */
    @TableField("birth_date")
    private Date birthDate;

    /**
     * 状态: 0-禁用, 1-正常, 2-锁定, 3-注销
     */
    @TableField("status")
    private Integer status;

    /**
     * 注册来源: 1-网站, 2-APP, 3-微信, 4-QQ
     */
    @TableField("source_type")
    private Integer sourceType;

    /**
     * 最后登录时间
     */
    @TableField("last_login_time")
    private Date lastLoginTime;

    /**
     * 最后登录IP
     */
    @TableField("last_login_ip")
    private String lastLoginIp;

    /**
     * 登录次数
     */
    @TableField("login_count")
    private Integer loginCount;

    /**
     * 邮箱是否验证
     */
    @TableField("email_verified")
    private Boolean emailVerified;

    /**
     * 手机是否验证
     */
    @TableField("phone_verified")
    private Boolean phoneVerified;

    /**
     * 是否管理员
     */
    @TableField("is_admin")
    private Boolean isAdmin;

    /**
     * 创建时间
     */
    @TableField("created_at")
    private Date createdAt;

    /**
     * 更新时间
     */
    @TableField("updated_at")
    private Date updatedAt;

    /**
     * 版本号（用于乐观锁）
     */
    @TableField("version")
    private Integer version;

    /**
     * 是否删除
     */
    @TableField("deleted")
    private Boolean deleted;


}
