/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80041 (8.0.41)
 Source Host           : localhost:3306
 Source Schema         : by_cloud_01

 Target Server Type    : MySQL
 Target Server Version : 80041 (8.0.41)
 File Encoding         : 65001

 Date: 28/02/2026 09:26:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for by_department
-- ----------------------------
DROP TABLE IF EXISTS `by_department`;
CREATE TABLE `by_department`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门ID（UUID去掉短横线）',
  `department_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门编码',
  `department_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门名称',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '部门描述',
  `parent_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '父部门ID',
  `level` int NULL DEFAULT 1 COMMENT '部门层级（从1开始）',
  `path` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '部门路径（ID路径，用/分隔）',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序号',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态：0-禁用，1-启用',
  `manager_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '负责人ID',
  `manager_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '负责人姓名',
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_department_code`(`department_code` ASC) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_level`(`level` ASC) USING BTREE,
  INDEX `idx_status_sort`(`status` ASC, `sort_order` ASC) USING BTREE,
  INDEX `idx_path`(`path`(255) ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '部门信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of by_department
-- ----------------------------
INSERT INTO `by_department` VALUES ('a8deeba0fdaa11f09d542cfda15d723b', 'COMPANY', 'XX科技集团', '公司总部', '0', 1, '/a8deeba0fdaa11f09d542cfda15d723b/', 0, 1, NULL, NULL, NULL, '2026-01-30 15:09:46', NULL, '2026-01-30 16:11:29');
INSERT INTO `by_department` VALUES ('a92ff90afdaa11f09d542cfda15d723b', 'ADMIN', '行政管理中心', '负责公司行政事务管理', 'a8deeba0fdaa11f09d542cfda15d723b', 2, '/a8deeba0fdaa11f09d542cfda15d723b/a92ff90afdaa11f09d542cfda15d723b/', 10, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a93009d2fdaa11f09d542cfda15d723b', 'HR', '人力资源中心', '负责人才招聘与发展', 'a8deeba0fdaa11f09d542cfda15d723b', 2, '/a8deeba0fdaa11f09d542cfda15d723b/a93009d2fdaa11f09d542cfda15d723b/', 20, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a9304929fdaa11f09d542cfda15d723b', 'TECH', '技术研发中心', '负责产品研发和技术创新', 'a8deeba0fdaa11f09d542cfda15d723b', 2, '/a8deeba0fdaa11f09d542cfda15d723b/a9304929fdaa11f09d542cfda15d723b/', 30, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a9306a53fdaa11f09d542cfda15d723b', 'MARKET', '市场营销中心', '负责市场推广和品牌建设', 'a8deeba0fdaa11f09d542cfda15d723b', 2, '/a8deeba0fdaa11f09d542cfda15d723b/a9306a53fdaa11f09d542cfda15d723b/', 40, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a9307a7ffdaa11f09d542cfda15d723b', 'FINANCE', '财务中心', '负责公司财务管理', 'a8deeba0fdaa11f09d542cfda15d723b', 2, '/a8deeba0fdaa11f09d542cfda15d723b/a9307a7ffdaa11f09d542cfda15d723b/', 50, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a9308848fdaa11f09d542cfda15d723b', 'SERVICE', '客户服务中心', '负责客户支持与服务', 'a8deeba0fdaa11f09d542cfda15d723b', 2, '/a8deeba0fdaa11f09d542cfda15d723b/a9308848fdaa11f09d542cfda15d723b/', 60, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a947a311fdaa11f09d542cfda15d723b', 'ADMIN-01', '行政办公室', '日常行政事务处理', 'a92ff90afdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a92ff90afdaa11f09d542cfda15d723b/a947a311fdaa11f09d542cfda15d723b/', 11, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a947c70efdaa11f09d542cfda15d723b', 'ADMIN-02', '资产管理部', '公司固定资产管理', 'a92ff90afdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a92ff90afdaa11f09d542cfda15d723b/a947c70efdaa11f09d542cfda15d723b/', 12, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a948155afdaa11f09d542cfda15d723b', 'ADMIN-03', '后勤保障部', '后勤服务与保障', 'a92ff90afdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a92ff90afdaa11f09d542cfda15d723b/a948155afdaa11f09d542cfda15d723b/', 13, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a94835dafdaa11f09d542cfda15d723b', 'ADMIN-04', '法务部', '法律事务与合规', 'a92ff90afdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a92ff90afdaa11f09d542cfda15d723b/a94835dafdaa11f09d542cfda15d723b/', 14, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a956202cfdaa11f09d542cfda15d723b', 'HR-01', '招聘部', '人才招聘与引进', 'a93009d2fdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a93009d2fdaa11f09d542cfda15d723b/a956202cfdaa11f09d542cfda15d723b/', 21, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a9564900fdaa11f09d542cfda15d723b', 'HR-02', '培训发展部', '员工培训与发展', 'a93009d2fdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a93009d2fdaa11f09d542cfda15d723b/a9564900fdaa11f09d542cfda15d723b/', 22, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a956647ffdaa11f09d542cfda15d723b', 'HR-03', '薪酬绩效部', '薪酬福利与绩效考核', 'a93009d2fdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a93009d2fdaa11f09d542cfda15d723b/a956647ffdaa11f09d542cfda15d723b/', 23, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a95678c8fdaa11f09d542cfda15d723b', 'HR-04', '员工关系部', '员工关系与企业文化', 'a93009d2fdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a93009d2fdaa11f09d542cfda15d723b/a95678c8fdaa11f09d542cfda15d723b/', 24, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a961292cfdaa11f09d542cfda15d723b', 'TECH-01', '前端开发部', '前端技术研发', 'a9304929fdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a9304929fdaa11f09d542cfda15d723b/a961292cfdaa11f09d542cfda15d723b/', 31, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a961333efdaa11f09d542cfda15d723b', 'TECH-02', '后端开发部', '后端服务研发', 'a9304929fdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a9304929fdaa11f09d542cfda15d723b/a961333efdaa11f09d542cfda15d723b/', 32, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a9613c5afdaa11f09d542cfda15d723b', 'TECH-03', '测试部', '软件测试与质量保证', 'a9304929fdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a9304929fdaa11f09d542cfda15d723b/a9613c5afdaa11f09d542cfda15d723b/', 33, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a961451dfdaa11f09d542cfda15d723b', 'TECH-04', '运维部', '系统运维与部署', 'a9304929fdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a9304929fdaa11f09d542cfda15d723b/a961451dfdaa11f09d542cfda15d723b/', 34, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a96e5211fdaa11f09d542cfda15d723b', 'MARKET-01', '市场部', '市场调研与分析', 'a9306a53fdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a9306a53fdaa11f09d542cfda15d723b/a96e5211fdaa11f09d542cfda15d723b/', 41, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a96e6ebafdaa11f09d542cfda15d723b', 'MARKET-02', '品牌部', '品牌建设与推广', 'a9306a53fdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a9306a53fdaa11f09d542cfda15d723b/a96e6ebafdaa11f09d542cfda15d723b/', 42, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a96e81d5fdaa11f09d542cfda15d723b', 'MARKET-03', '销售部', '产品销售与渠道', 'a9306a53fdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a9306a53fdaa11f09d542cfda15d723b/a96e81d5fdaa11f09d542cfda15d723b/', 43, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a96e935efdaa11f09d542cfda15d723b', 'MARKET-04', '公关部', '公共关系维护', 'a9306a53fdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a9306a53fdaa11f09d542cfda15d723b/a96e935efdaa11f09d542cfda15d723b/', 44, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a97d8b06fdaa11f09d542cfda15d723b', 'FINANCE-01', '会计部', '会计核算与报表', 'a9307a7ffdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a9307a7ffdaa11f09d542cfda15d723b/a97d8b06fdaa11f09d542cfda15d723b/', 51, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a97d9bdafdaa11f09d542cfda15d723b', 'FINANCE-02', '资金部', '资金管理与调度', 'a9307a7ffdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a9307a7ffdaa11f09d542cfda15d723b/a97d9bdafdaa11f09d542cfda15d723b/', 52, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a97da98bfdaa11f09d542cfda15d723b', 'FINANCE-03', '预算部', '预算编制与控制', 'a9307a7ffdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a9307a7ffdaa11f09d542cfda15d723b/a97da98bfdaa11f09d542cfda15d723b/', 53, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a97db7a7fdaa11f09d542cfda15d723b', 'FINANCE-04', '审计部', '内部审计与风控', 'a9307a7ffdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a9307a7ffdaa11f09d542cfda15d723b/a97db7a7fdaa11f09d542cfda15d723b/', 54, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a9852478fdaa11f09d542cfda15d723b', 'SERVICE-01', '客服部', '客户咨询与支持', 'a9308848fdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a9308848fdaa11f09d542cfda15d723b/a9852478fdaa11f09d542cfda15d723b/', 61, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a9853261fdaa11f09d542cfda15d723b', 'SERVICE-02', '技术支持部', '技术问题解决', 'a9308848fdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a9308848fdaa11f09d542cfda15d723b/a9853261fdaa11f09d542cfda15d723b/', 62, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a9853fe7fdaa11f09d542cfda15d723b', 'SERVICE-03', '客户成功部', '客户关系维护', 'a9308848fdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a9308848fdaa11f09d542cfda15d723b/a9853fe7fdaa11f09d542cfda15d723b/', 63, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a9854c94fdaa11f09d542cfda15d723b', 'SERVICE-04', '投诉处理部', '投诉受理与解决', 'a9308848fdaa11f09d542cfda15d723b', 3, '/a8deeba0fdaa11f09d542cfda15d723b/a9308848fdaa11f09d542cfda15d723b/a9854c94fdaa11f09d542cfda15d723b/', 64, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a98cc5c4fdaa11f09d542cfda15d723b', 'TECH-05', 'Java开发组', 'Java服务端开发', 'a961333efdaa11f09d542cfda15d723b', 4, '/a8deeba0fdaa11f09d542cfda15d723b/a9304929fdaa11f09d542cfda15d723b/a961333efdaa11f09d542cfda15d723b/a98cc5c4fdaa11f09d542cfda15d723b/', 321, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a98cd55afdaa11f09d542cfda15d723b', 'TECH-06', 'Python开发组', 'Python服务端开发', 'a961333efdaa11f09d542cfda15d723b', 4, '/a8deeba0fdaa11f09d542cfda15d723b/a9304929fdaa11f09d542cfda15d723b/a961333efdaa11f09d542cfda15d723b/a98cd55afdaa11f09d542cfda15d723b/', 322, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a98cf368fdaa11f09d542cfda15d723b', 'TECH-07', '算法组', '算法研发', 'a961333efdaa11f09d542cfda15d723b', 4, '/a8deeba0fdaa11f09d542cfda15d723b/a9304929fdaa11f09d542cfda15d723b/a961333efdaa11f09d542cfda15d723b/a98cf368fdaa11f09d542cfda15d723b/', 323, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');
INSERT INTO `by_department` VALUES ('a98d0927fdaa11f09d542cfda15d723b', 'TECH-08', '架构组', '系统架构设计', 'a961333efdaa11f09d542cfda15d723b', 4, '/a8deeba0fdaa11f09d542cfda15d723b/a9304929fdaa11f09d542cfda15d723b/a961333efdaa11f09d542cfda15d723b/a98d0927fdaa11f09d542cfda15d723b/', 324, 1, NULL, NULL, NULL, '2026-01-30 15:09:47', NULL, '2026-01-30 15:09:47');

-- ----------------------------
-- Table structure for by_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `by_operate_log`;
CREATE TABLE `by_operate_log`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日志ID',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操作模块',
  `oper_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操作类型',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'URL',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '请求方式',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'IP地址',
  `ip_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'IP归属地',
  `ip_version` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'IP版本(IPv4/IPv6)',
  `user_agent` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户代理',
  `browser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器',
  `browser_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器版本',
  `os` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `os_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统版本',
  `device` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '设备类型',
  `device_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '设备型号',
  `oper_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of by_operate_log
-- ----------------------------
INSERT INTO `by_operate_log` VALUES ('c8e4b7df385d45c38d83ec7405d3faf0', '用户基本信息', 'QUERY', 'http://localhost:8902/byUser/findPageUser', '/byUser/findPageUser', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 09:15:54', '2026-01-30 09:15:54');
INSERT INTO `by_operate_log` VALUES ('cc55e6884d0946428ce02af6a27368f8', '用户基本信息', 'QUERY', 'http://localhost:8902/byUser/findPageUser', '/byUser/findPageUser', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 09:17:34', '2026-01-30 09:17:34');
INSERT INTO `by_operate_log` VALUES ('11016a7f500e40ca8133925ad7db3683', '用户基本信息', 'QUERY', 'http://localhost:8902/byUser/findPageUser', '/byUser/findPageUser', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 09:18:35', '2026-01-30 09:18:35');
INSERT INTO `by_operate_log` VALUES ('7b5f72d37cde4845b17cd65dd0a33867', '角色基本信息', 'QUERY', 'http://localhost:8902/byRole/finRoleTree', '/byRole/finRoleTree', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 10:54:09', '2026-01-30 10:54:09');
INSERT INTO `by_operate_log` VALUES ('49acba948fbe492b9f456486e2318b7e', '用户基本信息', 'QUERY', 'http://localhost:8902/byUser/findPageUser', '/byUser/findPageUser', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 11:09:54', '2026-01-30 11:09:54');
INSERT INTO `by_operate_log` VALUES ('8c8ca112ef714578a743dc385dbb2792', '用户基本信息', 'QUERY', 'http://localhost:8902/byUser/findPageUser', '/byUser/findPageUser', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 11:11:26', '2026-01-30 11:11:26');
INSERT INTO `by_operate_log` VALUES ('884b0f27e7cd42a3824c0d75fd06d97a', '用户基本信息', 'QUERY', 'http://localhost:8902/byUser/findPageUser', '/byUser/findPageUser', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 11:13:00', '2026-01-30 11:13:00');
INSERT INTO `by_operate_log` VALUES ('0b35e5b6c6dc468e8bdab2c86123cbc6', '用户基本信息', 'QUERY', 'http://localhost:8902/byUser/findPageUser', '/byUser/findPageUser', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 11:13:19', '2026-01-30 11:13:19');
INSERT INTO `by_operate_log` VALUES ('d73c4d009c7a4ac7bcb436dac4ee9b51', '角色基本信息', 'UPDATE', 'http://localhost:8902/byRole/insertOrUpdateRole', '/byRole/insertOrUpdateRole', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 15:18:21', '2026-01-30 15:18:21');
INSERT INTO `by_operate_log` VALUES ('bd5af9bc042540adbe3eafbf8025b817', '角色基本信息', 'UPDATE', 'http://localhost:8902/byRole/insertOrUpdateRole', '/byRole/insertOrUpdateRole', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 15:20:08', '2026-01-30 15:20:08');
INSERT INTO `by_operate_log` VALUES ('026a049db4aa473f93774390a47f8347', '角色基本信息', 'UPDATE', 'http://localhost:8902/byRole/insertOrUpdateRole', '/byRole/insertOrUpdateRole', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 15:22:52', '2026-01-30 15:22:52');
INSERT INTO `by_operate_log` VALUES ('50a1117c6fc74e3c9103050764ee48c1', '角色基本信息', 'QUERY', 'http://localhost:8902/byRole/finRoleTree', '/byRole/finRoleTree', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 15:24:41', '2026-01-30 15:24:41');
INSERT INTO `by_operate_log` VALUES ('7c5f095369e34f25bbada6354274f800', '角色基本信息', 'DELETE', 'http://localhost:8902/byRole/deletRoleByRoleId/cd156811453e41348e1f8f23bb805b6c', '/byRole/deletRoleByRoleId/cd156811453e41348e1f8f23bb805b6c', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 15:30:49', '2026-01-30 15:30:49');
INSERT INTO `by_operate_log` VALUES ('e747ff6e241b4f7caee87b307f063a5f', '角色基本信息', 'DELETE', 'http://localhost:8902/byRole/deletRoleByRoleId/cd156811453e41348e1f8f23bb805b6c', '/byRole/deletRoleByRoleId/cd156811453e41348e1f8f23bb805b6c', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 15:32:17', '2026-01-30 15:32:17');
INSERT INTO `by_operate_log` VALUES ('9182c8fab6ce43b986cb10fe47338181', '角色基本信息', 'DELETE', 'http://localhost:8902/byRole/deletRoleByRoleId/cd156811453e41348e1f8f23bb805b6c', '/byRole/deletRoleByRoleId/cd156811453e41348e1f8f23bb805b6c', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 15:32:54', '2026-01-30 15:32:54');
INSERT INTO `by_operate_log` VALUES ('a057e5c4c238405e80ffbb0e510bf6fd', '角色基本信息', 'DELETE', 'http://localhost:8902/byRole/deletRoleByRoleId/1', '/byRole/deletRoleByRoleId/1', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.5845.97 Safari/537.36 Core/1.116.608.400 QQBrowser/20.0.7161.400', 'Chrome', '116.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 15:33:41', '2026-01-30 15:33:41');
INSERT INTO `by_operate_log` VALUES ('a586393fd9394fe9965ee1443b8cd92d', '角色基本信息', 'DELETE', 'http://localhost:8902/byRole/deletRoleByRoleId/1', '/byRole/deletRoleByRoleId/1', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.5845.97 Safari/537.36 Core/1.116.608.400 QQBrowser/20.0.7161.400', 'Chrome', '116.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 15:36:36', '2026-01-30 15:36:36');
INSERT INTO `by_operate_log` VALUES ('8b0beeb989ff467e873406590000d5ac', '菜单基本信息', 'QUERY', 'http://localhost:8902/byPermission/finPermissionTree', '/byPermission/finPermissionTree', 'GET', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 16:10:02', '2026-01-30 16:10:02');
INSERT INTO `by_operate_log` VALUES ('4c4f9e13f56f40a4be88301fd7fcd62d', '部门基本信息', 'QUERY', 'http://localhost:8902/byDepartment/finDepartmentTree', '/byDepartment/finDepartmentTree', 'GET', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 16:10:14', '2026-01-30 16:10:14');
INSERT INTO `by_operate_log` VALUES ('ca4fc9aac53a4ee0810d6fc0bff6ec1a', '部门基本信息', 'QUERY', 'http://localhost:8902/byDepartment/finDepartmentTree', '/byDepartment/finDepartmentTree', 'GET', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 16:11:47', '2026-01-30 16:11:47');
INSERT INTO `by_operate_log` VALUES ('6a90605942bb4ff791d593cef94d7dc5', '用户基本信息', 'QUERY', 'http://localhost:8902/byUser/findPageUser', '/byUser/findPageUser', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 16:54:36', '2026-01-30 16:54:36');
INSERT INTO `by_operate_log` VALUES ('1410167c1a3f45ca872d287c560b007f', '用户基本信息', 'QUERY', 'http://localhost:8902/byUser/findPageUser', '/byUser/findPageUser', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 16:54:40', '2026-01-30 16:54:40');
INSERT INTO `by_operate_log` VALUES ('1d139fc81d9a44c796008700a6ddb9cb', '用户基本信息', 'QUERY', 'http://localhost:8902/byUser/findPageUser', '/byUser/findPageUser', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 16:54:59', '2026-01-30 16:54:59');
INSERT INTO `by_operate_log` VALUES ('48f40eb81986401b86c946f729c106a0', '用户基本信息', 'QUERY', 'http://localhost:8902/byUser/findPageUser', '/byUser/findPageUser', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 16:57:11', '2026-01-30 16:57:11');
INSERT INTO `by_operate_log` VALUES ('2789c0d67f7646f39ca37c6e6939ed8b', '用户基本信息', 'DELETE', 'http://localhost:8902/byUser/deleteByUserId/6ba7b8189dad11d180b400c04fd430c8', '/byUser/deleteByUserId/6ba7b8189dad11d180b400c04fd430c8', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 17:01:18', '2026-01-30 17:01:18');
INSERT INTO `by_operate_log` VALUES ('4d29dd8f3dc34fee92a87abedd95ed47', '用户基本信息', 'QUERY', 'http://localhost:8902/byUser/findPageUser', '/byUser/findPageUser', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 17:01:21', '2026-01-30 17:01:21');
INSERT INTO `by_operate_log` VALUES ('7c37c7e19b974cd6aa4fdcf6b9b4082e', '用户基本信息', 'QUERY', 'http://localhost:8902/byUser/findPageUser', '/byUser/findPageUser', 'POST', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-01-30 17:01:23', '2026-01-30 17:01:23');
INSERT INTO `by_operate_log` VALUES ('1f985e08464241e7b50332b6729791c9', '部门基本信息', 'QUERY', 'http://localhost:8902/byDepartment/finDepartmentTree', '/byDepartment/finDepartmentTree', 'GET', '192.168.28.194', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-02-03 10:46:50', '2026-02-03 10:46:50');
INSERT INTO `by_operate_log` VALUES ('cfbce5eb2ae6423e9c1331e41cccf185', 'AOP部门树图', '查看', 'http://localhost:8902/byDepartment/finDepartmentTree', '/byDepartment/finDepartmentTree', 'GET', '0:0:0:0:0:0:0:1', '局域网地址', 'IPv4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'Chrome', '144.0', 'Windows', '10.0', 'Desktop', 'Windows', '2026-02-06 15:44:40', '2026-02-06 15:44:40');

-- ----------------------------
-- Table structure for by_permission
-- ----------------------------
DROP TABLE IF EXISTS `by_permission`;
CREATE TABLE `by_permission`  (
  `permission_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限ID，UUID去掉横杠的32位字符串',
  `permission_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限编码，唯一标识，用于权限控制',
  `permission_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限名称，显示用',
  `permission_type` tinyint NULL DEFAULT NULL COMMENT '权限类型：1-菜单权限，2-按钮权限，3-API接口权限',
  `parent_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '父权限ID，用于构建权限树，0表示根节点',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限对应的URL地址或API路径',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限图标，用于前端展示',
  `sort` int NULL DEFAULT 0 COMMENT '排序号，数字越小越靠前',
  `status` tinyint NULL DEFAULT 1 COMMENT '权限状态：1-启用，0-禁用',
  PRIMARY KEY (`permission_id`) USING BTREE,
  UNIQUE INDEX `permission_code`(`permission_code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统权限点信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of by_permission
-- ----------------------------
INSERT INTO `by_permission` VALUES ('6ba7b84e9dad11d180b400c04fd430c8', 'SYSTEM_MANAGE', '系统管理', 1, '0', NULL, 'setting', 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b84f9dad11d180b400c04fd430c8', 'USER_MANAGE', '用户管理', 1, '6ba7b84e9dad11d180b400c04fd430c8', '/user', 'user', 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b8509dad11d180b400c04fd430c8', 'USER_ADD', '用户新增', 2, '6ba7b84f9dad11d180b400c04fd430c8', NULL, NULL, 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b8519dad11d180b400c04fd430c8', 'USER_EDIT', '用户编辑', 2, '6ba7b84f9dad11d180b400c04fd430c8', NULL, NULL, 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b8529dad11d180b400c04fd430c8', 'USER_DELETE', '用户删除', 2, '6ba7b84f9dad11d180b400c04fd430c8', NULL, NULL, 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b8539dad11d180b400c04fd430c8', 'USER_VIEW', '用户查看', 2, '6ba7b84f9dad11d180b400c04fd430c8', NULL, NULL, 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b8549dad11d180b400c04fd430c8', 'ROLE_MANAGE', '角色管理', 1, '6ba7b84e9dad11d180b400c04fd430c8', '/role', 'team', 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b8559dad11d180b400c04fd430c8', 'ROLE_ADD', '角色新增', 2, '6ba7b8549dad11d180b400c04fd430c8', NULL, NULL, 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b8569dad11d180b400c04fd430c8', 'ROLE_EDIT', '角色编辑', 2, '6ba7b8549dad11d180b400c04fd430c8', NULL, NULL, 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b8579dad11d180b400c04fd430c8', 'ROLE_DELETE', '角色删除', 2, '6ba7b8549dad11d180b400c04fd430c8', NULL, NULL, 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b8589dad11d180b400c04fd430c8', 'PERMISSION_MANAGE', '权限管理', 1, '6ba7b84e9dad11d180b400c04fd430c8', '/permission', 'lock', 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b8599dad11d180b400c04fd430c8', 'DEPT_MANAGE', '部门管理', 1, '0', '/dept', 'apartment', 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b85a9dad11d180b400c04fd430c8', 'DEPT_ADD', '部门新增', 2, '6ba7b8599dad11d180b400c04fd430c8', NULL, NULL, 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b85b9dad11d180b400c04fd430c8', 'DEPT_EDIT', '部门编辑', 2, '6ba7b8599dad11d180b400c04fd430c8', NULL, NULL, 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b85c9dad11d180b400c04fd430c8', 'DEPT_DELETE', '部门删除', 2, '6ba7b8599dad11d180b400c04fd430c8', NULL, NULL, 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b85d9dad11d180b400c04fd430c8', 'MENU_MANAGE', '菜单管理', 1, '6ba7b84e9dad11d180b400c04fd430c8', '/menu', 'menu', 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b85e9dad11d180b400c04fd430c8', 'LOG_MANAGE', '日志管理', 1, '0', '/log', 'file-text', 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b85f9dad11d180b400c04fd430c8', 'OPERATION_LOG', '操作日志', 2, '6ba7b85e9dad11d180b400c04fd430c8', '/log/operation', NULL, 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b8609dad11d180b400c04fd430c8', 'LOGIN_LOG', '登录日志', 2, '6ba7b85e9dad11d180b400c04fd430c8', '/log/login', NULL, 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b8619dad11d180b400c04fd430c8', 'SYSTEM_LOG', '系统日志', 2, '6ba7b85e9dad11d180b400c04fd430c8', '/log/system', NULL, 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b8629dad11d180b400c04fd430c8', 'DASHBOARD', '仪表盘', 1, '0', '/dashboard', 'dashboard', 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b8639dad11d180b400c04fd430c8', 'MONITOR', '系统监控', 1, '0', '/monitor', 'monitor', 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b8649dad11d180b400c04fd430c8', 'SERVER_MONITOR', '服务器监控', 2, '6ba7b8639dad11d180b400c04fd430c8', '/monitor/server', NULL, 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b8659dad11d180b400c04fd430c8', 'DATABASE_MONITOR', '数据库监控', 2, '6ba7b8639dad11d180b400c04fd430c8', '/monitor/database', NULL, 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b8669dad11d180b400c04fd430c8', 'SETTING', '个人设置', 1, '0', '/setting', 'user', 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b8679dad11d180b400c04fd430c8', 'PASSWORD_CHANGE', '修改密码', 2, '6ba7b8669dad11d180b400c04fd430c8', '/setting/password', NULL, 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b8689dad11d180b400c04fd430c8', 'PROFILE_EDIT', '编辑资料', 2, '6ba7b8669dad11d180b400c04fd430c8', '/setting/profile', NULL, 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b8699dad11d180b400c04fd430c8', 'NOTIFICATION', '消息通知', 1, '0', '/notification', 'bell', 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b86a9dad11d180b400c04fd430c8', 'HELP', '帮助中心', 1, '0', '/help', 'question-circle', 0, 1);
INSERT INTO `by_permission` VALUES ('6ba7b86b9dad11d180b400c04fd430c8', 'ABOUT', '关于系统', 1, '0', '/about', 'info-circle', 0, 1);

-- ----------------------------
-- Table structure for by_purchase_list
-- ----------------------------
DROP TABLE IF EXISTS `by_purchase_list`;
CREATE TABLE `by_purchase_list`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键ID（32位UUID，去除横杠）',
  `department_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门ID',
  `department_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门名称',
  `item_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物品名称',
  `item_category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物品分类（办公用品、设备、耗材等）',
  `specification` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格型号',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '单位（个、台、套等）',
  `quantity` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '采购数量',
  `estimated_price` decimal(15, 2) NULL DEFAULT NULL COMMENT '预估单价',
  `estimated_total` decimal(15, 2) NULL DEFAULT NULL COMMENT '预估总价',
  `purpose` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用途说明',
  `urgency_level` tinyint NOT NULL DEFAULT 2 COMMENT '紧急程度（1：紧急，2：一般，3：不紧急）',
  `required_date` date NOT NULL COMMENT '需求日期',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态（1：待审批，2：已批准，3：已驳回，4：已采购，5：已完成）',
  `applicant_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '申请人ID',
  `applicant_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '申请人姓名',
  `approver_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批人ID',
  `approver_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批人姓名',
  `approval_time` datetime NULL DEFAULT NULL COMMENT '审批时间',
  `approval_remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批备注',
  `actual_price` decimal(15, 2) NULL DEFAULT NULL COMMENT '实际采购单价',
  `actual_total` decimal(15, 2) NULL DEFAULT NULL COMMENT '实际采购总价',
  `supplier` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '供应商',
  `purchase_time` datetime NULL DEFAULT NULL COMMENT '采购时间',
  `receipt_time` datetime NULL DEFAULT NULL COMMENT '收货时间',
  `storage_location` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存放位置',
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记（0：正常，1：删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_department`(`department_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_applicant`(`applicant_id` ASC) USING BTREE,
  INDEX `idx_required_date`(`required_date` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门采购清单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of by_purchase_list
-- ----------------------------
INSERT INTO `by_purchase_list` VALUES ('0446d3743b0e4c2bb447aebc63d4c7ff', 'DEPT005', '行政部', '饮水机', '生活设备', '美的YR1216S-X 温热型', '台', 4.00, 650.00, 2600.00, '各楼层饮水设备更新', 2, '2024-02-28', 1, 'EMP013', '刘十五', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('1d41933659c0a636f535a749b93e0500', 'DEPT006', '研发部', 'UPS电源', '电力设备', '山特C3K 在线式', '台', 4.00, 4200.00, 16800.00, '保障研发服务器稳定运行', 1, '2024-02-08', 5, 'EMP017', '周十九', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('1f3fd67e5c16bdcf722b0806084c530c', 'DEPT004', '财务部', '计算器', '办公用品', '卡西欧HR-100TM', '个', 5.00, 85.00, 425.00, '财务核算使用', 3, '2024-03-01', 1, 'EMP019', '郑二一', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('2842765ce1b6ce9de94ec5c4fbc2a35b', 'DEPT004', '财务部', '装订机', '办公设备', '可得优重型电动', '台', 2.00, 1500.00, 3000.00, '财务报表装订', 2, '2024-02-22', 2, 'EMP011', '李十三', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('2d26e89889606719fdb687eb7414cef8', 'DEPT006', '研发部', '开发板', '电子元件', '树莓派5 8GB', '块', 20.00, 550.00, 11000.00, '物联网项目开发', 2, '2024-02-28', 2, 'EMP026', '黄二八', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('3a0204e1969f33164403c86fa8a442a8', 'DEPT004', '财务部', '碎纸机', '办公设备', '科密C-686 保密级', '台', 2.00, 3200.00, 6400.00, '销毁敏感财务文件', 2, '2024-02-18', 3, 'EMP027', '周二九', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('3f021b557f83d6b4c754f44d7136fef8', 'DEPT001', '技术部', '显示器', '电脑配件', '戴尔U2723QX 4K', '台', 8.00, 3200.00, 25600.00, '设计人员显示器升级', 2, '2024-03-05', 2, 'EMP014', '陈十六', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('43f674f23ed4254fe072b9210c724462', 'DEPT004', '财务部', '保险柜', '办公设备', '虎牌180L 电子锁', '个', 1.00, 3200.00, 3200.00, '存放重要票据', 2, '2024-02-25', 1, 'EMP005', '钱七', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('6308634606b607490f2c0c12c5c23796', 'DEPT003', '人事部', '办公桌椅', '办公家具', '实木桌椅, 160*80cm', '套', 8.00, 1800.00, 14400.00, '办公区扩容采购', 2, '2024-02-28', 2, 'EMP003', '王五', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('6d7bf95b949f81847cb97f7a926d1bd5', 'DEPT001', '技术部', '网络交换机', '网络设备', '华为S6720-54C-EI-48S', '台', 3.00, 12500.00, 37500.00, '网络设备扩容', 2, '2024-03-12', 3, 'EMP020', '王二二', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('70bc4840a0722bd52ee752c400a0fa27', 'DEPT005', '行政部', '绿植', '环境美化', '发财树 1.5米高', '盆', 15.00, 180.00, 2700.00, '办公室环境美化', 3, '2024-03-10', 1, 'EMP028', '吴三十', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('71b13cc93ce5455f69d25a6eb036a3a1', 'DEPT002', '市场部', '移动硬盘', '存储设备', '希捷2TB USB3.0', '个', 5.00, 580.00, 2900.00, '存储市场资料', 2, '2024-02-12', 5, 'EMP012', '张十四', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('7211c7749b655bfe4eb24a14b4d380bd', 'DEPT005', '行政部', '文件柜', '办公家具', '铁皮柜 180cm四门', '个', 10.00, 1200.00, 12000.00, '档案室文件整理', 2, '2024-02-25', 2, 'EMP021', '李二三', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('7c4ed3300a581fd43b4b3c17c070f4ff', 'DEPT003', '人事部', '打印机', '办公设备', '惠普MFP M436n A3', '台', 2.00, 6800.00, 13600.00, '人事档案打印', 2, '2024-02-16', 4, 'EMP016', '黄十八', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('7c81f3eaccfdf009318a7d94929e7001', 'DEPT001', '技术部', '服务器', '网络设备', '戴尔R740 32核/128G', '台', 2.00, 45000.00, 90000.00, '机房服务器升级', 1, '2024-02-05', 4, 'EMP009', '郑十一', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('8644bf21a13787299ca04b690b24a34f', 'DEPT001', '技术部', '测试手机', '测试设备', '小米14 Pro 16+512', '台', 5.00, 5500.00, 27500.00, 'APP兼容性测试', 2, '2024-03-15', 1, 'EMP025', '杨二七', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('89e0359f0fd8b35c6b709c26785ba31d', 'DEPT003', '人事部', '办公电话', '通讯设备', '西门子数字电话机', '部', 12.00, 450.00, 5400.00, '新工位电话安装', 2, '2024-02-20', 5, 'EMP023', '刘二五', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('a882757bc3c4ae25c9fd9a2c4636e613', 'DEPT005', '行政部', 'A4打印纸', '办公耗材', 'Double A 80g', '箱', 20.00, 180.00, 3600.00, '日常办公使用', 2, '2024-02-15', 5, 'EMP007', '周九', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('ab65a0b5be83e4296276c8b1d1ef9b9f', 'DEPT002', '市场部', '投影仪', '办公设备', '明基W1120 1080P', '台', 2.00, 5500.00, 11000.00, '会议室演示使用', 3, '2024-03-15', 1, 'EMP002', '李四', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('b1bda49973d38e1b336147bac105fcc5', 'DEPT006', '研发部', '编程书籍', '图书资料', '《代码大全》《设计模式》', '套', 15.00, 200.00, 3000.00, '技术团队学习资料', 3, '2024-03-20', 1, 'EMP010', '王十二', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('c1e34552b028604532f516e3e39b737b', 'DEPT002', '市场部', '数码相机', '电子设备', '索尼A7M4 24-70mm', '台', 1.00, 18500.00, 18500.00, '市场活动拍摄', 2, '2024-03-10', 2, 'EMP006', '孙八', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('c6a8e163ddcc0748130cd19f0f83e711', 'DEPT001', '技术部', '笔记本电脑', '电子设备', 'ThinkPad X1, i7/16G/512G', '台', 5.00, 12000.00, 60000.00, '新员工入职配备', 2, '2024-02-20', 1, 'EMP001', '张三', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('c7df2ba6b5a457e3fe92a71d7a757059', 'DEPT002', '市场部', '易拉宝', '宣传物料', '80*200cm 可折叠', '个', 8.00, 150.00, 1200.00, '展会宣传使用', 1, '2024-02-14', 2, 'EMP024', '陈二六', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('c993fb066b66953b2ef8557a8b2268a3', 'DEPT002', '市场部', '视频会议设备', '音视频设备', '罗技CC5000e 4K', '套', 2.00, 12800.00, 25600.00, '远程客户会议', 2, '2024-02-22', 4, 'EMP029', '郑三一', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('da02836655c21f0a48efa11018832a96', 'DEPT007', '产品部', '录音笔', '电子设备', '索尼ICD-UX575F 16GB', '支', 3.00, 950.00, 2850.00, '用户访谈录音', 2, '2024-03-02', 4, 'EMP022', '张二四', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('dd6b1ada1d6806ada7522f07e655a325', 'DEPT002', '市场部', '礼品套装', '市场物料', '企业定制商务套装', '套', 50.00, 280.00, 14000.00, '客户拜访礼品', 2, '2024-03-08', 2, 'EMP018', '吴二十', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('e12c4b5afe66781418e9aa71582a5897', 'DEPT003', '人事部', '指纹考勤机', '办公设备', '中控X8 人脸识别', '台', 3.00, 2800.00, 8400.00, '更换旧考勤设备', 2, '2024-02-18', 3, 'EMP008', '吴十', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('f55887cc59e5c6ccd426250943abbb0e', 'DEPT001', '技术部', '机械键盘', '电脑配件', '樱桃MX3.0 青轴', '个', 10.00, 450.00, 4500.00, '开发人员更换键盘', 1, '2024-02-10', 4, 'EMP004', '赵六', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('f94e6b6c56c3ffc77539ea8ad7510755', 'DEPT007', '产品部', '白板', '办公设备', '磁性白板 120*90cm', '块', 6.00, 350.00, 2100.00, '产品讨论会议使用', 3, '2024-03-18', 1, 'EMP015', '杨十七', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);
INSERT INTO `by_purchase_list` VALUES ('fba10939f8e3b7bbb482a0fd8cd6ae1a', 'DEPT001', '技术部', '办公软件', '软件许可', 'Office 365 商业版', '套', 25.00, 380.00, 9500.00, '新员工软件授权', 2, '2024-03-05', 5, 'EMP030', '王三二', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-11 11:46:38', '2026-02-11 11:46:38', 0);

-- ----------------------------
-- Table structure for by_role
-- ----------------------------
DROP TABLE IF EXISTS `by_role`;
CREATE TABLE `by_role`  (
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色ID，UUID去掉横杠的32位字符串',
  `role_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色编码，唯一标识，用于权限控制',
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称，显示用',
  `role_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色描述，详细说明角色权限范围',
  `parent_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '父角色ID，用于构建角色树，0表示根角色',
  `role_level` int NULL DEFAULT 1 COMMENT '角色层级，根角色为1，每增加一层加1',
  `is_inherit` tinyint NULL DEFAULT 1 COMMENT '是否继承父角色权限：1-继承，0-不继承',
  `sort` int NULL DEFAULT 0 COMMENT '排序号，数字越小越靠前',
  `status` tinyint NULL DEFAULT 1 COMMENT '角色状态：1-启用，0-禁用',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `role_code`(`role_code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统角色信息表（支持父子层级结构）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of by_role
-- ----------------------------
INSERT INTO `by_role` VALUES ('6ba7b8309dad11d180b400c04fd430c8', 'ROOT', '系统根角色', '系统最高级角色，所有角色的祖先', '0', 1, 1, 1, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b8319dad11d180b400c04fd430c8', 'SUPER_ADMIN', '超级管理员', '系统最高权限管理员，拥有所有权限', '6ba7b8309dad11d180b400c04fd430c8', 2, 1, 10, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b8329dad11d180b400c04fd430c8', 'SYS_ADMIN', '系统管理员', '负责系统日常管理和维护', '6ba7b8309dad11d180b400c04fd430c8', 2, 1, 20, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b8339dad11d180b400c04fd430c8', 'IT_DIRECTOR', 'IT总监', '信息技术部门总监，负责IT部门管理', '6ba7b8319dad11d180b400c04fd430c8', 3, 1, 30, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b8349dad11d180b400c04fd430c8', 'HR_DIRECTOR', '人力资源总监', '人力资源部门总监，负责人力资源管理', '6ba7b8319dad11d180b400c04fd430c8', 3, 1, 40, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b8359dad11d180b400c04fd430c8', 'FINANCE_DIRECTOR', '财务总监', '财务管理部门总监，负责财务管理', '6ba7b8319dad11d180b400c04fd430c8', 3, 1, 50, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b8369dad11d180b400c04fd430c8', 'IT_MANAGER', 'IT经理', '信息技术部门经理，负责IT团队管理', '6ba7b8339dad11d180b400c04fd430c8', 4, 1, 60, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b8379dad11d180b400c04fd430c8', 'HR_MANAGER', '人力资源经理', '人力资源部门经理，负责日常人力资源管理', '6ba7b8349dad11d180b400c04fd430c8', 4, 1, 70, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b8389dad11d180b400c04fd430c8', 'FINANCE_MANAGER', '财务经理', '财务部门经理，负责日常财务管理', '6ba7b8359dad11d180b400c04fd430c8', 4, 1, 80, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b8399dad11d180b400c04fd430c8', 'DEV_MANAGER', '开发经理', '软件开发团队负责人，负责开发团队管理', '6ba7b8369dad11d180b400c04fd430c8', 5, 1, 90, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b83a9dad11d180b400c04fd430c8', 'TEST_MANAGER', '测试经理', '软件测试团队负责人，负责测试团队管理', '6ba7b8369dad11d180b400c04fd430c8', 5, 1, 100, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b83b9dad11d180b400c04fd430c8', 'RECRUIT_MANAGER', '招聘经理', '招聘团队负责人，负责招聘管理', '6ba7b8379dad11d180b400c04fd430c8', 5, 1, 110, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b83c9dad11d180b400c04fd430c8', 'SENIOR_DEV', '高级开发工程师', '高级软件开发工程师', '6ba7b8399dad11d180b400c04fd430c8', 6, 1, 120, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b83d9dad11d180b400c04fd430c8', 'JUNIOR_DEV', '初级开发工程师', '初级软件开发工程师', '6ba7b8399dad11d180b400c04fd430c8', 6, 1, 130, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b83e9dad11d180b400c04fd430c8', 'SENIOR_TESTER', '高级测试工程师', '高级软件测试工程师', '6ba7b83a9dad11d180b400c04fd430c8', 6, 1, 140, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b83f9dad11d180b400c04fd430c8', 'JUNIOR_TESTER', '初级测试工程师', '初级软件测试工程师', '6ba7b83a9dad11d180b400c04fd430c8', 6, 1, 150, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b8409dad11d180b400c04fd430c8', 'RECRUIT_SPECIALIST', '招聘专员', '负责招聘工作的专员', '6ba7b83b9dad11d180b400c04fd430c8', 6, 1, 160, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b8419dad11d180b400c04fd430c8', 'SALES_DIRECTOR', '销售总监', '销售部门总监，负责销售管理', '6ba7b8309dad11d180b400c04fd430c8', 2, 1, 200, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b8429dad11d180b400c04fd430c8', 'MARKETING_DIRECTOR', '市场总监', '市场部门总监，负责市场管理', '6ba7b8309dad11d180b400c04fd430c8', 2, 1, 210, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b8439dad11d180b400c04fd430c8', 'SALES_MANAGER', '销售经理', '销售团队经理，负责销售团队管理', '6ba7b8419dad11d180b400c04fd430c8', 3, 1, 220, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b8449dad11d180b400c04fd430c8', 'REGION_MANAGER', '区域经理', '负责特定区域销售管理', '6ba7b8419dad11d180b400c04fd430c8', 3, 1, 230, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b8459dad11d180b400c04fd430c8', 'SENIOR_SALES', '高级销售专员', '高级销售专员，负责大客户销售', '6ba7b8439dad11d180b400c04fd430c8', 4, 1, 240, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b8469dad11d180b400c04fd430c8', 'JUNIOR_SALES', '初级销售专员', '初级销售专员，负责基础销售工作', '6ba7b8439dad11d180b400c04fd430c8', 4, 1, 250, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b8479dad11d180b400c04fd430c8', 'SUPPORT_DIRECTOR', '支持总监', '技术支持部门总监', '6ba7b8309dad11d180b400c04fd430c8', 2, 1, 300, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b8489dad11d180b400c04fd430c8', 'CUSTOMER_SERVICE_DIRECTOR', '客服总监', '客户服务部门总监', '6ba7b8309dad11d180b400c04fd430c8', 2, 1, 310, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b8499dad11d180b400c04fd430c8', 'TECH_SUPPORT_MANAGER', '技术支持经理', '技术支持团队经理', '6ba7b8479dad11d180b400c04fd430c8', 3, 1, 320, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b84a9dad11d180b400c04fd430c8', 'CUSTOMER_SERVICE_MANAGER', '客服经理', '客户服务团队经理', '6ba7b8489dad11d180b400c04fd430c8', 3, 1, 330, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b84b9dad11d180b400c04fd430c8', 'TECH_SUPPORT_SPECIALIST', '技术支持专员', '提供技术支持服务的专员', '6ba7b8499dad11d180b400c04fd430c8', 4, 1, 340, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b84c9dad11d180b400c04fd430c8', 'CUSTOMER_SERVICE_SPECIALIST', '客服专员', '提供客户服务的专员', '6ba7b84a9dad11d180b400c04fd430c8', 4, 1, 350, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b84d9dad11d180b400c04fd430c8', 'INTERN', '实习生', '系统实习生角色', '6ba7b84c9dad11d180b400c04fd430c8', 5, 0, 400, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('6ba7b84e9dad11d180b400c04fd430c8', 'GUEST', '访客', '系统访客角色，只读权限', '0', 1, 0, 500, 1, '2026-01-30 09:34:12', '2026-01-30 09:34:12');
INSERT INTO `by_role` VALUES ('cd156811453e41348e1f8f23bb805b6c', '6666', '777', '6666', '6ba7b84e9dad11d180b400c04fd430c8', 2, 1, 0, 0, '2026-01-30 15:22:49', '2026-01-30 15:23:14');

-- ----------------------------
-- Table structure for by_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `by_role_permission`;
CREATE TABLE `by_role_permission`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '关联ID，UUID去掉横杠的32位字符串',
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色ID，关联by_role表',
  `permission_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限ID，关联by_permission表',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '关联创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_role_permission`(`role_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `permission_id`(`permission_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和权限关联关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of by_role_permission
-- ----------------------------
INSERT INTO `by_role_permission` VALUES ('6ba7b88a9dad11d180b400c04fd430c8', '6ba7b8309dad11d180b400c04fd430c8', '6ba7b84e9dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b88b9dad11d180b400c04fd430c8', '6ba7b8309dad11d180b400c04fd430c8', '6ba7b84f9dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b88c9dad11d180b400c04fd430c8', '6ba7b8309dad11d180b400c04fd430c8', '6ba7b8509dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b88d9dad11d180b400c04fd430c8', '6ba7b8309dad11d180b400c04fd430c8', '6ba7b8519dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b88e9dad11d180b400c04fd430c8', '6ba7b8309dad11d180b400c04fd430c8', '6ba7b8529dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b88f9dad11d180b400c04fd430c8', '6ba7b8309dad11d180b400c04fd430c8', '6ba7b8539dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b8909dad11d180b400c04fd430c8', '6ba7b8319dad11d180b400c04fd430c8', '6ba7b84e9dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b8919dad11d180b400c04fd430c8', '6ba7b8319dad11d180b400c04fd430c8', '6ba7b84f9dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b8929dad11d180b400c04fd430c8', '6ba7b8319dad11d180b400c04fd430c8', '6ba7b8539dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b8939dad11d180b400c04fd430c8', '6ba7b8319dad11d180b400c04fd430c8', '6ba7b8549dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b8949dad11d180b400c04fd430c8', '6ba7b8329dad11d180b400c04fd430c8', '6ba7b8599dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b8959dad11d180b400c04fd430c8', '6ba7b8329dad11d180b400c04fd430c8', '6ba7b85a9dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b8969dad11d180b400c04fd430c8', '6ba7b8329dad11d180b400c04fd430c8', '6ba7b85b9dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b8979dad11d180b400c04fd430c8', '6ba7b8339dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b8989dad11d180b400c04fd430c8', '6ba7b8339dad11d180b400c04fd430c8', '6ba7b8669dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b8999dad11d180b400c04fd430c8', '6ba7b8339dad11d180b400c04fd430c8', '6ba7b8679dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b89a9dad11d180b400c04fd430c8', '6ba7b8339dad11d180b400c04fd430c8', '6ba7b8689dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b89b9dad11d180b400c04fd430c8', '6ba7b8349dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b89c9dad11d180b400c04fd430c8', '6ba7b8349dad11d180b400c04fd430c8', '6ba7b8669dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b89d9dad11d180b400c04fd430c8', '6ba7b8349dad11d180b400c04fd430c8', '6ba7b8679dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b89e9dad11d180b400c04fd430c8', '6ba7b8359dad11d180b400c04fd430c8', '6ba7b84e9dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b89f9dad11d180b400c04fd430c8', '6ba7b8359dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b8a09dad11d180b400c04fd430c8', '6ba7b8369dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b8a19dad11d180b400c04fd430c8', '6ba7b8379dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b8a29dad11d180b400c04fd430c8', '6ba7b8389dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b8a39dad11d180b400c04fd430c8', '6ba7b8399dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b8a49dad11d180b400c04fd430c8', '6ba7b83a9dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b8a59dad11d180b400c04fd430c8', '6ba7b83b9dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b8a69dad11d180b400c04fd430c8', '6ba7b83c9dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');
INSERT INTO `by_role_permission` VALUES ('6ba7b8a79dad11d180b400c04fd430c8', '6ba7b83d9dad11d180b400c04fd430c8', '6ba7b8629dad11d180b400c04fd430c8', '2026-01-29 18:54:28');

-- ----------------------------
-- Table structure for by_tree_dict
-- ----------------------------
DROP TABLE IF EXISTS `by_tree_dict`;
CREATE TABLE `by_tree_dict`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'UUID主键（32位，无横线）',
  `parent_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '父级ID，0表示顶级',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典名称',
  `dict_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字典编码',
  `dict_value` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字典值',
  `dict_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典类型',
  `type_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型名称',
  `level_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '层级路径',
  `tree_level` int NULL DEFAULT 1 COMMENT '层级',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序',
  `has_children` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否有子节点',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '颜色标识',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '状态(0禁用 1启用)',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_dict_type`(`dict_type`(32) ASC) USING BTREE,
  INDEX `idx_dict_code`(`dict_code`(32) ASC) USING BTREE,
  INDEX `idx_level_path`(`level_path`(255) ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业务树形字典表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of by_tree_dict
-- ----------------------------
INSERT INTO `by_tree_dict` VALUES ('c93ed5d013be11f19da92cfda15d723b', '0', '电商业务', 'BIZ_ECOMMERCE', 'ecommerce', 'business_type', '业务类型', 'biz_1', 1, 1, 'Y', 'shopping-cart', '#FF6B6B', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '电商相关业务');
INSERT INTO `by_tree_dict` VALUES ('c93ef82513be11f19da92cfda15d723b', '0', '金融业务', 'BIZ_FINANCE', 'finance', 'business_type', '业务类型', 'biz_2', 1, 2, 'Y', 'bank', '#4ECDC4', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '金融相关业务');
INSERT INTO `by_tree_dict` VALUES ('c93efe8b13be11f19da92cfda15d723b', '0', '教育业务', 'BIZ_EDU', 'education', 'business_type', '业务类型', 'biz_3', 1, 3, 'Y', 'book', '#45B7D1', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '教育相关业务');
INSERT INTO `by_tree_dict` VALUES ('c93f034213be11f19da92cfda15d723b', '0', '医疗业务', 'BIZ_MEDICAL', 'medical', 'business_type', '业务类型', 'biz_4', 1, 4, 'Y', 'hospital', '#96CEB4', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '医疗相关业务');
INSERT INTO `by_tree_dict` VALUES ('c93f0cc513be11f19da92cfda15d723b', '0', '物流业务', 'BIZ_LOGISTICS', 'logistics', 'business_type', '业务类型', 'biz_5', 1, 5, 'Y', 'truck', '#FFEEAD', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '物流相关业务');
INSERT INTO `by_tree_dict` VALUES ('c93f129013be11f19da92cfda15d723b', '0', '餐饮业务', 'BIZ_CATERING', 'catering', 'business_type', '业务类型', 'biz_6', 1, 6, 'Y', 'restaurant', '#D4A5A5', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '餐饮相关业务');
INSERT INTO `by_tree_dict` VALUES ('c93f181e13be11f19da92cfda15d723b', '0', '旅游业务', 'BIZ_TRAVEL', 'travel', 'business_type', '业务类型', 'biz_7', 1, 7, 'Y', 'plane', '#9B59B6', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '旅游相关业务');
INSERT INTO `by_tree_dict` VALUES ('c93f1cfd13be11f19da92cfda15d723b', '0', '房产业务', 'BIZ_ESTATE', 'realestate', 'business_type', '业务类型', 'biz_8', 1, 8, 'Y', 'building', '#3498DB', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '房产相关业务');
INSERT INTO `by_tree_dict` VALUES ('c93f21f313be11f19da92cfda15d723b', '0', '汽车业务', 'BIZ_AUTO', 'automotive', 'business_type', '业务类型', 'biz_9', 1, 9, 'Y', 'car', '#E67E22', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '汽车相关业务');
INSERT INTO `by_tree_dict` VALUES ('c93f26b613be11f19da92cfda15d723b', '0', '能源业务', 'BIZ_ENERGY', 'energy', 'business_type', '业务类型', 'biz_10', 1, 10, 'Y', 'bolt', '#2ECC71', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '能源相关业务');
INSERT INTO `by_tree_dict` VALUES ('c94ef93613be11f19da92cfda15d723b', 'c93ed5d013be11f19da92cfda15d723b', 'B2C电商', 'BIZ_B2C', 'b2c', 'business_type', '业务类型', 'biz_1_11', 2, 1, 'N', 'online-shopping', '#FF6B6B', '1', 'Y', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '企业对消费者');
INSERT INTO `by_tree_dict` VALUES ('c94efb0013be11f19da92cfda15d723b', 'c93ed5d013be11f19da92cfda15d723b', 'B2B电商', 'BIZ_B2B', 'b2b', 'business_type', '业务类型', 'biz_1_12', 2, 2, 'N', 'wholesale', '#FF8E8E', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '企业对企业');
INSERT INTO `by_tree_dict` VALUES ('c94efbf813be11f19da92cfda15d723b', 'c93ed5d013be11f19da92cfda15d723b', 'C2C电商', 'BIZ_C2C', 'c2c', 'business_type', '业务类型', 'biz_1_13', 2, 3, 'N', 'users', '#FFA5A5', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '消费者对消费者');
INSERT INTO `by_tree_dict` VALUES ('c94efcd613be11f19da92cfda15d723b', 'c93ed5d013be11f19da92cfda15d723b', '跨境电商', 'BIZ_CROSS', 'crossborder', 'business_type', '业务类型', 'biz_1_14', 2, 4, 'N', 'globe', '#FFBDBD', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '跨境电子商务');
INSERT INTO `by_tree_dict` VALUES ('c94efe1b13be11f19da92cfda15d723b', 'c93ed5d013be11f19da92cfda15d723b', '社交电商', 'BIZ_SOCIAL', 'social', 'business_type', '业务类型', 'biz_1_15', 2, 5, 'N', 'share', '#FFD6D6', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '社交电子商务');
INSERT INTO `by_tree_dict` VALUES ('c94efefa13be11f19da92cfda15d723b', 'c93ed5d013be11f19da92cfda15d723b', '直播电商', 'BIZ_LIVE', 'live', 'business_type', '业务类型', 'biz_1_16', 2, 6, 'N', 'video', '#FF6B6B', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '直播带货');
INSERT INTO `by_tree_dict` VALUES ('c94effce13be11f19da92cfda15d723b', 'c93ed5d013be11f19da92cfda15d723b', '生鲜电商', 'BIZ_FRESH', 'fresh', 'business_type', '业务类型', 'biz_1_17', 2, 7, 'N', 'carrot', '#FF6B6B', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '生鲜食品电商');
INSERT INTO `by_tree_dict` VALUES ('c94f00a313be11f19da92cfda15d723b', 'c93ed5d013be11f19da92cfda15d723b', '医药电商', 'BIZ_MED', 'medical', 'business_type', '业务类型', 'biz_1_18', 2, 8, 'N', 'pill', '#FF6B6B', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '医药电子商务');
INSERT INTO `by_tree_dict` VALUES ('c94f01a213be11f19da92cfda15d723b', 'c93ed5d013be11f19da92cfda15d723b', '二手电商', 'BIZ_SECOND', 'secondhand', 'business_type', '业务类型', 'biz_1_19', 2, 9, 'N', 'recycle', '#FF6B6B', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '二手商品交易');
INSERT INTO `by_tree_dict` VALUES ('c94f028213be11f19da92cfda15d723b', 'c93ed5d013be11f19da92cfda15d723b', '奢侈品电商', 'BIZ_LUXURY', 'luxury', 'business_type', '业务类型', 'biz_1_20', 2, 10, 'N', 'diamond', '#FF6B6B', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '奢侈品销售');
INSERT INTO `by_tree_dict` VALUES ('c95f1a1913be11f19da92cfda15d723b', 'c93ef82513be11f19da92cfda15d723b', '银行服务', 'BIZ_BANK', 'bank', 'business_type', '业务类型', 'biz_2_21', 2, 1, 'N', 'landmark', '#4ECDC4', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '银行业务');
INSERT INTO `by_tree_dict` VALUES ('c95f1bbb13be11f19da92cfda15d723b', 'c93ef82513be11f19da92cfda15d723b', '保险服务', 'BIZ_INSURANCE', 'insurance', 'business_type', '业务类型', 'biz_2_22', 2, 2, 'N', 'umbrella', '#4ECDC4', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '保险业务');
INSERT INTO `by_tree_dict` VALUES ('c95f1caf13be11f19da92cfda15d723b', 'c93ef82513be11f19da92cfda15d723b', '证券服务', 'BIZ_STOCK', 'stock', 'business_type', '业务类型', 'biz_2_23', 2, 3, 'N', 'trending-up', '#4ECDC4', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '证券业务');
INSERT INTO `by_tree_dict` VALUES ('c95f1d9113be11f19da92cfda15d723b', 'c93ef82513be11f19da92cfda15d723b', '基金理财', 'BIZ_FUND', 'fund', 'business_type', '业务类型', 'biz_2_24', 2, 4, 'N', 'pie-chart', '#4ECDC4', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '基金业务');
INSERT INTO `by_tree_dict` VALUES ('c95f1e6c13be11f19da92cfda15d723b', 'c93ef82513be11f19da92cfda15d723b', '第三方支付', 'BIZ_PAYMENT', 'payment', 'business_type', '业务类型', 'biz_2_25', 2, 5, 'N', 'credit-card', '#4ECDC4', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '支付业务');
INSERT INTO `by_tree_dict` VALUES ('c95f1f4113be11f19da92cfda15d723b', 'c93ef82513be11f19da92cfda15d723b', '消费金融', 'BIZ_CONSUMER', 'consumer', 'business_type', '业务类型', 'biz_2_26', 2, 6, 'N', 'shopping-bag', '#4ECDC4', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '消费金融');
INSERT INTO `by_tree_dict` VALUES ('c95f201513be11f19da92cfda15d723b', 'c93ef82513be11f19da92cfda15d723b', '供应链金融', 'BIZ_SUPPLY', 'supply', 'business_type', '业务类型', 'biz_2_27', 2, 7, 'N', 'link', '#4ECDC4', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '供应链金融');
INSERT INTO `by_tree_dict` VALUES ('c95f20ef13be11f19da92cfda15d723b', 'c93ef82513be11f19da92cfda15d723b', '数字货币', 'BIZ_CRYPTO', 'crypto', 'business_type', '业务类型', 'biz_2_28', 2, 8, 'N', 'bitcoin', '#4ECDC4', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '数字货币');
INSERT INTO `by_tree_dict` VALUES ('c95f21be13be11f19da92cfda15d723b', 'c93ef82513be11f19da92cfda15d723b', '融资租赁', 'BIZ_LEASE', 'lease', 'business_type', '业务类型', 'biz_2_29', 2, 9, 'N', 'truck', '#4ECDC4', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '融资租赁');
INSERT INTO `by_tree_dict` VALUES ('c95f228e13be11f19da92cfda15d723b', 'c93ef82513be11f19da92cfda15d723b', '信托服务', 'BIZ_TRUST', 'trust', 'business_type', '业务类型', 'biz_2_30', 2, 10, 'N', 'shield', '#4ECDC4', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '信托业务');
INSERT INTO `by_tree_dict` VALUES ('c96683ff13be11f19da92cfda15d723b', '0', '线上支付', 'PAY_ONLINE', 'online', 'payment_type', '支付方式', 'pay_31', 1, 1, 'Y', 'wifi', '#3498DB', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '在线支付方式');
INSERT INTO `by_tree_dict` VALUES ('c96a143413be11f19da92cfda15d723b', '0', '线下支付', 'PAY_OFFLINE', 'offline', 'payment_type', '支付方式', 'pay_32', 1, 2, 'Y', 'store', '#E67E22', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '线下支付方式');
INSERT INTO `by_tree_dict` VALUES ('c96a164513be11f19da92cfda15d723b', '0', '预付费', 'PAY_PRE', 'prepaid', 'payment_type', '支付方式', 'pay_33', 1, 3, 'Y', 'credit-card', '#2ECC71', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '预付费方式');
INSERT INTO `by_tree_dict` VALUES ('c96a17db13be11f19da92cfda15d723b', '0', '后付费', 'PAY_POST', 'postpaid', 'payment_type', '支付方式', 'pay_34', 1, 4, 'Y', 'clock', '#9B59B6', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '后付费方式');
INSERT INTO `by_tree_dict` VALUES ('c96a190913be11f19da92cfda15d723b', '0', '分期支付', 'PAY_INSTALL', 'installment', 'payment_type', '支付方式', 'pay_35', 1, 5, 'Y', 'calendar', '#F1C40F', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '分期付款');
INSERT INTO `by_tree_dict` VALUES ('c96a1a2513be11f19da92cfda15d723b', '0', '数字货币', 'PAY_CRYPTO', 'crypto', 'payment_type', '支付方式', 'pay_36', 1, 6, 'Y', 'bitcoin', '#F39C12', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '加密货币支付');
INSERT INTO `by_tree_dict` VALUES ('c96a1b4a13be11f19da92cfda15d723b', '0', '银行转账', 'PAY_TRANSFER', 'transfer', 'payment_type', '支付方式', 'pay_37', 1, 7, 'Y', 'bank', '#16A085', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '银行转账');
INSERT INTO `by_tree_dict` VALUES ('c96a1c5d13be11f19da92cfda15d723b', '0', '支票支付', 'PAY_CHECK', 'check', 'payment_type', '支付方式', 'pay_38', 1, 8, 'Y', 'file-text', '#7F8C8D', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '支票支付');
INSERT INTO `by_tree_dict` VALUES ('c96a1d7613be11f19da92cfda15d723b', '0', '现金支付', 'PAY_CASH', 'cash', 'payment_type', '支付方式', 'pay_39', 1, 9, 'Y', 'dollar-sign', '#27AE60', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '现金支付');
INSERT INTO `by_tree_dict` VALUES ('c96a1e8413be11f19da92cfda15d723b', '0', '积分支付', 'PAY_POINT', 'point', 'payment_type', '支付方式', 'pay_40', 1, 10, 'Y', 'star', '#E74C3C', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '积分支付');
INSERT INTO `by_tree_dict` VALUES ('c976674a13be11f19da92cfda15d723b', 'c96683ff13be11f19da92cfda15d723b', '微信支付', 'PAY_WECHAT', 'wechat', 'payment_type', '支付方式', 'pay_31_41', 2, 1, 'N', 'wechat', '#2DC100', '1', 'Y', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '微信支付');
INSERT INTO `by_tree_dict` VALUES ('c976683c13be11f19da92cfda15d723b', 'c96683ff13be11f19da92cfda15d723b', '支付宝', 'PAY_ALIPAY', 'alipay', 'payment_type', '支付方式', 'pay_31_42', 2, 2, 'N', 'alipay', '#1677FF', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '支付宝支付');
INSERT INTO `by_tree_dict` VALUES ('c97668c713be11f19da92cfda15d723b', 'c96683ff13be11f19da92cfda15d723b', '银联云闪付', 'PAY_UNIONPAY', 'unionpay', 'payment_type', '支付方式', 'pay_31_43', 2, 3, 'N', 'credit-card', '#E60012', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '银联支付');
INSERT INTO `by_tree_dict` VALUES ('c976694113be11f19da92cfda15d723b', 'c96683ff13be11f19da92cfda15d723b', 'Apple Pay', 'PAY_APPLE', 'applepay', 'payment_type', '支付方式', 'pay_31_44', 2, 4, 'N', 'apple', '#000000', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '苹果支付');
INSERT INTO `by_tree_dict` VALUES ('c97669b713be11f19da92cfda15d723b', 'c96683ff13be11f19da92cfda15d723b', '京东支付', 'PAY_JD', 'jdpay', 'payment_type', '支付方式', 'pay_31_45', 2, 5, 'N', 'jd', '#E4393C', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '京东支付');
INSERT INTO `by_tree_dict` VALUES ('c9766a2a13be11f19da92cfda15d723b', 'c96683ff13be11f19da92cfda15d723b', '美团支付', 'PAY_MEITUAN', 'meituan', 'payment_type', '支付方式', 'pay_31_46', 2, 6, 'N', 'food', '#FFC300', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '美团支付');
INSERT INTO `by_tree_dict` VALUES ('c9766a9913be11f19da92cfda15d723b', 'c96683ff13be11f19da92cfda15d723b', '抖音支付', 'PAY_DOUYIN', 'douyin', 'payment_type', '支付方式', 'pay_31_47', 2, 7, 'N', 'music', '#000000', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '抖音支付');
INSERT INTO `by_tree_dict` VALUES ('c9766b0a13be11f19da92cfda15d723b', 'c96683ff13be11f19da92cfda15d723b', '快手支付', 'PAY_KUAISHOU', 'kuaishou', 'payment_type', '支付方式', 'pay_31_48', 2, 8, 'N', 'hand', '#FF6B6B', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '快手支付');
INSERT INTO `by_tree_dict` VALUES ('c9766b7c13be11f19da92cfda15d723b', 'c96683ff13be11f19da92cfda15d723b', '拼多多支付', 'PAY_PDD', 'pinduoduo', 'payment_type', '支付方式', 'pay_31_49', 2, 9, 'N', 'shopping', '#E02F2F', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '拼多多支付');
INSERT INTO `by_tree_dict` VALUES ('c9766beb13be11f19da92cfda15d723b', 'c96683ff13be11f19da92cfda15d723b', '小米支付', 'PAY_XIAOMI', 'xiaomi', 'payment_type', '支付方式', 'pay_31_50', 2, 10, 'N', 'xiaomi', '#FF6900', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '小米支付');
INSERT INTO `by_tree_dict` VALUES ('c9766c7113be11f19da92cfda15d723b', 'c96683ff13be11f19da92cfda15d723b', '华为支付', 'PAY_HUAWEI', 'huawei', 'payment_type', '支付方式', 'pay_31_51', 2, 11, 'N', 'huawei', '#FF3B30', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '华为支付');
INSERT INTO `by_tree_dict` VALUES ('c9766ce313be11f19da92cfda15d723b', 'c96683ff13be11f19da92cfda15d723b', '三星支付', 'PAY_SAMSUNG', 'samsung', 'payment_type', '支付方式', 'pay_31_52', 2, 12, 'N', 'samsung', '#1428A0', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '三星支付');
INSERT INTO `by_tree_dict` VALUES ('c9766e4213be11f19da92cfda15d723b', 'c96683ff13be11f19da92cfda15d723b', '百度钱包', 'PAY_BAIDU', 'baidu', 'payment_type', '支付方式', 'pay_31_53', 2, 13, 'N', 'baidu', '#2932E1', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '百度支付');
INSERT INTO `by_tree_dict` VALUES ('c9766ed613be11f19da92cfda15d723b', 'c96683ff13be11f19da92cfda15d723b', 'QQ钱包', 'PAY_QQ', 'qqwallet', 'payment_type', '支付方式', 'pay_31_54', 2, 14, 'N', 'qq', '#12B7F5', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', 'QQ支付');
INSERT INTO `by_tree_dict` VALUES ('c9766f5a13be11f19da92cfda15d723b', 'c96683ff13be11f19da92cfda15d723b', '网银支付', 'PAY_EBA', 'ebank', 'payment_type', '支付方式', 'pay_31_55', 2, 15, 'N', 'globe', '#34495E', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '网上银行支付');
INSERT INTO `by_tree_dict` VALUES ('c9766fe113be11f19da92cfda15d723b', 'c96683ff13be11f19da92cfda15d723b', '快捷支付', 'PAY_QUICK', 'quick', 'payment_type', '支付方式', 'pay_31_56', 2, 16, 'N', 'zap', '#F1C40F', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '快捷支付');
INSERT INTO `by_tree_dict` VALUES ('c976709b13be11f19da92cfda15d723b', 'c96683ff13be11f19da92cfda15d723b', '扫码支付', 'PAY_SCAN', 'scan', 'payment_type', '支付方式', 'pay_31_57', 2, 17, 'N', 'camera', '#1ABC9C', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '扫码支付');
INSERT INTO `by_tree_dict` VALUES ('c976712513be11f19da92cfda15d723b', 'c96683ff13be11f19da92cfda15d723b', '刷脸支付', 'PAY_FACE', 'face', 'payment_type', '支付方式', 'pay_31_58', 2, 18, 'N', 'face-recognition', '#9B59B6', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '刷脸支付');
INSERT INTO `by_tree_dict` VALUES ('c97671db13be11f19da92cfda15d723b', 'c96683ff13be11f19da92cfda15d723b', '声波支付', 'PAY_SOUND', 'sound', 'payment_type', '支付方式', 'pay_31_59', 2, 19, 'N', 'mic', '#E67E22', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '声波支付');
INSERT INTO `by_tree_dict` VALUES ('c976728113be11f19da92cfda15d723b', 'c96683ff13be11f19da92cfda15d723b', '无感支付', 'PAY_SENSELESS', 'senseless', 'payment_type', '支付方式', 'pay_31_60', 2, 20, 'N', 'radio', '#3498DB', '1', 'N', '2026-02-27 17:29:16', '2026-02-27 17:29:16', '无感支付');
INSERT INTO `by_tree_dict` VALUES ('c982b35713be11f19da92cfda15d723b', '0', '待付款', 'ORDER_PENDING', 'pending', 'order_status', '订单状态', 'order_61', 1, 1, 'N', 'clock', '#F39C12', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '等待买家付款');
INSERT INTO `by_tree_dict` VALUES ('c982cbcf13be11f19da92cfda15d723b', '0', '待发货', 'ORDER_SHIPPING', 'toship', 'order_status', '订单状态', 'order_62', 1, 2, 'N', 'package', '#3498DB', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '买家已付款待发货');
INSERT INTO `by_tree_dict` VALUES ('c982cff913be11f19da92cfda15d723b', '0', '待收货', 'ORDER_RECEIVE', 'toreceive', 'order_status', '订单状态', 'order_63', 1, 3, 'N', 'truck', '#2ECC71', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '卖家已发货待收货');
INSERT INTO `by_tree_dict` VALUES ('c982d34613be11f19da92cfda15d723b', '0', '待评价', 'ORDER_REVIEW', 'toreview', 'order_status', '订单状态', 'order_64', 1, 4, 'N', 'star', '#9B59B6', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '待买家评价');
INSERT INTO `by_tree_dict` VALUES ('c982d65e13be11f19da92cfda15d723b', '0', '已完成', 'ORDER_DONE', 'completed', 'order_status', '订单状态', 'order_65', 1, 5, 'N', 'check-circle', '#27AE60', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '订单已完成');
INSERT INTO `by_tree_dict` VALUES ('c982d97013be11f19da92cfda15d723b', '0', '已取消', 'ORDER_CANCEL', 'cancelled', 'order_status', '订单状态', 'order_66', 1, 6, 'N', 'x-circle', '#E74C3C', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '订单已取消');
INSERT INTO `by_tree_dict` VALUES ('c982dc5413be11f19da92cfda15d723b', '0', '退款中', 'ORDER_REFUND', 'refunding', 'order_status', '订单状态', 'order_67', 1, 7, 'N', 'refresh-cw', '#E67E22', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '退款处理中');
INSERT INTO `by_tree_dict` VALUES ('c982df1313be11f19da92cfda15d723b', '0', '已退款', 'ORDER_REFUNDED', 'refunded', 'order_status', '订单状态', 'order_68', 1, 8, 'N', 'check', '#95A5A6', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '已退款完成');
INSERT INTO `by_tree_dict` VALUES ('c982e1cf13be11f19da92cfda15d723b', '0', '售后中', 'ORDER_AFTERSALE', 'aftersale', 'order_status', '订单状态', 'order_69', 1, 9, 'N', 'headphones', '#1ABC9C', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '售后处理中');
INSERT INTO `by_tree_dict` VALUES ('c982e48813be11f19da92cfda15d723b', '0', '交易关闭', 'ORDER_CLOSED', 'closed', 'order_status', '订单状态', 'order_70', 1, 10, 'N', 'lock', '#7F8C8D', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '交易已关闭');
INSERT INTO `by_tree_dict` VALUES ('c982e73f13be11f19da92cfda15d723b', '0', '部分发货', 'ORDER_PARTIAL', 'partial', 'order_status', '订单状态', 'order_71', 1, 11, 'N', 'truck', '#3498DB', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '部分商品已发货');
INSERT INTO `by_tree_dict` VALUES ('c982e9f413be11f19da92cfda15d723b', '0', '部分退款', 'ORDER_PARTIAL_REFUND', 'partial_refund', 'order_status', '订单状态', 'order_72', 1, 12, 'N', 'corner-up-left', '#E67E22', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '部分商品退款');
INSERT INTO `by_tree_dict` VALUES ('c982ecd813be11f19da92cfda15d723b', '0', '已签收', 'ORDER_SIGNED', 'signed', 'order_status', '订单状态', 'order_73', 1, 13, 'N', 'check-square', '#27AE60', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '买家已签收');
INSERT INTO `by_tree_dict` VALUES ('c982efa013be11f19da92cfda15d723b', '0', '拒收', 'ORDER_REJECTED', 'rejected', 'order_status', '订单状态', 'order_74', 1, 14, 'N', 'thumbs-down', '#E74C3C', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '买家拒收');
INSERT INTO `by_tree_dict` VALUES ('c982f29713be11f19da92cfda15d723b', '0', '超时关闭', 'ORDER_TIMEOUT', 'timeout', 'order_status', '订单状态', 'order_75', 1, 15, 'N', 'clock', '#95A5A6', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '超时未支付关闭');
INSERT INTO `by_tree_dict` VALUES ('c982f55613be11f19da92cfda15d723b', '0', '风险管控', 'ORDER_RISK', 'risk', 'order_status', '订单状态', 'order_76', 1, 16, 'N', 'shield-off', '#E74C3C', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '风控拦截');
INSERT INTO `by_tree_dict` VALUES ('c982f80013be11f19da92cfda15d723b', '0', '待核销', 'ORDER_VERIFY', 'verify', 'order_status', '订单状态', 'order_77', 1, 17, 'N', 'qr-code', '#9B59B6', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '待线下核销');
INSERT INTO `by_tree_dict` VALUES ('c982fabc13be11f19da92cfda15d723b', '0', '已核销', 'ORDER_VERIFIED', 'verified', 'order_status', '订单状态', 'order_78', 1, 18, 'N', 'check-circle', '#27AE60', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '已线下核销');
INSERT INTO `by_tree_dict` VALUES ('c982fd9313be11f19da92cfda15d723b', '0', '配送中', 'ORDER_DELIVERING', 'delivering', 'order_status', '订单状态', 'order_79', 1, 19, 'N', 'truck', '#3498DB', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '商品配送中');
INSERT INTO `by_tree_dict` VALUES ('c987646e13be11f19da92cfda15d723b', '0', '揽件中', 'ORDER_PICKING', 'picking', 'order_status', '订单状态', 'order_80', 1, 20, 'N', 'package', '#F39C12', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '快递员揽件中');
INSERT INTO `by_tree_dict` VALUES ('c9876b0b13be11f19da92cfda15d723b', '0', '异常件', 'ORDER_ABNORMAL', 'abnormal', 'order_status', '订单状态', 'order_81', 1, 21, 'N', 'alert-triangle', '#E74C3C', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '异常订单');
INSERT INTO `by_tree_dict` VALUES ('c987706d13be11f19da92cfda15d723b', '0', '补发中', 'ORDER_RESEND', 'resend', 'order_status', '订单状态', 'order_82', 1, 22, 'N', 'rotate-cw', '#E67E22', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '商品补发中');
INSERT INTO `by_tree_dict` VALUES ('c987741d13be11f19da92cfda15d723b', '0', '换货中', 'ORDER_EXCHANGE', 'exchange', 'order_status', '订单状态', 'order_83', 1, 23, 'N', 'repeat', '#9B59B6', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '换货处理中');
INSERT INTO `by_tree_dict` VALUES ('c987778913be11f19da92cfda15d723b', '0', '退货中', 'ORDER_RETURN', 'return', 'order_status', '订单状态', 'order_84', 1, 24, 'N', 'corner-up-left', '#E67E22', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '退货处理中');
INSERT INTO `by_tree_dict` VALUES ('c9877ae013be11f19da92cfda15d723b', '0', '已删除', 'ORDER_DELETED', 'deleted', 'order_status', '订单状态', 'order_85', 1, 25, 'N', 'trash', '#7F8C8D', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '订单已删除');
INSERT INTO `by_tree_dict` VALUES ('c9877e4713be11f19da92cfda15d723b', '0', '归档', 'ORDER_ARCHIVED', 'archived', 'order_status', '订单状态', 'order_86', 1, 26, 'N', 'archive', '#34495E', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '订单已归档');
INSERT INTO `by_tree_dict` VALUES ('c987818d13be11f19da92cfda15d723b', '0', '待确认', 'ORDER_CONFIRM', 'confirm', 'order_status', '订单状态', 'order_87', 1, 27, 'N', 'help-circle', '#F39C12', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '待买家确认');
INSERT INTO `by_tree_dict` VALUES ('c987850f13be11f19da92cfda15d723b', '0', '待分配', 'ORDER_ASSIGN', 'assign', 'order_status', '订单状态', 'order_88', 1, 28, 'N', 'user-plus', '#3498DB', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '待分配商家');
INSERT INTO `by_tree_dict` VALUES ('c987885913be11f19da92cfda15d723b', '0', '待接单', 'ORDER_ACCEPT', 'accept', 'order_status', '订单状态', 'order_89', 1, 29, 'N', 'phone', '#2ECC71', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '待商家接单');
INSERT INTO `by_tree_dict` VALUES ('c9878b8013be11f19da92cfda15d723b', '0', '制作中', 'ORDER_PREPARING', 'preparing', 'order_status', '订单状态', 'order_90', 1, 30, 'N', 'coffee', '#9B59B6', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '商品制作中');
INSERT INTO `by_tree_dict` VALUES ('c991e61313be11f19da92cfda15d723b', '0', '超级管理员', 'ROLE_SUPER', 'superadmin', 'user_role', '用户角色', 'role_91', 1, 1, 'N', 'crown', '#F1C40F', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '系统超级管理员');
INSERT INTO `by_tree_dict` VALUES ('c9930a1213be11f19da92cfda15d723b', '0', '系统管理员', 'ROLE_ADMIN', 'admin', 'user_role', '用户角色', 'role_92', 1, 2, 'N', 'shield', '#E74C3C', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '系统管理员');
INSERT INTO `by_tree_dict` VALUES ('c99311de13be11f19da92cfda15d723b', '0', '运营人员', 'ROLE_OPER', 'operator', 'user_role', '用户角色', 'role_93', 1, 3, 'N', 'settings', '#3498DB', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '运营人员');
INSERT INTO `by_tree_dict` VALUES ('c993180413be11f19da92cfda15d723b', '0', '财务人员', 'ROLE_FINANCE', 'finance', 'user_role', '用户角色', 'role_94', 1, 4, 'N', 'dollar-sign', '#2ECC71', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '财务人员');
INSERT INTO `by_tree_dict` VALUES ('c9931dfa13be11f19da92cfda15d723b', '0', '客服人员', 'ROLE_SERVICE', 'service', 'user_role', '用户角色', 'role_95', 1, 5, 'N', 'message-circle', '#9B59B6', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '客服人员');
INSERT INTO `by_tree_dict` VALUES ('c993240013be11f19da92cfda15d723b', '0', '普通用户', 'ROLE_USER', 'user', 'user_role', '用户角色', 'role_96', 1, 6, 'N', 'user', '#95A5A6', '1', 'Y', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '普通注册用户');
INSERT INTO `by_tree_dict` VALUES ('c993294213be11f19da92cfda15d723b', '0', 'VIP会员', 'ROLE_VIP', 'vip', 'user_role', '用户角色', 'role_97', 1, 7, 'N', 'star', '#F39C12', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', 'VIP会员');
INSERT INTO `by_tree_dict` VALUES ('c9932ed113be11f19da92cfda15d723b', '0', '企业用户', 'ROLE_ENTERPRISE', 'enterprise', 'user_role', '用户角色', 'role_98', 1, 8, 'N', 'briefcase', '#16A085', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '企业认证用户');
INSERT INTO `by_tree_dict` VALUES ('c993344013be11f19da92cfda15d723b', '0', '商家用户', 'ROLE_MERCHANT', 'merchant', 'user_role', '用户角色', 'role_99', 1, 9, 'N', 'shopping-bag', '#E67E22', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '商家用户');
INSERT INTO `by_tree_dict` VALUES ('c99339e913be11f19da92cfda15d723b', '0', '测试账号', 'ROLE_TEST', 'test', 'user_role', '用户角色', 'role_100', 1, 10, 'N', 'bug', '#7F8C8D', '0', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '测试专用账号');
INSERT INTO `by_tree_dict` VALUES ('c9933f5613be11f19da92cfda15d723b', '0', '开发人员', 'ROLE_DEV', 'developer', 'user_role', '用户角色', 'role_101', 1, 11, 'N', 'code', '#3498DB', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '开发人员');
INSERT INTO `by_tree_dict` VALUES ('c993447b13be11f19da92cfda15d723b', '0', '产品经理', 'ROLE_PM', 'pm', 'user_role', '用户角色', 'role_102', 1, 12, 'N', 'layout', '#9B59B6', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '产品经理');
INSERT INTO `by_tree_dict` VALUES ('c9934a9c13be11f19da92cfda15d723b', '0', '设计师', 'ROLE_DESIGN', 'designer', 'user_role', '用户角色', 'role_103', 1, 13, 'N', 'pen-tool', '#E67E22', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', 'UI设计师');
INSERT INTO `by_tree_dict` VALUES ('c993504613be11f19da92cfda15d723b', '0', '前端开发', 'ROLE_FRONTEND', 'frontend', 'user_role', '用户角色', 'role_104', 1, 14, 'N', 'globe', '#3498DB', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '前端开发工程师');
INSERT INTO `by_tree_dict` VALUES ('c993563913be11f19da92cfda15d723b', '0', '后端开发', 'ROLE_BACKEND', 'backend', 'user_role', '用户角色', 'role_105', 1, 15, 'N', 'server', '#2ECC71', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '后端开发工程师');
INSERT INTO `by_tree_dict` VALUES ('c9935b7713be11f19da92cfda15d723b', '0', 'DBA', 'ROLE_DBA', 'dba', 'user_role', '用户角色', 'role_106', 1, 16, 'N', 'database', '#9B59B6', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '数据库管理员');
INSERT INTO `by_tree_dict` VALUES ('c99360e813be11f19da92cfda15d723b', '0', '运维人员', 'ROLE_OPS', 'ops', 'user_role', '用户角色', 'role_107', 1, 17, 'N', 'settings', '#E74C3C', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '运维工程师');
INSERT INTO `by_tree_dict` VALUES ('c993667213be11f19da92cfda15d723b', '0', '测试人员', 'ROLE_QA', 'qa', 'user_role', '用户角色', 'role_108', 1, 18, 'N', 'check-circle', '#F39C12', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '测试工程师');
INSERT INTO `by_tree_dict` VALUES ('c9936bce13be11f19da92cfda15d723b', '0', '项目经理', 'ROLE_PM', 'project_manager', 'user_role', '用户角色', 'role_109', 1, 19, 'N', 'briefcase', '#16A085', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '项目经理');
INSERT INTO `by_tree_dict` VALUES ('c99371a513be11f19da92cfda15d723b', '0', '部门经理', 'ROLE_DEPT_MGR', 'dept_manager', 'user_role', '用户角色', 'role_110', 1, 20, 'N', 'users', '#34495E', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '部门经理');
INSERT INTO `by_tree_dict` VALUES ('c99376fe13be11f19da92cfda15d723b', '0', '总经理', 'ROLE_GM', 'gm', 'user_role', '用户角色', 'role_111', 1, 21, 'N', 'award', '#F1C40F', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '总经理');
INSERT INTO `by_tree_dict` VALUES ('c9937c3013be11f19da92cfda15d723b', '0', '董事长', 'ROLE_CHAIRMAN', 'chairman', 'user_role', '用户角色', 'role_112', 1, 22, 'N', 'crown', '#F39C12', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '董事长');
INSERT INTO `by_tree_dict` VALUES ('c99381c413be11f19da92cfda15d723b', '0', '实习生', 'ROLE_INTERN', 'intern', 'user_role', '用户角色', 'role_113', 1, 23, 'N', 'user', '#95A5A6', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '实习人员');
INSERT INTO `by_tree_dict` VALUES ('c99387cf13be11f19da92cfda15d723b', '0', '顾问', 'ROLE_CONSULTANT', 'consultant', 'user_role', '用户角色', 'role_114', 1, 24, 'N', 'message-circle', '#9B59B6', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '顾问');
INSERT INTO `by_tree_dict` VALUES ('c9938d8313be11f19da92cfda15d723b', '0', '合作伙伴', 'ROLE_PARTNER', 'partner', 'user_role', '用户角色', 'role_115', 1, 25, 'N', 'handshake', '#2ECC71', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '合作伙伴');
INSERT INTO `by_tree_dict` VALUES ('c99392fa13be11f19da92cfda15d723b', '0', '供应商', 'ROLE_SUPPLIER', 'supplier', 'user_role', '用户角色', 'role_116', 1, 26, 'N', 'truck', '#E67E22', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '供应商');
INSERT INTO `by_tree_dict` VALUES ('c993988b13be11f19da92cfda15d723b', '0', '渠道商', 'ROLE_CHANNEL', 'channel', 'user_role', '用户角色', 'role_117', 1, 27, 'N', 'share', '#3498DB', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '渠道商');
INSERT INTO `by_tree_dict` VALUES ('c9939e1913be11f19da92cfda15d723b', '0', '代理商', 'ROLE_AGENT', 'agent', 'user_role', '用户角色', 'role_118', 1, 28, 'N', 'briefcase', '#9B59B6', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '代理商');
INSERT INTO `by_tree_dict` VALUES ('c993a39b13be11f19da92cfda15d723b', '0', 'VIP客户', 'ROLE_VIP_CUSTOMER', 'vip_customer', 'user_role', '用户角色', 'role_119', 1, 29, 'N', 'star', '#F1C40F', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', 'VIP客户');
INSERT INTO `by_tree_dict` VALUES ('c993a96813be11f19da92cfda15d723b', '0', '普通客户', 'ROLE_CUSTOMER', 'customer', 'user_role', '用户角色', 'role_120', 1, 30, 'N', 'user', '#95A5A6', '1', 'N', '2026-02-27 17:29:17', '2026-02-27 17:29:17', '普通客户');

-- ----------------------------
-- Table structure for by_user
-- ----------------------------
DROP TABLE IF EXISTS `by_user`;
CREATE TABLE `by_user`  (
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID，UUID去掉横杠的32位字符串',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名，唯一标识，用于登录',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码，MD5加密存储',
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号码',
  `status` tinyint NULL DEFAULT 1 COMMENT '用户状态：1-正常，0-禁用，2-锁定',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户基本信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of by_user
-- ----------------------------
INSERT INTO `by_user` VALUES ('2016841866925920258', '1111111', 'bae5e3208a3c700e3db642b6631e95b9', '33333333', '', '', 0, '2026-01-29 19:52:26', '2026-01-29 20:19:53');
INSERT INTO `by_user` VALUES ('4e3d0bb8131e496f85ab61dd072f256b', 'by', 'e10adc3949ba59abbe56e057f20f883e', 'by1', '13460122689@163.com', '13460122689', 1, '2026-01-29 20:00:06', '2026-01-29 20:04:16');
INSERT INTO `by_user` VALUES ('6ba7b8109dad11d180b400c04fd430c8', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', 'admin@example.com', '13800138000', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b8119dad11d180b400c04fd430c8', 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '张三', 'zhangsan@example.com', '13800138001', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b8129dad11d180b400c04fd430c8', 'lisi', 'e10adc3949ba59abbe56e057f20f883e', '李四', 'lisi@example.com', '13800138002', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b8139dad11d180b400c04fd430c8', 'wangwu', 'e10adc3949ba59abbe56e057f20f883e', '王五', 'wangwu@example.com', '13800138003', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b8149dad11d180b400c04fd430c8', 'zhaoliu', 'e10adc3949ba59abbe56e057f20f883e', '赵六', 'zhaoliu@example.com', '13800138004', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b8159dad11d180b400c04fd430c8', 'qianqi', 'e10adc3949ba59abbe56e057f20f883e', '钱七', 'qianqi@example.com', '13800138005', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b8169dad11d180b400c04fd430c8', 'sunba', 'e10adc3949ba59abbe56e057f20f883e', '孙八', 'sunba@example.com', '13800138006', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b8179dad11d180b400c04fd430c8', 'zhoujiu', 'e10adc3949ba59abbe56e057f20f883e', '周九', 'zhoujiu@example.com', '13800138007', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b8189dad11d180b400c04fd430c8', 'wuwei', 'e10adc3949ba59abbe56e057f20f883e', '吴伟', 'wuwei@example.com', '13800138008', 0, '2026-01-29 18:53:40', '2026-01-30 17:01:14');
INSERT INTO `by_user` VALUES ('6ba7b8199dad11d180b400c04fd430c8', 'zhengyi', 'e10adc3949ba59abbe56e057f20f883e', '郑义', 'zhengyi@example.com', '13800138009', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b81a9dad11d180b400c04fd430c8', 'wangfang', 'e10adc3949ba59abbe56e057f20f883e', '王芳', 'wangfang@example.com', '13800138010', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b81b9dad11d180b400c04fd430c8', 'lina', 'e10adc3949ba59abbe56e057f20f883e', '李娜', 'lina@example.com', '13800138011', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b81c9dad11d180b400c04fd430c8', 'zhangwei', 'e10adc3949ba59abbe56e057f20f883e', '张伟', 'zhangwei@example.com', '13800138012', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b81d9dad11d180b400c04fd430c8', 'lihua', 'e10adc3949ba59abbe56e057f20f883e', '李华', 'lihua@example.com', '13800138013', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b81e9dad11d180b400c04fd430c8', 'wangli', 'e10adc3949ba59abbe56e057f20f883e', '王丽', 'wangli@example.com', '13800138014', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b81f9dad11d180b400c04fd430c8', 'chenjun', 'e10adc3949ba59abbe56e057f20f883e', '陈军', 'chenjun@example.com', '13800138015', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b8209dad11d180b400c04fd430c8', 'zhoumin', 'e10adc3949ba59abbe56e057f20f883e', '周敏', 'zhoumin@example.com', '13800138016', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b8219dad11d180b400c04fd430c8', 'wuyong', 'e10adc3949ba59abbe56e057f20f883e', '吴勇', 'wuyong@example.com', '13800138017', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b8229dad11d180b400c04fd430c8', 'zhengqiang', 'e10adc3949ba59abbe56e057f20f883e', '郑强', 'zhengqiang@example.com', '13800138018', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b8239dad11d180b400c04fd430c8', 'wangqiang', 'e10adc3949ba59abbe56e057f20f883e', '王强', 'wangqiang@example.com', '13800138019', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b8249dad11d180b400c04fd430c8', 'liuxin', 'e10adc3949ba59abbe56e057f20f883e', '刘鑫', 'liuxin@example.com', '13800138020', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b8259dad11d180b400c04fd430c8', 'chenxin', 'e10adc3949ba59abbe56e057f20f883e', '陈欣', 'chenxin@example.com', '13800138021', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b8269dad11d180b400c04fd430c8', 'zhouxin', 'e10adc3949ba59abbe56e057f20f883e', '周欣', 'zhouxin@example.com', '13800138022', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b8279dad11d180b400c04fd430c8', 'wuxin', 'e10adc3949ba59abbe56e057f20f883e', '吴欣', 'wuxin@example.com', '13800138023', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b8289dad11d180b400c04fd430c8', 'zhengxin', 'e10adc3949ba59abbe56e057f20f883e', '郑欣', 'zhengxin@example.com', '13800138024', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b8299dad11d180b400c04fd430c8', 'wangxin', 'e10adc3949ba59abbe56e057f20f883e', '王欣', 'wangxin@example.com', '13800138025', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b82a9dad11d180b400c04fd430c8', 'liumei', 'e10adc3949ba59abbe56e057f20f883e', '刘梅', 'liumei@example.com', '13800138026', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b82b9dad11d180b400c04fd430c8', 'chenmei', 'e10adc3949ba59abbe56e057f20f883e', '陈梅', 'chenmei@example.com', '13800138027', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b82c9dad11d180b400c04fd430c8', 'zhoumei', 'e10adc3949ba59abbe56e057f20f883e', '周梅', 'zhoumei@example.com', '13800138028', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('6ba7b82d9dad11d180b400c04fd430c8', 'wumei', 'e10adc3949ba59abbe56e057f20f883e', '吴梅', 'wumei@example.com', '13800138029', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
INSERT INTO `by_user` VALUES ('b62e8d3c8d1445ec8c6737d9d82c3f62', '11111112', 'bae5e3208a3c700e3db642b6631e95b9', '333333332', '', '', 1, '2026-01-29 19:54:37', '2026-01-29 19:54:37');

-- ----------------------------
-- Table structure for by_user_role
-- ----------------------------
DROP TABLE IF EXISTS `by_user_role`;
CREATE TABLE `by_user_role`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '关联ID，UUID去掉横杠的32位字符串',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID，关联by_user表',
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色ID，关联by_role表',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '关联创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_role`(`user_id` ASC, `role_id` ASC) USING BTREE,
  INDEX `role_id`(`role_id` ASC) USING BTREE,
  CONSTRAINT `by_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `by_user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `by_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `by_role` (`role_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of by_user_role
-- ----------------------------
INSERT INTO `by_user_role` VALUES ('6ba7b86c9dad11d180b400c04fd430c8', '6ba7b8109dad11d180b400c04fd430c8', '6ba7b8309dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b86d9dad11d180b400c04fd430c8', '6ba7b8119dad11d180b400c04fd430c8', '6ba7b8319dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b86e9dad11d180b400c04fd430c8', '6ba7b8129dad11d180b400c04fd430c8', '6ba7b8339dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b86f9dad11d180b400c04fd430c8', '6ba7b8139dad11d180b400c04fd430c8', '6ba7b8349dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b8709dad11d180b400c04fd430c8', '6ba7b8149dad11d180b400c04fd430c8', '6ba7b8359dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b8719dad11d180b400c04fd430c8', '6ba7b8159dad11d180b400c04fd430c8', '6ba7b8369dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b8729dad11d180b400c04fd430c8', '6ba7b8169dad11d180b400c04fd430c8', '6ba7b8379dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b8739dad11d180b400c04fd430c8', '6ba7b8179dad11d180b400c04fd430c8', '6ba7b8389dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b8749dad11d180b400c04fd430c8', '6ba7b8189dad11d180b400c04fd430c8', '6ba7b8399dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b8759dad11d180b400c04fd430c8', '6ba7b8199dad11d180b400c04fd430c8', '6ba7b83a9dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b8769dad11d180b400c04fd430c8', '6ba7b81a9dad11d180b400c04fd430c8', '6ba7b83b9dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b8779dad11d180b400c04fd430c8', '6ba7b81b9dad11d180b400c04fd430c8', '6ba7b83c9dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b8789dad11d180b400c04fd430c8', '6ba7b81c9dad11d180b400c04fd430c8', '6ba7b83d9dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b8799dad11d180b400c04fd430c8', '6ba7b81d9dad11d180b400c04fd430c8', '6ba7b83e9dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b87a9dad11d180b400c04fd430c8', '6ba7b81e9dad11d180b400c04fd430c8', '6ba7b83f9dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b87b9dad11d180b400c04fd430c8', '6ba7b81f9dad11d180b400c04fd430c8', '6ba7b8409dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b87c9dad11d180b400c04fd430c8', '6ba7b8209dad11d180b400c04fd430c8', '6ba7b8419dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b87d9dad11d180b400c04fd430c8', '6ba7b8219dad11d180b400c04fd430c8', '6ba7b8429dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b87e9dad11d180b400c04fd430c8', '6ba7b8229dad11d180b400c04fd430c8', '6ba7b8439dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b87f9dad11d180b400c04fd430c8', '6ba7b8239dad11d180b400c04fd430c8', '6ba7b8449dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b8809dad11d180b400c04fd430c8', '6ba7b8249dad11d180b400c04fd430c8', '6ba7b8459dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b8819dad11d180b400c04fd430c8', '6ba7b8259dad11d180b400c04fd430c8', '6ba7b8469dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b8829dad11d180b400c04fd430c8', '6ba7b8269dad11d180b400c04fd430c8', '6ba7b8479dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b8839dad11d180b400c04fd430c8', '6ba7b8279dad11d180b400c04fd430c8', '6ba7b8489dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b8849dad11d180b400c04fd430c8', '6ba7b8289dad11d180b400c04fd430c8', '6ba7b8499dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b8859dad11d180b400c04fd430c8', '6ba7b8299dad11d180b400c04fd430c8', '6ba7b84a9dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b8869dad11d180b400c04fd430c8', '6ba7b82a9dad11d180b400c04fd430c8', '6ba7b84b9dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b8879dad11d180b400c04fd430c8', '6ba7b82b9dad11d180b400c04fd430c8', '6ba7b84c9dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b8889dad11d180b400c04fd430c8', '6ba7b82c9dad11d180b400c04fd430c8', '6ba7b84d9dad11d180b400c04fd430c8', '2026-01-29 18:54:15');
INSERT INTO `by_user_role` VALUES ('6ba7b8899dad11d180b400c04fd430c8', '6ba7b82d9dad11d180b400c04fd430c8', '6ba7b8309dad11d180b400c04fd430c8', '2026-01-29 18:54:15');

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `contract_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '合同唯一标识',
  `contract_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '合同编号',
  `contract_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '合同名称',
  `contract_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '合同类型',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'draft' COMMENT '状态',
  `party_a_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '甲方名称',
  `party_b_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '乙方名称',
  `party_a_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '甲方统一信用代码',
  `party_b_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '乙方统一信用代码',
  `sign_date` date NULL DEFAULT NULL COMMENT '签订日期',
  `effective_date` date NULL DEFAULT NULL COMMENT '生效日期',
  `expire_date` date NULL DEFAULT NULL COMMENT '到期日期',
  `actual_end_date` date NULL DEFAULT NULL COMMENT '实际终止日期',
  `total_amount` decimal(15, 2) NULL DEFAULT NULL COMMENT '合同总金额',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'CNY' COMMENT '币种',
  `paid_amount` decimal(15, 2) NULL DEFAULT 0.00 COMMENT '已付金额',
  `main_file_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主文件路径',
  `change_count` int NULL DEFAULT 0 COMMENT '变更次数',
  `transfer_count` int NULL DEFAULT 0 COMMENT '转让次数',
  `created_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人姓名',
  `updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标志 0-正常 1-删除',
  `version` int NOT NULL DEFAULT 1 COMMENT '版本号',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `contract_uid`(`contract_uid` ASC) USING BTREE,
  UNIQUE INDEX `contract_no`(`contract_no` ASC) USING BTREE,
  INDEX `idx_contract_no`(`contract_no` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_type`(`contract_type` ASC) USING BTREE,
  INDEX `idx_sign_date`(`sign_date` ASC) USING BTREE,
  INDEX `idx_expire_date`(`expire_date` ASC) USING BTREE,
  INDEX `idx_created_time`(`created_time` ASC) USING BTREE,
  INDEX `idx_party_a`(`party_a_name` ASC) USING BTREE,
  INDEX `idx_party_b`(`party_b_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '合同主表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contract
-- ----------------------------
INSERT INTO `contract` VALUES (1, '1', '1', '1', '1', '1', '1', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, 'CNY', 0.00, NULL, 0, 0, NULL, '2026-01-05 16:44:38', NULL, '2026-01-05 16:44:38', 0, 1, '1');

-- ----------------------------
-- Table structure for contract_audit_log
-- ----------------------------
DROP TABLE IF EXISTS `contract_audit_log`;
CREATE TABLE `contract_audit_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `audit_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '审计日志唯一标识',
  `audit_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审计类型: DATA_CHANGE/AUTH_CHANGE/CONFIG_CHANGE',
  `table_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表名',
  `record_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '记录ID',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作: INSERT/UPDATE/DELETE/SELECT',
  `old_data` json NULL COMMENT '旧数据',
  `new_data` json NULL COMMENT '新数据',
  `diff_data` json NULL COMMENT '差异数据',
  `changed_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '变更字段',
  `sql_statement` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'SQL语句',
  `sql_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'SQL参数',
  `execution_time_ms` int NULL DEFAULT NULL COMMENT '执行时间(毫秒)',
  `affected_rows` int NULL DEFAULT NULL COMMENT '影响行数',
  `success_flag` tinyint NULL DEFAULT 1 COMMENT '成功标志',
  `db_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据库名',
  `connection_id` bigint NULL DEFAULT NULL COMMENT '连接ID',
  `operator_id` bigint NULL DEFAULT NULL COMMENT '操作人ID',
  `operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作人姓名',
  `operator_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作人IP',
  `operation_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `audit_uid`(`audit_uid` ASC) USING BTREE,
  INDEX `idx_table_record`(`table_name` ASC, `record_id` ASC) USING BTREE,
  INDEX `idx_audit_type`(`audit_type` ASC) USING BTREE,
  INDEX `idx_operation`(`operation` ASC) USING BTREE,
  INDEX `idx_operator`(`operator_id` ASC) USING BTREE,
  INDEX `idx_operation_time`(`operation_time` ASC) USING BTREE,
  INDEX `idx_success`(`success_flag` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '审计日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contract_audit_log
-- ----------------------------

-- ----------------------------
-- Table structure for contract_change_record
-- ----------------------------
DROP TABLE IF EXISTS `contract_change_record`;
CREATE TABLE `contract_change_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `change_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '变更记录唯一标识',
  `business_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务类型: CONTRACT/CLAUSE/PARTY/AMOUNT',
  `target_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '目标类型',
  `target_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '目标ID',
  `target_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '目标名称',
  `change_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '变更类型: FIELD_UPDATE/STATUS_CHANGE/AMOUNT_ADJUST',
  `change_version` int NULL DEFAULT 1 COMMENT '变更版本',
  `change_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '变更标题',
  `change_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '变更原因',
  `change_content` json NOT NULL COMMENT '变更内容',
  `change_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '变更详情',
  `affect_field` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '影响字段',
  `affect_amount` decimal(15, 2) NULL DEFAULT NULL COMMENT '影响金额',
  `approval_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'PENDING' COMMENT '审批状态',
  `approval_flow_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批流ID',
  `approval_remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批备注',
  `applicant_id` bigint NULL DEFAULT NULL COMMENT '申请人ID',
  `applicant_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请人姓名',
  `approver_id` bigint NULL DEFAULT NULL COMMENT '审批人ID',
  `approver_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批人姓名',
  `auditor_id` bigint NULL DEFAULT NULL COMMENT '审核人ID',
  `auditor_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核人姓名',
  `apply_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `approval_time` datetime NULL DEFAULT NULL COMMENT '审批时间',
  `effective_time` datetime NULL DEFAULT NULL COMMENT '生效时间',
  `created_by` bigint NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `change_uid`(`change_uid` ASC) USING BTREE,
  INDEX `idx_target`(`target_type` ASC, `target_id` ASC) USING BTREE,
  INDEX `idx_business`(`business_type` ASC) USING BTREE,
  INDEX `idx_status`(`approval_status` ASC) USING BTREE,
  INDEX `idx_applicant`(`applicant_id` ASC) USING BTREE,
  INDEX `idx_apply_time`(`apply_time` ASC) USING BTREE,
  INDEX `idx_approval_time`(`approval_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '变更记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contract_change_record
-- ----------------------------

-- ----------------------------
-- Table structure for contract_file_attachment
-- ----------------------------
DROP TABLE IF EXISTS `contract_file_attachment`;
CREATE TABLE `contract_file_attachment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `file_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件唯一标识',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件名',
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原始文件名',
  `file_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件类型',
  `file_size` bigint NULL DEFAULT NULL COMMENT '文件大小(字节)',
  `file_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件路径',
  `file_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件URL',
  `business_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '业务类型',
  `business_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '业务ID',
  `module_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模块编码',
  `file_hash` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件哈希',
  `mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'MIME类型',
  `file_extension` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件扩展名',
  `thumbnail_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '缩略图路径',
  `has_thumbnail` tinyint NULL DEFAULT 0 COMMENT '是否有缩略图',
  `visibility` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'PUBLIC' COMMENT '可见性',
  `download_count` int NULL DEFAULT 0 COMMENT '下载次数',
  `view_count` int NULL DEFAULT 0 COMMENT '查看次数',
  `uploader_id` bigint NULL DEFAULT NULL COMMENT '上传人ID',
  `uploader_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上传人姓名',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `file_uid`(`file_uid` ASC) USING BTREE,
  INDEX `idx_business`(`business_type` ASC, `business_id` ASC) USING BTREE,
  INDEX `idx_file_uid`(`file_uid` ASC) USING BTREE,
  INDEX `idx_uploader`(`uploader_id` ASC) USING BTREE,
  INDEX `idx_file_type`(`file_type` ASC) USING BTREE,
  INDEX `idx_created_time`(`created_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件附件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contract_file_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for contract_operation_record
-- ----------------------------
DROP TABLE IF EXISTS `contract_operation_record`;
CREATE TABLE `contract_operation_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `record_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '记录唯一标识',
  `module_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模块编码: CONTRACT/PAYMENT/APPROVAL',
  `module_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模块名称',
  `business_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务类型: CREATE/UPDATE/DELETE/VIEW/EXPORT',
  `target_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '目标类型: CONTRACT/CLAUSE/ATTACHMENT',
  `target_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '目标ID',
  `target_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '目标名称',
  `operation_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作标题',
  `operation_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '操作详情',
  `before_content` json NULL COMMENT '操作前内容',
  `after_content` json NULL COMMENT '操作后内容',
  `change_content` json NULL COMMENT '变更内容',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `user_agent` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户代理',
  `device_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备类型: PC/MOBILE',
  `browser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器',
  `os` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作系统',
  `request_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求URL',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方法',
  `request_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '请求参数',
  `execution_time` int NULL DEFAULT NULL COMMENT '执行耗时(毫秒)',
  `success_flag` tinyint NULL DEFAULT 1 COMMENT '成功标志 1-成功 0-失败',
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '错误信息',
  `operator_id` bigint NOT NULL COMMENT '操作人ID',
  `operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作人姓名',
  `operator_dept_id` bigint NULL DEFAULT NULL COMMENT '操作人部门ID',
  `operator_dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作人部门',
  `operation_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `log_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'INFO' COMMENT '日志级别',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `record_uid`(`record_uid` ASC) USING BTREE,
  INDEX `idx_target`(`target_type` ASC, `target_id` ASC) USING BTREE,
  INDEX `idx_module`(`module_code` ASC, `business_type` ASC) USING BTREE,
  INDEX `idx_operator`(`operator_id` ASC) USING BTREE,
  INDEX `idx_operation_time`(`operation_time` ASC) USING BTREE,
  INDEX `idx_ip`(`ip_address` ASC) USING BTREE,
  INDEX `idx_success`(`success_flag` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contract_operation_record
-- ----------------------------

-- ----------------------------
-- Table structure for contract_payment_record
-- ----------------------------
DROP TABLE IF EXISTS `contract_payment_record`;
CREATE TABLE `contract_payment_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `payment_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '付款记录唯一标识',
  `contract_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '合同唯一标识',
  `contract_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '合同编号',
  `contract_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '合同名称',
  `payment_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '付款单号',
  `payment_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '付款类型',
  `payment_amount` decimal(15, 2) NOT NULL COMMENT '付款金额',
  `paid_amount` decimal(15, 2) NULL DEFAULT 0.00 COMMENT '已付金额',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'CNY' COMMENT '币种',
  `payer_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '付款方ID',
  `payer_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '付款方名称',
  `payee_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收款方ID',
  `payee_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收款方名称',
  `plan_pay_date` date NULL DEFAULT NULL COMMENT '计划付款日期',
  `actual_pay_date` date NULL DEFAULT NULL COMMENT '实际付款日期',
  `due_date` date NULL DEFAULT NULL COMMENT '到期日',
  `payment_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'PENDING' COMMENT '付款状态',
  `invoice_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'NONE' COMMENT '发票状态',
  `approval_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'PENDING' COMMENT '审批状态',
  `approval_flow_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批流ID',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `attachment_ids` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '附件ID列表',
  `applicant_id` bigint NULL DEFAULT NULL COMMENT '申请人ID',
  `applicant_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请人姓名',
  `created_by` bigint NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `payment_uid`(`payment_uid` ASC) USING BTREE,
  INDEX `idx_contract`(`contract_uid` ASC) USING BTREE,
  INDEX `idx_payment_no`(`payment_no` ASC) USING BTREE,
  INDEX `idx_payment_status`(`payment_status` ASC) USING BTREE,
  INDEX `idx_plan_date`(`plan_pay_date` ASC) USING BTREE,
  INDEX `idx_actual_date`(`actual_pay_date` ASC) USING BTREE,
  INDEX `idx_payer`(`payer_name` ASC) USING BTREE,
  INDEX `idx_payee`(`payee_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '合同付款记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contract_payment_record
-- ----------------------------

-- ----------------------------
-- Table structure for contract_statistics
-- ----------------------------
DROP TABLE IF EXISTS `contract_statistics`;
CREATE TABLE `contract_statistics`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL COMMENT '统计日期',
  `contract_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '合同类型',
  `department_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `total_count` int NULL DEFAULT 0 COMMENT '总数量',
  `draft_count` int NULL DEFAULT 0 COMMENT '草稿数量',
  `effective_count` int NULL DEFAULT 0 COMMENT '生效数量',
  `expired_count` int NULL DEFAULT 0 COMMENT '过期数量',
  `terminated_count` int NULL DEFAULT 0 COMMENT '终止数量',
  `total_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '总金额',
  `paid_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '已付金额',
  `unpaid_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '未付金额',
  `change_count` int NULL DEFAULT 0 COMMENT '变更次数',
  `created_count` int NULL DEFAULT 0 COMMENT '当日新增',
  `expire_soon_count` int NULL DEFAULT 0 COMMENT '即将到期数量(30天内)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_date_type_dept`(`stat_date` ASC, `contract_type` ASC, `department_id` ASC) USING BTREE,
  INDEX `idx_stat_date`(`stat_date` ASC) USING BTREE,
  INDEX `idx_department`(`department_id` ASC) USING BTREE,
  INDEX `idx_type`(`contract_type` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '合同统计表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contract_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for contract_system_log
-- ----------------------------
DROP TABLE IF EXISTS `contract_system_log`;
CREATE TABLE `contract_system_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `log_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日志唯一标识',
  `log_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志类型: SYSTEM/BUSINESS/ERROR/LOGIN/OPERATION',
  `log_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'INFO' COMMENT '日志级别',
  `log_source` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志来源',
  `logger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '记录器名称',
  `log_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志标题',
  `log_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日志内容',
  `exception_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '异常信息',
  `stack_trace` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '堆栈跟踪',
  `business_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '业务编号',
  `business_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '业务类型',
  `trace_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '跟踪ID',
  `span_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '跨度ID',
  `service_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务名称',
  `host_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主机地址',
  `host_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主机名',
  `thread_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '线程名',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `client_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户端IP',
  `log_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '日志时间',
  `duration_ms` int NULL DEFAULT NULL COMMENT '持续时间(毫秒)',
  `keyword1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关键字1',
  `keyword2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关键字2',
  `keyword3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关键字3',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `log_uid`(`log_uid` ASC) USING BTREE,
  INDEX `idx_log_time`(`log_time` ASC) USING BTREE,
  INDEX `idx_log_level`(`log_level` ASC) USING BTREE,
  INDEX `idx_log_type`(`log_type` ASC) USING BTREE,
  INDEX `idx_user`(`user_id` ASC) USING BTREE,
  INDEX `idx_trace`(`trace_id` ASC) USING BTREE,
  INDEX `idx_business`(`business_type` ASC, `business_no` ASC) USING BTREE,
  INDEX `idx_service`(`service_name` ASC) USING BTREE,
  INDEX `idx_keyword1`(`keyword1` ASC) USING BTREE,
  INDEX `idx_keyword2`(`keyword2` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contract_system_log
-- ----------------------------

-- ----------------------------
-- Table structure for contract_transfer_record
-- ----------------------------
DROP TABLE IF EXISTS `contract_transfer_record`;
CREATE TABLE `contract_transfer_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `transfer_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '转让记录唯一标识',
  `target_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '目标类型: CONTRACT/RIGHT/OBLIGATION',
  `target_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '目标ID',
  `target_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '目标名称',
  `transfer_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '转让类型: OWNER_CHANGE/RIGHT_TRANSFER',
  `transfer_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '转让原因',
  `transfer_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '转让内容',
  `transfer_amount` decimal(15, 2) NULL DEFAULT NULL COMMENT '转让金额',
  `from_party_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '转出方类型: PERSON/DEPARTMENT/COMPANY',
  `from_party_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '转出方ID',
  `from_party_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '转出方名称',
  `from_user_id` bigint NULL DEFAULT NULL COMMENT '转出用户ID',
  `from_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '转出用户姓名',
  `to_party_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '转入方类型',
  `to_party_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '转入方ID',
  `to_party_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '转入方名称',
  `to_user_id` bigint NULL DEFAULT NULL COMMENT '转入用户ID',
  `to_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '转入用户姓名',
  `approval_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'PENDING' COMMENT '审批状态',
  `approval_flow_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批流ID',
  `transfer_time` datetime NULL DEFAULT NULL COMMENT '转让时间',
  `effective_time` datetime NULL DEFAULT NULL COMMENT '生效时间',
  `complete_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `attachment_ids` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '附件ID列表',
  `contract_attachment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '转让协议附件',
  `created_by` bigint NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `transfer_uid`(`transfer_uid` ASC) USING BTREE,
  INDEX `idx_target`(`target_type` ASC, `target_id` ASC) USING BTREE,
  INDEX `idx_transfer_type`(`transfer_type` ASC) USING BTREE,
  INDEX `idx_from_party`(`from_party_type` ASC, `from_party_id` ASC) USING BTREE,
  INDEX `idx_to_party`(`to_party_type` ASC, `to_party_id` ASC) USING BTREE,
  INDEX `idx_status`(`approval_status` ASC) USING BTREE,
  INDEX `idx_transfer_time`(`transfer_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '转让记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contract_transfer_record
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
