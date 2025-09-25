package com.by.common.utils.asc;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.security.SecureRandom;
import java.util.Base64;

/**
 * 加密解密工具类，提供AES和DES等对称加密算法的加密和解密功能
 */
public class CryptoUtil {

    // 算法类型常量
    public static final String AES = "AES";
    public static final String DES = "DES";
    
    // 默认加密模式和填充方式
    private static final String AES_TRANSFORMATION = "AES/ECB/PKCS5Padding";
    private static final String DES_TRANSFORMATION = "DES/ECB/PKCS5Padding";

    /**
     * 生成指定算法的密钥
     * @param algorithm 算法名称（AES或DES）
     * @param keySize 密钥大小（AES通常为128、192、256；DES为56）
     * @return Base64编码的密钥字符串
     */
    public static String generateKey(String algorithm, int keySize) {
        try {
            KeyGenerator keyGen = KeyGenerator.getInstance(algorithm);
            SecureRandom secureRandom = new SecureRandom();
            keyGen.init(keySize, secureRandom);
            SecretKey secretKey = keyGen.generateKey();
            return Base64.getEncoder().encodeToString(secretKey.getEncoded());
        } catch (Exception e) {
            throw new RuntimeException("生成密钥失败", e);
        }
    }

    /**
     * 生成AES密钥（默认128位）
     * @return Base64编码的AES密钥
     */
    public static String generateAESKey() {
        return generateKey(AES, 128);
    }

    /**
     * 生成DES密钥
     * @return Base64编码的DES密钥
     */
    public static String generateDESKey() {
        return generateKey(DES, 56);
    }

    /**
     * AES加密
     * @param data 要加密的数据
     * @param key Base64编码的AES密钥
     * @return Base64编码的加密结果
     */
    public static String aesEncrypt(String data, String key) {
        return encrypt(data, key, AES, AES_TRANSFORMATION);
    }

    /**
     * AES解密
     * @param encryptedData Base64编码的加密数据
     * @param key Base64编码的AES密钥
     * @return 解密后的原始数据
     */
    public static String aesDecrypt(String encryptedData, String key) {
        return decrypt(encryptedData, key, AES, AES_TRANSFORMATION);
    }

    /**
     * DES加密
     * @param data 要加密的数据
     * @param key Base64编码的DES密钥
     * @return Base64编码的加密结果
     */
    public static String desEncrypt(String data, String key) {
        return encrypt(data, key, DES, DES_TRANSFORMATION);
    }

    /**
     * DES解密
     * @param encryptedData Base64编码的加密数据
     * @param key Base64编码的DES密钥
     * @return 解密后的原始数据
     */
    public static String desDecrypt(String encryptedData, String key) {
        return decrypt(encryptedData, key, DES, DES_TRANSFORMATION);
    }

    /**
     * 通用加密方法
     * @param data 要加密的数据
     * @param keyStr Base64编码的密钥
     * @param algorithm 算法名称
     * @param transformation 加密模式和填充方式
     * @return Base64编码的加密结果
     */
    private static String encrypt(String data, String keyStr, String algorithm, String transformation) {
        try {
            // 解码Base64密钥
            byte[] keyBytes = Base64.getDecoder().decode(keyStr);
            SecretKeySpec key = new SecretKeySpec(keyBytes, algorithm);
            
            // 创建加密器并初始化
            Cipher cipher = Cipher.getInstance(transformation);
            cipher.init(Cipher.ENCRYPT_MODE, key);
            
            // 执行加密并返回Base64编码结果
            byte[] encryptedBytes = cipher.doFinal(data.getBytes());
            return Base64.getEncoder().encodeToString(encryptedBytes);
        } catch (Exception e) {
            throw new RuntimeException("加密失败", e);
        }
    }

    /**
     * 通用解密方法
     * @param encryptedData Base64编码的加密数据
     * @param keyStr Base64编码的密钥
     * @param algorithm 算法名称
     * @param transformation 加密模式和填充方式
     * @return 解密后的原始数据
     */
    private static String decrypt(String encryptedData, String keyStr, String algorithm, String transformation) {
        try {
            // 解码Base64密钥和加密数据
            byte[] keyBytes = Base64.getDecoder().decode(keyStr);
            byte[] encryptedBytes = Base64.getDecoder().decode(encryptedData);
            
            SecretKeySpec key = new SecretKeySpec(keyBytes, algorithm);
            
            // 创建解密器并初始化
            Cipher cipher = Cipher.getInstance(transformation);
            cipher.init(Cipher.DECRYPT_MODE, key);
            
            // 执行解密并返回原始数据
            byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
            return new String(decryptedBytes);
        } catch (Exception e) {
            throw new RuntimeException("解密失败", e);
        }
    }
}