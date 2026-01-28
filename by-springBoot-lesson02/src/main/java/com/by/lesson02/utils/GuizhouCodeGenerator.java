package com.by.lesson02.utils;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author bandd
 * @date2026年01月07日9:19
 */
public class GuizhouCodeGenerator {
    // 贵州省级行政区代码（固定）
    private static final String GUIZHOU_REGION_CODE = "520000";
    // 固定前缀
    private static final String FIXED_PREFIX = "C";
    // 年份格式化器
    private static final DateTimeFormatter YEAR_FORMATTER = DateTimeFormatter.ofPattern("yyyy");
    // 存储不同年份的序列号（并发安全的Map）
    private static final ConcurrentHashMap<String, AtomicInteger> YEAR_SEQ_MAP = new ConcurrentHashMap<>();

    /**
     * 生成编码：C + 贵州行政区代码 + 当前年份 + 3位序列号（从001开始）
     * @return 符合规则的编码
     */
    public static String generateCode() {
        // 1. 获取当前年份
        String currentYear = LocalDate.now().format(YEAR_FORMATTER);

        // 2. 按年份获取/初始化序列号生成器（并发安全）
        AtomicInteger seq = YEAR_SEQ_MAP.computeIfAbsent(currentYear, k -> new AtomicInteger(1));

        // 3. 原子性递增序列号（核心：保证并发下不重复）
        int currentSeq = seq.getAndIncrement();

        // 4. 拼接编码：前缀 + 行政区代码 + 年份 + 3位补零的序列号
        return String.format("%s%s%s%03d",
                FIXED_PREFIX,
                GUIZHOU_REGION_CODE,
                currentYear,
                currentSeq);
    }

    // 测试并发场景
    public static void main(String[] args) throws InterruptedException {
        // 启动10个线程，每个线程生成10个编码
        int threadCount = 10;
        int codePerThread = 10;
        Thread[] threads = new Thread[threadCount];

        for (int i = 0; i < threadCount; i++) {
            threads[i] = new Thread(() -> {
                for (int j = 0; j < codePerThread; j++) {
                    String code = GuizhouCodeGenerator.generateCode();
                    System.out.println(Thread.currentThread().getName() + " 生成编码：" + code);
                }
            });
            threads[i].start();
        }

        // 等待所有线程执行完成
        for (Thread thread : threads) {
            thread.join();
        }

        System.out.println("===== 并发生成完成 =====");
        // 验证最后一个序列号：10线程*10个=100，最终序列号应为100
        String currentYear = LocalDate.now().format(YEAR_FORMATTER);
        AtomicInteger finalSeq = YEAR_SEQ_MAP.get(currentYear);
        System.out.println("当前年份[" + currentYear + "]最终序列号：" + (finalSeq.get() - 1));
    }
}