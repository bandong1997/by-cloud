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
 * 审计日志表
 * </p>
 *
 * @author bdd
 * @since 2026-01-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("contract_audit_log")
public class ContractAuditLog implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 审计日志唯一标识
     */
    @TableField("audit_uid")
    private String auditUid;

    /**
     * 审计类型: DATA_CHANGE/AUTH_CHANGE/CONFIG_CHANGE
     */
    @TableField("audit_type")
    private String auditType;

    /**
     * 表名
     */
    @TableField("table_name")
    private String tableName;

    /**
     * 记录ID
     */
    @TableField("record_id")
    private String recordId;

    /**
     * 操作: INSERT/UPDATE/DELETE/SELECT
     */
    @TableField("operation")
    private String operation;

    /**
     * 旧数据
     */
    @TableField("old_data")
    private String oldData;

    /**
     * 新数据
     */
    @TableField("new_data")
    private String newData;

    /**
     * 差异数据
     */
    @TableField("diff_data")
    private String diffData;

    /**
     * 变更字段
     */
    @TableField("changed_fields")
    private String changedFields;

    /**
     * SQL语句
     */
    @TableField("sql_statement")
    private String sqlStatement;

    /**
     * SQL参数
     */
    @TableField("sql_params")
    private String sqlParams;

    /**
     * 执行时间(毫秒)
     */
    @TableField("execution_time_ms")
    private Integer executionTimeMs;

    /**
     * 影响行数
     */
    @TableField("affected_rows")
    private Integer affectedRows;

    /**
     * 成功标志
     */
    @TableField("success_flag")
    private Integer successFlag;

    /**
     * 数据库名
     */
    @TableField("db_name")
    private String dbName;

    /**
     * 连接ID
     */
    @TableField("connection_id")
    private Long connectionId;

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
     * 操作人IP
     */
    @TableField("operator_ip")
    private String operatorIp;

    /**
     * 操作时间
     */
    @TableField("operation_time")
    private Date operationTime;


}
