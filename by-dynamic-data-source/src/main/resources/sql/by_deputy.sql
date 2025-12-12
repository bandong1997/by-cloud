/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80041 (8.0.41)
 Source Host           : localhost:3306
 Source Schema         : by_deputy

 Target Server Type    : MySQL
 Target Server Version : 80041 (8.0.41)
 File Encoding         : 65001

 Date: 12/12/2025 16:38:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色编码',
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色描述',
  `is_system` tinyint(1) NULL DEFAULT 0 COMMENT '是否系统内置角色',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态: 0-禁用, 1-正常',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_code`(`role_code` ASC) USING BTREE,
  INDEX `idx_role_code`(`role_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'admin', '系统管理员', '拥有系统所有权限', 1, 1, 1, '2025-12-12 14:42:44', '2025-12-12 14:42:44');
INSERT INTO `roles` VALUES (2, 'user', '普通用户', '普通注册用户', 1, 1, 2, '2025-12-12 14:42:44', '2025-12-12 14:42:44');

-- ----------------------------
-- Table structure for user_addresses
-- ----------------------------
DROP TABLE IF EXISTS `user_addresses`;
CREATE TABLE `user_addresses`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户ID',
  `consignee` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收货人',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系电话',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '城市',
  `district` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区县',
  `detailed_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '详细地址',
  `postal_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `is_default` tinyint(1) NULL DEFAULT 0 COMMENT '是否默认地址',
  `tag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址标签: 家、公司、学校等',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态: 0-删除, 1-正常',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_is_default`(`is_default` ASC) USING BTREE,
  CONSTRAINT `user_addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_addresses
-- ----------------------------
INSERT INTO `user_addresses` VALUES (1, 2, '张三', '13800138001', '北京市', '北京市', '朝阳区', '朝阳北路101号', NULL, 1, '家', 1, '2025-12-12 14:42:45', '2025-12-12 14:42:45');
INSERT INTO `user_addresses` VALUES (2, 2, '张三', '13800138001', '上海市', '上海市', '浦东新区', '张江高科技园区', NULL, 0, '公司', 1, '2025-12-12 14:42:45', '2025-12-12 14:42:45');
INSERT INTO `user_addresses` VALUES (3, 3, '李四', '13800138002', '广东省', '深圳市', '南山区', '科技园南区', NULL, 1, '公司', 1, '2025-12-12 14:42:45', '2025-12-12 14:42:45');
INSERT INTO `user_addresses` VALUES (4, 2, '王五', '13800138005', '贵阳市', '贵阳市', '观山湖区', '科技园南区', '', 1, '公司', 1, '2025-12-12 15:17:43', '2025-12-12 15:19:35');

-- ----------------------------
-- Table structure for user_operation_logs
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_logs`;
CREATE TABLE `user_operation_logs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户ID',
  `operation_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作类型',
  `operation_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '操作内容',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方法',
  `request_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求URL',
  `request_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '请求参数',
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `user_agent` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户代理',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态: 0-失败, 1-成功',
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '错误信息',
  `execute_time` bigint NULL DEFAULT NULL COMMENT '执行时间(毫秒)',
  `operation_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_operation_time`(`operation_time` ASC) USING BTREE,
  INDEX `idx_operation_type`(`operation_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_operation_logs
-- ----------------------------
INSERT INTO `user_operation_logs` VALUES (3, 9, 'INSERT', '{\"email\":\"by@163.com\",\"id\":9,\"nickname\":\"by\",\"passwordHash\":\"$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iK6YcFvT.Y6Bq17zW7QUiPz8mWgq\",\"passwordSalt\":\"salt789\",\"phone\":\"123456\",\"realName\":\"by\",\"username\":\"by\"}', 'POST', '/users/saveUser', '{\"email\":\"by@163.com\",\"id\":9,\"nickname\":\"by\",\"passwordHash\":\"$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iK6YcFvT.Y6Bq17zW7QUiPz8mWgq\",\"passwordSalt\":\"salt789\",\"phone\":\"123456\",\"realName\":\"by\",\"username\":\"by\"}', 'tz-zy', '192.168.2.86', 1, NULL, NULL, '2025-12-12 16:14:46');
INSERT INTO `user_operation_logs` VALUES (4, 12, 'INSERT', '{\"email\":\"by@1613.com\",\"id\":12,\"nickname\":\"by\",\"passwordHash\":\"$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iK6YcFvT.Y6Bq17zW7QUiPz8mWgq\",\"passwordSalt\":\"salt789\",\"phone\":\"123456\",\"realName\":\"by\",\"username\":\"by1\"}', 'POST', '/users/saveUser', '{\"email\":\"by@1613.com\",\"id\":12,\"nickname\":\"by\",\"passwordHash\":\"$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iK6YcFvT.Y6Bq17zW7QUiPz8mWgq\",\"passwordSalt\":\"salt789\",\"phone\":\"123456\",\"realName\":\"by\",\"username\":\"by1\"}', 'tz-zy', '192.168.2.86', 1, NULL, NULL, '2025-12-12 16:21:30');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码哈希',
  `password_salt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码盐值',
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像URL',
  `gender` tinyint NULL DEFAULT 0 COMMENT '性别: 0-未知, 1-男, 2-女',
  `birth_date` date NULL DEFAULT NULL COMMENT '出生日期',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态: 0-禁用, 1-正常, 2-锁定, 3-注销',
  `source_type` tinyint NULL DEFAULT 1 COMMENT '注册来源: 1-网站, 2-APP, 3-微信, 4-QQ',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最后登录IP',
  `login_count` int NULL DEFAULT 0 COMMENT '登录次数',
  `email_verified` tinyint(1) NULL DEFAULT 0 COMMENT '邮箱是否验证',
  `phone_verified` tinyint(1) NULL DEFAULT 0 COMMENT '手机是否验证',
  `is_admin` tinyint(1) NULL DEFAULT 0 COMMENT '是否管理员',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `version` int NULL DEFAULT 1 COMMENT '版本号（用于乐观锁）',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE,
  INDEX `idx_username`(`username` ASC) USING BTREE,
  INDEX `idx_email`(`email` ASC) USING BTREE,
  INDEX `idx_phone`(`phone` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin@example.com', '13800138000', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iK6YcFvT.Y6Bq17zW7QUiPz8mWgq', 'salt123', NULL, '系统管理员', NULL, 1, NULL, 1, 1, NULL, NULL, 0, 1, 0, 1, '2025-12-12 14:42:45', '2025-12-12 14:42:45', 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
