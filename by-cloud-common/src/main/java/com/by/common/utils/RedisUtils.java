package com.by.common.utils;


import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

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
