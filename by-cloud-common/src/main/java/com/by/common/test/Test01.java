package com.by.common.test;

import com.by.common.enums.MemberType;
import com.by.common.enums.OrderStatus;

/**
 * @author bandd
 * @date2026年01月28日16:30
 */
public class Test01 {

    public static void main(String[] args) {

        double originalPrice = 100.0;
        double vipPrice = MemberType.PREMIUM.applyDiscount(originalPrice);
        System.out.println("VIP会员价：" + vipPrice); // 输出：VIP会员价：90.0

        UserProfile user = new UserProfile("dev_user", "user@example.com");
        System.out.println(user.username()); // 直接调用，像方法一样
        System.out.println(user); // 自带了很好的toString()实现

        System.out.println(OrderStatus.CANCELLED.getDescription());
        System.out.println(OrderStatus.CANCELLED.getCode());


    }

    public record UserProfile(String username, String email) {}
}
