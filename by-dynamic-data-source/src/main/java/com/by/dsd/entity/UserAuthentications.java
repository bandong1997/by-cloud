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
 * 用户第三方认证表
 * </p>
 *
 * @author bdd
 * @since 2025-12-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("user_authentications")
public class UserAuthentications implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 用户ID
     */
    @TableField("user_id")
    private Long userId;

    /**
     * 认证类型: wechat, qq, github, weibo
     */
    @TableField("auth_type")
    private String authType;

    /**
     * 第三方开放ID
     */
    @TableField("open_id")
    private String openId;

    /**
     * 联合ID
     */
    @TableField("union_id")
    private String unionId;

    /**
     * 访问令牌
     */
    @TableField("access_token")
    private String accessToken;

    /**
     * 刷新令牌
     */
    @TableField("refresh_token")
    private String refreshToken;

    /**
     * 过期时间(秒)
     */
    @TableField("expires_in")
    private Integer expiresIn;

    /**
     * 认证数据
     */
    @TableField("auth_data")
    private String authData;

    /**
     * 状态: 0-解绑, 1-绑定
     */
    @TableField("status")
    private Integer status;

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


}
