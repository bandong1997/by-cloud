package com.by.lesson02.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.by.lesson02.dto.ContractPageDto;
import com.by.lesson02.entity.Contract;
import com.by.lesson02.mapper.ContractMapper;
import com.by.lesson02.result.Result;
import com.by.lesson02.result.ResultCode;
import com.by.lesson02.service.ContractService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.by.lesson02.utils.Constants;
import org.hibernate.validator.internal.util.Contracts;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 合同主表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2026-01-05
 */
@Service
public class ContractServiceImpl extends ServiceImpl<ContractMapper, Contract> implements ContractService {

    @Override
    public Result findContractList(ContractPageDto dto) {

        LambdaQueryWrapper<Contract> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Contract::getIsDeleted, Constants.IS_DELETED_NO);
        // 名称不为空
        if (!StringUtils.isEmpty(dto.getContractName())) {
            queryWrapper.like(Contract::getContractName, dto.getContractName());
        }

        // 分页查询
        Page<Contract> page = new Page<>(dto.getPageNumber(), dto.getPageSize());
        Page<Contract> pageList = baseMapper.selectPage(page, queryWrapper);
        List<Contract> list = pageList.getRecords();

        Map<String, Object> map = new HashMap<>();
        map.put("records", list);
        map.put("total", pageList.getTotal());
        map.put("size", pageList.getSize());
        map.put("current", pageList.getCurrent());
        map.put("pages", pageList.getPages());

        return Result.success(map);
    }

    /**
     * 带Id修改， 不带Id新增
     * @param contractPo
     * @return
     */
    @Override
    public Result editContract(Contract contractPo) {

        if (contractPo.getId() == null) {
            baseMapper.insert(contractPo);
        } else {
            baseMapper.updateById(contractPo);
                   }
        return Result.success(ResultCode.SUCCESS);
    }
}
