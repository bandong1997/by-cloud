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

    // Token 过期
    TOKEN_EXPIRED(401, "Token已过期"),

    // Token 无效
    TOKEN_INVALID(401, "Token无效"),

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

    // 验证码错误
    CAPTCHA_ERROR(409, "验证码错误"),

    // 验证码已过期
    CAPTCHA_EXPIRED(410, "验证码已过期，请刷新"),

    // 系统错误
    SYSTEM_ERROR(500, "系统错误"),

    // 服务繁忙
    SERVICE_BUSY(503, "服务繁忙"),

    // 删除失败
    DELETE_ERROR(504, "删除失败"),

    // 编码重复
    REPEAT_CODE(505, "编码重复"),

    // 编码重复
    NULL_VALUE(506, "没有查到相关数据");


    /**
     * 状态码
     */
    private final Integer code;

    /**
     * 消息
     */
    private final String message;
}