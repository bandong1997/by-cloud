package com.by.dsd.service.impl;

import com.by.dsd.entity.UserAuthentications;
import com.by.dsd.mapper.UserAuthenticationsMapper;
import com.by.dsd.service.UserAuthenticationsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户第三方认证表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2025-12-12
 */
@Service
public class UserAuthenticationsServiceImpl extends ServiceImpl<UserAuthenticationsMapper, UserAuthentications> implements UserAuthenticationsService {

}
