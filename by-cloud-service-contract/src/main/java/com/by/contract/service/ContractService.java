package com.by.contract.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.by.common.result.Result;
import com.by.contract.dto.ContractPageDto;
import com.by.contract.entity.MctContractPo;

/**
 * <p>
 * 合同信息表 服务类
 * </p>
 *
 * @author bdd
 * @since 2025-08-26
 */
public interface ContractService extends IService<MctContractPo> {

    Result enidContract(MctContractPo contractPo);

    Result contractPage(ContractPageDto contractPageDto);
}
