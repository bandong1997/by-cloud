package com.by.lesson02.dto;


import com.by.common.query.BaseQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * @author: 班东东
 * @Time: 2026/1/29 19:30
 * @description:
 */
@Data
@Schema(description = "用户分页请求体")
public class UserPageDto extends BaseQuery {

    @Schema(description="用户名")
    private String username;

    @Schema(description="电子邮箱")
    private String email;

    @Schema(description="手机号码")
    private String phone;

}
