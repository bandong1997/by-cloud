package com.by.lesson02.aop;

import com.by.common.utils.IdUtil;
import com.by.common.utils.IpLocationUtils;
import com.by.common.utils.IpUtils;
import com.by.common.utils.UserAgentUtils;
import com.by.lesson02.entity.ByOperateLog;
import com.by.lesson02.entity.ByUser;
import com.by.lesson02.service.ByOperateLogService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.lang.reflect.Method;
import java.util.Arrays;

/**
 * @author bandd
 * @date2026年02月06日15:25
 */
@Aspect
@Component
@Slf4j
public class OperationLogAspect {

    @Autowired
    private HttpServletRequest request;
    // 日志服务
    @Autowired
    private ByOperateLogService logService;

    /**
     * 定义切点
     */
    @Pointcut("@annotation(com.by.lesson02.aop.OperationLog)")
    public void operationLogPointCut() {
    }

    /**
     * 环绕通知
     */
    @Around("operationLogPointCut()")
    public Object around(ProceedingJoinPoint point) throws Throwable {

        long startTime = System.currentTimeMillis();
        // 执行方法
        Object result = point.proceed();
        // 运行时间
        long executeTime = System.currentTimeMillis() - startTime;

        // 保存日志
        saveLog(point, result, executeTime);

        return result;
    }

    /**
     * 保存操作日志
     */
    private void saveLog(ProceedingJoinPoint joinPoint, Object result, long executeTime) {
        try {
            MethodSignature signature = (MethodSignature) joinPoint.getSignature();
            Method method = signature.getMethod();
            OperationLog annotation = method.getAnnotation(OperationLog.class);

            if (annotation == null) {
                return;
            }


            ByOperateLog logPo = new ByOperateLog();
            logPo.setId(IdUtil.getUuid());
            logPo.setTitle(annotation.module());
            logPo.setOperType(annotation.type());
            logPo.setUrl(request.getRequestURL().toString());
            logPo.setMethod(request.getRequestURI());
            logPo.setRequestMethod(request.getMethod());
            // 获取ip
            String localIp = IpUtils.getLocalIpAddress();
            logPo.setIp(getClientIP());
            logPo.setIpVersion(IpUtils.getIpVersion(localIp));

            // ip归属地，还需调整
            logPo.setIpLocation(IpLocationUtils.getIpLocation(localIp));

            // 浏览器、系统信息
            String userAgent = request.getHeader("User-Agent");
            logPo.setUserAgent(userAgent);
            logPo.setBrowser(UserAgentUtils.getBrowser(userAgent));
            logPo.setBrowserVersion(UserAgentUtils.getBrowserVersion(userAgent));
            logPo.setOs(UserAgentUtils.getOperatingSystem(userAgent));
            logPo.setOsVersion(UserAgentUtils.getOperatingSystemVersion(userAgent));
            logPo.setDevice(UserAgentUtils.getDeviceType(userAgent));
            logPo.setDeviceModel(UserAgentUtils.getDeviceModel(userAgent));


            // 记录用户信息（从Spring Security或Session获取）
//            ByUser user = getUserInfo();
//            if (user != null) {
//            }

            // 记录参数
//            if (annotation.recordParams()) {
//                Object[] args = joinPoint.getArgs();
//                String params = Arrays.toString(args);
//                logEntity.setRequestParams(params);
//            }
//
//            // 记录返回值
//            if (annotation.recordResult() && result != null) {
//                logEntity.setResult(JSON.toJSONString(result));
//            }

            // 异步保存日志
            logService.save(logPo);

        } catch (Exception e) {
            log.error("记录操作日志异常", e);
        }
    }

    private String getClientIP() {
        // 获取客户端IP的逻辑
        String ip = request.getHeader("X-Forwarded-For");
        if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

}
