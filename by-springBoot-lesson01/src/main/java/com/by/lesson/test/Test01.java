package com.by.lesson.test;

import java.time.*;

/**
 * @author bandd
 * @date2025年11月28日15:08
 */
public class Test01 {
    public static void main(String[] args) {
        // 获取当前月份（Month枚举）
        Month currentMonth = LocalDate.now().getMonth();
        System.out.println("当前月份（枚举）: " + currentMonth);
        System.out.println("当前月份（英文）: " + currentMonth.name());
        System.out.println("当前月份（数值）: " + currentMonth.getValue());

        // 直接获取月份数值（1-12）
        int monthValue = LocalDate.now().getMonthValue();
        System.out.println("当前月份数值: " + monthValue);

        System.out.println("===============================");

        // 方法1: 使用 LocalDate
        LocalDate today = LocalDate.now();
        int year = today.getYear();
        int month = today.getMonthValue();
        System.out.println("当前年份: " + year);
        System.out.println("当前月份: " + month);
        System.out.println("当前年月: " + year + "-" + month);

        // 方法2: 使用 YearMonth 类
        YearMonth currentYearMonth = YearMonth.now();
        System.out.println("YearMonth: " + currentYearMonth);
        System.out.println("年份: " + currentYearMonth.getYear());
        System.out.println("月份: " + currentYearMonth.getMonthValue());

        System.out.println("===============================");

        String a = String.valueOf(LocalDateTime.of(year, 1, 1, 0, 0, 0));
        System.out.println(a);
        String b = String.valueOf(LocalDate.now().plusYears(1).withDayOfYear(1));
        System.out.println(b);


    }
}
