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
 * 积分明细表
 * </p>
 *
 * @author bdd
 * @since 2025-12-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("point_details")
public class PointDetails implements Serializable {

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
     * 变动类型: 1-获得, 2-消费, 3-过期
     */
    @TableField("change_type")
    private Integer changeType;

    /**
     * 变动积分数
     */
    @TableField("change_points")
    private Integer changePoints;

    /**
     * 变动后剩余积分
     */
    @TableField("remaining_points")
    private Integer remainingPoints;

    /**
     * 来源类型: register, login, order, etc.
     */
    @TableField("source_type")
    private String sourceType;

    /**
     * 来源ID
     */
    @TableField("source_id")
    private String sourceId;

    /**
     * 描述
     */
    @TableField("description")
    private String description;

    /**
     * 生效日期
     */
    @TableField("effective_date")
    private Date effectiveDate;

    /**
     * 过期日期
     */
    @TableField("expiry_date")
    private Date expiryDate;

    /**
     * 是否已结算
     */
    @TableField("is_settled")
    private Boolean isSettled;

    /**
     * 创建时间
     */
    @TableField("created_at")
    private Date createdAt;


}
