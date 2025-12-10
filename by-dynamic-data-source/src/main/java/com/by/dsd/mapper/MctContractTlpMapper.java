package com.by.dsd.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.by.dsd.entity.MctContractTlp;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * 合同模板表 Mapper 接口
 * </p>
 *
 * @author bdd
 * @since 2025-12-10
 */
@Mapper
@DS("db2")  // 整个 Mapper 都使用 db2 数据源
public interface MctContractTlpMapper extends BaseMapper<MctContractTlp> {

    // 如果需要某个方法使用不同数据源，可以覆盖
    @DS("master")
    @Select("SELECT * FROM mct_contract_tlp WHERE id = #{id}")
    MctContractTlp selectFromMaster(String id);

    // 这个方法使用类级别的 db2 数据源
    @Select("SELECT * FROM mct_contract_tlp")
    List<MctContractTlp> selectByAll();

}
