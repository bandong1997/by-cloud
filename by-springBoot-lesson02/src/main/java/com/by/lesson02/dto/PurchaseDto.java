package com.by.lesson02.dto;

import com.by.common.query.BaseQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * @author bandd
 * @date2026年02月10日10:45
 */
@Data
@Schema(description = "部门采购清单请求体")
public class PurchaseDto extends BaseQuery {

    @Schema(description="物品名称")
    private String itemName;
}
