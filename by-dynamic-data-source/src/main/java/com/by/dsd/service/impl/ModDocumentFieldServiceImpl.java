package com.by.dsd.service.impl;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.dynamic.datasource.toolkit.DynamicDataSourceContextHolder;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.by.dsd.entity.ModDocumentField;
import com.by.dsd.entity.SysUser;
import com.by.dsd.mapper.ModDocumentFieldMapper;
import com.by.dsd.result.Result;
import com.by.dsd.service.ModDocumentFieldService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.UUID;

/**
 * <p>
 * 公文字段	 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2025-12-11
 * 主从分离的业务
 */
@Service
public class ModDocumentFieldServiceImpl extends ServiceImpl<ModDocumentFieldMapper, ModDocumentField> implements ModDocumentFieldService {

    // 读操作使用 db2（从库）
    @DS("db2")
    @Override
    public Result getDocumentFieldInfo(String id) {
        LambdaQueryWrapper<ModDocumentField> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(ModDocumentField::getId, id);
        return Result.success(baseMapper.selectOne(wrapper));
    }

    // 写操作使用 master（主库）
    @DS("master")
    @Override
    public Result createDocumentField(ModDocumentField modDocumentField) {
        modDocumentField.setId(UUID.randomUUID().toString().replaceAll("-", ""));
        modDocumentField.setCreateTime(String.valueOf(new Date()));
        modDocumentField.setCreateUser("admin");
        return Result.success(baseMapper.insert(modDocumentField));
    }

    @Override
    public Result modDocumentFieldService(String id) {

        // 1. 从 db2 查询
        ModDocumentField po = getDocumentFieldInfo2(id);
        // // 2. 向 master 写入
        // 手动切换数据源到master
        DynamicDataSourceContextHolder.push("master");
        po.setId(UUID.randomUUID().toString().replaceAll("-", ""));
        po.setModifyTime(String.valueOf(new Date()));
        po.setModifyUser("by");
        return Result.success(this.createDocumentField(po));
    }

    public ModDocumentField getDocumentFieldInfo2(String id) {
        // 手动切换数据源到db2
        DynamicDataSourceContextHolder.push("db2");

        LambdaQueryWrapper<ModDocumentField> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(ModDocumentField::getId, id);
        ModDocumentField po = baseMapper.selectOne(wrapper);
        return po;
    }

}
