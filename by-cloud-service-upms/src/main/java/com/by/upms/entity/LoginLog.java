package com.by.upms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 登录日志实体类
 * 记录用户的登录行为信息
 */
@Data
@TableName("sys_login_log")
public class LoginLog implements Serializable {
    private static final long serialVersionUID = 1L;
    
    /**
     * 主键ID
     */
    private Long id;
    
    /**
     * 用户ID
     * 关联登录用户的ID
     */
    private Long userId;
    
    /**
     * 用户名
     * 登录用户的账号
     */
    private String username;
    
    /**
     * IP地址
     * 用户登录时的IP地址
     */
    private String ip;
    
    /**
     * 用户代理
     * 用户登录时使用的浏览器信息
     */
    private String userAgent;
    
    /**
     * 登录时间
     */
    private Date loginTime;
    
    /**
     * 登录状态
     * 0:失败 1:成功
     */
    private Integer status;
    
    /**
     * 消息
     * 登录结果的详细消息，如失败原因
     */
    private String message;
}