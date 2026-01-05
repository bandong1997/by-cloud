package com.by.lesson02.service;

import com.by.lesson02.dto.ContractPageDto;
import com.by.lesson02.entity.Contract;
import com.baomidou.mybatisplus.extension.service.IService;
import com.by.lesson02.result.Result;

/**
 * <p>
 * 合同主表 服务类
 * </p>
 *
 * @author bdd
 * @since 2026-01-05
 */
public interface ContractService extends IService<Contract> {

    Result findContractList(ContractPageDto dto);

    Result editContract(Contract contractPo);
}
