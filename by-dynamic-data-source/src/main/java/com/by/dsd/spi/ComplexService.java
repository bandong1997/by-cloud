package com.by.dsd.spi;

import com.baomidou.dynamic.datasource.annotation.DS;
import org.springframework.stereotype.Service;

/**
 * @author bandd
 * @date2025年12月10日17:16
 * 在类和方法上同时使用注解
 */
@Service
@DS("master")  // 类级别默认使用 master (类似于MctContractTlpMapper)
public class ComplexService {

    // 这个方法使用类级别的 master 数据源
    public void method1() {
        // 使用 master
    }

    // 方法级别覆盖，使用 db2
    @DS("db2")
    public void method2() {
        // 使用 db2
    }

    // 再次使用 master
    @DS("master")
    public void method3() {
        // 使用 master
    }


}
