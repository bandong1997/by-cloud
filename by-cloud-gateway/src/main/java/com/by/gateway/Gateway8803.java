package com.by.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * Hello world!
 *
 */
@SpringBootApplication
@EnableDiscoveryClient
public class Gateway8803
{
    public static void main( String[] args )
    {
        SpringApplication.run(Gateway8803.class, args);
    }
}
