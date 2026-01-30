package com.by.lesson02.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.by.common.constant.CommonStatus;
import com.by.common.utils.HttpContextUtils;
import com.by.lesson02.entity.ByPermission;
import com.by.lesson02.entity.ByRole;
import com.by.lesson02.mapper.ByPermissionMapper;
import com.by.lesson02.result.Result;
import com.by.lesson02.service.ByOperateLogService;
import com.by.lesson02.service.ByPermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.by.lesson02.utils.Constants;
import com.by.lesson02.utils.TreeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 系统权限点信息表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2026-01-29
 */
@Service
public class ByPermissionServiceImpl extends ServiceImpl<ByPermissionMapper, ByPermission> implements ByPermissionService {

    @Autowired
    private ByOperateLogService logService;

    @Override
    public Result finPermissionTree() {
        LambdaQueryWrapper<ByPermission> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(ByPermission::getStatus, CommonStatus.ACTIVE);
        List<ByPermission> list = baseMapper.selectList(wrapper);
        List<ByPermission> treeList = TreeUtil.buildByPermissionTree(list);

        // 日志
        logService.saveOperateLogAsync(Constants.LOG_PERMISSION_TITLE, Constants.LOG_TYPE_QUERY, HttpContextUtils.getHttpServletRequest());

        return Result.success(treeList);
    }
}
