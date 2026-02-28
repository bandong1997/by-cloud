package com.by.lesson02.utils;

import com.by.lesson02.entity.ByUser;

/**
 * @author bandd
 * @date2026年02月28日10:32
 * 当前登录用户上下文（ThreadLocal 工具类）
 * 在 JWT 过滤器中设置，业务中可随时获取当前用户
 */
public class UserContextHolder {

    private static final ThreadLocal<ByUser> USER_HOLDER = new ThreadLocal<>();

    private UserContextHolder() {
    }

    /**
     * 设置当前用户
     */
    public static void setUser(ByUser user) {
        USER_HOLDER.set(user);
    }

    /**
     * 获取当前用户
     *
     * @return 当前用户，未登录为 null
     */
    public static ByUser getUser() {
        return USER_HOLDER.get();
    }

    /**
     * 获取当前用户 ID
     *
     * @return 用户 ID，未登录为 null
     */
    public static String getUserId() {
        ByUser user = USER_HOLDER.get();
        return user == null ? null : user.getUserId();
    }

    /**
     * 获取当前用户名
     *
     * @return 用户名，未登录为 null
     */
    public static String getUsername() {
        ByUser user = USER_HOLDER.get();
        return user == null ? null : user.getUsername();
    }

    /**
     * 清除当前用户（请求结束时由过滤器调用）
     */
    public static void clear() {
        USER_HOLDER.remove();
    }
}
