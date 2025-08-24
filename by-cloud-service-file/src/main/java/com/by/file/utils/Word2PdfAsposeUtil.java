package com.by.file.utils;

import com.aspose.words.Document;
import com.aspose.words.License;
import com.aspose.words.SaveFormat;
import com.by.file.properties.MinioProperties;
import io.minio.GetObjectArgs;
import io.minio.MinioClient;
import io.minio.PutObjectArgs;
import io.minio.errors.MinioException;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.*;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

/**
 * @author bandd
 * @date2025年08月04日10:39
 * aspose实现word 转 pdf
 */
@Component
public class Word2PdfAsposeUtil {

    private static MinioProperties staticMinioProperties;

    @Autowired
    private MinioProperties minioProperties;

    @PostConstruct
    public void init() {
        staticMinioProperties = this.minioProperties; // 注入后赋值给静态变量
    }

    /**
     * description: 获取许可证
     * create by: 班东东
     * create time: 2025/8/10 16:29
     */
    public static boolean getLicense() {
        boolean result = false;
        try {
            String s = "<License><Data><Products><Product>Aspose.Total for Java</Product><Product>Aspose.Words for Java</Product></Products><EditionType>Enterprise</EditionType><SubscriptionExpiry>20991231</SubscriptionExpiry><LicenseExpiry>20991231</LicenseExpiry><SerialNumber>8bfe198c-7f0c-4ef8-8ff0-acc3237bf0d7</SerialNumber></Data><Signature>sNLLKGMUdF0r8O1kKilWAGdgfs2BvJb/2Xp8p5iuDVfZXmhppo+d0Ran1P9TKdjV4ABwAgKXxJ3jcQTqE/2IRfqwnPf8itN8aFZlV3TJPYeD3yWE7IT55Gz6EijUpC7aKeoohTb4w2fpox58wWoF3SNp6sK6jDfiAUGEHYJ9pjU=</Signature></License>";
            ByteArrayInputStream is = new ByteArrayInputStream(s.getBytes());
            License aposeLic = new License();
            aposeLic.setLicense(is);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * description: 实现word 转 pdf
     * create by: 班东东
     * create time: 2025/8/10 16:29
     */
    public static File word2pdf(String inPath, String outPath) {
        if (!getLicense()) { // 验证License 若不验证则转化出的pdf文档会有水印产生
            return null;
        }
        FileOutputStream os = null;
        try {
            long old = System.currentTimeMillis();
            File file = new File(outPath); // 新建一个空白pdf文档
            os = new FileOutputStream(file);
            Document doc = new Document(inPath); // Address是将要被转化的word文档
            doc.save(os, SaveFormat.PDF);// 全面支持DOC, DOCX, OOXML, RTF HTML, OpenDocument, PDF,
            // EPUB, XPS, SWF 相互转换
            long now = System.currentTimeMillis();
            System.out.println("pdf转换成功，共耗时：" + ((now - old) / 1000.0) + "秒"); // 转化用时
            return file;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }finally {
            if (os != null) {
                try {
                    os.flush();
                    os.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static void main(String[] arg){
        String docPath = "C:\\Users\\admin\\Desktop\\合同0801\\采矿权出让合同(模板0801).docx";
        String pdfPath = "C:\\Users\\admin\\Desktop\\合同0801\\采矿权出让合同(模板0804).pdf";
        Word2PdfAsposeUtil.word2pdf(docPath,pdfPath);
    }

    /**
     * word转pdf并上传到minio服务器
     */
    public static boolean word2pdfAndUploadToMinio(InputStream inPath, String minioObjectName) {
        if (!getLicense()) { // 验证License 若不验证则转化出的pdf文档会有水印产生
            return false;
        }

        // 创建临时PDF文件
        File tempPdfFile = null;
        try {
            long startTime = System.currentTimeMillis();

            // 1. 将Word转换为PDF
            tempPdfFile = File.createTempFile("temp", ".pdf");
            try (FileOutputStream os = new FileOutputStream(tempPdfFile)) {
                Document doc = new Document(inPath);
                doc.save(os, SaveFormat.PDF);
            }

            long convertTime = System.currentTimeMillis();
            System.out.println("PDF转换成功，耗时：" + ((convertTime - startTime) / 1000.0) + "秒");

            // 2. 上传到Minio
            try (InputStream pdfStream = new FileInputStream(tempPdfFile)) {
                // 初始化Minio客户端 (需要提前配置好)
                MinioClient minioClient = MinioClient.builder()
                        .endpoint(staticMinioProperties.getEndpointUrl())
                        .credentials(staticMinioProperties.getAccessKey(), staticMinioProperties.getSecretKey())
                        .build();

                // 上传文件
                minioClient.putObject(
                        PutObjectArgs.builder()
                                .bucket(staticMinioProperties.getBucketName())
                                .object(minioObjectName)
                                .stream(pdfStream, tempPdfFile.length(), -1)
                                .contentType("application/pdf")
                                .build());

                long uploadTime = System.currentTimeMillis();
                System.out.println("上传Minio成功，耗时：" + ((uploadTime - convertTime) / 1000.0) + "秒");
                System.out.println("总耗时：" + ((uploadTime - startTime) / 1000.0) + "秒");
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            // 删除临时文件
            if (tempPdfFile != null && tempPdfFile.exists()) {
                try {
                    tempPdfFile.delete();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }


    /**
     * description: 从minio中下载文件为base64编码
     * create by: 班东东
     * create time: 2025/8/10 16:30
     */
    public static String findMinioFileBase64(String filePath) {
        try {
            // 1. 创建MinIO客户端
            MinioClient minioClient = MinioClient.builder()
                    .endpoint(staticMinioProperties.getEndpointUrl())
                    .credentials(staticMinioProperties.getAccessKey(), staticMinioProperties.getSecretKey())
                    .build();

            // 2. 从MinIO下载文件
            InputStream stream = minioClient.getObject(
                    GetObjectArgs.builder()
                            .bucket(staticMinioProperties.getBucketName())
                            .object(filePath)
                            .build());

            // 3. 将文件内容读取为字节数组
            byte[] fileBytes = stream.readAllBytes();
            stream.close();

            // 4. 将字节数组转换为Base64字符串
            String base64String = Base64.getEncoder().encodeToString(fileBytes);
            // 输出结果
            System.out.println("Base64 encoded file content:");
            System.out.println(base64String);
            return base64String;
        } catch (MinioException e) {
            System.out.println("MinIO Error: " + e.getMessage());
        } catch (IOException | InvalidKeyException | NoSuchAlgorithmException e) {
            System.out.println("Error: " + e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "";
    }



    /**
     * description: 从minio中下载文件
     * create by: 班东东
     * create time: 2025/8/10 16:54
     */
    public static InputStream downloadFileFromMinIO(MinioClient minioClient, String objectName, String bucketName) throws Exception {
        return minioClient.getObject(
                GetObjectArgs.builder()
                        .bucket(bucketName)
                        .object(objectName)
                        .build());
    }
}


