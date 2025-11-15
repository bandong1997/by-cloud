package com.by.devtool;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * SpringBoot脚手架
 *
 */
@SpringBootApplication
@EnableScheduling
public class DevTool8901
{
    public static void main( String[] args )
    {
        SpringApplication.run(DevTool8901.class, args);
    }
}
