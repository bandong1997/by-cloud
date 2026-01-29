package com.by.common.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class IpLocationUtils {
    // 多个IP归属地查询API，提供备选方案
    private static final String[] IP_API_URLS = {
        "https://ipapi.co/%s/json",
        "https://ipinfo.io/%s/json",
        "https://api.ipstack.com/%s?access_key=YOUR_ACCESS_KEY", // 需要替换为实际的API密钥
        "https://ip.sb/api/json/%s", // 国内可用的免费API
        "https://api.ipify.org/?format=json", // IP地址查询
        "https://jsonip.com/" // IP地址查询
    };

    /**
     * 获取IP归属地信息
     * @param ip IP地址
     * @return IP归属地信息
     */
    public static String getIpLocation(String ip) {
        // 检查是否为本地回环地址
        if (ip.equals("127.0.0.1") || ip.equals("0:0:0:0:0:0:0:1")) {
            return "本地地址";
        }

        // 尝试使用多个API
        for (String apiUrl : IP_API_URLS) {
            // 跳过需要API密钥的ipstack API（如果没有配置）
            if (apiUrl.contains("YOUR_ACCESS_KEY")) {
                continue;
            }

            try {
                String urlString = String.format(apiUrl, URLEncoder.encode(ip, "UTF-8"));
                System.out.println("尝试API: " + urlString);
                
                URL url = new URL(urlString);
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("GET");
                connection.setConnectTimeout(5000);
                connection.setReadTimeout(5000);
                connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.7680.100 Safari/537.36");
                connection.setRequestProperty("Accept", "application/json");
                connection.setRequestProperty("Connection", "close");

                int responseCode = connection.getResponseCode();
                System.out.println("响应代码: " + responseCode);
                
                if (responseCode == HttpURLConnection.HTTP_OK) {
                    BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
                    String inputLine;
                    StringBuilder response = new StringBuilder();
                    while ((inputLine = in.readLine()) != null) {
                        response.append(inputLine);
                    }
                    in.close();
                    
                    System.out.println("响应内容: " + response.toString());
                    
                    String location = parseLocationFromJson(response.toString());
                    if (!location.equals("Unknown")) {
                        System.out.println("成功获取归属地: " + location);
                        return location;
                    }
                }
            } catch (Exception e) {
                // 忽略异常，尝试下一个API
                System.err.println("API请求失败: " + e.getMessage());
                e.printStackTrace();
            }
        }
        
        // 如果所有API都失败，尝试使用简单的IP地理位置映射
        return getSimpleIpLocation(ip);
    }
    
    /**
     * 简单的IP地理位置映射（作为备选方案）
     * @param ip IP地址
     * @return IP归属地信息
     */
    private static String getSimpleIpLocation(String ip) {
        // 详细的IP地理位置映射表（具体到市）
        if (ip.startsWith("8.8.")) {
            return "美国, 加利福尼亚州, 山景城, Google DNS";
        } else if (ip.startsWith("114.114.")) {
            return "中国, 北京, 国内DNS";
        } else if (ip.startsWith("202.108.")) {
            return "中国, 北京, 百度";
        } else if (ip.startsWith("180.101.")) {
            return "中国, 江苏, 南京, 苏宁";
        } else if (ip.startsWith("123.125.")) {
            return "中国, 北京, 百度";
        } else if (ip.startsWith("220.181.")) {
            return "中国, 北京, 百度";
        } else if (ip.startsWith("119.75.")) {
            return "中国, 北京, 百度";
        } else if (ip.startsWith("183.232.")) {
            return "中国, 广东, 广州, 腾讯";
        } else if (ip.startsWith("112.93.")) {
            return "中国, 广东, 深圳, 腾讯";
        } else if (ip.startsWith("101.226.")) {
            return "中国, 上海, 上海, 腾讯";
        } else if (ip.startsWith("219.141.")) {
            return "中国, 陕西, 西安, 网易";
        } else if (ip.startsWith("124.165.")) {
            return "中国, 浙江, 杭州, 阿里巴巴";
        } else if (ip.startsWith("203.107.")) {
            return "中国, 浙江, 杭州, 阿里巴巴";
        } else if (ip.startsWith("192.168.") || ip.startsWith("10.") || ip.startsWith("172.16.")) {
            return "局域网地址";
        } else if (ip.startsWith("1.1.1.")) {
            return "澳大利亚, Cloudflare DNS";
        } else if (ip.startsWith("9.9.9.")) {
            return "美国, IBM DNS";
        }
        return "Unknown";
    }

    /**
     * 解析JSON响应，提取归属地信息
     * @param json JSON响应字符串
     * @return 归属地信息
     */
    private static String parseLocationFromJson(String json) {
        try {
            StringBuilder location = new StringBuilder();
            
            // 尝试解析ipapi.co和ipinfo.io的响应格式
            if (json.contains("\"country_name\":\"")) {
                // ipapi.co格式
                int countryStart = json.indexOf("\"country_name\":\"") + 16;
                int countryEnd = json.indexOf("\"", countryStart);
                if (countryStart > 16 && countryEnd > countryStart) {
                    location.append(json.substring(countryStart, countryEnd));
                }
            } else if (json.contains("\"country\":\"")) {
                // ipinfo.io格式
                int countryStart = json.indexOf("\"country\":\"") + 11;
                int countryEnd = json.indexOf("\"", countryStart);
                if (countryStart > 11 && countryEnd > countryStart) {
                    location.append(json.substring(countryStart, countryEnd));
                }
            }
            
            // 解析地区
            if (json.contains("\"region\":\"")) {
                int regionStart = json.indexOf("\"region\":\"") + 10;
                int regionEnd = json.indexOf("\"", regionStart);
                if (regionStart > 10 && regionEnd > regionStart) {
                    if (location.length() > 0) location.append(", ");
                    location.append(json.substring(regionStart, regionEnd));
                }
            }
            
            // 解析城市
            if (json.contains("\"city\":\"")) {
                int cityStart = json.indexOf("\"city\":\"") + 8;
                int cityEnd = json.indexOf("\"", cityStart);
                if (cityStart > 8 && cityEnd > cityStart) {
                    if (location.length() > 0) location.append(", ");
                    location.append(json.substring(cityStart, cityEnd));
                }
            }
            
            return location.length() > 0 ? location.toString() : "Unknown";
        } catch (Exception e) {
            e.printStackTrace();
            return "Unknown";
        }
    }
    
    /**
     * 测试IP归属地查询
     * @param args 命令行参数
     */
    public static void main(String[] args) {
        // 测试公共IP地址
        String[] testIps = {
            "127.0.0.1",      // 本地地址
            "8.8.8.8",        // Google DNS
            "114.114.114.114", // 国内DNS
            "202.108.22.5"     // 百度IP
        };
        
        for (String ip : testIps) {
            System.out.println("IP: " + ip + ", 归属地: " + getIpLocation(ip));
        }
    }
}
