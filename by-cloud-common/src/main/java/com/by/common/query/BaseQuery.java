package com.by.common.query;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 分页查询基本条件
 */
@Data
public class BaseQuery {

    @Schema(description="当前页数")
    private int pageNumber = 1;

    @Schema(description="当前页条数")
    private int pageSize = 10;



}
