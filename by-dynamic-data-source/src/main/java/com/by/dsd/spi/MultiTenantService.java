package com.by.dsd.spi;

import com.baomidou.dynamic.datasource.toolkit.DynamicDataSourceContextHolder;
import org.springframework.stereotype.Service;

/**
 * @author bandd
 * @date2025年12月10日17:18
 * 多租户数据隔离
 */
@Service
public class MultiTenantService {
    // 根据租户动态选择数据源
    public void processByTenant(String tenantId) {
        // 动态切换到对应租户的数据源
        String dsKey = "tenant_" + tenantId;
        DynamicDataSourceContextHolder.push(dsKey);

        try {
            // 执行租户特定操作
            processTenantData();
        } finally {
            DynamicDataSourceContextHolder.clear();
        }
    }

    private void processTenantData() {
        // 业务逻辑
    }
}
