package com.by.upms.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.by.upms.entity.SysUser;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * @author bdd
 * @since 2025-08-24
 */
public interface SysUserMapper extends BaseMapper<SysUser> {


    /**
     * 根据用户名查询用户信息
     */
    @Select("SELECT * FROM sys_user WHERE username = #{username}")
    SysUser findByUsername(String username);

    /**
     * 检查用户名是否已存在
     */
    @Select("SELECT COUNT(*) > 0 FROM sys_user WHERE username = #{username}")
    boolean existsByUsername(String username);

}
