package com.by.lesson02.utils;

/**
 * @author bandd
 * @date2026年01月30日10:40
 */
import com.by.lesson02.entity.ByRole;

import java.util.*;
import java.util.stream.Collectors;


/**
 * 树构建工具类 - 支持名称查询和路径过滤
 */
public class RoleTreeBuilder {

    /**
     * 根据角色名称模糊查询并构建包含路径的树
     * @param allRoles 所有角色列表
     * @param keyword 查询关键词（支持模糊查询）
     * @return 包含匹配角色及其上级路径的树
     */
    public static List<ByRole> buildTreeByRoleName(List<ByRole> allRoles, String keyword) {

        if (allRoles == null || allRoles.isEmpty()) {
            return new ArrayList<>();
        }

        // 1. 模糊查询匹配的角色
        List<ByRole> matchedRoles = findRolesByName(allRoles, keyword);

        if (matchedRoles.isEmpty()) {
            return new ArrayList<>();
        }

        // 2. 获取所有需要保留的角色ID（匹配角色及其所有上级）
        Set<String> roleIdsToKeep = new HashSet<>();
        Map<String, ByRole> roleMap = allRoles.stream()
                .collect(Collectors.toMap(ByRole::getRoleId, role -> role));

        for (ByRole role : matchedRoles) {
            // 添加匹配角色本身
            roleIdsToKeep.add(role.getRoleId());
            // 递归添加所有上级角色
            addAllAncestors(role, roleMap, roleIdsToKeep);
        }

        // 3. 过滤出需要保留的角色
        List<ByRole> filteredRoles = allRoles.stream()
                .filter(role -> roleIdsToKeep.contains(role.getRoleId()))
                .collect(Collectors.toList());

        // 4. 构建树结构
        return buildRoleTree(filteredRoles);
    }

    /**
     * 模糊查询角色
     */
    private static List<ByRole> findRolesByName(List<ByRole> roles, String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return new ArrayList<>();
        }

        String searchKey = keyword.toLowerCase().trim();
        return roles.stream()
                .filter(role -> role.getRoleName() != null &&
                        role.getRoleName().toLowerCase().contains(searchKey))
                .collect(Collectors.toList());
    }

    /**
     * 递归添加所有上级角色
     */
    private static void addAllAncestors(ByRole role, Map<String, ByRole> roleMap, Set<String> roleIdsToKeep) {
        String parentId = role.getParentId();

        // 递归终止条件：没有父节点或父节点是根节点
        if (parentId == null || "0".equals(parentId) || !roleMap.containsKey(parentId)) {
            return;
        }

        // 添加父节点ID
        roleIdsToKeep.add(parentId);

        // 递归添加上级
        ByRole parent = roleMap.get(parentId);
        addAllAncestors(parent, roleMap, roleIdsToKeep);
    }


    /**
     * 使用递归方法建菜单（原有逻辑）
     */
    public static List<ByRole> buildRoleTree(List<ByRole> voList) {
        List<ByRole> trees = new ArrayList<>();

        // 构建ID到角色的映射，便于查找
        Map<String, ByRole> roleMap = new HashMap<>();
        for (ByRole role : voList) {
            roleMap.put(role.getRoleId(), role);
        }

        for (ByRole vo : voList) {
            String parentId = vo.getParentId();

            // 判断是否根节点或父节点不存在于当前列表
            if (Objects.equals(parentId, "0") || !roleMap.containsKey(parentId)) {
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

        // 构建父ID到子节点列表的映射
        Map<String, List<ByRole>> childrenMap = treeNodes.stream()
                .filter(node -> node.getParentId() != null)
                .collect(Collectors.groupingBy(ByRole::getParentId));

        // 直接获取子节点，避免嵌套循环
        List<ByRole> children = childrenMap.get(vo.getRoleId());
        if (children != null) {
            for (ByRole child : children) {
                vo.getChildren().add(findRoleChildren(child, treeNodes));
            }
        }

        return vo;
    }

    /**
     * 增强版：支持名称查询并高亮匹配节点
     */
    public static List<ByRole> buildTreeWithHighlight(List<ByRole> allRoles, String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return buildRoleTree(allRoles);
        }

        List<ByRole> result = buildTreeByRoleName(allRoles, keyword);

        // 可选：为匹配的节点添加标记
        markMatchedNodes(result, keyword.toLowerCase().trim());

        return result;
    }

    /**
     * 标记匹配的节点
     */
    private static void markMatchedNodes(List<ByRole> roles, String keyword) {
        for (ByRole role : roles) {
            if (role.getRoleName() != null &&
                    role.getRoleName().toLowerCase().contains(keyword)) {
                // 这里可以添加标记逻辑，例如设置特殊属性
//                 role.setMatched(true);
            }

            if (role.getChildren() != null) {
                markMatchedNodes(role.getChildren(), keyword);
            }
        }
    }

    /**
     * 查找角色的完整路径
     */
    public static List<String> findRolePath(List<ByRole> allRoles, String roleId) {
        Map<String, ByRole> roleMap = allRoles.stream()
                .collect(Collectors.toMap(ByRole::getRoleId, role -> role));

        List<String> path = new ArrayList<>();
        ByRole current = roleMap.get(roleId);

        while (current != null) {
            path.add(0, current.getRoleName());

            if ("0".equals(current.getParentId()) || !roleMap.containsKey(current.getParentId())) {
                break;
            }

            current = roleMap.get(current.getParentId());
        }

        return path;
    }
}