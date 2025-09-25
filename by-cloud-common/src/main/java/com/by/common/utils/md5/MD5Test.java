package com.by.common.utils.md5;

/**
 * MD5工具类的测试类，用于演示和验证MD5加密功能
 */
public class MD5Test {

    public static void main(String[] args) {
        // 测试基本的MD5加密功能
        testBasicEncrypt();
        
        // 测试带盐的MD5加密功能
        testSaltEncrypt();
        
        // 测试验证功能
        testVerification();
    }
    
    private static void testBasicEncrypt() {
        System.out.println("===== 测试基本的MD5加密功能 =====");
        
        // 测试简单字符串
        String test1 = "Hello World";
        String md5Test1 = MD5Util.encrypt(test1);
        System.out.println("原始字符串: " + test1);
        System.out.println("MD5加密结果: " + md5Test1);
        System.out.println();
        
        // 测试空字符串
        String test2 = "";
        String md5Test2 = MD5Util.encrypt(test2);
        System.out.println("原始字符串: 空字符串");
        System.out.println("MD5加密结果: " + md5Test2);
        System.out.println();
        
        // 测试较长的字符串
        String test3 = "这是一个用于测试MD5加密功能的较长的字符串，包含中文和英文。";
        String md5Test3 = MD5Util.encrypt(test3);
        System.out.println("原始字符串: " + test3);
        System.out.println("MD5加密结果: " + md5Test3);
        System.out.println();
    }
    
    private static void testSaltEncrypt() {
        System.out.println("===== 测试带盐的MD5加密功能 =====");
        
        String password = "mySecretPassword123";
        String salt = "randomSaltValue";
        
        // 对密码进行加盐加密
        String md5WithSalt = MD5Util.encryptWithSalt(password, salt);
        
        System.out.println("原始密码: " + password);
        System.out.println("盐值: " + salt);
        System.out.println("加盐MD5加密结果: " + md5WithSalt);
        
        // 即使相同的密码，使用不同的盐值也会产生不同的MD5哈希值
        String anotherSalt = "differentSaltValue";
        String md5WithAnotherSalt = MD5Util.encryptWithSalt(password, anotherSalt);
        
        System.out.println("使用不同盐值的MD5加密结果: " + md5WithAnotherSalt);
        System.out.println("两次加密结果是否相同: " + md5WithSalt.equals(md5WithAnotherSalt));
        System.out.println();
    }
    
    private static void testVerification() {
        System.out.println("===== 测试验证功能 =====");
        
        // 测试基本验证
        String original = "testVerification123";
        String hash = MD5Util.encrypt(original);
        
        boolean isVerified = MD5Util.verify(original, hash);
        System.out.println("验证正确的原始字符串: " + isVerified);
        
        // 测试错误的验证
        boolean isVerifiedWrong = MD5Util.verify("wrongString", hash);
        System.out.println("验证错误的原始字符串: " + isVerifiedWrong);
        
        // 测试加盐验证
        String password = "securePassword456";
        String salt = "uniqueSalt789";
        String saltedHash = MD5Util.encryptWithSalt(password, salt);
        
        boolean isSaltedVerified = MD5Util.verifyWithSalt(password, salt, saltedHash);
        System.out.println("验证正确的加盐密码: " + isSaltedVerified);
        
        // 测试错误的加盐验证
        boolean isSaltedVerifiedWrong = MD5Util.verifyWithSalt("wrongPassword", salt, saltedHash);
        System.out.println("验证错误的加盐密码: " + isSaltedVerifiedWrong);
        System.out.println();
    }
}