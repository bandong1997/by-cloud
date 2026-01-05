package com.by.common.utils.sm4;

import cn.hutool.core.util.HexUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.crypto.KeyUtil;
import cn.hutool.crypto.SmUtil;
import cn.hutool.crypto.symmetric.SM4;

import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.Base64;

/**
 * @author bandd
 * @date2026年01月05日11:16
 * 密钥管理工具类
 */
public class SM4KeyGenerator {

    /**
     * 生成随机SM4密钥
     * @return 16字节密钥
     */
    public static byte[] generateRandomKey() {
        // 方法1：使用Hutool工具
        return KeyUtil.generateKey("SM4").getEncoded();
    }

    /**
     * 生成随机SM4密钥
     * @return 16字节密钥
     */
    public static byte[] generateRandomKeyBySecureRandom() {
        SecureRandom secureRandom = new SecureRandom();
        byte[] key = new byte[16];
        secureRandom.nextBytes(key);
        return key;
    }

    /**
     * 将密钥保存为Base64字符串
     */
    public static String keyToBase64(byte[] key) {
        return Base64.getEncoder().encodeToString(key);
    }

    /**
     * 从Base64字符串恢复密钥
     */
    public static byte[] keyFromBase64(String base64Key) {
        return Base64.getDecoder().decode(base64Key);
    }

    /**
     * 使用密钥加密数据
     */
    public static String encrypt(String data, byte[] key) {
        SM4 sm4 = SmUtil.sm4(key);
        return sm4.encryptBase64(data);
    }

    /**
     * 使用密钥解密数据
     */
    public static String decrypt(String encryptedData, byte[] key) {
        SM4 sm4 = SmUtil.sm4(key);
        return sm4.decryptStr(encryptedData, StandardCharsets.UTF_8);
    }

    // 仅用于测试
    public static void main(String[] args) {

        // 0.需要加密的内容
        String data = "by123456";

        // 1.生成密钥
        byte[] sm4Key = SM4KeyGenerator.generateRandomKey();

        // 2.转换为Base64字符串（用于存储）
        String keyBase64 = SM4KeyGenerator.keyToBase64(sm4Key);
        System.out.println("密钥(Base64字符串): " + keyBase64);

        // 3. 如果要使用Base64字符串，必须先解码
        byte[] keyFromBase64 = SM4KeyGenerator.keyFromBase64(keyBase64);
        System.out.println("密钥(Base64解码): " + keyFromBase64);
        // 4. 使用解码后的密钥字节
        String encrypted = SM4KeyGenerator.encrypt(data, keyFromBase64);
        System.out.println("加密: " + encrypted);

        String decrypted = SM4KeyGenerator.decrypt(encrypted, keyFromBase64);
        System.out.println("解密: " + decrypted);
    }


}
