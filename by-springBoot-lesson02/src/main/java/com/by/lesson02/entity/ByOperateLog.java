package com.by.lesson02.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 操作日志表
 * </p>
 *
 * @author bdd
 * @since 2026-01-29
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("by_operate_log")
public class ByOperateLog implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 日志ID
     */
    @TableField("id")
    private String id;

    /**
     * 操作模块
     */
    @TableField("title")
    private String title;

    /**
     * 业务类型
     */
    @TableField("biz_type")
    private String bizType;

    /**
     * 操作类型
     */
    @TableField("oper_type")
    private String operType;

    /**
     * 方法名称
     */
    @TableField("method")
    private String method;

    /**
     * 请求方式
     */
    @TableField("request_method")
    private String requestMethod;

    /**
     * IP地址
     */
    @TableField("ip")
    private String ip;

    /**
     * IP归属地
     */
    @TableField("ip_location")
    private String ipLocation;

    /**
     * IP版本(IPv4/IPv6)
     */
    @TableField("ip_version")
    private String ipVersion;

    /**
     * 用户代理
     */
    @TableField("user_agent")
    private String userAgent;

    /**
     * 浏览器
     */
    @TableField("browser")
    private String browser;

    /**
     * 浏览器版本
     */
    @TableField("browser_version")
    private String browserVersion;

    /**
     * 操作系统
     */
    @TableField("os")
    private String os;

    /**
     * 操作系统版本
     */
    @TableField("os_version")
    private String osVersion;

    /**
     * 设备类型
     */
    @TableField("device")
    private String device;

    /**
     * 设备型号
     */
    @TableField("device_model")
    private String deviceModel;

    /**
     * 操作时间
     */
    @TableField("oper_time")
    private Date operTime;

    /**
     * 创建时间
     */
    @TableField("create_time")
    private Date createTime;


}
