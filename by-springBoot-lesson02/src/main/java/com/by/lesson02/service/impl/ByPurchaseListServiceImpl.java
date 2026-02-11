package com.by.lesson02.service.impl;

import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.by.lesson02.dto.PurchaseDto;
import com.by.lesson02.entity.ByPurchaseList;
import com.by.lesson02.listener.ByPurchaseListExcelListener;
import com.by.lesson02.listener.ByPurchaseListVoExcelListener;
import com.by.lesson02.mapper.ByPurchaseListMapper;
import com.by.lesson02.result.Result;
import com.by.lesson02.service.ByPurchaseListService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.by.lesson02.utils.Constants;
import com.by.lesson02.vo.ByPurchaseListVo;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.TimeUnit;

/**
 * <p>
 * 部门采购清单表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2026-02-06
 */
@Service
public class ByPurchaseListServiceImpl extends ServiceImpl<ByPurchaseListMapper, ByPurchaseList> implements ByPurchaseListService {


    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    /**
     * 日志记录器，用于记录当前类的操作日志
     */
    private static final Logger logger = LoggerFactory.getLogger(ByPurchaseListServiceImpl.class);

    @Override
    public void exportExcel(HttpServletResponse response, PurchaseDto purchaseDto) throws IOException {
        // 设置响应内容类型为Excel文件格式（OpenXML格式的Excel文件）
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

        // 设置响应内容的字符编码为UTF-8，确保中文等特殊字符正确处理
        response.setCharacterEncoding("utf-8");

        // 对文件名进行URL编码，确保文件名中的特殊字符能够正确处理
        // 使用UTF-8编码，并将空格（编码后为+）替换为%20，符合URL编码规范
        String fileName = URLEncoder.encode("采购清单", StandardCharsets.UTF_8).replaceAll("\\+", "%20");

        // 设置Content-Disposition响应头，告诉浏览器这是一个需要下载的附件
        // filename* 使用RFC 5987标准，支持UTF-8编码的文件名
        // utf-8'' 表示使用UTF-8编码，后面是编码后的文件名
//        response.setHeader("Content-disposition", "attachment;filename*=utf-8''" + fileName + ".xlsx");
        response.setHeader("Content-disposition", "attachment;filename*=" + fileName + ".xlsx");

        // 进行分页查询
        LambdaQueryWrapper<ByPurchaseList> queryWrapper = new LambdaQueryWrapper<>();
        if (!StringUtils.isEmpty(purchaseDto.getItemName())) {
            queryWrapper.like(ByPurchaseList::getItemName, purchaseDto.getItemName());
        }
        Page<ByPurchaseList> page = new Page<>( purchaseDto.getPageNumber(), purchaseDto.getPageSize());
        Page<ByPurchaseList> pageList = baseMapper.selectPage(page, queryWrapper);
        List<ByPurchaseList> list = pageList.getRecords();

        List<ByPurchaseListVo> vos = convertEntityToTemplate(list);

        // 使用EasyExcel库将数据写入Excel文件
        EasyExcel.write(response.getOutputStream(), ByPurchaseListVo.class) // 指定输出流和数据对应的Java类
                .sheet("采购清单")                             // 设置工作表的名称
                .doWrite(vos);                           // 执行写入操作，将dataList中的数据写入Excel

        logger.info("成功导出 {} 条数据", list.size());
//        return Result.success("成功导出 {} 条数据", list.size());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result importExcel(InputStream inputStream) {

        // 封装读取的数据
        List<ByPurchaseListVo> dataList = new ArrayList<>();
        // 返回结果
        Map<String, Object> map = new HashMap<>();

        try {
            // 从模板中读取数据
            EasyExcel.read(inputStream, ByPurchaseListVo.class, new ByPurchaseListVoExcelListener(dataList::addAll)).sheet().doRead();
            // 批量保存数据
            List<ByPurchaseList> vos = convertTemplateToEntity(dataList);
            this.saveBatch(vos, 100);
            map.put("dataList", vos);
            map.put("count", vos.size());
            logger.info("成功导入 {} 条数据", vos.size());
            return Result.success(map);
        } catch (Exception e) {
            logger.error("导入失败", e);
            return Result.fail(e.getMessage());
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result importExcelBatch(InputStream inputStream) {
        final List<ByPurchaseListVo> importedList = new ArrayList<>();
        // 返回结果
        Map<String, Object> map = new HashMap<>();
        try {
            EasyExcel.read(inputStream, ByPurchaseListVo.class, new ByPurchaseListVoExcelListener(new ByPurchaseListVoExcelListener.DataHandler<ByPurchaseListVo>() {

                @Override
                public void handle(List<ByPurchaseListVo> dataList) {
                    if (!dataList.isEmpty()) {
                        List<ByPurchaseList> byPurchaseList = convertTemplateToEntity(dataList);
                        saveBatch(byPurchaseList);
                    }
                    importedList.addAll(dataList);
                    logger.info("批次处理: 接收到 {} 条数据", dataList.size());
                }
            })).sheet().doRead();
            map.put("dataList", importedList);
            map.put("count", importedList.size());
            logger.info("成功导入并保存 {} 条数据", importedList.size());
            return Result.success(map);
        } catch (Exception e) {
            logger.error("导入并保存Excel数据失败", e);
            return Result.fail("导入并保存Excel数据失败: " + e.getMessage());
        }
    }

    @Override
    public void downloadTemplate(HttpServletResponse response) throws IOException {
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setCharacterEncoding("utf-8");
        String fileName = URLEncoder.encode("采购清单模板", StandardCharsets.UTF_8).replaceAll("\\+", "%20");
//        response.setHeader("Content-disposition", "attachment;filename*=utf-8''" + fileName + ".xlsx");
        response.setHeader("Content-disposition", "attachment;filename*=" + fileName + ".xlsx");

        EasyExcel.write(response.getOutputStream(), ByPurchaseListVo.class)
                .sheet("采购清单")
                .doWrite(new ArrayList<>());

        logger.info("成功下载模板文件");
    }

    // vo ---> po
    private List<ByPurchaseList> convertTemplateToEntity(List<ByPurchaseListVo> template) {
        List<ByPurchaseList> list = new ArrayList<>();
        for (ByPurchaseListVo byPurchaseListVo : template) {
            ByPurchaseList entity = new ByPurchaseList();
            entity.setDepartmentId(byPurchaseListVo.getDepartmentId());
            entity.setDepartmentName(byPurchaseListVo.getDepartmentName());
            entity.setItemName(byPurchaseListVo.getItemName());
            entity.setItemCategory(byPurchaseListVo.getItemCategory());
            entity.setSpecification(byPurchaseListVo.getSpecification());
            entity.setUnit(byPurchaseListVo.getUnit());
            entity.setQuantity(byPurchaseListVo.getQuantity());
            entity.setEstimatedPrice(byPurchaseListVo.getEstimatedPrice());
            entity.setEstimatedTotal(byPurchaseListVo.getEstimatedTotal());
            entity.setPurpose(byPurchaseListVo.getPurpose());
            entity.setUrgencyLevel(byPurchaseListVo.getUrgencyLevel());
            entity.setRequiredDate(byPurchaseListVo.getRequiredDate());
            entity.setStatus(byPurchaseListVo.getStatus());
            entity.setApplicantId(byPurchaseListVo.getApplicantId());
            entity.setApplicantName(byPurchaseListVo.getApplicantName());
            list.add(entity);
        }
        return list;
    }

    // po ---> vo
    private List<ByPurchaseListVo> convertEntityToTemplate(List<ByPurchaseList> template) {
        List<ByPurchaseListVo> list = new ArrayList<>();
        for (ByPurchaseList byPurchaseList : template) {
            ByPurchaseListVo entity = new ByPurchaseListVo();
            entity.setDepartmentId(byPurchaseList.getDepartmentId());
            entity.setDepartmentName(byPurchaseList.getDepartmentName());
            entity.setItemName(byPurchaseList.getItemName());
            entity.setItemCategory(byPurchaseList.getItemCategory());
            entity.setSpecification(byPurchaseList.getSpecification());
            entity.setUnit(byPurchaseList.getUnit());
            entity.setQuantity(byPurchaseList.getQuantity());
            entity.setEstimatedPrice(byPurchaseList.getEstimatedPrice());
            entity.setEstimatedTotal(byPurchaseList.getEstimatedTotal());
            entity.setPurpose(byPurchaseList.getPurpose());
            entity.setUrgencyLevel(byPurchaseList.getUrgencyLevel());
            entity.setRequiredDate(byPurchaseList.getRequiredDate());
            entity.setStatus(byPurchaseList.getStatus());
            entity.setApplicantId(byPurchaseList.getApplicantId());
            entity.setApplicantName(byPurchaseList.getApplicantName());
            list.add(entity);
        }
        return list;
    }

    @Override
    public Result findPagePurchaseList(PurchaseDto purchaseDto) {

        // 封装返回结构
        Map<String, Object> map = new HashMap<>();

        // 定义key
        String pageKey = Constants.PURCHASE_PAGE_KEY + purchaseDto.getPageNumber() + ":" + purchaseDto.getPageSize();
        // 1. 先尝试从Redis获取分页数据
        Page<ByPurchaseList> pageList = (Page<ByPurchaseList>) redisTemplate.opsForValue().get(pageKey);
        if (pageList != null) {
            // redis中存在数据
            map.put("records", pageList.getRecords());
            map.put("total", pageList.getTotal());
            map.put("size", pageList.getSize());
            map.put("current", pageList.getCurrent());
            map.put("pages", pageList.getPages());
        }


        // 2. Redis中没有，查询数据库
        Page<ByPurchaseList> page = new Page<>(purchaseDto.getPageNumber(), purchaseDto.getPageSize());
        pageList = baseMapper.selectPage(page, new QueryWrapper<>());
        map.put("records", pageList.getRecords());
        map.put("total", pageList.getTotal());
        map.put("size", pageList.getSize());
        map.put("current", pageList.getCurrent());
        map.put("pages", pageList.getPages());

        // 3. 将数据存入Redis
        redisTemplate.opsForValue().set(pageKey, pageList, 1, TimeUnit.HOURS); // 缓存1小时

        // 4. 缓存列表数据到Redis（按ID存储）
        cachePurchaseListToRedis(pageList.getRecords());

        return Result.success(map);
    }

    /**
     * 将采购列表数据缓存到Redis（按ID存储）
     */
    private void cachePurchaseListToRedis(List<ByPurchaseList> list) {
        if (list == null || list.isEmpty()) {
            return;
        }
        for (ByPurchaseList purchase : list) {
            String key = Constants.PURCHASE_LIST_KEY + purchase.getId();
            redisTemplate.opsForValue().set(key, purchase, 1, TimeUnit.HOURS);
        }
    }

    /**
     * 根据ID查询采购清单详情（带缓存）
     */
    public ByPurchaseList getPurchaseById(Long id) {
        String key = Constants.PURCHASE_LIST_KEY + id;

        // 1. 先查Redis
        ByPurchaseList purchase = (ByPurchaseList) redisTemplate.opsForValue().get(key);
        if (purchase != null) {
            return purchase;
        }

        // 2. Redis中没有，查数据库
        purchase = purchaseListMapper.selectById(id);
        if (purchase != null) {
            // 3. 存入Redis
            redisTemplate.opsForValue().set(key, purchase, 1, TimeUnit.HOURS);
        }

        return purchase;
    }

    /**
     * 新增采购数据（同时更新Redis）
     */
    @Transactional
    public int addPurchase(ByPurchaseList purchase) {
        // 1. 插入数据库
        int result = purchaseListMapper.insert(purchase);

        if (result > 0) {
            // 2. 清除相关缓存（因为新增数据后，分页缓存会失效）
            clearPurchaseCache();

            // 3. 将新增的数据存入Redis
            String key = PURCHASE_LIST_KEY + purchase.getId();
            redisTemplate.opsForValue().set(key, purchase, 1, TimeUnit.HOURS);
        }

        return result;
    }

    /**
     * 更新采购数据（同时更新Redis）
     */
    @Transactional
    public int updatePurchase(ByPurchaseList purchase) {
        // 1. 更新数据库
        int result = purchaseListMapper.updateById(purchase);

        if (result > 0) {
            // 2. 更新Redis中的该条数据
            String key = PURCHASE_LIST_KEY + purchase.getId();
            redisTemplate.opsForValue().set(key, purchase, 1, TimeUnit.HOURS);

            // 3. 清除分页缓存
            clearPageCache();
        }

        return result;
    }

    /**
     * 删除采购数据（同时删除Redis缓存）
     */
    @Transactional
    public int deletePurchase(Long id) {
        // 1. 先删除Redis缓存
        String key = PURCHASE_LIST_KEY + id;
        redisTemplate.delete(key);

        // 2. 删除数据库
        int result = purchaseListMapper.deleteById(id);

        if (result > 0) {
            // 3. 清除分页缓存
            clearPageCache();
        }

        return result;
    }

    /**
     * 将采购列表数据缓存到Redis（按ID存储）
     */
    private void cachePurchaseListToRedis(List<ByPurchaseList> list) {
        if (list == null || list.isEmpty()) {
            return;
        }

        for (ByPurchaseList purchase : list) {
            String key = PURCHASE_LIST_KEY + purchase.getId();
            redisTemplate.opsForValue().set(key, purchase, 1, TimeUnit.HOURS);
        }
    }

    /**
     * 清除所有采购相关的缓存
     */
    public void clearPurchaseCache() {
        // 清除所有以 purchase: 开头的key
        Set<String> keys = redisTemplate.keys(PURCHASE_LIST_KEY + "*");
        Set<String> pageKeys = redisTemplate.keys(PURCHASE_PAGE_KEY + "*");

        if (keys != null && !keys.isEmpty()) {
            redisTemplate.delete(keys);
        }
        if (pageKeys != null && !pageKeys.isEmpty()) {
            redisTemplate.delete(pageKeys);
        }
    }

    /**
     * 只清除分页缓存
     */
    private void clearPageCache() {
        Set<String> pageKeys = redisTemplate.keys(PURCHASE_PAGE_KEY + "*");
        if (pageKeys != null && !pageKeys.isEmpty()) {
            redisTemplate.delete(pageKeys);
        }
    }



}
