package com.by.lesson.utils;

import cn.hutool.core.util.HexUtil;
import cn.hutool.crypto.SmUtil;
import cn.hutool.crypto.symmetric.SM4;
import cn.hutool.crypto.symmetric.SymmetricCrypto;

import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.Base64;


/**
 * @author bandd
 * @date2026年01月05日10:58
 * 国密4
 */
public class Sm4Test {

    public static void main(String[] args) {

        String sm4Key="ituzhi.com,micro";
        String data="123456";

        SM4 sm4 = SmUtil.sm4(sm4Key.getBytes());
        String encrypted = sm4.encryptBase64(data);
        System.out.println("加密:"+encrypted);

        SymmetricCrypto sm44 = SmUtil.sm4(sm4Key.getBytes());
        byte[] decrypted = sm44.decrypt(encrypted);
        // 将字节数组转换为字符串
        String decryptedString = new String(decrypted, StandardCharsets.UTF_8);
        System.out.println("解密:"+decryptedString);
    }
}
