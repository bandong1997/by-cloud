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
 * 操作记录表
 * </p>
 *
 * @author bdd
 * @since 2026-01-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("contract_operation_record")
public class ContractOperationRecord implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 记录唯一标识
     */
    @TableField("record_uid")
    private String recordUid;

    /**
     * 模块编码: CONTRACT/PAYMENT/APPROVAL
     */
    @TableField("module_code")
    private String moduleCode;

    /**
     * 模块名称
     */
    @TableField("module_name")
    private String moduleName;

    /**
     * 业务类型: CREATE/UPDATE/DELETE/VIEW/EXPORT
     */
    @TableField("business_type")
    private String businessType;

    /**
     * 目标类型: CONTRACT/CLAUSE/ATTACHMENT
     */
    @TableField("target_type")
    private String targetType;

    /**
     * 目标ID
     */
    @TableField("target_id")
    private String targetId;

    /**
     * 目标名称
     */
    @TableField("target_name")
    private String targetName;

    /**
     * 操作标题
     */
    @TableField("operation_title")
    private String operationTitle;

    /**
     * 操作详情
     */
    @TableField("operation_detail")
    private String operationDetail;

    /**
     * 操作前内容
     */
    @TableField("before_content")
    private String beforeContent;

    /**
     * 操作后内容
     */
    @TableField("after_content")
    private String afterContent;

    /**
     * 变更内容
     */
    @TableField("change_content")
    private String changeContent;

    /**
     * 备注
     */
    @TableField("remark")
    private String remark;

    /**
     * IP地址
     */
    @TableField("ip_address")
    private String ipAddress;

    /**
     * 用户代理
     */
    @TableField("user_agent")
    private String userAgent;

    /**
     * 设备类型: PC/MOBILE
     */
    @TableField("device_type")
    private String deviceType;

    /**
     * 浏览器
     */
    @TableField("browser")
    private String browser;

    /**
     * 操作系统
     */
    @TableField("os")
    private String os;

    /**
     * 请求URL
     */
    @TableField("request_url")
    private String requestUrl;

    /**
     * 请求方法
     */
    @TableField("request_method")
    private String requestMethod;

    /**
     * 请求参数
     */
    @TableField("request_params")
    private String requestParams;

    /**
     * 执行耗时(毫秒)
     */
    @TableField("execution_time")
    private Integer executionTime;

    /**
     * 成功标志 1-成功 0-失败
     */
    @TableField("success_flag")
    private Integer successFlag;

    /**
     * 错误信息
     */
    @TableField("error_message")
    private String errorMessage;

    /**
     * 操作人ID
     */
    @TableField("operator_id")
    private Long operatorId;

    /**
     * 操作人姓名
     */
    @TableField("operator_name")
    private String operatorName;

    /**
     * 操作人部门ID
     */
    @TableField("operator_dept_id")
    private Long operatorDeptId;

    /**
     * 操作人部门
     */
    @TableField("operator_dept_name")
    private String operatorDeptName;

    /**
     * 操作时间
     */
    @TableField("operation_time")
    private Date operationTime;

    /**
     * 日志级别
     */
    @TableField("log_level")
    private String logLevel;


}
