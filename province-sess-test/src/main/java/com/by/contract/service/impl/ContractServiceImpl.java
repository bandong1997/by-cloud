package com.by.contract.service.impl;

import com.by.contract.entity.Contract;
import com.by.contract.mapper.ContractMapper;
import com.by.contract.service.ContractService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 合同信息表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2025-08-26
 */
@Service
public class ContractServiceImpl extends ServiceImpl<ContractMapper, Contract> implements ContractService {

}
