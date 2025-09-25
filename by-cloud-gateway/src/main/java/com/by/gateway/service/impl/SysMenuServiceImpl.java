package com.by.gateway.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.by.common.result.Result;
import com.by.gateway.entity.SysMenu;
import com.by.gateway.mapper.SysMenuMapper;
import com.by.gateway.service.SysMenuService;
import com.by.gateway.utils.TreeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * <p>
 * 菜单表 服务实现类
 * </p>
 *
 * @author bdd
 * @since 2025-08-24
 */
@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements SysMenuService {

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    @Override
    public Result findMenuTree() {

        // 先从Redis获取菜单
        List<SysMenu> menus = (List<SysMenu>) redisTemplate.opsForValue().get("bdd-cloud:/npms:menu:all");

        if (menus == null) {
            // Redis中不存在，从数据库获取
            QueryWrapper<SysMenu> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("is_deleted", 0);
            menus = baseMapper.selectList(queryWrapper);
            // 存入Redis，设置过期时间10分钟
            redisTemplate.opsForValue().set("bdd-cloud:/npms:menu:all", menus, 10, TimeUnit.MINUTES);
        }
        List<SysMenu> sysMenusTree = TreeUtils.buildMenuTree(menus);
        return Result.success(sysMenusTree);

    }
}
