package com.by.lesson02;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 *
 */
@SpringBootApplication
@MapperScan("com.by.lesson02.mapper")
public class Lesson8902
{
    public static void main( String[] args )
    {
        SpringApplication.run(Lesson8902.class, args);
    }
}
