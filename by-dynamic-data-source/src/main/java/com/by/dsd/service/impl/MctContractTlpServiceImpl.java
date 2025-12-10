package com.by.dsd.service.impl;

import com.by.dsd.entity.MctContractTlp;
import com.by.dsd.mapper.MctContractTlpMapper;
import com.by.dsd.result.Result;
import com.by.dsd.service.MctContractTlpService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 合同模板表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2025-12-10
 */
@Service
public class MctContractTlpServiceImpl extends ServiceImpl<MctContractTlpMapper, MctContractTlp>
        implements MctContractTlpService {

    /**
     * 整个 Mapper 都使用 db2 数据源
     * 如果需要某个方法使用不同数据源，可以覆盖
     */
    @Override
    public Result selectFromMaster(String id) {
        return Result.success(this.baseMapper.selectFromMaster(id));
    }

    /**
     * 整个 Mapper 都使用 db2 数据源
     * 这个方法使用类级别的 db2 数据源
     */
    @Override
    public Result selectByAll() {
        return Result.success(this.baseMapper.selectByAll());
    }
}
