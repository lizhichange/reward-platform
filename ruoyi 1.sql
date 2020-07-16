/*
Navicat MySQL Data Transfer

Source Server         : rm-uf6169a7q626pc7pzuo.mysql.rds.aliyuncs.com
Source Server Version : 50728
Source Host           : rm-uf6169a7q626pc7pzuo.mysql.rds.aliyuncs.com:3306
Source Database       : ruoyi

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2020-07-16 17:24:47
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
) ENGINE=InnoDB AUTO_INCREMENT=21735 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('21734', 'admin', '120', '1', '2020-07-12 10:53:55', 'SYSTEM', '2020-07-15 20:56:07', 'SYSTEM', 'PROMOTION_MERCHANT');

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
) ENGINE=InnoDB AUTO_INCREMENT=113956 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of account_detail
-- ----------------------------
INSERT INTO `account_detail` VALUES ('113948', 'admin', '20', '0', '返利', null, 'ORDER_REBATE', '551189515981557760', '2020-07-12 10:53:55', '2020-07-12 10:53:55', 'SYSTEM');
INSERT INTO `account_detail` VALUES ('113949', 'admin', '10', '0', '返利', null, 'ORDER_AUTHOR_REBATE', '551189515981557760', '2020-07-12 10:53:55', '2020-07-12 10:53:55', 'SYSTEM');
INSERT INTO `account_detail` VALUES ('113950', 'admin', '20', '0', '返利', null, 'ORDER_REBATE', '551233546623127552', '2020-07-12 13:48:43', '2020-07-12 13:48:43', 'SYSTEM');
INSERT INTO `account_detail` VALUES ('113951', 'admin', '10', '0', '返利', null, 'ORDER_AUTHOR_REBATE', '551233546623127552', '2020-07-12 13:48:43', '2020-07-12 13:48:43', 'SYSTEM');
INSERT INTO `account_detail` VALUES ('113952', 'admin', '20', '0', '返利', null, 'ORDER_REBATE', '551234145007702016', '2020-07-12 13:51:05', '2020-07-12 13:51:05', 'SYSTEM');
INSERT INTO `account_detail` VALUES ('113953', 'admin', '10', '0', '返利', null, 'ORDER_AUTHOR_REBATE', '551234145007702016', '2020-07-12 13:51:05', '2020-07-12 13:51:05', 'SYSTEM');
INSERT INTO `account_detail` VALUES ('113954', 'admin', '20', '0', '返利', null, 'ORDER_REBATE', '552428275725504512', '2020-07-15 20:56:08', '2020-07-15 20:56:08', 'SYSTEM');
INSERT INTO `account_detail` VALUES ('113955', 'admin', '10', '0', '返利', null, 'ORDER_AUTHOR_REBATE', '552428275725504512', '2020-07-15 20:56:08', '2020-07-15 20:56:08', 'SYSTEM');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='类目表';

-- ----------------------------
-- Records of sys_category
-- ----------------------------
INSERT INTO `sys_category` VALUES ('100', '0', '0', '大类目', '0', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-06-20 18:27:55');
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
INSERT INTO `sys_category` VALUES ('214', '100', '0,100', '少女', '9', '0', '0', 'admin', '2020-03-20 18:26:16', '', '2020-06-20 18:23:47');
INSERT INTO `sys_category` VALUES ('215', '100', '0,100', '少妇', '10', '0', '0', 'admin', '2020-03-20 18:26:25', '', '2020-06-20 18:23:56');
INSERT INTO `sys_category` VALUES ('216', '100', '0,100', '女同', '11', '0', '0', 'admin', '2020-03-20 18:26:33', '', '2020-06-20 18:24:02');
INSERT INTO `sys_category` VALUES ('217', '100', '0,100', '野战', '12', '0', '0', 'admin', '2020-03-20 18:26:39', '', '2020-06-20 18:24:52');
INSERT INTO `sys_category` VALUES ('218', '100', '0,100', '自慰', '13', '0', '0', 'admin', '2020-03-20 18:26:46', '', '2020-06-20 18:25:01');
INSERT INTO `sys_category` VALUES ('219', '100', '0,100', '巨乳', '14', '0', '0', 'admin', '2020-03-20 18:26:54', '', '2020-06-20 18:25:10');
INSERT INTO `sys_category` VALUES ('220', '100', '0,100', '萝莉', '15', '0', '0', 'admin', '2020-03-20 18:27:01', '', '2020-06-20 18:25:21');
INSERT INTO `sys_category` VALUES ('221', '100', '0,100', '人妻', '16', '0', '0', 'admin', '2020-03-20 18:27:09', '', '2020-06-20 18:27:02');
INSERT INTO `sys_category` VALUES ('222', '100', '0,100', '动漫', '17', '1', '0', 'admin', '2020-03-20 18:27:16', '', '2020-07-15 20:54:58');
INSERT INTO `sys_category` VALUES ('223', '100', '0,100', '直播', '18', '1', '0', 'admin', '2020-03-20 18:27:23', '', '2020-07-15 20:47:05');
INSERT INTO `sys_category` VALUES ('224', '100', '0,100', '三级', '19', '1', '0', 'admin', '2020-03-20 18:27:30', '', '2020-07-15 20:54:50');
INSERT INTO `sys_category` VALUES ('225', '100', '0,100', '另类', '20', '1', '0', 'admin', '2020-03-20 18:27:38', '', '2020-07-15 20:54:41');
INSERT INTO `sys_category` VALUES ('226', '100', '0,100', '偷拍', '18', '0', '0', '', '2020-06-20 18:30:21', '', null);
INSERT INTO `sys_category` VALUES ('227', '100', '0,100', '偷情', '1', '0', '0', '', '2020-06-20 18:30:33', '', null);
INSERT INTO `sys_category` VALUES ('228', '100', '0,100', '素人', '2', '0', '0', '', '2020-06-20 18:31:54', '', null);
INSERT INTO `sys_category` VALUES ('229', '100', '0,100', '自拍', '3', '0', '0', '', '2020-06-20 18:32:49', '', null);
INSERT INTO `sys_category` VALUES ('230', '100', '0,100', '口交', '3', '0', '0', '', '2020-06-20 18:33:23', '', null);
INSERT INTO `sys_category` VALUES ('272', '100', '0,100', '韩国伦理', '1', '0', '0', 'admin', '2020-07-15 20:29:52', '', null);
INSERT INTO `sys_category` VALUES ('273', '100', '0,100', '网红主播', '1', '0', '0', 'admin', '2020-07-15 20:29:52', '', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='参数配置表';

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
INSERT INTO `sys_config` VALUES ('8', '', 'admin', '{\"main\":\"1\"}', 'N', 'admin', '2020-06-12 00:11:44', '', '2020-07-12 10:44:31', null);
INSERT INTO `sys_config` VALUES ('9', '分享标题', 'share.title', '點擊觀看,完整影視', 'N', 'admin', '2020-06-21 22:29:35', '', null, null);
INSERT INTO `sys_config` VALUES ('10', '分享内容', 'share.desc', '今日更新，拉無人免提', 'N', 'admin', '2020-06-21 22:30:09', '', null, null);
INSERT INTO `sys_config` VALUES ('11', '微信授权域名', 'wxAuthUrl', 'http://auth.grkfcs.cn', 'N', 'admin', '2020-06-27 00:11:29', 'admin', '2020-06-27 00:12:31', '微信授权域名');

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
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('1', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-20 18:19:55');
INSERT INTO `sys_logininfor` VALUES ('2', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-20 21:47:58');
INSERT INTO `sys_logininfor` VALUES ('3', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-06-20 22:15:54');
INSERT INTO `sys_logininfor` VALUES ('4', 'QC6JpwMg', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-20 22:16:08');
INSERT INTO `sys_logininfor` VALUES ('5', 'QC6JpwMg', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-06-20 22:16:21');
INSERT INTO `sys_logininfor` VALUES ('6', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-20 22:16:23');
INSERT INTO `sys_logininfor` VALUES ('7', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-06-20 22:16:50');
INSERT INTO `sys_logininfor` VALUES ('8', 'QC6JpwMg', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-20 22:16:54');
INSERT INTO `sys_logininfor` VALUES ('9', 'QC6JpwMg', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-06-20 22:17:43');
INSERT INTO `sys_logininfor` VALUES ('10', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-20 22:17:44');
INSERT INTO `sys_logininfor` VALUES ('11', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-21 22:24:35');
INSERT INTO `sys_logininfor` VALUES ('12', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-23 13:22:16');
INSERT INTO `sys_logininfor` VALUES ('13', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-23 13:27:07');
INSERT INTO `sys_logininfor` VALUES ('14', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-23 13:32:29');
INSERT INTO `sys_logininfor` VALUES ('15', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-23 14:10:10');
INSERT INTO `sys_logininfor` VALUES ('16', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-23 16:59:27');
INSERT INTO `sys_logininfor` VALUES ('19', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-24 14:03:14');
INSERT INTO `sys_logininfor` VALUES ('20', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-26 18:35:30');
INSERT INTO `sys_logininfor` VALUES ('21', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-06-26 18:36:38');
INSERT INTO `sys_logininfor` VALUES ('22', 'i8NavF5U', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-26 18:36:50');
INSERT INTO `sys_logininfor` VALUES ('23', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-26 18:40:40');
INSERT INTO `sys_logininfor` VALUES ('24', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-06-26 18:41:21');
INSERT INTO `sys_logininfor` VALUES ('25', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-26 18:41:32');
INSERT INTO `sys_logininfor` VALUES ('26', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-06-26 18:41:34');
INSERT INTO `sys_logininfor` VALUES ('27', 'R4zrXRJc', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-26 18:41:37');
INSERT INTO `sys_logininfor` VALUES ('28', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-26 18:48:20');
INSERT INTO `sys_logininfor` VALUES ('29', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-06-26 18:48:38');
INSERT INTO `sys_logininfor` VALUES ('30', 'LEd2A7Es', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-26 18:48:52');
INSERT INTO `sys_logininfor` VALUES ('31', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-26 21:02:51');
INSERT INTO `sys_logininfor` VALUES ('32', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-26 23:36:40');
INSERT INTO `sys_logininfor` VALUES ('33', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 00:50:14');
INSERT INTO `sys_logininfor` VALUES ('34', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 12:42:04');
INSERT INTO `sys_logininfor` VALUES ('35', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 13:34:35');
INSERT INTO `sys_logininfor` VALUES ('36', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 14:19:02');
INSERT INTO `sys_logininfor` VALUES ('37', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 14:25:46');
INSERT INTO `sys_logininfor` VALUES ('38', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 14:31:17');
INSERT INTO `sys_logininfor` VALUES ('39', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 14:44:20');
INSERT INTO `sys_logininfor` VALUES ('40', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 14:49:13');
INSERT INTO `sys_logininfor` VALUES ('41', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 14:51:46');
INSERT INTO `sys_logininfor` VALUES ('42', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 14:57:14');
INSERT INTO `sys_logininfor` VALUES ('43', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 16:37:16');
INSERT INTO `sys_logininfor` VALUES ('44', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 19:45:49');
INSERT INTO `sys_logininfor` VALUES ('45', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 21:18:32');
INSERT INTO `sys_logininfor` VALUES ('46', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 22:25:41');
INSERT INTO `sys_logininfor` VALUES ('47', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 23:01:52');
INSERT INTO `sys_logininfor` VALUES ('48', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-28 12:59:07');
INSERT INTO `sys_logininfor` VALUES ('49', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-28 15:55:14');
INSERT INTO `sys_logininfor` VALUES ('50', 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-29 21:15:45');
INSERT INTO `sys_logininfor` VALUES ('51', 'admin', '60.222.152.10, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-05 08:52:05');
INSERT INTO `sys_logininfor` VALUES ('52', 'admin', '60.222.152.10, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-05 09:26:56');
INSERT INTO `sys_logininfor` VALUES ('53', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-05 18:20:21');
INSERT INTO `sys_logininfor` VALUES ('54', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-05 20:40:14');
INSERT INTO `sys_logininfor` VALUES ('55', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-05 23:04:32');
INSERT INTO `sys_logininfor` VALUES ('56', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-06 16:01:12');
INSERT INTO `sys_logininfor` VALUES ('57', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-06 17:41:55');
INSERT INTO `sys_logininfor` VALUES ('58', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-06 18:46:48');
INSERT INTO `sys_logininfor` VALUES ('59', 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-06 21:15:22');
INSERT INTO `sys_logininfor` VALUES ('60', 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-06 21:19:47');
INSERT INTO `sys_logininfor` VALUES ('61', 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-06 21:48:12');
INSERT INTO `sys_logininfor` VALUES ('62', 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 07:41:39');
INSERT INTO `sys_logininfor` VALUES ('63', 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 08:09:03');
INSERT INTO `sys_logininfor` VALUES ('64', 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 08:40:48');
INSERT INTO `sys_logininfor` VALUES ('65', 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 08:47:11');
INSERT INTO `sys_logininfor` VALUES ('66', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 11:10:21');
INSERT INTO `sys_logininfor` VALUES ('67', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 11:39:48');
INSERT INTO `sys_logininfor` VALUES ('68', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 11:49:12');
INSERT INTO `sys_logininfor` VALUES ('69', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 11:54:28');
INSERT INTO `sys_logininfor` VALUES ('70', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-07-07 12:13:52');
INSERT INTO `sys_logininfor` VALUES ('71', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 12:13:53');
INSERT INTO `sys_logininfor` VALUES ('72', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 14:18:21');
INSERT INTO `sys_logininfor` VALUES ('73', 'admin', '118.194.240.181, 172.16.0.101', '内网IP', 'Firefox 7', 'Windows 10', '0', '登录成功', '2020-07-07 14:25:25');
INSERT INTO `sys_logininfor` VALUES ('74', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 15:29:11');
INSERT INTO `sys_logininfor` VALUES ('75', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 17:04:41');
INSERT INTO `sys_logininfor` VALUES ('76', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 18:13:47');
INSERT INTO `sys_logininfor` VALUES ('77', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 18:52:57');
INSERT INTO `sys_logininfor` VALUES ('78', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 19:38:54');
INSERT INTO `sys_logininfor` VALUES ('79', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 20:37:23');
INSERT INTO `sys_logininfor` VALUES ('80', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 21:40:36');
INSERT INTO `sys_logininfor` VALUES ('81', 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-08 16:49:33');
INSERT INTO `sys_logininfor` VALUES ('82', 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-08 19:37:46');
INSERT INTO `sys_logininfor` VALUES ('83', 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-07-08 19:37:51');
INSERT INTO `sys_logininfor` VALUES ('84', 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-08 19:38:46');
INSERT INTO `sys_logininfor` VALUES ('85', 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-08 20:31:05');
INSERT INTO `sys_logininfor` VALUES ('86', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-08 22:09:56');
INSERT INTO `sys_logininfor` VALUES ('87', 'admin', '115.205.170.40, 172.16.0.101', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-07-10 00:45:14');
INSERT INTO `sys_logininfor` VALUES ('88', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-10 23:04:04');
INSERT INTO `sys_logininfor` VALUES ('89', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 10:34:09');
INSERT INTO `sys_logininfor` VALUES ('90', 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 10:42:53');
INSERT INTO `sys_logininfor` VALUES ('91', 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 14:02:53');
INSERT INTO `sys_logininfor` VALUES ('92', 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 14:03:51');
INSERT INTO `sys_logininfor` VALUES ('93', 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 14:39:57');
INSERT INTO `sys_logininfor` VALUES ('94', 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 14:46:12');
INSERT INTO `sys_logininfor` VALUES ('95', 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 14:50:23');
INSERT INTO `sys_logininfor` VALUES ('96', 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 14:53:54');
INSERT INTO `sys_logininfor` VALUES ('97', 'admin', '117.151.138.229, 172.16.0.101', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2020-07-12 15:23:39');
INSERT INTO `sys_logininfor` VALUES ('98', 'admin', '116.5.86.140, 183.3.226.234, 172.16.0.101', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2020-07-12 15:41:22');
INSERT INTO `sys_logininfor` VALUES ('99', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2020-07-12 15:56:30');
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 17:04:19');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '183.27.60.26, 172.16.0.101', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-12 19:14:11');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '183.27.60.26, 172.16.0.101', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-12 19:20:06');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2020-07-12 19:30:31');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 19:47:09');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 19:52:35');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 21:00:48');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2020-07-12 23:59:30');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-13 00:00:59');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-13 08:57:37');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-13 14:14:52');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '112.10.81.158, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-13 20:36:51');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '112.10.81.158, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-13 20:37:36');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-13 20:53:14');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '112.10.81.158, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-13 23:17:44');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-13 23:49:29');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '183.27.60.26, 172.16.0.101', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2020-07-14 00:38:19');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-14 10:25:35');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-14 10:32:51');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-14 15:02:32');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-14 16:35:43');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-14 23:20:51');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-15 16:12:58');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-15 17:59:26');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-15 18:49:45');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-15 18:57:32');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-15 19:51:27');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-15 19:54:41');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-15 20:02:58');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-15 20:27:33');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-15 20:43:17');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '116.5.87.154, 172.16.0.101', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-15 20:43:32');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '116.5.87.154, 172.16.0.101', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-15 21:30:13');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-16 16:42:25');

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
INSERT INTO `sys_menu` VALUES ('2028', '代理链接管理', '2083', '1', '/system/short', 'menuItem', 'C', '0', 'system:short:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-06-26 18:36:18', '链接管理菜单');
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
INSERT INTO `sys_menu` VALUES ('2084', '授权信息', '2082', '1', '/system/wxauth', 'menuItem', 'C', '0', 'system:wxauth:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-07-12 10:54:01', '授权信息菜单');
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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('1', '操作日志', '9', 'com.ruoyi.web.controller.monitor.SysOperlogController.clean()', 'POST', '1', 'admin', '研发部门', '/monitor/operlog/clean', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-14 15:13:48');
INSERT INTO `sys_oper_log` VALUES ('2', '公共片库', '3', 'com.ruoyi.web.controller.system.VideoController.remove()', 'POST', '1', 'admin', '研发部门', '/system/shipin/remove', '118.78.249.178, 172.16.0.101', '内网IP', '{\n  \"ids\" : [ \"471,472,473,474,475,476,477,478,479,480\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:00:27');
INSERT INTO `sys_oper_log` VALUES ('3', '公共片库', '3', 'com.ruoyi.web.controller.system.VideoController.remove()', 'POST', '1', 'admin', '研发部门', '/system/shipin/remove', '118.78.249.178, 172.16.0.101', '内网IP', '{\n  \"ids\" : [ \"481,482,483,484,485,486,487,488,489,490\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:00:31');
INSERT INTO `sys_oper_log` VALUES ('4', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/491', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 20:03:24');
INSERT INTO `sys_oper_log` VALUES ('5', '公共片库', '3', 'com.ruoyi.web.controller.system.VideoController.remove()', 'POST', '1', 'admin', '研发部门', '/system/shipin/remove', '118.78.249.178, 172.16.0.101', '内网IP', '{\n  \"ids\" : [ \"491,492,493,494,495,496,497,498,499,500\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:22:08');
INSERT INTO `sys_oper_log` VALUES ('6', '公共片库', '3', 'com.ruoyi.web.controller.system.VideoController.remove()', 'POST', '1', 'admin', '研发部门', '/system/shipin/remove', '118.78.249.178, 172.16.0.101', '内网IP', '{\n  \"ids\" : [ \"501,502,503,504,505,506,507,508,509,510\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:22:12');
INSERT INTO `sys_oper_log` VALUES ('7', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/258', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:22:47');
INSERT INTO `sys_oper_log` VALUES ('8', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/271', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:22:53');
INSERT INTO `sys_oper_log` VALUES ('9', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/261', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:22:56');
INSERT INTO `sys_oper_log` VALUES ('10', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/256', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:22:58');
INSERT INTO `sys_oper_log` VALUES ('11', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/257', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:23:00');
INSERT INTO `sys_oper_log` VALUES ('12', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/259', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:23:02');
INSERT INTO `sys_oper_log` VALUES ('13', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/260', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:23:03');
INSERT INTO `sys_oper_log` VALUES ('14', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/262', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:23:05');
INSERT INTO `sys_oper_log` VALUES ('15', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/263', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:23:07');
INSERT INTO `sys_oper_log` VALUES ('16', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/264', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:23:09');
INSERT INTO `sys_oper_log` VALUES ('17', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/265', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:23:11');
INSERT INTO `sys_oper_log` VALUES ('18', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/266', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:23:13');
INSERT INTO `sys_oper_log` VALUES ('19', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/267', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:23:14');
INSERT INTO `sys_oper_log` VALUES ('20', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/268', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:23:16');
INSERT INTO `sys_oper_log` VALUES ('21', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/269', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:23:18');
INSERT INTO `sys_oper_log` VALUES ('22', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/270', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:23:20');
INSERT INTO `sys_oper_log` VALUES ('23', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/231', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:24:51');
INSERT INTO `sys_oper_log` VALUES ('24', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/232', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:24:54');
INSERT INTO `sys_oper_log` VALUES ('25', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/233', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:24:56');
INSERT INTO `sys_oper_log` VALUES ('26', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/234', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:24:58');
INSERT INTO `sys_oper_log` VALUES ('27', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/235', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:00');
INSERT INTO `sys_oper_log` VALUES ('28', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/236', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:02');
INSERT INTO `sys_oper_log` VALUES ('29', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/237', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:04');
INSERT INTO `sys_oper_log` VALUES ('30', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/238', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:05');
INSERT INTO `sys_oper_log` VALUES ('31', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/239', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:07');
INSERT INTO `sys_oper_log` VALUES ('32', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/240', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:09');
INSERT INTO `sys_oper_log` VALUES ('33', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/255', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:13');
INSERT INTO `sys_oper_log` VALUES ('34', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/254', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:17');
INSERT INTO `sys_oper_log` VALUES ('35', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/241', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:19');
INSERT INTO `sys_oper_log` VALUES ('36', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/242', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:21');
INSERT INTO `sys_oper_log` VALUES ('37', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/243', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:24');
INSERT INTO `sys_oper_log` VALUES ('38', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/244', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:26');
INSERT INTO `sys_oper_log` VALUES ('39', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/245', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:27');
INSERT INTO `sys_oper_log` VALUES ('40', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/246', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:29');
INSERT INTO `sys_oper_log` VALUES ('41', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/247', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:31');
INSERT INTO `sys_oper_log` VALUES ('42', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/248', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:33');
INSERT INTO `sys_oper_log` VALUES ('43', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/249', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:35');
INSERT INTO `sys_oper_log` VALUES ('44', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/250', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:37');
INSERT INTO `sys_oper_log` VALUES ('45', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/251', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:38');
INSERT INTO `sys_oper_log` VALUES ('46', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/252', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:40');
INSERT INTO `sys_oper_log` VALUES ('47', '栏目管理', '3', 'com.ruoyi.reward.controller.SysCategoryController.remove()', 'GET', '1', 'admin', '研发部门', '/system/category/remove/253', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:25:42');
INSERT INTO `sys_oper_log` VALUES ('48', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/513', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 20:36:23');
INSERT INTO `sys_oper_log` VALUES ('49', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/513', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 20:36:28');
INSERT INTO `sys_oper_log` VALUES ('50', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/512', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 20:43:23');
INSERT INTO `sys_oper_log` VALUES ('51', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/512', '116.5.87.154, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 20:44:16');
INSERT INTO `sys_oper_log` VALUES ('52', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/513', '116.5.87.154, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 20:44:26');
INSERT INTO `sys_oper_log` VALUES ('53', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/464', '116.5.87.154, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 20:45:08');
INSERT INTO `sys_oper_log` VALUES ('54', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/462', '116.5.87.154, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 20:45:17');
INSERT INTO `sys_oper_log` VALUES ('55', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/470', '116.5.87.154, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 20:45:28');
INSERT INTO `sys_oper_log` VALUES ('56', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/528', '116.5.87.154, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 20:45:51');
INSERT INTO `sys_oper_log` VALUES ('57', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/512', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 20:46:00');
INSERT INTO `sys_oper_log` VALUES ('58', '栏目管理', '2', 'com.ruoyi.reward.controller.SysCategoryController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/category/edit', '118.78.249.178, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"223\" ],\n  \"parentId\" : [ \"100\" ],\n  \"parentName\" : [ \"大类目\" ],\n  \"categoryName\" : [ \"直播\" ],\n  \"orderNum\" : [ \"18\" ],\n  \"status\" : [ \"1\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:47:05');
INSERT INTO `sys_oper_log` VALUES ('59', '栏目管理', '2', 'com.ruoyi.reward.controller.SysCategoryController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/category/edit', '118.78.249.178, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"225\" ],\n  \"parentId\" : [ \"100\" ],\n  \"parentName\" : [ \"大类目\" ],\n  \"categoryName\" : [ \"另类\" ],\n  \"orderNum\" : [ \"20\" ],\n  \"status\" : [ \"1\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:54:41');
INSERT INTO `sys_oper_log` VALUES ('60', '栏目管理', '2', 'com.ruoyi.reward.controller.SysCategoryController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/category/edit', '118.78.249.178, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"224\" ],\n  \"parentId\" : [ \"100\" ],\n  \"parentName\" : [ \"大类目\" ],\n  \"categoryName\" : [ \"三级\" ],\n  \"orderNum\" : [ \"19\" ],\n  \"status\" : [ \"1\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:54:50');
INSERT INTO `sys_oper_log` VALUES ('61', '栏目管理', '2', 'com.ruoyi.reward.controller.SysCategoryController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/category/edit', '118.78.249.178, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"222\" ],\n  \"parentId\" : [ \"100\" ],\n  \"parentName\" : [ \"大类目\" ],\n  \"categoryName\" : [ \"动漫\" ],\n  \"orderNum\" : [ \"17\" ],\n  \"status\" : [ \"1\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 20:54:58');
INSERT INTO `sys_oper_log` VALUES ('62', '公众号配置信息', '2', 'com.ruoyi.reward.controller.SysWechatConfigController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/wechatConfig/edit', '118.78.249.178, 172.16.0.101', '内网IP', '{\n  \"id\" : [ \"10\" ],\n  \"configCode\" : [ \"WY_FULI\" ],\n  \"appId\" : [ \"wx590af156c3a3eae9\" ],\n  \"appsecret\" : [ \"8af481db51cd509f26c857a75712c9ce\" ],\n  \"mchId\" : [ \"1600946459\" ],\n  \"signKey\" : [ \"22f5c38598681b0d5179d84fc3bc576a\" ],\n  \"certFile\" : [ \"\" ],\n  \"token\" : [ \"\" ],\n  \"encodingAesKey\" : [ \"\" ],\n  \"gmtCreate\" : [ \"2016-12-13\" ],\n  \"gmtModified\" : [ \"2020-04-01\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 21:03:17');
INSERT INTO `sys_oper_log` VALUES ('63', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/516', '116.5.87.154, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 21:30:52');
INSERT INTO `sys_oper_log` VALUES ('64', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/517', '116.5.87.154, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 21:30:58');
INSERT INTO `sys_oper_log` VALUES ('65', '公共片库', '1', 'com.ruoyi.web.controller.system.VideoController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/shipin/add', '116.5.87.154, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"218\" ],\n  \"name\" : [ \"穿着豹纹自慰\" ],\n  \"categoryName\" : [ \"自慰\" ],\n  \"logo\" : [ \"/profile/upload/2020/07/15/28142da5a04c3fe8d464852956e6cd37.png\" ],\n  \"shiFileName\" : [ \"/profile/upload/2020/07/15/264ff2868a6e556f7a9f27538eef232e.mp4\" ],\n  \"duration\" : [ \"180\" ],\n  \"startMoney\" : [ \"2\" ],\n  \"endMoney\" : [ \"5\" ],\n  \"url\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/28142da5a04c3fe8d464852956e6cd37.png\" ],\n  \"videoUrl\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/264ff2868a6e556f7a9f27538eef232e.mp4\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 21:36:57');
INSERT INTO `sys_oper_log` VALUES ('66', '公共片库', '1', 'com.ruoyi.web.controller.system.VideoController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/shipin/add', '116.5.87.154, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"229\" ],\n  \"name\" : [ \"午觉睡醒想要了\" ],\n  \"categoryName\" : [ \"自拍\" ],\n  \"logo\" : [ \"/profile/upload/2020/07/15/dda44f97a605029c53fb04e15c528575.png\" ],\n  \"shiFileName\" : [ \"/profile/upload/2020/07/15/f863cdca4cb0ab620c2db11098ce6415.mp4\" ],\n  \"duration\" : [ \"183\" ],\n  \"startMoney\" : [ \"2\" ],\n  \"endMoney\" : [ \"5\" ],\n  \"url\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/dda44f97a605029c53fb04e15c528575.png\" ],\n  \"videoUrl\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/f863cdca4cb0ab620c2db11098ce6415.mp4\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 21:38:20');
INSERT INTO `sys_oper_log` VALUES ('67', '公共片库', '1', 'com.ruoyi.web.controller.system.VideoController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/shipin/add', '116.5.87.154, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"200\" ],\n  \"name\" : [ \"按摩被内射\" ],\n  \"categoryName\" : [ \"日韩\" ],\n  \"logo\" : [ \"/profile/upload/2020/07/15/ab46c0c15220980f0dd74f559aa58da3.png\" ],\n  \"shiFileName\" : [ \"/profile/upload/2020/07/15/1cae950c1669256d5403d05495670f9a.mp4\" ],\n  \"duration\" : [ \"460\" ],\n  \"startMoney\" : [ \"2\" ],\n  \"endMoney\" : [ \"5\" ],\n  \"url\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/ab46c0c15220980f0dd74f559aa58da3.png\" ],\n  \"videoUrl\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/1cae950c1669256d5403d05495670f9a.mp4\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 21:40:10');
INSERT INTO `sys_oper_log` VALUES ('68', '公共片库', '1', 'com.ruoyi.web.controller.system.VideoController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/shipin/add', '116.5.87.154, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"218\" ],\n  \"name\" : [ \"乖乖女自慰扣穴\" ],\n  \"categoryName\" : [ \"自慰\" ],\n  \"logo\" : [ \"/profile/upload/2020/07/15/dd412178993cc376f6f6d5d457ab3f8e.png\" ],\n  \"shiFileName\" : [ \"/profile/upload/2020/07/15/4b1066dda08bef4778fc0e53c1e8d031.mp4\" ],\n  \"duration\" : [ \"461\" ],\n  \"startMoney\" : [ \"2\" ],\n  \"endMoney\" : [ \"5\" ],\n  \"url\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/dd412178993cc376f6f6d5d457ab3f8e.png\" ],\n  \"videoUrl\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/4b1066dda08bef4778fc0e53c1e8d031.mp4\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 21:41:31');
INSERT INTO `sys_oper_log` VALUES ('69', '公共片库', '1', 'com.ruoyi.web.controller.system.VideoController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/shipin/add', '116.5.87.154, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"218\" ],\n  \"name\" : [ \"一个人自慰喷水\" ],\n  \"categoryName\" : [ \"自慰\" ],\n  \"logo\" : [ \"/profile/upload/2020/07/15/6c774f047ddaa39dd4d209be7e3e2938.png\" ],\n  \"shiFileName\" : [ \"/profile/upload/2020/07/15/f275289e797af286f41dbf7e9776cfd6.mp4\" ],\n  \"duration\" : [ \"211\" ],\n  \"startMoney\" : [ \"2\" ],\n  \"endMoney\" : [ \"5\" ],\n  \"url\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/6c774f047ddaa39dd4d209be7e3e2938.png\" ],\n  \"videoUrl\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/f275289e797af286f41dbf7e9776cfd6.mp4\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 21:42:33');
INSERT INTO `sys_oper_log` VALUES ('70', '公共片库', '1', 'com.ruoyi.web.controller.system.VideoController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/shipin/add', '116.5.87.154, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"230\" ],\n  \"name\" : [ \"深喉哥哥大屌\" ],\n  \"categoryName\" : [ \"口交\" ],\n  \"logo\" : [ \"/profile/upload/2020/07/15/e97f06ed25989db310a5592ebe139c5c.png\" ],\n  \"shiFileName\" : [ \"/profile/upload/2020/07/15/3288000e1a6b6d38ad7cb1a7211a3704.mp4\" ],\n  \"duration\" : [ \"58\" ],\n  \"startMoney\" : [ \"2\" ],\n  \"endMoney\" : [ \"5\" ],\n  \"url\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/e97f06ed25989db310a5592ebe139c5c.png\" ],\n  \"videoUrl\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/3288000e1a6b6d38ad7cb1a7211a3704.mp4\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 21:44:53');
INSERT INTO `sys_oper_log` VALUES ('71', '公共片库', '1', 'com.ruoyi.web.controller.system.VideoController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/shipin/add', '116.5.87.154, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"229\" ],\n  \"name\" : [ \"约炮极品小妹\" ],\n  \"categoryName\" : [ \"自拍\" ],\n  \"logo\" : [ \"/profile/upload/2020/07/15/5d04a4cb55c649a289ecc10cbb99bc2a.png\" ],\n  \"shiFileName\" : [ \"/profile/upload/2020/07/15/4d551630f8637ec77d69b9aaa3e4491e.mp4\" ],\n  \"duration\" : [ \"117\" ],\n  \"startMoney\" : [ \"2\" ],\n  \"endMoney\" : [ \"5\" ],\n  \"url\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/5d04a4cb55c649a289ecc10cbb99bc2a.png\" ],\n  \"videoUrl\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/4d551630f8637ec77d69b9aaa3e4491e.mp4\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 21:46:02');
INSERT INTO `sys_oper_log` VALUES ('72', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/536', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 21:47:13');
INSERT INTO `sys_oper_log` VALUES ('73', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/537', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 21:47:21');
INSERT INTO `sys_oper_log` VALUES ('74', '公共片库', '1', 'com.ruoyi.web.controller.system.VideoController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/shipin/add', '116.5.87.154, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"229\" ],\n  \"name\" : [ \"按摩女舔菊花\" ],\n  \"categoryName\" : [ \"自拍\" ],\n  \"logo\" : [ \"/profile/upload/2020/07/15/0090bfea3857df2a8e53168a92023d03.png\" ],\n  \"shiFileName\" : [ \"/profile/upload/2020/07/15/067751dc7e82efba08f9cf361f092aa5.mp4\" ],\n  \"duration\" : [ \"74\" ],\n  \"startMoney\" : [ \"2\" ],\n  \"endMoney\" : [ \"5\" ],\n  \"url\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/0090bfea3857df2a8e53168a92023d03.png\" ],\n  \"videoUrl\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/067751dc7e82efba08f9cf361f092aa5.mp4\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 21:47:22');
INSERT INTO `sys_oper_log` VALUES ('75', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/538', '116.5.87.154, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 21:47:28');
INSERT INTO `sys_oper_log` VALUES ('76', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/537', '116.5.87.154, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 21:47:36');
INSERT INTO `sys_oper_log` VALUES ('77', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/537', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 21:47:39');
INSERT INTO `sys_oper_log` VALUES ('78', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/513', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 21:47:48');
INSERT INTO `sys_oper_log` VALUES ('79', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/512', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 21:47:51');
INSERT INTO `sys_oper_log` VALUES ('80', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/532', '118.78.249.178, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 21:47:54');
INSERT INTO `sys_oper_log` VALUES ('81', '公共片库', '1', 'com.ruoyi.web.controller.system.VideoController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/shipin/add', '116.5.87.154, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"218\" ],\n  \"name\" : [ \"可爱眼睛妹自慰扣穴\" ],\n  \"categoryName\" : [ \"自慰\" ],\n  \"logo\" : [ \"/profile/upload/2020/07/15/5f4a25ffada40e3c4a2b846c2bc53dbd.png\" ],\n  \"shiFileName\" : [ \"/profile/upload/2020/07/15/d14846d09ad24b09d19de28d9583d7bb.mp4\" ],\n  \"duration\" : [ \"59\" ],\n  \"startMoney\" : [ \"2\" ],\n  \"endMoney\" : [ \"5\" ],\n  \"url\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/5f4a25ffada40e3c4a2b846c2bc53dbd.png\" ],\n  \"videoUrl\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/d14846d09ad24b09d19de28d9583d7bb.mp4\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 21:49:08');
INSERT INTO `sys_oper_log` VALUES ('82', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/539', '116.5.87.154, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 21:49:12');
INSERT INTO `sys_oper_log` VALUES ('83', '公共片库', '1', 'com.ruoyi.web.controller.system.VideoController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/shipin/add', '116.5.87.154, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"200\" ],\n  \"name\" : [ \"激情69\" ],\n  \"categoryName\" : [ \"日韩\" ],\n  \"logo\" : [ \"/profile/upload/2020/07/15/71190ae86dbbabeb5f2203849ed347aa.png\" ],\n  \"shiFileName\" : [ \"/profile/upload/2020/07/15/03d8f0e28b4329936dd45363b99dea3b.mp4\" ],\n  \"duration\" : [ \"241\" ],\n  \"startMoney\" : [ \"2\" ],\n  \"endMoney\" : [ \"5\" ],\n  \"url\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/71190ae86dbbabeb5f2203849ed347aa.png\" ],\n  \"videoUrl\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/03d8f0e28b4329936dd45363b99dea3b.mp4\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 21:50:53');
INSERT INTO `sys_oper_log` VALUES ('84', '公共片库', '1', 'com.ruoyi.web.controller.system.VideoController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/shipin/add', '116.5.87.154, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"229\" ],\n  \"name\" : [ \"约的妹子直接内射\" ],\n  \"categoryName\" : [ \"自拍\" ],\n  \"logo\" : [ \"/profile/upload/2020/07/15/6d091e7c96479d65fb881411fb524c46.png\" ],\n  \"shiFileName\" : [ \"/profile/upload/2020/07/15/4cb875e83825da2c21abbf7b72b961f9.mp4\" ],\n  \"duration\" : [ \"67\" ],\n  \"startMoney\" : [ \"2\" ],\n  \"endMoney\" : [ \"5\" ],\n  \"url\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/6d091e7c96479d65fb881411fb524c46.png\" ],\n  \"videoUrl\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/4cb875e83825da2c21abbf7b72b961f9.mp4\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 21:52:45');
INSERT INTO `sys_oper_log` VALUES ('85', '公共片库', '1', 'com.ruoyi.web.controller.system.VideoController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/shipin/add', '116.5.87.154, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"230\" ],\n  \"name\" : [ \"深情的吃着大屌\" ],\n  \"categoryName\" : [ \"口交\" ],\n  \"logo\" : [ \"/profile/upload/2020/07/15/ca92ad90a79cd8dcf54af3275b18d622.png\" ],\n  \"shiFileName\" : [ \"/profile/upload/2020/07/15/4b539a9f5c0b75892268dbefb3f6d8ad.mp4\" ],\n  \"duration\" : [ \"140\" ],\n  \"startMoney\" : [ \"2\" ],\n  \"endMoney\" : [ \"5\" ],\n  \"url\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/ca92ad90a79cd8dcf54af3275b18d622.png\" ],\n  \"videoUrl\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/4b539a9f5c0b75892268dbefb3f6d8ad.mp4\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 21:54:13');
INSERT INTO `sys_oper_log` VALUES ('86', '公共片库', '1', 'com.ruoyi.web.controller.system.VideoController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/shipin/add', '116.5.87.154, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"230\" ],\n  \"name\" : [ \"一边吃大屌一边自拍\" ],\n  \"categoryName\" : [ \"口交\" ],\n  \"logo\" : [ \"/profile/upload/2020/07/15/71415357125a12d9bc0665d6d4de6302.png\" ],\n  \"shiFileName\" : [ \"/profile/upload/2020/07/15/5b2ca84ab731fb2150efc2442f22b01f.mp4\" ],\n  \"duration\" : [ \"147\" ],\n  \"startMoney\" : [ \"2\" ],\n  \"endMoney\" : [ \"5\" ],\n  \"url\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/71415357125a12d9bc0665d6d4de6302.png\" ],\n  \"videoUrl\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/5b2ca84ab731fb2150efc2442f22b01f.mp4\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 21:55:32');
INSERT INTO `sys_oper_log` VALUES ('87', '公共片库', '1', 'com.ruoyi.web.controller.system.VideoController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/shipin/add', '116.5.87.154, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"227\" ],\n  \"name\" : [ \"酒店偷拍偷情男女\" ],\n  \"categoryName\" : [ \"偷情\" ],\n  \"logo\" : [ \"/profile/upload/2020/07/15/d5f2fef498b802e8161105ada2b5759e.png\" ],\n  \"shiFileName\" : [ \"/profile/upload/2020/07/15/d671204d0c6f286ccc189d282206d998.mp4\" ],\n  \"duration\" : [ \"185\" ],\n  \"startMoney\" : [ \"2\" ],\n  \"endMoney\" : [ \"5\" ],\n  \"url\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/d5f2fef498b802e8161105ada2b5759e.png\" ],\n  \"videoUrl\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/d671204d0c6f286ccc189d282206d998.mp4\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 21:56:46');
INSERT INTO `sys_oper_log` VALUES ('88', '公共片库', '1', 'com.ruoyi.web.controller.system.VideoController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/shipin/add', '116.5.87.154, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"218\" ],\n  \"name\" : [ \"美少妇自慰超多少\" ],\n  \"categoryName\" : [ \"自慰\" ],\n  \"logo\" : [ \"/profile/upload/2020/07/15/11fbf63717ed3397bba79215ece40e21.png\" ],\n  \"shiFileName\" : [ \"/profile/upload/2020/07/15/764e12b99cf7a73c97a1c7f4e12e2f70.mp4\" ],\n  \"duration\" : [ \"221\" ],\n  \"startMoney\" : [ \"2\" ],\n  \"endMoney\" : [ \"5\" ],\n  \"url\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/11fbf63717ed3397bba79215ece40e21.png\" ],\n  \"videoUrl\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/764e12b99cf7a73c97a1c7f4e12e2f70.mp4\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 21:57:47');
INSERT INTO `sys_oper_log` VALUES ('89', '公共片库', '1', 'com.ruoyi.web.controller.system.VideoController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/shipin/add', '116.5.87.154, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"229\" ],\n  \"name\" : [ \"情侣许久不见激情做爱\" ],\n  \"categoryName\" : [ \"自拍\" ],\n  \"logo\" : [ \"/profile/upload/2020/07/15/96616927ad80a5ed433c3d6d6c5ee70a.png\" ],\n  \"shiFileName\" : [ \"/profile/upload/2020/07/15/f343f67ef59c72a8361895e99962e273.mp4\" ],\n  \"duration\" : [ \"204\" ],\n  \"startMoney\" : [ \"2\" ],\n  \"endMoney\" : [ \"5\" ],\n  \"url\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/96616927ad80a5ed433c3d6d6c5ee70a.png\" ],\n  \"videoUrl\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/f343f67ef59c72a8361895e99962e273.mp4\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 21:59:04');
INSERT INTO `sys_oper_log` VALUES ('90', '公共片库', '1', 'com.ruoyi.web.controller.system.VideoController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/shipin/add', '116.5.87.154, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"218\" ],\n  \"name\" : [ \"水汪汪的小骚货\" ],\n  \"categoryName\" : [ \"自慰\" ],\n  \"logo\" : [ \"/profile/upload/2020/07/15/4dcb58ee0a8ddba0ecec2a3900eebbc3.png\" ],\n  \"shiFileName\" : [ \"/profile/upload/2020/07/15/e5e5082eb16335bd2acac3712b768e61.mp4\" ],\n  \"duration\" : [ \"217\" ],\n  \"startMoney\" : [ \"2\" ],\n  \"endMoney\" : [ \"5\" ],\n  \"url\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/4dcb58ee0a8ddba0ecec2a3900eebbc3.png\" ],\n  \"videoUrl\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/e5e5082eb16335bd2acac3712b768e61.mp4\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 22:00:21');
INSERT INTO `sys_oper_log` VALUES ('91', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/466', '116.5.87.154, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 22:01:47');
INSERT INTO `sys_oper_log` VALUES ('92', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/525', '116.5.87.154, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 22:07:23');
INSERT INTO `sys_oper_log` VALUES ('93', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/526', '116.5.87.154, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 22:07:36');
INSERT INTO `sys_oper_log` VALUES ('94', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/547', '116.5.87.154, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 22:07:42');
INSERT INTO `sys_oper_log` VALUES ('95', '预览视频', '2', 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', '1', 'admin', '研发部门', '/system/shipin/preview/547', '116.5.87.154, 172.16.0.101', '内网IP', '{ }', '\"system/shipin/preview\"', '0', null, '2020-07-15 22:07:55');
INSERT INTO `sys_oper_log` VALUES ('96', '公共片库', '1', 'com.ruoyi.web.controller.system.VideoController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/shipin/add', '116.5.87.154, 172.16.0.101', '内网IP', '{\n  \"categoryId\" : [ \"229\" ],\n  \"name\" : [ \"玩着手机被操\" ],\n  \"categoryName\" : [ \"自拍\" ],\n  \"logo\" : [ \"/profile/upload/2020/07/15/ca648f930c86bd62311b9b2ae92a01c4.png\" ],\n  \"shiFileName\" : [ \"/profile/upload/2020/07/15/3f3244ba30376c71995125e9e193388d.mp4\" ],\n  \"duration\" : [ \"113\" ],\n  \"startMoney\" : [ \"2\" ],\n  \"endMoney\" : [ \"5\" ],\n  \"url\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/ca648f930c86bd62311b9b2ae92a01c4.png\" ],\n  \"videoUrl\" : [ \"http://admin.grkfcs.cn/profile/upload/2020/07/15/3f3244ba30376c71995125e9e193388d.mp4\" ]\n}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', '0', null, '2020-07-15 22:15:09');

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
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='订单';

-- ----------------------------
-- Records of sys_order
-- ----------------------------
INSERT INTO `sys_order` VALUES ('234', '551189396200624128', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-12 10:53:09', '2020-07-12 10:53:09', '130', 0x7B2263617465676F72794964223A3232372C22636C69636B223A342C2263726561746554696D65223A313539323637323030323030302C226475726174696F6E223A22313232222C226964223A3133302C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30362F32302F61616631323634343238373864343362376432373735636666383366636237342E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A2261646D696E222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30362F32302F61616631323634343238373864343362376432373735636666383366636237342E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30362F32302F62386537346132343432633534336466366437616237383734383634383464352E6D7034227D, 'o9Umds47M8WyyJw8jz3NX7yoJyMg', 'admin', '551189300302057472');
INSERT INTO `sys_order` VALUES ('235', '551189515981557760', '100', '100', '3', '4200000596202007124785680603', null, '2020-07-12 10:53:54', '1.00', '1', '2020-07-12 10:53:37', '2020-07-12 10:53:55', '124', 0x7B2263617465676F72794964223A3232372C22636C69636B223A342C2263726561746554696D65223A313539323637323030323030302C226475726174696F6E223A22363730222C226964223A3132342C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F30382F61623830323366313863666133353630386563623832326130323238303366642E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A2261646D696E222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F30382F61623830323366313863666133353630386563623832326130323238303366642E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F30382F63383539656330316132396262303836616261386661633363323537343636382E6D7034227D, 'o9Umds47M8WyyJw8jz3NX7yoJyMg', 'admin', '551189300302057472');
INSERT INTO `sys_order` VALUES ('236', '551189671384715264', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-12 10:54:14', '2020-07-12 10:54:14', '136', 0x7B2263617465676F72794964223A3232372C22636C69636B223A342C2263726561746554696D65223A313539323637323030323030302C226475726174696F6E223A22313232222C226964223A3133362C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30362F32302F61616631323634343238373864343362376432373735636666383366636237342E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A2261646D696E222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30362F32302F61616631323634343238373864343362376432373735636666383366636237342E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30362F32302F62386537346132343432633534336466366437616237383734383634383464352E6D7034227D, 'o9Umds47M8WyyJw8jz3NX7yoJyMg', 'admin', '551189300302057472');
INSERT INTO `sys_order` VALUES ('245', '551233546623127552', '100', '100', '3', '4200000593202007121586172419', null, '2020-07-12 13:48:42', '1.00', '1', '2020-07-12 13:48:35', '2020-07-12 13:48:43', '130', 0x7B2263617465676F72794964223A3232372C22636C69636B223A342C2263726561746554696D65223A313539323637323030323030302C226475726174696F6E223A22313232222C226964223A3133302C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30362F32302F61616631323634343238373864343362376432373735636666383366636237342E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A2261646D696E222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30362F32302F61616631323634343238373864343362376432373735636666383366636237342E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30362F32302F62386537346132343432633534336466366437616237383734383634383464352E6D7034227D, 'o9Umds7BgMc_-AIMowrmabOADars', 'admin', '551233490620780544');
INSERT INTO `sys_order` VALUES ('246', '551233610586263552', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-12 13:48:50', '2020-07-12 13:48:50', '124', 0x7B2263617465676F72794964223A3232372C22636C69636B223A342C2263726561746554696D65223A313539323637323030323030302C226475726174696F6E223A22363730222C226964223A3132342C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F30382F61623830323366313863666133353630386563623832326130323238303366642E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A2261646D696E222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F30382F61623830323366313863666133353630386563623832326130323238303366642E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F30382F63383539656330316132396262303836616261386661633363323537343636382E6D7034227D, 'o9Umds7BgMc_-AIMowrmabOADars', 'admin', '551233490620780544');
INSERT INTO `sys_order` VALUES ('247', '551234145007702016', '100', '100', '3', '4200000582202007123829696560', null, '2020-07-12 13:51:04', '1.00', '1', '2020-07-12 13:50:58', '2020-07-12 13:51:05', '138', 0x7B2263617465676F72794964223A3232372C22636C69636B223A342C2263726561746554696D65223A313539323637323030323030302C226475726174696F6E223A22373532222C226964223A3133382C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F30382F36323230323930313230346263653131366137383630616263376662316462332E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A2261646D696E222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F30382F36323230323930313230346263653131366137383630616263376662316462332E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F30382F61343136623439383865323136303065346436613630663039633463666439642E6D7034227D, 'o9Umds7BgMc_-AIMowrmabOADars', 'admin', '551233490620780544');
INSERT INTO `sys_order` VALUES ('254', '551304950731247616', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-12 18:32:19', '2020-07-12 18:32:19', '138', 0x7B2263617465676F72794964223A3232372C22636C69636B223A342C2263726561746554696D65223A313539323637323030323030302C226475726174696F6E223A22373532222C226964223A3133382C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F30382F36323230323930313230346263653131366137383630616263376662316462332E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A2261646D696E222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F30382F36323230323930313230346263653131366137383630616263376662316462332E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F30382F61343136623439383865323136303065346436613630663039633463666439642E6D7034227D, 'o9Umds_VOxYfdxvq2sjpZlp2Cou8', 'admin', '551185112876716032');
INSERT INTO `sys_order` VALUES ('255', '551304966933843968', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-12 18:32:23', '2020-07-12 18:32:23', '124', 0x7B2263617465676F72794964223A3232372C22636C69636B223A342C2263726561746554696D65223A313539323637323030323030302C226475726174696F6E223A22363730222C226964223A3132342C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F30382F61623830323366313863666133353630386563623832326130323238303366642E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A2261646D696E222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F30382F61623830323366313863666133353630386563623832326130323238303366642E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F30382F63383539656330316132396262303836616261386661633363323537343636382E6D7034227D, 'o9Umds_VOxYfdxvq2sjpZlp2Cou8', 'admin', '551185112876716032');
INSERT INTO `sys_order` VALUES ('256', '551304973225299968', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-12 18:32:24', '2020-07-12 18:32:24', '126', 0x7B2263617465676F72794964223A3232372C22636C69636B223A342C2263726561746554696D65223A313539323637323030323030302C226475726174696F6E223A22373532222C226964223A3132362C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F30382F35333063646464373466383362636638323131313730663536376137313136642E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A2261646D696E222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F30382F35333063646464373466383362636638323131313730663536376137313136642E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F30382F37356135373961656537313437623833376534636137363237633863393032372E6D7034227D, 'o9Umds_VOxYfdxvq2sjpZlp2Cou8', 'admin', '551185112876716032');
INSERT INTO `sys_order` VALUES ('257', '551304979898437632', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-12 18:32:26', '2020-07-12 18:32:26', '125', 0x7B2263617465676F72794964223A3232372C22636C69636B223A342C2263726561746554696D65223A313539323637323030323030302C226475726174696F6E223A22313232222C226964223A3132352C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30362F32302F61616631323634343238373864343362376432373735636666383366636237342E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A2261646D696E222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30362F32302F61616631323634343238373864343362376432373735636666383366636237342E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30362F32302F62386537346132343432633534336466366437616237383734383634383464352E6D7034227D, 'o9Umds_VOxYfdxvq2sjpZlp2Cou8', 'admin', '551185112876716032');
INSERT INTO `sys_order` VALUES ('258', '551304988278657024', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-12 18:32:28', '2020-07-12 18:32:28', '127', 0x7B2263617465676F72794964223A3232372C22636C69636B223A342C2263726561746554696D65223A313539323637323030323030302C226475726174696F6E223A22313232222C226964223A3132372C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30362F32302F61616631323634343238373864343362376432373735636666383366636237342E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A2261646D696E222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30362F32302F61616631323634343238373864343362376432373735636666383366636237342E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30362F32302F62386537346132343432633534336466366437616237383734383634383464352E6D7034227D, 'o9Umds_VOxYfdxvq2sjpZlp2Cou8', 'admin', '551185112876716032');
INSERT INTO `sys_order` VALUES ('259', '551304998563090432', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-12 18:32:31', '2020-07-12 18:32:31', '128', 0x7B2263617465676F72794964223A3232372C22636C69636B223A342C2263726561746554696D65223A313539323637323030323030302C226475726174696F6E223A22313232222C226964223A3132382C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30362F32302F61616631323634343238373864343362376432373735636666383366636237342E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A2261646D696E222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30362F32302F61616631323634343238373864343362376432373735636666383366636237342E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30362F32302F62386537346132343432633534336466366437616237383734383634383464352E6D7034227D, 'o9Umds_VOxYfdxvq2sjpZlp2Cou8', 'admin', '551185112876716032');
INSERT INTO `sys_order` VALUES ('260', '551305004007297024', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-12 18:32:32', '2020-07-12 18:32:32', '129', 0x7B2263617465676F72794964223A3232372C22636C69636B223A342C2263726561746554696D65223A313539323637323030323030302C226475726174696F6E223A22313232222C226964223A3132392C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30362F32302F61616631323634343238373864343362376432373735636666383366636237342E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A2261646D696E222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30362F32302F61616631323634343238373864343362376432373735636666383366636237342E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30362F32302F62386537346132343432633534336466366437616237383734383634383464352E6D7034227D, 'o9Umds_VOxYfdxvq2sjpZlp2Cou8', 'admin', '551185112876716032');
INSERT INTO `sys_order` VALUES ('261', '551305012114886656', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-12 18:32:34', '2020-07-12 18:32:34', '130', 0x7B2263617465676F72794964223A3232372C22636C69636B223A342C2263726561746554696D65223A313539323637323030323030302C226475726174696F6E223A22313232222C226964223A3133302C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30362F32302F61616631323634343238373864343362376432373735636666383366636237342E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A2261646D696E222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30362F32302F61616631323634343238373864343362376432373735636666383366636237342E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30362F32302F62386537346132343432633534336466366437616237383734383634383464352E6D7034227D, 'o9Umds_VOxYfdxvq2sjpZlp2Cou8', 'admin', '551185112876716032');
INSERT INTO `sys_order` VALUES ('262', '551306563663433728', '100', '100', '3', 'wx12183904793836c1d494da631834837800', null, null, '1.00', '2', '2020-07-12 18:38:44', '2020-07-12 18:39:05', '124', 0x7B2263617465676F72794964223A3232372C22636C69636B223A342C2263726561746554696D65223A313539323637323030323030302C226475726174696F6E223A22363730222C226964223A3132342C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F30382F61623830323366313863666133353630386563623832326130323238303366642E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A2261646D696E222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F30382F61623830323366313863666133353630386563623832326130323238303366642E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F30382F63383539656330316132396262303836616261386661633363323537343636382E6D7034227D, 'o9UmdsyHzcrHqwf_YJD6PgAvweAg', 'admin', '551306489516527616');
INSERT INTO `sys_order` VALUES ('263', '551306682794250240', '100', '100', '3', 'wx12183934028836e14fa9cd401705325300', null, null, '1.00', '2', '2020-07-12 18:39:12', '2020-07-12 18:39:34', '125', 0x7B2263617465676F72794964223A3232372C22636C69636B223A342C2263726561746554696D65223A313539323637323030323030302C226475726174696F6E223A22313232222C226964223A3132352C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30362F32302F61616631323634343238373864343362376432373735636666383366636237342E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A2261646D696E222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30362F32302F61616631323634343238373864343362376432373735636666383366636237342E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30362F32302F62386537346132343432633534336466366437616237383734383634383464352E6D7034227D, 'o9UmdsyHzcrHqwf_YJD6PgAvweAg', 'admin', '551306489516527616');
INSERT INTO `sys_order` VALUES ('264', '551321121660604416', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-12 19:36:35', '2020-07-12 19:36:35', '426', 0x7B2263617465676F72794964223A3232372C22636C69636B223A302C2263726561746554696D65223A313539343535333734303030302C226475726174696F6E223A22313133222C226964223A3432362C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31322F38656236393939323064636437336535353434346633623733393065626338342E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22313131222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F38656236393939323064636437336535353434346633623733393065626338342E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F36306330373661333831653362613934323461393437326263643539643033662E6D7034227D, 'o9Umds47M8WyyJw8jz3NX7yoJyMg', 'admin', '551189300302057472');
INSERT INTO `sys_order` VALUES ('265', '551323179054796800', '100', '100', '3', 'wx121944470340809e38fa78321824084300', null, null, '1.00', '2', '2020-07-12 19:44:45', '2020-07-12 19:44:47', '426', 0x7B2263617465676F72794964223A3232372C22636C69636B223A302C2263726561746554696D65223A313539343535333734303030302C226475726174696F6E223A22313133222C226964223A3432362C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31322F38656236393939323064636437336535353434346633623733393065626338342E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22313131222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F38656236393939323064636437336535353434346633623733393065626338342E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F36306330373661333831653362613934323461393437326263643539643033662E6D7034227D, 'o9Umds5SA-CPfUZj94McFxFv486g', 'admin', '551190022972248064');
INSERT INTO `sys_order` VALUES ('266', '551323600397799424', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-12 19:46:26', '2020-07-12 19:46:26', '427', 0x7B2263617465676F72794964223A3232392C22636C69636B223A302C2263726561746554696D65223A313539343535343130373030302C226475726174696F6E223A223539222C226964223A3432372C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31322F65303765626636396461386537633631363863386431646530393561636431382E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22E5A4A7E5A5B6E5B091E5A687222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F65303765626636396461386537633631363863386431646530393561636431382E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F34393662653237373336356164336535643962303434636664393934313666312E6D7034227D, 'o9Umds47M8WyyJw8jz3NX7yoJyMg', 'admin', '551189300302057472');
INSERT INTO `sys_order` VALUES ('267', '551330240178163712', '100', '100', '3', 'wx122012504458133e4a2d9dca1786117000', null, null, '1.00', '2', '2020-07-12 20:12:49', '2020-07-12 20:12:50', '433', 0x7B2263617465676F72794964223A3232392C22636C69636B223A302C2263726561746554696D65223A313539343535353437333030302C226475726174696F6E223A22333331222C226964223A3433332C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31322F34376630383637386233616336666335353166633539626239626131653239612E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22E99984E8BF91E7BAA6E68898E5B08FE9AA9AE8B4A7222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F34376630383637386233616336666335353166633539626239626131653239612E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F37616634643136666433303335353036646333623332346633633135346266352E6D7034227D, 'o9Umds5SA-CPfUZj94McFxFv486g', 'admin', '551190022972248064');
INSERT INTO `sys_order` VALUES ('268', '551330457090789376', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-12 20:13:40', '2020-07-12 20:13:40', '429', 0x7B2263617465676F72794964223A3232392C22636C69636B223A302C2263726561746554696D65223A313539343535343933333030302C226475726174696F6E223A223531222C226964223A3432392C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31322F34353961623234643332653335623931313635336363316137653265633764382E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22E99984E8BF91E7BAA6E79A84E5B08FE5A790E5A790E5AEB3E7BE9EE4BA86222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F34353961623234643332653335623931313635336363316137653265633764382E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F65353537373063393865383136393961303533323066616438346165663132372E6D7034227D, 'o9UmdsxKZdsDH0078ZjgoximXC1U', 'admin', '551330228526387200');
INSERT INTO `sys_order` VALUES ('269', '551330486471888896', '100', '100', '3', 'wx12201351606190738259e04d1024073300', null, null, '1.00', '2', '2020-07-12 20:13:47', '2020-07-12 20:13:52', '427', 0x7B2263617465676F72794964223A3232392C22636C69636B223A302C2263726561746554696D65223A313539343535343130373030302C226475726174696F6E223A223539222C226964223A3432372C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31322F65303765626636396461386537633631363863386431646530393561636431382E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22E5A4A7E5A5B6E5B091E5A687222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F65303765626636396461386537633631363863386431646530393561636431382E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F34393662653237373336356164336535643962303434636664393934313666312E6D7034227D, 'o9UmdsxKZdsDH0078ZjgoximXC1U', 'admin', '551330228526387200');
INSERT INTO `sys_order` VALUES ('270', '551377885022130176', '100', '100', '3', 'wx122322102182251400c976b61836776900', null, null, '1.00', '2', '2020-07-12 23:22:08', '2020-07-12 23:22:10', '462', 0x7B2263617465676F72794964223A3232392C22636C69636B223A302C2263726561746554696D65223A313539343536363239343030302C226475726174696F6E223A22313130222C226964223A3436322C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31322F37353663383734366233653238623766363561383966303535626534333065302E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22E5A4A7E5A5B6E5AD90E7BE8EE5A5B3222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F37353663383734366233653238623766363561383966303535626534333065302E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F61323834663036656636396434333232383861363337383935376564616563332E6D7034227D, 'o9Umds7BgMc_-AIMowrmabOADars', 'admin', '551233490620780544');
INSERT INTO `sys_order` VALUES ('271', '551378033370468352', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-12 23:22:43', '2020-07-12 23:22:43', '453', 0x7B2263617465676F72794964223A3232392C22636C69636B223A302C2263726561746554696D65223A313539343536333730323030302C226475726174696F6E223A22313534222C226964223A3435332C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31322F39313433616633346538343936346662303266366466343338643935643035312E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22E4B880E8BEB9E79C8BE794B5E8A786E4B880E8BEB9E5819A222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F39313433616633346538343936346662303266366466343338643935643035312E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F33313332616362623435323737613366396530616431396132393664303734312E6D7034227D, 'o9Umds7BgMc_-AIMowrmabOADars', 'admin', '551233490620780544');
INSERT INTO `sys_order` VALUES ('272', '551378115230699520', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-12 23:23:03', '2020-07-12 23:23:03', '461', 0x7B2263617465676F72794964223A3232392C22636C69636B223A302C2263726561746554696D65223A313539343536353936323030302C226475726174696F6E223A223631222C226964223A3436312C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31322F30653630366462373164613538373739393330306432633234393130306135642E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22E5A4A7E5A5B6E7BE8EE5A5B3222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F30653630366462373164613538373739393330306432633234393130306135642E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F37363365346333303865656566663663313032373331653134313666383738392E6D7034227D, 'o9Umds7BgMc_-AIMowrmabOADars', 'admin', '551233490620780544');
INSERT INTO `sys_order` VALUES ('273', '551378126106529792', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-12 23:23:05', '2020-07-12 23:23:05', '460', 0x7B2263617465676F72794964223A3232392C22636C69636B223A302C2263726561746554696D65223A313539343536353836333030302C226475726174696F6E223A22313230222C226964223A3436302C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31322F31396663306462346339373638613538353735616364323066653430356166612E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22E4B880E8BEB9E68EA5E590BBE4B880E8BEB9E6938D222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F31396663306462346339373638613538353735616364323066653430356166612E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F39303835373261306363636562616232633134393262363763643832633962302E6D7034227D, 'o9Umds7BgMc_-AIMowrmabOADars', 'admin', '551233490620780544');
INSERT INTO `sys_order` VALUES ('274', '551378446526189568', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-12 23:24:22', '2020-07-12 23:24:22', '461', 0x7B2263617465676F72794964223A3232392C22636C69636B223A302C2263726561746554696D65223A313539343536353936323030302C226475726174696F6E223A223631222C226964223A3436312C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31322F30653630366462373164613538373739393330306432633234393130306135642E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22E5A4A7E5A5B6E7BE8EE5A5B3222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F30653630366462373164613538373739393330306432633234393130306135642E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F37363365346333303865656566663663313032373331653134313666383738392E6D7034227D, 'o9Umds3cEzEjXWVxSmFcmAkcRA-s', 'admin', '551378395959660544');
INSERT INTO `sys_order` VALUES ('275', '551387936382259200', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-13 00:02:04', '2020-07-13 00:02:04', '426', 0x7B2263617465676F72794964223A3232372C22636C69636B223A302C2263726561746554696D65223A313539343535333734303030302C226475726174696F6E223A22313133222C226964223A3432362C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31322F38656236393939323064636437336535353434346633623733393065626338342E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22313131222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F38656236393939323064636437336535353434346633623733393065626338342E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F36306330373661333831653362613934323461393437326263643539643033662E6D7034227D, 'o9Umds_VOxYfdxvq2sjpZlp2Cou8', 'admin', '551185112876716032');
INSERT INTO `sys_order` VALUES ('276', '551388623455391744', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-13 00:04:48', '2020-07-13 00:04:48', '465', 0x7B2263617465676F72794964223A3232392C22636C69636B223A302C2263726561746554696D65223A313539343536393534343030302C226475726174696F6E223A22323038222C226964223A3436352C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31322F66373863373762323863386236613365386135613862336234643734663161612E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22E883A1E8909DE58D9CE693A6E9AA9AE980BC222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F66373863373762323863386236613365386135613862336234643734663161612E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F31336462316238393833636162376634393863616362356362373235373135362E6D7034227D, 'o9Umds47M8WyyJw8jz3NX7yoJyMg', 'admin', '551189300302057472');
INSERT INTO `sys_order` VALUES ('277', '551390894205440000', '100', '100', '3', 'wx13001351626756d55cd971691126448100', null, null, '1.00', '2', '2020-07-13 00:13:50', '2020-07-13 00:13:52', '467', 0x7B2263617465676F72794964223A3231382C22636C69636B223A302C2263726561746554696D65223A313539343537303430303030302C226475726174696F6E223A22323039222C226964223A3436372C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31332F30353837386366336336653036656339393337353233333832383665656234392E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22E7A9BFE79D80E4B89DE8A29CE689A3E79D80E5B08FE7A9B4222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31332F30353837386366336336653036656339393337353233333832383665656234392E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31332F39353166343731613537393261336666363130313636353531346563613236332E6D7034227D, 'o9Umds5SA-CPfUZj94McFxFv486g', 'admin', '551190022972248064');
INSERT INTO `sys_order` VALUES ('278', '551390995833425920', '100', '100', '3', 'wx13001416636273148ec4f4141039304400', null, null, '1.00', '2', '2020-07-13 00:14:14', '2020-07-13 00:14:17', '456', 0x7B2263617465676F72794964223A3232392C22636C69636B223A302C2263726561746554696D65223A313539343536353332383030302C226475726174696F6E223A22323930222C226964223A3435362C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31322F37633163626437353663363765376636346634333166626663343338633130332E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22E5B9B2E4BA86E588ABE4BABAE5A5B3E69C8BE58F8B222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F37633163626437353663363765376636346634333166626663343338633130332E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F64343735373639633530663162386533643735393831633564636363333061652E6D7034227D, 'o9Umds5SA-CPfUZj94McFxFv486g', 'admin', '551190022972248064');
INSERT INTO `sys_order` VALUES ('279', '551589385942863872', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-13 13:22:34', '2020-07-13 13:22:34', '470', 0x7B2263617465676F72794964223A3230302C22636C69636B223A302C2263726561746554696D65223A313539343537333630333030302C226964223A3437302C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31332F63333332646163383765633864643731316438636139623336656366313835332E706E67222C226D6F6E6579223A22322D35222C226E616D65223A22313131222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31332F63333332646163383765633864643731316438636139623336656366313835332E706E67222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F35646430636262303034373633363265343164363362386238623963393838322E6D7034227D, 'o9Umds47M8WyyJw8jz3NX7yoJyMg', 'admin', '551189300302057472');
INSERT INTO `sys_order` VALUES ('280', '551690464835670016', '100', '100', '3', 'wx13200414635791116040518e1415241800', null, null, '1.00', '2', '2020-07-13 20:04:13', '2020-07-13 20:04:15', '470', 0x7B2263617465676F72794964223A3230302C22636C69636B223A302C2263726561746554696D65223A313539343537333630333030302C226964223A3437302C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31332F63333332646163383765633864643731316438636139623336656366313835332E706E67222C226D6F6E6579223A22322D35222C226E616D65223A22313131222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31332F63333332646163383765633864643731316438636139623336656366313835332E706E67222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F35646430636262303034373633363265343164363362386238623963393838322E6D7034227D, 'o9Umds5SA-CPfUZj94McFxFv486g', 'admin', '551190022972248064');
INSERT INTO `sys_order` VALUES ('281', '551759342521552896', '100', '100', '3', 'wx1400375673399243514552911514945200', null, null, '1.00', '2', '2020-07-14 00:37:55', '2020-07-14 00:37:57', '463', 0x7B2263617465676F72794964223A3231382C22636C69636B223A302C2263726561746554696D65223A313539343536393038303030302C226475726174696F6E223A223634222C226964223A3436332C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31322F61323434383032316337353833333961393438346430313131316664656363632E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22E887AAE685B0E689A3E79A84E596B7E6B0B4222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F61323434383032316337353833333961393438346430313131316664656363632E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F38386334636362636463386238363633343333623065373539333461353038322E6D7034227D, 'o9Umds47M8WyyJw8jz3NX7yoJyMg', 'admin', '551189300302057472');
INSERT INTO `sys_order` VALUES ('282', '551856867354087424', '100', '100', '3', 'wx141504581403963aab9ecfee1669525800', null, null, '1.00', '2', '2020-07-14 07:05:26', '2020-07-14 15:04:58', '470', 0x7B2263617465676F72794964223A3230302C22636C69636B223A302C2263726561746554696D65223A313539343537333630333030302C226964223A3437302C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31332F63333332646163383765633864643731316438636139623336656366313835332E706E67222C226D6F6E6579223A22322D35222C226E616D65223A22313131222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31332F63333332646163383765633864643731316438636139623336656366313835332E706E67222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F35646430636262303034373633363265343164363362386238623963393838322E6D7034227D, 'o9Umds_VOxYfdxvq2sjpZlp2Cou8', 'admin', '551185112876716032');
INSERT INTO `sys_order` VALUES ('283', '551909341775532032', '100', '100', '3', 'wx1410335928769934cd9038011033327900', null, null, '1.00', '2', '2020-07-14 10:33:57', '2020-07-14 10:33:59', '464', 0x7B2263617465676F72794964223A3232392C22636C69636B223A302C2263726561746554696D65223A313539343536393231373030302C226475726174696F6E223A22323231222C226964223A3436342C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31322F63626265363636633634663662333433633166613436613435653064323365662E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22E5B9B2E79A84E9AA9AE8B4A7E4B880E79BB4E58FAB222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F63626265363636633634663662333433633166613436613435653064323365662E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F30333033346462626261316233323763316538323261386438636164653534392E6D7034227D, 'o9Umds5SA-CPfUZj94McFxFv486g', 'admin', '551190022972248064');
INSERT INTO `sys_order` VALUES ('284', '551909515159670784', '100', '100', '3', 'wx1410344113296306b8b2f33d1725847700', null, null, '1.00', '2', '2020-07-14 10:34:38', '2020-07-14 10:34:41', '470', 0x7B2263617465676F72794964223A3230302C22636C69636B223A302C2263726561746554696D65223A313539343537333630333030302C226964223A3437302C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31332F63333332646163383765633864643731316438636139623336656366313835332E706E67222C226D6F6E6579223A22322D35222C226E616D65223A22313131222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31332F63333332646163383765633864643731316438636139623336656366313835332E706E67222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F35646430636262303034373633363265343164363362386238623963393838322E6D7034227D, 'o9UmdswN7syW2u5LlvLww-4P5FQc', 'admin', '551909435954434048');
INSERT INTO `sys_order` VALUES ('285', '551909547791355904', '100', '100', '3', 'wx141034474753281b148120471578661500', null, null, '1.00', '2', '2020-07-14 10:34:46', '2020-07-14 10:34:48', '462', 0x7B2263617465676F72794964223A3232392C22636C69636B223A302C2263726561746554696D65223A313539343536363239343030302C226475726174696F6E223A22313130222C226964223A3436322C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31322F37353663383734366233653238623766363561383966303535626534333065302E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22E5A4A7E5A5B6E5AD90E7BE8EE5A5B3222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F37353663383734366233653238623766363561383966303535626534333065302E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F61323834663036656636396434333232383861363337383935376564616563332E6D7034227D, 'o9Umds5SA-CPfUZj94McFxFv486g', 'admin', '551190022972248064');
INSERT INTO `sys_order` VALUES ('286', '551977647794556928', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-14 15:05:23', '2020-07-14 15:05:23', '463', 0x7B2263617465676F72794964223A3231382C22636C69636B223A302C2263726561746554696D65223A313539343536393038303030302C226475726174696F6E223A223634222C226964223A3436332C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31322F61323434383032316337353833333961393438346430313131316664656363632E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22E887AAE685B0E689A3E79A84E596B7E6B0B4222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F61323434383032316337353833333961393438346430313131316664656363632E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31322F38386334636362636463386238363633343333623065373539333461353038322E6D7034227D, 'o9Umds_VOxYfdxvq2sjpZlp2Cou8', 'admin', '551185112876716032');
INSERT INTO `sys_order` VALUES ('287', '552024658845634560', '100', '100', '3', 'wx141812123006312a05f1d9bb1113072900', null, null, '1.00', '2', '2020-07-14 18:12:11', '2020-07-14 18:12:12', '468', 0x7B2263617465676F72794964223A3233302C22636C69636B223A302C2263726561746554696D65223A313539343537303537393030302C226475726174696F6E223A22313530222C226964223A3436382C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31332F37653031343731313530316534393632663530633638343030663138363265632E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22E590ABE79D80E4BDA0E79A84E5A4A7E5B18C222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31332F37653031343731313530316534393632663530633638343030663138363265632E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31332F35656466323834326162323864313064323032333562306665656162333562632E6D7034227D, 'o9Umds5SA-CPfUZj94McFxFv486g', 'admin', '551190022972248064');
INSERT INTO `sys_order` VALUES ('288', '552422229829226496', '100', '100', '3', 'wx15203210828347388e7e761d1028838400', null, null, '1.00', '2', '2020-07-15 20:31:59', '2020-07-15 20:32:11', '512', 0x7B2263617465676F72794964223A3237322C22636C69636B223A302C2263726561746554696D65223A313539343831363139323030302C226373223A223337323739222C226964223A3531322C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A2268747470733A2F2F74702E6A69616C697A79772E636F6D2F6C756E6C697069632F32303230303431332D4B522F6C6F7759366F75332E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22E9878EE5A496E79A84E588BAE6BF80222C2273686F727455726C223A22222C2275726C223A2268747470733A2F2F74702E6A69616C697A79772E636F6D2F6C756E6C697069632F32303230303431332D4B522F6C6F7759366F75332E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A22E7ACACE4B880E99B862468747470733A2F2F7664362E7A68697975616E686F6E6764612E636F6D2F32303230303431332F6C6F7759366F75332F696E6465782E6D337538227D, 'o9Umds5eW9V_frIrZ5w0k6ajDKlI', 'admin', '552422122555707392');
INSERT INTO `sys_order` VALUES ('289', '552426327932669952', '100', '100', '3', 'wx15204818100710dbdec743e61102622100', null, null, '1.00', '2', '2020-07-15 20:48:16', '2020-07-15 20:48:18', '512', 0x7B2263617465676F72794964223A3237322C22636C69636B223A302C2263726561746554696D65223A313539343831363139323030302C226373223A223337323739222C226964223A3531322C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A2268747470733A2F2F74702E6A69616C697A79772E636F6D2F6C756E6C697069632F32303230303431332D4B522F6C6F7759366F75332E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22E9878EE5A496E79A84E588BAE6BF80222C2273686F727455726C223A22222C2275726C223A2268747470733A2F2F74702E6A69616C697A79772E636F6D2F6C756E6C697069632F32303230303431332D4B522F6C6F7759366F75332E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A2268747470733A2F2F7664362E7A68697975616E686F6E6764612E636F6D2F32303230303431332F6C6F7759366F75332F696E6465782E6D337538227D, 'o9Umds47M8WyyJw8jz3NX7yoJyMg', 'admin', '551189300302057472');
INSERT INTO `sys_order` VALUES ('290', '552428275725504512', '100', '100', '3', '4200000588202007156167968564', null, '2020-07-15 20:56:07', '1.00', '1', '2020-07-15 20:56:01', '2020-07-15 20:56:08', '513', 0x7B2263617465676F72794964223A3237322C22636C69636B223A302C2263726561746554696D65223A313539343831363139323030302C226373223A223337323738222C226964223A3531332C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A2268747470733A2F2F74702E6A69616C697A79772E636F6D2F6C756E6C697069632F32303230303431332D4B522F446435396F5555362E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A22E5B2B3E6AF8DE4B88EE68891E79A84E7A798E4BA8B222C2273686F727455726C223A22222C2275726C223A2268747470733A2F2F74702E6A69616C697A79772E636F6D2F6C756E6C697069632F32303230303431332D4B522F446435396F5555362E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A2268747470733A2F2F7664362E7A68697975616E686F6E6764612E636F6D2F32303230303431332F446435396F5555362F696E6465782E6D337538227D, 'o9Umds47M8WyyJw8jz3NX7yoJyMg', 'admin', '551189300302057472');
INSERT INTO `sys_order` VALUES ('291', '552437251368292352', '100', '100', '3', 'wx152131461327985ae874f5271505169500', null, null, '1.00', '2', '2020-07-15 21:31:41', '2020-07-15 21:31:46', '523', 0x7B2263617465676F72794964223A3237332C22636C69636B223A302C2263726561746554696D65223A313539343831363139323030302C226373223A223337323638222C226964223A3532332C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A2268747470733A2F2F74702E6A69616C697A79772E636F6D2F75706C6F61642F766F642F32303230303730392D312F61396663636663643434343630626465643930653634353965323064376366322E6A7067222C226D6F6E6579223A22322D35222C226E616D65223A225BE4B8ADE69687E4B8BBE692ADE5A496E6B5815DE9AB98E9A29CE580BCE58FAFE788B1E7BE8EE5A5B3E68385E6ACB2E99ABEE88090E887AAE685B0E9AB98E6BDAEE7B289E5ABA9E9B28DE9B1BC222C2273686F727455726C223A22222C2275726C223A2268747470733A2F2F74702E6A69616C697A79772E636F6D2F75706C6F61642F766F642F32303230303730392D312F61396663636663643434343630626465643930653634353965323064376366322E6A7067222C22757365724964223A2261646D696E222C22766964656F55726C223A2268747470733A2F2F766964656F2E6A69616C697A79772E636F6D3A383830302F32303230303730382F6F654B736C5843762F696E6465782E6D337538227D, 'o9Umds5EaybLuEXX_X_vlKISKw1c', 'admin', '552024694258143232');
INSERT INTO `sys_order` VALUES ('292', '552445754828918784', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-15 22:05:28', '2020-07-15 22:05:28', '547', 0x7B2263617465676F72794964223A3231382C22636C69636B223A302C2263726561746554696D65223A313539343832313632313030302C226475726174696F6E223A22323137222C226964223A3534372C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31352F34646362353865653061386464626130656365633261333930306565626263332E706E67222C226D6F6E6579223A22322D35222C226E616D65223A22E6B0B4E6B1AAE6B1AAE79A84E5B08FE9AA9AE8B4A7222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31352F34646362353865653061386464626130656365633261333930306565626263332E706E67222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31352F65356535303832656231363333356264326163616333373132623736386536312E6D7034227D, 'o9Umds47M8WyyJw8jz3NX7yoJyMg', 'admin', '551189300302057472');
INSERT INTO `sys_order` VALUES ('293', '552520995525627904', '100', '100', '3', 'wx16131912561808eb362be3fa1291992300', null, null, '1.00', '2', '2020-07-16 03:04:27', '2020-07-16 13:19:13', '546', 0x7B2263617465676F72794964223A3232392C22636C69636B223A302C2263726561746554696D65223A313539343832313534343030302C226475726174696F6E223A22323034222C226964223A3534362C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31352F39363631363932376164383061356564343333633364366436633565653730612E706E67222C226D6F6E6579223A22322D35222C226E616D65223A22E68385E4BEA3E8AEB8E4B985E4B88DE8A781E6BF80E68385E5819AE788B1222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31352F39363631363932376164383061356564343333633364366436633565653730612E706E67222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31352F66333433663637656635396337326138333631383935653939393632653237332E6D7034227D, 'o9Umds4QVp05ymmUIN1kuGHW0_r8', 'admin', '552520928622284800');
INSERT INTO `sys_order` VALUES ('294', '552521006665699328', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-16 03:04:29', '2020-07-16 03:04:29', '545', 0x7B2263617465676F72794964223A3231382C22636C69636B223A302C2263726561746554696D65223A313539343832313436383030302C226475726174696F6E223A22323231222C226964223A3534352C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31352F31316662663633373137656433333937626261373932313565636534306532312E706E67222C226D6F6E6579223A22322D35222C226E616D65223A22E7BE8EE5B091E5A687E887AAE685B0E8B685E5A49AE5B091222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31352F31316662663633373137656433333937626261373932313565636534306532312E706E67222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31352F37363465313262393963663761373363393761316337663465313265326637302E6D7034227D, 'o9Umds4QVp05ymmUIN1kuGHW0_r8', 'admin', '552520928622284800');
INSERT INTO `sys_order` VALUES ('295', '552521024114003968', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-16 03:04:34', '2020-07-16 03:04:34', '544', 0x7B2263617465676F72794964223A3232372C22636C69636B223A302C2263726561746554696D65223A313539343832313430363030302C226475726174696F6E223A22313835222C226964223A3534342C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31352F64356632666566343938623830326538313631313035616461326235373539652E706E67222C226D6F6E6579223A22322D35222C226E616D65223A22E98592E5BA97E581B7E68B8DE581B7E68385E794B7E5A5B3222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31352F64356632666566343938623830326538313631313035616461326235373539652E706E67222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31352F64363731323034643063366632383663636331383964323832323036643939382E6D7034227D, 'o9Umds4QVp05ymmUIN1kuGHW0_r8', 'admin', '552520928622284800');
INSERT INTO `sys_order` VALUES ('296', '552521029751148544', '100', '100', '1', null, null, null, '1.00', '0', '2020-07-16 03:04:35', '2020-07-16 03:04:35', '543', 0x7B2263617465676F72794964223A3233302C22636C69636B223A302C2263726561746554696D65223A313539343832313333323030302C226475726174696F6E223A22313437222C226964223A3534332C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31352F37313431353335373132356131326439626330363635643664346465363330322E706E67222C226D6F6E6579223A22322D35222C226E616D65223A22E4B880E8BEB9E59083E5A4A7E5B18CE4B880E8BEB9E887AAE68B8D222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31352F37313431353335373132356131326439626330363635643664346465363330322E706E67222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31352F35623263613834616237333166623231353065666332343432663232623031662E6D7034227D, 'o9Umds4QVp05ymmUIN1kuGHW0_r8', 'admin', '552520928622284800');
INSERT INTO `sys_order` VALUES ('297', '552589022082371584', '100', '100', '3', 'wx160734476599794335bcfb571109191500', null, null, '1.00', '2', '2020-07-16 07:34:46', '2020-07-16 07:34:48', '548', 0x7B2263617465676F72794964223A3232392C22636C69636B223A302C2263726561746554696D65223A313539343832323531303030302C226475726174696F6E223A22313133222C226964223A3534382C226973416C6C6F77223A747275652C2269734C6569223A747275652C22697350726576696577223A66616C73652C226C6F676F223A222F70726F66696C652F75706C6F61642F323032302F30372F31352F63613634386639333063383662643632333131623962326165393261303163342E706E67222C226D6F6E6579223A22322D35222C226E616D65223A22E78EA9E79D80E6898BE69CBAE8A2ABE6938D222C2273686F727455726C223A22222C2275726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31352F63613634386639333063383662643632333131623962326165393261303163342E706E67222C22757365724964223A2261646D696E222C22766964656F55726C223A22687474703A2F2F61646D696E2E67726B6663732E636E2F70726F66696C652F75706C6F61642F323032302F30372F31352F33663332343462613330333736633731393935313235653965313933333838642E6D7034227D, 'o9Umds_VOxYfdxvq2sjpZlp2Cou8', 'admin', '551185112876716032');

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
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-06-20 22:16:47', '普通角色');

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
INSERT INTO `sys_role_menu` VALUES ('2', '2007');
INSERT INTO `sys_role_menu` VALUES ('2', '2008');
INSERT INTO `sys_role_menu` VALUES ('2', '2009');
INSERT INTO `sys_role_menu` VALUES ('2', '2010');
INSERT INTO `sys_role_menu` VALUES ('2', '2011');
INSERT INTO `sys_role_menu` VALUES ('2', '2090');
INSERT INTO `sys_role_menu` VALUES ('2', '2091');
INSERT INTO `sys_role_menu` VALUES ('2', '2093');
INSERT INTO `sys_role_menu` VALUES ('2', '2100');
INSERT INTO `sys_role_menu` VALUES ('2', '2101');
INSERT INTO `sys_role_menu` VALUES ('2', '2102');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_short
-- ----------------------------
INSERT INTO `sys_short` VALUES ('16', 'admin', 'http://suo.im/5PfOOd', 'http://grkfcs.cn/?userId=admin', '0', '2020-07-07 11:49:15', '2020-07-07 11:54:31');

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
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', 'admin', '00', 'ry@163.com', '15888888888', '0', '/profile/avatar/2020/06/20/2bc7e27b3b43142fed9918e9dbcdc563.png', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '118.78.249.178, 172.16.0.101', '2020-07-16 16:42:26', 'admin', '2018-03-16 11:33:00', 'ry', '2020-07-16 16:42:25', '管理员', null, null);
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
INSERT INTO `sys_user` VALUES ('130', '105', 'QC6JpwMg', 'QC6JpwMg', '00', 'system@163.com', '18086738884', '1', '', '50524e3f0b19d72540559565e3e6953a', '34ef56', '0', '0', '139.227.73.78, 172.16.0.101', '2020-06-20 22:16:55', 'admin', '2020-06-20 22:16:04', '', '2020-06-20 22:16:54', '代理用户', 'QC6JpwMg', 'QC6JpwMg');
INSERT INTO `sys_user` VALUES ('131', '105', 'i8NavF5U', 'i8NavF5U', '00', 'system@163.com', '18898667778', '1', '', '3fd3cf6b5c054f7445bdf42ac51f3b7d', 'dd4aec', '0', '0', '139.227.73.78, 172.16.0.101', '2020-06-26 18:36:50', 'admin', '2020-06-26 18:36:46', '', '2020-06-26 18:36:50', '代理用户', 'i8NavF5U', 'i8NavF5U');
INSERT INTO `sys_user` VALUES ('132', '105', 'R4zrXRJc', 'R4zrXRJc', '00', 'system@163.com', '13016070897', '1', '', '07984b995fa7a8f451aa3c82b4865130', '36dfd2', '0', '0', '139.227.73.78, 172.16.0.101', '2020-06-26 18:41:38', 'admin', '2020-06-26 18:41:31', '', '2020-06-26 18:41:37', '代理用户', 'R4zrXRJc', 'R4zrXRJc');
INSERT INTO `sys_user` VALUES ('133', '105', 'LEd2A7Es', 'LEd2A7Es', '00', 'system@163.com', '14977930161', '1', '', '44d06bfb7dd8e00abdca1e5027b24720', 'bd5826', '0', '0', '139.227.73.78, 172.16.0.101', '2020-06-26 18:48:52', 'admin', '2020-06-26 18:48:47', '', '2020-06-26 18:48:52', '代理用户', 'LEd2A7Es', 'LEd2A7Es');

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
INSERT INTO `sys_user_post` VALUES ('130', '4');
INSERT INTO `sys_user_post` VALUES ('131', '4');
INSERT INTO `sys_user_post` VALUES ('132', '4');
INSERT INTO `sys_user_post` VALUES ('133', '4');

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
INSERT INTO `sys_user_role` VALUES ('130', '2');
INSERT INTO `sys_user_role` VALUES ('131', '2');
INSERT INTO `sys_user_role` VALUES ('132', '2');
INSERT INTO `sys_user_role` VALUES ('133', '2');

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
INSERT INTO `sys_web_main` VALUES ('7', 'http://video.grkfcs.cn', '0', '2020-04-08 22:04:04', '2020-06-20 16:04:46');

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
INSERT INTO `sys_wechat_config` VALUES ('10', 'WY_FULI', 'dev', 'wx590af156c3a3eae9', '8af481db51cd509f26c857a75712c9ce', '1600946459', '22f5c38598681b0d5179d84fc3bc576a', null, null, null, '2016-12-13 00:00:00', '2020-04-01 00:00:00', null, '2020-07-15 21:03:17');
INSERT INTO `sys_wechat_config` VALUES ('11', 'WY_FULI', 'druid', 'wx590af156c3a3eae9', '8af481db51cd509f26c857a75712c9ce', '1600946459', '22f5c38598681b0d5179d84fc3bc576a', null, null, null, '2020-04-01 00:00:00', '2020-04-01 00:00:00', null, '2020-07-12 10:43:19');
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
  `status` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
  `content` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '内容',
  `duration` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '时间',
  `typeto` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `sid` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_id` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=319879 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of t_user_detail
-- ----------------------------
INSERT INTO `t_user_detail` VALUES ('319865', '551185112876716032', '6ZSZ5Yir5a2X44CC', null, '男', null, null, null, '2020-07-12 10:36:08', null, '2020-07-12 10:36:08', null, null, null, '', null, null, null, 'http://thirdwx.qlogo.cn/mmopen/vi_32/6sc2eGibKjFpmib7vRlr7kyMGuTvtLoiaiaGguPK0jyRFLJsrj4l6TCLYdEB9hsGeCh40tghOiapWNW1GYHBeCNb2Iw/132', null, null, null);
INSERT INTO `t_user_detail` VALUES ('319866', '551189300302057472', '5Lmx5LqG5oCd57uq8J+MtPCfjLQ=', null, '男', null, null, null, '2020-07-12 10:52:46', null, '2020-07-12 10:52:46', null, null, null, '', null, null, null, 'http://thirdwx.qlogo.cn/mmopen/vi_32/mDpM0MCHSKOOfyXNTGqN7Jl4pdgJdCXQ3WbDDsibMs6iaIwCOpwH78J7JgOExnTccNW3CBqmesvNibRRqvB1Adqbw/132', null, null, null);
INSERT INTO `t_user_detail` VALUES ('319867', '551190022972248064', '5rip5rC054Wu6Z2S6JuZ8J+QuA==', null, '男', null, null, null, '2020-07-12 10:55:38', null, '2020-07-12 10:55:38', null, null, null, '', null, null, null, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DS6LibqUcgROqe4cA9xs3Ve5IwNd4VWBJfLbPSOQg5dEibBtk4LHgdEaonThvF1rjGyo397yQmxLlLibSLsxhkRCQ/132', null, null, null);
INSERT INTO `t_user_detail` VALUES ('319868', '551225663453925376', '5a+w', null, '男', null, null, null, '2020-07-12 13:17:16', null, '2020-07-12 13:17:16', null, null, null, '', null, null, null, 'http://thirdwx.qlogo.cn/mmopen/vi_32/NYfjRelia7DPC4NOkCS5pkSC6BhYvu1Tiaiaicv94cBPXmvfZstokW6AMtQ4yViaNicMecNHJ8D81V9Mc2FMmGES9yOA/132', null, null, null);
INSERT INTO `t_user_detail` VALUES ('319869', '551233490620780544', '5oub6LSi54yr', null, '男', null, null, null, '2020-07-12 13:48:22', null, '2020-07-12 13:48:22', null, null, null, '', null, null, null, 'http://thirdwx.qlogo.cn/mmopen/vi_32/0TenicClhple4RW88GicFMHveUMiaRSVv1DRqicLqXmbiakXmx7hZec5vEdibrFiaTyVXEhEnME3xDXZ97tXnd6nJhZicQ/132', null, null, null);
INSERT INTO `t_user_detail` VALUES ('319870', '551306489516527616', '6Z2S6JuZ', null, '男', null, null, null, '2020-07-12 18:38:26', null, '2020-07-12 18:38:26', null, null, null, '', null, null, null, 'http://thirdwx.qlogo.cn/mmopen/vi_32/PB2a87kgfSgFqTAXqXAnQFPgqkxQ8W9AQ2GgI7amwTKIyqA5x83UoX5icRez6tibRSHgkaSmsxUQdicE197ia7FxwQ/132', null, null, null);
INSERT INTO `t_user_detail` VALUES ('319871', '551330228526387200', '8J+OqQ==', null, '男', null, null, null, '2020-07-12 20:12:46', null, '2020-07-12 20:12:46', null, null, null, '', null, null, null, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLnVds6ibZicIYXh2JibAI665aexKwDZyZKHkB4g3dWHxrsaN1ibZp3wz2oeS8ZuU2JmG5YVuLoXBkKvQ/132', null, null, null);
INSERT INTO `t_user_detail` VALUES ('319872', '551378395959660544', '6auY5Ya355qE5bCP5aeQ5aeQ', null, '女', null, null, null, '2020-07-12 23:24:10', null, '2020-07-12 23:24:10', null, null, null, '', null, null, null, 'http://thirdwx.qlogo.cn/mmopen/vi_32/8gCZia6ZyNbJee35BuKTDzpK7tnt8gCy9vF2icf9XpbtdW5dM018mN6rQ3ICFRibnVUZVTSFkqibJGm8iaEtXlCMHsQ/132', null, null, null);
INSERT INTO `t_user_detail` VALUES ('319873', '551378655050207232', '5bGx6bih5ZOlIPCfpoVRUfCfpoUxNzk0NzE5NzQ5', null, '男', null, null, null, '2020-07-12 23:25:12', null, '2020-07-12 23:25:12', null, null, null, '', null, null, null, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKrvoHticYQpagMO4teU5TZoqNSF2IJO6mcg7OwaKskbprashMkEmVDqEiceRtYSx5mcSWHpmQkbia2w/132', null, null, null);
INSERT INTO `t_user_detail` VALUES ('319874', '551909435954434048', '8J+HqPCfh7MgIOm6puWFnOWFnC7pqbHliqgu6L2v54Gv5bimLg==', null, '女', null, null, null, '2020-07-14 10:34:20', null, '2020-07-14 10:34:20', null, null, null, '', null, null, null, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJMByJvGle7HtsiapEwXiaUCqTGUFmEgMqQLpWrZmH0t5CSDWW1Jb3rkfe0hq5UzpChYUJPJAlXOJpg/132', null, null, null);
INSERT INTO `t_user_detail` VALUES ('319875', '552024694258143232', '6b6Z6KGM5aSp5LiL', null, '男', null, null, null, '2020-07-14 18:12:19', null, '2020-07-14 18:12:19', null, null, null, '', null, null, null, 'http://thirdwx.qlogo.cn/mmopen/vi_32/mI1DDvbm2VbVl4PbLRWw3QeMibq0hVrr11Frb0VfgibIYnQeWbQX5R1LDVhIasZnmv1KuzyvWkRVaRbicJaozA2oA/132', null, null, null);
INSERT INTO `t_user_detail` VALUES ('319876', '552422122555707392', '5pyV5ZKM5aiY5aiY5riF55m955qE44CC', null, '男', null, null, null, '2020-07-15 20:31:34', null, '2020-07-15 20:31:34', null, null, null, '', null, null, null, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqJTL87sQqYcBU1kgurc9H54qqZB4anE4RPFhjYlicLyCriaTFTiagy7IhvVk7sfFrTyzO3icn7ZPy32Q/132', null, null, null);
INSERT INTO `t_user_detail` VALUES ('319877', '552448858311888896', '5rW35a+S', null, '男', null, null, null, '2020-07-15 22:17:48', null, '2020-07-15 22:17:48', null, null, null, '', null, null, null, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83epRK5v3IkvSft2VbGEAuEwo662Xo2J8uJDlic9Ej7GniaLj8k6oR41wTKibRNsTysoqsUQUlKxHb8icEg/132', null, null, null);
INSERT INTO `t_user_detail` VALUES ('319878', '552520928622284800', '6Zi/LuaIkeaYr+W8oOWwj+i0sfCfpbQu5oiR5bCx5ZKb5LmI6LSx8J+kow==', null, '女', null, null, null, '2020-07-16 03:04:11', null, '2020-07-16 03:04:11', null, null, null, '', null, null, null, 'http://thirdwx.qlogo.cn/mmopen/vi_32/KaxJnOA414rtm0A4vbcgzxYqJ0w78Z6ibibgcDYZsib95NibVGm59mbQLMWBBENkicugBCAX8zLIUIz8sgLQH3AzFlA/132', null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=319101 DEFAULT CHARSET=utf8 COMMENT='小程序授权信息表\r\n';

-- ----------------------------
-- Records of t_wechat_auth
-- ----------------------------
INSERT INTO `t_wechat_auth` VALUES ('319087', 'o9Umds_VOxYfdxvq2sjpZlp2Cou8', '551185112876716032', '1', 'wx590af156c3a3eae9', null, '\\0', '2020-07-12 10:36:08', null, '2020-07-12 10:36:08', null);
INSERT INTO `t_wechat_auth` VALUES ('319088', 'o9Umds47M8WyyJw8jz3NX7yoJyMg', '551189300302057472', '1', 'wx590af156c3a3eae9', null, '\\0', '2020-07-12 10:52:46', null, '2020-07-12 10:52:46', null);
INSERT INTO `t_wechat_auth` VALUES ('319089', 'o9Umds5SA-CPfUZj94McFxFv486g', '551190022972248064', '1', 'wx590af156c3a3eae9', null, '\\0', '2020-07-12 10:55:38', null, '2020-07-12 10:55:38', null);
INSERT INTO `t_wechat_auth` VALUES ('319090', 'o9Umds5yWXdZfmR_oTAwpShoq9MY', '551225663453925376', '1', 'wx590af156c3a3eae9', null, '\\0', '2020-07-12 13:17:16', null, '2020-07-12 13:17:16', null);
INSERT INTO `t_wechat_auth` VALUES ('319091', 'o9Umds7BgMc_-AIMowrmabOADars', '551233490620780544', '1', 'wx590af156c3a3eae9', null, '\\0', '2020-07-12 13:48:22', null, '2020-07-12 13:48:22', null);
INSERT INTO `t_wechat_auth` VALUES ('319092', 'o9UmdsyHzcrHqwf_YJD6PgAvweAg', '551306489516527616', '1', 'wx590af156c3a3eae9', null, '\\0', '2020-07-12 18:38:26', null, '2020-07-12 18:38:26', null);
INSERT INTO `t_wechat_auth` VALUES ('319093', 'o9UmdsxKZdsDH0078ZjgoximXC1U', '551330228526387200', '1', 'wx590af156c3a3eae9', null, '\\0', '2020-07-12 20:12:46', null, '2020-07-12 20:12:46', null);
INSERT INTO `t_wechat_auth` VALUES ('319094', 'o9Umds3cEzEjXWVxSmFcmAkcRA-s', '551378395959660544', '1', 'wx590af156c3a3eae9', null, '\\0', '2020-07-12 23:24:10', null, '2020-07-12 23:24:10', null);
INSERT INTO `t_wechat_auth` VALUES ('319095', 'o9UmdsyUB_RJEip7Yyp3YQLDjo58', '551378655050207232', '1', 'wx590af156c3a3eae9', null, '\\0', '2020-07-12 23:25:12', null, '2020-07-12 23:25:12', null);
INSERT INTO `t_wechat_auth` VALUES ('319096', 'o9UmdswN7syW2u5LlvLww-4P5FQc', '551909435954434048', '1', 'wx590af156c3a3eae9', null, '\\0', '2020-07-14 10:34:20', null, '2020-07-14 10:34:20', null);
INSERT INTO `t_wechat_auth` VALUES ('319097', 'o9Umds5EaybLuEXX_X_vlKISKw1c', '552024694258143232', '1', 'wx590af156c3a3eae9', null, '\\0', '2020-07-14 18:12:19', null, '2020-07-14 18:12:19', null);
INSERT INTO `t_wechat_auth` VALUES ('319098', 'o9Umds5eW9V_frIrZ5w0k6ajDKlI', '552422122555707392', '1', 'wx590af156c3a3eae9', null, '\\0', '2020-07-15 20:31:34', null, '2020-07-15 20:31:34', null);
INSERT INTO `t_wechat_auth` VALUES ('319099', 'o9Umds8TBzPWJDo-liiwecl0C3a8', '552448858311888896', '1', 'wx590af156c3a3eae9', null, '\\0', '2020-07-15 22:17:48', null, '2020-07-15 22:17:48', null);
INSERT INTO `t_wechat_auth` VALUES ('319100', 'o9Umds4QVp05ymmUIN1kuGHW0_r8', '552520928622284800', '1', 'wx590af156c3a3eae9', null, '\\0', '2020-07-16 03:04:11', null, '2020-07-16 03:04:11', null);

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
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源设置的打赏金额',
  `sj` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '选择模式 1为 开启随机金额分配',
  `cs` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '打赏人数',
  `url` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '打赏图片',
  `user_id` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户ID',
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源名称',
  `video_url` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL,
  `duration` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `lx` varchar(8) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL,
  `logo` varchar(120) CHARACTER SET utf8 NOT NULL,
  `is_lei` tinyint(1) NOT NULL DEFAULT '1',
  `is_allow` tinyint(1) NOT NULL DEFAULT '1',
  `click` int(11) NOT NULL,
  `is_preview` tinyint(1) NOT NULL DEFAULT '0',
  `short_url` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '短链',
  `category_id` int(11) NOT NULL COMMENT '类目id',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('124', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/08/ab8023f18cfa35608ecb822a022803fd.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/07/08/c859ec01a29bb086aba8fac3c2574668.mp4', '670', null, null, '/profile/upload/2020/07/08/ab8023f18cfa35608ecb822a022803fd.jpg', '1', '1', '4', '0', '', '227', '2020-06-21 00:53:22');
INSERT INTO `video` VALUES ('125', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', null, null, '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', '1', '1', '4', '0', '', '227', '2020-06-21 00:53:22');
INSERT INTO `video` VALUES ('126', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/08/530cddd74f83bcf8211170f567a7116d.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/07/08/75a579aee7147b837e4ca7627c8c9027.mp4', '752', null, null, '/profile/upload/2020/07/08/530cddd74f83bcf8211170f567a7116d.jpg', '1', '1', '4', '0', '', '227', '2020-06-21 00:53:22');
INSERT INTO `video` VALUES ('127', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', null, null, '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', '1', '1', '4', '0', '', '227', '2020-06-21 00:53:22');
INSERT INTO `video` VALUES ('128', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', null, null, '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', '1', '1', '4', '0', '', '227', '2020-06-21 00:53:22');
INSERT INTO `video` VALUES ('129', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', null, null, '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', '1', '1', '4', '0', '', '227', '2020-06-21 00:53:22');
INSERT INTO `video` VALUES ('130', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', null, null, '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', '1', '1', '4', '0', '', '227', '2020-06-21 00:53:22');
INSERT INTO `video` VALUES ('131', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', null, null, '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', '1', '1', '4', '0', '', '227', '2020-06-21 00:53:22');
INSERT INTO `video` VALUES ('132', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', null, null, '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', '1', '1', '4', '0', '', '227', '2020-06-21 00:53:22');
INSERT INTO `video` VALUES ('133', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', null, null, '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', '1', '1', '4', '0', '', '227', '2020-06-21 00:53:22');
INSERT INTO `video` VALUES ('134', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', null, null, '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', '1', '1', '4', '0', '', '227', '2020-06-21 00:53:22');
INSERT INTO `video` VALUES ('135', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', null, null, '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', '1', '1', '4', '0', '', '227', '2020-06-21 00:53:22');
INSERT INTO `video` VALUES ('136', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', null, null, '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', '1', '1', '4', '0', '', '227', '2020-06-21 00:53:22');
INSERT INTO `video` VALUES ('137', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', null, null, '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', '1', '1', '4', '0', '', '227', '2020-06-21 00:53:22');
INSERT INTO `video` VALUES ('138', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/08/62202901204bce116a7860abc7fb1db3.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/07/08/a416b4988e21600e4d6a60f09c4cfd9d.mp4', '752', null, null, '/profile/upload/2020/07/08/62202901204bce116a7860abc7fb1db3.jpg', '1', '1', '4', '0', '', '227', '2020-06-21 00:53:22');
INSERT INTO `video` VALUES ('426', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/8eb699920dcd73e55444f3b7390ebc84.jpg', 'admin', '111', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/60c076a381e3ba9424a9472bcd59d03f.mp4', '113', null, null, '/profile/upload/2020/07/12/8eb699920dcd73e55444f3b7390ebc84.jpg', '1', '1', '0', '0', '', '227', '2020-07-12 19:35:40');
INSERT INTO `video` VALUES ('427', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/e07ebf69da8e7c6168c8d1de095acd18.jpg', 'admin', '大奶少妇', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/496be277365ad3e5d9b044cfd99416f1.mp4', '59', null, null, '/profile/upload/2020/07/12/e07ebf69da8e7c6168c8d1de095acd18.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 19:41:47');
INSERT INTO `video` VALUES ('428', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/2de1ef898fbfb9eb0e580b814b606212.jpg', 'admin', '高潮的手机都拿不住', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/074c425bb064f7d74273daa334ff9834.mp4', '46', null, null, '/profile/upload/2020/07/12/2de1ef898fbfb9eb0e580b814b606212.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 19:53:28');
INSERT INTO `video` VALUES ('429', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/459ab24d32e35b911653cc1a7e2ec7d8.jpg', 'admin', '附近约的小姐姐害羞了', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/e55770c98e81699a05320fad84aef127.mp4', '51', null, null, '/profile/upload/2020/07/12/459ab24d32e35b911653cc1a7e2ec7d8.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 19:55:33');
INSERT INTO `video` VALUES ('430', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/4b94dce9f7688f8db2a89ddfd2e62431.jpg', 'admin', '约战黑丝大波妹', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/9036e062a7dbd777376487c4bfc85a43.mp4', '58', null, null, '/profile/upload/2020/07/12/4b94dce9f7688f8db2a89ddfd2e62431.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 19:56:45');
INSERT INTO `video` VALUES ('431', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/32506349d1be449718b5c6b8eb9a1461.jpg', 'admin', '粉嫩美少女', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/d55370d296674fee9ce3c0d21aee7e10.mp4', '102', null, null, '/profile/upload/2020/07/12/32506349d1be449718b5c6b8eb9a1461.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 19:58:54');
INSERT INTO `video` VALUES ('432', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/76e0918615bfeb250536c665de0f9272.jpg', 'admin', '慢慢的就来了高潮', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/5acc7532868ee1645dfa02ac47890d90.mp4', '105', null, null, '/profile/upload/2020/07/12/76e0918615bfeb250536c665de0f9272.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 20:00:48');
INSERT INTO `video` VALUES ('433', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/47f08678b3ac6fc551fc59bb9ba1e29a.jpg', 'admin', '附近约战小骚货', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/7af4d16fd3035506dc3b324f3c154bf5.mp4', '331', null, null, '/profile/upload/2020/07/12/47f08678b3ac6fc551fc59bb9ba1e29a.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 20:04:33');
INSERT INTO `video` VALUES ('434', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/d4ff6cffb031337f4eb9abba9791f2a1.jpg', 'admin', '骚货叫的真大声', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/f20317a11af0e807f177ddef1224ca9f.mp4', '21', null, null, '/profile/upload/2020/07/12/d4ff6cffb031337f4eb9abba9791f2a1.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 20:11:35');
INSERT INTO `video` VALUES ('435', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/c19ec9107450956fd43b21384cd540b9.jpg', 'admin', '粉嫩小妹妹自慰', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/aebe02d43a9eeba9bd6e20bf8cfb9866.mp4', '67', null, null, '/profile/upload/2020/07/12/c19ec9107450956fd43b21384cd540b9.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 20:13:51');
INSERT INTO `video` VALUES ('436', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/87bbbd963315b7a7388a085053e2d1b3.jpg', 'admin', '大奶等你吃', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/ae5a77aba89a48f53221f52a402fb081.mp4', '100', null, null, '/profile/upload/2020/07/12/87bbbd963315b7a7388a085053e2d1b3.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 20:16:18');
INSERT INTO `video` VALUES ('437', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/df738a822ca0bdd74a300d4c5da40cc3.jpg', 'admin', '久别的女朋友来一发', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/5117ed0e59ba5be14b8690ee4b25b86e.mp4', '300', null, null, '/profile/upload/2020/07/12/df738a822ca0bdd74a300d4c5da40cc3.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 20:24:35');
INSERT INTO `video` VALUES ('438', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/1161f4c84f6a481453c3fba770a1e6eb.jpg', 'admin', '高潮了笑的真开心', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/6087ffb99f014b6083ff9e94def65ac3.mp4', '103', null, null, '/profile/upload/2020/07/12/1161f4c84f6a481453c3fba770a1e6eb.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 20:30:43');
INSERT INTO `video` VALUES ('439', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/2b9846c0f15dd06ac948a723060eaadf.jpg', 'admin', '自慰给你看', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/21d31d9b487e2e589acd393949a1c4f2.mp4', '224', null, null, '/profile/upload/2020/07/12/2b9846c0f15dd06ac948a723060eaadf.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 20:35:56');
INSERT INTO `video` VALUES ('440', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/0c8c201e458a4ba80168e2cfd0e1628f.jpg', 'admin', '掰开粉嫩的小穴', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/3856c1dab91a6f4ee00db29680b8bca5.mp4', '19', null, null, '/profile/upload/2020/07/12/0c8c201e458a4ba80168e2cfd0e1628f.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 20:41:55');
INSERT INTO `video` VALUES ('441', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/24b59e8808d26cb383643422f39b1917.jpg', 'admin', '自慰湿湿的小穴', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/f40dec0878431017580124f2b5ce46ae.mp4', '180', null, null, '/profile/upload/2020/07/12/24b59e8808d26cb383643422f39b1917.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 20:46:12');
INSERT INTO `video` VALUES ('442', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/3a6c895305324c8dd787e3381db34604.jpg', 'admin', '高挑美女的制服诱惑', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/dcfd8aeba10a27a8c0ff8288454ad770.mp4', '162', null, null, '/profile/upload/2020/07/12/3a6c895305324c8dd787e3381db34604.jpg', '1', '1', '0', '0', '', '230', '2020-07-12 20:50:29');
INSERT INTO `video` VALUES ('443', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/f4c58feef25b27986291de5307443a21.jpg', 'admin', '用大香蕉插入', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/5ec28082202744c6021a233988b68836.mp4', '168', null, null, '/profile/upload/2020/07/12/f4c58feef25b27986291de5307443a21.jpg', '1', '1', '0', '0', '', '218', '2020-07-12 20:55:51');
INSERT INTO `video` VALUES ('444', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/70fa2164645bd7d632fc9286de6c4a36.jpg', 'admin', '妹妹好想要', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/1c67e6ac8371cc27399e0c950e8e01ca.mp4', '439', null, null, '/profile/upload/2020/07/12/70fa2164645bd7d632fc9286de6c4a36.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 21:04:57');
INSERT INTO `video` VALUES ('445', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/7d8306d06d1aa6ec460d14a9eb1ab247.jpg', 'admin', '吃哥哥的大屌', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/803e2e82e4a4c18eb4195c33a0c9e8cd.mp4', '89', null, null, '/profile/upload/2020/07/12/7d8306d06d1aa6ec460d14a9eb1ab247.jpg', '1', '1', '0', '0', '', '230', '2020-07-12 21:07:20');
INSERT INTO `video` VALUES ('446', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/8ec72c5f2095acc89ec1ee1bcf209589.jpg', 'admin', '跳脱衣舞给你看', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/23ed2c482fa02fbf56954f27d651893b.mp4', '50', null, null, '/profile/upload/2020/07/12/8ec72c5f2095acc89ec1ee1bcf209589.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 21:08:55');
INSERT INTO `video` VALUES ('447', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/eb4f4740b260abb54ea389c1714d10c3.jpg', 'admin', '大鲍鱼等你擦', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/5dd0cbb00476362e41d63b8b8b9c9882.mp4', '214', null, null, '/profile/upload/2020/07/12/eb4f4740b260abb54ea389c1714d10c3.jpg', '1', '1', '0', '0', '', '218', '2020-07-12 21:14:05');
INSERT INTO `video` VALUES ('448', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/d1cc162cba6f8836df11afed539a801e.jpg', 'admin', '妹妹想要了', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/1e1c95d3f3cab39f3276a6babc917464.mp4', '94', null, null, '/profile/upload/2020/07/12/d1cc162cba6f8836df11afed539a801e.jpg', '1', '1', '0', '0', '', '218', '2020-07-12 21:29:21');
INSERT INTO `video` VALUES ('449', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/6739c2562cacf6e6e2b2677945ab9118.jpg', 'admin', '学生妹的自慰', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/bfd1508166f0dca65f96141b32c3537b.mp4', '176', null, null, '/profile/upload/2020/07/12/6739c2562cacf6e6e2b2677945ab9118.jpg', '1', '1', '0', '0', '', '218', '2020-07-12 21:56:05');
INSERT INTO `video` VALUES ('450', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/8584b36aa6630f5f931cbee56416e787.jpg', 'admin', '大奶自慰', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/e732fa5aacb40af55781f44ca9b1271a.mp4', '60', null, null, '/profile/upload/2020/07/12/8584b36aa6630f5f931cbee56416e787.jpg', '1', '1', '0', '0', '', '218', '2020-07-12 22:15:06');
INSERT INTO `video` VALUES ('451', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/b4e1ce092f6d37ca1c09a233cf77179e.jpg', 'admin', '哥哥大屌真好吃', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/8ced971cec3304cc150f29b2caa899cb.mp4', '679', null, null, '/profile/upload/2020/07/12/b4e1ce092f6d37ca1c09a233cf77179e.jpg', '1', '1', '0', '0', '', '230', '2020-07-12 22:19:41');
INSERT INTO `video` VALUES ('452', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/aaaff4b6848b5d7bfa361179d8733d33.jpg', 'admin', '射到身上了', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/6cf7431f25dcbaf4ead3dfb89295fd28.mp4', '70', null, null, '/profile/upload/2020/07/12/aaaff4b6848b5d7bfa361179d8733d33.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 22:20:57');
INSERT INTO `video` VALUES ('453', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/9143af34e84964fb02f6df438d95d051.jpg', 'admin', '一边看电视一边做', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/3132acbb45277a3f9e0ad19a296d0741.mp4', '154', null, null, '/profile/upload/2020/07/12/9143af34e84964fb02f6df438d95d051.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 22:21:42');
INSERT INTO `video` VALUES ('454', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/057afae70528bc661708d38274f4aede.jpg', 'admin', '豹纹内衣的大奶妹', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/e8bd803d1e9486b10218d319ca68491b.mp4', '66', null, null, '/profile/upload/2020/07/12/057afae70528bc661708d38274f4aede.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 22:22:51');
INSERT INTO `video` VALUES ('455', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/bd49b6b53077cf2aa2060a48a54d9371.jpg', 'admin', '流水的小穴', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/279589d6a364dd06f2e600e637c7344c.mp4', '31', null, null, '/profile/upload/2020/07/12/bd49b6b53077cf2aa2060a48a54d9371.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 22:46:47');
INSERT INTO `video` VALUES ('456', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/7c1cbd756c67e7f64f431fbfc438c103.jpg', 'admin', '干了别人女朋友', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/d475769c50f1b8e3d75981c5dccc30ae.mp4', '290', null, null, '/profile/upload/2020/07/12/7c1cbd756c67e7f64f431fbfc438c103.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 22:48:48');
INSERT INTO `video` VALUES ('457', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/2ebe893c8abe1c34b21f1dbf5e518d4a.jpg', 'admin', '约会情人', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/86f1d7e17a0270dd6b835eaead8245da.mp4', '65', null, null, '/profile/upload/2020/07/12/2ebe893c8abe1c34b21f1dbf5e518d4a.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 22:51:17');
INSERT INTO `video` VALUES ('458', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/1bc1125dde02024407ad07ccf77bda40.jpg', 'admin', '丰满的美少妇', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/5c403c27bb9b0f698ff647e9423f4ea7.mp4', '43', null, null, '/profile/upload/2020/07/12/1bc1125dde02024407ad07ccf77bda40.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 22:53:39');
INSERT INTO `video` VALUES ('459', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/ff4745fcf88068b16e7def61cef03663.jpg', 'admin', '小穴想要了', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/0a6364a32cf3661b7024b31150ab8ae5.mp4', '69', null, null, '/profile/upload/2020/07/12/ff4745fcf88068b16e7def61cef03663.jpg', '1', '1', '0', '0', '', '218', '2020-07-12 22:55:57');
INSERT INTO `video` VALUES ('460', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/19fc0db4c9768a58575acd20fe405afa.jpg', 'admin', '一边接吻一边操', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/908572a0cccebab2c1492b67cd82c9b0.mp4', '120', null, null, '/profile/upload/2020/07/12/19fc0db4c9768a58575acd20fe405afa.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 22:57:43');
INSERT INTO `video` VALUES ('461', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/0e606db71da587799300d2c249100a5d.jpg', 'admin', '大奶美女', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/763e4c308eeeff6c102731e1416f8789.mp4', '61', null, null, '/profile/upload/2020/07/12/0e606db71da587799300d2c249100a5d.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 22:59:22');
INSERT INTO `video` VALUES ('462', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/756c8746b3e28b7f65a89f055be430e0.jpg', 'admin', '大奶子美女', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/a284f06ef69d432288a6378957edaec3.mp4', '110', null, null, '/profile/upload/2020/07/12/756c8746b3e28b7f65a89f055be430e0.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 23:04:54');
INSERT INTO `video` VALUES ('463', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/a2448021c758339a9484d01111fdeccc.jpg', 'admin', '自慰扣的喷水', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/88c4ccbcdc8b8663433b0e75934a5082.mp4', '64', null, null, '/profile/upload/2020/07/12/a2448021c758339a9484d01111fdeccc.jpg', '1', '1', '0', '0', '', '218', '2020-07-12 23:51:20');
INSERT INTO `video` VALUES ('464', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/cbbe666c64f6b343c1fa46a45e0d23ef.jpg', 'admin', '干的骚货一直叫', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/03034dbbba1b327c1e822a8d8cade549.mp4', '221', null, null, '/profile/upload/2020/07/12/cbbe666c64f6b343c1fa46a45e0d23ef.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 23:53:37');
INSERT INTO `video` VALUES ('465', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/12/f78c77b28c8b6a3e8a5a8b3b4d74f1aa.jpg', 'admin', '胡萝卜擦骚逼', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/13db1b8983cab7f498cacb5cb7257156.mp4', '208', null, null, '/profile/upload/2020/07/12/f78c77b28c8b6a3e8a5a8b3b4d74f1aa.jpg', '1', '1', '0', '0', '', '229', '2020-07-12 23:59:04');
INSERT INTO `video` VALUES ('466', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/13/903ab7342b3922d7a57d0ca29ef5ec74.jpg', 'admin', '蒙着眼睛吃大屌', 'http://admin.grkfcs.cn/profile/upload/2020/07/13/8615ada691de777a82193d7bfc3e23f4.mp4', '177', null, null, '/profile/upload/2020/07/13/903ab7342b3922d7a57d0ca29ef5ec74.jpg', '1', '1', '0', '0', '', '230', '2020-07-13 00:10:49');
INSERT INTO `video` VALUES ('467', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/13/05878cf3c6e06ec993752338286eeb49.jpg', 'admin', '穿着丝袜扣着小穴', 'http://admin.grkfcs.cn/profile/upload/2020/07/13/951f471a5792a3ff6101665514eca263.mp4', '209', null, null, '/profile/upload/2020/07/13/05878cf3c6e06ec993752338286eeb49.jpg', '1', '1', '0', '0', '', '218', '2020-07-13 00:13:20');
INSERT INTO `video` VALUES ('468', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/13/7e014711501e4962f50c68400f1862ec.jpg', 'admin', '含着你的大屌', 'http://admin.grkfcs.cn/profile/upload/2020/07/13/5edf2842ab28d10d20235b0feeab35bc.mp4', '150', null, null, '/profile/upload/2020/07/13/7e014711501e4962f50c68400f1862ec.jpg', '1', '1', '0', '0', '', '230', '2020-07-13 00:16:19');
INSERT INTO `video` VALUES ('470', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/13/c332dac87ec8dd711d8ca9b36ecf1853.png', 'admin', '111', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/5dd0cbb00476362e41d63b8b8b9c9882.mp4', null, null, null, '/profile/upload/2020/07/13/c332dac87ec8dd711d8ca9b36ecf1853.png', '1', '1', '0', '0', '', '200', '2020-07-13 01:06:43');
INSERT INTO `video` VALUES ('511', '2-5', null, '37280', 'https://tp.jializyw.com/lunlipic/20200413-KR/750QXGrh.jpg', 'admin', '致命的引诱', 'https://vd6.zhiyuanhongda.com/20200413/750QXGrh/index.m3u8', null, null, null, 'https://tp.jializyw.com/lunlipic/20200413-KR/750QXGrh.jpg', '1', '1', '0', '0', '', '272', '2020-07-15 20:29:52');
INSERT INTO `video` VALUES ('512', '2-5', null, '37279', 'https://tp.jializyw.com/lunlipic/20200413-KR/lowY6ou3.jpg', 'admin', '野外的刺激', 'https://vd6.zhiyuanhongda.com/20200413/lowY6ou3/index.m3u8', null, null, null, 'https://tp.jializyw.com/lunlipic/20200413-KR/lowY6ou3.jpg', '1', '1', '0', '0', '', '272', '2020-07-15 20:29:52');
INSERT INTO `video` VALUES ('513', '2-5', null, '37278', 'https://tp.jializyw.com/lunlipic/20200413-KR/Dd59oUU6.jpg', 'admin', '岳母与我的秘事', 'https://vd6.zhiyuanhongda.com/20200413/Dd59oUU6/index.m3u8', null, null, null, 'https://tp.jializyw.com/lunlipic/20200413-KR/Dd59oUU6.jpg', '1', '1', '0', '0', '', '272', '2020-07-15 20:29:52');
INSERT INTO `video` VALUES ('514', '2-5', null, '37277', 'https://tp.jializyw.com/upload/vod/20200709-1/89879632ff7f9b046069e716560a758e.jpg', 'admin', '看似感情美满的夫妇之中潜藏着微小的裂缝，没想到却与老公的主管疯狂偷情', 'https://video.jializyw.com:8800/20200708/kQcaRohn/index.m3u8', null, null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/89879632ff7f9b046069e716560a758e.jpg', '1', '1', '0', '0', '', '273', '2020-07-15 20:29:52');
INSERT INTO `video` VALUES ('515', '2-5', null, '37276', 'https://tp.jializyw.com/upload/vod/20200709-1/81284fd2e8941b12265ebf731fde7dc6.jpg', 'admin', '极品大学生美少女宿舍掰开粉洪嫩逼自慰', 'https://video.jializyw.com:8800/20200708/nlspMceM/index.m3u8', null, null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/81284fd2e8941b12265ebf731fde7dc6.jpg', '1', '1', '0', '0', '', '273', '2020-07-15 20:29:52');
INSERT INTO `video` VALUES ('516', '2-5', null, '37275', 'https://tp.jializyw.com/upload/vod/20200709-1/5b05ae1c259aded0a0f392dafd909609.jpg', 'admin', '搭讪熟女带回家干炮偷拍擅自卖给片商', 'https://video.jializyw.com:8800/20200708/T5XqcTz5/index.m3u8', null, null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/5b05ae1c259aded0a0f392dafd909609.jpg', '1', '1', '0', '0', '', '273', '2020-07-15 20:29:52');
INSERT INTO `video` VALUES ('517', '2-5', null, '37274', 'https://tp.jializyw.com/upload/vod/20200709-1/8d79e848196ec457a9576e52ca208461.jpg', 'admin', '和新女友开房趣~等她洗完澡就迫不及待压到床上啪啪啪啪啪~爱的鼓掌', 'https://video.jializyw.com:8800/20200708/djJBqV3F/index.m3u8', null, null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/8d79e848196ec457a9576e52ca208461.jpg', '1', '1', '0', '0', '', '273', '2020-07-15 20:29:52');
INSERT INTO `video` VALUES ('518', '2-5', null, '37273', 'https://tp.jializyw.com/upload/vod/20200709-1/47f357a13858910918fc5b3ea5e3502e.jpg', 'admin', '极品大奶主播自慰大秀完美巨乳自慰插逼呻吟可射', 'https://video.jializyw.com:8800/20200708/wZ1MFwSo/index.m3u8', null, null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/47f357a13858910918fc5b3ea5e3502e.jpg', '1', '1', '0', '0', '', '273', '2020-07-15 20:29:52');
INSERT INTO `video` VALUES ('519', '2-5', null, '37272', 'https://tp.jializyw.com/upload/vod/20200709-1/e6de8c4e2483279d447cd3c328483440.jpg', 'admin', '搭讪游击队访问憧憬熟女中出做爱', 'https://video.jializyw.com:8800/20200708/cIct3sIC/index.m3u8', null, null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/e6de8c4e2483279d447cd3c328483440.jpg', '1', '1', '0', '0', '', '273', '2020-07-15 20:29:52');
INSERT INTO `video` VALUES ('520', '2-5', null, '37271', 'https://tp.jializyw.com/upload/vod/20200709-1/6ff9adbcced9b50c5912b1d877f14de6.jpg', 'admin', '[欧美主播外流]姐姐妹妹一起来，闺密三人组一起起全裸自慰淫叫讨拍，看一部等于赚到三部', 'https://video.jializyw.com:8800/20200708/oBR4xvtn/index.m3u8', null, null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/6ff9adbcced9b50c5912b1d877f14de6.jpg', '1', '1', '0', '0', '', '273', '2020-07-15 20:29:52');
INSERT INTO `video` VALUES ('521', '2-5', null, '37270', 'https://tp.jializyw.com/upload/vod/20200709-1/bac6d8d63121e5b3fdddfec83a7bf0df.jpg', 'admin', '搭讪身材苗条的辣妹海边玩水后再去酒店打炮', 'https://video.jializyw.com:8800/20200708/t0efMEXA/index.m3u8', null, null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/bac6d8d63121e5b3fdddfec83a7bf0df.jpg', '1', '1', '0', '0', '', '273', '2020-07-15 20:29:52');
INSERT INTO `video` VALUES ('522', '2-5', null, '37269', 'https://tp.jializyw.com/upload/vod/20200709-1/c00e59be3cd47ce0a2d50f5871b432af.jpg', 'admin', '[欧美主播外流]性感的奶牛风骚扭动翘臀岔开腿掰开穴等你插入', 'https://video.jializyw.com:8800/20200708/rTAh7rL0/index.m3u8', null, null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/c00e59be3cd47ce0a2d50f5871b432af.jpg', '1', '1', '0', '0', '', '273', '2020-07-15 20:29:52');
INSERT INTO `video` VALUES ('523', '2-5', null, '37268', 'https://tp.jializyw.com/upload/vod/20200709-1/a9fccfcd44460bded90e6459e20d7cf2.jpg', 'admin', '[中文主播外流]高颜值可爱美女情欲难耐自慰高潮粉嫩鲍鱼', 'https://video.jializyw.com:8800/20200708/oeKslXCv/index.m3u8', null, null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/a9fccfcd44460bded90e6459e20d7cf2.jpg', '1', '1', '0', '0', '', '273', '2020-07-15 20:29:52');
INSERT INTO `video` VALUES ('524', '2-5', null, '37267', 'https://tp.jializyw.com/upload/vod/20200709-1/d91534c4e0f4d349f38b99dc12eced87.jpg', 'admin', '[韩国主播外流]长得酷似某韩国女星，皮肤白皙骚逼粉嫩嫩的', 'https://video.jializyw.com:8800/20200708/FieDOrw5/index.m3u8', null, null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/d91534c4e0f4d349f38b99dc12eced87.jpg', '1', '1', '0', '0', '', '273', '2020-07-15 20:29:52');
INSERT INTO `video` VALUES ('525', '2-5', null, '37266', 'https://tp.jializyw.com/upload/vod/20200709-1/dbbccc969f7a84c19d2fb2616806bf5e.jpg', 'admin', '[中文主播外流]“舔我好痒快点用大肉棒插进来”对白淫荡嘟嘟唇网红大奶骚美女直播挑逗你的每一处神经', 'https://video.jializyw.com:8800/20200708/lhmPDYrB/index.m3u8', null, null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/dbbccc969f7a84c19d2fb2616806bf5e.jpg', '1', '1', '0', '0', '', '273', '2020-07-15 20:29:52');
INSERT INTO `video` VALUES ('526', '2-5', null, '37265', 'https://tp.jializyw.com/upload/vod/20200709-1/b5f48a2cc98100980815993391928db9.jpg', 'admin', '[中文主播外流]新秀主播私密视频录制大秀身材自慰高潮', 'https://video.jializyw.com:8800/20200708/fYqLI04K/index.m3u8', null, null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/b5f48a2cc98100980815993391928db9.jpg', '1', '1', '0', '0', '', '273', '2020-07-15 20:29:52');
INSERT INTO `video` VALUES ('527', '2-5', null, '37264', 'https://tp.jializyw.com/upload/vod/20200709-1/09b6661c40c5ce24be9c7397a42febf8.jpg', 'admin', '[韩国主播外流]魔鬼身材的女主播骚臀骚穴扭动的让人欲罢不能', 'https://video.jializyw.com:8800/20200708/lfmNjO1h/index.m3u8', null, null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/09b6661c40c5ce24be9c7397a42febf8.jpg', '1', '1', '0', '0', '', '273', '2020-07-15 20:29:52');
INSERT INTO `video` VALUES ('528', '2-5', null, '37263', 'https://tp.jializyw.com/upload/vod/20200709-1/e15d210b57880b3aaaf43a0b90a8eabe.jpg', 'admin', '睡走朋友女友还偷拿来卖给片商', 'https://video.jializyw.com:8800/20200708/c5yaWghA/index.m3u8', null, null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/e15d210b57880b3aaaf43a0b90a8eabe.jpg', '1', '1', '0', '0', '', '273', '2020-07-15 20:29:52');
INSERT INTO `video` VALUES ('529', '2-5', null, '37262', 'https://tp.jializyw.com/upload/vod/20200709-1/723179a659ebea4da1a3f8b876c40312.jpg', 'admin', '[欧美主播外流]美艳女大学生下海做黄播清纯脸蛋藏不住一颗骚逼的心', 'https://video.jializyw.com:8800/20200708/QDB3wUWd/index.m3u8', null, null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/723179a659ebea4da1a3f8b876c40312.jpg', '1', '1', '0', '0', '', '273', '2020-07-15 20:29:52');
INSERT INTO `video` VALUES ('530', '2-5', null, '37261', 'https://tp.jializyw.com/upload/vod/20200709-1/718051067c4c1b77088ed1552a50803b.jpg', 'admin', '美女极品声音呻吟声嗲到不行直播自慰喷水', 'https://video.jializyw.com:8800/20200708/EJvqao8v/index.m3u8', null, null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/718051067c4c1b77088ed1552a50803b.jpg', '1', '1', '0', '0', '', '273', '2020-07-15 20:29:52');
INSERT INTO `video` VALUES ('531', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/28142da5a04c3fe8d464852956e6cd37.png', 'admin', '穿着豹纹自慰', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/264ff2868a6e556f7a9f27538eef232e.mp4', '180', null, null, '/profile/upload/2020/07/15/28142da5a04c3fe8d464852956e6cd37.png', '1', '1', '0', '0', '', '218', '2020-07-15 21:36:58');
INSERT INTO `video` VALUES ('532', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/dda44f97a605029c53fb04e15c528575.png', 'admin', '午觉睡醒想要了', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/f863cdca4cb0ab620c2db11098ce6415.mp4', '183', null, null, '/profile/upload/2020/07/15/dda44f97a605029c53fb04e15c528575.png', '1', '1', '0', '0', '', '229', '2020-07-15 21:38:21');
INSERT INTO `video` VALUES ('533', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/ab46c0c15220980f0dd74f559aa58da3.png', 'admin', '按摩被内射', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/1cae950c1669256d5403d05495670f9a.mp4', '460', null, null, '/profile/upload/2020/07/15/ab46c0c15220980f0dd74f559aa58da3.png', '1', '1', '0', '0', '', '200', '2020-07-15 21:40:10');
INSERT INTO `video` VALUES ('534', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/dd412178993cc376f6f6d5d457ab3f8e.png', 'admin', '乖乖女自慰扣穴', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/4b1066dda08bef4778fc0e53c1e8d031.mp4', '461', null, null, '/profile/upload/2020/07/15/dd412178993cc376f6f6d5d457ab3f8e.png', '1', '1', '0', '0', '', '218', '2020-07-15 21:41:31');
INSERT INTO `video` VALUES ('535', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/6c774f047ddaa39dd4d209be7e3e2938.png', 'admin', '一个人自慰喷水', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/f275289e797af286f41dbf7e9776cfd6.mp4', '211', null, null, '/profile/upload/2020/07/15/6c774f047ddaa39dd4d209be7e3e2938.png', '1', '1', '0', '0', '', '218', '2020-07-15 21:42:33');
INSERT INTO `video` VALUES ('536', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/e97f06ed25989db310a5592ebe139c5c.png', 'admin', '深喉哥哥大屌', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/3288000e1a6b6d38ad7cb1a7211a3704.mp4', '58', null, null, '/profile/upload/2020/07/15/e97f06ed25989db310a5592ebe139c5c.png', '1', '1', '0', '0', '', '230', '2020-07-15 21:44:54');
INSERT INTO `video` VALUES ('537', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/5d04a4cb55c649a289ecc10cbb99bc2a.png', 'admin', '约炮极品小妹', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/4d551630f8637ec77d69b9aaa3e4491e.mp4', '117', null, null, '/profile/upload/2020/07/15/5d04a4cb55c649a289ecc10cbb99bc2a.png', '1', '1', '0', '0', '', '229', '2020-07-15 21:46:02');
INSERT INTO `video` VALUES ('538', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/0090bfea3857df2a8e53168a92023d03.png', 'admin', '按摩女舔菊花', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/067751dc7e82efba08f9cf361f092aa5.mp4', '74', null, null, '/profile/upload/2020/07/15/0090bfea3857df2a8e53168a92023d03.png', '1', '1', '0', '0', '', '229', '2020-07-15 21:47:22');
INSERT INTO `video` VALUES ('539', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/5f4a25ffada40e3c4a2b846c2bc53dbd.png', 'admin', '可爱眼睛妹自慰扣穴', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/d14846d09ad24b09d19de28d9583d7bb.mp4', '59', null, null, '/profile/upload/2020/07/15/5f4a25ffada40e3c4a2b846c2bc53dbd.png', '1', '1', '0', '0', '', '218', '2020-07-15 21:49:08');
INSERT INTO `video` VALUES ('540', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/71190ae86dbbabeb5f2203849ed347aa.png', 'admin', '激情69', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/03d8f0e28b4329936dd45363b99dea3b.mp4', '241', null, null, '/profile/upload/2020/07/15/71190ae86dbbabeb5f2203849ed347aa.png', '1', '1', '0', '0', '', '200', '2020-07-15 21:50:54');
INSERT INTO `video` VALUES ('541', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/6d091e7c96479d65fb881411fb524c46.png', 'admin', '约的妹子直接内射', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/4cb875e83825da2c21abbf7b72b961f9.mp4', '67', null, null, '/profile/upload/2020/07/15/6d091e7c96479d65fb881411fb524c46.png', '1', '1', '0', '0', '', '229', '2020-07-15 21:52:46');
INSERT INTO `video` VALUES ('542', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/ca92ad90a79cd8dcf54af3275b18d622.png', 'admin', '深情的吃着大屌', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/4b539a9f5c0b75892268dbefb3f6d8ad.mp4', '140', null, null, '/profile/upload/2020/07/15/ca92ad90a79cd8dcf54af3275b18d622.png', '1', '1', '0', '0', '', '230', '2020-07-15 21:54:13');
INSERT INTO `video` VALUES ('543', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/71415357125a12d9bc0665d6d4de6302.png', 'admin', '一边吃大屌一边自拍', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/5b2ca84ab731fb2150efc2442f22b01f.mp4', '147', null, null, '/profile/upload/2020/07/15/71415357125a12d9bc0665d6d4de6302.png', '1', '1', '0', '0', '', '230', '2020-07-15 21:55:32');
INSERT INTO `video` VALUES ('544', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/d5f2fef498b802e8161105ada2b5759e.png', 'admin', '酒店偷拍偷情男女', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/d671204d0c6f286ccc189d282206d998.mp4', '185', null, null, '/profile/upload/2020/07/15/d5f2fef498b802e8161105ada2b5759e.png', '1', '1', '0', '0', '', '227', '2020-07-15 21:56:46');
INSERT INTO `video` VALUES ('545', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/11fbf63717ed3397bba79215ece40e21.png', 'admin', '美少妇自慰超多少', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/764e12b99cf7a73c97a1c7f4e12e2f70.mp4', '221', null, null, '/profile/upload/2020/07/15/11fbf63717ed3397bba79215ece40e21.png', '1', '1', '0', '0', '', '218', '2020-07-15 21:57:48');
INSERT INTO `video` VALUES ('546', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/96616927ad80a5ed433c3d6d6c5ee70a.png', 'admin', '情侣许久不见激情做爱', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/f343f67ef59c72a8361895e99962e273.mp4', '204', null, null, '/profile/upload/2020/07/15/96616927ad80a5ed433c3d6d6c5ee70a.png', '1', '1', '0', '0', '', '229', '2020-07-15 21:59:04');
INSERT INTO `video` VALUES ('547', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/4dcb58ee0a8ddba0ecec2a3900eebbc3.png', 'admin', '水汪汪的小骚货', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/e5e5082eb16335bd2acac3712b768e61.mp4', '217', null, null, '/profile/upload/2020/07/15/4dcb58ee0a8ddba0ecec2a3900eebbc3.png', '1', '1', '0', '0', '', '218', '2020-07-15 22:00:21');
INSERT INTO `video` VALUES ('548', '2-5', null, null, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/ca648f930c86bd62311b9b2ae92a01c4.png', 'admin', '玩着手机被操', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/3f3244ba30376c71995125e9e193388d.mp4', '113', null, null, '/profile/upload/2020/07/15/ca648f930c86bd62311b9b2ae92a01c4.png', '1', '1', '0', '0', '', '229', '2020-07-15 22:15:10');
INSERT INTO `video` VALUES ('549', '2-5', null, '37506', 'https://tp.jializyw.com/lunlipic/20200413-KR/uyAGs4XZ.jpg', 'admin', '隐秘的习惯', 'https://vd6.zhiyuanhongda.com/20200413/uyAGs4XZ/index.m3u8', '752', null, null, 'https://tp.jializyw.com/lunlipic/20200413-KR/uyAGs4XZ.jpg', '1', '1', '0', '0', '', '272', '2020-07-16 16:42:37');
INSERT INTO `video` VALUES ('550', '2-5', null, '37505', 'https://tp.jializyw.com/lunlipic/20200413-KR/gGCwk4P2.jpg', 'admin', '浴室风景', 'https://vd6.zhiyuanhongda.com/20200413/gGCwk4P2/index.m3u8', '752', null, null, 'https://tp.jializyw.com/lunlipic/20200413-KR/gGCwk4P2.jpg', '1', '1', '0', '0', '', '272', '2020-07-16 16:42:37');
INSERT INTO `video` VALUES ('551', '2-5', null, '37504', 'https://tp.jializyw.com/lunlipic/20200413-KR/hQuaUbn3.jpg', 'admin', '女人的香气', 'https://vd6.zhiyuanhongda.com/20200413/hQuaUbn3/index.m3u8', '752', null, null, 'https://tp.jializyw.com/lunlipic/20200413-KR/hQuaUbn3.jpg', '1', '1', '0', '0', '', '272', '2020-07-16 16:42:37');
INSERT INTO `video` VALUES ('552', '2-5', null, '37503', 'https://tp.jializyw.com/upload/vod/20200709-1/9aafb2037156aec3663ce73a30f72161.jpg', 'admin', '清纯人妻拥有超乎想像的淫乱M女体质！让人绑起来玩弄、当成奴隶对待到不断高潮，来场变态性交！', 'https://video.jializyw.com:8800/20200708/hBXvyYL6/index.m3u8', '752', null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/9aafb2037156aec3663ce73a30f72161.jpg', '1', '1', '0', '0', '', '273', '2020-07-16 16:42:37');
INSERT INTO `video` VALUES ('553', '2-5', null, '37502', 'https://tp.jializyw.com/upload/vod/20200709-1/b007cea6f4d4aa43aa636e0632a7daa6.jpg', 'admin', '好姐妹一起开房洗澡互舔自慰比男友还爽', 'https://video.jializyw.com:8800/20200708/WcleAHr9/index.m3u8', '752', null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/b007cea6f4d4aa43aa636e0632a7daa6.jpg', '1', '1', '0', '0', '', '273', '2020-07-16 16:42:37');
INSERT INTO `video` VALUES ('554', '2-5', null, '37501', 'https://tp.jializyw.com/upload/vod/20200709-1/0b95fd5d04a19ab0e0316af1279a7c09.jpg', 'admin', '找了昔日高中同学一起来4P直播~给干爹们的年终回馈~吃鸡揉奶毫不扭捏', 'https://video.jializyw.com:8800/20200708/HY0DNhzB/index.m3u8', '752', null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/0b95fd5d04a19ab0e0316af1279a7c09.jpg', '1', '1', '0', '0', '', '273', '2020-07-16 16:42:37');
INSERT INTO `video` VALUES ('555', '2-5', null, '37500', 'https://tp.jializyw.com/upload/vod/20200709-1/914879a868e5157f6d9dd026a98eadaa.jpg', 'admin', '高颜值女主播_身材很好_插着自慰棒_随音乐摇摆身姿_十分诱惑', 'https://video.jializyw.com:8800/20200708/udYJdIbO/index.m3u8', '752', null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/914879a868e5157f6d9dd026a98eadaa.jpg', '1', '1', '0', '0', '', '273', '2020-07-16 16:42:37');
INSERT INTO `video` VALUES ('556', '2-5', null, '37499', 'https://tp.jializyw.com/upload/vod/20200709-1/63cd3a6ab894a3f302a1690aeb606999.jpg', 'admin', '逼逼无毛丰满身材少妇道具自慰_床上漏奶插完逼逼再插菊花翘着屁股', 'https://video.jializyw.com:8800/20200708/uG28N9cA/index.m3u8', '752', null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/63cd3a6ab894a3f302a1690aeb606999.jpg', '1', '1', '0', '0', '', '273', '2020-07-16 16:42:37');
INSERT INTO `video` VALUES ('557', '2-5', null, '37498', 'https://tp.jializyw.com/upload/vod/20200709-1/4535b013c09ef8a3f20035186f782a98.jpg', 'admin', '35岁的熟人妻为了解放性欲而来下海啦', 'https://video.jializyw.com:8800/20200708/CXo7MZ3i/index.m3u8', '752', null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/4535b013c09ef8a3f20035186f782a98.jpg', '1', '1', '0', '0', '', '273', '2020-07-16 16:42:37');
INSERT INTO `video` VALUES ('558', '2-5', null, '37497', 'https://tp.jializyw.com/upload/vod/20200709-1/6a14cf13f18fb1be17f43a713f966e44.jpg', 'admin', '在街头搭讪毫无防备的人妻，借助酒力＆靠肉棒诱惑让她露出淫乱本性！', 'https://video.jializyw.com:8800/20200708/EjrBGEjj/index.m3u8', '752', null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/6a14cf13f18fb1be17f43a713f966e44.jpg', '1', '1', '0', '0', '', '273', '2020-07-16 16:42:38');
INSERT INTO `video` VALUES ('559', '2-5', null, '37496', 'https://tp.jializyw.com/upload/vod/20200709-1/b6130c5a92c359f0e1f4b27bb2ec7879.jpg', 'admin', '10倍湿润的人妻老师给你带来无法出声的高潮讲课', 'https://video.jializyw.com:8800/20200708/LBoI1T1F/index.m3u8', '752', null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/b6130c5a92c359f0e1f4b27bb2ec7879.jpg', '1', '1', '0', '0', '', '273', '2020-07-16 16:42:38');
INSERT INTO `video` VALUES ('560', '2-5', null, '37495', 'https://tp.jializyw.com/upload/vod/20200709-1/d4eec1db9bd6a7dc7198ab16e80ca112.jpg', 'admin', '[韩国主播外流]双腿开开才好让手指找到对的位置~手指运动开始！', 'https://video.jializyw.com:8800/20200708/KxN0KnjZ/index.m3u8', '752', null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/d4eec1db9bd6a7dc7198ab16e80ca112.jpg', '1', '1', '0', '0', '', '273', '2020-07-16 16:42:38');
INSERT INTO `video` VALUES ('561', '2-5', null, '37494', 'https://tp.jializyw.com/upload/vod/20200709-1/9a9cebaa2fcd3e852c51003e167c227d.jpg', 'admin', '利用儿子来逼迫她与他们发展肉体关系的可怜妈妈', 'https://video.jializyw.com:8800/20200708/1gdiAfhd/index.m3u8', '752', null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/9a9cebaa2fcd3e852c51003e167c227d.jpg', '1', '1', '0', '0', '', '273', '2020-07-16 16:42:38');
INSERT INTO `video` VALUES ('562', '2-5', null, '37493', 'https://tp.jializyw.com/upload/vod/20200709-1/d1769e3bd638cc714f5dd4d8c14fe85c.jpg', 'admin', '[欧美主播外流]金发主播自慰无码片视频一翻搔首弄姿后开始搓奶抠穴自慰淫乱的叫声让人受不了', 'https://video.jializyw.com:8800/20200708/NbrpjDFm/index.m3u8', '752', null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/d1769e3bd638cc714f5dd4d8c14fe85c.jpg', '1', '1', '0', '0', '', '273', '2020-07-16 16:42:38');
INSERT INTO `video` VALUES ('563', '2-5', null, '37492', 'https://tp.jializyw.com/upload/vod/20200709-1/d2f8bec20353b066e8fb941aa2537b5b.jpg', 'admin', '[欧美主播外流]欧美金发白人正妹视频肌肤，大奶水蛇腰浑圆的屁股难怪粉丝那么多福利又那么好', 'https://video.jializyw.com:8800/20200708/pqdH6aIn/index.m3u8', '752', null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/d2f8bec20353b066e8fb941aa2537b5b.jpg', '1', '1', '0', '0', '', '273', '2020-07-16 16:42:38');
INSERT INTO `video` VALUES ('564', '2-5', null, '37491', 'https://tp.jializyw.com/upload/vod/20200709-1/201acb7fc2cddf53eaecd1be21b08fd5.jpg', 'admin', '[中文主播外流]亚洲女主播视讯直播帮男友口交最后还口内射精比A片刺激', 'https://video.jializyw.com:8800/20200708/ehSYjYXQ/index.m3u8', '752', null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/201acb7fc2cddf53eaecd1be21b08fd5.jpg', '1', '1', '0', '0', '', '273', '2020-07-16 16:42:38');
INSERT INTO `video` VALUES ('565', '2-5', null, '37490', 'https://tp.jializyw.com/upload/vod/20200709-1/2917fda86c0b5b6d4b76d1d2e0476ecc.jpg', 'admin', '[中文主播外流]美女主播穿着黑丝透视装诱惑椅子上拿跳蛋自慰', 'https://video.jializyw.com:8800/20200708/xwccgaYn/index.m3u8', '752', null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/2917fda86c0b5b6d4b76d1d2e0476ecc.jpg', '1', '1', '0', '0', '', '273', '2020-07-16 16:42:38');
INSERT INTO `video` VALUES ('566', '2-5', null, '37489', 'https://tp.jializyw.com/upload/vod/20200709-1/2bf020093d0b881ea892c610a441f94b.jpg', 'admin', '[中文主播外流]女主播极品美少女抬腿开鲍私处近拍按摩棒口交自慰', 'https://video.jializyw.com:8800/20200708/BGRGoZ9E/index.m3u8', '752', null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/2bf020093d0b881ea892c610a441f94b.jpg', '1', '1', '0', '0', '', '273', '2020-07-16 16:42:38');
INSERT INTO `video` VALUES ('567', '2-5', null, '37488', 'https://tp.jializyw.com/upload/vod/20200709-1/93049e3ac8d5cdfa9028e100518f82ed.jpg', 'admin', '[韩国主播外流]我们在视频里恋爱，哥哥想看我的小穴穴吗', 'https://video.jializyw.com:8800/20200708/fKGTA8dI/index.m3u8', '752', null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/93049e3ac8d5cdfa9028e100518f82ed.jpg', '1', '1', '0', '0', '', '273', '2020-07-16 16:42:38');
INSERT INTO `video` VALUES ('568', '2-5', null, '37487', 'https://tp.jializyw.com/upload/vod/20200709-1/8b422fe99ca362b0674db0e34d5cacc2.jpg', 'admin', '[欧美主播外流]欧美正妹直播视讯无码片镜头前搔首弄姿极尽挑逗让粉丝疯狂', 'https://video.jializyw.com:8800/20200708/3LVyFWRv/index.m3u8', '752', null, null, 'https://tp.jializyw.com/upload/vod/20200709-1/8b422fe99ca362b0674db0e34d5cacc2.jpg', '1', '1', '0', '0', '', '273', '2020-07-16 16:42:38');

-- ----------------------------
-- Table structure for yqm
-- ----------------------------
DROP TABLE IF EXISTS `yqm`;
CREATE TABLE `yqm` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '代理id',
  `yqm` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邀请码',
  `duration` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '时间',
  `name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '使用者',
  `status` varchar(3) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

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
INSERT INTO `yqm` VALUES ('37', 'admin', 'QC6JpwMg', '2020-06-20 22:15:41', 'QC6JpwMg', '1', '2020-06-20 22:15:42', '2020-06-20 22:16:05');
INSERT INTO `yqm` VALUES ('38', 'admin', 'i8NavF5U', '2020-06-26 18:36:36', 'i8NavF5U', '1', '2020-06-26 18:36:36', '2020-06-26 18:36:46');
INSERT INTO `yqm` VALUES ('39', 'admin', 'R4zrXRJc', '2020-06-26 18:41:19', 'R4zrXRJc', '1', '2020-06-26 18:41:19', '2020-06-26 18:41:31');
INSERT INTO `yqm` VALUES ('40', 'admin', 'LEd2A7Es', '2020-06-26 18:48:36', 'LEd2A7Es', '1', '2020-06-26 18:48:36', '2020-06-26 18:48:47');
