package com.by.common.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UserAgentUtils {
    /**
     * 获取浏览器信息（简化版）
     * @param userAgent 用户代理字符串
     * @return 浏览器名称
     */
    public static String getCurrentBrowser(String userAgent) {
        return getBrowser(userAgent);
    }

    /**
     * 获取浏览器版本信息（简化版）
     * @param userAgent 用户代理字符串
     * @return 浏览器版本
     */
    public static String getCurrentBrowserVersion(String userAgent) {
        return getBrowserVersion(userAgent);
    }

    /**
     * 获取浏览器和版本信息（组合版）
     * @param userAgent 用户代理字符串
     * @return 浏览器名称和版本，格式：浏览器名称 版本号
     */
    public static String getCurrentBrowserWithVersion(String userAgent) {
        return getBrowser(userAgent) + " " + getBrowserVersion(userAgent);
    }

    public static String getBrowser(String userAgent) {
        Pattern[] patterns = {
            Pattern.compile("MSIE\\s+(\\d+\\.\\d+)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("Trident/.*rv:(\\d+\\.\\d+)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("Firefox/(\\d+\\.\\d+)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("Edg/(\\d+\\.\\d+)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("Edge/(\\d+\\.\\d+)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("OPR/(\\d+\\.\\d+)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("Opera/(\\d+\\.\\d+)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("Chrome/(\\d+\\.\\d+)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("Safari/(\\d+\\.\\d+)", Pattern.CASE_INSENSITIVE)
        };

        String[] browsers = {
            "Internet Explorer",
            "Internet Explorer",
            "Firefox",
            "Edge",
            "Edge",
            "Opera",
            "Opera",
            "Chrome",
            "Safari"
        };

        for (int i = 0; i < patterns.length; i++) {
            Matcher matcher = patterns[i].matcher(userAgent);
            if (matcher.find()) {
                return browsers[i];
            }
        }
        return "Unknown";
    }

    public static String getBrowserVersion(String userAgent) {
        Pattern[] patterns = {
            Pattern.compile("MSIE\\s+(\\d+\\.\\d+)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("Trident/.*rv:(\\d+\\.\\d+)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("Firefox/(\\d+\\.\\d+)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("Edg/(\\d+\\.\\d+)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("Edge/(\\d+\\.\\d+)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("OPR/(\\d+\\.\\d+)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("Opera/(\\d+\\.\\d+)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("Chrome/(\\d+\\.\\d+)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("Safari/(\\d+\\.\\d+)", Pattern.CASE_INSENSITIVE)
        };

        for (Pattern pattern : patterns) {
            Matcher matcher = pattern.matcher(userAgent);
            if (matcher.find()) {
                return matcher.group(1);
            }
        }
        return "Unknown";
    }

    public static String getOperatingSystem(String userAgent) {
        Pattern[] patterns = {
            Pattern.compile("Windows NT (\\d+\\.\\d+)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("Macintosh.*Mac OS X (\\d+_\\d+(_\\d+)?)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("Linux", Pattern.CASE_INSENSITIVE),
            Pattern.compile("Android (\\d+\\.\\d+(_\\d+)?)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("iPhone.*like Mac OS X", Pattern.CASE_INSENSITIVE),
            Pattern.compile("iPad.*like Mac OS X", Pattern.CASE_INSENSITIVE)
        };

        String[] osNames = {
            "Windows",
            "Mac OS X",
            "Linux",
            "Android",
            "iOS",
            "iOS"
        };

        for (int i = 0; i < patterns.length; i++) {
            Matcher matcher = patterns[i].matcher(userAgent);
            if (matcher.find()) {
                return osNames[i];
            }
        }
        return "Unknown";
    }

    public static String getOperatingSystemVersion(String userAgent) {
        Pattern[] patterns = {
            Pattern.compile("Windows NT (\\d+\\.\\d+)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("Macintosh.*Mac OS X (\\d+_\\d+(_\\d+)?)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("Android (\\d+\\.\\d+(_\\d+)?)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("iPhone.*OS (\\d+_\\d+(_\\d+)?) like", Pattern.CASE_INSENSITIVE),
            Pattern.compile("iPad.*OS (\\d+_\\d+(_\\d+)?) like", Pattern.CASE_INSENSITIVE)
        };

        for (Pattern pattern : patterns) {
            Matcher matcher = pattern.matcher(userAgent);
            if (matcher.find()) {
                String version = matcher.group(1);
                return version.replace('_', '.');
            }
        }
        return "Unknown";
    }

    public static String getDeviceType(String userAgent) {
        if (userAgent.contains("Mobile")) {
            return "Mobile";
        } else if (userAgent.contains("Tablet") || userAgent.contains("iPad")) {
            return "Tablet";
        } else if (userAgent.contains("Desktop") || !userAgent.contains("Mobile") && !userAgent.contains("Tablet")) {
            return "Desktop";
        } else {
            return "Unknown";
        }
    }

    public static String getDeviceModel(String userAgent) {
        // 首先检查是否包含iPad或iPhone
        if (userAgent.contains("iPad")) {
            return "iPad";
        } else if (userAgent.contains("iPhone")) {
            return "iPhone";
        } else if (userAgent.contains("Windows")) {
            return "Windows";
        } else if (userAgent.contains("Mac OS")) {
            return "Mac OS";
        }
        
        // 然后检查Android设备
        Pattern androidPattern = Pattern.compile("Android.*;\\s*(\\w+)\\s*Build/", Pattern.CASE_INSENSITIVE);
        Matcher androidMatcher = androidPattern.matcher(userAgent);
        if (androidMatcher.find() && androidMatcher.groupCount() > 0 && androidMatcher.group(1) != null) {
            return androidMatcher.group(1);
        }
        
        return "Unknown";
    }
}