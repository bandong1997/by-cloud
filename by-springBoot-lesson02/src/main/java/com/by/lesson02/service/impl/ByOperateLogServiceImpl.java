package com.by.lesson02.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.by.common.utils.IdUtil;
import com.by.common.utils.IpLocationUtils;
import com.by.common.utils.IpUtils;
import com.by.common.utils.UserAgentUtils;
import com.by.lesson02.entity.ByOperateLog;
import com.by.lesson02.mapper.ByOperateLogMapper;
import com.by.lesson02.service.ByOperateLogService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 操作日志表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2026-01-29
 */
@Service
public class ByOperateLogServiceImpl extends ServiceImpl<ByOperateLogMapper, ByOperateLog> implements ByOperateLogService {




    @Async("byOperationLogExecutor")
    @Override
    public void saveOperateLogAsync(String title, String bizType, String operType,
                                    String method, HttpServletRequest request) {
        try {
            saveOperateLog(title, bizType, operType, method, request);
        } catch (Exception e){
            log.error("保存操作日志失败", e);
        }
    }

    public void saveOperateLog(String title, String bizType, String operType,
                               String method, HttpServletRequest request) {

        String userAgent = request.getHeader("User-Agent");
        try {
            ByOperateLog logPo = new ByOperateLog();
            logPo.setId(IdUtil.getUuid());
            logPo.setTitle(title);
            logPo.setBizType(bizType);
            logPo.setOperType(operType);
            logPo.setMethod(method);
            logPo.setRequestMethod(request.getMethod());

            // 获取ip
            String localIp = IpUtils.getLocalIpAddress();
            logPo.setIp(localIp);
            logPo.setIpVersion(IpUtils.getIpVersion(localIp));

            // ip归属地，还需调整
            logPo.setIpLocation(IpLocationUtils.getIpLocation(localIp));

            // 浏览器、系统信息
            logPo.setUserAgent(userAgent);
            logPo.setBrowser(UserAgentUtils.getBrowser(userAgent));
            logPo.setBrowserVersion(UserAgentUtils.getBrowserVersion(userAgent));
            logPo.setOs(UserAgentUtils.getOperatingSystem(userAgent));
            logPo.setOsVersion(UserAgentUtils.getOperatingSystemVersion(userAgent));
            logPo.setDevice(UserAgentUtils.getDeviceType(userAgent));
            logPo.setDeviceModel(UserAgentUtils.getDeviceModel(userAgent));
            this.save(logPo);
        } catch (Exception e) {
            log.error("保存操作日志失败", e);
        }

    }
}
