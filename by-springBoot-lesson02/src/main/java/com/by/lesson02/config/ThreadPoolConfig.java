package com.by.lesson02.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.ThreadPoolExecutor;

/**
 * @author bandd
 * @date2025年12月22日15:33
 * 线程池配置
 */
@Configuration
@EnableAsync
public class ThreadPoolConfig {

    /**
     * 操作日志线程池
     */
    @Bean("byOperationLogExecutor")
    public ThreadPoolTaskExecutor operationLogExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        // 核心线程数
        executor.setCorePoolSize(5);
        // 最大线程数
        executor.setMaxPoolSize(10);
        // 队列容量
        executor.setQueueCapacity(1000);
        // 线程存活时间（秒）
        executor.setKeepAliveSeconds(60);
        // 线程名前缀
        executor.setThreadNamePrefix("by-oper-log-");
        // 拒绝策略：由调用线程处理
        executor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
        // 等待所有任务完成后关闭线程池
        executor.setWaitForTasksToCompleteOnShutdown(true);
        // 等待时间（秒）
        executor.setAwaitTerminationSeconds(60);
        executor.initialize();
        return executor;
    }
}