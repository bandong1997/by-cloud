package com.by.gateway.utils;


import com.by.gateway.entity.SysMenu;

import java.util.ArrayList;
import java.util.List;

/**
 * @author: 班东东
 * @Time: 2025/8/24 16:06
 * @description: 封装树结构
 */
public class TreeUtils {

    /**
     * 使用递归方法建菜单
     * @return
     */
    public static List<SysMenu> buildMenuTree(List<SysMenu> sysMenuList) {
        List<SysMenu> trees = new ArrayList<>();
        for (SysMenu sysMenu : sysMenuList) {
            if (sysMenu.getParentId() == 0) {
                trees.add(findMenuChildren(sysMenu,sysMenuList));
            }
        }
        return trees;
    }

    /**
     * 递归查找子节点
     */
    public static SysMenu findMenuChildren(SysMenu sysMenu, List<SysMenu> treeNodes) {
        sysMenu.setChildren(new ArrayList<SysMenu>());
        for (SysMenu it : treeNodes) {
            if(sysMenu.getId().longValue() == it.getParentId().longValue()) {
                sysMenu.getChildren().add(findMenuChildren(it,treeNodes));
            }
        }
        return sysMenu;
    }

}
