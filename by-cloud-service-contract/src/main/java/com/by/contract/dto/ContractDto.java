package com.by.contract.dto;


import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author: 班东东
 * @Time: 2025/8/26 22:36
 * @description:
 */
@Data
@Schema(description = "合同保存参数")
public class ContractDto {

    @Schema(description = "合同id", required = false)
    private String id;

    @Schema(description = "合同名称", required = true)
    private String contractName;

    @Schema(description = "合同编号", required = true)
    private String contractCode;

    @Schema(description = "合同类型", required = true)
    private String contractType;

    @Schema(description = "甲方名称", required = true)
    private String partyAName;

    @Schema(description = "甲方联系人", required = true)
    private String partyAContact;

    @Schema(description = "甲方联系电话", required = true)
    private String partyAPhone;

    @Schema(description = "甲方地址", required = true)
    private String partyAAddress;

    @Schema(description = "乙方名称", required = true)
    private String partyBName;

    @Schema(description = "乙方联系人", required = true)
    private String partyBContact;

    @Schema(description = "乙方联系电话", required = true)
    private String partyBPhone;

    @Schema(description = "乙方地址", required = true)
    private String partyBAddress;

    @Schema(description = "合同总金额", required = true)
    private BigDecimal contractAmount;

    @Schema(description = "货币类型", required = true)
    private String currency;

    @Schema(description = "付款条款", required = true)
    private String paymentTerms;

    @Schema(description = "签订日期", required = true)
    private Date signedDate;

    @Schema(description = "生效日期", required = true)
    private Date effectiveDate;

    @Schema(description = "到期日期", required = true)
    private Date expirationDate;

    /**
     * 合同状态：DRAFT(草稿), PENDING(待审核), APPROVED(已审核), EXECUTING(执行中), COMPLETED(已完成), TERMINATED(已终止), CANCELLED(已取消)
     */
    @Schema(description = "合同状态(DRAFT(草稿), PENDING(待审核), APPROVED(已审核))", required = true)
    private String contractStatus;

    @Schema(description = "合同主要内容", required = true)
    private String contractContent;

    @Schema(description = "创建人", required = true)
    private String createdBy;

    @Schema(description = "备注", required = true)
    private String remark;

}
