package com.by.file.service;


import com.by.file.properties.MinioProperties;
import io.minio.*;
import io.minio.errors.MinioException;
import io.minio.messages.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author bandd
 * @date2025年06月16日16:51
 */
@Service
public class MinioService {

    private final MinioClient minioClient;

    @Autowired
    private MinioProperties minioProperties;



    public MinioService(MinioClient minioClient) {
        this.minioClient = minioClient;
    }

    /**
     * 获取一级目录结构
     * @param parentPath 父目录路径（可为空）
     * @return 目录结构（目录名 -> 文件列表）
     */
    public Map<String, List<String>> getFirstLevelDirectories(String parentPath)
            throws MinioException, IOException, NoSuchAlgorithmException, InvalidKeyException {

        // 确保路径格式正确
        String prefix = parentPath != null && !parentPath.isEmpty() ?
                parentPath.endsWith("/") ? parentPath : parentPath + "/" :
                "";

        Map<String, List<String>> directoryMap = new HashMap<>();

        // 列出所有对象（非递归）
        ListObjectsArgs args = ListObjectsArgs.builder()
                .bucket(minioProperties.getBucketName())
                .prefix(prefix)
                .recursive(false)
                .delimiter("/")
                .build();

        // 临时存储当前层级的目录
        Map<String, List<String>> tempDirMap = new HashMap<>();

        for (Result<Item> result : minioClient.listObjects(args)) {
            Item item = result.get();
            String objectName = item.objectName();

            // 从完整路径中提取相对路径
            String relativePath = objectName.substring(prefix.length());

            if (relativePath.contains("/")) {
                // 处理目录
                String dirName = relativePath.substring(0, relativePath.indexOf('/'));
                tempDirMap.computeIfAbsent(dirName, k -> new ArrayList<>());
            } else if (!relativePath.isEmpty()) {
                // 处理根目录文件
                if (!prefix.isEmpty()) {
                    // 添加到父目录
                    directoryMap.computeIfAbsent(parentPath, k -> new ArrayList<>())
                            .add(relativePath);
                } else {
                    // 根目录文件
                    directoryMap.computeIfAbsent("root", k -> new ArrayList<>())
                            .add(relativePath);
                }
            }
        }

        // 添加目录到结果
        for (Map.Entry<String, List<String>> entry : tempDirMap.entrySet()) {
            directoryMap.put(entry.getKey(), entry.getValue());
        }

        return directoryMap;
    }

    /**
     * 获取指定路径的文件流
     * @param filePath 文件路径（包含目录）
     * @return 文件输入流
     */
    public InputStream getFileStream(String filePath, String bucketName)
            throws MinioException, IOException, NoSuchAlgorithmException, InvalidKeyException {

        // 验证文件路径
        if (filePath == null || filePath.isEmpty()) {
            throw new IllegalArgumentException("文件路径不能为空");
        }

        // 判断桶是否存在
        boolean found = minioClient.bucketExists(BucketExistsArgs.builder()
                .bucket(bucketName).build());
        if (!found) {
            throw new IllegalArgumentException("桶不存在");
        }

        // 获取文件流
        return minioClient.getObject(
                GetObjectArgs.builder()
                        .bucket(bucketName)
                        .object(filePath)
                        .build()
        );
    }

    /**
     * 获取指定目录下的文件列表
     * @param directoryPath 目录路径
     * @return 文件列表
     */
    public List<String> getFilesInDirectory(String directoryPath)
            throws MinioException, IOException, NoSuchAlgorithmException, InvalidKeyException {

        // 确保路径格式正确
        String prefix = directoryPath != null && !directoryPath.isEmpty() ?
                directoryPath.endsWith("/") ? directoryPath : directoryPath + "/" :
                "";

        List<String> files = new ArrayList<>();

        ListObjectsArgs args = ListObjectsArgs.builder()
                .bucket(minioProperties.getBucketName())
                .prefix(prefix)
                .recursive(false) // 只获取当前层级
                .build();

        for (Result<Item> result : minioClient.listObjects(args)) {
            Item item = result.get();
            String objectName = item.objectName();

            // 跳过目录项
            if (item.isDir() || objectName.endsWith("/")) {
                continue;
            }

            // 提取文件名（去除目录前缀）
            String fileName = objectName.substring(prefix.length());
            files.add(fileName);
        }

        return files;
    }
}