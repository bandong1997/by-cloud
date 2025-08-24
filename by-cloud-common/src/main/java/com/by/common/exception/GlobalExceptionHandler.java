package com.by.common.exception;

import com.by.common.result.Result;
import com.by.common.result.ResultCode;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
/**
 * 全局异常处理器
 */
@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

    /**
     * 处理所有未捕获的异常
     */
    @ExceptionHandler(Exception.class)
    public Result<?> handleException(Exception e, HttpServletRequest request) {
        log.error("请求路径: {}. 发生异常: {}", request.getRequestURI(), e.getMessage(), e);
        return Result.fail(ResultCode.SYSTEM_ERROR.getCode(), "系统异常: " + e.getMessage());
    }

    /**
     * 处理参数类型不匹配异常
     */
    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    public Result<?> handleMethodArgumentTypeMismatchException(MethodArgumentTypeMismatchException e, HttpServletRequest request) {
        log.error("请求路径: {}. 参数类型不匹配: {}", request.getRequestURI(), e.getMessage());
        return Result.fail(ResultCode.PARAM_ERROR.getCode(), "参数类型不匹配: " + e.getName());
    }

    /**
     * 处理自定义业务异常
     */
    @ExceptionHandler(BusinessException.class)
    public Result<?> handleBusinessException(BusinessException e, HttpServletRequest request) {
        log.error("请求路径: {}. 业务异常: {}", request.getRequestURI(), e.getMessage());
        return Result.fail(e.getCode(), e.getMessage());
    }
}