package com.by.dsd.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.by.dsd.entity.MctField;

/**
 * <p>
 * 模板对应灵活字段 Mapper 接口
 * </p>
 *
 * @author bdd
 * @since 2025-12-10
 */
@Mapper
@DS("db2")  // 整个 Mapper 都使用 db2 数据源
public interface MctFieldMapper extends BaseMapper<MctField> {

    // 如果需要某个方法使用不同数据源，可以覆盖
    @DS("master")
    @Select("SELECT * FROM users WHERE id = #{id}")
    User selectFromMaster(Long id);

    // 这个方法使用类级别的 db2 数据源
    @Select("SELECT * FROM users WHERE name = #{name}")
    User selectByName(String name);

}
