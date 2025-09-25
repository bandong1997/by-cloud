package com.by.common.utils.asc;

/**
 * 加密解密工具类的测试类，用于演示和验证CryptoUtil的加密和解密功能
 */
public class CryptoTest {

    public static void main(String[] args) {
        // 测试AES加密和解密
        testAESEncryption();
        
        // 测试DES加密和解密
        testDESEncryption();
        
        // 测试不同长度的密钥生成
        testKeyGeneration();
    }
    
    private static void testAESEncryption() {
        System.out.println("===== 测试AES加密和解密功能 =====");
        
        // 生成AES密钥
        String aesKey = CryptoUtil.generateAESKey();
        System.out.println("生成的AES密钥: " + aesKey);
        
        // 测试数据
        String originalData = "这是一个测试AES加密和解密功能的字符串，包含中文和英文。";
        System.out.println("原始数据: " + originalData);
        
        // 执行AES加密
        String encryptedData = CryptoUtil.aesEncrypt(originalData, aesKey);
        System.out.println("AES加密后: " + encryptedData);
        
        // 执行AES解密
        String decryptedData = CryptoUtil.aesDecrypt(encryptedData, aesKey);
        System.out.println("AES解密后: " + decryptedData);
        
        // 验证解密结果是否与原始数据一致
        boolean isMatch = originalData.equals(decryptedData);
        System.out.println("解密结果与原始数据是否一致: " + isMatch);
        System.out.println();
    }
    
    private static void testDESEncryption() {
        System.out.println("===== 测试DES加密和解密功能 =====");
        
        // 生成DES密钥
        String desKey = CryptoUtil.generateDESKey();
        System.out.println("生成的DES密钥: " + desKey);
        
        // 测试数据
        String originalData = "这是一个测试DES加密和解密功能的字符串，包含中文和英文。";
        System.out.println("原始数据: " + originalData);
        
        // 执行DES加密
        String encryptedData = CryptoUtil.desEncrypt(originalData, desKey);
        System.out.println("DES加密后: " + encryptedData);
        
        // 执行DES解密
        String decryptedData = CryptoUtil.desDecrypt(encryptedData, desKey);
        System.out.println("DES解密后: " + decryptedData);
        
        // 验证解密结果是否与原始数据一致
        boolean isMatch = originalData.equals(decryptedData);
        System.out.println("解密结果与原始数据是否一致: " + isMatch);
        System.out.println();
    }
    
    private static void testKeyGeneration() {
        System.out.println("===== 测试不同长度的密钥生成 =====");
        
        // 生成不同长度的AES密钥
        String aesKey128 = CryptoUtil.generateKey(CryptoUtil.AES, 128);
        String aesKey256 = CryptoUtil.generateKey(CryptoUtil.AES, 256);
        
        System.out.println("128位AES密钥长度: " + aesKey128.length() + " 字符");
        System.out.println("256位AES密钥长度: " + aesKey256.length() + " 字符");
        
        // 生成DES密钥
        String desKey = CryptoUtil.generateDESKey();
        System.out.println("DES密钥长度: " + desKey.length() + " 字符");
        System.out.println();
        
        // 测试密钥的唯一性
        String anotherAesKey = CryptoUtil.generateAESKey();
        System.out.println("两次生成的AES密钥是否相同: " + aesKey128.equals(anotherAesKey));
        System.out.println();
    }
}