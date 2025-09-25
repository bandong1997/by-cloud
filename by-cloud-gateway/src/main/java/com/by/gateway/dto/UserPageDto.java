package com.by.gateway.dto;


import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * @author: 班东东
 * @Time: 2025/8/24 15:12
 * @description:
 */
@Data
@Schema(description = "用户分页请求体")
public class UserPageDto {

    @Schema(description = "每页记录数")
    private Integer number;

    @Schema(description = "页数")
    private Integer page;

}
