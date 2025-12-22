package com.by.lesson.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.by.lesson.entity.UserPo;
import com.by.lesson.mapper.UserPoMapper;
import com.by.lesson.result.Result;
import com.by.lesson.service.UserOperationLogPoService;
import com.by.lesson.service.UserPoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


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

    @Autowired
    private UserOperationLogPoService userOperationLogPoService;

    @Override
    public Result findAll() {
        userOperationLogPoService.saveOperationLogAsync("QUERY");
        List<UserPo> list = baseMapper.selectList(new QueryWrapper<>());
        return Result.success(list);
    }
}
