/*
 Navicat Premium Data Transfer

 Source Server         : 本地mysql
 Source Server Type    : MySQL
 Source Server Version : 80025 (8.0.25)
 Source Host           : localhost:3306
 Source Schema         : by_cloud_01

 Target Server Type    : MySQL
 Target Server Version : 80025 (8.0.25)
 File Encoding         : 65001

 Date: 29/01/2026 22:55:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for by_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `by_operate_log`;
CREATE TABLE `by_operate_log` (
  `id` varchar(100) NOT NULL COMMENT '日志ID',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '操作模块',
  `biz_type` varchar(50) NOT NULL DEFAULT '' COMMENT '业务类型',
  `oper_type` varchar(50) NOT NULL DEFAULT '' COMMENT '操作类型',
  `method` varchar(200) NOT NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) NOT NULL DEFAULT '' COMMENT '请求方式',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP地址',
  `ip_location` varchar(255) DEFAULT '' COMMENT 'IP归属地',
  `ip_version` varchar(10) DEFAULT '' COMMENT 'IP版本(IPv4/IPv6)',
  `user_agent` varchar(500) DEFAULT '' COMMENT '用户代理',
  `browser` varchar(100) DEFAULT '' COMMENT '浏览器',
  `browser_version` varchar(50) DEFAULT '' COMMENT '浏览器版本',
  `os` varchar(100) DEFAULT '' COMMENT '操作系统',
  `os_version` varchar(50) DEFAULT '' COMMENT '操作系统版本',
  `device` varchar(100) DEFAULT '' COMMENT '设备类型',
  `device_model` varchar(100) DEFAULT '' COMMENT '设备型号',
  `oper_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志表';

-- ----------------------------
-- Records of by_operate_log
-- ----------------------------
BEGIN;
INSERT INTO `by_operate_log` (`id`, `title`, `biz_type`, `oper_type`, `method`, `request_method`, `ip`, `ip_location`, `ip_version`, `user_agent`, `browser`, `browser_version`, `os`, `os_version`, `device`, `device_model`, `oper_time`, `create_time`) VALUES ('5c472ff205ae43fdbe58b8ce657e7c40', '系统用户基本信息表', 'QUERY', 'QUERY', 'findPageUser', 'POST', '127.0.0.1', '本地地址', 'IPv4', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Chrome', '143.0', 'Mac OS X', '10.15.7', 'Desktop', 'Unknown', '2026-01-29 22:33:10', '2026-01-29 22:33:10');
INSERT INTO `by_operate_log` (`id`, `title`, `biz_type`, `oper_type`, `method`, `request_method`, `ip`, `ip_location`, `ip_version`, `user_agent`, `browser`, `browser_version`, `os`, `os_version`, `device`, `device_model`, `oper_time`, `create_time`) VALUES ('20c4bed1a8f34338b3ec6150f383b7c4', '系统用户基本信息表', 'QUERY', 'QUERY', 'findPageUser', 'POST', '127.0.0.1', '本地地址', 'IPv4', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Chrome', '143.0', 'Mac OS X', '10.15.7', 'Desktop', 'Unknown', '2026-01-29 22:40:40', '2026-01-29 22:40:40');
INSERT INTO `by_operate_log` (`id`, `title`, `biz_type`, `oper_type`, `method`, `request_method`, `ip`, `ip_location`, `ip_version`, `user_agent`, `browser`, `browser_version`, `os`, `os_version`, `device`, `device_model`, `oper_time`, `create_time`) VALUES ('bdb9fd8ff180410f9af931cd97669eab', '系统用户基本信息表', 'QUERY', 'QUERY', 'findPageUser', 'POST', '127.0.0.1', '本地地址', 'IPv4', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Chrome', '143.0', 'Mac OS X', '10.15.7', 'Desktop', 'Unknown', '2026-01-29 22:40:59', '2026-01-29 22:40:59');
INSERT INTO `by_operate_log` (`id`, `title`, `biz_type`, `oper_type`, `method`, `request_method`, `ip`, `ip_location`, `ip_version`, `user_agent`, `browser`, `browser_version`, `os`, `os_version`, `device`, `device_model`, `oper_time`, `create_time`) VALUES ('673ab44f135f47bfa77778ededdd784d', '系统用户基本信息表', 'QUERY', 'QUERY', 'findPageUser', 'POST', '127.0.0.1', '本地地址', 'IPv4', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Chrome', '143.0', 'Mac OS X', '10.15.7', 'Desktop', 'Unknown', '2026-01-29 22:41:39', '2026-01-29 22:41:39');
INSERT INTO `by_operate_log` (`id`, `title`, `biz_type`, `oper_type`, `method`, `request_method`, `ip`, `ip_location`, `ip_version`, `user_agent`, `browser`, `browser_version`, `os`, `os_version`, `device`, `device_model`, `oper_time`, `create_time`) VALUES ('f7e36f2f25784f7e905f8577ced85f2c', '系统用户基本信息表', 'QUERY', 'QUERY', 'POST', 'POST', '127.0.0.1', '本地地址', 'IPv4', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Chrome', '143.0', 'Mac OS X', '10.15.7', 'Desktop', 'Unknown', '2026-01-29 22:43:40', '2026-01-29 22:43:40');
INSERT INTO `by_operate_log` (`id`, `title`, `biz_type`, `oper_type`, `method`, `request_method`, `ip`, `ip_location`, `ip_version`, `user_agent`, `browser`, `browser_version`, `os`, `os_version`, `device`, `device_model`, `oper_time`, `create_time`) VALUES ('3658e362e3f347d49cd9cae1e86549b8', '系统用户基本信息表', 'QUERY', 'QUERY', 'findPageUser', 'POST', '127.0.0.1', '本地地址', 'IPv4', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Chrome', '143.0', 'Mac OS X', '10.15.7', 'Desktop', 'Unknown', '2026-01-29 22:45:35', '2026-01-29 22:45:35');
INSERT INTO `by_operate_log` (`id`, `title`, `biz_type`, `oper_type`, `method`, `request_method`, `ip`, `ip_location`, `ip_version`, `user_agent`, `browser`, `browser_version`, `os`, `os_version`, `device`, `device_model`, `oper_time`, `create_time`) VALUES ('525397323be346b09e35925c70808531', '系统用户基本信息表', 'QUERY', 'QUERY', 'findPageUser', 'POST', '127.0.0.1', '本地地址', 'IPv4', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Chrome', '143.0', 'Mac OS X', '10.15.7', 'Desktop', 'Unknown', '2026-01-29 22:47:47', '2026-01-29 22:47:47');
INSERT INTO `by_operate_log` (`id`, `title`, `biz_type`, `oper_type`, `method`, `request_method`, `ip`, `ip_location`, `ip_version`, `user_agent`, `browser`, `browser_version`, `os`, `os_version`, `device`, `device_model`, `oper_time`, `create_time`) VALUES ('f7b868393a13430f97e27eef1558f812', '系统用户基本信息表', 'QUERY', 'QUERY', 'findPageUser', 'POST', '127.0.0.1', '本地地址', 'IPv4', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Chrome', '143.0', 'Mac OS X', '10.15.7', 'Desktop', 'Mac OS', '2026-01-29 22:48:02', '2026-01-29 22:48:02');
INSERT INTO `by_operate_log` (`id`, `title`, `biz_type`, `oper_type`, `method`, `request_method`, `ip`, `ip_location`, `ip_version`, `user_agent`, `browser`, `browser_version`, `os`, `os_version`, `device`, `device_model`, `oper_time`, `create_time`) VALUES ('87ca5a5f7fff4142afc77046cf645799', '系统用户基本信息表', 'QUERY', 'QUERY', 'findPageUser', 'POST', '127.0.0.1', '本地地址', 'IPv4', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.1 Safari/605.1.15', 'Safari', '605.1', 'Mac OS X', '10.15.7', 'Desktop', 'Mac OS', '2026-01-29 22:49:50', '2026-01-29 22:49:50');
INSERT INTO `by_operate_log` (`id`, `title`, `biz_type`, `oper_type`, `method`, `request_method`, `ip`, `ip_location`, `ip_version`, `user_agent`, `browser`, `browser_version`, `os`, `os_version`, `device`, `device_model`, `oper_time`, `create_time`) VALUES ('5d962299aa07475ebcd4e5dd9a872c02', '系统用户基本信息表', 'QUERY', 'QUERY', 'findPageUser', 'POST', '127.0.0.1', '本地地址', 'IPv4', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Chrome', '143.0', 'Mac OS X', '10.15.7', 'Desktop', 'Mac OS', '2026-01-29 22:52:21', '2026-01-29 22:52:21');
INSERT INTO `by_operate_log` (`id`, `title`, `biz_type`, `oper_type`, `method`, `request_method`, `ip`, `ip_location`, `ip_version`, `user_agent`, `browser`, `browser_version`, `os`, `os_version`, `device`, `device_model`, `oper_time`, `create_time`) VALUES ('a3886c0ab56947e08801737a40533633', '系统用户基本信息表', 'QUERY', 'QUERY', 'findPageUser', 'POST', '127.0.0.1', 'Unknown', 'IPv4', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Chrome', '143.0', 'Mac OS X', '10.15.7', 'Desktop', 'Mac OS', '2026-01-29 22:53:49', '2026-01-29 22:53:49');
COMMIT;

-- ----------------------------
-- Table structure for by_permission
-- ----------------------------
DROP TABLE IF EXISTS `by_permission`;
CREATE TABLE `by_permission` (
  `permission_id` varchar(32) NOT NULL COMMENT '权限ID，UUID去掉横杠的32位字符串',
  `permission_code` varchar(100) NOT NULL COMMENT '权限编码，唯一标识，用于权限控制',
  `permission_name` varchar(100) NOT NULL COMMENT '权限名称，显示用',
  `permission_type` tinyint DEFAULT NULL COMMENT '权限类型：1-菜单权限，2-按钮权限，3-API接口权限',
  `parent_id` varchar(32) DEFAULT '0' COMMENT '父权限ID，用于构建权限树，0表示根节点',
  `url` varchar(200) DEFAULT NULL COMMENT '权限对应的URL地址或API路径',
  `icon` varchar(50) DEFAULT NULL COMMENT '权限图标，用于前端展示',
  `sort` int DEFAULT '0' COMMENT '排序号，数字越小越靠前',
  `status` tinyint DEFAULT '1' COMMENT '权限状态：1-启用，0-禁用',
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `permission_code` (`permission_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统权限点信息表';

-- ----------------------------
-- Records of by_permission
-- ----------------------------
BEGIN;
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b84e9dad11d180b400c04fd430c8', 'SYSTEM_MANAGE', '系统管理', 1, '0', NULL, 'setting', 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b84f9dad11d180b400c04fd430c8', 'USER_MANAGE', '用户管理', 1, '6ba7b84e9dad11d180b400c04fd430c8', '/user', 'user', 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b8509dad11d180b400c04fd430c8', 'USER_ADD', '用户新增', 2, '6ba7b84f9dad11d180b400c04fd430c8', NULL, NULL, 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b8519dad11d180b400c04fd430c8', 'USER_EDIT', '用户编辑', 2, '6ba7b84f9dad11d180b400c04fd430c8', NULL, NULL, 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b8529dad11d180b400c04fd430c8', 'USER_DELETE', '用户删除', 2, '6ba7b84f9dad11d180b400c04fd430c8', NULL, NULL, 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b8539dad11d180b400c04fd430c8', 'USER_VIEW', '用户查看', 2, '6ba7b84f9dad11d180b400c04fd430c8', NULL, NULL, 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b8549dad11d180b400c04fd430c8', 'ROLE_MANAGE', '角色管理', 1, '6ba7b84e9dad11d180b400c04fd430c8', '/role', 'team', 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b8559dad11d180b400c04fd430c8', 'ROLE_ADD', '角色新增', 2, '6ba7b8549dad11d180b400c04fd430c8', NULL, NULL, 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b8569dad11d180b400c04fd430c8', 'ROLE_EDIT', '角色编辑', 2, '6ba7b8549dad11d180b400c04fd430c8', NULL, NULL, 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b8579dad11d180b400c04fd430c8', 'ROLE_DELETE', '角色删除', 2, '6ba7b8549dad11d180b400c04fd430c8', NULL, NULL, 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b8589dad11d180b400c04fd430c8', 'PERMISSION_MANAGE', '权限管理', 1, '6ba7b84e9dad11d180b400c04fd430c8', '/permission', 'lock', 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b8599dad11d180b400c04fd430c8', 'DEPT_MANAGE', '部门管理', 1, '0', '/dept', 'apartment', 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b85a9dad11d180b400c04fd430c8', 'DEPT_ADD', '部门新增', 2, '6ba7b8599dad11d180b400c04fd430c8', NULL, NULL, 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b85b9dad11d180b400c04fd430c8', 'DEPT_EDIT', '部门编辑', 2, '6ba7b8599dad11d180b400c04fd430c8', NULL, NULL, 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b85c9dad11d180b400c04fd430c8', 'DEPT_DELETE', '部门删除', 2, '6ba7b8599dad11d180b400c04fd430c8', NULL, NULL, 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b85d9dad11d180b400c04fd430c8', 'MENU_MANAGE', '菜单管理', 1, '6ba7b84e9dad11d180b400c04fd430c8', '/menu', 'menu', 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b85e9dad11d180b400c04fd430c8', 'LOG_MANAGE', '日志管理', 1, '0', '/log', 'file-text', 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b85f9dad11d180b400c04fd430c8', 'OPERATION_LOG', '操作日志', 2, '6ba7b85e9dad11d180b400c04fd430c8', '/log/operation', NULL, 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b8609dad11d180b400c04fd430c8', 'LOGIN_LOG', '登录日志', 2, '6ba7b85e9dad11d180b400c04fd430c8', '/log/login', NULL, 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b8619dad11d180b400c04fd430c8', 'SYSTEM_LOG', '系统日志', 2, '6ba7b85e9dad11d180b400c04fd430c8', '/log/system', NULL, 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b8629dad11d180b400c04fd430c8', 'DASHBOARD', '仪表盘', 1, '0', '/dashboard', 'dashboard', 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b8639dad11d180b400c04fd430c8', 'MONITOR', '系统监控', 1, '0', '/monitor', 'monitor', 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b8649dad11d180b400c04fd430c8', 'SERVER_MONITOR', '服务器监控', 2, '6ba7b8639dad11d180b400c04fd430c8', '/monitor/server', NULL, 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b8659dad11d180b400c04fd430c8', 'DATABASE_MONITOR', '数据库监控', 2, '6ba7b8639dad11d180b400c04fd430c8', '/monitor/database', NULL, 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b8669dad11d180b400c04fd430c8', 'SETTING', '个人设置', 1, '0', '/setting', 'user', 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b8679dad11d180b400c04fd430c8', 'PASSWORD_CHANGE', '修改密码', 2, '6ba7b8669dad11d180b400c04fd430c8', '/setting/password', NULL, 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b8689dad11d180b400c04fd430c8', 'PROFILE_EDIT', '编辑资料', 2, '6ba7b8669dad11d180b400c04fd430c8', '/setting/profile', NULL, 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b8699dad11d180b400c04fd430c8', 'NOTIFICATION', '消息通知', 1, '0', '/notification', 'bell', 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b86a9dad11d180b400c04fd430c8', 'HELP', '帮助中心', 1, '0', '/help', 'question-circle', 0, 1);
INSERT INTO `by_permission` (`permission_id`, `permission_code`, `permission_name`, `permission_type`, `parent_id`, `url`, `icon`, `sort`, `status`) VALUES ('6ba7b86b9dad11d180b400c04fd430c8', 'ABOUT', '关于系统', 1, '0', '/about', 'info-circle', 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for by_role
-- ----------------------------
DROP TABLE IF EXISTS `by_role`;
CREATE TABLE `by_role` (
  `role_id` varchar(32) NOT NULL COMMENT '角色ID，UUID去掉横杠的32位字符串',
  `role_code` varchar(50) NOT NULL COMMENT '角色编码，唯一标识，用于权限控制',
  `role_name` varchar(50) NOT NULL COMMENT '角色名称，显示用',
  `role_desc` varchar(200) DEFAULT NULL COMMENT '角色描述，详细说明角色权限范围',
  `status` tinyint DEFAULT '1' COMMENT '角色状态：1-启用，0-禁用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_code` (`role_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统角色信息表';

-- ----------------------------
-- Records of by_role
-- ----------------------------
BEGIN;
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b8309dad11d180b400c04fd430c8', 'SUPER_ADMIN', '超级管理员', '系统最高权限管理员', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b8319dad11d180b400c04fd430c8', 'SYS_ADMIN', '系统管理员', '负责系统日常管理', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b8329dad11d180b400c04fd430c8', 'DEPT_MANAGER', '部门经理', '部门管理权限', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b8339dad11d180b400c04fd430c8', 'EMPLOYEE', '普通员工', '普通员工权限', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b8349dad11d180b400c04fd430c8', 'GUEST', '访客', '只读访问权限', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b8359dad11d180b400c04fd430c8', 'IT_DIRECTOR', 'IT总监', '信息技术部门总监', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b8369dad11d180b400c04fd430c8', 'IT_MANAGER', 'IT经理', '信息技术部门经理', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b8379dad11d180b400c04fd430c8', 'DEVELOPER', '开发工程师', '软件开发工程师', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b8389dad11d180b400c04fd430c8', 'TESTER', '测试工程师', '软件测试工程师', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b8399dad11d180b400c04fd430c8', 'HR_DIRECTOR', '人力资源总监', '人力资源部门总监', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b83a9dad11d180b400c04fd430c8', 'HR_MANAGER', '人力资源经理', '人力资源管理', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b83b9dad11d180b400c04fd430c8', 'FINANCE_DIRECTOR', '财务总监', '财务管理部门总监', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b83c9dad11d180b400c04fd430c8', 'FINANCE_MANAGER', '财务经理', '财务管理', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b83d9dad11d180b400c04fd430c8', 'SALES_DIRECTOR', '销售总监', '销售部门总监', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b83e9dad11d180b400c04fd430c8', 'SALES_MANAGER', '销售经理', '销售管理', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b83f9dad11d180b400c04fd430c8', 'MARKETING_DIRECTOR', '市场总监', '市场部门总监', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b8409dad11d180b400c04fd430c8', 'MARKETING_MANAGER', '市场经理', '市场管理', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b8419dad11d180b400c04fd430c8', 'PRODUCT_DIRECTOR', '产品总监', '产品部门总监', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b8429dad11d180b400c04fd430c8', 'PRODUCT_MANAGER', '产品经理', '产品管理', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b8439dad11d180b400c04fd430c8', 'OPERATION_DIRECTOR', '运营总监', '运营部门总监', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b8449dad11d180b400c04fd430c8', 'OPERATION_MANAGER', '运营经理', '运营管理', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b8459dad11d180b400c04fd430c8', 'CUSTOMER_SERVICE', '客服专员', '客户服务', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b8469dad11d180b400c04fd430c8', 'DATA_ANALYST', '数据分析师', '数据分析', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b8479dad11d180b400c04fd430c8', 'DBA', '数据库管理员', '数据库管理', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b8489dad11d180b400c04fd430c8', 'NETWORK_ADMIN', '网络管理员', '网络管理', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b8499dad11d180b400c04fd430c8', 'SECURITY_ADMIN', '安全管理员', '安全管理', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b84a9dad11d180b400c04fd430c8', 'AUDITOR', '审计员', '系统审计', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b84b9dad11d180b400c04fd430c8', 'PROJECT_MANAGER', '项目经理', '项目管理', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b84c9dad11d180b400c04fd430c8', 'TEAM_LEADER', '团队负责人', '团队管理', 1, '2026-01-29 18:53:53');
INSERT INTO `by_role` (`role_id`, `role_code`, `role_name`, `role_desc`, `status`, `create_time`) VALUES ('6ba7b84d9dad11d180b400c04fd430c8', 'INTERN', '实习生', '实习生权限', 1, '2026-01-29 18:53:53');
COMMIT;

-- ----------------------------
-- Table structure for by_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `by_role_permission`;
CREATE TABLE `by_role_permission` (
  `id` varchar(32) NOT NULL COMMENT '关联ID，UUID去掉横杠的32位字符串',
  `role_id` varchar(32) NOT NULL COMMENT '角色ID，关联by_role表',
  `permission_id` varchar(32) NOT NULL COMMENT '权限ID，关联by_permission表',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '关联创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_role_permission` (`role_id`,`permission_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `by_role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `by_role` (`role_id`) ON DELETE CASCADE,
  CONSTRAINT `by_role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `by_permission` (`permission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和权限关联关系表';

-- ----------------------------
-- Records of by_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b88a9dad11d180b400c04fd430c8', '6ba7b8309dad11d180b400c04fd430c8', '6ba7b84e9dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b88b9dad11d180b400c04fd430c8', '6ba7b8309dad11d180b400c04fd430c8', '6ba7b84f9dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b88c9dad11d180b400c04fd430c8', '6ba7b8309dad11d180b400c04fd430c8', '6ba7b8509dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b88d9dad11d180b400c04fd430c8', '6ba7b8309dad11d180b400c04fd430c8', '6ba7b8519dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b88e9dad11d180b400c04fd430c8', '6ba7b8309dad11d180b400c04fd430c8', '6ba7b8529dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b88f9dad11d180b400c04fd430c8', '6ba7b8309dad11d180b400c04fd430c8', '6ba7b8539dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b8909dad11d180b400c04fd430c8', '6ba7b8319dad11d180b400c04fd430c8', '6ba7b84e9dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b8919dad11d180b400c04fd430c8', '6ba7b8319dad11d180b400c04fd430c8', '6ba7b84f9dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b8929dad11d180b400c04fd430c8', '6ba7b8319dad11d180b400c04fd430c8', '6ba7b8539dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b8939dad11d180b400c04fd430c8', '6ba7b8319dad11d180b400c04fd430c8', '6ba7b8549dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b8949dad11d180b400c04fd430c8', '6ba7b8329dad11d180b400c04fd430c8', '6ba7b8599dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b8959dad11d180b400c04fd430c8', '6ba7b8329dad11d180b400c04fd430c8', '6ba7b85a9dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b8969dad11d180b400c04fd430c8', '6ba7b8329dad11d180b400c04fd430c8', '6ba7b85b9dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b8979dad11d180b400c04fd430c8', '6ba7b8339dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b8989dad11d180b400c04fd430c8', '6ba7b8339dad11d180b400c04fd430c8', '6ba7b8669dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b8999dad11d180b400c04fd430c8', '6ba7b8339dad11d180b400c04fd430c8', '6ba7b8679dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b89a9dad11d180b400c04fd430c8', '6ba7b8339dad11d180b400c04fd430c8', '6ba7b8689dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b89b9dad11d180b400c04fd430c8', '6ba7b8349dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b89c9dad11d180b400c04fd430c8', '6ba7b8349dad11d180b400c04fd430c8', '6ba7b8669dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b89d9dad11d180b400c04fd430c8', '6ba7b8349dad11d180b400c04fd430c8', '6ba7b8679dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b89e9dad11d180b400c04fd430c8', '6ba7b8359dad11d180b400c04fd430c8', '6ba7b84e9dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b89f9dad11d180b400c04fd430c8', '6ba7b8359dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b8a09dad11d180b400c04fd430c8', '6ba7b8369dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b8a19dad11d180b400c04fd430c8', '6ba7b8379dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b8a29dad11d180b400c04fd430c8', '6ba7b8389dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b8a39dad11d180b400c04fd430c8', '6ba7b8399dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b8a49dad11d180b400c04fd430c8', '6ba7b83a9dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b8a59dad11d180b400c04fd430c8', '6ba7b83b9dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b8a69dad11d180b400c04fd430c8', '6ba7b83c9dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` (`id`, `role_id`, `permission_id`, `create_time`) VALUES ('6ba7b8a79dad11d180b400c04fd430c8', '6ba7b83d9dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
COMMIT;

-- ----------------------------
-- Table structure for by_user
-- ----------------------------
DROP TABLE IF EXISTS `by_user`;
CREATE TABLE `by_user` (
  `user_id` varchar(32) NOT NULL COMMENT '用户ID，UUID去掉横杠的32位字符串',
  `username` varchar(50) NOT NULL COMMENT '用户名，唯一标识，用于登录',
  `password` varchar(100) NOT NULL COMMENT '用户密码，MD5加密存储',
  `real_name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `status` tinyint DEFAULT '1' COMMENT '用户状态：1-正常，0-禁用，2-锁定',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统用户基本信息表';

-- ----------------------------
-- Records of by_user
-- ----------------------------
BEGIN;
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('2016841866925920258', '1111111', 'bae5e3208a3c700e3db642b6631e95b9', '33333333', '', '', 0, '2026-01-29 19:52:26', '2026-01-29 20:19:53');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('4e3d0bb8131e496f85ab61dd072f256b', 'by', 'e10adc3949ba59abbe56e057f20f883e', 'by1', '13460122689@163.com', '13460122689', 1, '2026-01-29 20:00:06', '2026-01-29 20:04:16');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b8109dad11d180b400c04fd430c8', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', 'admin@example.com', '13800138000', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b8119dad11d180b400c04fd430c8', 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '张三', 'zhangsan@example.com', '13800138001', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b8129dad11d180b400c04fd430c8', 'lisi', 'e10adc3949ba59abbe56e057f20f883e', '李四', 'lisi@example.com', '13800138002', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b8139dad11d180b400c04fd430c8', 'wangwu', 'e10adc3949ba59abbe56e057f20f883e', '王五', 'wangwu@example.com', '13800138003', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b8149dad11d180b400c04fd430c8', 'zhaoliu', 'e10adc3949ba59abbe56e057f20f883e', '赵六', 'zhaoliu@example.com', '13800138004', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b8159dad11d180b400c04fd430c8', 'qianqi', 'e10adc3949ba59abbe56e057f20f883e', '钱七', 'qianqi@example.com', '13800138005', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b8169dad11d180b400c04fd430c8', 'sunba', 'e10adc3949ba59abbe56e057f20f883e', '孙八', 'sunba@example.com', '13800138006', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b8179dad11d180b400c04fd430c8', 'zhoujiu', 'e10adc3949ba59abbe56e057f20f883e', '周九', 'zhoujiu@example.com', '13800138007', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b8189dad11d180b400c04fd430c8', 'wuwei', 'e10adc3949ba59abbe56e057f20f883e', '吴伟', 'wuwei@example.com', '13800138008', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b8199dad11d180b400c04fd430c8', 'zhengyi', 'e10adc3949ba59abbe56e057f20f883e', '郑义', 'zhengyi@example.com', '13800138009', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b81a9dad11d180b400c04fd430c8', 'wangfang', 'e10adc3949ba59abbe56e057f20f883e', '王芳', 'wangfang@example.com', '13800138010', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b81b9dad11d180b400c04fd430c8', 'lina', 'e10adc3949ba59abbe56e057f20f883e', '李娜', 'lina@example.com', '13800138011', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b81c9dad11d180b400c04fd430c8', 'zhangwei', 'e10adc3949ba59abbe56e057f20f883e', '张伟', 'zhangwei@example.com', '13800138012', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b81d9dad11d180b400c04fd430c8', 'lihua', 'e10adc3949ba59abbe56e057f20f883e', '李华', 'lihua@example.com', '13800138013', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b81e9dad11d180b400c04fd430c8', 'wangli', 'e10adc3949ba59abbe56e057f20f883e', '王丽', 'wangli@example.com', '13800138014', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b81f9dad11d180b400c04fd430c8', 'chenjun', 'e10adc3949ba59abbe56e057f20f883e', '陈军', 'chenjun@example.com', '13800138015', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b8209dad11d180b400c04fd430c8', 'zhoumin', 'e10adc3949ba59abbe56e057f20f883e', '周敏', 'zhoumin@example.com', '13800138016', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b8219dad11d180b400c04fd430c8', 'wuyong', 'e10adc3949ba59abbe56e057f20f883e', '吴勇', 'wuyong@example.com', '13800138017', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b8229dad11d180b400c04fd430c8', 'zhengqiang', 'e10adc3949ba59abbe56e057f20f883e', '郑强', 'zhengqiang@example.com', '13800138018', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b8239dad11d180b400c04fd430c8', 'wangqiang', 'e10adc3949ba59abbe56e057f20f883e', '王强', 'wangqiang@example.com', '13800138019', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b8249dad11d180b400c04fd430c8', 'liuxin', 'e10adc3949ba59abbe56e057f20f883e', '刘鑫', 'liuxin@example.com', '13800138020', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b8259dad11d180b400c04fd430c8', 'chenxin', 'e10adc3949ba59abbe56e057f20f883e', '陈欣', 'chenxin@example.com', '13800138021', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b8269dad11d180b400c04fd430c8', 'zhouxin', 'e10adc3949ba59abbe56e057f20f883e', '周欣', 'zhouxin@example.com', '13800138022', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b8279dad11d180b400c04fd430c8', 'wuxin', 'e10adc3949ba59abbe56e057f20f883e', '吴欣', 'wuxin@example.com', '13800138023', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b8289dad11d180b400c04fd430c8', 'zhengxin', 'e10adc3949ba59abbe56e057f20f883e', '郑欣', 'zhengxin@example.com', '13800138024', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b8299dad11d180b400c04fd430c8', 'wangxin', 'e10adc3949ba59abbe56e057f20f883e', '王欣', 'wangxin@example.com', '13800138025', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b82a9dad11d180b400c04fd430c8', 'liumei', 'e10adc3949ba59abbe56e057f20f883e', '刘梅', 'liumei@example.com', '13800138026', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b82b9dad11d180b400c04fd430c8', 'chenmei', 'e10adc3949ba59abbe56e057f20f883e', '陈梅', 'chenmei@example.com', '13800138027', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b82c9dad11d180b400c04fd430c8', 'zhoumei', 'e10adc3949ba59abbe56e057f20f883e', '周梅', 'zhoumei@example.com', '13800138028', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('6ba7b82d9dad11d180b400c04fd430c8', 'wumei', 'e10adc3949ba59abbe56e057f20f883e', '吴梅', 'wumei@example.com', '13800138029', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` (`user_id`, `username`, `password`, `real_name`, `email`, `phone`, `status`, `create_time`, `update_time`) VALUES ('b62e8d3c8d1445ec8c6737d9d82c3f62', '11111112', 'bae5e3208a3c700e3db642b6631e95b9', '333333332', '', '', 1, '2026-01-29 19:54:37', '2026-01-29 19:54:37');
COMMIT;

-- ----------------------------
-- Table structure for by_user_role
-- ----------------------------
DROP TABLE IF EXISTS `by_user_role`;
CREATE TABLE `by_user_role` (
  `id` varchar(32) NOT NULL COMMENT '关联ID，UUID去掉横杠的32位字符串',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID，关联by_user表',
  `role_id` varchar(32) NOT NULL COMMENT '角色ID，关联by_role表',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '关联创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_role` (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `by_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `by_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `by_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `by_role` (`role_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联关系表';

-- ----------------------------
-- Records of by_user_role
-- ----------------------------
BEGIN;
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b86c9dad11d180b400c04fd430c8', '6ba7b8109dad11d180b400c04fd430c8', '6ba7b8309dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b86d9dad11d180b400c04fd430c8', '6ba7b8119dad11d180b400c04fd430c8', '6ba7b8319dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b86e9dad11d180b400c04fd430c8', '6ba7b8129dad11d180b400c04fd430c8', '6ba7b8339dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b86f9dad11d180b400c04fd430c8', '6ba7b8139dad11d180b400c04fd430c8', '6ba7b8349dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b8709dad11d180b400c04fd430c8', '6ba7b8149dad11d180b400c04fd430c8', '6ba7b8359dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b8719dad11d180b400c04fd430c8', '6ba7b8159dad11d180b400c04fd430c8', '6ba7b8369dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b8729dad11d180b400c04fd430c8', '6ba7b8169dad11d180b400c04fd430c8', '6ba7b8379dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b8739dad11d180b400c04fd430c8', '6ba7b8179dad11d180b400c04fd430c8', '6ba7b8389dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b8749dad11d180b400c04fd430c8', '6ba7b8189dad11d180b400c04fd430c8', '6ba7b8399dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b8759dad11d180b400c04fd430c8', '6ba7b8199dad11d180b400c04fd430c8', '6ba7b83a9dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b8769dad11d180b400c04fd430c8', '6ba7b81a9dad11d180b400c04fd430c8', '6ba7b83b9dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b8779dad11d180b400c04fd430c8', '6ba7b81b9dad11d180b400c04fd430c8', '6ba7b83c9dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b8789dad11d180b400c04fd430c8', '6ba7b81c9dad11d180b400c04fd430c8', '6ba7b83d9dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b8799dad11d180b400c04fd430c8', '6ba7b81d9dad11d180b400c04fd430c8', '6ba7b83e9dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b87a9dad11d180b400c04fd430c8', '6ba7b81e9dad11d180b400c04fd430c8', '6ba7b83f9dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b87b9dad11d180b400c04fd430c8', '6ba7b81f9dad11d180b400c04fd430c8', '6ba7b8409dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b87c9dad11d180b400c04fd430c8', '6ba7b8209dad11d180b400c04fd430c8', '6ba7b8419dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b87d9dad11d180b400c04fd430c8', '6ba7b8219dad11d180b400c04fd430c8', '6ba7b8429dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b87e9dad11d180b400c04fd430c8', '6ba7b8229dad11d180b400c04fd430c8', '6ba7b8439dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b87f9dad11d180b400c04fd430c8', '6ba7b8239dad11d180b400c04fd430c8', '6ba7b8449dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b8809dad11d180b400c04fd430c8', '6ba7b8249dad11d180b400c04fd430c8', '6ba7b8459dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b8819dad11d180b400c04fd430c8', '6ba7b8259dad11d180b400c04fd430c8', '6ba7b8469dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b8829dad11d180b400c04fd430c8', '6ba7b8269dad11d180b400c04fd430c8', '6ba7b8479dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b8839dad11d180b400c04fd430c8', '6ba7b8279dad11d180b400c04fd430c8', '6ba7b8489dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b8849dad11d180b400c04fd430c8', '6ba7b8289dad11d180b400c04fd430c8', '6ba7b8499dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b8859dad11d180b400c04fd430c8', '6ba7b8299dad11d180b400c04fd430c8', '6ba7b84a9dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b8869dad11d180b400c04fd430c8', '6ba7b82a9dad11d180b400c04fd430c8', '6ba7b84b9dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b8879dad11d180b400c04fd430c8', '6ba7b82b9dad11d180b400c04fd430c8', '6ba7b84c9dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b8889dad11d180b400c04fd430c8', '6ba7b82c9dad11d180b400c04fd430c8', '6ba7b84d9dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` (`id`, `user_id`, `role_id`, `create_time`) VALUES ('6ba7b8899dad11d180b400c04fd430c8', '6ba7b82d9dad11d180b400c04fd430c8', '6ba7b8309dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
COMMIT;

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `contract_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '合同唯一标识',
  `contract_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '合同编号',
  `contract_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '合同名称',
  `contract_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '合同类型',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'draft' COMMENT '状态',
  `party_a_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '甲方名称',
  `party_b_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '乙方名称',
  `party_a_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '甲方统一信用代码',
  `party_b_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '乙方统一信用代码',
  `sign_date` date DEFAULT NULL COMMENT '签订日期',
  `effective_date` date DEFAULT NULL COMMENT '生效日期',
  `expire_date` date DEFAULT NULL COMMENT '到期日期',
  `actual_end_date` date DEFAULT NULL COMMENT '实际终止日期',
  `total_amount` decimal(15,2) DEFAULT NULL COMMENT '合同总金额',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'CNY' COMMENT '币种',
  `paid_amount` decimal(15,2) DEFAULT '0.00' COMMENT '已付金额',
  `main_file_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '主文件路径',
  `change_count` int DEFAULT '0' COMMENT '变更次数',
  `transfer_count` int DEFAULT '0' COMMENT '转让次数',
  `created_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人姓名',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人姓名',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标志 0-正常 1-删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '版本号',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `contract_uid` (`contract_uid`) USING BTREE,
  UNIQUE KEY `contract_no` (`contract_no`) USING BTREE,
  KEY `idx_contract_no` (`contract_no`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_type` (`contract_type`) USING BTREE,
  KEY `idx_sign_date` (`sign_date`) USING BTREE,
  KEY `idx_expire_date` (`expire_date`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_party_a` (`party_a_name`) USING BTREE,
  KEY `idx_party_b` (`party_b_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='合同主表';

-- ----------------------------
-- Records of contract
-- ----------------------------
BEGIN;
INSERT INTO `contract` (`id`, `contract_uid`, `contract_no`, `contract_name`, `contract_type`, `status`, `party_a_name`, `party_b_name`, `party_a_id`, `party_b_id`, `sign_date`, `effective_date`, `expire_date`, `actual_end_date`, `total_amount`, `currency`, `paid_amount`, `main_file_path`, `change_count`, `transfer_count`, `created_by_name`, `created_time`, `updated_by_name`, `updated_time`, `is_deleted`, `version`, `content`) VALUES (1, '1', '1', '1', '1', '1', '1', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, 'CNY', 0.00, NULL, 0, 0, NULL, '2026-01-05 16:44:38', NULL, '2026-01-05 16:44:38', 0, 1, '1');
COMMIT;

-- ----------------------------
-- Table structure for contract_audit_log
-- ----------------------------
DROP TABLE IF EXISTS `contract_audit_log`;
CREATE TABLE `contract_audit_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `audit_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '审计日志唯一标识',
  `audit_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '审计类型: DATA_CHANGE/AUTH_CHANGE/CONFIG_CHANGE',
  `table_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '表名',
  `record_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '记录ID',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作: INSERT/UPDATE/DELETE/SELECT',
  `old_data` json DEFAULT NULL COMMENT '旧数据',
  `new_data` json DEFAULT NULL COMMENT '新数据',
  `diff_data` json DEFAULT NULL COMMENT '差异数据',
  `changed_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '变更字段',
  `sql_statement` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'SQL语句',
  `sql_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'SQL参数',
  `execution_time_ms` int DEFAULT NULL COMMENT '执行时间(毫秒)',
  `affected_rows` int DEFAULT NULL COMMENT '影响行数',
  `success_flag` tinyint DEFAULT '1' COMMENT '成功标志',
  `db_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '数据库名',
  `connection_id` bigint DEFAULT NULL COMMENT '连接ID',
  `operator_id` bigint DEFAULT NULL COMMENT '操作人ID',
  `operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作人姓名',
  `operator_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作人IP',
  `operation_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `audit_uid` (`audit_uid`) USING BTREE,
  KEY `idx_table_record` (`table_name`,`record_id`) USING BTREE,
  KEY `idx_audit_type` (`audit_type`) USING BTREE,
  KEY `idx_operation` (`operation`) USING BTREE,
  KEY `idx_operator` (`operator_id`) USING BTREE,
  KEY `idx_operation_time` (`operation_time`) USING BTREE,
  KEY `idx_success` (`success_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='审计日志表';

-- ----------------------------
-- Records of contract_audit_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for contract_change_record
-- ----------------------------
DROP TABLE IF EXISTS `contract_change_record`;
CREATE TABLE `contract_change_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `change_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '变更记录唯一标识',
  `business_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务类型: CONTRACT/CLAUSE/PARTY/AMOUNT',
  `target_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '目标类型',
  `target_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '目标ID',
  `target_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '目标名称',
  `change_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '变更类型: FIELD_UPDATE/STATUS_CHANGE/AMOUNT_ADJUST',
  `change_version` int DEFAULT '1' COMMENT '变更版本',
  `change_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '变更标题',
  `change_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '变更原因',
  `change_content` json NOT NULL COMMENT '变更内容',
  `change_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '变更详情',
  `affect_field` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '影响字段',
  `affect_amount` decimal(15,2) DEFAULT NULL COMMENT '影响金额',
  `approval_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'PENDING' COMMENT '审批状态',
  `approval_flow_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '审批流ID',
  `approval_remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '审批备注',
  `applicant_id` bigint DEFAULT NULL COMMENT '申请人ID',
  `applicant_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '申请人姓名',
  `approver_id` bigint DEFAULT NULL COMMENT '审批人ID',
  `approver_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '审批人姓名',
  `auditor_id` bigint DEFAULT NULL COMMENT '审核人ID',
  `auditor_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '审核人姓名',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `approval_time` datetime DEFAULT NULL COMMENT '审批时间',
  `effective_time` datetime DEFAULT NULL COMMENT '生效时间',
  `created_by` bigint NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `change_uid` (`change_uid`) USING BTREE,
  KEY `idx_target` (`target_type`,`target_id`) USING BTREE,
  KEY `idx_business` (`business_type`) USING BTREE,
  KEY `idx_status` (`approval_status`) USING BTREE,
  KEY `idx_applicant` (`applicant_id`) USING BTREE,
  KEY `idx_apply_time` (`apply_time`) USING BTREE,
  KEY `idx_approval_time` (`approval_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='变更记录表';

-- ----------------------------
-- Records of contract_change_record
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for contract_file_attachment
-- ----------------------------
DROP TABLE IF EXISTS `contract_file_attachment`;
CREATE TABLE `contract_file_attachment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `file_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件唯一标识',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件名',
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '原始文件名',
  `file_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件类型',
  `file_size` bigint DEFAULT NULL COMMENT '文件大小(字节)',
  `file_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件路径',
  `file_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件URL',
  `business_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '业务类型',
  `business_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '业务ID',
  `module_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '模块编码',
  `file_hash` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件哈希',
  `mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'MIME类型',
  `file_extension` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件扩展名',
  `thumbnail_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '缩略图路径',
  `has_thumbnail` tinyint DEFAULT '0' COMMENT '是否有缩略图',
  `visibility` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'PUBLIC' COMMENT '可见性',
  `download_count` int DEFAULT '0' COMMENT '下载次数',
  `view_count` int DEFAULT '0' COMMENT '查看次数',
  `uploader_id` bigint DEFAULT NULL COMMENT '上传人ID',
  `uploader_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '上传人姓名',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `file_uid` (`file_uid`) USING BTREE,
  KEY `idx_business` (`business_type`,`business_id`) USING BTREE,
  KEY `idx_file_uid` (`file_uid`) USING BTREE,
  KEY `idx_uploader` (`uploader_id`) USING BTREE,
  KEY `idx_file_type` (`file_type`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='文件附件表';

-- ----------------------------
-- Records of contract_file_attachment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for contract_operation_record
-- ----------------------------
DROP TABLE IF EXISTS `contract_operation_record`;
CREATE TABLE `contract_operation_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `record_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '记录唯一标识',
  `module_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模块编码: CONTRACT/PAYMENT/APPROVAL',
  `module_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '模块名称',
  `business_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务类型: CREATE/UPDATE/DELETE/VIEW/EXPORT',
  `target_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '目标类型: CONTRACT/CLAUSE/ATTACHMENT',
  `target_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '目标ID',
  `target_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '目标名称',
  `operation_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作标题',
  `operation_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '操作详情',
  `before_content` json DEFAULT NULL COMMENT '操作前内容',
  `after_content` json DEFAULT NULL COMMENT '操作后内容',
  `change_content` json DEFAULT NULL COMMENT '变更内容',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'IP地址',
  `user_agent` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户代理',
  `device_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '设备类型: PC/MOBILE',
  `browser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '浏览器',
  `os` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作系统',
  `request_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '请求URL',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '请求方法',
  `request_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '请求参数',
  `execution_time` int DEFAULT NULL COMMENT '执行耗时(毫秒)',
  `success_flag` tinyint DEFAULT '1' COMMENT '成功标志 1-成功 0-失败',
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '错误信息',
  `operator_id` bigint NOT NULL COMMENT '操作人ID',
  `operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作人姓名',
  `operator_dept_id` bigint DEFAULT NULL COMMENT '操作人部门ID',
  `operator_dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作人部门',
  `operation_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `log_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'INFO' COMMENT '日志级别',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `record_uid` (`record_uid`) USING BTREE,
  KEY `idx_target` (`target_type`,`target_id`) USING BTREE,
  KEY `idx_module` (`module_code`,`business_type`) USING BTREE,
  KEY `idx_operator` (`operator_id`) USING BTREE,
  KEY `idx_operation_time` (`operation_time`) USING BTREE,
  KEY `idx_ip` (`ip_address`) USING BTREE,
  KEY `idx_success` (`success_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='操作记录表';

-- ----------------------------
-- Records of contract_operation_record
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for contract_payment_record
-- ----------------------------
DROP TABLE IF EXISTS `contract_payment_record`;
CREATE TABLE `contract_payment_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `payment_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '付款记录唯一标识',
  `contract_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '合同唯一标识',
  `contract_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '合同编号',
  `contract_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '合同名称',
  `payment_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '付款单号',
  `payment_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '付款类型',
  `payment_amount` decimal(15,2) NOT NULL COMMENT '付款金额',
  `paid_amount` decimal(15,2) DEFAULT '0.00' COMMENT '已付金额',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'CNY' COMMENT '币种',
  `payer_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '付款方ID',
  `payer_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '付款方名称',
  `payee_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '收款方ID',
  `payee_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '收款方名称',
  `plan_pay_date` date DEFAULT NULL COMMENT '计划付款日期',
  `actual_pay_date` date DEFAULT NULL COMMENT '实际付款日期',
  `due_date` date DEFAULT NULL COMMENT '到期日',
  `payment_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'PENDING' COMMENT '付款状态',
  `invoice_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'NONE' COMMENT '发票状态',
  `approval_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'PENDING' COMMENT '审批状态',
  `approval_flow_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '审批流ID',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `attachment_ids` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '附件ID列表',
  `applicant_id` bigint DEFAULT NULL COMMENT '申请人ID',
  `applicant_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '申请人姓名',
  `created_by` bigint NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `payment_uid` (`payment_uid`) USING BTREE,
  KEY `idx_contract` (`contract_uid`) USING BTREE,
  KEY `idx_payment_no` (`payment_no`) USING BTREE,
  KEY `idx_payment_status` (`payment_status`) USING BTREE,
  KEY `idx_plan_date` (`plan_pay_date`) USING BTREE,
  KEY `idx_actual_date` (`actual_pay_date`) USING BTREE,
  KEY `idx_payer` (`payer_name`) USING BTREE,
  KEY `idx_payee` (`payee_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='合同付款记录表';

-- ----------------------------
-- Records of contract_payment_record
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for contract_statistics
-- ----------------------------
DROP TABLE IF EXISTS `contract_statistics`;
CREATE TABLE `contract_statistics` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL COMMENT '统计日期',
  `contract_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '合同类型',
  `department_id` bigint DEFAULT NULL COMMENT '部门ID',
  `total_count` int DEFAULT '0' COMMENT '总数量',
  `draft_count` int DEFAULT '0' COMMENT '草稿数量',
  `effective_count` int DEFAULT '0' COMMENT '生效数量',
  `expired_count` int DEFAULT '0' COMMENT '过期数量',
  `terminated_count` int DEFAULT '0' COMMENT '终止数量',
  `total_amount` decimal(20,2) DEFAULT '0.00' COMMENT '总金额',
  `paid_amount` decimal(20,2) DEFAULT '0.00' COMMENT '已付金额',
  `unpaid_amount` decimal(20,2) DEFAULT '0.00' COMMENT '未付金额',
  `change_count` int DEFAULT '0' COMMENT '变更次数',
  `created_count` int DEFAULT '0' COMMENT '当日新增',
  `expire_soon_count` int DEFAULT '0' COMMENT '即将到期数量(30天内)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_date_type_dept` (`stat_date`,`contract_type`,`department_id`) USING BTREE,
  KEY `idx_stat_date` (`stat_date`) USING BTREE,
  KEY `idx_department` (`department_id`) USING BTREE,
  KEY `idx_type` (`contract_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='合同统计表';

-- ----------------------------
-- Records of contract_statistics
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for contract_system_log
-- ----------------------------
DROP TABLE IF EXISTS `contract_system_log`;
CREATE TABLE `contract_system_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `log_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日志唯一标识',
  `log_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日志类型: SYSTEM/BUSINESS/ERROR/LOGIN/OPERATION',
  `log_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'INFO' COMMENT '日志级别',
  `log_source` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日志来源',
  `logger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '记录器名称',
  `log_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日志标题',
  `log_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日志内容',
  `exception_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '异常信息',
  `stack_trace` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '堆栈跟踪',
  `business_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '业务编号',
  `business_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '业务类型',
  `trace_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '跟踪ID',
  `span_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '跨度ID',
  `service_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '服务名称',
  `host_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '主机地址',
  `host_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '主机名',
  `thread_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '线程名',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户名',
  `client_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '客户端IP',
  `log_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '日志时间',
  `duration_ms` int DEFAULT NULL COMMENT '持续时间(毫秒)',
  `keyword1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '关键字1',
  `keyword2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '关键字2',
  `keyword3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '关键字3',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `log_uid` (`log_uid`) USING BTREE,
  KEY `idx_log_time` (`log_time`) USING BTREE,
  KEY `idx_log_level` (`log_level`) USING BTREE,
  KEY `idx_log_type` (`log_type`) USING BTREE,
  KEY `idx_user` (`user_id`) USING BTREE,
  KEY `idx_trace` (`trace_id`) USING BTREE,
  KEY `idx_business` (`business_type`,`business_no`) USING BTREE,
  KEY `idx_service` (`service_name`) USING BTREE,
  KEY `idx_keyword1` (`keyword1`) USING BTREE,
  KEY `idx_keyword2` (`keyword2`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='系统日志表';

-- ----------------------------
-- Records of contract_system_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for contract_transfer_record
-- ----------------------------
DROP TABLE IF EXISTS `contract_transfer_record`;
CREATE TABLE `contract_transfer_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `transfer_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '转让记录唯一标识',
  `target_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '目标类型: CONTRACT/RIGHT/OBLIGATION',
  `target_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '目标ID',
  `target_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '目标名称',
  `transfer_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '转让类型: OWNER_CHANGE/RIGHT_TRANSFER',
  `transfer_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '转让原因',
  `transfer_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '转让内容',
  `transfer_amount` decimal(15,2) DEFAULT NULL COMMENT '转让金额',
  `from_party_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '转出方类型: PERSON/DEPARTMENT/COMPANY',
  `from_party_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '转出方ID',
  `from_party_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '转出方名称',
  `from_user_id` bigint DEFAULT NULL COMMENT '转出用户ID',
  `from_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '转出用户姓名',
  `to_party_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '转入方类型',
  `to_party_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '转入方ID',
  `to_party_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '转入方名称',
  `to_user_id` bigint DEFAULT NULL COMMENT '转入用户ID',
  `to_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '转入用户姓名',
  `approval_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'PENDING' COMMENT '审批状态',
  `approval_flow_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '审批流ID',
  `transfer_time` datetime DEFAULT NULL COMMENT '转让时间',
  `effective_time` datetime DEFAULT NULL COMMENT '生效时间',
  `complete_time` datetime DEFAULT NULL COMMENT '完成时间',
  `attachment_ids` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '附件ID列表',
  `contract_attachment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '转让协议附件',
  `created_by` bigint NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `transfer_uid` (`transfer_uid`) USING BTREE,
  KEY `idx_target` (`target_type`,`target_id`) USING BTREE,
  KEY `idx_transfer_type` (`transfer_type`) USING BTREE,
  KEY `idx_from_party` (`from_party_type`,`from_party_id`) USING BTREE,
  KEY `idx_to_party` (`to_party_type`,`to_party_id`) USING BTREE,
  KEY `idx_status` (`approval_status`) USING BTREE,
  KEY `idx_transfer_time` (`transfer_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='转让记录表';

-- ----------------------------
-- Records of contract_transfer_record
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
