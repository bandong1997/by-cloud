package com.by.gateway.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 操作日志实体类
 * 记录用户在系统中的操作行为
 */
@Data
@TableName("sys_operation_log")
public class OperationLog implements Serializable {
    private static final long serialVersionUID = 1L;
    
    /**
     * 主键ID
     */
    private Long id;
    
    /**
     * 用户ID
     * 关联操作用户的ID
     */
    private Long userId;
    
    /**
     * 用户名
     * 操作用户的账号
     */
    private String username;
    
    /**
     * IP地址
     * 用户操作时的IP地址
     */
    private String ip;
    
    /**
     * 用户代理
     * 用户操作时使用的浏览器信息
     */
    private String userAgent;
    
    /**
     * 模块名称
     * 操作涉及的系统模块
     */
    private String module;
    
    /**
     * 操作名称
     * 具体的操作行为
     */
    private String operation;
    
    /**
     * 方法名称
     * 调用的后端方法名
     */
    private String method;
    
    /**
     * 请求参数
     * 操作请求的参数信息
     */
    private String params;
    
    /**
     * 执行时间
     * 操作执行的时长，单位毫秒
     */
    private Long executionTime;
    
    /**
     * 操作状态
     * 0:失败 1:成功
     */
    private Integer status;
    
    /**
     * 错误信息
     * 操作失败时的错误详情
     */
    private String errorMsg;
    
    /**
     * 创建时间
     */
    private Date createTime;
}