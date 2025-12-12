package com.by.dsd.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.by.dsd.entity.Roles;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * 角色表 Mapper 接口
 * </p>
 *
 * @author bdd
 * @since 2025-12-12
 */
@DS("db2")  // 类级别默认使用 db2
public interface RolesMapper extends BaseMapper<Roles> {

    // 如果需要某个方法使用不同数据源，可以覆盖
    @DS("master")
    @Select("SELECT * FROM roles WHERE id = #{id}")
    Roles selectFromMaster(Integer id);

    // 这个方法使用类级别的 db2 数据源
    @Select("SELECT * FROM roles")
    List<Roles> selectByAll();

}
