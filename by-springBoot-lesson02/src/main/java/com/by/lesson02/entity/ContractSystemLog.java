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
 * 系统日志表
 * </p>
 *
 * @author bdd
 * @since 2026-01-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("contract_system_log")
public class ContractSystemLog implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 日志唯一标识
     */
    @TableField("log_uid")
    private String logUid;

    /**
     * 日志类型: SYSTEM/BUSINESS/ERROR/LOGIN/OPERATION
     */
    @TableField("log_type")
    private String logType;

    /**
     * 日志级别
     */
    @TableField("log_level")
    private String logLevel;

    /**
     * 日志来源
     */
    @TableField("log_source")
    private String logSource;

    /**
     * 记录器名称
     */
    @TableField("logger_name")
    private String loggerName;

    /**
     * 日志标题
     */
    @TableField("log_title")
    private String logTitle;

    /**
     * 日志内容
     */
    @TableField("log_content")
    private String logContent;

    /**
     * 异常信息
     */
    @TableField("exception_info")
    private String exceptionInfo;

    /**
     * 堆栈跟踪
     */
    @TableField("stack_trace")
    private String stackTrace;

    /**
     * 业务编号
     */
    @TableField("business_no")
    private String businessNo;

    /**
     * 业务类型
     */
    @TableField("business_type")
    private String businessType;

    /**
     * 跟踪ID
     */
    @TableField("trace_id")
    private String traceId;

    /**
     * 跨度ID
     */
    @TableField("span_id")
    private String spanId;

    /**
     * 服务名称
     */
    @TableField("service_name")
    private String serviceName;

    /**
     * 主机地址
     */
    @TableField("host_address")
    private String hostAddress;

    /**
     * 主机名
     */
    @TableField("host_name")
    private String hostName;

    /**
     * 线程名
     */
    @TableField("thread_name")
    private String threadName;

    /**
     * 用户ID
     */
    @TableField("user_id")
    private Long userId;

    /**
     * 用户名
     */
    @TableField("user_name")
    private String userName;

    /**
     * 客户端IP
     */
    @TableField("client_ip")
    private String clientIp;

    /**
     * 日志时间
     */
    @TableField("log_time")
    private Date logTime;

    /**
     * 持续时间(毫秒)
     */
    @TableField("duration_ms")
    private Integer durationMs;

    /**
     * 关键字1
     */
    @TableField("keyword1")
    private String keyword1;

    /**
     * 关键字2
     */
    @TableField("keyword2")
    private String keyword2;

    /**
     * 关键字3
     */
    @TableField("keyword3")
    private String keyword3;


}
