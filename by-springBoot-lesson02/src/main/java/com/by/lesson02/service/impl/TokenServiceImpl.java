package com.by.lesson02.service.impl;


import com.by.lesson02.config.JwtProperties;
import com.by.lesson02.entity.ByUser;
import com.by.lesson02.service.ByUserService;
import com.by.lesson02.service.TokenService;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
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

    private static final String REDIS_ACCESS_PREFIX = "login:access:";
    private static final String REDIS_REFRESH_PREFIX = "login:refresh:";

    private final JwtProperties jwtProperties;
    private final RedisTemplate<String, Object> redisTemplate;
    private final ByUserService byUserService;

    public TokenServiceImpl(JwtProperties jwtProperties,
                            RedisTemplate<String, Object> redisTemplate,
                            ByUserService byUserService) {
        this.jwtProperties = jwtProperties;
        this.redisTemplate = redisTemplate;
        this.byUserService = byUserService;
    }

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

        redisTemplate.opsForValue().set(REDIS_ACCESS_PREFIX + accessToken, userId, accessExpire, TimeUnit.SECONDS);
        redisTemplate.opsForValue().set(REDIS_REFRESH_PREFIX + refreshToken, userId, refreshExpire, TimeUnit.SECONDS);

        return new TokenPair(accessToken, refreshToken, accessExpire, refreshExpire);
    }

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
        Object stored = redisTemplate.opsForValue().get(REDIS_ACCESS_PREFIX + token);
        return stored != null ? stored.toString() : null;
    }

    @Override
    public TokenPair refreshToken(String refreshToken) {
        if (!StringUtils.hasText(refreshToken)) {
            return null;
        }
        Object userIdObj = redisTemplate.opsForValue().get(REDIS_REFRESH_PREFIX + refreshToken);
        if (userIdObj == null) {
            return null;
        }
        String userId = userIdObj.toString();
        ByUser user = byUserService.getById(userId);
        if (user == null) {
            redisTemplate.delete(REDIS_REFRESH_PREFIX + refreshToken);
            return null;
        }
        redisTemplate.delete(REDIS_REFRESH_PREFIX + refreshToken);
        return createToken(user);
    }

    @Override
    public void invalidate(String token) {
        if (StringUtils.hasText(token)) {
            redisTemplate.delete(REDIS_ACCESS_PREFIX + token);
        }
    }
}
