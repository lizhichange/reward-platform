/*
Navicat MySQL Data Transfer

Source Server         : rm-uf6169a7q626pc7pzuo.mysql.rds.aliyuncs.com
Source Server Version : 50728
Source Host           : rm-uf6169a7q626pc7pzuo.mysql.rds.aliyuncs.com:3306
Source Database       : ruoyi

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2020-06-20 15:49:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '账户唯一标识',
  `balance` bigint(20) NOT NULL COMMENT '余额',
  `state` varchar(22) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态[1:启用,0:禁用]',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(120) CHARACTER SET utf8 DEFAULT NULL,
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `modified_by` varchar(120) CHARACTER SET utf8 DEFAULT NULL,
  `account_type` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账户类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_index` (`account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21724 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of account
-- ----------------------------

-- ----------------------------
-- Table structure for account_detail
-- ----------------------------
DROP TABLE IF EXISTS `account_detail`;
CREATE TABLE `account_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '账户唯一id',
  `amount` bigint(20) DEFAULT NULL COMMENT '金额 分为单位',
  `opt_type` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '操作类型 [0:收入][1:支出]',
  `remark` varchar(512) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `out_trade_no` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '订单id',
  `biz_code` varchar(120) CHARACTER SET utf8 NOT NULL COMMENT '业务代码',
  `source_code` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源业务编码',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `operator` varchar(120) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_index` (`account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=113891 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of account_detail
-- ----------------------------

-- ----------------------------
-- Table structure for enterprise_info
-- ----------------------------
DROP TABLE IF EXISTS `enterprise_info`;
CREATE TABLE `enterprise_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_name` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '企业名称	',
  `account_opening_date` datetime DEFAULT NULL COMMENT '开户日期	',
  `sales_manager` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '销售经理',
  `payment_type` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '付费类型',
  `status` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '企业状态',
  `remarks` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `enterprise_account` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '企业登录账号',
  `enterprise_password` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '企业登录密码',
  `send_the_template` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否模板发送',
  `sensitive_word_review` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否敏感词审核',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `contact` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系人号码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of enterprise_info
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(120) COLLATE utf8mb4_bin DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('2', 'enterprise_info', '', 'EnterpriseInfo', 'crud', 'com.ruoyi.system', 'system', 'info', null, 'ruoyi', null, 'admin', '2019-09-06 11:06:59', '', null, null);
INSERT INTO `gen_table` VALUES ('3', 'account', '', 'Account', 'crud', 'com.ruoyi.system', 'system', 'account', null, 'ruoyi', null, 'admin', '2019-09-09 16:26:13', '', null, null);
INSERT INTO `gen_table` VALUES ('4', 'account_detail', '', 'AccountDetail', 'crud', 'com.ruoyi.system', 'system', 'detail', null, 'ruoyi', null, 'admin', '2019-09-09 16:26:13', '', null, null);
INSERT INTO `gen_table` VALUES ('5', 'ts', '', 'Ts', 'crud', 'com.ruoyi.system', 'system', 'ts', null, 'ruoyi', null, 'admin', '2020-03-17 12:15:09', '', null, null);
INSERT INTO `gen_table` VALUES ('7', 'yqm', '邀请码', 'Yqm', 'crud', 'com.ruoyi.system', 'system', 'yqm', '邀请码管理', 'ruoyi', '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2020-03-17 15:44:39', '', '2020-03-17 15:45:20', '邀请码');
INSERT INTO `gen_table` VALUES ('8', 'sys_category', '类目表', 'SysCategory', 'crud', 'com.ruoyi.system', 'system', 'category', '类目', 'ruoyi', null, 'admin', '2020-03-18 10:08:24', '', null, null);
INSERT INTO `gen_table` VALUES ('9', 'shipin', '公共片库', 'Shipin', 'crud', 'com.ruoyi.system', 'system', 'shipin', '邀请码管理', 'ruoyi', '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2020-03-19 21:45:16', '', '2020-03-19 21:45:49', 'create_time');
INSERT INTO `gen_table` VALUES ('11', 'trade', '', 'Trade', 'crud', 'com.ruoyi.system', 'system', 'trade', null, 'ruoyi', null, 'admin', '2020-06-06 22:47:42', '', null, null);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(120) COLLATE utf8mb4_bin DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('21', '2', 'id', null, 'int(11)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2019-09-06 11:06:59', '', null);
INSERT INTO `gen_table_column` VALUES ('22', '2', 'enterprise_name', '企业名称	', 'varchar(120)', 'String', 'enterpriseName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2019-09-06 11:06:59', '', null);
INSERT INTO `gen_table_column` VALUES ('23', '2', 'account_opening_date', '开户日期	', 'datetime', 'Date', 'accountOpeningDate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '3', 'admin', '2019-09-06 11:06:59', '', null);
INSERT INTO `gen_table_column` VALUES ('24', '2', 'sales_manager', '销售经理', 'varchar(120)', 'String', 'salesManager', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2019-09-06 11:06:59', '', null);
INSERT INTO `gen_table_column` VALUES ('25', '2', 'payment_type', '付费类型', 'varchar(120)', 'String', 'paymentType', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '5', 'admin', '2019-09-06 11:06:59', '', null);
INSERT INTO `gen_table_column` VALUES ('26', '2', 'status', '企业状态', 'varchar(120)', 'String', 'status', '0', '0', null, '1', '1', '1', '1', 'EQ', 'radio', '', '6', 'admin', '2019-09-06 11:06:59', '', null);
INSERT INTO `gen_table_column` VALUES ('27', '2', 'remarks', '备注', 'varchar(120)', 'String', 'remarks', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2019-09-06 11:06:59', '', null);
INSERT INTO `gen_table_column` VALUES ('28', '2', 'enterprise_account', '企业登录账号', 'varchar(120)', 'String', 'enterpriseAccount', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2019-09-06 11:06:59', '', null);
INSERT INTO `gen_table_column` VALUES ('29', '2', 'enterprise_password', '企业登录密码', 'varchar(120)', 'String', 'enterprisePassword', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2019-09-06 11:06:59', '', null);
INSERT INTO `gen_table_column` VALUES ('30', '2', 'send_the_template', '是否模板发送', 'varchar(120)', 'String', 'sendTheTemplate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2019-09-06 11:06:59', '', null);
INSERT INTO `gen_table_column` VALUES ('31', '2', 'sensitive_word_review', '是否敏感词审核', 'varchar(120)', 'String', 'sensitiveWordReview', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2019-09-06 11:06:59', '', null);
INSERT INTO `gen_table_column` VALUES ('32', '2', 'gmt_create', '创建时间', 'datetime', 'Date', 'gmtCreate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '12', 'admin', '2019-09-06 11:06:59', '', null);
INSERT INTO `gen_table_column` VALUES ('33', '2', 'gmt_modified', '修改时间', 'datetime', 'Date', 'gmtModified', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '13', 'admin', '2019-09-06 11:06:59', '', null);
INSERT INTO `gen_table_column` VALUES ('34', '2', 'contact', '联系人', 'varchar(120)', 'String', 'contact', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '14', 'admin', '2019-09-06 11:06:59', '', null);
INSERT INTO `gen_table_column` VALUES ('35', '2', 'contact_phone', '联系人号码', 'varchar(120)', 'String', 'contactPhone', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '15', 'admin', '2019-09-06 11:06:59', '', null);
INSERT INTO `gen_table_column` VALUES ('36', '3', 'id', null, 'int(11)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2019-09-09 16:26:13', '', null);
INSERT INTO `gen_table_column` VALUES ('37', '3', 'account_id', '账户唯一标识', 'varchar(32)', 'String', 'accountId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2019-09-09 16:26:13', '', null);
INSERT INTO `gen_table_column` VALUES ('38', '3', 'balance', '余额', 'bigint(20)', 'Long', 'balance', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2019-09-09 16:26:13', '', null);
INSERT INTO `gen_table_column` VALUES ('39', '3', 'state', '状态[1:启用,0:禁用]', 'varchar(22)', 'String', 'state', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2019-09-09 16:26:13', '', null);
INSERT INTO `gen_table_column` VALUES ('40', '3', 'gmt_create', '创建时间', 'datetime', 'Date', 'gmtCreate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', '5', 'admin', '2019-09-09 16:26:13', '', null);
INSERT INTO `gen_table_column` VALUES ('41', '3', 'create_by', null, 'varchar(120)', 'String', 'createBy', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '6', 'admin', '2019-09-09 16:26:13', '', null);
INSERT INTO `gen_table_column` VALUES ('42', '3', 'gmt_modified', '修改时间', 'datetime', 'Date', 'gmtModified', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', '7', 'admin', '2019-09-09 16:26:13', '', null);
INSERT INTO `gen_table_column` VALUES ('43', '3', 'modified_by', null, 'varchar(120)', 'String', 'modifiedBy', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2019-09-09 16:26:13', '', null);
INSERT INTO `gen_table_column` VALUES ('44', '3', 'account_type', '账户类型', 'varchar(120)', 'String', 'accountType', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '9', 'admin', '2019-09-09 16:26:13', '', null);
INSERT INTO `gen_table_column` VALUES ('45', '4', 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2019-09-09 16:26:13', '', null);
INSERT INTO `gen_table_column` VALUES ('46', '4', 'account_id', '账户唯一id', 'varchar(120)', 'String', 'accountId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2019-09-09 16:26:13', '', null);
INSERT INTO `gen_table_column` VALUES ('47', '4', 'amount', '金额 分为单位', 'bigint(20)', 'Long', 'amount', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2019-09-09 16:26:13', '', null);
INSERT INTO `gen_table_column` VALUES ('48', '4', 'opt_type', '操作类型 [0:收入][1:支出]', 'varchar(20)', 'String', 'optType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', '4', 'admin', '2019-09-09 16:26:13', '', null);
INSERT INTO `gen_table_column` VALUES ('49', '4', 'remark', '描述', 'varchar(512)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'textarea', '', '5', 'admin', '2019-09-09 16:26:13', '', null);
INSERT INTO `gen_table_column` VALUES ('50', '4', 'out_trade_no', '订单id', 'varchar(128)', 'String', 'outTradeNo', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2019-09-09 16:26:13', '', null);
INSERT INTO `gen_table_column` VALUES ('51', '4', 'biz_code', '业务代码', 'varchar(120)', 'String', 'bizCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2019-09-09 16:26:13', '', null);
INSERT INTO `gen_table_column` VALUES ('52', '4', 'source_code', '来源业务编码', 'varchar(120)', 'String', 'sourceCode', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2019-09-09 16:26:13', '', null);
INSERT INTO `gen_table_column` VALUES ('53', '4', 'gmt_create', '创建时间', 'datetime', 'Date', 'gmtCreate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '9', 'admin', '2019-09-09 16:26:13', '', null);
INSERT INTO `gen_table_column` VALUES ('54', '4', 'gmt_modified', '修改时间', 'datetime', 'Date', 'gmtModified', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '10', 'admin', '2019-09-09 16:26:13', '', null);
INSERT INTO `gen_table_column` VALUES ('55', '4', 'operator', null, 'varchar(120)', 'String', 'operator', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2019-09-09 16:26:13', '', null);
INSERT INTO `gen_table_column` VALUES ('56', '5', 'id', null, 'int(11)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2020-03-17 12:15:09', '', null);
INSERT INTO `gen_table_column` VALUES ('57', '5', 'ip', null, 'varchar(30)', 'String', 'ip', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-03-17 12:15:09', '', null);
INSERT INTO `gen_table_column` VALUES ('58', '5', 'zt', null, 'varchar(10)', 'String', 'zt', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2020-03-17 12:15:09', '', null);
INSERT INTO `gen_table_column` VALUES ('59', '5', 'neirong', null, 'varchar(120)', 'String', 'neirong', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2020-03-17 12:15:09', '', null);
INSERT INTO `gen_table_column` VALUES ('60', '5', 'shijian', null, 'varchar(30)', 'String', 'shijian', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2020-03-17 12:15:09', '', null);
INSERT INTO `gen_table_column` VALUES ('61', '5', 'typeto', null, 'varchar(30)', 'String', 'typeto', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2020-03-17 12:15:09', '', null);
INSERT INTO `gen_table_column` VALUES ('62', '5', 'sid', null, 'int(11)', 'Long', 'sid', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2020-03-17 12:15:09', '', null);
INSERT INTO `gen_table_column` VALUES ('63', '5', 'userid', null, 'varchar(30)', 'String', 'userid', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2020-03-17 12:15:09', '', null);
INSERT INTO `gen_table_column` VALUES ('81', '7', 'id', 'null', 'int(11)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2020-03-17 15:44:39', null, '2020-03-17 15:45:20');
INSERT INTO `gen_table_column` VALUES ('82', '7', 'userid', 'null', 'varchar(10)', 'String', 'userid', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-03-17 15:44:39', null, '2020-03-17 15:45:20');
INSERT INTO `gen_table_column` VALUES ('83', '7', 'yqm', 'null', 'varchar(20)', 'String', 'yqm', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2020-03-17 15:44:39', null, '2020-03-17 15:45:20');
INSERT INTO `gen_table_column` VALUES ('84', '7', 'shijian', 'null', 'varchar(20)', 'String', 'shijian', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2020-03-17 15:44:39', null, '2020-03-17 15:45:20');
INSERT INTO `gen_table_column` VALUES ('85', '7', 'name', 'null', 'varchar(20)', 'String', 'name', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '5', 'admin', '2020-03-17 15:44:39', null, '2020-03-17 15:45:20');
INSERT INTO `gen_table_column` VALUES ('86', '7', 'zt', 'null', 'varchar(3)', 'String', 'zt', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2020-03-17 15:44:39', null, '2020-03-17 15:45:20');
INSERT INTO `gen_table_column` VALUES ('87', '8', 'catecory_id', '类目id', 'bigint(20)', 'Long', 'catecoryId', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2020-03-18 10:08:24', '', null);
INSERT INTO `gen_table_column` VALUES ('88', '8', 'parent_id', '父类目id', 'bigint(20)', 'Long', 'parentId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-03-18 10:08:24', '', null);
INSERT INTO `gen_table_column` VALUES ('89', '8', 'ancestors', '祖级列表', 'varchar(50)', 'String', 'ancestors', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2020-03-18 10:08:24', '', null);
INSERT INTO `gen_table_column` VALUES ('90', '8', 'catecory_name', '类目名称', 'varchar(30)', 'String', 'catecoryName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '4', 'admin', '2020-03-18 10:08:24', '', null);
INSERT INTO `gen_table_column` VALUES ('91', '8', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '5', 'admin', '2020-03-18 10:08:24', '', null);
INSERT INTO `gen_table_column` VALUES ('92', '8', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '6', 'admin', '2020-03-18 10:08:24', '', null);
INSERT INTO `gen_table_column` VALUES ('93', '8', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '7', 'admin', '2020-03-18 10:08:24', '', null);
INSERT INTO `gen_table_column` VALUES ('94', '8', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '8', 'admin', '2020-03-18 10:08:24', '', null);
INSERT INTO `gen_table_column` VALUES ('95', '8', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '9', 'admin', '2020-03-18 10:08:24', '', null);
INSERT INTO `gen_table_column` VALUES ('96', '9', 'id', 'null', 'int(11)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2020-03-19 21:45:16', null, '2020-03-19 21:45:49');
INSERT INTO `gen_table_column` VALUES ('97', '9', 'money', '资源设置的打赏金额', 'varchar(5)', 'String', 'money', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-03-19 21:45:16', null, '2020-03-19 21:45:49');
INSERT INTO `gen_table_column` VALUES ('98', '9', 'sj', '选择模式 1为 开启随机金额分配', 'varchar(5)', 'String', 'sj', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2020-03-19 21:45:16', null, '2020-03-19 21:45:49');
INSERT INTO `gen_table_column` VALUES ('99', '9', 'cs', '打赏人数', 'varchar(10)', 'String', 'cs', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2020-03-19 21:45:16', null, '2020-03-19 21:45:49');
INSERT INTO `gen_table_column` VALUES ('100', '9', 'url', '打赏图片', 'varchar(120)', 'String', 'url', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2020-03-19 21:45:16', null, '2020-03-19 21:45:49');
INSERT INTO `gen_table_column` VALUES ('101', '9', 'userid', '用户ID', 'varchar(10)', 'String', 'userid', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2020-03-19 21:45:16', null, '2020-03-19 21:45:49');
INSERT INTO `gen_table_column` VALUES ('102', '9', 'name', '资源名称', 'varchar(50)', 'String', 'name', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '7', 'admin', '2020-03-19 21:45:16', null, '2020-03-19 21:45:49');
INSERT INTO `gen_table_column` VALUES ('103', '9', 'zykey', 'null', 'varchar(50)', 'String', 'zykey', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2020-03-19 21:45:16', null, '2020-03-19 21:45:49');
INSERT INTO `gen_table_column` VALUES ('104', '9', 'shijian', 'null', 'varchar(20)', 'String', 'shijian', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2020-03-19 21:45:16', null, '2020-03-19 21:45:49');
INSERT INTO `gen_table_column` VALUES ('105', '9', 'lx', 'null', 'varchar(8)', 'String', 'lx', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2020-03-19 21:45:16', null, '2020-03-19 21:45:49');
INSERT INTO `gen_table_column` VALUES ('106', '9', 'zt', 'null', 'varchar(5)', 'String', 'zt', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2020-03-19 21:45:16', null, '2020-03-19 21:45:49');
INSERT INTO `gen_table_column` VALUES ('107', '9', 'logo', 'null', 'varchar(120)', 'String', 'logo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '12', 'admin', '2020-03-19 21:45:16', null, '2020-03-19 21:45:49');
INSERT INTO `gen_table_column` VALUES ('108', '9', 'is_lei', 'null', 'tinyint(1)', 'Integer', 'isLei', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '13', 'admin', '2020-03-19 21:45:16', null, '2020-03-19 21:45:49');
INSERT INTO `gen_table_column` VALUES ('109', '9', 'is_allow', 'null', 'tinyint(1)', 'Integer', 'isAllow', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '14', 'admin', '2020-03-19 21:45:16', null, '2020-03-19 21:45:49');
INSERT INTO `gen_table_column` VALUES ('110', '9', 'click', 'null', 'int(11)', 'Long', 'click', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '15', 'admin', '2020-03-19 21:45:16', null, '2020-03-19 21:45:49');
INSERT INTO `gen_table_column` VALUES ('111', '9', 'is_preview', 'null', 'tinyint(1)', 'Integer', 'isPreview', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '16', 'admin', '2020-03-19 21:45:16', null, '2020-03-19 21:45:49');
INSERT INTO `gen_table_column` VALUES ('112', '9', 'shorturl', '短链', 'varchar(120)', 'String', 'shorturl', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '17', 'admin', '2020-03-19 21:45:16', null, '2020-03-19 21:45:49');
INSERT INTO `gen_table_column` VALUES ('113', '9', 'category_id', '类目id', 'int(11)', 'Long', 'categoryId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '18', 'admin', '2020-03-19 21:45:16', null, '2020-03-19 21:45:49');
INSERT INTO `gen_table_column` VALUES ('114', '9', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '19', 'admin', '2020-03-19 21:45:16', null, '2020-03-19 21:45:49');
INSERT INTO `gen_table_column` VALUES ('131', '11', 'trade_no', '交易号', 'varchar(32)', 'String', 'tradeNo', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2020-06-06 22:47:42', '', null);
INSERT INTO `gen_table_column` VALUES ('132', '11', 'payer_type', '付款方类型', 'varchar(32)', 'String', 'payerType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', '2', 'admin', '2020-06-06 22:47:42', '', null);
INSERT INTO `gen_table_column` VALUES ('133', '11', 'payer', '付款方', 'varchar(32)', 'String', 'payer', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2020-06-06 22:47:42', '', null);
INSERT INTO `gen_table_column` VALUES ('134', '11', 'payee_type', '收款方类型', 'varchar(32)', 'String', 'payeeType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', '4', 'admin', '2020-06-06 22:47:42', '', null);
INSERT INTO `gen_table_column` VALUES ('135', '11', 'payee', '收款方', 'varchar(32)', 'String', 'payee', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2020-06-06 22:47:42', '', null);
INSERT INTO `gen_table_column` VALUES ('136', '11', 'amount', '金额', 'bigint(20)', 'Long', 'amount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2020-06-06 22:47:42', '', null);
INSERT INTO `gen_table_column` VALUES ('137', '11', 'state', '状态', 'varchar(32)', 'String', 'state', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2020-06-06 22:47:42', '', null);
INSERT INTO `gen_table_column` VALUES ('138', '11', 'category', '交易分类', 'varchar(32)', 'String', 'category', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2020-06-06 22:47:42', '', null);
INSERT INTO `gen_table_column` VALUES ('139', '11', 'pay_type', '支付方式', 'varchar(32)', 'String', 'payType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', '9', 'admin', '2020-06-06 22:47:42', '', null);
INSERT INTO `gen_table_column` VALUES ('140', '11', 'third_trade_no', '外部交易号', 'varchar(64)', 'String', 'thirdTradeNo', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2020-06-06 22:47:42', '', null);
INSERT INTO `gen_table_column` VALUES ('141', '11', 'description', '描述', 'varchar(512)', 'String', 'description', '0', '0', null, '1', '1', '1', '1', 'EQ', 'textarea', '', '11', 'admin', '2020-06-06 22:47:42', '', null);
INSERT INTO `gen_table_column` VALUES ('142', '11', 'remark', '标记', 'varchar(512)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'textarea', '', '12', 'admin', '2020-06-06 22:47:42', '', null);
INSERT INTO `gen_table_column` VALUES ('143', '11', 'gmt_create', '创建时间', 'datetime', 'Date', 'gmtCreate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', '13', 'admin', '2020-06-06 22:47:42', '', null);
INSERT INTO `gen_table_column` VALUES ('144', '11', 'create_by', null, 'varchar(255)', 'String', 'createBy', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '14', 'admin', '2020-06-06 22:47:42', '', null);
INSERT INTO `gen_table_column` VALUES ('145', '11', 'gmt_modified', '修改时间', 'datetime', 'Date', 'gmtModified', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', '15', 'admin', '2020-06-06 22:47:42', '', null);
INSERT INTO `gen_table_column` VALUES ('146', '11', 'modified_by', '修改人', 'varchar(255)', 'String', 'modifiedBy', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '16', 'admin', '2020-06-06 22:47:42', '', null);
INSERT INTO `gen_table_column` VALUES ('147', '11', 'createTime', '创建时间', 'datetime', 'Date', 'createtime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '17', 'admin', '2020-06-06 22:47:42', '', null);
INSERT INTO `gen_table_column` VALUES ('148', '11', 'payee_no', '收款账号', 'varchar(100)', 'String', 'payeeNo', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '18', 'admin', '2020-06-06 22:47:42', '', null);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `blob_data` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `calendar_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `cron_expression` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `time_zone_id` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `entry_id` varchar(95) COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `instance_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `job_name` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL,
  `job_group` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_nonconcurrent` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `requests_recovery` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `job_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `job_group` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL,
  `job_class_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `is_durable` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `is_nonconcurrent` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `is_update_data` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `requests_recovery` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `lock_name` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `instance_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'sunflowerdeMacBook-Pro.local1591166871043', '1591166968868', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `str_prop_1` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `str_prop_2` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `str_prop_3` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `bool_prop_2` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `job_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `job_group` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `trigger_type` varchar(8) COLLATE utf8mb4_bin NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1591166880000', '-1', '5', 'PAUSED', 'CRON', '1591166871000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1591166880000', '-1', '5', 'PAUSED', 'CRON', '1591166871000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', null, '1591166880000', '-1', '5', 'PAUSED', 'CRON', '1591166871000', '0', null, '2', '');

-- ----------------------------
-- Table structure for shipin
-- ----------------------------
DROP TABLE IF EXISTS `shipin`;
CREATE TABLE `shipin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源设置的打赏金额',
  `sj` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '选择模式 1为 开启随机金额分配',
  `cs` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '打赏人数',
  `url` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '打赏图片',
  `userid` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户ID',
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源名称',
  `zykey` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL,
  `shijian` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `lx` varchar(8) COLLATE utf8mb4_bin DEFAULT NULL,
  `zt` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL,
  `logo` varchar(120) CHARACTER SET utf8 NOT NULL,
  `is_lei` tinyint(1) NOT NULL DEFAULT '1',
  `is_allow` tinyint(1) NOT NULL DEFAULT '1',
  `click` int(11) NOT NULL,
  `is_preview` tinyint(1) NOT NULL DEFAULT '0',
  `shorturl` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '短链',
  `category_id` int(11) NOT NULL COMMENT '类目id',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of shipin
-- ----------------------------

-- ----------------------------
-- Table structure for sys_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_category`;
CREATE TABLE `sys_category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类目id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父类目id',
  `ancestors` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '祖级列表',
  `category_name` varchar(30) COLLATE utf8mb4_bin DEFAULT '' COMMENT '类目名称',
  `order_num` int(11) DEFAULT NULL COMMENT '显示顺序',
  `status` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='类目表';

-- ----------------------------
-- Records of sys_category
-- ----------------------------
INSERT INTO `sys_category` VALUES ('100', '0', '0', '大类目', '0', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-20 18:15:37');
INSERT INTO `sys_category` VALUES ('200', '100', '0,100', '日韩', '1', '0', '0', 'admin', '2020-03-18 13:22:50', 'admin', '2020-03-20 18:14:38');
INSERT INTO `sys_category` VALUES ('201', '200', '0,100,200', '淑女', '1', '0', '2', 'admin', '2020-03-18 13:33:05', 'admin', '2020-03-20 13:59:45');
INSERT INTO `sys_category` VALUES ('202', '100', '0,100', '欧美', '2', '0', '0', 'admin', '2020-03-20 18:07:35', 'admin', '2020-03-20 18:15:07');
INSERT INTO `sys_category` VALUES ('203', '100', '0,100', '动物', '3', '0', '0', 'admin', '2020-03-20 18:08:41', 'admin', '2020-03-20 18:15:22');
INSERT INTO `sys_category` VALUES ('204', '100', '0,100', '幼女', '4', '0', '0', 'admin', '2020-03-20 18:09:09', 'admin', '2020-03-20 18:15:37');
INSERT INTO `sys_category` VALUES ('205', '100', '0,100', '乱伦', '5', '0', '0', 'admin', '2020-03-20 18:15:53', '', null);
INSERT INTO `sys_category` VALUES ('206', '100', '0,100', '强奸', '6', '0', '0', 'admin', '2020-03-20 18:16:11', '', null);
INSERT INTO `sys_category` VALUES ('207', '100', '0,100', '丝袜', '7', '0', '0', 'admin', '2020-03-20 18:16:27', '', null);
INSERT INTO `sys_category` VALUES ('208', '100', '0,100', '破处', '8', '0', '0', 'admin', '2020-03-20 18:16:42', '', null);
INSERT INTO `sys_category` VALUES ('209', '200', '0,100,200', '日韩', '1', '0', '2', 'admin', '2020-03-20 18:18:20', '', null);
INSERT INTO `sys_category` VALUES ('210', '202', '0,100,202', '欧美', '1', '0', '2', 'admin', '2020-03-20 18:18:34', '', null);
INSERT INTO `sys_category` VALUES ('211', '203', '0,100,203', '动物', '1', '0', '2', 'admin', '2020-03-20 18:18:42', '', null);
INSERT INTO `sys_category` VALUES ('212', '204', '0,100,204', '幼女', '1', '0', '2', 'admin', '2020-03-20 18:18:56', '', null);
INSERT INTO `sys_category` VALUES ('213', '205', '0,100,205', '乱论', '1', '0', '2', 'admin', '2020-03-20 18:19:20', '', null);
INSERT INTO `sys_category` VALUES ('214', '100', '0,100', '待添加1', '9', '0', '0', 'admin', '2020-03-20 18:26:16', '', null);
INSERT INTO `sys_category` VALUES ('215', '100', '0,100', '待添加2', '10', '0', '0', 'admin', '2020-03-20 18:26:25', '', null);
INSERT INTO `sys_category` VALUES ('216', '100', '0,100', '待添加11', '11', '0', '0', 'admin', '2020-03-20 18:26:33', '', null);
INSERT INTO `sys_category` VALUES ('217', '100', '0,100', '待添加12', '12', '0', '0', 'admin', '2020-03-20 18:26:39', '', null);
INSERT INTO `sys_category` VALUES ('218', '100', '0,100', '待添加13', '13', '0', '0', 'admin', '2020-03-20 18:26:46', '', null);
INSERT INTO `sys_category` VALUES ('219', '100', '0,100', '待添加14', '14', '0', '0', 'admin', '2020-03-20 18:26:54', '', null);
INSERT INTO `sys_category` VALUES ('220', '100', '0,100', '待添加15', '15', '0', '0', 'admin', '2020-03-20 18:27:01', '', null);
INSERT INTO `sys_category` VALUES ('221', '100', '0,100', '待添加16', '16', '0', '0', 'admin', '2020-03-20 18:27:09', '', null);
INSERT INTO `sys_category` VALUES ('222', '100', '0,100', '待添加17', '17', '0', '0', 'admin', '2020-03-20 18:27:16', '', null);
INSERT INTO `sys_category` VALUES ('223', '100', '0,100', '待添加18', '18', '0', '0', 'admin', '2020-03-20 18:27:23', '', null);
INSERT INTO `sys_category` VALUES ('224', '100', '0,100', '待添加19', '19', '0', '0', 'admin', '2020-03-20 18:27:30', '', null);
INSERT INTO `sys_category` VALUES ('225', '100', '0,100', '待添加20', '20', '0', '0', 'admin', '2020-03-20 18:27:38', '', null);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8mb4_bin DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES ('4', '代理返佣比例配置', 'sys.order.rebate', '20', 'N', 'admin', '2020-04-13 23:06:13', '', null, null);
INSERT INTO `sys_config` VALUES ('5', '视频作者返佣比例配置', 'sys.author.rebate', '10', 'N', 'admin', '2020-04-13 23:09:23', '', null, null);
INSERT INTO `sys_config` VALUES ('6', '支付交易类型', 'sys.tradeType', 'JSAPI', 'N', 'admin', '2020-04-16 23:46:07', 'admin', '2020-06-20 15:40:22', '微信公众号支付');
INSERT INTO `sys_config` VALUES ('7', 'xxx', 'sys.aliPay.userId', '2088512802560474', 'N', 'admin', '2020-04-21 11:20:05', '', null, null);
INSERT INTO `sys_config` VALUES ('8', '', 'admin', '{\"item\":[{\"id\":\"24\",\"price\":\"4\"},{\"id\":\"23\",\"price\":\"4\"},{\"id\":\"22\",\"price\":\"3\"}],\"main\":\"33\"}', 'N', 'admin', '2020-06-12 00:11:44', '', '2020-06-12 13:15:59', null);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8mb4_bin DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-18 15:49:09');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-18 15:49:09');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-18 15:49:09');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8mb4_bin DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('29', '10', '查询', '10', 'sys_oper_type', null, 'info', 'Y', '0', 'admin', '2020-04-15 13:26:35', '', null, '查询操作');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) COLLATE utf8mb4_bin DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) COLLATE utf8mb4_bin DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '日志信息',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(120) COLLATE utf8mb4_bin DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) COLLATE utf8mb4_bin DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) COLLATE utf8mb4_bin DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8mb4_bin DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', '', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', '#', 'menuItem', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-19 22:04:35', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', '#', '', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', 'menuItem', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-13 20:07:21', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', 'menuItem', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-23 22:33:10', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', '', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', 'menuItem', 'C', '1', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-23 20:30:27', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', 'menuItem', 'C', '1', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-23 20:30:50', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', 'menuItem', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-15 13:23:50', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', '', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', 'menuItem', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-06-11 16:11:12', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', '', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', '', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', '', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', '', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '3', '/monitor/server', '', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '表单构建', '3', '1', '/tool/build', '', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('114', '代码生成', '3', '2', '/tool/gen', '', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('115', '系统接口', '3', '3', '/tool/swagger', '', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '#', '', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '#', '', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '#', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '#', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '详细信息', '500', '3', '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', '', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '任务详细', '110', '6', '#', '', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '任务导出', '110', '7', '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1056', '生成查询', '114', '1', '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1057', '生成修改', '114', '2', '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1058', '生成删除', '114', '3', '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '114', '4', '#', '', 'F', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '114', '5', '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('2002', '投诉列表', '2082', '1', '/system/ts', 'menuItem', 'C', '0', 'system:ts:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-06-20 15:48:45', '【请填写功能名称】菜单');
INSERT INTO `sys_menu` VALUES ('2003', '【请填写功能名称】查询', '2002', '1', '#', '', 'F', '0', 'system:ts:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2004', '【请填写功能名称】新增', '2002', '2', '#', '', 'F', '0', 'system:ts:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2005', '【请填写功能名称】修改', '2002', '3', '#', '', 'F', '0', 'system:ts:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2006', '【请填写功能名称】删除', '2002', '4', '#', '', 'F', '0', 'system:ts:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2007', '公共片库', '2101', '1', '/system/shipin', 'menuItem', 'C', '0', 'system:shipin:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-06-20 15:47:20', '公共片库菜单');
INSERT INTO `sys_menu` VALUES ('2008', '公共片库查询', '2007', '1', '#', '', 'F', '0', 'system:shipin:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2009', '公共片库新增', '2007', '2', '#', '', 'F', '0', 'system:shipin:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2010', '公共片库修改', '2007', '3', '#', '', 'F', '0', 'system:shipin:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2011', '公共片库删除', '2007', '4', '#', '', 'F', '0', 'system:shipin:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2012', '邀请码管理', '2082', '1', '/system/yqm', 'menuItem', 'C', '0', 'system:yqm:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-06-20 15:48:53', '邀请码管理菜单');
INSERT INTO `sys_menu` VALUES ('2013', '邀请码管理查询', '2012', '1', '#', '', 'F', '0', 'system:yqm:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2014', '邀请码管理新增', '2012', '2', '#', '', 'F', '0', 'system:yqm:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2015', '邀请码管理修改', '2012', '3', '#', '', 'F', '0', 'system:yqm:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2016', '邀请码管理删除', '2012', '4', '#', '', 'F', '0', 'system:yqm:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2017', '类目管理', '2082', '1', '/system/category', 'menuItem', 'C', '0', 'system:category:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-06-20 15:48:01', '类目菜单');
INSERT INTO `sys_menu` VALUES ('2018', '类目查询', '2017', '1', '#', '', 'F', '0', 'system:category:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2019', '类目新增', '2017', '2', '#', '', 'F', '0', 'system:category:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2020', '类目修改', '2017', '3', '#', '', 'F', '0', 'system:category:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2021', '类目删除', '2017', '4', '#', '', 'F', '0', 'system:category:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2028', '链接管理', '2083', '1', '/system/short', 'menuItem', 'C', '0', 'system:short:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-13 20:08:51', '链接管理菜单');
INSERT INTO `sys_menu` VALUES ('2029', '链接管理查询', '2028', '1', '#', '', 'F', '0', 'system:short:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2030', '链接管理新增', '2028', '2', '#', '', 'F', '0', 'system:short:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2031', '链接管理修改', '2028', '3', '#', '', 'F', '0', 'system:short:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2032', '链接管理删除', '2028', '4', '#', '', 'F', '0', 'system:short:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2033', '链接管理导出', '2028', '5', '#', '', 'F', '0', 'system:short:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2040', '域名管理', '2083', '1', '/system/webmain', 'menuItem', 'C', '0', 'system:webmain:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-13 20:09:12', '域名管理菜单');
INSERT INTO `sys_menu` VALUES ('2041', '域名管理查询', '2040', '1', '#', '', 'F', '0', 'system:webmain:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2042', '域名管理新增', '2040', '2', '#', '', 'F', '0', 'system:webmain:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2043', '域名管理修改', '2040', '3', '#', '', 'F', '0', 'system:webmain:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2044', '域名管理删除', '2040', '4', '#', '', 'F', '0', 'system:webmain:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2045', '域名管理导出', '2040', '5', '#', '', 'F', '0', 'system:webmain:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2046', '公众号配置信息', '2083', '1', '/system/wechatConfig', 'menuItem', 'C', '0', 'system:wechatConfig:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-13 20:09:29', '公众号配置信息菜单');
INSERT INTO `sys_menu` VALUES ('2047', '公众号配置信息查询', '2046', '1', '#', '', 'F', '0', 'system:wechatConfig:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2048', '公众号配置信息新增', '2046', '2', '#', '', 'F', '0', 'system:wechatConfig:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2049', '公众号配置信息修改', '2046', '3', '#', '', 'F', '0', 'system:wechatConfig:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2050', '公众号配置信息删除', '2046', '4', '#', '', 'F', '0', 'system:wechatConfig:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2051', '公众号配置信息导出', '2046', '5', '#', '', 'F', '0', 'system:wechatConfig:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2058', '订单列表', '2082', '1', '/system/sysOrder', 'menuItem', 'C', '0', 'system:sysOrder:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-13 20:12:07', '订单列表菜单');
INSERT INTO `sys_menu` VALUES ('2059', '订单列表查询', '2058', '1', '#', '', 'F', '0', 'system:sysOrder:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2060', '订单列表新增', '2058', '2', '#', '', 'F', '0', 'system:sysOrder:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2061', '订单列表修改', '2058', '3', '#', '', 'F', '0', 'system:sysOrder:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2062', '订单列表删除', '2058', '4', '#', '', 'F', '0', 'system:sysOrder:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2063', '订单列表导出', '2058', '5', '#', '', 'F', '0', 'system:sysOrder:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2064', '账户管理', '2082', '1', '/system/account', 'menuItem', 'C', '0', 'system:account:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-13 19:48:25', '【请填写功能名称】菜单');
INSERT INTO `sys_menu` VALUES ('2065', '【请填写功能名称】查询', '2064', '1', '#', '', 'F', '0', 'system:account:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2066', '【请填写功能名称】新增', '2064', '2', '#', '', 'F', '0', 'system:account:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2067', '【请填写功能名称】修改', '2064', '3', '#', '', 'F', '0', 'system:account:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2068', '【请填写功能名称】删除', '2064', '4', '#', '', 'F', '0', 'system:account:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2069', '【请填写功能名称】导出', '2064', '5', '#', '', 'F', '0', 'system:account:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2070', '平台用户', '2082', '1', '/system/wxuser', 'menuItem', 'C', '0', 'system:wxuser:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-13 19:49:02', '平台用户菜单');
INSERT INTO `sys_menu` VALUES ('2071', '平台用户查询', '2070', '1', '#', '', 'F', '0', 'system:wxuser:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2072', '平台用户新增', '2070', '2', '#', '', 'F', '0', 'system:wxuser:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2073', '平台用户修改', '2070', '3', '#', '', 'F', '0', 'system:wxuser:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2074', '平台用户删除', '2070', '4', '#', '', 'F', '0', 'system:wxuser:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2075', '平台用户导出', '2070', '5', '#', '', 'F', '0', 'system:wxuser:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2076', '账户明细', '2082', '1', '/system/accountDetail', 'menuItem', 'C', '0', 'system:accountDetail:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-13 19:47:25', '账户明细菜单');
INSERT INTO `sys_menu` VALUES ('2077', '账户明细查询', '2076', '1', '#', '', 'F', '0', 'system:accountDetail:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2078', '账户明细新增', '2076', '2', '#', '', 'F', '0', 'system:accountDetail:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2079', '账户明细修改', '2076', '3', '#', '', 'F', '0', 'system:accountDetail:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2080', '账户明细删除', '2076', '4', '#', '', 'F', '0', 'system:accountDetail:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2081', '账户明细导出', '2076', '5', '#', '', 'F', '0', 'system:accountDetail:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2082', '账务管理', '1', '1', '#', 'menuItem', 'M', '0', '', 'fa fa-asterisk', 'admin', '2020-04-13 19:45:39', 'admin', '2020-06-20 15:46:31', '');
INSERT INTO `sys_menu` VALUES ('2083', '配置管理', '0', '2', '#', 'menuItem', 'M', '0', null, 'fa fa-arrows', 'admin', '2020-04-13 20:08:11', '', null, '');
INSERT INTO `sys_menu` VALUES ('2084', '授权信息', '3', '1', '/system/wxauth', '', 'C', '0', 'system:wxauth:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '授权信息菜单');
INSERT INTO `sys_menu` VALUES ('2085', '授权信息查询', '2084', '1', '#', '', 'F', '0', 'system:wxauth:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2086', '授权信息新增', '2084', '2', '#', '', 'F', '0', 'system:wxauth:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2087', '授权信息修改', '2084', '3', '#', '', 'F', '0', 'system:wxauth:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2088', '授权信息删除', '2084', '4', '#', '', 'F', '0', 'system:wxauth:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2089', '授权信息导出', '2084', '5', '#', '', 'F', '0', 'system:wxauth:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2090', '打赏记录', '2102', '1', '/statistics/record', 'menuItem', 'C', '0', '', '#', 'admin', '2020-06-05 13:26:31', 'admin', '2020-06-20 15:44:55', '');
INSERT INTO `sys_menu` VALUES ('2091', '打赏统计', '2102', '1', '/statistics/statistics', 'menuItem', 'C', '0', '', '#', 'admin', '2020-06-05 13:26:46', 'admin', '2020-06-20 15:45:05', '');
INSERT INTO `sys_menu` VALUES ('2093', '申请提现', '2102', '1', '/statistics/withdrawal/withdrawalRecord', 'menuItem', 'C', '0', '', '#', 'admin', '2020-06-05 16:27:48', 'admin', '2020-06-20 15:45:18', '');
INSERT INTO `sys_menu` VALUES ('2094', '交易信息', '2082', '1', '/system/trade', 'menuItem', 'C', '0', 'system:trade:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-06-20 15:48:20', '交易信息菜单');
INSERT INTO `sys_menu` VALUES ('2095', '交易信息查询', '2094', '1', '#', '', 'F', '0', 'system:trade:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2096', '交易信息新增', '2094', '2', '#', '', 'F', '0', 'system:trade:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2097', '交易信息修改', '2094', '3', '#', '', 'F', '0', 'system:trade:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2098', '交易信息删除', '2094', '4', '#', '', 'F', '0', 'system:trade:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2099', '交易信息导出', '2094', '5', '#', '', 'F', '0', 'system:trade:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2100', '私人片库', '2102', '1', '/system/shipin/pshipin', 'menuItem', 'C', '0', '', '#', 'admin', '2020-06-11 21:31:09', 'admin', '2020-06-20 15:45:50', '');
INSERT INTO `sys_menu` VALUES ('2101', '业务管理', '0', '0', '#', 'menuItem', 'M', '0', '', 'fa fa-asterisk', 'admin', '2020-06-20 15:43:16', 'admin', '2020-06-20 15:43:25', '');
INSERT INTO `sys_menu` VALUES ('2102', '推广管理', '2101', '1', '#', 'menuItem', 'M', '0', null, 'fa fa-arrows-h', 'admin', '2020-06-20 15:44:44', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '公告内容',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '1', 'admin', '2018-03-16 11:33:00', 'admin', '2020-06-11 16:11:22', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '1', 'admin', '2018-03-16 11:33:00', 'admin', '2020-06-11 16:11:25', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('1', '操作日志', '9', 'com.ruoyi.web.controller.monitor.SysOperlogController.clean()', 'POST', '1', 'admin', '研发部门', '/monitor/operlog/clean', '139.227.73.78, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:40:42');
INSERT INTO `sys_oper_log` VALUES ('2', '登陆日志', '9', 'com.ruoyi.web.controller.monitor.SysLogininforController.clean()', 'POST', '1', 'admin', '研发部门', '/monitor/logininfor/clean', '139.227.73.78, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:40:46');
INSERT INTO `sys_oper_log` VALUES ('3', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '139.227.73.78, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:41:06');
INSERT INTO `sys_oper_log` VALUES ('4', '订单列表', '3', 'com.ruoyi.web.controller.system.SysOrderController.remove()', 'POST', '1', 'admin', '研发部门', '/system/sysOrder/remove', '139.227.73.78, 172.16.0.101', '内网IP', '{\n  \"ids\" : [ \"169,170\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:41:20');
INSERT INTO `sys_oper_log` VALUES ('5', '用户管理', '3', 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', '1', 'admin', '研发部门', '/system/user/remove', '139.227.73.78, 172.16.0.101', '内网IP', '{\n  \"ids\" : [ \"119,118,116,115\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:42:01');
INSERT INTO `sys_oper_log` VALUES ('6', '用户管理', '3', 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', '1', 'admin', '研发部门', '/system/user/remove', '139.227.73.78, 172.16.0.101', '内网IP', '{\n  \"ids\" : [ \"129,128,127,126,125,124,123,122,121,120\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:42:09');
INSERT INTO `sys_oper_log` VALUES ('7', '邀请码管理', '3', 'com.ruoyi.web.controller.system.YqmController.remove()', 'POST', '1', 'admin', '研发部门', '/system/yqm/remove', '139.227.73.78, 172.16.0.101', '内网IP', '{\n  \"ids\" : [ \"36,35,34,33,32,31,30,29,28\" ]\n}', '{\n  \"msg\" : \"邀请码已经被其他用户使用不能删除\",\n  \"code\" : 500\n}', '0', null, '2020-06-20 15:42:19');
INSERT INTO `sys_oper_log` VALUES ('8', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/add', '139.227.73.78, 172.16.0.101', '内网IP', '{\n  \"parentId\" : [ \"0\" ],\n  \"menuType\" : [ \"M\" ],\n  \"menuName\" : [ \"业务管理\" ],\n  \"url\" : [ \"\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"0\" ],\n  \"icon\" : [ \"\" ],\n  \"visible\" : [ \"0\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:43:16');
INSERT INTO `sys_oper_log` VALUES ('9', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '139.227.73.78, 172.16.0.101', '内网IP', '{\n  \"menuId\" : [ \"2101\" ],\n  \"parentId\" : [ \"0\" ],\n  \"menuType\" : [ \"M\" ],\n  \"menuName\" : [ \"业务管理\" ],\n  \"url\" : [ \"#\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"0\" ],\n  \"icon\" : [ \"fa fa-asterisk\" ],\n  \"visible\" : [ \"0\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:43:25');
INSERT INTO `sys_oper_log` VALUES ('10', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '139.227.73.78, 172.16.0.101', '内网IP', '{\n  \"menuId\" : [ \"2082\" ],\n  \"parentId\" : [ \"2101\" ],\n  \"menuType\" : [ \"M\" ],\n  \"menuName\" : [ \"账务管理\" ],\n  \"url\" : [ \"#\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"fa fa-asterisk\" ],\n  \"visible\" : [ \"0\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:43:56');
INSERT INTO `sys_oper_log` VALUES ('11', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/add', '139.227.73.78, 172.16.0.101', '内网IP', '{\n  \"parentId\" : [ \"2101\" ],\n  \"menuType\" : [ \"M\" ],\n  \"menuName\" : [ \"推广管理\" ],\n  \"url\" : [ \"\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"fa fa-arrows-h\" ],\n  \"visible\" : [ \"0\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:44:44');
INSERT INTO `sys_oper_log` VALUES ('12', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '139.227.73.78, 172.16.0.101', '内网IP', '{\n  \"menuId\" : [ \"2090\" ],\n  \"parentId\" : [ \"2102\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"打赏记录\" ],\n  \"url\" : [ \"/statistics/record\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"#\" ],\n  \"visible\" : [ \"0\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:44:55');
INSERT INTO `sys_oper_log` VALUES ('13', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '139.227.73.78, 172.16.0.101', '内网IP', '{\n  \"menuId\" : [ \"2091\" ],\n  \"parentId\" : [ \"2102\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"打赏统计\" ],\n  \"url\" : [ \"/statistics/statistics\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"#\" ],\n  \"visible\" : [ \"0\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:45:05');
INSERT INTO `sys_oper_log` VALUES ('14', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '139.227.73.78, 172.16.0.101', '内网IP', '{\n  \"menuId\" : [ \"2093\" ],\n  \"parentId\" : [ \"2102\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"申请提现\" ],\n  \"url\" : [ \"/statistics/withdrawal/withdrawalRecord\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"#\" ],\n  \"visible\" : [ \"0\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:45:18');
INSERT INTO `sys_oper_log` VALUES ('15', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', '研发部门', '/system/menu/remove/2001', '139.227.73.78, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:45:37');
INSERT INTO `sys_oper_log` VALUES ('16', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '139.227.73.78, 172.16.0.101', '内网IP', '{\n  \"menuId\" : [ \"2100\" ],\n  \"parentId\" : [ \"2102\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"私人片库\" ],\n  \"url\" : [ \"/system/shipin/pshipin\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"#\" ],\n  \"visible\" : [ \"0\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:45:50');
INSERT INTO `sys_oper_log` VALUES ('17', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '139.227.73.78, 172.16.0.101', '内网IP', '{\n  \"menuId\" : [ \"2082\" ],\n  \"parentId\" : [ \"1\" ],\n  \"menuType\" : [ \"M\" ],\n  \"menuName\" : [ \"账务管理\" ],\n  \"url\" : [ \"#\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"fa fa-asterisk\" ],\n  \"visible\" : [ \"0\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:46:31');
INSERT INTO `sys_oper_log` VALUES ('18', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '139.227.73.78, 172.16.0.101', '内网IP', '{\n  \"menuId\" : [ \"2007\" ],\n  \"parentId\" : [ \"2101\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"公共片库\" ],\n  \"url\" : [ \"/system/shipin\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"system:shipin:view\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"#\" ],\n  \"visible\" : [ \"0\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:47:20');
INSERT INTO `sys_oper_log` VALUES ('19', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '139.227.73.78, 172.16.0.101', '内网IP', '{\n  \"menuId\" : [ \"2017\" ],\n  \"parentId\" : [ \"2082\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"类目管理\" ],\n  \"url\" : [ \"/system/category\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"system:category:view\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"#\" ],\n  \"visible\" : [ \"0\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:48:01');
INSERT INTO `sys_oper_log` VALUES ('20', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '139.227.73.78, 172.16.0.101', '内网IP', '{\n  \"menuId\" : [ \"2094\" ],\n  \"parentId\" : [ \"2082\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"交易信息\" ],\n  \"url\" : [ \"/system/trade\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"system:trade:view\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"#\" ],\n  \"visible\" : [ \"0\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:48:20');
INSERT INTO `sys_oper_log` VALUES ('21', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '139.227.73.78, 172.16.0.101', '内网IP', '{\n  \"menuId\" : [ \"2002\" ],\n  \"parentId\" : [ \"2082\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"投诉列表\" ],\n  \"url\" : [ \"/system/ts\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"system:ts:view\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"#\" ],\n  \"visible\" : [ \"0\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:48:45');
INSERT INTO `sys_oper_log` VALUES ('22', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '139.227.73.78, 172.16.0.101', '内网IP', '{\n  \"menuId\" : [ \"2012\" ],\n  \"parentId\" : [ \"2082\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"邀请码管理\" ],\n  \"url\" : [ \"/system/yqm\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"system:yqm:view\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"#\" ],\n  \"visible\" : [ \"0\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-06-20 15:48:53');

-- ----------------------------
-- Table structure for sys_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_order`;
CREATE TABLE `sys_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '订单ID',
  `money` int(10) unsigned NOT NULL COMMENT '实际金额，单位分\n',
  `price` int(11) NOT NULL COMMENT '原价，单位分\n',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '支付方式',
  `pay_no` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '流水号',
  `param` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '自定义参数',
  `pay_time` datetime DEFAULT NULL COMMENT '付款时间',
  `pay_tag` varchar(100) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '金额的备注',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品信息',
  `goods_snapshot` text COLLATE utf8mb4_bin COMMENT '商品快照',
  `open_id` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户的openId',
  `extension_user_id` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '推广人的id',
  `user_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='订单';

-- ----------------------------
-- Records of sys_order
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8mb4_bin DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-23 22:33:47', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2007');
INSERT INTO `sys_role_menu` VALUES ('2', '2008');
INSERT INTO `sys_role_menu` VALUES ('2', '2009');
INSERT INTO `sys_role_menu` VALUES ('2', '2010');
INSERT INTO `sys_role_menu` VALUES ('2', '2011');
INSERT INTO `sys_role_menu` VALUES ('2', '2012');
INSERT INTO `sys_role_menu` VALUES ('2', '2013');
INSERT INTO `sys_role_menu` VALUES ('2', '2014');
INSERT INTO `sys_role_menu` VALUES ('2', '2015');
INSERT INTO `sys_role_menu` VALUES ('2', '2016');

-- ----------------------------
-- Table structure for sys_short
-- ----------------------------
DROP TABLE IF EXISTS `sys_short`;
CREATE TABLE `sys_short` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `short_key` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '链接key',
  `short_url` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '链接地址',
  `long_url` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '长链接地址',
  `short_status` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_short
-- ----------------------------
INSERT INTO `sys_short` VALUES ('9', 'mQFJEj71', 'https://dwz.cn/pUMzLug3', 'http://yuluncc.top/?userid=mQFJEj71', '0', '2020-03-26 18:53:08', null);
INSERT INTO `sys_short` VALUES ('10', 'SfNYWe5c', 'https://dwz.cn/Hax4dgWG', 'http://yuluncc.top/?userid=SfNYWe5c', '0', '2020-04-09 18:20:24', null);
INSERT INTO `sys_short` VALUES ('11', 'WNz9dKGm', 'post', 'http://yuluncc.top/?userid=WNz9dKGm', '0', '2020-06-08 18:32:29', null);
INSERT INTO `sys_short` VALUES ('12', '0K9FpDRK', 'post', 'http://yuluncc.top/?userid=0K9FpDRK', '0', '2020-06-08 19:12:09', null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) COLLATE utf8mb4_bin NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) COLLATE utf8mb4_bin NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8mb4_bin DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8mb4_bin DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '密码',
  `salt` varchar(20) COLLATE utf8mb4_bin DEFAULT '' COMMENT '盐加密',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `payee` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收款人',
  `payee_account` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收款账号',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', 'admin', '00', 'ry@163.com', '15888888888', '0', '/profile/avatar/2020/06/20/b1d802253533f251435cb1a54b2471c2.png', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '139.227.73.78, 172.16.0.101', '2020-06-20 15:38:43', 'admin', '2018-03-16 11:33:00', 'ry', '2020-06-20 15:41:06', '管理员', null, null);
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员', null, null);
INSERT INTO `sys_user` VALUES ('100', '105', '1111', '的订单', '00', 'syst1em@163.com', '13902000000', '1', '', '79f944a0ae0dad2cced8e81fe47aeee1', '5aa645', '0', '2', '', null, 'admin', '2020-03-17 23:19:11', 'admin', '2020-03-17 23:35:32', '', null, null);
INSERT INTO `sys_user` VALUES ('101', '105', '11111', '11111', '00', 'syst2em@163.com', '13900000000', '1', '', '634df297ad5ee27f8ca538b76ee8b901', '9ca760', '0', '2', '127.0.0.1', '2020-03-17 23:36:10', 'admin', '2020-03-17 23:26:15', '', '2020-03-17 23:36:10', '代理用户', null, null);
INSERT INTO `sys_user` VALUES ('102', '105', '111111', '的订单', '00', 'system@163.com', '13152602082', '1', '', 'ad7ffc392edb700c6fe97c3065238de0', '139c73', '0', '2', '', null, 'admin', '2020-03-18 09:39:33', 'admin', '2020-03-18 09:44:08', '代理用户', null, null);
INSERT INTO `sys_user` VALUES ('103', '105', 'p', '4S1CowT0', '00', 'system@163.com', '18257824232', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '2', '', null, 'admin', '2020-03-18 09:45:03', '', null, '代理用户', null, null);
INSERT INTO `sys_user` VALUES ('104', '105', 'lizhi', 'lizhi', '00', 'system@163.com', '18069267499', '1', '', '8b8d063ca5746c8d1f25c1a6e32571b3', '65e222', '0', '2', '127.0.0.1', '2020-03-18 09:48:11', 'admin', '2020-03-18 09:48:01', '', '2020-03-18 09:48:11', '代理用户', null, null);
INSERT INTO `sys_user` VALUES ('105', '105', 'eFHfoWRK', '的订单', '00', 'system@163.com', '15186479998', '1', '', 'b9048ae7028838669fa29b64c5c2c396', '0d3c17', '0', '2', '127.0.0.1', '2020-03-22 22:51:35', 'admin', '2020-03-22 22:34:24', '', '2020-03-22 22:51:35', '代理用户', null, null);
INSERT INTO `sys_user` VALUES ('106', '105', 'lijiao', 'lijiao', '00', 'lijiao@163.com', '13999999999', '0', '', '540b139b585a861c68b25917c4d23d45', '54665a', '0', '2', '127.0.0.1', '2020-03-22 22:53:19', 'admin', '2020-03-22 22:52:58', '', '2020-03-22 22:53:19', null, null, null);
INSERT INTO `sys_user` VALUES ('107', '105', '13900000001', '11111', '00', '13900000001@163.com', '13900000001', '0', '', '21c77ae0f549232c4db199c579e3258f', '7215f5', '0', '2', '', null, 'admin', '2020-03-22 22:58:53', '', null, '1', null, null);
INSERT INTO `sys_user` VALUES ('108', '105', 'pMBzr6PX', 'pMBzr6PX', '00', 'system@163.com', '13021455977', '1', '/profile/avatar/2020/03/22/e57f73eca09c1a8f583e6e7029f39d4c.png', '46d8fdae95df9c9ef0cb9111c9bfbab7', '34ae05', '0', '2', '127.0.0.1', '2020-03-22 23:44:48', 'admin', '2020-03-22 23:02:52', '', '2020-03-22 23:44:48', '代理用户', null, null);
INSERT INTO `sys_user` VALUES ('109', '105', 'HvlhdQp4', 'HvlhdQp4', '00', 'system@163.com', '17108940375', '1', '', '3d9986f5e4bb4e50635e7f7f5f920056', 'f37943', '0', '2', '127.0.0.1', '2020-03-23 11:12:15', 'admin', '2020-03-23 11:12:10', '', '2020-03-23 11:12:15', '代理用户', null, null);
INSERT INTO `sys_user` VALUES ('110', '105', 'PSJGU5OG', 'PSJGU5OG', '00', 'system@163.com', '15046844832', '1', '', '2ba45bed2a36228a546ae6ae0d30fad0', '18e195', '0', '2', '127.0.0.1', '2020-03-23 13:37:06', 'admin', '2020-03-23 13:37:00', '', '2020-03-23 13:37:06', '代理用户', null, null);
INSERT INTO `sys_user` VALUES ('111', '105', 'gCCs9Lry', 'gCCs9Lry', '00', 'system@163.com', '13686297920', '1', '', 'c2562e327b14270876e0b19050fc7009', '479e79', '0', '2', '', null, 'admin', '2020-03-23 13:39:54', '', null, '代理用户', null, null);
INSERT INTO `sys_user` VALUES ('112', '105', '6eaJSulU', '6eaJSulU', '00', 'system@163.com', '17002456229', '1', '', '1ea0ef0f8a9da4239a60008a08c1a48f', 'd812fd', '0', '2', '', null, 'admin', '2020-03-23 13:48:19', '', null, '代理用户', null, null);
INSERT INTO `sys_user` VALUES ('113', '105', '0DwXA9Cg', '0DwXA9Cg', '00', 'system@163.com', '18289621212', '1', '', 'fe910c99471f2eab9aa381f42152aef4', '3435a4', '0', '2', '', null, 'admin', '2020-03-23 13:51:02', '', null, '代理用户', null, null);
INSERT INTO `sys_user` VALUES ('114', '105', 'n0TaVdrW', 'n0TaVdrW', '00', 'system@163.com', '15288995473', '1', '', 'd02864daaa87e833744534b6804079c5', 'f0ff2a', '0', '2', '', null, 'admin', '2020-03-23 13:54:18', '', null, '代理用户', null, null);
INSERT INTO `sys_user` VALUES ('115', '105', 'ZEVcL34H', 'ZEVcL34H', '00', 'system@163.com', '17082524040', '1', '', '155aff1df444d1d51abd71ec0daf85fd', 'f3f882', '0', '2', '', null, 'admin', '2020-03-23 13:58:32', '', null, '代理用户', null, null);
INSERT INTO `sys_user` VALUES ('116', '105', 'EGbJ2hg0', 'EGbJ2hg0', '00', 'system@163.com', '17015773313', '1', '', '30492cd20fce3acb454d6ca98c9f8f27', '98fb0b', '0', '2', '', null, 'admin', '2020-03-23 14:52:22', '', null, '代理用户', null, null);
INSERT INTO `sys_user` VALUES ('118', '105', 'DwpqVNYS', 'DwpqVNYS', '00', 'system@163.com', '18070683074', '1', '', '668d83745bac4035b5698d5c21e58e37', '19a570', '0', '2', '', null, 'admin', '2020-03-23 15:16:16', '', null, '代理用户', null, null);
INSERT INTO `sys_user` VALUES ('119', '105', 'yHUGMiTt', 'yHUGMiTt', '00', 'system@163.com', '17535027943', '1', '', 'deb81e1cab3ed05f817b7272b2d7c432', '8fb8fb', '0', '2', '127.0.0.1', '2020-03-23 16:55:24', 'admin', '2020-03-23 15:19:19', '', '2020-03-24 12:46:52', '代理用户', null, null);
INSERT INTO `sys_user` VALUES ('120', '105', '13aA5iX6', '13aA5iX6', '00', 'system@163.com', '14784152565', '1', '', '6633e269189935a051b3296e39f3a024', 'd96f4d', '0', '2', '139.227.72.2', '2020-03-26 18:36:07', 'admin', '2020-03-26 18:36:03', '', '2020-03-26 18:36:07', '代理用户', '13aA5iX6', '13aA5iX6');
INSERT INTO `sys_user` VALUES ('121', '105', 'mQFJEj71', 'mQFJEj71', '00', 'system@163.com', '13388186271', '1', '', '5cabf52c2142d4edda7d3221a364c9ff', '9905d1', '0', '2', '139.227.72.2', '2020-03-26 18:53:10', 'admin', '2020-03-26 18:53:06', '', '2020-03-26 18:53:10', '代理用户', 'mQFJEj71', 'mQFJEj71');
INSERT INTO `sys_user` VALUES ('122', '105', 'SfNYWe5c', 'SfNYWe5c', '00', 'system@163.com', '17105303609', '1', '', '127da095e43042ec8049a8d2263736b4', '71a8c5', '0', '2', '223.166.134.39', '2020-04-13 21:30:21', 'admin', '2020-04-09 18:20:21', '', '2020-04-13 21:30:21', '代理用户', 'SfNYWe5c', 'SfNYWe5c');
INSERT INTO `sys_user` VALUES ('123', '105', '13900000002', '的订单', '00', 'lizhichange@gmail.com', '13900000002', '0', '', '56f4c5ac0707822481612997bebace68', 'e28f25', '0', '2', '', null, 'admin', '2020-06-07 11:16:06', '', null, 'dd', null, null);
INSERT INTO `sys_user` VALUES ('124', '105', 'LwrXdgu8', 'LwrXdgu8', '00', 'system@163.com', '13356185603', '1', '', '976a82adbb951756d80616c60b4d80d2', '1548df', '0', '2', '', null, 'admin', '2020-06-08 17:43:30', '', null, '代理用户', 'LwrXdgu8', 'LwrXdgu8');
INSERT INTO `sys_user` VALUES ('125', '105', 'e79EH63o', 'e79EH63o', '00', 'system@163.com', '17343151168', '1', '', 'f1628388849283851f01a4832caf36c2', '4f8733', '0', '2', '127.0.0.1', '2020-06-08 17:57:08', 'admin', '2020-06-08 17:56:12', '', '2020-06-08 17:57:08', '代理用户', 'e79EH63o', 'e79EH63o');
INSERT INTO `sys_user` VALUES ('126', '105', 'F6Si1pHp', 'F6Si1pHp', '00', 'system@163.com', '13689741916', '1', '', '01a48fa9aa052218bc91b19db4f266b9', '83647b', '0', '2', '', null, 'admin', '2020-06-08 17:58:17', '', null, '代理用户', 'F6Si1pHp', 'F6Si1pHp');
INSERT INTO `sys_user` VALUES ('127', '105', '6fzuYVKL', '6fzuYVKL', '00', 'system@163.com', '18781805152', '1', '', '7b74874909d8cf6dca16727f7cfda26b', '29618b', '0', '2', '', null, 'admin', '2020-06-08 18:28:05', '', null, '代理用户', '6fzuYVKL', '6fzuYVKL');
INSERT INTO `sys_user` VALUES ('128', '105', 'WNz9dKGm', 'WNz9dKGm', '00', 'system@163.com', '18926421343', '1', '', 'c9dbb7c45fa638cbcdc514638ea0cea2', '7d2311', '0', '2', '', null, 'admin', '2020-06-08 18:31:02', '', null, '代理用户', 'WNz9dKGm', 'WNz9dKGm');
INSERT INTO `sys_user` VALUES ('129', '105', '0K9FpDRK', '0K9FpDRK', '00', 'system@163.com', '17275191735', '1', '', '55dbc34e101b06f23495178c1eae1f75', 'dcaf9f', '0', '2', '', null, 'admin', '2020-06-08 18:36:14', '', null, '代理用户', '0K9FpDRK', '0K9FpDRK');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('ed953e15-5bbd-47cb-88c3-339d231fdcca', 'admin', '研发部门', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', 'on_line', '2020-06-20 15:38:39', '2020-06-20 15:48:16', '1800000');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('100', '4');
INSERT INTO `sys_user_post` VALUES ('101', '4');
INSERT INTO `sys_user_post` VALUES ('102', '4');
INSERT INTO `sys_user_post` VALUES ('103', '4');
INSERT INTO `sys_user_post` VALUES ('104', '4');
INSERT INTO `sys_user_post` VALUES ('105', '4');
INSERT INTO `sys_user_post` VALUES ('106', '4');
INSERT INTO `sys_user_post` VALUES ('107', '4');
INSERT INTO `sys_user_post` VALUES ('108', '4');
INSERT INTO `sys_user_post` VALUES ('109', '4');
INSERT INTO `sys_user_post` VALUES ('110', '4');
INSERT INTO `sys_user_post` VALUES ('111', '4');
INSERT INTO `sys_user_post` VALUES ('120', '4');
INSERT INTO `sys_user_post` VALUES ('121', '4');
INSERT INTO `sys_user_post` VALUES ('122', '4');
INSERT INTO `sys_user_post` VALUES ('123', '2');
INSERT INTO `sys_user_post` VALUES ('124', '4');
INSERT INTO `sys_user_post` VALUES ('125', '4');
INSERT INTO `sys_user_post` VALUES ('126', '4');
INSERT INTO `sys_user_post` VALUES ('127', '4');
INSERT INTO `sys_user_post` VALUES ('128', '4');
INSERT INTO `sys_user_post` VALUES ('129', '4');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('100', '2');
INSERT INTO `sys_user_role` VALUES ('101', '2');
INSERT INTO `sys_user_role` VALUES ('102', '2');
INSERT INTO `sys_user_role` VALUES ('105', '2');
INSERT INTO `sys_user_role` VALUES ('106', '2');
INSERT INTO `sys_user_role` VALUES ('107', '2');
INSERT INTO `sys_user_role` VALUES ('108', '2');
INSERT INTO `sys_user_role` VALUES ('109', '2');
INSERT INTO `sys_user_role` VALUES ('110', '2');
INSERT INTO `sys_user_role` VALUES ('111', '2');
INSERT INTO `sys_user_role` VALUES ('120', '2');
INSERT INTO `sys_user_role` VALUES ('121', '2');
INSERT INTO `sys_user_role` VALUES ('122', '2');
INSERT INTO `sys_user_role` VALUES ('123', '2');
INSERT INTO `sys_user_role` VALUES ('124', '2');
INSERT INTO `sys_user_role` VALUES ('125', '2');
INSERT INTO `sys_user_role` VALUES ('126', '2');
INSERT INTO `sys_user_role` VALUES ('127', '2');
INSERT INTO `sys_user_role` VALUES ('128', '2');
INSERT INTO `sys_user_role` VALUES ('129', '2');

-- ----------------------------
-- Table structure for sys_web_main
-- ----------------------------
DROP TABLE IF EXISTS `sys_web_main`;
CREATE TABLE `sys_web_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `main_url` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '链接地址',
  `main_status` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_web_main
-- ----------------------------
INSERT INTO `sys_web_main` VALUES ('7', 'http://127.0.0.1:8083', '0', '2020-04-08 22:04:04', '2020-04-24 23:08:38');

-- ----------------------------
-- Table structure for sys_wechat_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_wechat_config`;
CREATE TABLE `sys_wechat_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `config_code` varchar(32) NOT NULL COMMENT '微信配置标识',
  `env_type` varchar(16) NOT NULL COMMENT '环境类型',
  `app_id` varchar(32) NOT NULL COMMENT '微信appid',
  `appsecret` varchar(255) NOT NULL COMMENT '微信 appsecret',
  `mch_id` varchar(32) DEFAULT NULL COMMENT '商户id',
  `sign_key` varchar(255) DEFAULT NULL COMMENT '签名key',
  `cert_file` varchar(255) DEFAULT NULL COMMENT '证书地址',
  `token` varchar(32) DEFAULT NULL COMMENT 'token令牌',
  `encoding_aes_key` varchar(64) DEFAULT NULL COMMENT '消息加解密密钥',
  `gmt_create` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建日期',
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uq_idx_001` (`config_code`,`env_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_wechat_config
-- ----------------------------
INSERT INTO `sys_wechat_config` VALUES ('10', 'WY_FULI', 'dev', 'wx590af156c3a3eae9', '8af481db51cd509f26c857a75712c9ce', null, '22f5c38598681b0d5179d84fc3bc576a', null, null, null, '2016-12-13 18:08:57', '2020-04-01 21:37:07', null, null);
INSERT INTO `sys_wechat_config` VALUES ('11', 'WY_FULI', 'druid', 'wx590af156c3a3eae9', '8af481db51cd509f26c857a75712c9ce', null, '22f5c38598681b0d5179d84fc3bc576a', null, null, null, '2020-04-01 21:07:41', '2020-04-01 21:37:07', null, null);
INSERT INTO `sys_wechat_config` VALUES ('12', 'FULIHUI_YOUFULI', 'dev', 'wx851c20b0d27a586b', '666155ee0ef3dbd6224447d000483298', '1487632962', '22f5c38598681b0d5179d84fc3bc576a', '/home/fulihui/secure/youfuli_apiclient_cert.p12', 'EvIYhBs2ZuM0EvjScv2J9Ad2dbIlaZSU', 'lxOjHNlrewtzPEHCBh7boSmq9jlAe7JF5CINVf2a8IZ', '2017-11-24 17:24:50', '2020-04-01 21:37:07', null, null);
INSERT INTO `sys_wechat_config` VALUES ('13', 'FULIHUI_YOUFULI', 'druid', 'wx851c20b0d27a586b', '666155ee0ef3dbd6224447d000483298', '1487632962', '22f5c38598681b0d5179d84fc3bc576a', '/home/fulihui/secure/youfuli_apiclient_cert.p12', 'EvIYhBs2ZuM0EvjScv2J9Ad2dbIlaZSU', 'lxOjHNlrewtzPEHCBh7boSmq9jlAe7JF5CINVf2a8IZ', '2017-11-24 17:24:50', '2020-04-01 21:37:07', null, null);

-- ----------------------------
-- Table structure for sys_wechat_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_wechat_token`;
CREATE TABLE `sys_wechat_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `appid` varchar(64) NOT NULL COMMENT '微信公众号标识',
  `secret` varchar(128) DEFAULT NULL,
  `token` varchar(512) NOT NULL COMMENT '凭证',
  `token_type` varchar(32) NOT NULL COMMENT '凭证类型',
  `expires_in` int(11) NOT NULL COMMENT '凭证有效时间，单位：秒',
  `gmt_create` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_wechat_token
-- ----------------------------

-- ----------------------------
-- Table structure for trade
-- ----------------------------
DROP TABLE IF EXISTS `trade`;
CREATE TABLE `trade` (
  `trade_no` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '交易号',
  `payer_type` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '付款方类型',
  `payer` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '付款方',
  `payee_type` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '收款方类型',
  `payee` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '收款方',
  `amount` bigint(20) NOT NULL COMMENT '金额',
  `state` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '状态',
  `category` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '交易分类',
  `pay_type` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '支付方式',
  `third_trade_no` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '外部交易号',
  `description` varchar(512) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `remark` varchar(512) CHARACTER SET utf8 DEFAULT NULL COMMENT '标记',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `modified_by` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '修改人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `payee_no` varchar(100) DEFAULT NULL COMMENT '收款账号',
  PRIMARY KEY (`trade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of trade
-- ----------------------------

-- ----------------------------
-- Table structure for ts
-- ----------------------------
DROP TABLE IF EXISTS `ts`;
CREATE TABLE `ts` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ip` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ip地址',
  `zt` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
  `neirong` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '内容',
  `shijian` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '时间',
  `typeto` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `sid` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `userid` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `open_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ts
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_user_detail`;
CREATE TABLE `t_user_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL COMMENT '用户唯一标识',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `name` varchar(32) DEFAULT NULL COMMENT '用户姓名',
  `gender` char(1) DEFAULT NULL COMMENT '用户性别',
  `id_card` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `mobile_no` varchar(16) DEFAULT NULL COMMENT '手机号',
  `birthday` varchar(8) DEFAULT NULL COMMENT '生日yyyyMMdd',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `modified_by` varchar(32) DEFAULT NULL,
  `user_source` varchar(255) DEFAULT NULL COMMENT '用户注册来源',
  `user_referee` varchar(255) DEFAULT NULL COMMENT '用户推荐人',
  `user_referee_ids` varchar(255) DEFAULT '',
  `marker` varchar(255) DEFAULT NULL,
  `reg_date` date DEFAULT NULL COMMENT '注册时间',
  `level` int(11) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL COMMENT '用户头像地址',
  `reg_url` varchar(255) DEFAULT NULL COMMENT '注册页面路径',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `user_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `user_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=319859 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of t_user_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_wechat_auth
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat_auth`;
CREATE TABLE `t_wechat_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `open_id` varchar(64) NOT NULL COMMENT 'open_id',
  `user_id` varchar(64) NOT NULL COMMENT '主体唯一标识',
  `user_type` varchar(32) NOT NULL COMMENT '主体类型',
  `appid` varchar(32) NOT NULL COMMENT 'appid',
  `unionid` varchar(64) DEFAULT NULL COMMENT 'unionid',
  `subscribe` varchar(32) DEFAULT '\\0' COMMENT '是否关注',
  `gmt_create` datetime NOT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `modified_by` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `open_id` (`open_id`),
  KEY `user_index` (`user_id`),
  KEY `open_id_index` (`open_id`)
) ENGINE=InnoDB AUTO_INCREMENT=319081 DEFAULT CHARSET=utf8 COMMENT='小程序授权信息表\r\n';

-- ----------------------------
-- Records of t_wechat_auth
-- ----------------------------
INSERT INTO `t_wechat_auth` VALUES ('319078', 'oE-QCw1sLCEA19BxvtPFnaVKmzJg', 'ce76933d-24b5-4692-ae32-fbf3f10935b9', '1', 'wx851c20b0d27a586b', 'odN-NwA2ixxV2hzl09jM2n2eoTSk', '\\0', '2020-04-11 14:05:42', null, '2020-04-11 14:05:42', null);
INSERT INTO `t_wechat_auth` VALUES ('319079', 'oE-QCw1BX_3TiPLJ68bOs04KLmuQ', '4ed66873-93da-4292-b1c9-0f0740a419a4', '1', 'wx851c20b0d27a586b', 'odN-NwO12CJEGiGvy1UAtdjgIwTg', '\\0', '2020-04-13 11:52:36', null, '2020-04-13 11:52:36', null);
INSERT INTO `t_wechat_auth` VALUES ('319080', 'oE-QCw8fkoCzw5hNbH_fur4qIgdg', '3e57ac79-abb2-407b-b739-440c61c91e4c', '1', 'wx851c20b0d27a586b', 'odN-NwIXtuN4tJNja-7gQ02vtAv0', '\\0', '2020-04-13 12:21:26', null, '2020-04-13 12:21:26', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户ID',
  `name` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名',
  `tx` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户头像',
  `pass` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户密码',
  `tixian` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '提现账号',
  `qq` varchar(12) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系QQ',
  `weixin` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '微信账户',
  `txname` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收款姓名',
  `shijian` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '注册时间',
  `money` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '账户余额',
  `zt` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '审核状态',
  `tjr` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '推荐人',
  `nikname` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户昵称',
  `txmoney` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '历史提现金额',
  `txfl` varchar(3) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '提现费率',
  `yqm` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `ypass` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `qr` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for yqm
-- ----------------------------
DROP TABLE IF EXISTS `yqm`;
CREATE TABLE `yqm` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userid` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '代理id',
  `yqm` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邀请码',
  `shijian` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '时间',
  `name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '使用者',
  `zt` varchar(3) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yqm
-- ----------------------------
INSERT INTO `yqm` VALUES ('28', 'admin', '13aA5iX6', '2020-03-26 18:35:44', '13aA5iX6', '1', '2020-03-26 18:35:44', '2020-03-26 18:36:03');
INSERT INTO `yqm` VALUES ('29', 'admin', 'mQFJEj71', '2020-03-26 18:52:46', 'mQFJEj71', '1', '2020-03-26 18:52:46', '2020-03-26 18:53:06');
INSERT INTO `yqm` VALUES ('30', 'admin', 'SfNYWe5c', '2020-04-09 18:19:53', 'SfNYWe5c', '1', '2020-04-09 18:19:53', '2020-04-09 18:20:21');
INSERT INTO `yqm` VALUES ('31', 'admin', 'LwrXdgu8', '2020-06-07 10:58:36', 'LwrXdgu8', '1', '2020-06-07 10:58:36', '2020-06-08 17:43:36');
INSERT INTO `yqm` VALUES ('32', 'admin', 'e79EH63o', '2020-06-08 17:55:57', 'e79EH63o', '1', '2020-06-08 17:55:57', '2020-06-08 17:56:12');
INSERT INTO `yqm` VALUES ('33', 'admin', 'F6Si1pHp', '2020-06-08 17:57:52', 'F6Si1pHp', '1', '2020-06-08 17:57:52', '2020-06-08 17:58:20');
INSERT INTO `yqm` VALUES ('34', 'admin', '6fzuYVKL', '2020-06-08 18:27:47', '6fzuYVKL', '1', '2020-06-08 18:27:47', '2020-06-08 18:28:05');
INSERT INTO `yqm` VALUES ('35', 'admin', 'WNz9dKGm', '2020-06-08 18:30:37', 'WNz9dKGm', '1', '2020-06-08 18:30:37', '2020-06-08 18:31:02');
INSERT INTO `yqm` VALUES ('36', 'admin', '0K9FpDRK', '2020-06-08 18:35:44', '0K9FpDRK', '1', '2020-06-08 18:35:44', '2020-06-08 18:36:14');