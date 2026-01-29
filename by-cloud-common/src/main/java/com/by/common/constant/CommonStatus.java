package com.by.common.constant;


/**
 * @author: 班东东
 * @Time: 2025/8/27 21:02
 * @description: 通用常量类
 */
public class CommonStatus {
    

    /**
     * 合同状态：DRAFT(草稿)
     */
    public static final Integer DRAFT = 1;
    /**
     * 合同状态：PENDING(待审核)
     */
    public static final Integer PENDING = 2;
    /**
     * 合同状态：APPROVED(已审核)
     */
    public static final Integer APPROVED = 3;


    /**
     * 禁用
     */
    public static final Integer INACTIVE = 0;


    /**
     * 活跃/正常
     */
    public static final Integer ACTIVE = 1;

    /**
     * 锁定
     */
    public static final Integer LOCKED = 2;


}
