package com.by.lesson02.service.impl;

import com.by.lesson02.entity.ByUserRole;
import com.by.lesson02.mapper.ByUserRoleMapper;
import com.by.lesson02.service.ByUserRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户和角色关联关系表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2026-01-29
 */
@Service
public class ByUserRoleServiceImpl extends ServiceImpl<ByUserRoleMapper, ByUserRole> implements ByUserRoleService {

}
