package com.by.devtool.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class Knife4jConfig {

    @Bean
    public OpenAPI customOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("用户管理系统API文档")
                        .version("1.0")
                        .description("这是一个使用Spring Boot和Knife4j构建的用户管理系统API文档")
                        .termsOfService("http://example.com/terms")
                        .contact(new Contact()
                                .name("bdd")
                                .email("13460122689@163.com")
                                .url("http://example.com"))
                        .license(new License()
                                .name("Apache 2.0")
                                .url("http://springdoc.org")));
    }
}