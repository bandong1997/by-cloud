package com.by.contract.dto;


import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * @author: 班东东
 * @Time: 2025/9/11 21:10
 * @description:
 */
@Data
@Schema(description = "分页请求体")
public class ContractPageDto {

    @Schema(description = "页数")
    private Integer page;

    @Schema(description = "每页记录数")
    private Integer number;


}
