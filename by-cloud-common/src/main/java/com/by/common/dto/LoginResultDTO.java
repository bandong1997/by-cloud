package com.by.common.dto;

import lombok.Data;

@Data
public class LoginResultDTO {
    /**
     * 用户登录后获取的JWT令牌
     * 用于后续API请求的身份认证
     */
    private String token;

    /**
     * 用户名
     * 用户的登录账号
     */
    private String username;

    /**
     * 用户昵称
     * 用户的显示名称
     */
    private String nickname;

    /**
     * 令牌过期时间戳
     * 表示JWT令牌的失效时间，单位为毫秒
     */
    private Long expireTime;
}