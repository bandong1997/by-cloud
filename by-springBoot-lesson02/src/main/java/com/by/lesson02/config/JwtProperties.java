package com.by.lesson02.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * @author bandd
 * @date2026年02月28日10:21
 * JWT 配置属性
 */
@Data
@Component
@ConfigurationProperties(prefix = "jwt")
public class JwtProperties {

    /**
     * 密钥
     */
    private String secret;

    /**
     * 访问 Token 过期时间（秒），默认 2 小时
     */
    private Long accessTokenExpire;

    /**
     * 刷新 Token 过期时间（秒），默认 7 天
     */
    private Long refreshTokenExpire;

    /**
     * 请求头名称
     */
    private String header;

    /**
     * Token 前缀
     */
    private String prefix;

    /**
     * 不需要登录校验的路径前缀（startsWith 匹配）
     */
    private List<String> skipPaths = new ArrayList<>();

}
