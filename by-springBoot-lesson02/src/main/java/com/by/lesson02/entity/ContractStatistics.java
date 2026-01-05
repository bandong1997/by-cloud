package com.by.lesson02.entity;

import java.math.BigDecimal;
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
 * 合同统计表
 * </p>
 *
 * @author bdd
 * @since 2026-01-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("contract_statistics")
public class ContractStatistics implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 统计日期
     */
    @TableField("stat_date")
    private Date statDate;

    /**
     * 合同类型
     */
    @TableField("contract_type")
    private String contractType;

    /**
     * 部门ID
     */
    @TableField("department_id")
    private Long departmentId;

    /**
     * 总数量
     */
    @TableField("total_count")
    private Integer totalCount;

    /**
     * 草稿数量
     */
    @TableField("draft_count")
    private Integer draftCount;

    /**
     * 生效数量
     */
    @TableField("effective_count")
    private Integer effectiveCount;

    /**
     * 过期数量
     */
    @TableField("expired_count")
    private Integer expiredCount;

    /**
     * 终止数量
     */
    @TableField("terminated_count")
    private Integer terminatedCount;

    /**
     * 总金额
     */
    @TableField("total_amount")
    private BigDecimal totalAmount;

    /**
     * 已付金额
     */
    @TableField("paid_amount")
    private BigDecimal paidAmount;

    /**
     * 未付金额
     */
    @TableField("unpaid_amount")
    private BigDecimal unpaidAmount;

    /**
     * 变更次数
     */
    @TableField("change_count")
    private Integer changeCount;

    /**
     * 当日新增
     */
    @TableField("created_count")
    private Integer createdCount;

    /**
     * 即将到期数量(30天内)
     */
    @TableField("expire_soon_count")
    private Integer expireSoonCount;


}
