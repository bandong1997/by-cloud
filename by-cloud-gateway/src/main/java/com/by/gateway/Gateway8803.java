package com.by.gateway;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * Hello world!
 *
 */
@EnableDiscoveryClient
@SpringBootApplication
@MapperScan("com.by.gateway.mapper")
public class Gateway8803
{
    public static void main( String[] args )
    {
        SpringApplication.run(Gateway8803.class, args);
    }
}
