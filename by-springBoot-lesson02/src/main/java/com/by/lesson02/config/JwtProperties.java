package com.by.lesson02.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

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
    private Long accessTokenExpire = 7200L;

    /**
     * 刷新 Token 过期时间（秒），默认 7 天
     */
    private Long refreshTokenExpire = 604800L;

    /**
     * 请求头名称
     */
    private String header = "Authorization";

    /**
     * Token 前缀
     */
    private String prefix = "Bearer ";

}
