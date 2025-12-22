package com.by.devtool.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.by.devtool.entity.UserPo;
import com.by.devtool.mapper.UserPoMapper;
import com.by.devtool.service.UserPoService;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;


/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2025-12-12
 */
@Service
public class UserPoServiceImpl extends ServiceImpl<UserPoMapper, UserPo> implements UserPoService {

}
