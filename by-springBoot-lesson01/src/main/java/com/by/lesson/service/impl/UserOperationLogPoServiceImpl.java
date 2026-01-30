package com.by.lesson.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.by.lesson.entity.UserOperationLogPo;
import com.by.lesson.mapper.UserOperationLogPoMapper;
import com.by.lesson.service.UserOperationLogPoService;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.net.InetAddress;

/**
 * <p>
 * 用户操作日志表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2025-12-22
 */
@Service
public class UserOperationLogPoServiceImpl extends ServiceImpl<UserOperationLogPoMapper, UserOperationLogPo>
        implements UserOperationLogPoService {

    @Async("operationLogExecutor")
    @Override
    public void saveOperationLogAsync(String type) {
        try {
            saveOperationLog(type);
            System.out.println("保存操作日志----------------");
        } catch (Exception e){
            log.error("保存操作日志失败", e);
        }
    }

    public boolean saveOperationLog(String type){
        try {
            UserOperationLogPo po = new UserOperationLogPo();
            po.setUserId(1L);
            po.setOperationType(type);
            po.setOperationContent(type);
            po.setRequestMethod("POST");
            po.setRequestUrl("/users/saveUser");
            po.setRequestParams(type);
            InetAddress localHost = InetAddress.getLocalHost();
            // 获取ip、用户名
            po.setIpAddress(localHost.getHostName());
            po.setUserAgent(localHost.getHostAddress());
            return this.save(po);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("保存操作日志失败", e);
            return false;
        }
    }
}
