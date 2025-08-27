package com.by.upms.utils;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.Collection;
import java.util.concurrent.TimeUnit;

/**
 * @author: 班东东
 * @Time: 2025/8/27 22:05
 * @description:
 */
@Component
public class RedisUtils {

    @Value("${jwt.secret}")
    private String redisKeyPrefix;

    @Value("${jwt.expiration}")
    private Long expiration;



    @Autowired
    private RedisTemplate<String, Object> redisTemplate;



    // 存储token到redis
    public void setToken(String username, String token) {
        String key = redisKeyPrefix + username;
        redisTemplate.opsForValue().set(key, token, expiration, TimeUnit.MILLISECONDS);
    }

    // 从redis获取token
    public String getToken(String username) {
        String key = redisKeyPrefix + username;
        return (String) redisTemplate.opsForValue().get(key);
    }

    // 删除redis中的token
    public void deleteToken(String username) {
        String key = redisKeyPrefix + username;
        redisTemplate.delete(key);
    }

    // 检查token是否存在于redis
    public boolean hasToken(String username, String token) {
        String storedToken = getToken(username);
        return storedToken != null && storedToken.equals(token);
    }


    /**
     * 设置值
     */
    public void set(String key, Object value) {
        redisTemplate.opsForValue().set(key, value);
    }

    /**
     * 设置值并设置过期时间
     */
    public void set(String key, Object value, long time) {
        if (time > 0) {
            redisTemplate.opsForValue().set(key, value, time, TimeUnit.SECONDS);
        } else {
            set(key, value);
        }
    }

    /**
     * 获取值
     */
    public Object get(String key) {
        Object o = redisTemplate.opsForValue().get(key);

        return key == null ? null : redisTemplate.opsForValue().get(key);
    }

    /**
     * 删除键
     */
    public boolean delete(String key) {
        return key != null && redisTemplate.delete(key);
    }

    /**
     * 批量删除键
     */
    public void deleteBatch(String... keys) {
        if (keys != null && keys.length > 0) {
            redisTemplate.delete((Collection<String>) CollectionUtils.arrayToList(keys));
        }
    }

    /**
     * 设置过期时间
     */
    public boolean expire(String key, long time) {
        return time > 0 && redisTemplate.expire(key, time, TimeUnit.SECONDS);
    }

    /**
     * 获取过期时间
     */
    public long getExpire(String key) {
        Long expire = redisTemplate.getExpire(key, TimeUnit.SECONDS);
        return expire != null ? expire : 0;
    }

}
