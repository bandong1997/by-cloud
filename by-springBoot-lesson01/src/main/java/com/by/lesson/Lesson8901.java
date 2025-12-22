package com.by.lesson;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * SpringBoot脚手架
 *
 */
@SpringBootApplication
@MapperScan("com.by.lesson.mapper")
@EnableScheduling // @Scheduled 注解的定时任务的支持
public class Lesson8901
{
    public static void main( String[] args )
    {
        SpringApplication.run(Lesson8901.class, args);
    }
}
