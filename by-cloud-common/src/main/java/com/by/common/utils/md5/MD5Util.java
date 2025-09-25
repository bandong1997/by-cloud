package com.by.common.utils.md5;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

/**
 * MD5工具类，提供MD5加密和验证功能
 * 注意：MD5是单向哈希算法，无法被解密，只能进行加密和验证
 */
public class MD5Util {

    /**
     * 生成字符串的MD5哈希值
     * @param input 输入字符串
     * @return MD5哈希值的十六进制字符串表示
     */
    public static String encrypt(String input) {
        if (input == null) {
            return null;
        }
        try {
            // 获取MD5算法实例
            MessageDigest md = MessageDigest.getInstance("MD5");
            // 计算输入字符串的哈希值
            byte[] hashBytes = md.digest(input.getBytes());
            // 将字节数组转换为十六进制字符串
            StringBuilder sb = new StringBuilder();
            for (byte b : hashBytes) {
                String hex = Integer.toHexString(0xFF & b);
                if (hex.length() == 1) {
                    sb.append('0');
                }
                sb.append(hex);
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            // 这种情况理论上不会发生，因为MD5算法是Java标准库的一部分
            throw new RuntimeException("MD5 algorithm not found", e);
        }
    }

    /**
     * 验证输入字符串与MD5哈希值是否匹配
     * @param input 输入字符串
     * @param md5Hash MD5哈希值
     * @return 如果匹配返回true，否则返回false
     */
    public static boolean verify(String input, String md5Hash) {
        if (input == null || md5Hash == null) {
            return false;
        }
        // 计算输入字符串的MD5哈希值并与提供的哈希值比较
        String calculatedHash = encrypt(input);
        return calculatedHash.equalsIgnoreCase(md5Hash);
    }

    /**
     * 生成带盐的MD5哈希值，提高安全性
     * @param input 输入字符串
     * @param salt 盐值
     * @return 带盐的MD5哈希值
     */
    public static String encryptWithSalt(String input, String salt) {
        // 将盐值添加到输入字符串中
        String saltedInput = input + salt;
        // 对加盐后的字符串进行MD5加密
        return encrypt(saltedInput);
    }

    /**
     * 验证带盐的输入字符串与MD5哈希值是否匹配
     * @param input 输入字符串
     * @param salt 盐值
     * @param md5Hash MD5哈希值
     * @return 如果匹配返回true，否则返回false
     */
    public static boolean verifyWithSalt(String input, String salt, String md5Hash) {
        // 计算加盐后的MD5哈希值并与提供的哈希值比较
        String calculatedHash = encryptWithSalt(input, salt);
        return calculatedHash.equalsIgnoreCase(md5Hash);
    }
}