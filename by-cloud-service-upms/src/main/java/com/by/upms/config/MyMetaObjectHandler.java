package com.by.upms.config;


import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * @author: 班东东
 * @Time: 2025/8/17 18:18
 * @description: mybatis-plus 自动填充
 */
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {


    /**
     * this.strictInsertFill(metaObject, "createTime", LocalDateTime.class, LocalDateTime.now());
     * 例如：时间是：LocalDateTime 实体类中的时间格式也需要 是 LocalDateTime，
     * 不需要设置时间格式：@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
     */

    @Override
    public void insertFill(MetaObject metaObject) {
//        this.strictInsertFill(metaObject, "createTime", Date.class, new Date());
//        this.strictInsertFill(metaObject, "updateTime", Date.class, new Date());

        this.strictInsertFill(metaObject, "createTime", LocalDateTime.class, LocalDateTime.now());
        this.strictInsertFill(metaObject, "updateTime", LocalDateTime.class, LocalDateTime.now());
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        this.strictUpdateFill(metaObject, "updateTime", LocalDateTime.class, LocalDateTime.now());
    }

}
