package com.by.dsd.entity;

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
 * 邮件验证表
 * </p>
 *
 * @author bdd
 * @since 2025-12-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("email_verifications")
public class EmailVerifications implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 邮箱
     */
    @TableField("email")
    private String email;

    /**
     * 验证令牌
     */
    @TableField("token")
    private String token;

    /**
     * 业务类型: register, reset_password, change_email
     */
    @TableField("biz_type")
    private String bizType;

    /**
     * 状态: 0-未验证, 1-已验证, 2-已失效
     */
    @TableField("status")
    private Integer status;

    /**
     * 用户ID
     */
    @TableField("user_id")
    private Long userId;

    /**
     * 发送时间
     */
    @TableField("send_time")
    private Date sendTime;

    /**
     * 过期时间
     */
    @TableField("expire_time")
    private Date expireTime;

    /**
     * 验证时间
     */
    @TableField("verify_time")
    private Date verifyTime;


}
