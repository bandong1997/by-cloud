package com.by.dsd.service;

import com.by.dsd.entity.ModDocumentField;
import com.baomidou.mybatisplus.extension.service.IService;
import com.by.dsd.result.Result;

/**
 * <p>
 * 公文字段	 服务类
 * </p>
 *
 * @author bdd
 * @since 2025-12-11
 */
public interface ModDocumentFieldService extends IService<ModDocumentField> {

    Result getDocumentFieldInfo(String id);

    Result createDocumentField(ModDocumentField modDocumentField);

    Result modDocumentFieldService(String id);
}
