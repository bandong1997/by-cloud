package com.by.dsd.service.impl;

import com.by.dsd.entity.EmailVerifications;
import com.by.dsd.mapper.EmailVerificationsMapper;
import com.by.dsd.service.EmailVerificationsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 邮件验证表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2025-12-12
 */
@Service
public class EmailVerificationsServiceImpl extends ServiceImpl<EmailVerificationsMapper, EmailVerifications> implements EmailVerificationsService {

}
