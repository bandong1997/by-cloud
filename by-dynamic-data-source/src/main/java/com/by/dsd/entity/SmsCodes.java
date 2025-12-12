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
 * 短信验证码表
 * </p>
 *
 * @author bdd
 * @since 2025-12-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sms_codes")
public class SmsCodes implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 手机号
     */
    @TableField("phone")
    private String phone;

    /**
     * 验证码
     */
    @TableField("code")
    private String code;

    /**
     * 业务类型: register, login, reset_password
     */
    @TableField("biz_type")
    private String bizType;

    /**
     * 状态: 0-未使用, 1-已使用, 2-已失效
     */
    @TableField("status")
    private Integer status;

    /**
     * 请求IP
     */
    @TableField("ip_address")
    private String ipAddress;

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
     * 使用时间
     */
    @TableField("used_time")
    private Date usedTime;


}
