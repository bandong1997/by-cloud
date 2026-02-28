package com.by.lesson02.service;

import com.by.lesson02.entity.ByTreeDict;
import com.baomidou.mybatisplus.extension.service.IService;
import com.by.lesson02.result.Result;

/**
 * <p>
 * 业务树形字典表 服务类
 * </p>
 *
 * @author bdd
 * @since 2026-02-28
 */
public interface ByTreeDictService extends IService<ByTreeDict> {

    Result findTreeDict();
}
