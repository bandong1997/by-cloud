//package com.by.dsd.service;
//
//import com.baomidou.dynamic.datasource.DynamicRoutingDataSource;
//import com.baomidou.dynamic.datasource.toolkit.DynamicDataSourceContextHolder;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import javax.sql.DataSource;
//import java.sql.Connection;
//import java.sql.Statement;
//
///**
// * @author bandd
// * @date2025年12月10日17:13
// * 动态切换数据源（编程式）
// */
//@Service
//public class DynamicSwitchService {
//
//    @Autowired
//    private DataSource dataSource;
//
//    public void dynamicSwitch() {
//        try {
//            // 1. 切换到 master 数据源
//            DynamicDataSourceContextHolder.push("master");
//            // 执行 master 相关操作
//            doMasterOperation();
//
//            // 2. 切换到 db2 数据源
//            DynamicDataSourceContextHolder.push("db2");
//            // 执行 db2 相关操作
//            doDb2Operation();
//
//            // 3. 清理数据源上下文
//            DynamicDataSourceContextHolder.clear();
//
//        } catch (Exception e) {
//            // 确保清理上下文
//            DynamicDataSourceContextHolder.clear();
//            throw e;
//        }
//    }
//
//    // 获取当前数据源
//    public String getCurrentDataSource() {
//        return DynamicDataSourceContextHolder.peek();
//    }
//
//    // 编程式获取数据源连接
//    public void manualOperation() throws Exception {
//        // 获取动态路由数据源
//        DynamicRoutingDataSource ds = (DynamicRoutingDataSource) dataSource;
//
//        // 获取 master 数据源
//        DataSource masterDataSource = ds.getDataSource("master");
//        try (Connection conn = masterDataSource.getConnection();
//             Statement stmt = conn.createStatement()) {
//            // 执行 SQL
//            stmt.execute("SELECT * FROM users");
//        }
//    }
//
//}
