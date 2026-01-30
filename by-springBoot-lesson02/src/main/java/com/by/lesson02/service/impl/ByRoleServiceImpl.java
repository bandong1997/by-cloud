package com.by.lesson02.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.by.common.constant.CommonStatus;
import com.by.common.utils.HttpContextUtils;
import com.by.common.utils.IdUtil;
import com.by.lesson02.dto.RoleDto;
import com.by.lesson02.entity.ByRole;
import com.by.lesson02.mapper.ByRoleMapper;
import com.by.lesson02.result.Result;
import com.by.lesson02.result.ResultCode;
import com.by.lesson02.service.ByOperateLogService;
import com.by.lesson02.service.ByRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.by.lesson02.utils.Constants;
import com.by.lesson02.utils.RoleTreeBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 系统角色信息表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2026-01-29
 */
@Service
public class ByRoleServiceImpl extends ServiceImpl<ByRoleMapper, ByRole> implements ByRoleService {

    @Autowired
    private ByOperateLogService logService;

    @Override
    public Result finRoleTree(RoleDto dto) {

        try {
            LambdaQueryWrapper<ByRole> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(ByRole::getStatus, CommonStatus.ACTIVE);
            List<ByRole> list = baseMapper.selectList(wrapper);

            List<ByRole> treeList = new ArrayList<>();
            if (!StringUtils.isEmpty(dto.getRoleName())) {
                treeList = RoleTreeBuilder.buildTreeByRoleName(list, dto.getRoleName());
            } else {
                treeList = RoleTreeBuilder.buildRoleTree(list);
            }
            // 日志
            logService.saveOperateLogAsync(Constants.LOG_ROLE_TITLE, Constants.LOG_TYPE_QUERY, HttpContextUtils.getHttpServletRequest());
            return Result.success(treeList);
        } catch (Exception e) {
            return Result.fail(e.getMessage());
        }

    }

    @Override
    public Result insertOrUpdateRole(ByRole role) {


        try {
            if(!StringUtils.isEmpty(role.getRoleId())) {
                baseMapper.updateById(role);
            } else {
                LambdaQueryWrapper<ByRole> wrapper = new LambdaQueryWrapper<>();
                wrapper.eq(ByRole::getRoleCode, role.getRoleCode());
                List<ByRole> list = baseMapper.selectList(wrapper);
                if (!list.isEmpty()) {
                    return Result.fail(ResultCode.REPEAT_CODE.getCode(), ResultCode.REPEAT_CODE.getMessage());
                }
                role.setRoleId(IdUtil.getUuid());
                baseMapper.insert(role);
            }
            // 日志
            logService.saveOperateLogAsync(Constants.LOG_ROLE_TITLE, Constants.LOG_TYPE_UPDATE, HttpContextUtils.getHttpServletRequest());
            return Result.success();
        } catch (Exception e) {
            return Result.fail(e.getMessage());
        }
    }

    @Override
    public Result deletRoleByRoleId(String roleId) {
        try {
            // 日志
            logService.saveOperateLogAsync(Constants.LOG_ROLE_TITLE, Constants.LOG_TYPE_DELETE, HttpContextUtils.getHttpServletRequest());
            return Result.success(baseMapper.deleteById(roleId));
        } catch (Exception e) {
            return Result.fail(e.getMessage());
        }
    }
}
