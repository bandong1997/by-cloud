/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80041 (8.0.41)
 Source Host           : localhost:3306
 Source Schema         : by_master

 Target Server Type    : MySQL
 Target Server Version : 80041 (8.0.41)
 File Encoding         : 65001

 Date: 12/12/2025 15:25:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for email_verifications
-- ----------------------------
DROP TABLE IF EXISTS `email_verifications`;
CREATE TABLE `email_verifications`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '邮箱',
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '验证令牌',
  `biz_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务类型: register, reset_password, change_email',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态: 0-未验证, 1-已验证, 2-已失效',
  `user_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `send_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  `expire_time` timestamp NOT NULL COMMENT '过期时间',
  `verify_time` timestamp NULL DEFAULT NULL COMMENT '验证时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `token`(`token` ASC) USING BTREE,
  INDEX `idx_email_token`(`email` ASC, `token` ASC) USING BTREE,
  INDEX `idx_expire_time`(`expire_time` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `email_verifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '邮件验证表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of email_verifications
-- ----------------------------
INSERT INTO `email_verifications` VALUES (1, 'zhangsan@example.com', 'abc123def456', 'register', 0, 2, '2025-12-12 14:42:46', '2025-12-13 14:42:46', NULL);
INSERT INTO `email_verifications` VALUES (2, 'lisi@example.com', 'def456ghi789', 'reset_password', 0, 3, '2025-12-12 14:42:46', '2025-12-12 15:42:46', NULL);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `permission_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限编码',
  `permission_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限描述',
  `type` tinyint NULL DEFAULT 1 COMMENT '类型: 1-菜单, 2-按钮, 3-接口',
  `parent_id` bigint UNSIGNED NULL DEFAULT 0 COMMENT '父权限ID',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由路径/接口路径',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '前端组件',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序',
  `is_visible` tinyint(1) NULL DEFAULT 1 COMMENT '是否可见',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态: 0-禁用, 1-正常',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permission_code`(`permission_code` ASC) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_permission_code`(`permission_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'system:view', '系统管理', NULL, 1, 0, NULL, '/system', NULL, 100, 1, 1, '2025-12-12 14:42:44', '2025-12-12 14:42:44');
INSERT INTO `permissions` VALUES (2, 'user:manage', '用户管理', NULL, 1, 1, NULL, '/system/user', NULL, 101, 1, 1, '2025-12-12 14:42:44', '2025-12-12 14:42:44');
INSERT INTO `permissions` VALUES (3, 'role:manage', '角色管理', NULL, 1, 1, NULL, '/system/role', NULL, 102, 1, 1, '2025-12-12 14:42:44', '2025-12-12 14:42:44');
INSERT INTO `permissions` VALUES (4, 'permission:manage', '权限管理', NULL, 1, 1, NULL, '/system/permission', NULL, 103, 1, 1, '2025-12-12 14:42:44', '2025-12-12 14:42:44');
INSERT INTO `permissions` VALUES (5, 'user:add', '新增用户', NULL, 2, 2, NULL, '', NULL, 1, 1, 1, '2025-12-12 14:42:44', '2025-12-12 14:42:44');
INSERT INTO `permissions` VALUES (6, 'user:edit', '编辑用户', NULL, 2, 2, NULL, '', NULL, 2, 1, 1, '2025-12-12 14:42:44', '2025-12-12 14:42:44');
INSERT INTO `permissions` VALUES (7, 'user:delete', '删除用户', NULL, 2, 2, NULL, '', NULL, 3, 1, 1, '2025-12-12 14:42:44', '2025-12-12 14:42:44');
INSERT INTO `permissions` VALUES (8, 'user:view', '查看用户', NULL, 2, 2, NULL, '', NULL, 4, 1, 1, '2025-12-12 14:42:44', '2025-12-12 14:42:44');
INSERT INTO `permissions` VALUES (9, 'api:user:list', '获取用户列表', NULL, 3, 0, NULL, '/api/users', NULL, 1, 1, 1, '2025-12-12 14:42:44', '2025-12-12 14:42:44');
INSERT INTO `permissions` VALUES (10, 'api:user:detail', '获取用户详情', NULL, 3, 0, NULL, '/api/users/*', NULL, 2, 1, 1, '2025-12-12 14:42:44', '2025-12-12 14:42:44');
INSERT INTO `permissions` VALUES (11, 'api:user:create', '创建用户', NULL, 3, 0, NULL, '/api/users', NULL, 3, 1, 1, '2025-12-12 14:42:44', '2025-12-12 14:42:44');
INSERT INTO `permissions` VALUES (12, 'api:user:update', '更新用户', NULL, 3, 0, NULL, '/api/users/*', NULL, 4, 1, 1, '2025-12-12 14:42:44', '2025-12-12 14:42:44');
INSERT INTO `permissions` VALUES (13, 'api:user:delete', '删除用户', NULL, 3, 0, NULL, '/api/users/*', NULL, 5, 1, 1, '2025-12-12 14:42:44', '2025-12-12 14:42:44');

-- ----------------------------
-- Table structure for point_details
-- ----------------------------
DROP TABLE IF EXISTS `point_details`;
CREATE TABLE `point_details`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户ID',
  `change_type` tinyint NOT NULL COMMENT '变动类型: 1-获得, 2-消费, 3-过期',
  `change_points` int NOT NULL COMMENT '变动积分数',
  `remaining_points` int NULL DEFAULT NULL COMMENT '变动后剩余积分',
  `source_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '来源类型: register, login, order, etc.',
  `source_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '来源ID',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `effective_date` date NULL DEFAULT NULL COMMENT '生效日期',
  `expiry_date` date NULL DEFAULT NULL COMMENT '过期日期',
  `is_settled` tinyint(1) NULL DEFAULT 0 COMMENT '是否已结算',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE,
  INDEX `idx_source`(`source_type` ASC, `source_id` ASC) USING BTREE,
  CONSTRAINT `point_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '积分明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of point_details
-- ----------------------------
INSERT INTO `point_details` VALUES (1, 2, 1, 100, 100, 'register', 'REG001', '注册获得积分', NULL, NULL, 0, '2025-12-12 14:42:45');
INSERT INTO `point_details` VALUES (2, 2, 1, 500, 600, 'order', 'ORD2023001', '购物获得积分', NULL, NULL, 0, '2025-12-12 14:42:45');
INSERT INTO `point_details` VALUES (3, 2, 2, 20, 580, 'exchange', 'EXC001', '兑换优惠券', NULL, NULL, 0, '2025-12-12 14:42:45');

-- ----------------------------
-- Table structure for role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_permissions`;
CREATE TABLE `role_permissions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` bigint UNSIGNED NOT NULL COMMENT '角色ID',
  `permission_id` bigint UNSIGNED NOT NULL COMMENT '权限ID',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_role_permission`(`role_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE,
  INDEX `idx_permission_id`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色权限关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permissions
-- ----------------------------
INSERT INTO `role_permissions` VALUES (1, 1, 1, '2025-12-12 14:42:44');
INSERT INTO `role_permissions` VALUES (2, 1, 9, '2025-12-12 14:42:44');
INSERT INTO `role_permissions` VALUES (3, 1, 10, '2025-12-12 14:42:44');
INSERT INTO `role_permissions` VALUES (4, 1, 11, '2025-12-12 14:42:44');
INSERT INTO `role_permissions` VALUES (5, 1, 12, '2025-12-12 14:42:44');
INSERT INTO `role_permissions` VALUES (6, 1, 13, '2025-12-12 14:42:44');
INSERT INTO `role_permissions` VALUES (7, 1, 2, '2025-12-12 14:42:44');
INSERT INTO `role_permissions` VALUES (8, 1, 3, '2025-12-12 14:42:44');
INSERT INTO `role_permissions` VALUES (9, 1, 4, '2025-12-12 14:42:44');
INSERT INTO `role_permissions` VALUES (10, 1, 5, '2025-12-12 14:42:44');
INSERT INTO `role_permissions` VALUES (11, 1, 6, '2025-12-12 14:42:44');
INSERT INTO `role_permissions` VALUES (12, 1, 7, '2025-12-12 14:42:44');
INSERT INTO `role_permissions` VALUES (13, 1, 8, '2025-12-12 14:42:44');
INSERT INTO `role_permissions` VALUES (16, 2, 10, '2025-12-12 14:42:44');
INSERT INTO `role_permissions` VALUES (17, 2, 9, '2025-12-12 14:42:44');

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
INSERT INTO `roles` VALUES (3, 'vip', 'VIP用户', 'VIP会员用户', 0, 1, 3, '2025-12-12 14:42:44', '2025-12-12 14:42:44');
INSERT INTO `roles` VALUES (4, 'auditor', '审核员', '内容审核人员', 0, 1, 4, '2025-12-12 14:42:44', '2025-12-12 14:42:44');

-- ----------------------------
-- Table structure for sms_codes
-- ----------------------------
DROP TABLE IF EXISTS `sms_codes`;
CREATE TABLE `sms_codes`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '验证码',
  `biz_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务类型: register, login, reset_password',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态: 0-未使用, 1-已使用, 2-已失效',
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求IP',
  `send_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  `expire_time` timestamp NOT NULL COMMENT '过期时间',
  `used_time` timestamp NULL DEFAULT NULL COMMENT '使用时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_phone_biz`(`phone` ASC, `biz_type` ASC) USING BTREE,
  INDEX `idx_expire_time`(`expire_time` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '短信验证码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_codes
-- ----------------------------
INSERT INTO `sms_codes` VALUES (1, '13800138001', '123456', 'login', 0, NULL, '2025-12-12 14:42:46', '2025-12-12 14:47:46', NULL);
INSERT INTO `sms_codes` VALUES (2, '13800138002', '654321', 'register', 0, NULL, '2025-12-12 14:42:46', '2025-12-12 14:52:46', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_addresses
-- ----------------------------
INSERT INTO `user_addresses` VALUES (1, 2, 'admin', '13800138001', '北京市', '北京市', '朝阳区', '朝阳北路101号', NULL, 1, '家', 1, '2025-12-12 15:20:23', '2025-12-12 14:42:45');
INSERT INTO `user_addresses` VALUES (3, 3, 'by', '13800138002', '广东省', '深圳市', '南山区', '科技园南区', NULL, 1, '公司', 1, '2025-12-12 15:22:37', '2025-12-12 14:42:45');
INSERT INTO `user_addresses` VALUES (5, 2, 'admin', '13800138005', '贵阳市', '贵阳市', '观山湖区', '科技园南区', '', 1, '公司', 1, '2025-12-12 15:20:09', '2025-12-12 15:20:08');

-- ----------------------------
-- Table structure for user_authentications
-- ----------------------------
DROP TABLE IF EXISTS `user_authentications`;
CREATE TABLE `user_authentications`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户ID',
  `auth_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '认证类型: wechat, qq, github, weibo',
  `open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '第三方开放ID',
  `union_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联合ID',
  `access_token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问令牌',
  `refresh_token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '刷新令牌',
  `expires_in` int NULL DEFAULT NULL COMMENT '过期时间(秒)',
  `auth_data` json NULL COMMENT '认证数据',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态: 0-解绑, 1-绑定',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_auth_type_openid`(`auth_type` ASC, `open_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_union_id`(`union_id` ASC) USING BTREE,
  CONSTRAINT `user_authentications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户第三方认证表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_authentications
-- ----------------------------

-- ----------------------------
-- Table structure for user_login_logs
-- ----------------------------
DROP TABLE IF EXISTS `user_login_logs`;
CREATE TABLE `user_login_logs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户ID',
  `login_type` tinyint NULL DEFAULT 1 COMMENT '登录方式: 1-密码, 2-验证码, 3-微信, 4-QQ',
  `login_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录IP',
  `login_location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录地点',
  `user_agent` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户代理',
  `device_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备类型',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作系统',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态: 0-失败, 1-成功',
  `fail_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '失败原因',
  `login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_login_time`(`login_time` ASC) USING BTREE,
  INDEX `idx_login_ip`(`login_ip` ASC) USING BTREE,
  CONSTRAINT `user_login_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户登录日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_login_logs
-- ----------------------------
INSERT INTO `user_login_logs` VALUES (1, 1, 1, '192.168.1.100', '北京市', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36', 'PC', 'Chrome', 'Windows 10', 1, NULL, '2025-12-12 14:42:46');
INSERT INTO `user_login_logs` VALUES (2, 2, 1, '192.168.1.101', '上海市', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/605.1.15', 'Mobile', 'Safari', 'iOS', 1, NULL, '2025-12-12 14:42:46');
INSERT INTO `user_login_logs` VALUES (3, 2, 2, '192.168.1.102', '上海市', 'Mozilla/5.0 (Android; Mobile; rv:91.0) Gecko/91.0 Firefox/91.0', 'Mobile', 'Firefox', 'Android', 1, NULL, '2025-12-12 14:42:46');

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
  INDEX `idx_operation_type`(`operation_type` ASC) USING BTREE,
  CONSTRAINT `user_operation_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_operation_logs
-- ----------------------------

-- ----------------------------
-- Table structure for user_points
-- ----------------------------
DROP TABLE IF EXISTS `user_points`;
CREATE TABLE `user_points`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户ID',
  `total_points` int NULL DEFAULT 0 COMMENT '总积分',
  `available_points` int NULL DEFAULT 0 COMMENT '可用积分',
  `used_points` int NULL DEFAULT 0 COMMENT '已用积分',
  `expired_points` int NULL DEFAULT 0 COMMENT '过期积分',
  `level` tinyint NULL DEFAULT 1 COMMENT '会员等级',
  `growth_value` int NULL DEFAULT 0 COMMENT '成长值',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_level`(`level` ASC) USING BTREE,
  CONSTRAINT `user_points_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户积分表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_points
-- ----------------------------
INSERT INTO `user_points` VALUES (1, 1, 1000, 800, 0, 0, 3, 1500, '2025-12-12 14:42:45', '2025-12-12 14:42:45');
INSERT INTO `user_points` VALUES (2, 2, 5000, 4800, 0, 0, 5, 6000, '2025-12-12 14:42:45', '2025-12-12 14:42:45');
INSERT INTO `user_points` VALUES (3, 3, 800, 800, 0, 0, 2, 800, '2025-12-12 14:42:45', '2025-12-12 14:42:45');
INSERT INTO `user_points` VALUES (4, 4, 100, 100, 0, 0, 1, 100, '2025-12-12 14:42:45', '2025-12-12 14:42:45');
INSERT INTO `user_points` VALUES (5, 5, 2000, 1800, 0, 0, 4, 2500, '2025-12-12 14:42:45', '2025-12-12 14:42:45');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户ID',
  `role_id` bigint UNSIGNED NOT NULL COMMENT '角色ID',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES (1, 1, 1, '2025-12-12 14:42:45');
INSERT INTO `user_roles` VALUES (2, 3, 2, '2025-12-12 14:42:45');
INSERT INTO `user_roles` VALUES (3, 4, 2, '2025-12-12 14:42:45');
INSERT INTO `user_roles` VALUES (4, 2, 2, '2025-12-12 14:42:45');
INSERT INTO `user_roles` VALUES (5, 5, 2, '2025-12-12 14:42:45');
INSERT INTO `user_roles` VALUES (9, 2, 3, '2025-12-12 14:42:45');

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
INSERT INTO `users` VALUES (2, 'zhangsan', 'zhangsan@example.com', '13800138001', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iK6YcFvT.Y6Bq17zW7QUiPz8mWgq', 'salt456', NULL, '张三', NULL, 1, NULL, 1, 1, NULL, NULL, 0, 1, 0, 0, '2025-12-12 14:42:45', '2025-12-12 14:42:45', 1, 0);
INSERT INTO `users` VALUES (3, 'lisi', 'lisi@example.com', '13800138002', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iK6YcFvT.Y6Bq17zW7QUiPz8mWgq', 'salt789', NULL, '李四', NULL, 2, NULL, 1, 1, NULL, NULL, 0, 1, 0, 0, '2025-12-12 14:42:45', '2025-12-12 14:42:45', 1, 0);
INSERT INTO `users` VALUES (4, 'wangwu', 'wangwu@example.com', '13800138003', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iK6YcFvT.Y6Bq17zW7QUiPz8mWgq', 'salt012', NULL, '王五', NULL, 1, NULL, 0, 1, NULL, NULL, 0, 0, 0, 0, '2025-12-12 14:42:45', '2025-12-12 14:42:45', 1, 0);
INSERT INTO `users` VALUES (5, 'zhaoliu', 'zhaoliu@example.com', '13800138004', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iK6YcFvT.Y6Bq17zW7QUiPz8mWgq', 'salt345', NULL, '赵六', NULL, 2, NULL, 1, 1, NULL, NULL, 0, 1, 0, 0, '2025-12-12 14:42:45', '2025-12-12 14:42:45', 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
