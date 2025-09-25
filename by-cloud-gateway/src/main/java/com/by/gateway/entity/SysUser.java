package com.by.gateway.entity;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 用户表
 * </p>
 *
 * @author bdd
 * @since 2025-08-24
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_user")
@Schema(description = "用户CRUD请求体")
public class SysUser implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "主键id，修改传递")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @Schema(description = "用户名", required = true)
    @TableField("username")
    private String username;

    @Schema(description = "密码", required = true)
    @TableField("password")
    private String password;

    @Schema(description = "邮箱")
    @TableField("email")
    private String email;

    @Schema(description = "手机号")
    @TableField("mobile")
    private String mobile;

    @Schema(description = "状态(0:禁用,1:启用)")
    @TableField("status")
    private Integer status;

    @Schema(description = "创建人")
    @TableField("create_user")
    private String createUser;

    //    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @TableField(fill = FieldFill.INSERT)
    @Schema(description = "创建时间")
    private LocalDateTime createTime;

    @Schema(description = "用户名")
    @TableField("update_user")
    private String updateUser;

    //    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    @Schema(description = "更新时间")
    private LocalDateTime updateTime;

    @TableField("avatar")
    @Schema(description = "头像")
    private String avatar;

    @TableField("nickname")
    @Schema(description = "昵称")
    private String nickname;

    @Schema(description = "逻辑删除(0:未删除,1:已删除)，已处理")
    @TableField("deleted")
    @TableLogic
    private Integer deleted;


}
