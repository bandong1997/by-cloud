package com.by.lesson02.mapper;

import com.by.lesson02.entity.ByUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.by.lesson02.vo.UserPermissionVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 系统用户基本信息表 Mapper 接口
 * </p>
 *
 * @author bdd
 * @since 2026-01-29
 */
public interface ByUserMapper extends BaseMapper<ByUser> {

    @Select("SELECT " +
            "bu.user_id, bu.real_name, bu.email, bu.phone, " +
            "br.role_code, br.role_name, br.role_desc, " +
            "bp.permission_code, bp.permission_name, bp.permission_type " +
            "FROM by_user bu " +
            "LEFT JOIN by_user_role bur ON bu.user_id = bur.user_id " +
            "LEFT JOIN by_role br ON bur.role_id = br.role_id " +
            "LEFT JOIN by_role_permission brp ON br.role_id = brp.role_id " +
            "LEFT JOIN by_permission bp ON brp.permission_id = bp.permission_id " +
            "WHERE bu.user_id = #{userId}")
    List<Map<String, Object>> getUserPermissions(@Param("userId") String userId);


    List<UserPermissionVO> getUserPermissions2(@Param("userId") String userId);
}
