package com.by.upms.utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * JWT工具类
 * 提供JWT令牌的生成、解析和验证功能
 */
@Component
public class JwtUtils {
    
    @Value("${jwt.secret}")
    private String secret;
    
    @Value("${jwt.expiration}")
    private Long expiration;

    /**
     * 生成token
     * @param userId 用户ID
     * @param username 用户名
     * @return JWT令牌字符串
     */
    public String generateToken(Long userId, String username) {
        Map<String, Object> claims = new HashMap<>();
        claims.put("userId", userId);
        claims.put("username", username);

        return Jwts.builder()
                .setClaims(claims)
                .setSubject(username)
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + expiration))
                .signWith(getSignInKey(), SignatureAlgorithm.HS256)
                .compact();
    }

    /**
     * 解析token
     * @param token JWT令牌字符串
     * @return 令牌中的声明信息
     */
    public Claims getClaimsByToken(String token) {
        try {
            return Jwts.parser()
                    .setSigningKey(getSignInKey())
                    .parseClaimsJws(token)
                    .getBody();
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 创建用于签名的密钥对象
     * @return SecretKey对象
     */
    private SecretKey getSignInKey() {
        // 确保密钥长度至少为256位（32字节）
        byte[] keyBytes = secret.getBytes();
        if (keyBytes.length < 32) {
            // 密钥长度不足时进行填充
            byte[] paddedKeyBytes = new byte[32];
            System.arraycopy(keyBytes, 0, paddedKeyBytes, 0, keyBytes.length);
            keyBytes = paddedKeyBytes;
        }
        return Keys.hmacShaKeyFor(keyBytes);
    }

    
    /**
     * token是否过期
     * @param claims 令牌中的声明信息
     * @return true:已过期 false:未过期
     */
    public boolean isTokenExpired(Claims claims) {
        return claims.getExpiration().before(new Date());
    }
    
    /**
     * 获取用户ID
     * @param token JWT令牌字符串
     * @return 用户ID
     */
    public Long getUserIdFromToken(String token) {
        Claims claims = getClaimsByToken(token);
        if (claims != null) {
            return Long.parseLong(claims.get("userId").toString());
        }
        return null;
    }
    
    /**
     * 获取用户名
     * @param token JWT令牌字符串
     * @return 用户名
     */
    public String getUsernameFromToken(String token) {
        Claims claims = getClaimsByToken(token);
        if (claims != null) {
            return claims.get("username").toString();
        }
        return null;
    }


    /**
     * 验证token是否有效
     * @param token JWT令牌字符串
     * @return true:有效 false:无效
     */
    public boolean validateToken(String token) {
        try {
            Claims claims = getClaimsByToken(token);
            return claims != null && !isTokenExpired(claims);
        } catch (Exception e) {
            return false;
        }
    }

}