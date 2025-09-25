package com.by.file.controller;


import com.by.common.result.Result;
import com.by.common.result.ResultCode;
import com.by.file.service.FileUploadService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: 班东东
 * @Time: 2025/4/8 20:28
 * @description:
 */
@Tag(name = "文件上传接口")
@RestController
@RequestMapping("/fileMinio")
public class FileUploadController {

    @Autowired
    private FileUploadService fileUploadService;

    @Operation(summary = "文件上传")
    @PostMapping(value = "/fileUpload")
    public Result fileUploadService(@RequestParam(value = "file") MultipartFile multipartFile) {
        String fileUrl = fileUploadService.fileUpload(multipartFile);
        return Result.success(fileUrl , ResultCode.SUCCESS) ;
    }

    @Operation(summary = "批量文件上传")
    @PostMapping(value = "/batchFileUpload")
    public List<String> batchFileUpload(@RequestParam(value = "files") MultipartFile[] files) {
        List<String> fileUrls = fileUploadService.batchFileUpload(files);
        return fileUrls;
    }

    @Operation(summary = "文件预览(直接预览桶下面文件，不包含文件夹下文件)")
    @GetMapping("/preview/{fileName}")
    public ResponseEntity<InputStreamResource> previewPdf(@PathVariable String fileName) {
        return fileUploadService.previewPdf(fileName);
    }

    /**
     * 获取目录下的文件列表
     * @param directoryPath 目录路径
     * files?dir=20250616/
     */
    @GetMapping("/files")
    public ResponseEntity<List<String>> getFilesInDirectory(@RequestParam("dir") String directoryPath) {
        return fileUploadService.getFilesInDirectory(directoryPath);
    }


    /**
     * 获取桶-文件夹下文件流（支持预览）
     * @param filePath 文件路径
     * /api/minio/stream?path=docs/reports/Q2/report.pdf
     */
    @GetMapping("/stream")
    public ResponseEntity<InputStreamResource> getFileStream(
            @RequestParam("path") String filePath) {
        return fileUploadService.getFileStream(filePath);
    }

    /**
     * word转pdf 并上传到minio服务器
     */
    @GetMapping("/wordToPdf")
    public Result wordToPdf(String filePath) {
        String str = fileUploadService.wordToPdf(filePath);
        return Result.success(str, ResultCode.SUCCESS);
    }

    /**
     * 替换word变量
     */
    @GetMapping("/replaceWordVariables")
    public Result replaceWordVariables(String filePath){
        String str = fileUploadService.replaceWordVariables(filePath);
        return Result.success(str, ResultCode.SUCCESS);
    }

    /**
     * description: 文件下载
     * create by: 班东东
     * create time: 2025/8/10 17:33
     */
    @GetMapping("/downloadByName")
    public ResponseEntity<InputStreamResource> downloadByName(String fileName) {
        return fileUploadService.downloadByName(fileName);
    }

    /**
     * description: 获取文件base64编码
     * create by: 班东东
     * create time: 2025/8/10 17:44
     */
    @GetMapping("/findFileBase64")
    public Result findFileBase64(@RequestParam("filePath") String filePath) {
        return Result.success(fileUploadService.findFileBase64(filePath));
    }


    @GetMapping("/testFeign")
    public Map<String, String> testFeign() {
        Map<String, String> map = new HashMap<>();
        map.put("title", "这里是file......");
        return map;
    }



}
