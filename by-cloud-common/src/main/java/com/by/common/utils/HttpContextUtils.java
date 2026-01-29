package com.by.common.utils;


/**
 * @author: 班东东
 * @Time: 2026/1/29 22:26
 * @description:
 */
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Optional;

/**
 * HTTP请求响应工具类
 * 用于在非Controller层获取当前请求和响应对象
 */
public class HttpContextUtils {

    private HttpContextUtils() {
        throw new UnsupportedOperationException("工具类不允许实例化");
    }

    /**
     * 获取当前HTTP请求对象
     * @return HttpServletRequest，如果不在Web上下文则返回null
     */
    public static HttpServletRequest getHttpServletRequest() {
        try {
            RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
            if (requestAttributes instanceof ServletRequestAttributes) {
                return ((ServletRequestAttributes) requestAttributes).getRequest();
            }
            return null;
        } catch (Exception e) {
            // 日志记录（根据实际情况添加日志框架）
            // log.warn("获取HttpServletRequest失败: {}", e.getMessage());
            return null;
        }
    }

    /**
     * 获取当前HTTP请求对象（Optional包装）
     * @return Optional<HttpServletRequest>
     */
    public static Optional<HttpServletRequest> getHttpServletRequestOptional() {
        return Optional.ofNullable(getHttpServletRequest());
    }

    /**
     * 获取当前HTTP响应对象
     * @return HttpServletResponse，如果不在Web上下文则返回null
     */
    public static HttpServletResponse getHttpServletResponse() {
        try {
            RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
            if (requestAttributes instanceof ServletRequestAttributes) {
                return ((ServletRequestAttributes) requestAttributes).getResponse();
            }
            return null;
        } catch (Exception e) {
            // log.warn("获取HttpServletResponse失败: {}", e.getMessage());
            return null;
        }
    }

    /**
     * 获取当前HTTP响应对象（Optional包装）
     * @return Optional<HttpServletResponse>
     */
    public static Optional<HttpServletResponse> getHttpServletResponseOptional() {
        return Optional.ofNullable(getHttpServletResponse());
    }

    /**
     * 获取当前请求属性
     * @return ServletRequestAttributes，如果不在Web上下文则返回null
     */
    public static ServletRequestAttributes getServletRequestAttributes() {
        try {
            RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
            if (requestAttributes instanceof ServletRequestAttributes) {
                return (ServletRequestAttributes) requestAttributes;
            }
            return null;
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 获取请求IP地址
     * @return IP地址，如果获取失败返回空字符串
     */
    public static String getRequestIp() {
        HttpServletRequest request = getHttpServletRequest();
        if (request == null) {
            return "";
        }

        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }

        // 多个代理时，第一个IP为真实IP
        if (ip != null && ip.contains(",")) {
            ip = ip.split(",")[0].trim();
        }

        return ip == null ? "" : ip;
    }

    /**
     * 获取请求URL
     * @return 完整的请求URL
     */
    public static String getRequestUrl() {
        HttpServletRequest request = getHttpServletRequest();
        if (request == null) {
            return "";
        }
        return request.getRequestURL().toString();
    }

    /**
     * 获取请求URI
     * @return 请求URI
     */
    public static String getRequestUri() {
        HttpServletRequest request = getHttpServletRequest();
        if (request == null) {
            return "";
        }
        return request.getRequestURI();
    }

    /**
     * 获取请求方法
     * @return GET, POST, PUT, DELETE等
     */
    public static String getRequestMethod() {
        HttpServletRequest request = getHttpServletRequest();
        if (request == null) {
            return "";
        }
        return request.getMethod();
    }

    /**
     * 获取请求头值
     * @param headerName 请求头名称
     * @return 请求头值，不存在返回空字符串
     */
    public static String getHeader(String headerName) {
        HttpServletRequest request = getHttpServletRequest();
        if (request == null) {
            return "";
        }
        String value = request.getHeader(headerName);
        return value == null ? "" : value;
    }

    /**
     * 获取请求参数值
     * @param paramName 参数名
     * @return 参数值，不存在返回空字符串
     */
    public static String getParameter(String paramName) {
        HttpServletRequest request = getHttpServletRequest();
        if (request == null) {
            return "";
        }
        String value = request.getParameter(paramName);
        return value == null ? "" : value;
    }

    /**
     * 获取请求上下文路径
     * @return 上下文路径
     */
    public static String getContextPath() {
        HttpServletRequest request = getHttpServletRequest();
        if (request == null) {
            return "";
        }
        return request.getContextPath();
    }

    /**
     * 检查当前是否在Web请求上下文中
     * @return 如果在Web请求上下文中返回true
     */
    public static boolean isInWebRequest() {
        return getHttpServletRequest() != null;
    }

    /**
     * 安全地设置响应头（如果响应对象存在）
     * @param name 响应头名称
     * @param value 响应头值
     */
    public static void setResponseHeader(String name, String value) {
        getHttpServletResponseOptional().ifPresent(response -> {
            response.setHeader(name, value);
        });
    }

    /**
     * 安全地设置响应状态码（如果响应对象存在）
     * @param statusCode 状态码
     */
    public static void setResponseStatus(int statusCode) {
        getHttpServletResponseOptional().ifPresent(response -> {
            response.setStatus(statusCode);
        });
    }
}