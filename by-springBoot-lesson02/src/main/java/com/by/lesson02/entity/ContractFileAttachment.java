package com.by.lesson02.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 文件附件表
 * </p>
 *
 * @author bdd
 * @since 2026-01-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("contract_file_attachment")
public class ContractFileAttachment implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 文件唯一标识
     */
    @TableField("file_uid")
    private String fileUid;

    /**
     * 文件名
     */
    @TableField("file_name")
    private String fileName;

    /**
     * 原始文件名
     */
    @TableField("original_name")
    private String originalName;

    /**
     * 文件类型
     */
    @TableField("file_type")
    private String fileType;

    /**
     * 文件大小(字节)
     */
    @TableField("file_size")
    private Long fileSize;

    /**
     * 文件路径
     */
    @TableField("file_path")
    private String filePath;

    /**
     * 文件URL
     */
    @TableField("file_url")
    private String fileUrl;

    /**
     * 业务类型
     */
    @TableField("business_type")
    private String businessType;

    /**
     * 业务ID
     */
    @TableField("business_id")
    private String businessId;

    /**
     * 模块编码
     */
    @TableField("module_code")
    private String moduleCode;

    /**
     * 文件哈希
     */
    @TableField("file_hash")
    private String fileHash;

    /**
     * MIME类型
     */
    @TableField("mime_type")
    private String mimeType;

    /**
     * 文件扩展名
     */
    @TableField("file_extension")
    private String fileExtension;

    /**
     * 缩略图路径
     */
    @TableField("thumbnail_path")
    private String thumbnailPath;

    /**
     * 是否有缩略图
     */
    @TableField("has_thumbnail")
    private Integer hasThumbnail;

    /**
     * 可见性
     */
    @TableField("visibility")
    private String visibility;

    /**
     * 下载次数
     */
    @TableField("download_count")
    private Integer downloadCount;

    /**
     * 查看次数
     */
    @TableField("view_count")
    private Integer viewCount;

    /**
     * 上传人ID
     */
    @TableField("uploader_id")
    private Long uploaderId;

    /**
     * 上传人姓名
     */
    @TableField("uploader_name")
    private String uploaderName;

    /**
     * 创建时间
     */
    @TableField("created_time")
    private Date createdTime;

    /**
     * 更新时间
     */
    @TableField("updated_time")
    private Date updatedTime;

    /**
     * 删除标志
     */
    @TableField("is_deleted")
    private Integer isDeleted;


}
