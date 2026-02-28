package com.by.lesson02.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.by.lesson02.entity.ByTreeDict;
import com.by.lesson02.mapper.ByTreeDictMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.by.lesson02.result.Result;
import com.by.lesson02.service.ByTreeDictService;
import com.by.lesson02.utils.TreeUtil;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 业务树形字典表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2026-02-28
 */
@Service
public class ByTreeDictServiceImpl extends ServiceImpl<ByTreeDictMapper, ByTreeDict> implements ByTreeDictService {

    @Override
    public Result findTreeDict() {
        List<ByTreeDict> list = baseMapper.selectList(new QueryWrapper<>());
        List<ByTreeDict> treeList = TreeUtil.buildByTreeDict(list);
        return Result.success(treeList);
    }
}
