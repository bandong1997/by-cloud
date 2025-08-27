package com.by.contract;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Hello world!
 *
 */
@SpringBootApplication
@MapperScan("com.by.contract.mapper")
public class Contract8804 {
    public static void main( String[] args )    {
        SpringApplication.run(Contract8804.class, args);
    }
}
