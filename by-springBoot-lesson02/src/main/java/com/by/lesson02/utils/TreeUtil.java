package com.by.lesson02.utils;

import com.by.lesson02.entity.ByDepartment;
import com.by.lesson02.entity.ByPermission;
import com.by.lesson02.entity.ByRole;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * @author bandd
 * @date2026年01月30日9:46
 * 构建角色树状图
 */

public class TreeUtil {

    /**
     * Role
     * 使用递归方法建菜单
     */
    public static List<ByRole> buildRoleTree(List<ByRole> voList) {

        List<ByRole> trees = new ArrayList<>();

        for (ByRole vo : voList) {
            // 判断是否父节点
            String parentId = vo.getParentId();
            if (Objects.equals(parentId, "0")) {
                // 查询子节点
                trees.add(findRoleChildren(vo, voList));
            }
        }
        return trees;
    }

    /**
     * 递归查找子节点
     */
    public static ByRole findRoleChildren(ByRole vo, List<ByRole> treeNodes) {

        vo.setChildren(new ArrayList<>());

        for (ByRole it : treeNodes) {
            // 获取下级节点
            String id = vo.getRoleId();
            String parentId = it.getParentId();
            if (Objects.equals(id, parentId)) {
                vo.getChildren().add(findRoleChildren(it, treeNodes));
            }
        }
        return vo;
    }

    /**
     * Permission
     * 使用递归方法建菜单
     */
    public static List<ByPermission> buildByPermissionTree(List<ByPermission> voList) {

        List<ByPermission> trees = new ArrayList<>();

        for (ByPermission vo : voList) {
            // 判断是否父节点
            String parentId = vo.getParentId();
            if (Objects.equals(parentId, "0")) {
                // 查询子节点
                trees.add(findByPermissionChildren(vo, voList));
            }
        }
        return trees;
    }

    /**
     * 递归查找子节点
     */
    public static ByPermission findByPermissionChildren(ByPermission vo, List<ByPermission> treeNodes) {

        vo.setChildren(new ArrayList<>());

        for (ByPermission it : treeNodes) {
            // 获取下级节点
            String id = vo.getPermissionId();
            String parentId = it.getParentId();
            if (Objects.equals(id, parentId)) {
                vo.getChildren().add(findByPermissionChildren(it, treeNodes));
            }
        }
        return vo;
    }


    /**
     * Department
     * 使用递归方法建菜单
     */
    public static List<ByDepartment> buildByDepartmentTree(List<ByDepartment> voList) {

        List<ByDepartment> trees = new ArrayList<>();

        for (ByDepartment vo : voList) {
            // 判断是否父节点
            String parentId = vo.getParentId();
            if (Objects.equals(parentId, "0")) {
                // 查询子节点
                trees.add(findByDepartmentChildren(vo, voList));
            }
        }
        return trees;
    }

    /**
     * 递归查找子节点
     */
    public static ByDepartment findByDepartmentChildren(ByDepartment vo, List<ByDepartment> treeNodes) {

        vo.setChildren(new ArrayList<>());

        for (ByDepartment it : treeNodes) {
            // 获取下级节点
            String id = vo.getId();
            String parentId = it.getParentId();
            if (Objects.equals(id, parentId)) {
                vo.getChildren().add(findByDepartmentChildren(it, treeNodes));
            }
        }
        return vo;
    }


}
