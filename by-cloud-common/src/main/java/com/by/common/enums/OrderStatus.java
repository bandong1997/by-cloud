package com.by.common.enums;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum OrderStatus {

    // 枚举常量可以定义多个属性
    PENDING("待处理", 1),
    PROCESSING("处理中", 2),
    SHIPPED("已发货", 3),
    DELIVERED("已送达", 4),
    CANCELLED("已取消", 5);

    private final String description;
    private final int code;

}
