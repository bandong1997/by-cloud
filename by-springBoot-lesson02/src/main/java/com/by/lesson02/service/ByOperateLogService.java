package com.by.lesson02.service;

import com.by.lesson02.entity.ByOperateLog;
import com.baomidou.mybatisplus.extension.service.IService;
import jakarta.servlet.http.HttpServletRequest;

/**
 * <p>
 * 操作日志表 服务类
 * </p>
 *
 * @author bdd
 * @since 2026-01-29
 */
public interface ByOperateLogService extends IService<ByOperateLog> {

    /**
     * description: 记录操作日志
     * create by: 班东东
     * create time: 2026/1/29 20:44
     */
    void saveOperateLogAsync(String title, String bizType, String operType,
                             String method, HttpServletRequest request);

}
