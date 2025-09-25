package com.by.file.service;


import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @author: 班东东
 * @Time: 2025/4/8 20:30
 * @description:
 */
public interface FileUploadService {

    /**
     * 文件上传
     */
    String fileUpload(MultipartFile multipartFile);

    List<String> batchFileUpload(MultipartFile[] files);

    /**
     * 文件预览(直接预览桶下面文件，不包含文件夹下文件)
     */
    ResponseEntity<InputStreamResource> previewPdf(String fileName);

    /**
     * 获取目录下的文件列表
     */
    ResponseEntity<List<String>> getFilesInDirectory(String directoryPath);

    /**
     * 获取桶-文件夹下文件流（支持预览）
     */
    ResponseEntity<InputStreamResource> getFileStream(String filePath);

    /**
     *word转pdf windows
     */
    String wordToPdf(String filePath);

    /**
     * 替换word变量
     */
    String replaceWordVariables(String filePath);

    /**
     * 文件下载 downloadByName
     */
    ResponseEntity<InputStreamResource> downloadByName(String fileName);

    /**
     * 获取文件base64编码
     */
    String findFileBase64(String filePath);
}
