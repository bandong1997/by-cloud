package com.by.lesson02.aop;

import java.lang.annotation.*;

/**
 * @author bandd
 * @date2026年02月06日15:23
 * 定义操作日志注解
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface OperationLog {

    /**
     * 操作模块
     */
    String module() default "";

    /**
     * 操作类型
     */
    String type() default "";

    /**
     * 操作描述
     */
    String desc() default "";

    /**
     * 是否记录参数
     */
    boolean recordParams() default true;

    /**
     * 是否记录返回值
     */
    boolean recordResult() default false;
}
