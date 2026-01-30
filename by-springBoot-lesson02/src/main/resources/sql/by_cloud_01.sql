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

 Date: 30/01/2026 16:13:41
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
INSERT INTO `by_user` VALUES ('6ba7b8189dad11d180b400c04fd430c8', 'wuwei', 'e10adc3949ba59abbe56e057f20f883e', '吴伟', 'wuwei@example.com', '13800138008', 1, '2026-01-29 18:53:40', '2026-01-29 18:53:40');
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
