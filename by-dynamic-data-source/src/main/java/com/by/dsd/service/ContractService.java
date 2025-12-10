//package com.by.dsd.service;
//
//import com.baomidou.dynamic.datasource.annotation.DS;
//import com.by.dsd.entity.SysUser;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
///**
// * @author bandd
// * @date2025年12月10日17:15
// * 主从分离的业务
// */
//@Service
//public class BusinessService {
//    @Autowired
//    private SysUser userMapper;
//
//    @Autowired
//    private OrderMapper orderMapper;
//
//    // 读操作使用 db2（从库）
//    @DS("db2")
//    public SysUser getUserInfo(Long userId) {
//        // 查询用户信息，使用从库
//        return userMapper.selectById(userId);
//    }
//
//    // 写操作使用 master（主库）
//    @DS("master")
//    @Transactional
//    public void createOrder(Order order) {
//        // 创建订单，使用主库
//        orderMapper.insert(order);
//
//        // 更新用户订单数
//        userMapper.updateOrderCount(order.getUserId());
//    }
//
//    // 复杂业务：需要操作多个数据源
//    public void complexBusiness(Long userId, Order order) {
//        // 1. 从 db2 查询
//        User user = getUserFromSlave(userId);
//
//        // 2. 向 master 写入
//        createOrder(order);
//
//        // 3. 记录日志到另一个数据源（如果有的话）
//        saveLog(user, order);
//    }
//
//    @DS("db2")
//    private User getUserFromSlave(Long userId) {
//        return userMapper.selectById(userId);
//    }
//}
