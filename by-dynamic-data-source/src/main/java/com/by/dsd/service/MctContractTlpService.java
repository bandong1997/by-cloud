package com.by.dsd.service;

import com.by.dsd.entity.MctContractTlp;
import com.baomidou.mybatisplus.extension.service.IService;
import com.by.dsd.result.Result;

/**
 * <p>
 * 合同模板表 服务类
 * </p>
 *
 * @author bdd
 * @since 2025-12-10
 */
public interface MctContractTlpService extends IService<MctContractTlp> {

    /**
     * 整个 Mapper 都使用 db2 数据源
     * 如果需要某个方法使用不同数据源，可以覆盖
     */
    Result selectFromMaster(String id);

    /**
     * 整个 Mapper 都使用 db2 数据源
     * 这个方法使用类级别的 db2 数据源
     */
    Result selectByAll();
}
