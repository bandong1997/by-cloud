package com.by.lesson02.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * @author bandd
 * @date2026年01月30日9:40
 */
@Data
@Schema(description = "角色请求体")
public class RoleDto {

    @Schema(description="角色名")
    private String roleName;

}
