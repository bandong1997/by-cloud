package com.by.contract.dto;


import com.by.common.query.BaseQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * @author: 班东东
 * @Time: 2025/9/11 21:10
 * @description:
 */
@Data
@Schema(description = "分页请求体")
public class ContractPageDto extends BaseQuery {

    @Schema(description = "合同名称")
    private String contractName;



}
