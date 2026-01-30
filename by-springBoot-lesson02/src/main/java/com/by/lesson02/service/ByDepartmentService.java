package com.by.lesson02.service;

import com.by.lesson02.entity.ByDepartment;
import com.baomidou.mybatisplus.extension.service.IService;
import com.by.lesson02.result.Result;

/**
 * <p>
 * 部门信息表 服务类
 * </p>
 *
 * @author bdd
 * @since 2026-01-30
 */
public interface ByDepartmentService extends IService<ByDepartment> {

    Result finDepartmentTree();
}
