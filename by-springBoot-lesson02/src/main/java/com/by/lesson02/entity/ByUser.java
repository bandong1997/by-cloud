package com.by.lesson02.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 系统用户基本信息表
 * </p>
 *
 * @author bdd
 * @since 2026-01-29
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("by_user")
public class ByUser implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户ID，UUID去掉横杠的32位字符串
     */
    @TableId(value = "user_id", type = IdType.ASSIGN_ID)
    private String userId;

    /**
     * 用户名，唯一标识，用于登录
     */
    @TableField("username")
    private String username;

    /**
     * 用户密码，MD5加密存储
     */
    @TableField("password")
    private String password;

    /**
     * 真实姓名
     */
    @TableField("real_name")
    private String realName;

    /**
     * 电子邮箱
     */
    @TableField("email")
    private String email;

    /**
     * 手机号码
     */
    @TableField("phone")
    private String phone;

    /**
     * 逻辑删除字段
     * 1-正常（未删除）
     * 0-已删除
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


}
