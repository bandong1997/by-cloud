package com.by.lesson02.service.impl;


import com.by.lesson02.config.JwtProperties;
import com.by.lesson02.entity.ByUser;
import com.by.lesson02.service.ByUserService;
import com.by.lesson02.service.TokenService;
import com.by.lesson02.utils.Constants;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * @author bandd
 * @date2026年02月28日10:25
 * Token 服务实现：JWT + Redis 存储
 */
@Service
public class TokenServiceImpl implements TokenService {


    @Autowired
    private JwtProperties jwtProperties;
    @Autowired
    private RedisTemplate<String, Object> redisTemplate;
    @Autowired
    private ByUserService byUserService;

    private SecretKey secretKey() {
        return Keys.hmacShaKeyFor(jwtProperties.getSecret().getBytes(StandardCharsets.UTF_8));
    }

    @Override
    public TokenPair createToken(ByUser user) {
        String userId = user.getUserId();
        long accessExpire = jwtProperties.getAccessTokenExpire();
        long refreshExpire = jwtProperties.getRefreshTokenExpire();

        String accessToken = buildJwt(userId, accessExpire);
        String refreshToken = UUID.randomUUID().toString();

        redisTemplate.opsForValue().set(Constants.REDIS_ACCESS_PREFIX + accessToken, userId, accessExpire, TimeUnit.SECONDS);
        redisTemplate.opsForValue().set(Constants.REDIS_REFRESH_PREFIX + refreshToken, userId, refreshExpire, TimeUnit.SECONDS);

        return new TokenPair(accessToken, refreshToken, accessExpire, refreshExpire);
    }

    /**
     * 构建一个用户的 JWT accessToken。
     *
     * @param userId        作为 JWT 的 subject（标识当前登录用户）
     * @param expireSeconds 过期时间，单位为「秒」，会转换为绝对过期时间写入 exp 字段
     * @return 已签名且带有过期时间的 JWT 字符串
     */
    private String buildJwt(String userId, long expireSeconds) {
        Date now = new Date();
        Date expiry = new Date(now.getTime() + expireSeconds * 1000);
        return Jwts.builder()
                .subject(userId)
                .issuedAt(now)
                .expiration(expiry)
                .signWith(secretKey())
                .compact();
    }

    @Override
    public String parseUserId(String token) {
        if (!StringUtils.hasText(token)) {
            return null;
        }
        try {
            Claims claims = Jwts.parser()
                    .verifyWith(secretKey())
                    .build()
                    .parseSignedClaims(token)
                    .getPayload();
            return claims.getSubject();
        } catch (ExpiredJwtException e) {
            return null;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public String validateAndGetUserId(String token) {
        String userId = parseUserId(token);
        if (userId == null) {
            return null;
        }
        Object stored = redisTemplate.opsForValue().get(Constants.REDIS_ACCESS_PREFIX + token);
        return stored != null ? stored.toString() : null;
    }

    @Override
    public TokenPair refreshToken(String refreshToken) {
        if (!StringUtils.hasText(refreshToken)) {
            return null;
        }
        Object userIdObj = redisTemplate.opsForValue().get(Constants.REDIS_REFRESH_PREFIX + refreshToken);
        if (userIdObj == null) {
            return null;
        }
        String userId = userIdObj.toString();
        ByUser user = byUserService.getById(userId);
        if (user == null) {
            redisTemplate.delete(Constants.REDIS_REFRESH_PREFIX + refreshToken);
            return null;
        }
        redisTemplate.delete(Constants.REDIS_REFRESH_PREFIX + refreshToken);
        return createToken(user);
    }

    @Override
    public void invalidate(String token) {
        if (StringUtils.hasText(token)) {
            redisTemplate.delete(Constants.REDIS_ACCESS_PREFIX + token);
        }
    }
}
