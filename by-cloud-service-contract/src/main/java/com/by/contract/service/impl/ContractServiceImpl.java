package com.by.contract.service.impl;

import com.baomidou.dynamic.datasource.toolkit.DynamicDataSourceContextHolder;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.by.common.result.Result;
import com.by.common.result.ResultCode;
import com.by.common.utils.IdUtil;
import com.by.common.utils.asc.CryptoUtil;
import com.by.contract.dto.ContractPageDto;
import com.by.contract.entity.MctContractHisPo;
import com.by.contract.entity.MctContractPo;
import com.by.contract.mapper.MctContractHisMapper;
import com.by.contract.mapper.MctContractMapper;
import com.by.contract.service.ContractService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Date;
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
public class ContractServiceImpl extends ServiceImpl<MctContractMapper, MctContractPo>
        implements ContractService {

    @Autowired
    private MctContractHisMapper mctContractHisMapper;


    @Override
    public Result enidContract(MctContractPo contractPo) {

        if (contractPo.getId().isEmpty()){
            // ID 为空表示新增
            LambdaQueryWrapper<MctContractPo> queryWrapper = new LambdaQueryWrapper<>();
            if (!StringUtils.isEmpty(contractPo.getName())){
                queryWrapper.eq(MctContractPo::getName, contractPo.getName());
                List<MctContractPo> contracts = baseMapper.selectList(queryWrapper);
                if (!contracts.isEmpty()){
                    return Result.fail(ResultCode.PARAM_ERROR.getCode(), "合同名称[" + contractPo.getName() + "]已存在");
                }
            }
            if (!StringUtils.isEmpty(contractPo.getContractNumber())){
                queryWrapper.eq(MctContractPo::getContractNumber, contractPo.getContractNumber());
                List<MctContractPo> contracts = baseMapper.selectList(queryWrapper);
                if (!contracts.isEmpty()){
                    return Result.fail(ResultCode.PARAM_ERROR.getCode(), "合同名称[" + contractPo.getContractNumber() + "]已存在");
                }
            }
            // 生成AES密钥
            String aesKey = CryptoUtil.generateAESKey();
            System.out.println("生成的AES密钥: " + aesKey);
            contractPo.setAesKey(aesKey);
            String encryptedData = CryptoUtil.aesEncrypt(contractPo.getContent(), aesKey);
            contractPo.setContent(encryptedData);
            baseMapper.insert(contractPo);
            return Result.success(ResultCode.SUCCESS);
        } else {
            // 修改
            LambdaQueryWrapper<MctContractPo> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(MctContractPo::getId, contractPo.getId());
            MctContractPo po = baseMapper.selectOne(queryWrapper);
            if (po != null){

                DynamicDataSourceContextHolder.push("db2");
                try {
                    MctContractHisPo hisPo = new MctContractHisPo();
                    BeanUtils.copyProperties(po, hisPo);
                    hisPo.setId(IdUtil.getUuid());
                    hisPo.setContractId(contractPo.getId());
                    mctContractHisMapper.insert(hisPo);
                } finally {
                    DynamicDataSourceContextHolder.poll();
                }

                DynamicDataSourceContextHolder.push("master");
                try {
                    String version = po.getVersion();
                    double v = Double.parseDouble(version);
                    BeanUtils.copyProperties(contractPo, po);
                    po.setVersion(String.format("%.1f", v + 0.1));
                    po.setModifyTime(new Date());
                    po.setModifyUser("by");

                    // 生成AES密钥
                    String aesKey = CryptoUtil.generateAESKey();
                    System.out.println("生成的AES密钥: " + aesKey);
                    po.setAesKey(aesKey);
                    String encryptedData = CryptoUtil.aesEncrypt(contractPo.getContent(), aesKey);
                    po.setContent(encryptedData);
                    baseMapper.updateById(po);
                } finally {
                    DynamicDataSourceContextHolder.poll();
                }

            }
            return Result.success(ResultCode.SUCCESS);
        }
    }

    @Override
    public Result contractPage(ContractPageDto contractPageDto) {

        LambdaQueryWrapper<MctContractPo> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(MctContractPo::getDelStatus, 0);

        Page<MctContractPo> page = new Page<>(contractPageDto.getPageSize(), contractPageDto.getPageNumber());
        Page<MctContractPo> pageList = baseMapper.selectPage(page, wrapper);
        List<MctContractPo> list = pageList.getRecords();
        if (!list.isEmpty()) {
            for (MctContractPo contract : list) {
                // 执行AES解密
                String content = CryptoUtil.aesDecrypt(contract.getContent(), contract.getAesKey());
                contract.setContent(content);
            }
        }
        return Result.success(list);
    }
}
