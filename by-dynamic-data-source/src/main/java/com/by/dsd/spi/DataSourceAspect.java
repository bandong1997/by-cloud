package com.by.dsd.spi;

import com.baomidou.dynamic.datasource.toolkit.DynamicDataSourceContextHolder;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * @author bandd
 * @date2025年12月10日17:17
 * AOP 结合使用
 */
@Aspect
@Component
@Order(1)  // 确保在事务注解之前执行
public class DataSourceAspect {

    // 根据业务规则动态选择数据源
    @Around("@annotation(org.springframework.web.bind.annotation.GetMapping)")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        Object[] args = point.getArgs();

        // 根据参数动态决定数据源
        if (args.length > 0 && "special".equals(args[0])) {
            DynamicDataSourceContextHolder.push("db2");
        } else {
            DynamicDataSourceContextHolder.push("master");
        }

        try {
            return point.proceed();
        } finally {
            DynamicDataSourceContextHolder.clear();
        }
    }

}
