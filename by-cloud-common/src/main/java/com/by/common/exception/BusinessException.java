package com.by.common.exception;

import lombok.Getter;

/**
 * 自定义业务异常
 */
@Getter
public class BusinessException extends RuntimeException {
    /**
     * 错误码
     */
    private final Integer code;

    /**
     * 构造方法
     */
    public BusinessException(Integer code, String message) {
        super(message);
        this.code = code;
    }

    /**
     * 构造方法，使用默认错误码
     */
    public BusinessException(String message) {
        super(message);
        this.code = 500;
    }
}