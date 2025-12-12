package com.by.dsd.spi;

import com.baomidou.dynamic.datasource.annotation.DS;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author bandd
 * @date2025年12月10日17:16
 * 事务管理
 */
public class TransactionService {

    // 在 master 数据源上开启事务
    @DS("master")
    @Transactional(rollbackFor = Exception.class)
    public void transactionOnMaster() {
        // 所有操作都在 master 数据源的事务中
//        userMapper.insert(user);
//        logMapper.insert(log);
        // 如果发生异常，会回滚
    }

    // 在 db2 数据源上开启事务
    @DS("db2")
    @Transactional(rollbackFor = Exception.class)
    public void transactionOnDb2() {
        // 所有操作都在 db2 数据源的事务中
//        localDataMapper.insert(data);
        // 事务独立于 master
    }

    /**
     * 注意：不同数据源之间的事务是独立的，无法实现跨数据源的分布式事务（除非使用 Seata 等分布式事务解决方案）。
     */

}
