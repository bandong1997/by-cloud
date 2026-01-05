package com.by.lesson02.service.impl;

import com.by.lesson02.entity.ContractAuditLog;
import com.by.lesson02.mapper.ContractAuditLogMapper;
import com.by.lesson02.service.ContractAuditLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 审计日志表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2026-01-05
 */
@Service
public class ContractAuditLogServiceImpl extends ServiceImpl<ContractAuditLogMapper, ContractAuditLog> implements ContractAuditLogService {

}
