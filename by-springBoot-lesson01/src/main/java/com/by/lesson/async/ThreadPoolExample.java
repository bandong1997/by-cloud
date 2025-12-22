package com.by.lesson.async;

import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

/**
 * @author bandd
 * @date2025年12月22日15:20
 */
public class ThreadPoolExample {

    public static void main(String[] args) throws Exception {
        // 创建线程池
        ExecutorService executor = Executors.newFixedThreadPool(3);

        // 提交异步任务
        Future<String> future = executor.submit(() -> {
            Thread.sleep(1000);
            return "任务结果";
        });

        // 获取结果（阻塞）
        String result = future.get();
        System.out.println("结果: " + result);

        // 提交多个任务
        List<Callable<String>> tasks = List.of(
                () -> { Thread.sleep(1000); return "任务1"; },
                () -> { Thread.sleep(500); return "任务2"; },
                () -> { Thread.sleep(200); return "任务3"; }
        );

        // 批量执行
        List<Future<String>> futures = executor.invokeAll(tasks);
        for (Future<String> f : futures) {
            System.out.println(f.get());
        }

        // 关闭线程池
        executor.shutdown();
    }

}
