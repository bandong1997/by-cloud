package com.by.devtool.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.by.devtool.entity.SysUser;
import com.by.devtool.mapper.SysUserMapper;
import com.by.devtool.service.SysUserService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author bandd
 * @since 2025-10-11
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    @Override
    public SysUser findUserById(Long id) {
        return baseMapper.selectById(id);
    }
}
