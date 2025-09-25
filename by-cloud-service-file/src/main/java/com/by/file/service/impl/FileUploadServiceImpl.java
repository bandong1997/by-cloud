package com.by.file.service.impl;


import cn.hutool.core.date.DateUtil;
import com.by.file.properties.MinioProperties;
import com.by.file.service.FileUploadService;
import com.by.file.service.MinioService;
import com.by.file.utils.Word2PdfAsposeUtil;
import io.minio.*;
import io.minio.errors.MinioException;
import io.minio.messages.Item;
import org.apache.poi.xwpf.usermodel.*;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTR;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/**
 * @author: 班东东
 * @Time: 2025/4/8 20:30
 * @description:
 */
@Service
public class FileUploadServiceImpl implements FileUploadService {

    @Autowired
    private MinioProperties minioProperties;
    @Autowired
    private MinioClient minioClient;

    private final MinioService minioService;

    public FileUploadServiceImpl(MinioService minioService) {
        this.minioService = minioService;
    }

    // word原格式
    private static final Pattern VARIABLE_PATTERN = Pattern.compile("\\$\\{(.+?)\\}");

    /**
     * 文件上传
     */
    @Override
    public String fileUpload(MultipartFile multipartFile) {

        try {
            // 创建一个Minio的客户端对象
            MinioClient minioClient = MinioClient.builder()
                    .endpoint(minioProperties.getEndpointUrl())
                    .credentials(minioProperties.getAccessKey(), minioProperties.getSecretKey())
                    .build();

            // 判断桶是否存在
            boolean found = minioClient.bucketExists(BucketExistsArgs.builder()
                    .bucket(minioProperties.getBucketName()).build());

            // 如果不存在，那么此时就创建一个新的桶
            if (!found) {
                minioClient.makeBucket(MakeBucketArgs.builder().bucket(minioProperties.getBucketName()).build());
            } else {  // 如果存在打印信息
                System.out.println("Bucket 'by-bucket' already exists.");
            }

            // 设置存储对象名称
            String dateDir = DateUtil.format(new Date(), "yyyyMMdd");
            String uuid = UUID.randomUUID().toString().replace("-", "");
            //20230801/443e1e772bef482c95be28704bec58a901.jpg
            // 获取上传文件名称
            String fileName = dateDir + "/" + uuid + "-" + multipartFile.getOriginalFilename();
            System.out.println(fileName);

            // 文件上传
            PutObjectArgs putObjectArgs = PutObjectArgs.builder()
                    .bucket(minioProperties.getBucketName())
                    .stream(multipartFile.getInputStream(), multipartFile.getSize(), -1)
                    .object(fileName)
                    .build();
            minioClient.putObject(putObjectArgs) ;

            // 返回文件上传路径
            return minioProperties.getEndpointUrl() + "/" + minioProperties.getBucketName() + "/" + fileName ;

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<String> batchFileUpload(MultipartFile[] files) {
        List<String> fileUrls = new ArrayList<>();
        if (files == null || files.length == 0) {
            return fileUrls;
        }

        try {
            // 创建一个Minio的客户端对象
            MinioClient minioClient = MinioClient.builder()
                    .endpoint(minioProperties.getEndpointUrl())
                    .credentials(minioProperties.getAccessKey(), minioProperties.getSecretKey())
                    .build();

            // 判断桶是否存在
            boolean found = minioClient.bucketExists(BucketExistsArgs.builder()
                    .bucket(minioProperties.getBucketName()).build());

            // 如果不存在，那么此时就创建一个新的桶
            if (!found) {
                minioClient.makeBucket(MakeBucketArgs.builder().bucket(minioProperties.getBucketName()).build());
            } else {
                System.out.println("Bucket '" + minioProperties.getBucketName() + "' already exists.");
            }

            // 设置存储对象名称的公共部分
            String dateDir = DateUtil.format(new Date(), "yyyyMMdd");

            // 逐个上传文件
            for (MultipartFile multipartFile : files) {

                String uuid = UUID.randomUUID().toString().replace("-", "");
                String fileName = dateDir + "/" + uuid + "-" + multipartFile.getOriginalFilename();
                // 文件上传

                PutObjectArgs putObjectArgs = PutObjectArgs.builder()
                        .bucket(minioProperties.getBucketName())
                        .stream(multipartFile.getInputStream(), multipartFile.getSize(), -1)
                        .object(fileName)
                        .build();
                minioClient.putObject(putObjectArgs);

                // 保存文件上传路径
                fileUrls.add(minioProperties.getEndpointUrl() + "/" + minioProperties.getBucketName() + "/" + fileName);
            }

            return fileUrls;
        } catch (Exception e) {
            throw new RuntimeException("批量文件上传失败", e);
        }
    }

    /**
     * 文件预览(直接预览桶下面文件，不包含文件夹下文件)
     */
    @Override
    public ResponseEntity<InputStreamResource> previewPdf(String fileName) {
        try {
            // 从MinIO获取文件流
            InputStream stream = minioClient.getObject(
                    GetObjectArgs.builder()
                            .bucket(minioProperties.getBucketName())
                            .object(fileName)
                            .build()
            );

            // 设置响应头
            HttpHeaders headers = new HttpHeaders();
            headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_PDF_VALUE);
            headers.add(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=" + fileName);
            headers.add(HttpHeaders.CACHE_CONTROL, "public, max-age=3600");

            return ResponseEntity.ok()
                    .headers(headers)
                    .body(new InputStreamResource(stream));

        } catch (MinioException e) {
            // MinIO异常处理
            return ResponseEntity.status(500).body(null);
        } catch (Exception e) {
            // 其他异常处理
            return ResponseEntity.status(404).body(null);
        }
    }

    /**
     * 获取目录下的文件列表
     */
    @Override
    public ResponseEntity<List<String>> getFilesInDirectory(String directoryPath) {
        try {
            List<String> files = minioService.getFilesInDirectory(directoryPath);
            return ResponseEntity.ok(files);
        } catch (Exception e) {
            return ResponseEntity.status(500).body(null);
        }
    }

    /**
     * 获取桶-文件夹下文件流（支持预览）
     */
    @Override
    public ResponseEntity<InputStreamResource> getFileStream(String filePath) {
        try {
            InputStream fileStream = minioService.getFileStream(filePath, minioProperties.getBucketName());

            // 设置响应头
            HttpHeaders headers = new HttpHeaders();

            // 根据文件类型设置Content-Type
            String contentType = getContentType(filePath);
            headers.setContentType(MediaType.parseMediaType(contentType));

            // 设置内联预览
//            headers.setContentDispositionFormData("inline", getFileName(filePath));
            headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_PDF_VALUE);
            headers.add(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=" + getFileName(filePath));
            headers.add(HttpHeaders.CACHE_CONTROL, "public, max-age=3600");

            return ResponseEntity.ok()
                    .headers(headers)
                    .body(new InputStreamResource(fileStream));

        } catch (Exception e) {
            return ResponseEntity.status(404).body(null);
        }
    }

    /**
     * description: word -> pdf
     * create by: 班东东
     * create time: 2025/8/10 16:48
     */
    @Override
    public String wordToPdf(String filePath) {

        try {

            // 处理包含中文和特殊字符的文件名
            String decodedWordFileName = URLDecoder.decode(filePath, StandardCharsets.UTF_8);
            // 转换后的名字
            String pdfFileName = decodedWordFileName.replace(".docx", ".pdf");

            // 从MinIO下载Word文件
            try (InputStream wordStream = Word2PdfAsposeUtil.downloadFileFromMinIO(minioClient, filePath, minioProperties.getBucketName())) {

                // 转换并上传minio
                boolean b = Word2PdfAsposeUtil.word2pdfAndUploadToMinio(wordStream, pdfFileName);
                if (b) {
                    System.out.println("Word转PDF并上传至MinIO完成！");
                } else {
                    System.out.println("Word转PDF并上传至MinIO---失败！");
                }
                return pdfFileName;
            }
        } catch (Exception e) {
            return "失败";
        }
    }



    // 从文件路径获取文件名
    private String getFileName(String filePath) {
        return filePath.substring(filePath.lastIndexOf('/') + 1);
    }

    // 根据文件扩展名获取Content-Type
    private String getContentType(String filePath) {
        String extension = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();

        switch (extension) {
            case "pdf": return "application/pdf";
            case "jpg": case "jpeg": return "image/jpeg";
            case "png": return "image/png";
            case "txt": return "text/plain";
            case "html": return "text/html";
            case "xml": return "application/xml";
            case "json": return "application/json";
            case "mp4": return "video/mp4";
            case "mp3": return "audio/mpeg";
            case "doc": return "application/msword";
            case "docx": return "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
            case "xls": return "application/vnd.ms-excel";
            case "xlsx": return "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            case "ppt": return "application/vnd.ms-powerpoint";
            case "pptx": return "application/vnd.openxmlformats-officedocument.presentationml.presentation";
            case "zip": return "application/zip";
            default: return "application/octet-stream";
        }
    }


    /**
     * 替换word变量
     */
    @Override
    public String replaceWordVariables(String filePath) {
        try {

            // 定义变量替换映射
            Map<String, String> variables = new HashMap<>();
            variables.put("合同编号", "合同编号123");
            variables.put("项目名称", "项目名称-123");
            variables.put("甲方", "甲方-张三");
            variables.put("甲方住所", "甲方-住所");
            variables.put("甲方法定代表人", "甲方-法人");
            variables.put("乙方", "乙方-张三");
            variables.put("统一社会信用代码", "乙方-统一社会信用代码");
            variables.put("乙方住所", "乙方-住所");
            variables.put("乙方法定代表人", "乙方-张三");
            variables.put("勘查项目名称", "勘查项目名称123");
            variables.put("勘查矿种", "勘查矿种123");
            variables.put("地理位置", "地理位置123");
            variables.put("面积", "面积123");
            variables.put("出让方式", "招标");
            variables.put("一次性缴纳(大写)", "叁仟伍佰捌拾陆万元整");
            variables.put("一次性缴纳(小写)", "35860000");
            variables.put("销售收入", "20");
            variables.put("销售收入(油气)", "50");
            variables.put("原探矿权出让收益(大写)", "叁仟伍佰捌拾陆万元整");
            variables.put("原探矿权出让收益(小写)", "35860000");
            variables.put("缴纳方式", "一次性缴纳");
            variables.put("首次缴纳人民币大写", "叁仟伍佰捌拾陆万元整");
            variables.put("首次缴纳人民币小写", "35860000");
            variables.put("应急处置", "应急处置-123");
            variables.put("逾期", "15");
            variables.put("联系人", "鹿野");
            variables.put("联系电话", "13460122689");


            String uuid = UUID.randomUUID().toString().replace("-", "");
            String fileName = filePath.split("/")[0] + "/" + uuid + ".docx";

            // 执行替换和上传
            replaceAndUploadPreservingFormat(
                    minioProperties.getBucketName(),
                    filePath,
                    fileName,
                    variables);

            // 替换完成之后将word转成pdf
            System.out.println("Word文档变量替换完成，格式已保留!");

            // word转pdf
            return this.wordToPdf(fileName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "失败";
    }

    /**
     * 替换Word文档中的变量并上传回MinIO，保留原有格式
     */
    public void replaceAndUploadPreservingFormat(String bucketName, String sourcePath,
                                                 String targetPath, Map<String, String> variables) throws Exception {

        // 检查存储桶是否存在
        if (!minioClient.bucketExists(BucketExistsArgs.builder().bucket(bucketName).build())) {
            throw new Exception("Bucket " + bucketName + " does not exist");
        }

        // 从MinIO获取文件
        try (InputStream stream = minioClient.getObject(
                GetObjectArgs.builder()
                        .bucket(bucketName)
                        .object(sourcePath)
                        .build())) {

            // 处理Word文档
            byte[] processedDoc = replaceVariablesPreservingFormat(stream, variables);

            // 上传处理后的文档
            uploadToMinIO(bucketName, targetPath, processedDoc);
        }
    }

    /**
     * 替换变量同时保留Word文档格式
     */
    private byte[] replaceVariablesPreservingFormat(InputStream inputStream,
                                                    Map<String, String> variables) throws IOException {

        try (XWPFDocument doc = new XWPFDocument(inputStream)) {
            // 处理正文中的段落
            for (XWPFParagraph paragraph : doc.getParagraphs()) {
                replaceInParagraph(paragraph, variables);
            }

            // 处理页眉
            for (XWPFHeader header : doc.getHeaderList()) {
                for (XWPFParagraph paragraph : header.getParagraphs()) {
                    replaceInParagraph(paragraph, variables);
                }
            }

            // 处理页脚
            for (XWPFFooter footer : doc.getFooterList()) {
                for (XWPFParagraph paragraph : footer.getParagraphs()) {
                    replaceInParagraph(paragraph, variables);
                }
            }

            // 处理表格
            for (XWPFTable table : doc.getTables()) {
                for (XWPFTableRow row : table.getRows()) {
                    for (XWPFTableCell cell : row.getTableCells()) {
                        for (XWPFParagraph paragraph : cell.getParagraphs()) {
                            replaceInParagraph(paragraph, variables);
                        }
                    }
                }
            }

            // 输出处理后的文档
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            doc.write(out);
            return out.toByteArray();
        }
    }

    /**
     * 在段落中替换变量，保留格式
     */
    private void replaceInParagraph(XWPFParagraph paragraph, Map<String, String> variables) {
        // 合并相邻的文本运行(Run)以处理跨运行的变量
        mergeAdjacentRuns(paragraph);

        List<XWPFRun> runs = paragraph.getRuns();
        for (int i = 0; i < runs.size(); i++) {
            XWPFRun run = runs.get(i);
            String text = run.getText(0);
            if (text == null || text.isEmpty()) {
                continue;
            }

            Matcher matcher = VARIABLE_PATTERN.matcher(text);
            if (!matcher.find()) {
                continue;
            }

            // 找到变量并替换
            StringBuffer sb = new StringBuffer();
            matcher.reset();
            while (matcher.find()) {
                String varName = matcher.group(1);
                String replacement = variables.getOrDefault(varName, "");
                matcher.appendReplacement(sb, replacement);
            }
            matcher.appendTail(sb);

            // 设置替换后的文本，保留原有格式
            run.setText(sb.toString(), 0);
        }
    }

    /**
     * 合并相邻的文本运行(Run)，以便处理跨运行的变量
     */
    private void mergeAdjacentRuns(XWPFParagraph paragraph) {
        List<XWPFRun> runs = paragraph.getRuns();
        if (runs.size() < 2) {
            return;
        }

        // 检查格式是否相同，如果相同则合并
        for (int i = runs.size() - 1; i > 0; i--) {
            XWPFRun current = runs.get(i);
            XWPFRun previous = runs.get(i - 1);

            if (runsHaveSameFormatting(current, previous)) {
                String combinedText = (previous.getText(0) != null ? previous.getText(0) : "") +
                        (current.getText(0) != null ? current.getText(0) : "");
                previous.setText(combinedText, 0);
                paragraph.removeRun(i);
            }
        }
    }

    /**
     * 检查两个Run是否具有相同的格式
     */
    private boolean runsHaveSameFormatting(XWPFRun run1, XWPFRun run2) {
        CTR ctr1 = run1.getCTR();
        CTR ctr2 = run2.getCTR();

        // 比较基本的格式属性
        return ctr1.getRPr() == null ? ctr2.getRPr() == null : ctr1.getRPr().toString().equals(ctr2.getRPr() == null ? "" : ctr2.getRPr().toString());
    }

    /**
     * 上传文件到MinIO
     */
    private void uploadToMinIO(String bucketName, String filePath, byte[] content)
            throws Exception {
        try (ByteArrayInputStream bais = new ByteArrayInputStream(content)) {
            minioClient.putObject(
                    PutObjectArgs.builder()
                            .bucket(bucketName)
                            .object(filePath)
                            .stream(bais, content.length, -1)
                            .build());
        }
    }

    /**
     * description: 文件下载
     * create by: 班东东
     * create time: 2025/8/10 17:35
     */
    public ResponseEntity<InputStreamResource> downloadByName(String fileName) {
        try {
            // 查找文件
            String foundFilePath = findFileByName(minioProperties.getBucketName(), fileName);
            return buildFileResponse(minioProperties.getBucketName(), foundFilePath);
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }

    private String findFileByName(String bucketName, String searchName) throws Exception {
        List<String> allFiles = new ArrayList<>();
        Iterable<Result<Item>> results = minioClient.listObjects(
                ListObjectsArgs.builder()
                        .bucket(bucketName)
                        .recursive(true)
                        .build());

        for (Result<Item> result : results) {
            Item item = result.get();
            if (!item.isDir() && item.objectName().contains(searchName)) {
                allFiles.add(item.objectName());
            }
        }

        if (allFiles.isEmpty()) {
            throw new Exception("未找到文件");
        }

        if (allFiles.size() > 1) {
            throw new Exception("找到多个匹配文件");
        }

        return allFiles.get(0);
    }

    private ResponseEntity<InputStreamResource> buildFileResponse(
            String bucketName, String filePath) throws Exception {
        InputStream stream = minioClient.getObject(
                GetObjectArgs.builder()
                        .bucket(bucketName)
                        .object(filePath)
                        .build());

        String fileName = filePath.substring(filePath.lastIndexOf('/') + 1);

        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION,
                "attachment; filename=\"" + fileName + "\"");
        headers.add(HttpHeaders.CACHE_CONTROL, "no-cache, no-store, must-revalidate");
        headers.add(HttpHeaders.PRAGMA, "no-cache");
        headers.add(HttpHeaders.EXPIRES, "0");

        return ResponseEntity.ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(new InputStreamResource(stream));
    }


    /**
     * description: 获取文件base64编码
     * create by: 班东东
     * create time: 2025/8/10 17:45
     */
    @Override
    public String findFileBase64(String filePath) {
        return Word2PdfAsposeUtil.findMinioFileBase64(filePath);
    }


}
