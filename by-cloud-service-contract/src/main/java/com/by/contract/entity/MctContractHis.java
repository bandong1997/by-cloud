package com.by.contract.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
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
@TableName("mct_contract_his")
public class MctContractHis implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 合同id
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 合同名称
     */
    @TableField("name")
    private String name;

    /**
     * 合同编号
     */
    @TableField("contract_number")
    private String contractNumber;

    /**
     * 合同金额
     */
    @TableField("amount")
    private BigDecimal amount;

    /**
     * 甲方
     */
    @TableField("party_a")
    private String partyA;

    /**
     * 乙方
     */
    @TableField("party_b")
    private String partyB;

    /**
     * 甲方代表
     */
    @TableField("party_a_represent")
    private String partyARepresent;

    /**
     * 乙方代表
     */
    @TableField("party_b_represent")
    private String partyBRepresent;

    /**
     * 甲方电话
     */
    @TableField("party_a_phone")
    private String partyAPhone;

    /**
     * 乙方电话
     */
    @TableField("party_b_phone")
    private String partyBPhone;

    /**
     * 项目名称
     */
    @TableField("project_name")
    private String projectName;

    /**
     * 签订地点
     */
    @TableField("sign_address")
    private String signAddress;

    /**
     * 签订时间
     */
    @TableField("sign_time")
    private Date signTime;

    /**
     * 合同类型（1、新立，2、变更，3、延续，4、转让）
     */
    @TableField("contract_type")
    private String contractType;

    /**
     * 合同模板id
     */
    @TableField("contract_templates_id")
    private String contractTemplatesId;

    /**
     * 合同期限
     */
    @TableField("contract_limit_time")
    private Date contractLimitTime;

    /**
     * 内容
     */
    @TableField("content")
    private String content;

    /**
     * 备注
     */
    @TableField("remark")
    private String remark;

    /**
     * 合同有效开始时间
     */
    @TableField("term_start_time")
    private Date termStartTime;

    /**
     * 合同有效结束时间
     */
    @TableField("term_end_time")
    private Date termEndTime;

    /**
     * 新增审核状态(-1:拒绝0：未审核1：同意)
     */
    @TableField("audit_status")
    private BigDecimal auditStatus;

    /**
     * 新增审核时间
     */
    @TableField("audit_time")
    private Date auditTime;

    /**
     * 新增审核人
     */
    @TableField("audit_user")
    private String auditUser;

    /**
     * 新增审核说明
     */
    @TableField("audit_remark")
    private String auditRemark;

    /**
     * 创建人
     */
    @TableField("create_user")
    private String createUser;

    /**
     * 创建时间
     */
    @TableField("create_time")
    private Date createTime;

    /**
     * 修改人
     */
    @TableField("modify_user")
    private String modifyUser;

    /**
     * 修改时间
     */
    @TableField("modify_time")
    private Date modifyTime;

    /**
     * 删除状态
     */
    @TableField("del_status")
    private BigDecimal delStatus;

    /**
     * 删除人
     */
    @TableField("del_user")
    private String delUser;

    /**
     * 删除时间
     */
    @TableField("del_time")
    private Date delTime;

    /**
     * version
     */
    @TableField("version")
    private String version;

    /**
     * 许可证号
     */
    @TableField("permit_no")
    private String permitNo;

    /**
     * 收文/办件编号
     */
    @TableField("fno")
    private String fno;

    /**
     * 行政区代码
     */
    @TableField("canton")
    private String canton;

    /**
     * 行政区名称
     */
    @TableField("canton_name")
    private String cantonName;

    /**
     * 矿山名称
     */
    @TableField("mine_name")
    private String mineName;

    /**
     * pdf文件生成地址
     */
    @TableField("file_path")
    private String filePath;

    /**
     * 支付条款
     */
    @TableField("pay_terms")
    private String payTerms;

    /**
     * 矿权类型（1探矿权2：采矿权）
     */
    @TableField("source")
    private String source;

    /**
     * 归档状态(0：未归档，1：已归档)
     */
    @TableField("archive_status")
    private BigDecimal archiveStatus;

    /**
     * 密钥
     */
    @TableField("aesKey")
    private String aeskey;

    /**
     * 合同id
     */
    @TableField("contract_id")
    private String contractId;


}
