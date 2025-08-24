package com.by.file.properties;


import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author: 班东东
 * @Time: 2025/4/8 20:35
 * @description: 文件上产配置读取配置文件
 */
@Data
@Component
@ConfigurationProperties(prefix="by.minio") //读取节点
public class MinioProperties {

    private String endpointUrl;
    private String accessKey;
    private String secretKey;
    private String bucketName;


}
