package com.by.contract.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.by.common.result.Result;
import com.by.common.result.ResultCode;
import com.by.contract.dto.ContractDto;
import com.by.contract.entity.Contract;
import com.by.contract.mapper.ContractMapper;
import com.by.contract.service.ContractService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;

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


    @Override
    public Result saveContract(ContractDto contractDto) {

        LambdaQueryWrapper<Contract> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Contract::getContractName, contractDto.getContractName());
        queryWrapper.eq(Contract::getContractCode, contractDto.getContractCode());
        List<Contract> contracts = baseMapper.selectList(queryWrapper);
        if (!contracts.isEmpty()) {
            return Result.fail(ResultCode.PARAM_ERROR.getCode(), "合同名称/编号已存在");
        }

        Contract po = new Contract();
        BeanUtils.copyProperties(contractDto, po);
        baseMapper.insert(po);
        return Result.success(ResultCode.SUCCESS);
    }
}
