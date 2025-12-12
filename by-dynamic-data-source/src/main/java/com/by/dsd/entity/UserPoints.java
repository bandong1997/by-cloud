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
 * 用户积分表
 * </p>
 *
 * @author bdd
 * @since 2025-12-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("user_points")
public class UserPoints implements Serializable {

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
     * 总积分
     */
    @TableField("total_points")
    private Integer totalPoints;

    /**
     * 可用积分
     */
    @TableField("available_points")
    private Integer availablePoints;

    /**
     * 已用积分
     */
    @TableField("used_points")
    private Integer usedPoints;

    /**
     * 过期积分
     */
    @TableField("expired_points")
    private Integer expiredPoints;

    /**
     * 会员等级
     */
    @TableField("level")
    private Integer level;

    /**
     * 成长值
     */
    @TableField("growth_value")
    private Integer growthValue;

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
