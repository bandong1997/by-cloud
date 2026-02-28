package com.by.lesson02.service;

import com.by.lesson02.entity.ByUser;

/**
 * @author bandd
 * @date2026年02月28日10:24
 */
public interface TokenService {

    /**
     * 为用户生成 Token，并存入 Redis
     *
     * @param user 用户信息
     * @return accessToken 与 refreshToken
     */
    TokenPair createToken(ByUser user);

    /**
     * 从请求头或 Token 字符串解析出用户 ID（不校验 Redis，仅校验 JWT 签名与过期）
     *
     * @param token Token 字符串
     * @return 用户 ID，无效或过期返回 null
     */
    String parseUserId(String token);

    /**
     * 校验 Token 是否有效：JWT 有效且在 Redis 中存在
     *
     * @param token Token 字符串
     * @return 用户 ID，无效返回 null
     */
    String validateAndGetUserId(String token);

    /**
     * 使用 refreshToken 刷新，返回新的 Token 对
     *
     * @param refreshToken 刷新 Token
     * @return 新的 Token 对，失败返回 null
     */
    TokenPair refreshToken(String refreshToken);

    /**
     * 退出登录：使当前 Token 失效（从 Redis 移除）
     *
     * @param token 当前 accessToken
     */
    void invalidate(String token);

    /**
     * Token 对
     */
    record TokenPair(String accessToken, String refreshToken, long accessExpireSeconds, long refreshExpireSeconds) {}

}
