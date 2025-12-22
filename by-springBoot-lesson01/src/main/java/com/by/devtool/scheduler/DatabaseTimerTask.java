package com.by.devtool.scheduler;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.by.devtool.entity.UserPo;
import com.by.devtool.mapper.UserPoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author bandd
 * @date2025年09月29日16:54
 * 定时器
 */
@Component
public class DatabaseTimerTask {


    @Autowired
    private UserPoMapper userPoMapper;

    // 每5分钟执行一次
//    @Scheduled(fixedRate = 300000)
    @Scheduled(fixedRate = 60000)
    public void cleanExpiredUsers() {
        System.out.println("开始清理过期用户...");
        List<UserPo> list = userPoMapper.selectList(new QueryWrapper<>());
        for (UserPo userPo : list) {
            System.out.println(userPo);
        }
        // int count = userRepository.deleteExpiredUsers();
        System.out.println("清理完成，共删除 " + "count" + " 个过期用户");
    }

    // 每天凌晨2点执行
    @Scheduled(cron = "0 0 2 * * ?")
    public void generateDailyReport() {
        System.out.println("开始生成日报...");
        // 数据库操作逻辑
//        generateReport();
        System.out.println("日报生成完成");
    }

    // 初始延迟10秒，然后每30分钟执行一次
    @Scheduled(initialDelay = 10000, fixedRate = 1800000)
    public void syncData() {
        System.out.println("开始数据同步...");
        // 数据库同步逻辑
//        syncDatabase();
        System.out.println("数据同步完成");
    }

}
