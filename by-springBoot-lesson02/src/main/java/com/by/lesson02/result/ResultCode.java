package com.by.lesson02.result;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 结果状态码枚举
 */
@Getter
@AllArgsConstructor
public enum ResultCode {

    // 成功状态码
    SUCCESS(200, "操作成功"),

    // 失败状态码
    FAIL(500, "操作失败"),

    // 参数错误
    PARAM_ERROR(400, "参数错误"),

    // 未授权
    UNAUTHORIZED(401, "未授权"),

    // 禁止访问
    FORBIDDEN(403, "禁止访问"),

    // 资源不存在
    NOT_FOUND(404, "资源不存在"),

    // 用户不存在
    USER_NOT_FOUND(405, "用户不存在"),

    // 密码错误
    PASSWORD_ERROR(406, "密码错误"),

    // 用户已禁用
    USER_DISABLED(407, "用户已禁用"),

    // 用户名已存在
    USER_EXIST(408, "用户名已存在"),

    // 系统错误
    SYSTEM_ERROR(500, "系统错误"),

    // 服务繁忙
    SERVICE_BUSY(503, "服务繁忙"),

    // 删除失败
    DELETE_ERROR(504, "删除失败");



    /**
     * 状态码
     */
    private final Integer code;

    /**
     * 消息
     */
    private final String message;
}