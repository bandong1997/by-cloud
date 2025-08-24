package com.by.upms;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableDiscoveryClient
@SpringBootApplication
@EnableFeignClients(basePackages = "com.by.upms.feign")
@MapperScan("com.by.upms.mapper")
public class Upms8801 {

    public static void main(String[] args) {
        SpringApplication.run(Upms8801.class, args);
    }


}
