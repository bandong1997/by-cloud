package com.by.contract.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 合同
 * </p>
 *
 * @author bdd
 * @since 2025-12-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("mct_contract")
@Schema(description = "合同保存参数")
public class MctContractPo implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.ASSIGN_ID)
    @Schema(description = "主键自增，修改传递")
    private String id;

    @TableField("project_name")
    @Schema(description = "项目名称", required = true)
    private String projectName;

    @TableField("name")
    @Schema(description = "合同名称", required = true)
    private String name;

    @TableField("contract_number")
    @Schema(description = "合同编号", required = true)
    private String contractNumber;

    @Schema(description = "合同金额")
    private BigDecimal amount;

    @TableField("party_a")
    @Schema(description = "甲方")
    private String partyA;

    @TableField("party_b")
    @Schema(description = "乙方")
    private String partyB;

    @TableField("party_a_represent")
    @Schema(description = "甲方代表")
    private String partyARepresent;

    @TableField("party_b_represent")
    @Schema(description = "乙方代表")
    private String partyBRepresent;

    @TableField("party_a_phone")
    @Schema(description = "甲方电话")
    private String partyAPhone;

    @TableField("party_b_phone")
    @Schema(description = "乙方电话")
    private String partyBPhone;

    @TableField("sign_address")
    @Schema(description = "签订地点")
    private String signAddress;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @TableField("sign_time")
    @Schema(description = "签订时间")
    private Date signTime;

    @TableField("contract_type")
    @Schema(description = "合同类型（1、新立，2、变更，3、延续，4、转让）")
    private String contractType;

    @TableField("contract_templates_id")
    @Schema(description = "合同模板id")
    private String contractTemplatesId;

    @TableField("content")
    @Schema(description = "内容")
    private String content;

    @TableField("remark")
    @Schema(description = "备注")
    private String remark;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @TableField("term_start_time")
    @Schema(description = "合同有效开始时间")
    private Date termStartTime;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @TableField("term_end_time")
    @Schema(description = "合同有效结束时间")
    private Date termEndTime;

    @TableField("audit_status")
    @Schema(description = "审核状态(-1:拒绝0：未审核1：同意)")
    private BigDecimal auditStatus;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @TableField("audit_time")
    @Schema(description = "审核时间")
    private Date auditTime;

    @TableField("audit_user")
    @Schema(description = "审核人")
    private String auditUser;

    @TableField("audit_remark")
    @Schema(description = "审核说明")
    private String auditRemark;

    @TableField("create_user")
    @Schema(description = "创建人")
    private String createUser;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @TableField("create_time")
    @Schema(description = "创建时间,自动生成")
    private Date createTime;

    @TableField("modify_user")
    @Schema(description = "修改人")
    private String modifyUser;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @TableField("modify_time")
    @Schema(description = "修改时间,自动生成")
    private Date modifyTime;

    @TableField("del_status")
    @Schema(description = "删除状态,默认0")
    private BigDecimal delStatus;

    @TableField("del_user")
    @Schema(description = "删除人")
    private String delUser;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @TableField("del_time")
    @Schema(description = "删除时间,自动生成")
    private Date delTime;

    @TableField("version")
    @Schema(description = "版本号,默认1.0")
    private String version;

    @TableField("permit_no")
    @Schema(description = "许可证号")
    private String permitNo;

    @TableField("fno")
    @Schema(description = "收文/办件编号")
    private String fno;

    @TableField("canton")
    @Schema(description = "行政区代码")
    private String canton;

    @TableField("canton_name")
    @Schema(description = "行政区名称")
    private String cantonName;

    @TableField("mine_name")
    @Schema(description = "矿山名称")
    private String mineName;

    @TableField("file_path")
    @Schema(description = "pdf文件生成地址")
    private String filePath;

    @TableField("pay_terms")
    @Schema(description = "支付条款")
    private String payTerms;

    @TableField("source")
    @Schema(description = "矿权类型（1探矿权2：采矿权）")
    private String source;

    @TableField("archive_status")
    @Schema(description = "档状态(0：未归档，1：已归档),默认0")
    private BigDecimal archiveStatus;

    @TableField("aesKey")
    @Schema(description = "乙密钥方")
    private String aesKey;


}
