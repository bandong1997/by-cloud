package com.by.dsd.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 合同模板表
 * </p>
 *
 * @author bdd
 * @since 2025-12-10
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("mct_contract_tlp")
public class MctContractTlp implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 模板id
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * version
     */
    @TableField("version")
    private String version;

    /**
     * 矿权类型（1探矿权2：采矿权）
     */
    @TableField("source")
    private String source;

    /**
     * 模板名称
     */
    @TableField("name")
    private String name;

    /**
     * 标签（多个用,隔开)
     */
    @TableField("lable")
    private String lable;

    /**
     * 关键字
     */
    @TableField("keywords")
    private String keywords;

    /**
     * 内容
     */
    @TableField("content")
    private String content;

    /**
     * 地址
     */
    @TableField("url")
    private String url;

    /**
     * 备注
     */
    @TableField("remark")
    private String remark;

    /**
     * 是否发布（0：未发布1：已发布）
     */
    @TableField("publish_status")
    private BigDecimal publishStatus;

    /**
     * 发布人
     */
    @TableField("publish_user")
    private String publishUser;

    /**
     * 发布时间
     */
    @TableField("publish_time")
    private String publishTime;

    /**
     * 审核状态(-1:拒绝0：未审核1：同意)
     */
    @TableField("audit_status")
    private BigDecimal auditStatus;

    /**
     * 审核时间
     */
    @TableField("audit_time")
    private String auditTime;

    /**
     * 审核人
     */
    @TableField("audit_user")
    private String auditUser;

    /**
     * 审核说明
     */
    @TableField("audit_remark")
    private String auditRemark;

    /**
     * 使用频率
     */
    @TableField("frequency")
    private BigDecimal frequency;

    /**
     * 排序
     */
    @TableField("sort")
    private BigDecimal sort;

    /**
     * 是否有效（0：无效1：有效）
     */
    @TableField("effective_status")
    private BigDecimal effectiveStatus;

    /**
     * 创建人
     */
    @TableField("create_user")
    private String createUser;

    /**
     * 创建时间
     */
    @TableField("create_time")
    private String createTime;

    /**
     * 修改人
     */
    @TableField("modify_user")
    private String modifyUser;

    /**
     * 修改时间
     */
    @TableField("modify_time")
    private String modifyTime;

    /**
     * 删除状态,逻辑删除（0：正常1：删除）
     */
    @TableField("del_status")
    private BigDecimal delStatus;

    /**
     * 删除人
     */
    @TableField("del_user")
    private String delUser;

    /**
     * 删除时间
     */
    @TableField("del_time")
    private String delTime;

    /**
     * 关联模板id标识
     */
    @TableField("config_id")
    private String configId;

    /**
     * 模板类型(0:初始方式,1:导入模板方式)
     */
    @TableField("tpl_type")
    private BigDecimal tplType;

    /**
     * pdf文件生成地址
     */
    @TableField("file_path")
    private String filePath;

    /**
     * 合同类型(1、新立，2、变更，3、延续，4、转让)
     */
    @TableField("contract_type")
    private BigDecimal contractType;

    /**
     * 秘钥
     */
    @TableField("aes_key")
    private String aesKey;


}
