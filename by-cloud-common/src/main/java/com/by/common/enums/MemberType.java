package com.by.common.enums;

/**
 * 枚举测试
 */
public enum MemberType {

    REGULAR {
        @Override
        public double applyDiscount(double price) {
            return price * 0.98; // 普通会员98折
        }
    },
    VIP {
        @Override
        public double applyDiscount(double price) {
            return price * 0.9; // VIP会员9折
        }
    },
    PREMIUM {
        @Override
        public double applyDiscount(double price) {
            return price * 0.8; // 高级会员8折
        }
    };

    public abstract double applyDiscount(double price);

}
