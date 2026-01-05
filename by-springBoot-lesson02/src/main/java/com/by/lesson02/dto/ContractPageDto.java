package com.by.lesson02.dto;

import com.by.common.query.BaseQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * @author bandd
 * @date2026年01月05日15:49
 */
@Data
@Schema(description = "分页请求体")
public class ContractPageDto extends BaseQuery {

    @Schema(description = "合同名称")
    private String contractName;

}
