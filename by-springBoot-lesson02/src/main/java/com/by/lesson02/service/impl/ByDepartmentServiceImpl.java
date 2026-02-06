package com.by.lesson02.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.by.common.constant.CommonStatus;
import com.by.common.utils.HttpContextUtils;
import com.by.lesson02.entity.ByDepartment;
import com.by.lesson02.entity.ByPermission;
import com.by.lesson02.mapper.ByDepartmentMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.by.lesson02.result.Result;
import com.by.lesson02.service.ByDepartmentService;
import com.by.lesson02.service.ByOperateLogService;
import com.by.lesson02.utils.Constants;
import com.by.lesson02.utils.TreeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 部门信息表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2026-01-30
 */
@Service
public class ByDepartmentServiceImpl extends ServiceImpl<ByDepartmentMapper, ByDepartment> implements ByDepartmentService {

    @Autowired
    private ByOperateLogService logService;

    @Override
    public Result finDepartmentTree() {
        LambdaQueryWrapper<ByDepartment> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(ByDepartment::getStatus, CommonStatus.ACTIVE);
        List<ByDepartment> list = baseMapper.selectList(wrapper);
        List<ByDepartment> treeList = TreeUtil.buildByDepartmentTree(list);
        // 日志
        // logService.saveOperateLogAsync(Constants.LOG_DEPARTMENT_TITLE, Constants.LOG_TYPE_QUERY, HttpContextUtils.getHttpServletRequest());

        return Result.success(treeList);
    }
}
