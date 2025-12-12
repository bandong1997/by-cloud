package com.by.dsd.service.impl;

import com.by.dsd.entity.Roles;
import com.by.dsd.mapper.RolesMapper;
import com.by.dsd.result.Result;
import com.by.dsd.service.RolesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 角色表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2025-12-12
 */
@Service
public class RolesServiceImpl extends ServiceImpl<RolesMapper, Roles> implements RolesService {


    /**
     * 整个 Mapper 都使用 db2 数据源
     * 如果需要某个方法使用不同数据源，可以覆盖
     */
    @Override
    public Result selectFromMaster(Integer id) {
        return Result.success(this.baseMapper.selectFromMaster(id));
    }

    /**
     * 整个 Mapper 都使用 db2 数据源
     * 这个方法使用类级别的 db2 数据源
     */
    @Override
    public Result selectByAllDeputy() {
        return Result.success(this.baseMapper.selectByAll());
    }

}
