package com.by.lesson02.listener;

/**
 * @author bandd
 * @date2026年02月10日10:15
 */
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.by.lesson02.entity.ByPurchaseList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * 采购清单Excel导入监听器
 * 基于EasyExcel框架，实现分批次处理Excel数据
 */
public class ByPurchaseListExcelListener extends AnalysisEventListener<ByPurchaseList> {

    /**
     * 日志记录器，用于记录当前类的操作日志
     * 说明：
     * 1. 基于SLF4J框架
     * 2. 自动标记日志来源为ByPurchaseListExcelListener类
     * 3. 可输出不同级别日志：debug/info/warn/error
     */
    private static final Logger logger = LoggerFactory.getLogger(ByPurchaseListExcelListener.class);

    /**
     * 批次大小
     * 说明：每处理100条数据保存一次，避免内存溢出和提升处理效率
     */
    private static final int BATCH_SIZE = 100;

    /**
     * 临时数据存储列表
     * 说明：用于累积达到批次大小的数据
     */
    private List<ByPurchaseList> dataList = new ArrayList<>();

    /**
     * 数据处理器
     * 说明：具体的数据保存逻辑由外部实现
     */
    private final DataHandler<ByPurchaseList> dataHandler;

    /**
     * 构造函数
     * @param dataHandler 数据处理器，用于处理累积的数据
     */
    public ByPurchaseListExcelListener(DataHandler<ByPurchaseList> dataHandler) {
        this.dataHandler = dataHandler;
    }

    /**
     * 每行数据读取时的回调方法
     * @param byPurchaseList 当前行解析出的数据对象
     * @param context 分析上下文
     */
    @Override
    public void invoke(ByPurchaseList byPurchaseList, AnalysisContext context) {
        dataList.add(byPurchaseList);
        if (dataList.size() >= BATCH_SIZE) {
            saveData();
            dataList.clear();
        }
    }

    /**
     * Excel解析完成后的回调方法
     * @param context 分析上下文
     */
    @Override
    public void doAfterAllAnalysed(AnalysisContext context) {
        saveData();
        logger.info("Excel 数据解析完成，共处理 {} 条数据", context.readRowHolder().getRowIndex());
    }

    /**
     * 保存数据到数据库
     * 说明：调用数据处理器处理累积的数据
     */
    private void saveData() {
        if (!dataList.isEmpty()) {
            dataHandler.handle(dataList);
            logger.info("成功保存 {} 条数据", dataList.size());
        }
    }

    /**
     * 数据处理器接口
     * @param <T> 数据类型
     */
    public interface DataHandler<T> {
        void handle(List<T> dataList);
    }
}

