package com.by.common.utils;

import java.util.UUID;

/**
 * @author bandd
 * @date2025年05月08日15:09
 */

public class IdUtil {

    /**
     * 唯一id策略
     */
    public static String getUuid(){
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
}
