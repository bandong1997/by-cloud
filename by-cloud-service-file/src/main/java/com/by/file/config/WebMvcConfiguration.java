package com.by.file.config;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * description: 配置开启跨域支持配置就不用一个一个加了
 * create by: 班东东
 * create time: 2025/4/4 19:16
 */
@Component // 想让拦截器生效，那么此时就需要将拦截器注册到Spring MVC中
public class WebMvcConfiguration implements WebMvcConfigurer {

    // 开启支持跨域
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")      // 添加路径规则
                .allowCredentials(true)               // 是否允许在跨域的情况下传递Cookie
                .allowedOriginPatterns("*")           // 允许请求来源的域规则
                .allowedMethods("*")
                .allowedHeaders("*") ;                // 允许所有的请求头
    }

}
