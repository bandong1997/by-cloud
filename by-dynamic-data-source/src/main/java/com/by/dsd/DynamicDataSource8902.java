package com.by.dsd;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * SpringBoot多数据源
 */
@SpringBootApplication
@MapperScan(basePackages = "com.by.dsd.mapper")
public class DynamicDataSource8902
{
    public static void main( String[] args )
    {
        SpringApplication.run(DynamicDataSource8902.class, args);
    }
}
