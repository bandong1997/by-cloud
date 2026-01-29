package com.by.common.utils;

public class MainTest {
    public static void main(String[] args) {
        System.out.println("=== IP信息测试 ===");
        
        // 测试本地IP地址获取
        String localIp = IpUtils.getLocalIpAddress();
        System.out.println("本地IP地址: " + localIp);
        
        // 测试IP版本判断
        String ipVersion = IpUtils.getIpVersion(localIp);
        System.out.println("IP版本: " + ipVersion);
        
        // 测试IP归属地查询
        String ipLocation = IpLocationUtils.getIpLocation(localIp);
        System.out.println("IP归属地: " + ipLocation);
        
        System.out.println("\n=== 用户代理信息测试 ===");
        
        // 如果命令行参数中提供了用户代理字符串，则测试该字符串
        String[] args1 = {String.valueOf("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36")};
        if (args1.length > 0) {
            System.out.println("\n--- 命令行提供的用户代理 ---\n");
            for (int i = 0; i < args1.length; i++) {
                testUserAgent(args1[i], "命令行参数 " + (i + 1));
            }
        } else {
            // 测试Chrome浏览器的用户代理（2026年真实版本）
            String chromeUserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.7680.100 Safari/537.36";
            testUserAgent(chromeUserAgent, "Chrome浏览器");
            
            // 测试Firefox浏览器的用户代理（2026年真实版本）
            String firefoxUserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:145.0) Gecko/20100101 Firefox/145.0";
            testUserAgent(firefoxUserAgent, "Firefox浏览器");
            
            // 测试Safari浏览器的用户代理（2026年真实版本）
            String safariUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 15_0) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0 Safari/605.1.15";
            testUserAgent(safariUserAgent, "Safari浏览器");
            
            // 测试移动设备的用户代理（2026年真实版本）
            String mobileUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 19_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0 Mobile/15E148 Safari/604.1";
            testUserAgent(mobileUserAgent, "iPhone移动设备");
            
            // 测试平板设备的用户代理（2026年真实版本）
            String tabletUserAgent = "Mozilla/5.0 (iPad; CPU iPhone OS 19_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0 Mobile/15E148 Safari/604.1";
            testUserAgent(tabletUserAgent, "iPad平板设备");
            
            // 测试Edge浏览器的用户代理（2026年真实版本）
            String edgeUserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.7680.100 Safari/537.36 Edg/150.0.1000.50";
            testUserAgent(edgeUserAgent, "Edge浏览器");
            
            // 测试Opera浏览器的用户代理（2026年真实版本）
            String operaUserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.7680.100 Safari/537.36 OPR/135.0.6950.50";
            testUserAgent(operaUserAgent, "Opera浏览器");
        }
        
        System.out.println("\n=== 如何使用实际浏览器的用户代理 ===");
        System.out.println("1. 在浏览器中打开开发者工具（F12）");
        System.out.println("2. 切换到Console选项卡");
        System.out.println("3. 输入：navigator.userAgent 并按回车");
        System.out.println("4. 复制输出的用户代理字符串");
        System.out.println("5. 运行命令：java -cp src/main/java com.iputils.MainTest '用户代理字符串'");
        System.out.println("\n例如：");
        System.out.println("java -cp src/main/java com.iputils.MainTest 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.7680.100 Safari/537.36'");
    }
    
    private static void testUserAgent(String userAgent, String testName) {
        System.out.println("\n--- " + testName + " ---");
        System.out.println("用户代理: " + userAgent);
        System.out.println("浏览器: " + UserAgentUtils.getBrowser(userAgent));
        System.out.println("浏览器版本: " + UserAgentUtils.getBrowserVersion(userAgent));
        System.out.println("操作系统: " + UserAgentUtils.getOperatingSystem(userAgent));
        System.out.println("操作系统版本: " + UserAgentUtils.getOperatingSystemVersion(userAgent));
        System.out.println("设备类型: " + UserAgentUtils.getDeviceType(userAgent));
        System.out.println("设备型号: " + UserAgentUtils.getDeviceModel(userAgent));
    }
}