package com.by.lesson02.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 合同主表
 * </p>
 *
 * @author bdd
 * @since 2026-01-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("contract")
@Schema(description = "合同实体")
public class Contract implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "主键ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @Schema(description = "合同唯一标识", required = true)
    @TableField("contract_uid")
    private String contractUid;

    @Schema(description = "合同编号", required = true)
    @TableField("contract_no")
    private String contractNo;

    @Schema(description = "合同名称", required = true)
    @TableField("contract_name")
    private String contractName;

    @Schema(description = "合同类型")
    @TableField("contract_type")
    private String contractType;

    @Schema(description = "状态")
    @TableField("status")
    private String status;

    @Schema(description = "甲方名称")
    @TableField("party_a_name")
    private String partyAName;

    @Schema(description = "乙方名称")
    @TableField("party_b_name")
    private String partyBName;

    @Schema(description = "甲方统一信用代码")
    @TableField("party_a_id")
    private String partyAId;

    @Schema(description = "乙方统一信用代码")
    @TableField("party_b_id")
    private String partyBId;

    @Schema(description = "签订日期")
    @TableField("sign_date")
    private Date signDate;

    @Schema(description = "生效日期")
    @TableField("effective_date")
    private Date effectiveDate;

    @Schema(description = "到期日期")
    @TableField("expire_date")
    private Date expireDate;

    @Schema(description = "实际终止日期")
    @TableField("actual_end_date")
    private Date actualEndDate;

    @Schema(description = "合同总金额")
    @TableField("total_amount")
    private BigDecimal totalAmount;

    @Schema(description = "币种")
    @TableField("currency")
    private String currency;

    @Schema(description = "已付金额")
    @TableField("paid_amount")
    private BigDecimal paidAmount;

    @Schema(description = "主文件路径")
    @TableField("main_file_path")
    private String mainFilePath;

    @Schema(description = "变更次数")
    @TableField("change_count")
    private Integer changeCount;

    @Schema(description = "转让次数")
    @TableField("transfer_count")
    private Integer transferCount;

    @Schema(description = "创建人姓名")
    @TableField("created_by_name")
    private String createdByName;

    @Schema(description = "创建时间")
    @TableField("created_time")
    private Date createdTime;

    @Schema(description = "更新人姓名")
    @TableField("updated_by_name")
    private String updatedByName;

    @Schema(description = "更新时间")
    @TableField("updated_time")
    private Date updatedTime;

    @Schema(description = "删除标志 0-正常 1-删除")
    @TableField("is_deleted")
    private Integer isDeleted;

    @Schema(description = "版本号")
    @TableField("version")
    private Integer version;

    @Schema(description = "内容")
    @TableField("content")
    private String content;


}
