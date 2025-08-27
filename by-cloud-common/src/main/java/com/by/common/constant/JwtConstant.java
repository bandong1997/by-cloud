package com.by.common.constant;


/**
 * @author: 班东东
 * @Time: 2025/8/27 22:24
 * @description: JWT
 */
public class JwtConstant {

    /**
     * JWT令牌前缀
     * 在HTTP请求头中，令牌值前需要添加的前缀
     */
    public static final String TOKEN_PREFIX = "Bearer ";

    /**
     * 认证请求头名称
     * HTTP请求中携带JWT令牌的请求头名称
     */
    public static final String HEADER_AUTHORIZATION = "Authorization";

    /**
     * 令牌黑名单前缀
     * 存储在Redis中的无效/过期令牌的键前缀
     */
    public static final String TOKEN_BLACKLIST_PREFIX = "token:blacklist:";

    /**
     * 用户令牌前缀
     * 存储在Redis中的用户有效令牌的键前缀
     * 格式：token:user:{userId}
     */
    public static final String USER_TOKEN_PREFIX = "token:user:";

    /**
     * Redis键分隔符
     * 在构建复合Redis键时使用的分隔符
     */
    public static final String REDIS_KEY_SEPARATOR = ":";

}
