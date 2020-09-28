-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2020-07-19 14:39:22
-- 服务器版本： 5.6.48-log
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";




--
-- Database: `ruoyi`
--

-- --------------------------------------------------------

--
-- 表的结构 `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL,
  `account_id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '账户唯一标识',
  `balance` bigint(20) NOT NULL COMMENT '余额',
  `state` varchar(22) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态[1:启用,0:禁用]',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(120) CHARACTER SET utf8 DEFAULT NULL,
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `modified_by` varchar(120) CHARACTER SET utf8 DEFAULT NULL,
  `account_type` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账户类型'
) ENGINE=InnoDB AUTO_INCREMENT=21735 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `account`
--

INSERT INTO `account` (`id`, `account_id`, `balance`, `state`, `gmt_create`, `create_by`, `gmt_modified`, `modified_by`, `account_type`) VALUES
(21734, 'admin', 690061011, '1', '2020-07-12 10:53:55', 'SYSTEM', '2020-07-19 11:22:23', 'SYSTEM', 'PROMOTION_MERCHANT');

-- --------------------------------------------------------

--
-- 表的结构 `account_detail`
--

CREATE TABLE IF NOT EXISTS `account_detail` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `account_id` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '账户唯一id',
  `amount` bigint(20) DEFAULT NULL COMMENT '金额 分为单位',
  `opt_type` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '操作类型 [0:收入][1:支出]',
  `remark` varchar(512) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `out_trade_no` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '订单id',
  `biz_code` varchar(120) CHARACTER SET utf8 NOT NULL COMMENT '业务代码',
  `source_code` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源业务编码',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `operator` varchar(120) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=113968 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `account_detail`
--

INSERT INTO `account_detail` (`id`, `account_id`, `amount`, `opt_type`, `remark`, `out_trade_no`, `biz_code`, `source_code`, `gmt_create`, `gmt_modified`, `operator`) VALUES
(113948, 'admin', 20, '0', '返利', NULL, 'ORDER_REBATE', '551189515981557760', '2020-07-12 10:53:55', '2020-07-12 10:53:55', 'SYSTEM'),
(113949, 'admin', 10, '0', '返利', NULL, 'ORDER_AUTHOR_REBATE', '551189515981557760', '2020-07-12 10:53:55', '2020-07-12 10:53:55', 'SYSTEM'),
(113950, 'admin', 20, '0', '返利', NULL, 'ORDER_REBATE', '551233546623127552', '2020-07-12 13:48:43', '2020-07-12 13:48:43', 'SYSTEM'),
(113951, 'admin', 10, '0', '返利', NULL, 'ORDER_AUTHOR_REBATE', '551233546623127552', '2020-07-12 13:48:43', '2020-07-12 13:48:43', 'SYSTEM'),
(113952, 'admin', 20, '0', '返利', NULL, 'ORDER_REBATE', '551234145007702016', '2020-07-12 13:51:05', '2020-07-12 13:51:05', 'SYSTEM'),
(113953, 'admin', 10, '0', '返利', NULL, 'ORDER_AUTHOR_REBATE', '551234145007702016', '2020-07-12 13:51:05', '2020-07-12 13:51:05', 'SYSTEM'),
(113954, 'admin', 20, '0', '返利', NULL, 'ORDER_REBATE', '552428275725504512', '2020-07-15 20:56:08', '2020-07-15 20:56:08', 'SYSTEM'),
(113955, 'admin', 10, '0', '返利', NULL, 'ORDER_AUTHOR_REBATE', '552428275725504512', '2020-07-15 20:56:08', '2020-07-15 20:56:08', 'SYSTEM'),
(113956, 'admin', 96, '0', '返利', NULL, 'ORDER_REBATE', '552826790192615424', '2020-07-16 23:19:46', '2020-07-16 23:19:46', 'SYSTEM'),
(113957, 'admin', 48, '0', '返利', NULL, 'ORDER_AUTHOR_REBATE', '552826790192615424', '2020-07-16 23:19:46', '2020-07-16 23:19:46', 'SYSTEM'),
(113958, 'admin', 96, '0', '返利', NULL, 'ORDER_REBATE', '552827977168064512', '2020-07-16 23:24:32', '2020-07-16 23:24:32', 'SYSTEM'),
(113959, 'admin', 48, '0', '返利', NULL, 'ORDER_AUTHOR_REBATE', '552827977168064512', '2020-07-16 23:24:32', '2020-07-16 23:24:32', 'SYSTEM'),
(113960, 'admin', 96, '0', '返利', NULL, 'ORDER_REBATE', '553030521995661312', '2020-07-17 12:49:16', '2020-07-17 12:49:16', 'SYSTEM'),
(113961, 'admin', 48, '0', '返利', NULL, 'ORDER_AUTHOR_REBATE', '553030521995661312', '2020-07-17 12:49:16', '2020-07-17 12:49:16', 'SYSTEM'),
(113962, 'admin', 96, '0', '返利', NULL, 'ORDER_REBATE', '553154635917955072', '2020-07-17 21:03:06', '2020-07-17 21:03:06', 'SYSTEM'),
(113963, 'admin', 48, '0', '返利', NULL, 'ORDER_AUTHOR_REBATE', '553154635917955072', '2020-07-17 21:03:06', '2020-07-17 21:03:06', 'SYSTEM'),
(113964, 'admin', -50100, '1', NULL, NULL, 'WITHDRAW', '553702412989239296', '2020-07-19 09:18:59', '2020-07-19 09:18:59', 'SYSTEM'),
(113965, 'admin', -2000000, '1', NULL, NULL, 'WITHDRAW', '553733221209083904', '2020-07-19 11:21:24', '2020-07-19 11:21:24', 'SYSTEM'),
(113966, 'admin', -2000000, '1', NULL, NULL, 'WITHDRAW', '553733373009334272', '2020-07-19 11:22:00', '2020-07-19 11:22:00', 'SYSTEM'),
(113967, 'admin', -2000000, '1', NULL, NULL, 'WITHDRAW', '553733472108154880', '2020-07-19 11:22:24', '2020-07-19 11:22:24', 'SYSTEM');

-- --------------------------------------------------------

--
-- 表的结构 `enterprise_info`
--

CREATE TABLE IF NOT EXISTS `enterprise_info` (
  `id` int(11) NOT NULL,
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
  `contact_phone` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系人号码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `gen_table`
--

CREATE TABLE IF NOT EXISTS `gen_table` (
  `table_id` bigint(20) NOT NULL COMMENT '编号',
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
  `remark` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';

-- --------------------------------------------------------

--
-- 表的结构 `gen_table_column`
--

CREATE TABLE IF NOT EXISTS `gen_table_column` (
  `column_id` bigint(20) NOT NULL COMMENT '编号',
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
  `update_time` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_blob_triggers`
--

CREATE TABLE IF NOT EXISTS `qrtz_blob_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `blob_data` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_calendars`
--

CREATE TABLE IF NOT EXISTS `qrtz_calendars` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `calendar_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `calendar` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_cron_triggers`
--

CREATE TABLE IF NOT EXISTS `qrtz_cron_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `cron_expression` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `time_zone_id` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `qrtz_cron_triggers`
--

INSERT INTO `qrtz_cron_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`) VALUES
('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai'),
('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai'),
('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_fired_triggers`
--

CREATE TABLE IF NOT EXISTS `qrtz_fired_triggers` (
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
  `requests_recovery` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_job_details`
--

CREATE TABLE IF NOT EXISTS `qrtz_job_details` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `job_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `job_group` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL,
  `job_class_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `is_durable` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `is_nonconcurrent` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `is_update_data` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `requests_recovery` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `job_data` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `qrtz_job_details`
--

INSERT INTO `qrtz_job_details` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`, `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`) VALUES
('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f504552544945537372001e636f6d2e72756f79692e71756172747a2e646f6d61696e2e5379734a6f6200000000000000010200084c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000c696e766f6b6554617267657471007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720027636f6d2e72756f79692e636f6d6d6f6e2e636f72652e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001622cde29e078707400007070707400013174000e302f3130202a202a202a202a203f74001172795461736b2e72794e6f506172616d7374000744454641554c547372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000000001740018e7b3bbe7bb9fe9bb98e8aea4efbc88e697a0e58f82efbc8974000133740001317800),
('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f504552544945537372001e636f6d2e72756f79692e71756172747a2e646f6d61696e2e5379734a6f6200000000000000010200084c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000c696e766f6b6554617267657471007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720027636f6d2e72756f79692e636f6d6d6f6e2e636f72652e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001622cde29e078707400007070707400013174000e302f3135202a202a202a202a203f74001572795461736b2e7279506172616d7328277279272974000744454641554c547372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000000002740018e7b3bbe7bb9fe9bb98e8aea4efbc88e69c89e58f82efbc8974000133740001317800),
('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f504552544945537372001e636f6d2e72756f79692e71756172747a2e646f6d61696e2e5379734a6f6200000000000000010200084c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000c696e766f6b6554617267657471007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720027636f6d2e72756f79692e636f6d6d6f6e2e636f72652e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001622cde29e078707400007070707400013174000e302f3230202a202a202a202a203f74003872795461736b2e72794d756c7469706c65506172616d7328277279272c20747275652c20323030304c2c203331362e3530442c203130302974000744454641554c547372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000000003740018e7b3bbe7bb9fe9bb98e8aea4efbc88e5a49ae58f82efbc8974000133740001317800);

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_locks`
--

CREATE TABLE IF NOT EXISTS `qrtz_locks` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `lock_name` varchar(40) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `qrtz_locks`
--

INSERT INTO `qrtz_locks` (`sched_name`, `lock_name`) VALUES
('RuoyiScheduler', 'STATE_ACCESS'),
('RuoyiScheduler', 'TRIGGER_ACCESS');

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_paused_trigger_grps`
--

CREATE TABLE IF NOT EXISTS `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(120) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_scheduler_state`
--

CREATE TABLE IF NOT EXISTS `qrtz_scheduler_state` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `instance_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `qrtz_scheduler_state`
--

INSERT INTO `qrtz_scheduler_state` (`sched_name`, `instance_name`, `last_checkin_time`, `checkin_interval`) VALUES
('RuoyiScheduler', 'sunflowerdeMacBook-Pro.local1591166871043', 1591166968868, 15000);

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_simple_triggers`
--

CREATE TABLE IF NOT EXISTS `qrtz_simple_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_simprop_triggers`
--

CREATE TABLE IF NOT EXISTS `qrtz_simprop_triggers` (
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
  `bool_prop_2` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_triggers`
--

CREATE TABLE IF NOT EXISTS `qrtz_triggers` (
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
  `job_data` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `qrtz_triggers`
--

INSERT INTO `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`, `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`, `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`) VALUES
('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1591166880000, -1, 5, 'PAUSED', 'CRON', 1591166871000, 0, NULL, 2, ''),
('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1591166880000, -1, 5, 'PAUSED', 'CRON', 1591166871000, 0, NULL, 2, ''),
('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1591166880000, -1, 5, 'PAUSED', 'CRON', 1591166871000, 0, NULL, 2, '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_category`
--

CREATE TABLE IF NOT EXISTS `sys_category` (
  `category_id` bigint(20) NOT NULL COMMENT '类目id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父类目id',
  `ancestors` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '祖级列表',
  `category_name` varchar(30) COLLATE utf8mb4_bin DEFAULT '' COMMENT '类目名称',
  `order_num` int(11) DEFAULT NULL COMMENT '显示顺序',
  `status` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='类目表';

--
-- 转存表中的数据 `sys_category`
--

INSERT INTO `sys_category` (`category_id`, `parent_id`, `ancestors`, `category_name`, `order_num`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(100, 0, '0', '大类目', 0, '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-06-20 18:27:55'),
(200, 100, '0,100', '日韩', 1, '0', '0', 'admin', '2020-03-18 13:22:50', 'admin', '2020-03-20 18:14:38'),
(201, 200, '0,100,200', '淑女', 1, '0', '2', 'admin', '2020-03-18 13:33:05', 'admin', '2020-03-20 13:59:45'),
(202, 100, '0,100', '欧美', 2, '0', '0', 'admin', '2020-03-20 18:07:35', 'admin', '2020-03-20 18:15:07'),
(203, 100, '0,100', '动物', 3, '0', '0', 'admin', '2020-03-20 18:08:41', 'admin', '2020-03-20 18:15:22'),
(204, 100, '0,100', '幼女', 4, '0', '0', 'admin', '2020-03-20 18:09:09', 'admin', '2020-03-20 18:15:37'),
(205, 100, '0,100', '乱伦', 5, '0', '0', 'admin', '2020-03-20 18:15:53', '', NULL),
(206, 100, '0,100', '强奸', 6, '0', '0', 'admin', '2020-03-20 18:16:11', '', NULL),
(207, 100, '0,100', '丝袜', 7, '0', '0', 'admin', '2020-03-20 18:16:27', '', NULL),
(208, 100, '0,100', '破处', 8, '0', '0', 'admin', '2020-03-20 18:16:42', '', NULL),
(209, 200, '0,100,200', '日韩', 1, '0', '2', 'admin', '2020-03-20 18:18:20', '', NULL),
(210, 202, '0,100,202', '欧美', 1, '0', '2', 'admin', '2020-03-20 18:18:34', '', NULL),
(211, 203, '0,100,203', '动物', 1, '0', '2', 'admin', '2020-03-20 18:18:42', '', NULL),
(212, 204, '0,100,204', '幼女', 1, '0', '2', 'admin', '2020-03-20 18:18:56', '', NULL),
(213, 205, '0,100,205', '乱论', 1, '0', '2', 'admin', '2020-03-20 18:19:20', '', NULL),
(214, 100, '0,100', '少女', 9, '0', '0', 'admin', '2020-03-20 18:26:16', '', '2020-06-20 18:23:47'),
(215, 100, '0,100', '少妇', 10, '0', '0', 'admin', '2020-03-20 18:26:25', '', '2020-06-20 18:23:56'),
(216, 100, '0,100', '女同', 11, '0', '0', 'admin', '2020-03-20 18:26:33', '', '2020-06-20 18:24:02'),
(217, 100, '0,100', '野战', 12, '0', '0', 'admin', '2020-03-20 18:26:39', '', '2020-06-20 18:24:52'),
(218, 100, '0,100', '自慰', 13, '0', '0', 'admin', '2020-03-20 18:26:46', '', '2020-06-20 18:25:01'),
(219, 100, '0,100', '巨乳', 14, '0', '0', 'admin', '2020-03-20 18:26:54', '', '2020-06-20 18:25:10'),
(220, 100, '0,100', '萝莉', 15, '0', '0', 'admin', '2020-03-20 18:27:01', '', '2020-06-20 18:25:21'),
(221, 100, '0,100', '人妻', 16, '0', '0', 'admin', '2020-03-20 18:27:09', '', '2020-06-20 18:27:02'),
(222, 100, '0,100', '动漫', 17, '1', '0', 'admin', '2020-03-20 18:27:16', '', '2020-07-15 20:54:58'),
(223, 100, '0,100', '直播', 18, '1', '0', 'admin', '2020-03-20 18:27:23', '', '2020-07-15 20:47:05'),
(224, 100, '0,100', '三级', 19, '1', '0', 'admin', '2020-03-20 18:27:30', '', '2020-07-15 20:54:50'),
(225, 100, '0,100', '另类', 20, '1', '0', 'admin', '2020-03-20 18:27:38', '', '2020-07-15 20:54:41'),
(226, 100, '0,100', '偷拍', 18, '0', '0', '', '2020-06-20 18:30:21', '', NULL),
(227, 100, '0,100', '偷情', 1, '0', '0', '', '2020-06-20 18:30:33', '', NULL),
(228, 100, '0,100', '素人', 2, '0', '0', '', '2020-06-20 18:31:54', '', NULL),
(229, 100, '0,100', '自拍', 3, '0', '0', '', '2020-06-20 18:32:49', '', NULL),
(230, 100, '0,100', '口交', 3, '0', '0', '', '2020-06-20 18:33:23', '', NULL),
(272, 100, '0,100', '韩国伦理', 1, '0', '0', 'admin', '2020-07-15 20:29:52', '', NULL),
(273, 100, '0,100', '网红主播', 1, '0', '0', 'admin', '2020-07-15 20:29:52', '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sys_config`
--

CREATE TABLE IF NOT EXISTS `sys_config` (
  `config_id` int(5) NOT NULL COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8mb4_bin DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='参数配置表';

--
-- 转存表中的数据 `sys_config`
--

INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
(2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456'),
(3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light'),
(4, '代理返佣比例配置', 'sys.order.rebate', '20', 'N', 'admin', '2020-04-13 23:06:13', '', NULL, NULL),
(5, '视频作者返佣比例配置', 'sys.author.rebate', '10', 'N', 'admin', '2020-04-13 23:09:23', '', NULL, NULL),
(6, '支付交易类型', 'sys.tradeType', 'JSAPI', 'N', 'admin', '2020-04-16 23:46:07', 'admin', '2020-06-20 15:40:22', '微信公众号支付'),
(7, 'xxx', 'sys.aliPay.userId', '2088512802560474', 'N', 'admin', '2020-04-21 11:20:05', '', NULL, NULL),
(8, '', 'admin', '{"main":"4.8"}', 'N', 'admin', '2020-06-12 00:11:44', '', '2020-07-16 21:48:22', NULL),
(9, '分享标题', 'share.title', '點擊觀看,              完整影視', 'N', 'admin', '2020-06-21 22:29:35', 'admin', '2020-07-17 18:12:09', ''),
(10, '分享内容', 'share.desc', '今日更新，拉無人免提           跳转不出，选择【已购】', 'N', 'admin', '2020-06-21 22:30:09', 'admin', '2020-07-17 18:14:38', ''),
(11, '微信授权域名', 'wxAuthUrl', 'http://auth.yuluncc.top', 'N', 'admin', '2020-06-27 00:11:29', 'admin', '2020-07-16 21:47:43', '微信授权域名');

-- --------------------------------------------------------

--
-- 表的结构 `sys_dept`
--

CREATE TABLE IF NOT EXISTS `sys_dept` (
  `dept_id` bigint(20) NOT NULL COMMENT '部门id',
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
  `update_time` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='部门表';

--
-- 转存表中的数据 `sys_dept`
--

INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(100, 0, '0', '科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-18 15:49:09'),
(101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-18 15:49:09'),
(102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
(103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-18 15:49:09'),
(104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
(105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
(106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
(107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
(108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
(109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- --------------------------------------------------------

--
-- 表的结构 `sys_dict_data`
--

CREATE TABLE IF NOT EXISTS `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL COMMENT '字典编码',
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
  `remark` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='字典数据表';

--
-- 转存表中的数据 `sys_dict_data`
--

INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男'),
(2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女'),
(3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知'),
(4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单'),
(5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单'),
(6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态'),
(7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态'),
(8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态'),
(9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态'),
(10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组'),
(11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组'),
(12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是'),
(13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否'),
(14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知'),
(15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告'),
(16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态'),
(17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态'),
(18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作'),
(19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作'),
(20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作'),
(21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作'),
(22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作'),
(23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作'),
(24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作'),
(25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作'),
(26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作'),
(27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态'),
(28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态'),
(29, 10, '查询', '10', 'sys_oper_type', NULL, 'info', 'Y', '0', 'admin', '2020-04-15 13:26:35', '', NULL, '查询操作');

-- --------------------------------------------------------

--
-- 表的结构 `sys_dict_type`
--

CREATE TABLE IF NOT EXISTS `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='字典类型表';

--
-- 转存表中的数据 `sys_dict_type`
--

INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表'),
(2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表'),
(3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表'),
(4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表'),
(5, '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表'),
(6, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表'),
(7, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表'),
(8, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表'),
(9, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表'),
(10, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- --------------------------------------------------------

--
-- 表的结构 `sys_job`
--

CREATE TABLE IF NOT EXISTS `sys_job` (
  `job_id` bigint(20) NOT NULL COMMENT '任务ID',
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
  `remark` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '备注信息'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';

--
-- 转存表中的数据 `sys_job`
--

INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(''ry'')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(''ry'', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_job_log`
--

CREATE TABLE IF NOT EXISTS `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL COMMENT '任务日志ID',
  `job_name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(120) COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '日志信息',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';

-- --------------------------------------------------------

--
-- 表的结构 `sys_logininfor`
--

CREATE TABLE IF NOT EXISTS `sys_logininfor` (
  `info_id` bigint(20) NOT NULL COMMENT '访问ID',
  `login_name` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间'
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';

--
-- 转存表中的数据 `sys_logininfor`
--

INSERT INTO `sys_logininfor` (`info_id`, `login_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES
(1, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-20 18:19:55'),
(2, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-20 21:47:58'),
(3, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-06-20 22:15:54'),
(4, 'QC6JpwMg', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-20 22:16:08'),
(5, 'QC6JpwMg', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-06-20 22:16:21'),
(6, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-20 22:16:23'),
(7, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-06-20 22:16:50'),
(8, 'QC6JpwMg', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-20 22:16:54'),
(9, 'QC6JpwMg', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-06-20 22:17:43'),
(10, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-20 22:17:44'),
(11, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-21 22:24:35'),
(12, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-23 13:22:16'),
(13, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-23 13:27:07'),
(14, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-23 13:32:29'),
(15, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-23 14:10:10'),
(16, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-23 16:59:27'),
(19, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-24 14:03:14'),
(20, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-26 18:35:30'),
(21, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-06-26 18:36:38'),
(22, 'i8NavF5U', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-26 18:36:50'),
(23, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-26 18:40:40'),
(24, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-06-26 18:41:21'),
(25, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-26 18:41:32'),
(26, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-06-26 18:41:34'),
(27, 'R4zrXRJc', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-26 18:41:37'),
(28, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-26 18:48:20'),
(29, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-06-26 18:48:38'),
(30, 'LEd2A7Es', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-26 18:48:52'),
(31, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-26 21:02:51'),
(32, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-26 23:36:40'),
(33, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 00:50:14'),
(34, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 12:42:04'),
(35, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 13:34:35'),
(36, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 14:19:02'),
(37, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 14:25:46'),
(38, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 14:31:17'),
(39, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 14:44:20'),
(40, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 14:49:13'),
(41, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 14:51:46'),
(42, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 14:57:14'),
(43, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 16:37:16'),
(44, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 19:45:49'),
(45, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 21:18:32'),
(46, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 22:25:41'),
(47, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-27 23:01:52'),
(48, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-28 12:59:07'),
(49, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-28 15:55:14'),
(50, 'admin', '139.227.73.78, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-06-29 21:15:45'),
(51, 'admin', '60.222.152.10, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-05 08:52:05'),
(52, 'admin', '60.222.152.10, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-05 09:26:56'),
(53, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-05 18:20:21'),
(54, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-05 20:40:14'),
(55, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-05 23:04:32'),
(56, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-06 16:01:12'),
(57, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-06 17:41:55'),
(58, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-06 18:46:48'),
(59, 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-06 21:15:22'),
(60, 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-06 21:19:47'),
(61, 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-06 21:48:12'),
(62, 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 07:41:39'),
(63, 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 08:09:03'),
(64, 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 08:40:48'),
(65, 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 08:47:11'),
(66, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 11:10:21'),
(67, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 11:39:48'),
(68, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 11:49:12'),
(69, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 11:54:28'),
(70, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-07-07 12:13:52'),
(71, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 12:13:53'),
(72, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 14:18:21'),
(73, 'admin', '118.194.240.181, 172.16.0.101', '内网IP', 'Firefox 7', 'Windows 10', '0', '登录成功', '2020-07-07 14:25:25'),
(74, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 15:29:11'),
(75, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 17:04:41'),
(76, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 18:13:47'),
(77, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 18:52:57'),
(78, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 19:38:54'),
(79, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 20:37:23'),
(80, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-07 21:40:36'),
(81, 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-08 16:49:33'),
(82, 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-08 19:37:46'),
(83, 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-07-08 19:37:51'),
(84, 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-08 19:38:46'),
(85, 'admin', '60.222.83.204, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-08 20:31:05'),
(86, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-08 22:09:56'),
(87, 'admin', '115.205.170.40, 172.16.0.101', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-07-10 00:45:14'),
(88, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-10 23:04:04'),
(89, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 10:34:09'),
(90, 'admin', '118.78.248.139, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 10:42:53'),
(91, 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 14:02:53'),
(92, 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 14:03:51'),
(93, 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 14:39:57'),
(94, 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 14:46:12'),
(95, 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 14:50:23'),
(96, 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 14:53:54'),
(97, 'admin', '117.151.138.229, 172.16.0.101', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2020-07-12 15:23:39'),
(98, 'admin', '116.5.86.140, 183.3.226.234, 172.16.0.101', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2020-07-12 15:41:22'),
(99, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2020-07-12 15:56:30'),
(100, 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 17:04:19'),
(101, 'admin', '183.27.60.26, 172.16.0.101', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-12 19:14:11'),
(102, 'admin', '183.27.60.26, 172.16.0.101', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-12 19:20:06'),
(103, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2020-07-12 19:30:31'),
(104, 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 19:47:09'),
(105, 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 19:52:35'),
(106, 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-12 21:00:48'),
(107, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2020-07-12 23:59:30'),
(108, 'admin', '60.222.57.242, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-13 00:00:59'),
(109, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-13 08:57:37'),
(110, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-13 14:14:52'),
(111, 'admin', '112.10.81.158, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-13 20:36:51'),
(112, 'admin', '112.10.81.158, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-13 20:37:36'),
(113, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-13 20:53:14'),
(114, 'admin', '112.10.81.158, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-13 23:17:44'),
(115, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-13 23:49:29'),
(116, 'admin', '183.27.60.26, 172.16.0.101', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2020-07-14 00:38:19'),
(117, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-14 10:25:35'),
(118, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-14 10:32:51'),
(119, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-14 15:02:32'),
(120, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-14 16:35:43'),
(121, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-14 23:20:51'),
(122, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-15 16:12:58'),
(123, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-15 17:59:26'),
(124, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-15 18:49:45'),
(125, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-15 18:57:32'),
(126, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-15 19:51:27'),
(127, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-15 19:54:41'),
(128, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-15 20:02:58'),
(129, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-15 20:27:33'),
(130, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-15 20:43:17'),
(131, 'admin', '116.5.87.154, 172.16.0.101', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-15 20:43:32'),
(132, 'admin', '116.5.87.154, 172.16.0.101', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-15 21:30:13'),
(133, 'admin', '118.78.249.178, 172.16.0.101', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-16 16:42:25'),
(134, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-16 21:46:51'),
(135, 'admin', '116.5.87.154', 'XX XX', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-16 22:39:45'),
(136, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-16 23:25:38'),
(137, 'admin', '116.5.87.154', 'XX XX', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-16 23:33:07'),
(138, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 07:16:00'),
(139, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 09:21:37'),
(140, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 09:33:35'),
(141, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 09:53:16'),
(142, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 12:01:19'),
(143, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-07-17 12:45:36'),
(144, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 12:45:41'),
(145, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-07-17 12:45:58'),
(146, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 12:46:31'),
(147, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 14:40:58'),
(148, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 14:51:25'),
(149, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 14:58:18'),
(150, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 15:13:05'),
(151, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 15:55:26'),
(152, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 16:00:12'),
(153, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 16:04:07'),
(154, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 16:17:10'),
(155, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 16:54:52'),
(156, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-07-17 17:04:33'),
(157, 'LEd2A7Es', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 17:04:38'),
(158, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 17:37:28'),
(159, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 20:57:55'),
(160, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 21:03:41'),
(161, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-07-17 21:04:38'),
(162, 'xiaocai', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 21:05:32'),
(163, 'admin', '223.104.47.77', 'XX XX', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '密码输入错误1次', '2020-07-17 21:05:59'),
(164, 'xiaocai', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-07-17 21:07:08'),
(165, 'admin', '118.78.249.178', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-17 21:07:13'),
(166, 'xiaocai', '223.104.47.77', 'XX XX', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2020-07-17 21:08:11'),
(167, 'admin', '218.26.55.24', 'XX XX', 'Apple WebKit', 'Mac OS X (iPhone)', '1', '密码输入错误1次', '2020-07-17 21:19:36'),
(168, 'admin', '218.26.55.24', 'XX XX', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2020-07-17 21:19:44'),
(169, 'admin', '118.78.13.146', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-18 10:46:39'),
(170, 'admin', '118.78.13.146', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-18 10:52:32'),
(171, 'admin', '116.5.87.231', 'XX XX', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-18 23:40:27'),
(172, 'admin', '118.78.13.146', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '退出成功', '2020-07-19 10:40:20'),
(173, 'admin', '118.78.13.146', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-19 10:40:25'),
(174, 'admin', '118.78.13.146', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-19 10:56:01'),
(175, 'admin', '118.78.13.146', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-19 11:00:16'),
(176, 'admin', '118.78.13.146', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-19 11:07:52'),
(177, 'admin', '118.78.13.146', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-19 13:04:22'),
(178, 'admin', '60.222.195.194', 'XX XX', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-07-19 14:08:15');

-- --------------------------------------------------------

--
-- 表的结构 `sys_menu`
--

CREATE TABLE IF NOT EXISTS `sys_menu` (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
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
  `remark` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '备注'
) ENGINE=InnoDB AUTO_INCREMENT=2103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

--
-- 转存表中的数据 `sys_menu`
--

INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '系统管理', 0, 1, '#', '', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录'),
(2, '系统监控', 0, 2, '#', 'menuItem', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-19 22:04:35', '系统监控目录'),
(3, '系统工具', 0, 3, '#', '', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录'),
(100, '用户管理', 1, 1, '/system/user', 'menuItem', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-13 20:07:21', '用户管理菜单'),
(101, '角色管理', 1, 2, '/system/role', 'menuItem', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-23 22:33:10', '角色管理菜单'),
(102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单'),
(103, '部门管理', 1, 4, '/system/dept', 'menuItem', 'C', '1', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-23 20:30:27', '部门管理菜单'),
(104, '岗位管理', 1, 5, '/system/post', 'menuItem', 'C', '1', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-23 20:30:50', '岗位管理菜单'),
(105, '字典管理', 1, 6, '/system/dict', 'menuItem', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-15 13:23:50', '字典管理菜单'),
(106, '参数设置', 1, 7, '/system/config', '', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单'),
(107, '通知公告', 1, 8, '/system/notice', 'menuItem', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-06-11 16:11:12', '通知公告菜单'),
(108, '日志管理', 1, 9, '#', '', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单'),
(109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单'),
(110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单'),
(111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单'),
(112, '服务监控', 2, 3, '/monitor/server', '', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单'),
(113, '表单构建', 3, 1, '/tool/build', '', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单'),
(114, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单'),
(115, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单'),
(500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单'),
(501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单'),
(1000, '用户查询', 100, 1, '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1001, '用户新增', 100, 2, '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1002, '用户修改', 100, 3, '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1003, '用户删除', 100, 4, '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1004, '用户导出', 100, 5, '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1005, '用户导入', 100, 6, '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1006, '重置密码', 100, 7, '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1007, '角色查询', 101, 1, '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1008, '角色新增', 101, 2, '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1009, '角色修改', 101, 3, '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1010, '角色删除', 101, 4, '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1011, '角色导出', 101, 5, '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1012, '菜单查询', 102, 1, '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1013, '菜单新增', 102, 2, '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1014, '菜单修改', 102, 3, '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1015, '菜单删除', 102, 4, '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1016, '部门查询', 103, 1, '#', '', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1017, '部门新增', 103, 2, '#', '', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1018, '部门修改', 103, 3, '#', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1019, '部门删除', 103, 4, '#', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1020, '岗位查询', 104, 1, '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1021, '岗位新增', 104, 2, '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1022, '岗位修改', 104, 3, '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1023, '岗位删除', 104, 4, '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1024, '岗位导出', 104, 5, '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1025, '字典查询', 105, 1, '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1026, '字典新增', 105, 2, '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1027, '字典修改', 105, 3, '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1028, '字典删除', 105, 4, '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1029, '字典导出', 105, 5, '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1030, '参数查询', 106, 1, '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1031, '参数新增', 106, 2, '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1032, '参数修改', 106, 3, '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1033, '参数删除', 106, 4, '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1034, '参数导出', 106, 5, '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1035, '公告查询', 107, 1, '#', '', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1036, '公告新增', 107, 2, '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1037, '公告修改', 107, 3, '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1038, '公告删除', 107, 4, '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1039, '操作查询', 500, 1, '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1040, '操作删除', 500, 2, '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1041, '详细信息', 500, 3, '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1042, '日志导出', 500, 4, '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1043, '登录查询', 501, 1, '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1044, '登录删除', 501, 2, '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1045, '日志导出', 501, 3, '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1046, '在线查询', 109, 1, '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1047, '批量强退', 109, 2, '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1048, '单条强退', 109, 3, '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1049, '任务查询', 110, 1, '#', '', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1050, '任务新增', 110, 2, '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1051, '任务修改', 110, 3, '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1052, '任务删除', 110, 4, '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1053, '状态修改', 110, 5, '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1054, '任务详细', 110, 6, '#', '', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1055, '任务导出', 110, 7, '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1056, '生成查询', 114, 1, '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1057, '生成修改', 114, 2, '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1058, '生成删除', 114, 3, '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1059, '预览代码', 114, 4, '#', '', 'F', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(1060, '生成代码', 114, 5, '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(2002, '投诉列表', 2082, 1, '/system/ts', 'menuItem', 'C', '0', 'system:ts:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-06-20 15:48:45', '【请填写功能名称】菜单'),
(2003, '【请填写功能名称】查询', 2002, 1, '#', '', 'F', '0', 'system:ts:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2004, '【请填写功能名称】新增', 2002, 2, '#', '', 'F', '0', 'system:ts:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2005, '【请填写功能名称】修改', 2002, 3, '#', '', 'F', '0', 'system:ts:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2006, '【请填写功能名称】删除', 2002, 4, '#', '', 'F', '0', 'system:ts:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2007, '公共片库', 2101, 1, '/system/shipin', 'menuItem', 'C', '0', 'system:shipin:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-06-20 15:47:20', '公共片库菜单'),
(2008, '公共片库查询', 2007, 1, '#', '', 'F', '0', 'system:shipin:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2009, '公共片库新增', 2007, 2, '#', '', 'F', '0', 'system:shipin:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2010, '公共片库修改', 2007, 3, '#', '', 'F', '0', 'system:shipin:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2011, '公共片库删除', 2007, 4, '#', '', 'F', '0', 'system:shipin:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2012, '邀请码管理', 2082, 1, '/system/yqm', 'menuItem', 'C', '0', 'system:yqm:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-06-20 15:48:53', '邀请码管理菜单'),
(2013, '邀请码管理查询', 2012, 1, '#', '', 'F', '0', 'system:yqm:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2014, '邀请码管理新增', 2012, 2, '#', '', 'F', '0', 'system:yqm:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2015, '邀请码管理修改', 2012, 3, '#', '', 'F', '0', 'system:yqm:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2016, '邀请码管理删除', 2012, 4, '#', '', 'F', '0', 'system:yqm:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2017, '类目管理', 2082, 1, '/system/category', 'menuItem', 'C', '0', 'system:category:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-06-20 15:48:01', '类目菜单'),
(2018, '类目查询', 2017, 1, '#', '', 'F', '0', 'system:category:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2019, '类目新增', 2017, 2, '#', '', 'F', '0', 'system:category:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2020, '类目修改', 2017, 3, '#', '', 'F', '0', 'system:category:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2021, '类目删除', 2017, 4, '#', '', 'F', '0', 'system:category:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2028, '代理链接管理', 2083, 1, '/system/short', 'menuItem', 'C', '0', 'system:short:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-06-26 18:36:18', '链接管理菜单'),
(2029, '链接管理查询', 2028, 1, '#', '', 'F', '0', 'system:short:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2030, '链接管理新增', 2028, 2, '#', '', 'F', '0', 'system:short:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2031, '链接管理修改', 2028, 3, '#', '', 'F', '0', 'system:short:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2032, '链接管理删除', 2028, 4, '#', '', 'F', '0', 'system:short:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2033, '链接管理导出', 2028, 5, '#', '', 'F', '0', 'system:short:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2040, '域名管理', 2083, 1, '/system/webmain', 'menuItem', 'C', '0', 'system:webmain:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-13 20:09:12', '域名管理菜单'),
(2041, '域名管理查询', 2040, 1, '#', '', 'F', '0', 'system:webmain:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2042, '域名管理新增', 2040, 2, '#', '', 'F', '0', 'system:webmain:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2043, '域名管理修改', 2040, 3, '#', '', 'F', '0', 'system:webmain:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2044, '域名管理删除', 2040, 4, '#', '', 'F', '0', 'system:webmain:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2045, '域名管理导出', 2040, 5, '#', '', 'F', '0', 'system:webmain:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2046, '公众号配置信息', 2083, 1, '/system/wechatConfig', 'menuItem', 'C', '0', 'system:wechatConfig:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-13 20:09:29', '公众号配置信息菜单'),
(2047, '公众号配置信息查询', 2046, 1, '#', '', 'F', '0', 'system:wechatConfig:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2048, '公众号配置信息新增', 2046, 2, '#', '', 'F', '0', 'system:wechatConfig:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2049, '公众号配置信息修改', 2046, 3, '#', '', 'F', '0', 'system:wechatConfig:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2050, '公众号配置信息删除', 2046, 4, '#', '', 'F', '0', 'system:wechatConfig:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2051, '公众号配置信息导出', 2046, 5, '#', '', 'F', '0', 'system:wechatConfig:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2058, '订单列表', 2082, 1, '/system/sysOrder', 'menuItem', 'C', '0', 'system:sysOrder:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-13 20:12:07', '订单列表菜单'),
(2059, '订单列表查询', 2058, 1, '#', '', 'F', '0', 'system:sysOrder:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2060, '订单列表新增', 2058, 2, '#', '', 'F', '0', 'system:sysOrder:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2061, '订单列表修改', 2058, 3, '#', '', 'F', '0', 'system:sysOrder:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2062, '订单列表删除', 2058, 4, '#', '', 'F', '0', 'system:sysOrder:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2063, '订单列表导出', 2058, 5, '#', '', 'F', '0', 'system:sysOrder:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2064, '账户管理', 2082, 1, '/system/account', 'menuItem', 'C', '0', 'system:account:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-13 19:48:25', '【请填写功能名称】菜单'),
(2065, '【请填写功能名称】查询', 2064, 1, '#', '', 'F', '0', 'system:account:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2066, '【请填写功能名称】新增', 2064, 2, '#', '', 'F', '0', 'system:account:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2067, '【请填写功能名称】修改', 2064, 3, '#', '', 'F', '0', 'system:account:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2068, '【请填写功能名称】删除', 2064, 4, '#', '', 'F', '0', 'system:account:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2069, '【请填写功能名称】导出', 2064, 5, '#', '', 'F', '0', 'system:account:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2070, '平台用户', 2082, 1, '/system/wxuser', 'menuItem', 'C', '0', 'system:wxuser:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-13 19:49:02', '平台用户菜单'),
(2071, '平台用户查询', 2070, 1, '#', '', 'F', '0', 'system:wxuser:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2072, '平台用户新增', 2070, 2, '#', '', 'F', '0', 'system:wxuser:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2073, '平台用户修改', 2070, 3, '#', '', 'F', '0', 'system:wxuser:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2074, '平台用户删除', 2070, 4, '#', '', 'F', '0', 'system:wxuser:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2075, '平台用户导出', 2070, 5, '#', '', 'F', '0', 'system:wxuser:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2076, '账户明细', 2082, 1, '/system/accountDetail', 'menuItem', 'C', '0', 'system:accountDetail:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-13 19:47:25', '账户明细菜单'),
(2077, '账户明细查询', 2076, 1, '#', '', 'F', '0', 'system:accountDetail:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2078, '账户明细新增', 2076, 2, '#', '', 'F', '0', 'system:accountDetail:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2079, '账户明细修改', 2076, 3, '#', '', 'F', '0', 'system:accountDetail:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2080, '账户明细删除', 2076, 4, '#', '', 'F', '0', 'system:accountDetail:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2081, '账户明细导出', 2076, 5, '#', '', 'F', '0', 'system:accountDetail:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2082, '账务管理', 1, 1, '#', 'menuItem', 'M', '0', '', 'fa fa-asterisk', 'admin', '2020-04-13 19:45:39', 'admin', '2020-06-20 15:46:31', ''),
(2083, '配置管理', 0, 2, '#', 'menuItem', 'M', '0', NULL, 'fa fa-arrows', 'admin', '2020-04-13 20:08:11', '', NULL, ''),
(2084, '授权信息', 2082, 1, '/system/wxauth', 'menuItem', 'C', '0', 'system:wxauth:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-07-12 10:54:01', '授权信息菜单'),
(2085, '授权信息查询', 2084, 1, '#', '', 'F', '0', 'system:wxauth:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2086, '授权信息新增', 2084, 2, '#', '', 'F', '0', 'system:wxauth:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2087, '授权信息修改', 2084, 3, '#', '', 'F', '0', 'system:wxauth:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2088, '授权信息删除', 2084, 4, '#', '', 'F', '0', 'system:wxauth:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2089, '授权信息导出', 2084, 5, '#', '', 'F', '0', 'system:wxauth:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2090, '打赏记录', 2102, 1, '/statistics/record', 'menuItem', 'C', '0', '', '#', 'admin', '2020-06-05 13:26:31', 'admin', '2020-06-20 15:44:55', ''),
(2091, '打赏统计', 2102, 1, '/statistics/statistics', 'menuItem', 'C', '0', '', '#', 'admin', '2020-06-05 13:26:46', 'admin', '2020-06-20 15:45:05', ''),
(2093, '申请提现', 2102, 1, '/statistics/withdrawal/withdrawalRecord', 'menuItem', 'C', '0', '', '#', 'admin', '2020-06-05 16:27:48', 'admin', '2020-06-20 15:45:18', ''),
(2094, '交易信息', 2082, 1, '/system/trade', 'menuItem', 'C', '0', 'system:trade:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-06-20 15:48:20', '交易信息菜单'),
(2095, '交易信息查询', 2094, 1, '#', '', 'F', '0', 'system:trade:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2096, '交易信息新增', 2094, 2, '#', '', 'F', '0', 'system:trade:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2097, '交易信息修改', 2094, 3, '#', '', 'F', '0', 'system:trade:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2098, '交易信息删除', 2094, 4, '#', '', 'F', '0', 'system:trade:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2099, '交易信息导出', 2094, 5, '#', '', 'F', '0', 'system:trade:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
(2100, '私人片库', 2102, 1, '/system/shipin/pshipin', 'menuItem', 'C', '0', '', '#', 'admin', '2020-06-11 21:31:09', 'admin', '2020-06-20 15:45:50', ''),
(2101, '业务管理', 0, 0, '#', 'menuItem', 'M', '0', '', 'fa fa-asterisk', 'admin', '2020-06-20 15:43:16', 'admin', '2020-06-20 15:43:25', ''),
(2102, '推广管理', 2101, 1, '#', 'menuItem', 'M', '0', NULL, 'fa fa-arrows-h', 'admin', '2020-06-20 15:44:44', '', NULL, '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_notice`
--

CREATE TABLE IF NOT EXISTS `sys_notice` (
  `notice_id` int(4) NOT NULL COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '公告内容',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='通知公告表';

--
-- 转存表中的数据 `sys_notice`
--

INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '1', 'admin', '2018-03-16 11:33:00', 'admin', '2020-06-11 16:11:22', '管理员'),
(2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '1', 'admin', '2018-03-16 11:33:00', 'admin', '2020-06-11 16:11:25', '管理员');

-- --------------------------------------------------------

--
-- 表的结构 `sys_oper_log`
--

CREATE TABLE IF NOT EXISTS `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL COMMENT '日志主键',
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
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间'
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='操作日志记录';

--
-- 转存表中的数据 `sys_oper_log`
--

INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES
(1, '操作日志', 9, 'com.ruoyi.web.controller.monitor.SysOperlogController.clean()', 'POST', 1, 'admin', '研发部门', '/monitor/operlog/clean', '118.78.249.178', 'XX XX', '{ }', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-17 16:20:10'),
(2, '生成推广链接', 0, 'com.ruoyi.web.controller.system.SysIndexController.build()', 'POST', 1, 'LEd2A7Es', '测试部门', '/system/build', '118.78.249.178', 'XX XX', '{ }', '{\n  "msg" : "success",\n  "code" : 0,\n  "data" : {\n    "searchValue" : null,\n    "createBy" : null,\n    "createTime" : "2020-07-17 09:04:44",\n    "updateBy" : null,\n    "updateTime" : null,\n    "remark" : null,\n    "params" : { },\n    "id" : 17,\n    "shortKey" : "LEd2A7Es",\n    "shortUrl" : "https://sourl.cn/sVVNdj",\n    "longUrl" : "http://yuluncc.top/?userId=LEd2A7Es",\n    "shortStatus" : "0"\n  }\n}', 0, NULL, '2020-07-17 17:04:44'),
(3, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '118.78.249.178', 'XX XX', '{\n  "configId" : [ "10" ],\n  "configName" : [ "分享内容" ],\n  "configKey" : [ "share.desc" ],\n  "configValue" : [ "今日更新，             拉無人免提" ],\n  "configType" : [ "N" ],\n  "remark" : [ "" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-17 18:11:30'),
(4, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '118.78.249.178', 'XX XX', '{\n  "configId" : [ "10" ],\n  "configName" : [ "分享内容" ],\n  "configKey" : [ "share.desc" ],\n  "configValue" : [ "今日更新，             拉無人免提" ],\n  "configType" : [ "N" ],\n  "remark" : [ "" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-17 18:11:35'),
(5, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '118.78.249.178', 'XX XX', '{\n  "configId" : [ "9" ],\n  "configName" : [ "分享标题" ],\n  "configKey" : [ "share.title" ],\n  "configValue" : [ "點擊觀看,              完整影視" ],\n  "configType" : [ "N" ],\n  "remark" : [ "" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-17 18:12:04'),
(6, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '118.78.249.178', 'XX XX', '{\n  "configId" : [ "9" ],\n  "configName" : [ "分享标题" ],\n  "configKey" : [ "share.title" ],\n  "configValue" : [ "點擊觀看,              完整影視" ],\n  "configType" : [ "N" ],\n  "remark" : [ "" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-17 18:12:09'),
(7, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '118.78.249.178', 'XX XX', '{\n  "configId" : [ "10" ],\n  "configName" : [ "分享内容" ],\n  "configKey" : [ "share.desc" ],\n  "configValue" : [ "今日更新，拉無人免提           跳转不出，选择【已购】" ],\n  "configType" : [ "N" ],\n  "remark" : [ "" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-17 18:14:38'),
(8, '重置密码', 2, 'com.ruoyi.web.controller.system.SysProfileController.resetPwd()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/resetPwd', '118.78.249.178', 'XX XX', '{\n  "userId" : [ "1" ],\n  "loginName" : [ "admin" ],\n  "oldPassword" : [ "admin123" ],\n  "newPassword" : [ "admin" ],\n  "confirm" : [ "admin" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-17 20:58:31'),
(9, '邀请码管理', 1, 'com.ruoyi.web.controller.system.YqmController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/yqm/add', '118.78.249.178', 'XX XX', '{\n  "userId" : [ "admin" ],\n  "yqm" : [ "NzwclLm9" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-17 21:04:35'),
(10, '代理商户注册', 0, 'com.ruoyi.web.controller.common.WebController.reg()', 'POST', 1, NULL, NULL, '/webLogin/reg', '118.78.249.178', 'XX XX', '{\n  "loginName" : [ "xiaocai" ],\n  "userName" : [ "xiaocai" ],\n  "password" : [ "xiaocai" ],\n  "yqm" : [ "NzwclLm9" ],\n  "payee" : [ "xiaocai" ],\n  "payeeAccount" : [ "xiaocai" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-17 21:05:00'),
(11, '订单列表', 3, 'com.ruoyi.web.controller.system.SysOrderController.remove()', 'POST', 1, 'admin', '研发部门', '/system/sysOrder/remove', '118.78.13.146', 'XX XX', '{\n  "ids" : [ "336,335,333,332,331,329,326,325,324,322" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-18 11:03:37'),
(12, '订单列表', 3, 'com.ruoyi.web.controller.system.SysOrderController.remove()', 'POST', 1, 'admin', '研发部门', '/system/sysOrder/remove', '118.78.13.146', 'XX XX', '{\n  "ids" : [ "323,319,317,316,315,314,313,312,311,310" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-18 11:04:04'),
(13, '订单列表', 3, 'com.ruoyi.web.controller.system.SysOrderController.remove()', 'POST', 1, 'admin', '研发部门', '/system/sysOrder/remove', '118.78.13.146', 'XX XX', '{\n  "ids" : [ "306,301" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-18 11:04:13'),
(14, '订单列表', 3, 'com.ruoyi.web.controller.system.SysOrderController.remove()', 'POST', 1, 'admin', '研发部门', '/system/sysOrder/remove', '118.78.13.146', 'XX XX', '{\n  "ids" : [ "330,328,327,321,318,309,308,307,303,302" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-18 11:04:27'),
(15, '公众号配置信息', 1, 'com.ruoyi.reward.controller.SysWechatConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/wechatConfig/add', '118.78.13.146', 'XX XX', '{\n  "configCode" : [ "WY_FULI" ],\n  "appId" : [ "wx590af156c3a3eae9" ],\n  "appsecret" : [ "8af481db51cd509f26c857a75712c9ce" ],\n  "mchId" : [ "" ],\n  "signKey" : [ "" ],\n  "certFile" : [ "" ],\n  "token" : [ "" ],\n  "encodingAesKey" : [ "" ],\n  "gmtCreate" : [ "2020-04-01" ],\n  "gmtModified" : [ "2020-04-01" ]\n}', 'null', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field ''state'' doesn''t have a default value\n### The error may involve com.ruoyi.reward.mapper.SysWechatConfigMapper.insertSysWechatConfig-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_wechat_config          ( config_code,                          app_id,             appsecret,                                                                              gmt_create,             gmt_modified,             create_time )           values ( ?,                          ?,             ?,                                                                              ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field ''state'' doesn''t have a default value\n; Field ''state'' doesn''t have a default value; nested exception is java.sql.SQLException: Field ''state'' doesn''t have a default value', '2020-07-18 11:35:05'),
(16, '公众号配置信息', 1, 'com.ruoyi.reward.controller.SysWechatConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/wechatConfig/add', '118.78.13.146', 'XX XX', '{\n  "configCode" : [ "WY_FULI" ],\n  "appId" : [ "wx590af156c3a3eae9" ],\n  "appsecret" : [ "8af481db51cd509f26c857a75712c9ce" ],\n  "mchId" : [ "" ],\n  "signKey" : [ "" ],\n  "certFile" : [ "" ],\n  "token" : [ "" ],\n  "encodingAesKey" : [ "" ],\n  "gmtCreate" : [ "2020-04-01" ],\n  "gmtModified" : [ "2020-04-01" ]\n}', 'null', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field ''state'' doesn''t have a default value\n### The error may involve com.ruoyi.reward.mapper.SysWechatConfigMapper.insertSysWechatConfig-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_wechat_config          ( config_code,                          app_id,             appsecret,                                                                              gmt_create,             gmt_modified,             create_time )           values ( ?,                          ?,             ?,                                                                              ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field ''state'' doesn''t have a default value\n; Field ''state'' doesn''t have a default value; nested exception is java.sql.SQLException: Field ''state'' doesn''t have a default value', '2020-07-18 11:35:29'),
(17, '公众号配置信息', 1, 'com.ruoyi.reward.controller.SysWechatConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/wechatConfig/add', '118.78.13.146', 'XX XX', '{\n  "configCode" : [ "WY_FULI" ],\n  "appId" : [ "wx590af156c3a3eae9" ],\n  "appsecret" : [ "8af481db51cd509f26c857a75712c9ce" ],\n  "mchId" : [ "" ],\n  "signKey" : [ "" ],\n  "certFile" : [ "" ],\n  "token" : [ "" ],\n  "encodingAesKey" : [ "" ],\n  "gmtCreate" : [ "2020-04-01" ],\n  "gmtModified" : [ "2020-04-01" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-18 11:55:43'),
(18, '公众号配置信息', 2, 'com.ruoyi.reward.controller.SysWechatConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/wechatConfig/edit', '118.78.13.146', 'XX XX', '{\n  "id" : [ "14" ],\n  "envType" : [ "druid" ],\n  "configCode" : [ "WY_FULI" ],\n  "appId" : [ "wx590af156c3a3eae9" ],\n  "appsecret" : [ "8af481db51cd509f26c857a75712c9ce" ],\n  "mchId" : [ "" ],\n  "signKey" : [ "" ],\n  "certFile" : [ "" ],\n  "token" : [ "" ],\n  "encodingAesKey" : [ "" ],\n  "gmtCreate" : [ "2020-04-01" ],\n  "gmtModified" : [ "2020-04-01" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-18 12:18:02'),
(19, '公众号配置信息', 2, 'com.ruoyi.reward.controller.SysWechatConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/wechatConfig/edit', '118.78.13.146', 'XX XX', '{\n  "id" : [ "14" ],\n  "envType" : [ "druid" ],\n  "configCode" : [ "WY_FULI" ],\n  "appId" : [ "wx590af156c3a3eae9" ],\n  "appsecret" : [ "8af481db51cd509f26c857a75712c9ce" ],\n  "mchId" : [ "1600946459" ],\n  "signKey" : [ "" ],\n  "certFile" : [ "" ],\n  "token" : [ "" ],\n  "encodingAesKey" : [ "" ],\n  "gmtCreate" : [ "2020-04-01" ],\n  "gmtModified" : [ "2020-04-01" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-18 12:18:13'),
(20, '公众号配置信息', 2, 'com.ruoyi.reward.controller.SysWechatConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/wechatConfig/edit', '118.78.13.146', 'XX XX', '{\n  "id" : [ "14" ],\n  "envType" : [ "druid" ],\n  "configCode" : [ "WY_FULI" ],\n  "appId" : [ "wx590af156c3a3eae9" ],\n  "appsecret" : [ "8af481db51cd509f26c857a75712c9ce" ],\n  "mchId" : [ "1600946459" ],\n  "signKey" : [ "22f5c38598681b0d5179d84fc3bc576a" ],\n  "certFile" : [ "" ],\n  "token" : [ "" ],\n  "encodingAesKey" : [ "" ],\n  "gmtCreate" : [ "2020-04-01" ],\n  "gmtModified" : [ "2020-04-01" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-18 12:18:19'),
(21, '预览视频', 2, 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', 1, 'admin', '研发部门', '/system/shipin/preview/138', '116.5.87.231', 'XX XX', '{ }', '"system/shipin/preview"', 0, NULL, '2020-07-18 23:40:55'),
(22, '预览视频', 2, 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', 1, 'admin', '研发部门', '/system/shipin/preview/550', '116.5.87.231', 'XX XX', '{ }', '"system/shipin/preview"', 0, NULL, '2020-07-18 23:42:10'),
(23, '预览视频', 2, 'com.ruoyi.web.controller.system.VideoController.resetPwd()', 'GET', 1, 'admin', '研发部门', '/system/shipin/preview/573', '116.5.87.231', 'XX XX', '{ }', '"system/shipin/preview"', 0, NULL, '2020-07-18 23:43:19'),
(24, '申请提现', 1, 'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()', 'POST', 1, 'admin', '研发部门', '/statistics/withdrawal/add', '118.78.13.146', 'XX XX', '{\n  "amountStr" : [ "499" ],\n  "password" : [ "admin" ],\n  "payeeType" : [ "bank" ],\n  "remark" : [ "建设银行" ],\n  "payee" : [ "0K9FpDRK" ],\n  "payeeNo" : [ "111" ]\n}', '{\n  "msg" : "单笔最小提款金额不足500元",\n  "code" : 500\n}', 0, NULL, '2020-07-19 09:18:43'),
(25, '申请提现', 1, 'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()', 'POST', 1, 'admin', '研发部门', '/statistics/withdrawal/add', '118.78.13.146', 'XX XX', '{\n  "amountStr" : [ "200000" ],\n  "password" : [ "admin" ],\n  "payeeType" : [ "bank" ],\n  "remark" : [ "建设银行" ],\n  "payee" : [ "0K9FpDRK" ],\n  "payeeNo" : [ "111" ]\n}', '{\n  "msg" : "提现单笔最高金额不能超过20000元",\n  "code" : 500\n}', 0, NULL, '2020-07-19 09:18:51'),
(26, '申请提现', 1, 'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()', 'POST', 1, 'admin', '研发部门', '/statistics/withdrawal/add', '118.78.13.146', 'XX XX', '{\n  "amountStr" : [ "501" ],\n  "password" : [ "admin" ],\n  "payeeType" : [ "bank" ],\n  "remark" : [ "建设银行" ],\n  "payee" : [ "0K9FpDRK" ],\n  "payeeNo" : [ "111" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-19 09:18:58'),
(27, '申请提现', 1, 'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()', 'POST', 1, 'admin', '研发部门', '/statistics/withdrawal/add', '118.78.13.146', 'XX XX', '{\n  "amountStr" : [ "20000" ],\n  "password" : [ "admin" ],\n  "payeeType" : [ "bank" ],\n  "remark" : [ "建设银行" ],\n  "payee" : [ "0K9FpDRK" ],\n  "payeeNo" : [ "111" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-19 11:21:23'),
(28, '申请提现', 1, 'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()', 'POST', 1, 'admin', '研发部门', '/statistics/withdrawal/add', '118.78.13.146', 'XX XX', '{\n  "amountStr" : [ "100000" ],\n  "password" : [ "admin" ],\n  "payeeType" : [ "bank" ],\n  "remark" : [ "建设银行" ],\n  "payee" : [ "0K9FpDRK" ],\n  "payeeNo" : [ "111" ]\n}', '{\n  "msg" : "提现单笔最高金额不能超过20000元",\n  "code" : 500\n}', 0, NULL, '2020-07-19 11:21:44'),
(29, '申请提现', 1, 'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()', 'POST', 1, 'admin', '研发部门', '/statistics/withdrawal/add', '118.78.13.146', 'XX XX', '{\n  "amountStr" : [ "80000" ],\n  "password" : [ "admin" ],\n  "payeeType" : [ "bank" ],\n  "remark" : [ "建设银行" ],\n  "payee" : [ "0K9FpDRK" ],\n  "payeeNo" : [ "111" ]\n}', '{\n  "msg" : "提现单笔最高金额不能超过20000元",\n  "code" : 500\n}', 0, NULL, '2020-07-19 11:21:52'),
(30, '申请提现', 1, 'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()', 'POST', 1, 'admin', '研发部门', '/statistics/withdrawal/add', '118.78.13.146', 'XX XX', '{\n  "amountStr" : [ "20000" ],\n  "password" : [ "admin" ],\n  "payeeType" : [ "bank" ],\n  "remark" : [ "建设银行" ],\n  "payee" : [ "0K9FpDRK" ],\n  "payeeNo" : [ "111" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-19 11:22:00'),
(31, '申请提现', 1, 'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()', 'POST', 1, 'admin', '研发部门', '/statistics/withdrawal/add', '118.78.13.146', 'XX XX', '{\n  "amountStr" : [ "20000" ],\n  "password" : [ "admin" ],\n  "payeeType" : [ "bank" ],\n  "remark" : [ "admi" ],\n  "payee" : [ "11" ],\n  "payeeNo" : [ "1" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-19 11:22:23'),
(32, '交易管理', 2, 'com.ruoyi.reward.controller.TradeController.changeState()', 'POST', 1, 'admin', '研发部门', '/system/trade/changeState', '118.78.13.146', 'XX XX', '{\n  "tradeNo" : [ "553733472108154880" ],\n  "state" : [ "1" ]\n}', '{\n  "msg" : "操作成功",\n  "code" : 0\n}', 0, NULL, '2020-07-19 11:23:25');

-- --------------------------------------------------------

--
-- 表的结构 `sys_order`
--

CREATE TABLE IF NOT EXISTS `sys_order` (
  `id` int(11) unsigned NOT NULL,
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
  `user_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户id'
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='订单';

--
-- 转存表中的数据 `sys_order`
--

INSERT INTO `sys_order` (`id`, `order_id`, `money`, `price`, `type`, `pay_no`, `param`, `pay_time`, `pay_tag`, `status`, `create_time`, `update_time`, `goods_id`, `goods_snapshot`, `open_id`, `extension_user_id`, `user_id`) VALUES
(235, '551189515981557760', 100, 100, 3, '4200000596202007124785680603', NULL, '2020-07-12 10:53:54', '1.00', 1, '2020-07-12 10:53:37', '2020-07-12 10:53:55', 124, '{"categoryId":227,"click":4,"createTime":1592672002000,"duration":"670","id":124,"isAllow":true,"isLei":true,"isPreview":false,"logo":"/profile/upload/2020/07/08/ab8023f18cfa35608ecb822a022803fd.jpg","money":"2-5","name":"admin","shortUrl":"","url":"http://admin.grkfcs.cn/profile/upload/2020/07/08/ab8023f18cfa35608ecb822a022803fd.jpg","userId":"admin","videoUrl":"http://admin.grkfcs.cn/profile/upload/2020/07/08/c859ec01a29bb086aba8fac3c2574668.mp4"}', 'o9Umds47M8WyyJw8jz3NX7yoJyMg', 'admin', '551189300302057472'),
(245, '551233546623127552', 100, 100, 3, '4200000593202007121586172419', NULL, '2020-07-12 13:48:42', '1.00', 1, '2020-07-12 13:48:35', '2020-07-12 13:48:43', 130, '{"categoryId":227,"click":4,"createTime":1592672002000,"duration":"122","id":130,"isAllow":true,"isLei":true,"isPreview":false,"logo":"/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg","money":"2-5","name":"admin","shortUrl":"","url":"http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg","userId":"admin","videoUrl":"http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4"}', 'o9Umds7BgMc_-AIMowrmabOADars', 'admin', '551233490620780544'),
(247, '551234145007702016', 100, 100, 3, '4200000582202007123829696560', NULL, '2020-07-12 13:51:04', '1.00', 1, '2020-07-12 13:50:58', '2020-07-12 13:51:05', 138, '{"categoryId":227,"click":4,"createTime":1592672002000,"duration":"752","id":138,"isAllow":true,"isLei":true,"isPreview":false,"logo":"/profile/upload/2020/07/08/62202901204bce116a7860abc7fb1db3.jpg","money":"2-5","name":"admin","shortUrl":"","url":"http://admin.grkfcs.cn/profile/upload/2020/07/08/62202901204bce116a7860abc7fb1db3.jpg","userId":"admin","videoUrl":"http://admin.grkfcs.cn/profile/upload/2020/07/08/a416b4988e21600e4d6a60f09c4cfd9d.mp4"}', 'o9Umds7BgMc_-AIMowrmabOADars', 'admin', '551233490620780544'),
(290, '552428275725504512', 100, 100, 3, '4200000588202007156167968564', NULL, '2020-07-15 20:56:07', '1.00', 1, '2020-07-15 20:56:01', '2020-07-15 20:56:08', 513, '{"categoryId":272,"click":0,"createTime":1594816192000,"cs":"37278","id":513,"isAllow":true,"isLei":true,"isPreview":false,"logo":"https://tp.jializyw.com/lunlipic/20200413-KR/Dd59oUU6.jpg","money":"2-5","name":"岳母与我的秘事","shortUrl":"","url":"https://tp.jializyw.com/lunlipic/20200413-KR/Dd59oUU6.jpg","userId":"admin","videoUrl":"https://vd6.zhiyuanhongda.com/20200413/Dd59oUU6/index.m3u8"}', 'o9Umds47M8WyyJw8jz3NX7yoJyMg', 'admin', '551189300302057472'),
(304, '552826790192615424', 480, 480, 3, '4200000591202007164060237147', NULL, '2020-07-16 23:19:45', '4.80', 1, '2020-07-16 23:19:34', '2020-07-16 23:19:46', 555, '{"categoryId":273,"click":0,"createTime":1594888957000,"cs":"37500","duration":"752","id":555,"isAllow":true,"isLei":true,"isPreview":false,"logo":"https://tp.jializyw.com/upload/vod/20200709-1/914879a868e5157f6d9dd026a98eadaa.jpg","money":"2-5","name":"高颜值女主播_身材很好_插着自慰棒_随音乐摇摆身姿_十分诱惑","shortUrl":"","url":"https://tp.jializyw.com/upload/vod/20200709-1/914879a868e5157f6d9dd026a98eadaa.jpg","userId":"admin","videoUrl":"https://video.jializyw.com:8800/20200708/udYJdIbO/index.m3u8"}', 'o9UmdszhICB5tS1i5z9CDq9YFuZs', 'admin', '552826451968135168'),
(305, '552827977168064512', 480, 480, 3, '4200000582202007160513394761', NULL, '2020-07-16 23:24:31', '4.80', 1, '2020-07-16 23:24:17', '2020-07-16 23:24:32', 541, '{"categoryId":229,"click":0,"createTime":1594821166000,"duration":"67","id":541,"isAllow":true,"isLei":true,"isPreview":false,"logo":"/profile/upload/2020/07/15/6d091e7c96479d65fb881411fb524c46.png","money":"2-5","name":"约的妹子直接内射","shortUrl":"","url":"http://admin.grkfcs.cn/profile/upload/2020/07/15/6d091e7c96479d65fb881411fb524c46.png","userId":"admin","videoUrl":"http://admin.grkfcs.cn/profile/upload/2020/07/15/4cb875e83825da2c21abbf7b72b961f9.mp4"}', 'o9UmdszhICB5tS1i5z9CDq9YFuZs', 'admin', '552826451968135168'),
(320, '553030521995661312', 480, 480, 3, '4200000597202007174028318688', NULL, '2020-07-17 12:49:16', '4.80', 1, '2020-07-17 12:49:07', '2020-07-17 12:49:16', 572, '{"categoryId":202,"click":0,"createTime":1594913807000,"duration":"188","id":572,"isAllow":true,"isLei":true,"isPreview":false,"logo":"/profile/upload/2020/07/16/89d6920cb9405754c8f800c640ef6970.png","money":"2-5","name":"老外激情做爱","shortUrl":"","url":"http://admin.niz47.top/profile/upload/2020/07/16/89d6920cb9405754c8f800c640ef6970.png","userId":"admin","videoUrl":"http://admin.niz47.top/profile/upload/2020/07/16/34343b3fc76741d1d5d6a9296ebc4055.mp4"}', 'o9Umds7BgMc_-AIMowrmabOADars', 'admin', '551233490620780544'),
(334, '553154635917955072', 480, 480, 3, '4200000581202007170516795834', NULL, '2020-07-17 21:02:29', '4.80', 1, '2020-07-17 21:02:18', '2020-07-17 21:03:06', 542, '{"categoryId":230,"click":0,"createTime":1594821253000,"duration":"140","id":542,"isAllow":true,"isLei":true,"isPreview":false,"logo":"/profile/upload/2020/07/15/ca92ad90a79cd8dcf54af3275b18d622.png","money":"2-5","name":"深情的吃着大屌","shortUrl":"","status":"0","url":"http://admin.grkfcs.cn/profile/upload/2020/07/15/ca92ad90a79cd8dcf54af3275b18d622.png","userId":"admin","videoUrl":"http://admin.grkfcs.cn/profile/upload/2020/07/15/4b539a9f5c0b75892268dbefb3f6d8ad.mp4"}', 'o9Umds7BgMc_-AIMowrmabOADars', 'admin', '551233490620780544'),
(337, '553403679147823104', 480, 480, 3, 'wx1813320041360961d82892d91792757400', NULL, NULL, '4.80', 2, '2020-07-18 13:31:55', '2020-07-18 13:31:57', 571, '{"categoryId":218,"click":0,"createTime":1594913704000,"duration":"175","id":571,"isAllow":true,"isLei":true,"isPreview":false,"logo":"/profile/upload/2020/07/16/639a959e997fadcbf4061511281e4875.png","money":"2-5","name":"手指张开小穴","shortUrl":"","status":"0","url":"http://admin.niz47.top/profile/upload/2020/07/16/639a959e997fadcbf4061511281e4875.png","userId":"admin","videoUrl":"http://admin.niz47.top/profile/upload/2020/07/16/e47f9ee573fd067af3cf462b73961ee9.mp4"}', 'o9Umds5SA-CPfUZj94McFxFv486g', 'admin', '551190022972248064'),
(338, '553557946185814016', 480, 480, 1, NULL, NULL, NULL, '4.80', 0, '2020-07-18 23:44:55', '2020-07-18 23:44:55', 572, '{"categoryId":202,"click":0,"createTime":1594913807000,"duration":"188","id":572,"isAllow":true,"isLei":true,"isPreview":false,"logo":"/profile/upload/2020/07/16/89d6920cb9405754c8f800c640ef6970.png","money":"2-5","name":"老外激情做爱","shortUrl":"","status":"0","url":"http://admin.niz47.top/profile/upload/2020/07/16/89d6920cb9405754c8f800c640ef6970.png","userId":"admin","videoUrl":"http://admin.niz47.top/profile/upload/2020/07/16/34343b3fc76741d1d5d6a9296ebc4055.mp4"}', 'o9Umds47M8WyyJw8jz3NX7yoJyMg', 'admin', '551189300302057472');

-- --------------------------------------------------------

--
-- 表的结构 `sys_post`
--

CREATE TABLE IF NOT EXISTS `sys_post` (
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';

--
-- 转存表中的数据 `sys_post`
--

INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 'ceo', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
(4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_role`
--

CREATE TABLE IF NOT EXISTS `sys_role` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
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
  `remark` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='角色信息表';

--
-- 转存表中的数据 `sys_role`
--

INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员'),
(2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-06-20 22:16:47', '普通角色');

-- --------------------------------------------------------

--
-- 表的结构 `sys_role_dept`
--

CREATE TABLE IF NOT EXISTS `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='角色和部门关联表';

--
-- 转存表中的数据 `sys_role_dept`
--

INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES
(2, 100),
(2, 101),
(2, 105);

-- --------------------------------------------------------

--
-- 表的结构 `sys_role_menu`
--

CREATE TABLE IF NOT EXISTS `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';

--
-- 转存表中的数据 `sys_role_menu`
--

INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES
(2, 2007),
(2, 2008),
(2, 2009),
(2, 2010),
(2, 2011),
(2, 2090),
(2, 2091),
(2, 2093),
(2, 2100),
(2, 2101),
(2, 2102);

-- --------------------------------------------------------

--
-- 表的结构 `sys_short`
--

CREATE TABLE IF NOT EXISTS `sys_short` (
  `id` int(11) NOT NULL COMMENT '主键',
  `short_key` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '链接key',
  `short_url` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '链接地址',
  `long_url` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '长链接地址',
  `short_status` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `sys_short`
--

INSERT INTO `sys_short` (`id`, `short_key`, `short_url`, `long_url`, `short_status`, `create_time`, `update_time`) VALUES
(16, 'admin', 'https://sourl.cn/sPXtaj', 'http://yuluncc.top/?userId=admin', '0', '2020-07-07 11:49:15', '2020-07-17 16:19:53'),
(17, 'LEd2A7Es', 'https://sourl.cn/sVVNdj', 'http://yuluncc.top/?userId=LEd2A7Es', '0', '2020-07-17 17:04:44', NULL),
(18, 'xiaocai', 'https://sourl.cn/wdKP5i', 'http://yuluncc.top/?userId=xiaocai', '0', '2020-07-17 21:05:04', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sys_user`
--

CREATE TABLE IF NOT EXISTS `sys_user` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
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
  `payee_account` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收款账号'
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户信息表';

--
-- 转存表中的数据 `sys_user`
--

INSERT INTO `sys_user` (`user_id`, `dept_id`, `login_name`, `user_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `payee`, `payee_account`) VALUES
(1, 103, 'admin', 'admin', '00', 'ry@163.com', '15888888888', '0', '/profile/avatar/2020/06/20/2bc7e27b3b43142fed9918e9dbcdc563.png', '9a963c252b25845b35188a14d10ce514', 'ae238c', '0', '0', '60.222.195.194', '2020-07-19 14:08:15', 'admin', '2018-03-16 11:33:00', 'ry', '2020-07-19 14:08:15', '管理员', NULL, NULL),
(2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员', NULL, NULL),
(100, 105, '1111', '的订单', '00', 'syst1em@163.com', '13902000000', '1', '', '79f944a0ae0dad2cced8e81fe47aeee1', '5aa645', '0', '2', '', NULL, 'admin', '2020-03-17 23:19:11', 'admin', '2020-03-17 23:35:32', '', NULL, NULL),
(101, 105, '11111', '11111', '00', 'syst2em@163.com', '13900000000', '1', '', '634df297ad5ee27f8ca538b76ee8b901', '9ca760', '0', '2', '127.0.0.1', '2020-03-17 23:36:10', 'admin', '2020-03-17 23:26:15', '', '2020-03-17 23:36:10', '代理用户', NULL, NULL),
(102, 105, '111111', '的订单', '00', 'system@163.com', '13152602082', '1', '', 'ad7ffc392edb700c6fe97c3065238de0', '139c73', '0', '2', '', NULL, 'admin', '2020-03-18 09:39:33', 'admin', '2020-03-18 09:44:08', '代理用户', NULL, NULL),
(103, 105, 'p', '4S1CowT0', '00', 'system@163.com', '18257824232', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '2', '', NULL, 'admin', '2020-03-18 09:45:03', '', NULL, '代理用户', NULL, NULL),
(104, 105, 'lizhi', 'lizhi', '00', 'system@163.com', '18069267499', '1', '', '8b8d063ca5746c8d1f25c1a6e32571b3', '65e222', '0', '2', '127.0.0.1', '2020-03-18 09:48:11', 'admin', '2020-03-18 09:48:01', '', '2020-03-18 09:48:11', '代理用户', NULL, NULL),
(105, 105, 'eFHfoWRK', '的订单', '00', 'system@163.com', '15186479998', '1', '', 'b9048ae7028838669fa29b64c5c2c396', '0d3c17', '0', '2', '127.0.0.1', '2020-03-22 22:51:35', 'admin', '2020-03-22 22:34:24', '', '2020-03-22 22:51:35', '代理用户', NULL, NULL),
(106, 105, 'lijiao', 'lijiao', '00', 'lijiao@163.com', '13999999999', '0', '', '540b139b585a861c68b25917c4d23d45', '54665a', '0', '2', '127.0.0.1', '2020-03-22 22:53:19', 'admin', '2020-03-22 22:52:58', '', '2020-03-22 22:53:19', NULL, NULL, NULL),
(107, 105, '13900000001', '11111', '00', '13900000001@163.com', '13900000001', '0', '', '21c77ae0f549232c4db199c579e3258f', '7215f5', '0', '2', '', NULL, 'admin', '2020-03-22 22:58:53', '', NULL, '1', NULL, NULL),
(108, 105, 'pMBzr6PX', 'pMBzr6PX', '00', 'system@163.com', '13021455977', '1', '/profile/avatar/2020/03/22/e57f73eca09c1a8f583e6e7029f39d4c.png', '46d8fdae95df9c9ef0cb9111c9bfbab7', '34ae05', '0', '2', '127.0.0.1', '2020-03-22 23:44:48', 'admin', '2020-03-22 23:02:52', '', '2020-03-22 23:44:48', '代理用户', NULL, NULL),
(109, 105, 'HvlhdQp4', 'HvlhdQp4', '00', 'system@163.com', '17108940375', '1', '', '3d9986f5e4bb4e50635e7f7f5f920056', 'f37943', '0', '2', '127.0.0.1', '2020-03-23 11:12:15', 'admin', '2020-03-23 11:12:10', '', '2020-03-23 11:12:15', '代理用户', NULL, NULL),
(110, 105, 'PSJGU5OG', 'PSJGU5OG', '00', 'system@163.com', '15046844832', '1', '', '2ba45bed2a36228a546ae6ae0d30fad0', '18e195', '0', '2', '127.0.0.1', '2020-03-23 13:37:06', 'admin', '2020-03-23 13:37:00', '', '2020-03-23 13:37:06', '代理用户', NULL, NULL),
(111, 105, 'gCCs9Lry', 'gCCs9Lry', '00', 'system@163.com', '13686297920', '1', '', 'c2562e327b14270876e0b19050fc7009', '479e79', '0', '2', '', NULL, 'admin', '2020-03-23 13:39:54', '', NULL, '代理用户', NULL, NULL),
(112, 105, '6eaJSulU', '6eaJSulU', '00', 'system@163.com', '17002456229', '1', '', '1ea0ef0f8a9da4239a60008a08c1a48f', 'd812fd', '0', '2', '', NULL, 'admin', '2020-03-23 13:48:19', '', NULL, '代理用户', NULL, NULL),
(113, 105, '0DwXA9Cg', '0DwXA9Cg', '00', 'system@163.com', '18289621212', '1', '', 'fe910c99471f2eab9aa381f42152aef4', '3435a4', '0', '2', '', NULL, 'admin', '2020-03-23 13:51:02', '', NULL, '代理用户', NULL, NULL),
(114, 105, 'n0TaVdrW', 'n0TaVdrW', '00', 'system@163.com', '15288995473', '1', '', 'd02864daaa87e833744534b6804079c5', 'f0ff2a', '0', '2', '', NULL, 'admin', '2020-03-23 13:54:18', '', NULL, '代理用户', NULL, NULL),
(115, 105, 'ZEVcL34H', 'ZEVcL34H', '00', 'system@163.com', '17082524040', '1', '', '155aff1df444d1d51abd71ec0daf85fd', 'f3f882', '0', '2', '', NULL, 'admin', '2020-03-23 13:58:32', '', NULL, '代理用户', NULL, NULL),
(116, 105, 'EGbJ2hg0', 'EGbJ2hg0', '00', 'system@163.com', '17015773313', '1', '', '30492cd20fce3acb454d6ca98c9f8f27', '98fb0b', '0', '2', '', NULL, 'admin', '2020-03-23 14:52:22', '', NULL, '代理用户', NULL, NULL),
(118, 105, 'DwpqVNYS', 'DwpqVNYS', '00', 'system@163.com', '18070683074', '1', '', '668d83745bac4035b5698d5c21e58e37', '19a570', '0', '2', '', NULL, 'admin', '2020-03-23 15:16:16', '', NULL, '代理用户', NULL, NULL),
(119, 105, 'yHUGMiTt', 'yHUGMiTt', '00', 'system@163.com', '17535027943', '1', '', 'deb81e1cab3ed05f817b7272b2d7c432', '8fb8fb', '0', '2', '127.0.0.1', '2020-03-23 16:55:24', 'admin', '2020-03-23 15:19:19', '', '2020-03-24 12:46:52', '代理用户', NULL, NULL),
(120, 105, '13aA5iX6', '13aA5iX6', '00', 'system@163.com', '14784152565', '1', '', '6633e269189935a051b3296e39f3a024', 'd96f4d', '0', '2', '139.227.72.2', '2020-03-26 18:36:07', 'admin', '2020-03-26 18:36:03', '', '2020-03-26 18:36:07', '代理用户', '13aA5iX6', '13aA5iX6'),
(121, 105, 'mQFJEj71', 'mQFJEj71', '00', 'system@163.com', '13388186271', '1', '', '5cabf52c2142d4edda7d3221a364c9ff', '9905d1', '0', '2', '139.227.72.2', '2020-03-26 18:53:10', 'admin', '2020-03-26 18:53:06', '', '2020-03-26 18:53:10', '代理用户', 'mQFJEj71', 'mQFJEj71'),
(122, 105, 'SfNYWe5c', 'SfNYWe5c', '00', 'system@163.com', '17105303609', '1', '', '127da095e43042ec8049a8d2263736b4', '71a8c5', '0', '2', '223.166.134.39', '2020-04-13 21:30:21', 'admin', '2020-04-09 18:20:21', '', '2020-04-13 21:30:21', '代理用户', 'SfNYWe5c', 'SfNYWe5c'),
(123, 105, '13900000002', '的订单', '00', 'lizhichange@gmail.com', '13900000002', '0', '', '56f4c5ac0707822481612997bebace68', 'e28f25', '0', '2', '', NULL, 'admin', '2020-06-07 11:16:06', '', NULL, 'dd', NULL, NULL),
(124, 105, 'LwrXdgu8', 'LwrXdgu8', '00', 'system@163.com', '13356185603', '1', '', '976a82adbb951756d80616c60b4d80d2', '1548df', '0', '2', '', NULL, 'admin', '2020-06-08 17:43:30', '', NULL, '代理用户', 'LwrXdgu8', 'LwrXdgu8'),
(125, 105, 'e79EH63o', 'e79EH63o', '00', 'system@163.com', '17343151168', '1', '', 'f1628388849283851f01a4832caf36c2', '4f8733', '0', '2', '127.0.0.1', '2020-06-08 17:57:08', 'admin', '2020-06-08 17:56:12', '', '2020-06-08 17:57:08', '代理用户', 'e79EH63o', 'e79EH63o'),
(126, 105, 'F6Si1pHp', 'F6Si1pHp', '00', 'system@163.com', '13689741916', '1', '', '01a48fa9aa052218bc91b19db4f266b9', '83647b', '0', '2', '', NULL, 'admin', '2020-06-08 17:58:17', '', NULL, '代理用户', 'F6Si1pHp', 'F6Si1pHp'),
(127, 105, '6fzuYVKL', '6fzuYVKL', '00', 'system@163.com', '18781805152', '1', '', '7b74874909d8cf6dca16727f7cfda26b', '29618b', '0', '2', '', NULL, 'admin', '2020-06-08 18:28:05', '', NULL, '代理用户', '6fzuYVKL', '6fzuYVKL'),
(128, 105, 'WNz9dKGm', 'WNz9dKGm', '00', 'system@163.com', '18926421343', '1', '', 'c9dbb7c45fa638cbcdc514638ea0cea2', '7d2311', '0', '2', '', NULL, 'admin', '2020-06-08 18:31:02', '', NULL, '代理用户', 'WNz9dKGm', 'WNz9dKGm'),
(129, 105, '0K9FpDRK', '0K9FpDRK', '00', 'system@163.com', '17275191735', '1', '', '55dbc34e101b06f23495178c1eae1f75', 'dcaf9f', '0', '2', '', NULL, 'admin', '2020-06-08 18:36:14', '', NULL, '代理用户', '0K9FpDRK', '0K9FpDRK'),
(130, 105, 'QC6JpwMg', 'QC6JpwMg', '00', 'system@163.com', '18086738884', '1', '', '50524e3f0b19d72540559565e3e6953a', '34ef56', '0', '0', '139.227.73.78, 172.16.0.101', '2020-06-20 22:16:55', 'admin', '2020-06-20 22:16:04', '', '2020-06-20 22:16:54', '代理用户', 'QC6JpwMg', 'QC6JpwMg'),
(131, 105, 'i8NavF5U', 'i8NavF5U', '00', 'system@163.com', '18898667778', '1', '', '3fd3cf6b5c054f7445bdf42ac51f3b7d', 'dd4aec', '0', '0', '139.227.73.78, 172.16.0.101', '2020-06-26 18:36:50', 'admin', '2020-06-26 18:36:46', '', '2020-06-26 18:36:50', '代理用户', 'i8NavF5U', 'i8NavF5U'),
(132, 105, 'R4zrXRJc', 'R4zrXRJc', '00', 'system@163.com', '13016070897', '1', '', '07984b995fa7a8f451aa3c82b4865130', '36dfd2', '0', '0', '139.227.73.78, 172.16.0.101', '2020-06-26 18:41:38', 'admin', '2020-06-26 18:41:31', '', '2020-06-26 18:41:37', '代理用户', 'R4zrXRJc', 'R4zrXRJc'),
(133, 105, 'LEd2A7Es', 'LEd2A7Es', '00', 'system@163.com', '14977930161', '1', '', '44d06bfb7dd8e00abdca1e5027b24720', 'bd5826', '0', '0', '118.78.249.178', '2020-07-17 17:04:38', 'admin', '2020-06-26 18:48:47', '', '2020-07-17 17:04:38', '代理用户', 'LEd2A7Es', 'LEd2A7Es'),
(134, 105, 'xiaocai', 'xiaocai', '00', 'system@163.com', '19915281647', '1', '', '59e0964925d74fc8d6a89603efc6be38', '5f7128', '0', '0', '223.104.47.77', '2020-07-17 21:08:12', 'admin', '2020-07-17 21:05:00', '', '2020-07-17 21:08:11', '代理用户', 'xiaocai', 'xiaocai');

-- --------------------------------------------------------

--
-- 表的结构 `sys_user_online`
--

CREATE TABLE IF NOT EXISTS `sys_user_online` (
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
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='在线用户记录';

--
-- 转存表中的数据 `sys_user_online`
--

INSERT INTO `sys_user_online` (`sessionId`, `login_name`, `dept_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `start_timestamp`, `last_access_time`, `expire_time`) VALUES
('9ec09baa-abd4-4b0d-8847-e7d8fbb652b3', 'admin', '研发部门', '60.222.195.194', 'XX XX', 'Chrome 8', 'Mac OS X', 'on_line', '2020-07-19 14:08:08', '2020-07-19 14:35:55', 1800000);

-- --------------------------------------------------------

--
-- 表的结构 `sys_user_post`
--

CREATE TABLE IF NOT EXISTS `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';

--
-- 转存表中的数据 `sys_user_post`
--

INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES
(1, 1),
(2, 2),
(100, 4),
(101, 4),
(102, 4),
(103, 4),
(104, 4),
(105, 4),
(106, 4),
(107, 4),
(108, 4),
(109, 4),
(110, 4),
(111, 4),
(120, 4),
(121, 4),
(122, 4),
(123, 2),
(124, 4),
(125, 4),
(126, 4),
(127, 4),
(128, 4),
(129, 4),
(130, 4),
(131, 4),
(132, 4),
(133, 4),
(134, 4);

-- --------------------------------------------------------

--
-- 表的结构 `sys_user_role`
--

CREATE TABLE IF NOT EXISTS `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';

--
-- 转存表中的数据 `sys_user_role`
--

INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(100, 2),
(101, 2),
(102, 2),
(105, 2),
(106, 2),
(107, 2),
(108, 2),
(109, 2),
(110, 2),
(111, 2),
(120, 2),
(121, 2),
(122, 2),
(123, 2),
(124, 2),
(125, 2),
(126, 2),
(127, 2),
(128, 2),
(129, 2),
(130, 2),
(131, 2),
(132, 2),
(133, 2),
(134, 2);

-- --------------------------------------------------------

--
-- 表的结构 `sys_web_main`
--

CREATE TABLE IF NOT EXISTS `sys_web_main` (
  `id` int(11) NOT NULL COMMENT '主键',
  `main_url` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '链接地址',
  `main_status` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `short_url` varchar(222) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `sys_web_main`
--

INSERT INTO `sys_web_main` (`id`, `main_url`, `main_status`, `create_time`, `update_time`, `short_url`) VALUES
(7, 'http://video.jianbinggouzi.club', '0', '2020-04-08 22:04:04', '2020-07-16 22:23:59', '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_wechat_config`
--

CREATE TABLE IF NOT EXISTS `sys_wechat_config` (
  `id` int(11) NOT NULL COMMENT '主键',
  `config_code` varchar(32) DEFAULT NULL COMMENT '微信配置标识',
  `env_type` varchar(16) DEFAULT NULL COMMENT '环境类型',
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
  `state` varchar(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `sys_wechat_config`
--

INSERT INTO `sys_wechat_config` (`id`, `config_code`, `env_type`, `app_id`, `appsecret`, `mch_id`, `sign_key`, `cert_file`, `token`, `encoding_aes_key`, `gmt_create`, `gmt_modified`, `create_time`, `update_time`, `state`) VALUES
(10, 'WY_FULI', 'dev', 'wx590af156c3a3eae9', '8af481db51cd509f26c857a75712c9ce', '1600946459', '22f5c38598681b0d5179d84fc3bc576a', NULL, NULL, NULL, '2016-12-12 16:00:00', '2020-07-18 02:39:10', NULL, '2020-07-15 21:03:17', '0'),
(11, 'WY_FULI', 'druid', 'wx590af156c3a3eae9', '8af481db51cd509f26c857a75712c9ce', '1600946459', '22f5c38598681b0d5179d84fc3bc576a', NULL, NULL, NULL, '2020-03-31 16:00:00', '2020-07-18 02:39:13', NULL, '2020-07-12 10:43:19', '0'),
(12, 'FULIHUI_YOUFULI', 'dev', 'wx851c20b0d27a586b', '666155ee0ef3dbd6224447d000483298', '1487632962', '22f5c38598681b0d5179d84fc3bc576a', '/home/fulihui/secure/youfuli_apiclient_cert.p12', 'EvIYhBs2ZuM0EvjScv2J9Ad2dbIlaZSU', 'lxOjHNlrewtzPEHCBh7boSmq9jlAe7JF5CINVf2a8IZ', '2017-11-24 09:24:50', '2020-07-18 02:39:15', NULL, NULL, '0'),
(13, 'FULIHUI_YOUFULI', 'druid', 'wx851c20b0d27a586b', '666155ee0ef3dbd6224447d000483298', '1487632962', '22f5c38598681b0d5179d84fc3bc576a', '/home/fulihui/secure/youfuli_apiclient_cert.p12', 'EvIYhBs2ZuM0EvjScv2J9Ad2dbIlaZSU', 'lxOjHNlrewtzPEHCBh7boSmq9jlAe7JF5CINVf2a8IZ', '2017-11-24 09:24:50', '2020-07-18 02:39:17', NULL, NULL, '0'),
(14, 'WY_FULI', 'druid', 'wx590af156c3a3eae9', '8af481db51cd509f26c857a75712c9ce', '1600946459', '22f5c38598681b0d5179d84fc3bc576a', NULL, NULL, NULL, '2020-03-31 16:00:00', '2020-03-31 16:00:00', '2020-07-18 11:55:44', '2020-07-18 12:18:19', '0');

-- --------------------------------------------------------

--
-- 表的结构 `sys_wechat_token`
--

CREATE TABLE IF NOT EXISTS `sys_wechat_token` (
  `id` int(11) NOT NULL COMMENT '主键',
  `appid` varchar(64) NOT NULL COMMENT '微信公众号标识',
  `secret` varchar(128) DEFAULT NULL,
  `token` varchar(512) NOT NULL COMMENT '凭证',
  `token_type` varchar(32) NOT NULL COMMENT '凭证类型',
  `expires_in` int(11) NOT NULL COMMENT '凭证有效时间，单位：秒',
  `gmt_create` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间'
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `trade`
--

CREATE TABLE IF NOT EXISTS `trade` (
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
  `payee_no` varchar(100) DEFAULT NULL COMMENT '收款账号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `trade`
--

INSERT INTO `trade` (`trade_no`, `payer_type`, `payer`, `payee_type`, `payee`, `amount`, `state`, `category`, `pay_type`, `third_trade_no`, `description`, `remark`, `gmt_create`, `create_by`, `gmt_modified`, `modified_by`, `create_time`, `payee_no`) VALUES
('553702412989239296', 'system', 'system', 'bank', '0K9FpDRK', 50100, '0', NULL, 'system', NULL, NULL, '建设银行', '2020-07-19 09:18:59', 'admin', '2020-07-19 09:18:59', NULL, '2020-07-19 09:18:59', '111'),
('553733221209083904', 'system', 'system', 'bank', '0K9FpDRK', 2000000, '0', NULL, 'system', NULL, NULL, '建设银行', '2020-07-19 11:21:24', 'admin', '2020-07-19 11:21:24', NULL, '2020-07-19 11:21:24', '111'),
('553733373009334272', 'system', 'system', 'bank', '0K9FpDRK', 2000000, '0', NULL, 'system', NULL, NULL, '建设银行', '2020-07-19 11:22:00', 'admin', '2020-07-19 11:22:00', NULL, '2020-07-19 11:22:00', '111'),
('553733472108154880', 'system', 'system', 'bank', '11', 2000000, '1', NULL, 'system', NULL, NULL, 'admi', '2020-07-19 11:22:24', 'admin', '2020-07-19 11:23:25', NULL, '2020-07-19 11:22:24', '1');

-- --------------------------------------------------------

--
-- 表的结构 `ts`
--

CREATE TABLE IF NOT EXISTS `ts` (
  `id` int(11) NOT NULL COMMENT '主键',
  `ip` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ip地址',
  `status` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
  `content` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '内容',
  `duration` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '时间',
  `typeto` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `sid` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_id` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `open_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ts`
--

INSERT INTO `ts` (`id`, `ip`, `status`, `content`, `duration`, `typeto`, `sid`, `user_id`, `create_time`, `update_time`, `open_id`) VALUES
(1, '118.78.249.178', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, NULL),
(2, '118.78.249.178', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `t_user_detail`
--

CREATE TABLE IF NOT EXISTS `t_user_detail` (
  `id` int(11) NOT NULL,
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
  `user_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=319882 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

--
-- 转存表中的数据 `t_user_detail`
--

INSERT INTO `t_user_detail` (`id`, `user_id`, `nickname`, `name`, `gender`, `id_card`, `mobile_no`, `birthday`, `gmt_create`, `create_by`, `gmt_modified`, `modified_by`, `user_source`, `user_referee`, `user_referee_ids`, `marker`, `reg_date`, `level`, `avatar_url`, `reg_url`, `password`, `user_name`) VALUES
(319865, '551185112876716032', '6ZSZ5Yir5a2X44CC', NULL, '男', NULL, NULL, NULL, '2020-07-12 10:36:08', NULL, '2020-07-12 10:36:08', NULL, NULL, NULL, '', NULL, NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/6sc2eGibKjFpmib7vRlr7kyMGuTvtLoiaiaGguPK0jyRFLJsrj4l6TCLYdEB9hsGeCh40tghOiapWNW1GYHBeCNb2Iw/132', NULL, NULL, NULL),
(319866, '551189300302057472', '5Lmx5LqG5oCd57uq8J+MtPCfjLQ=', NULL, '男', NULL, NULL, NULL, '2020-07-12 10:52:46', NULL, '2020-07-12 10:52:46', NULL, NULL, NULL, '', NULL, NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/mDpM0MCHSKOOfyXNTGqN7Jl4pdgJdCXQ3WbDDsibMs6iaIwCOpwH78J7JgOExnTccNW3CBqmesvNibRRqvB1Adqbw/132', NULL, NULL, NULL),
(319867, '551190022972248064', '5rip5rC054Wu6Z2S6JuZ8J+QuA==', NULL, '男', NULL, NULL, NULL, '2020-07-12 10:55:38', NULL, '2020-07-12 10:55:38', NULL, NULL, NULL, '', NULL, NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DS6LibqUcgROqe4cA9xs3Ve5IwNd4VWBJfLbPSOQg5dEibBtk4LHgdEaonThvF1rjGyo397yQmxLlLibSLsxhkRCQ/132', NULL, NULL, NULL),
(319868, '551225663453925376', '5a+w', NULL, '男', NULL, NULL, NULL, '2020-07-12 13:17:16', NULL, '2020-07-12 13:17:16', NULL, NULL, NULL, '', NULL, NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/NYfjRelia7DPC4NOkCS5pkSC6BhYvu1Tiaiaicv94cBPXmvfZstokW6AMtQ4yViaNicMecNHJ8D81V9Mc2FMmGES9yOA/132', NULL, NULL, NULL),
(319869, '551233490620780544', '5oub6LSi54yr', NULL, '男', NULL, NULL, NULL, '2020-07-12 13:48:22', NULL, '2020-07-12 13:48:22', NULL, NULL, NULL, '', NULL, NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/0TenicClhple4RW88GicFMHveUMiaRSVv1DRqicLqXmbiakXmx7hZec5vEdibrFiaTyVXEhEnME3xDXZ97tXnd6nJhZicQ/132', NULL, NULL, NULL),
(319870, '551306489516527616', '6Z2S6JuZ', NULL, '男', NULL, NULL, NULL, '2020-07-12 18:38:26', NULL, '2020-07-12 18:38:26', NULL, NULL, NULL, '', NULL, NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/PB2a87kgfSgFqTAXqXAnQFPgqkxQ8W9AQ2GgI7amwTKIyqA5x83UoX5icRez6tibRSHgkaSmsxUQdicE197ia7FxwQ/132', NULL, NULL, NULL),
(319871, '551330228526387200', '8J+OqQ==', NULL, '男', NULL, NULL, NULL, '2020-07-12 20:12:46', NULL, '2020-07-12 20:12:46', NULL, NULL, NULL, '', NULL, NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLnVds6ibZicIYXh2JibAI665aexKwDZyZKHkB4g3dWHxrsaN1ibZp3wz2oeS8ZuU2JmG5YVuLoXBkKvQ/132', NULL, NULL, NULL),
(319872, '551378395959660544', '6auY5Ya355qE5bCP5aeQ5aeQ', NULL, '女', NULL, NULL, NULL, '2020-07-12 23:24:10', NULL, '2020-07-12 23:24:10', NULL, NULL, NULL, '', NULL, NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/8gCZia6ZyNbJee35BuKTDzpK7tnt8gCy9vF2icf9XpbtdW5dM018mN6rQ3ICFRibnVUZVTSFkqibJGm8iaEtXlCMHsQ/132', NULL, NULL, NULL),
(319873, '551378655050207232', '5bGx6bih5ZOlIPCfpoVRUfCfpoUxNzk0NzE5NzQ5', NULL, '男', NULL, NULL, NULL, '2020-07-12 23:25:12', NULL, '2020-07-12 23:25:12', NULL, NULL, NULL, '', NULL, NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKrvoHticYQpagMO4teU5TZoqNSF2IJO6mcg7OwaKskbprashMkEmVDqEiceRtYSx5mcSWHpmQkbia2w/132', NULL, NULL, NULL),
(319874, '551909435954434048', '8J+HqPCfh7MgIOm6puWFnOWFnC7pqbHliqgu6L2v54Gv5bimLg==', NULL, '女', NULL, NULL, NULL, '2020-07-14 10:34:20', NULL, '2020-07-14 10:34:20', NULL, NULL, NULL, '', NULL, NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJMByJvGle7HtsiapEwXiaUCqTGUFmEgMqQLpWrZmH0t5CSDWW1Jb3rkfe0hq5UzpChYUJPJAlXOJpg/132', NULL, NULL, NULL),
(319875, '552024694258143232', '6b6Z6KGM5aSp5LiL', NULL, '男', NULL, NULL, NULL, '2020-07-14 18:12:19', NULL, '2020-07-14 18:12:19', NULL, NULL, NULL, '', NULL, NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/mI1DDvbm2VbVl4PbLRWw3QeMibq0hVrr11Frb0VfgibIYnQeWbQX5R1LDVhIasZnmv1KuzyvWkRVaRbicJaozA2oA/132', NULL, NULL, NULL),
(319876, '552422122555707392', '5pyV5ZKM5aiY5aiY5riF55m955qE44CC', NULL, '男', NULL, NULL, NULL, '2020-07-15 20:31:34', NULL, '2020-07-15 20:31:34', NULL, NULL, NULL, '', NULL, NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqJTL87sQqYcBU1kgurc9H54qqZB4anE4RPFhjYlicLyCriaTFTiagy7IhvVk7sfFrTyzO3icn7ZPy32Q/132', NULL, NULL, NULL),
(319877, '552448858311888896', '5rW35a+S', NULL, '男', NULL, NULL, NULL, '2020-07-15 22:17:48', NULL, '2020-07-15 22:17:48', NULL, NULL, NULL, '', NULL, NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83epRK5v3IkvSft2VbGEAuEwo662Xo2J8uJDlic9Ej7GniaLj8k6oR41wTKibRNsTysoqsUQUlKxHb8icEg/132', NULL, NULL, NULL),
(319878, '552520928622284800', '6Zi/LuaIkeaYr+W8oOWwj+i0sfCfpbQu5oiR5bCx5ZKb5LmI6LSx8J+kow==', NULL, '女', NULL, NULL, NULL, '2020-07-16 03:04:11', NULL, '2020-07-16 03:04:11', NULL, NULL, NULL, '', NULL, NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/KaxJnOA414rtm0A4vbcgzxYqJ0w78Z6ibibgcDYZsib95NibVGm59mbQLMWBBENkicugBCAX8zLIUIz8sgLQH3AzFlA/132', NULL, NULL, NULL),
(319879, '552826451968135168', 'WeOAgiAgICAgICAgICAgICAgICAgICAgICAgICAgIOC8vQ==', NULL, '男', NULL, NULL, NULL, '2020-07-16 23:18:13', NULL, '2020-07-16 23:18:13', NULL, NULL, NULL, '', NULL, NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/OplNxUzLHKhkMSPx6zibd8c3laRZdxkxPVnib2qZHUJCKFoaECfciaRRRVGAZibrs9hFy9eHhbl2zWM55jQ16l8D6w/132', NULL, NULL, NULL),
(319880, '552835686688886784', '44CC', NULL, '男', NULL, NULL, NULL, '2020-07-16 23:54:55', NULL, '2020-07-16 23:54:55', NULL, NULL, NULL, '', NULL, NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/1mOvT5fApeicXppMP3zADGiboRlw3CzibPvdgyZhQKAibNtlgZFR0UgYyZhVibmoKicMYATuwibRiaB7wRKb8yaqfeZI6g/132', NULL, NULL, NULL),
(319881, '552938168094035968', '5byg5bOw', NULL, '男', NULL, NULL, NULL, '2020-07-17 06:42:08', NULL, '2020-07-17 06:42:08', NULL, NULL, NULL, '', NULL, NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKJ3JYpBekSnRQTGicTWdHKzDMR4RTlZYqqaSuuQu7ezASeBZdOmicpia7I4KDJGqicNgiaEiaXiaC5wj2Qg/132', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `t_wechat_auth`
--

CREATE TABLE IF NOT EXISTS `t_wechat_auth` (
  `id` int(11) NOT NULL COMMENT '主键',
  `open_id` varchar(64) NOT NULL COMMENT 'open_id',
  `user_id` varchar(64) NOT NULL COMMENT '主体唯一标识',
  `user_type` varchar(32) NOT NULL COMMENT '主体类型',
  `appid` varchar(32) NOT NULL COMMENT 'appid',
  `unionid` varchar(64) DEFAULT NULL COMMENT 'unionid',
  `subscribe` varchar(32) DEFAULT '\\0' COMMENT '是否关注',
  `gmt_create` datetime NOT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `modified_by` varchar(32) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=319104 DEFAULT CHARSET=utf8 COMMENT='小程序授权信息表\r\n';

--
-- 转存表中的数据 `t_wechat_auth`
--

INSERT INTO `t_wechat_auth` (`id`, `open_id`, `user_id`, `user_type`, `appid`, `unionid`, `subscribe`, `gmt_create`, `create_by`, `gmt_modified`, `modified_by`) VALUES
(319087, 'o9Umds_VOxYfdxvq2sjpZlp2Cou8', '551185112876716032', '1', 'wx590af156c3a3eae9', NULL, '\\0', '2020-07-12 10:36:08', NULL, '2020-07-12 10:36:08', NULL),
(319088, 'o9Umds47M8WyyJw8jz3NX7yoJyMg', '551189300302057472', '1', 'wx590af156c3a3eae9', NULL, '\\0', '2020-07-12 10:52:46', NULL, '2020-07-12 10:52:46', NULL),
(319089, 'o9Umds5SA-CPfUZj94McFxFv486g', '551190022972248064', '1', 'wx590af156c3a3eae9', NULL, '\\0', '2020-07-12 10:55:38', NULL, '2020-07-12 10:55:38', NULL),
(319090, 'o9Umds5yWXdZfmR_oTAwpShoq9MY', '551225663453925376', '1', 'wx590af156c3a3eae9', NULL, '\\0', '2020-07-12 13:17:16', NULL, '2020-07-12 13:17:16', NULL),
(319091, 'o9Umds7BgMc_-AIMowrmabOADars', '551233490620780544', '1', 'wx590af156c3a3eae9', NULL, '\\0', '2020-07-12 13:48:22', NULL, '2020-07-12 13:48:22', NULL),
(319092, 'o9UmdsyHzcrHqwf_YJD6PgAvweAg', '551306489516527616', '1', 'wx590af156c3a3eae9', NULL, '\\0', '2020-07-12 18:38:26', NULL, '2020-07-12 18:38:26', NULL),
(319093, 'o9UmdsxKZdsDH0078ZjgoximXC1U', '551330228526387200', '1', 'wx590af156c3a3eae9', NULL, '\\0', '2020-07-12 20:12:46', NULL, '2020-07-12 20:12:46', NULL),
(319094, 'o9Umds3cEzEjXWVxSmFcmAkcRA-s', '551378395959660544', '1', 'wx590af156c3a3eae9', NULL, '\\0', '2020-07-12 23:24:10', NULL, '2020-07-12 23:24:10', NULL),
(319095, 'o9UmdsyUB_RJEip7Yyp3YQLDjo58', '551378655050207232', '1', 'wx590af156c3a3eae9', NULL, '\\0', '2020-07-12 23:25:12', NULL, '2020-07-12 23:25:12', NULL),
(319096, 'o9UmdswN7syW2u5LlvLww-4P5FQc', '551909435954434048', '1', 'wx590af156c3a3eae9', NULL, '\\0', '2020-07-14 10:34:20', NULL, '2020-07-14 10:34:20', NULL),
(319097, 'o9Umds5EaybLuEXX_X_vlKISKw1c', '552024694258143232', '1', 'wx590af156c3a3eae9', NULL, '\\0', '2020-07-14 18:12:19', NULL, '2020-07-14 18:12:19', NULL),
(319098, 'o9Umds5eW9V_frIrZ5w0k6ajDKlI', '552422122555707392', '1', 'wx590af156c3a3eae9', NULL, '\\0', '2020-07-15 20:31:34', NULL, '2020-07-15 20:31:34', NULL),
(319099, 'o9Umds8TBzPWJDo-liiwecl0C3a8', '552448858311888896', '1', 'wx590af156c3a3eae9', NULL, '\\0', '2020-07-15 22:17:48', NULL, '2020-07-15 22:17:48', NULL),
(319100, 'o9Umds4QVp05ymmUIN1kuGHW0_r8', '552520928622284800', '1', 'wx590af156c3a3eae9', NULL, '\\0', '2020-07-16 03:04:11', NULL, '2020-07-16 03:04:11', NULL),
(319101, 'o9UmdszhICB5tS1i5z9CDq9YFuZs', '552826451968135168', '1', 'wx590af156c3a3eae9', NULL, '\\0', '2020-07-16 23:18:13', NULL, '2020-07-16 23:18:13', NULL),
(319102, 'o9Umds20sDV-FSQVvLT5inlfbIvc', '552835686688886784', '1', 'wx590af156c3a3eae9', NULL, '\\0', '2020-07-16 23:54:55', NULL, '2020-07-16 23:54:55', NULL),
(319103, 'o9Umds20sL3CuF_hOQhNXgTbFn08', '552938168094035968', '1', 'wx590af156c3a3eae9', NULL, '\\0', '2020-07-17 06:42:08', NULL, '2020-07-17 06:42:08', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
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
  `qr` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `video`
--

CREATE TABLE IF NOT EXISTS `video` (
  `id` int(11) NOT NULL,
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
  `create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=593 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `video`
--

INSERT INTO `video` (`id`, `money`, `sj`, `cs`, `url`, `user_id`, `name`, `video_url`, `duration`, `lx`, `status`, `logo`, `is_lei`, `is_allow`, `click`, `is_preview`, `short_url`, `category_id`, `create_time`) VALUES
(124, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/08/ab8023f18cfa35608ecb822a022803fd.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/07/08/c859ec01a29bb086aba8fac3c2574668.mp4', '670', NULL, '0', '/profile/upload/2020/07/08/ab8023f18cfa35608ecb822a022803fd.jpg', 1, 1, 4, 0, '', 227, '2020-06-21 00:53:22'),
(125, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', NULL, '0', '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 1, 1, 4, 0, '', 227, '2020-06-21 00:53:22'),
(126, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/08/530cddd74f83bcf8211170f567a7116d.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/07/08/75a579aee7147b837e4ca7627c8c9027.mp4', '752', NULL, '0', '/profile/upload/2020/07/08/530cddd74f83bcf8211170f567a7116d.jpg', 1, 1, 4, 0, '', 227, '2020-06-21 00:53:22'),
(127, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', NULL, '0', '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 1, 1, 4, 0, '', 227, '2020-06-21 00:53:22'),
(128, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', NULL, '0', '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 1, 1, 4, 0, '', 227, '2020-06-21 00:53:22'),
(129, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', NULL, '0', '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 1, 1, 4, 0, '', 227, '2020-06-21 00:53:22'),
(130, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', NULL, '0', '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 1, 1, 4, 0, '', 227, '2020-06-21 00:53:22'),
(131, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', NULL, '0', '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 1, 1, 4, 0, '', 227, '2020-06-21 00:53:22'),
(132, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', NULL, '0', '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 1, 1, 4, 0, '', 227, '2020-06-21 00:53:22'),
(133, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', NULL, '0', '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 1, 1, 4, 0, '', 227, '2020-06-21 00:53:22'),
(134, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', NULL, '0', '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 1, 1, 4, 0, '', 227, '2020-06-21 00:53:22'),
(135, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', NULL, '0', '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 1, 1, 4, 0, '', 227, '2020-06-21 00:53:22'),
(136, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', NULL, '0', '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 1, 1, 4, 0, '', 227, '2020-06-21 00:53:22'),
(137, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 'admin', 'admin', 'http://admin.grkfcs.cn/profile/upload/2020/06/20/b8e74a2442c543df6d7ab787486484d5.mp4', '122', NULL, '0', '/profile/upload/2020/06/20/aaf126442878d43b7d2775cff83fcb74.jpg', 1, 1, 4, 0, '', 227, '2020-06-21 00:53:22'),
(138, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/08/62202901204bce116a7860abc7fb1db3.jpg', 'admin', '抓着奶子用力操', 'http://admin.grkfcs.cn/profile/upload/2020/07/08/a416b4988e21600e4d6a60f09c4cfd9d.mp4', '752', NULL, '0', '/profile/upload/2020/07/08/62202901204bce116a7860abc7fb1db3.jpg', 1, 1, 4, 0, '', 227, '2020-06-21 00:53:22'),
(426, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/b6102e50a02d04c9b661c6bb8ec41553.png', 'admin', '111', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/60c076a381e3ba9424a9472bcd59d03f.mp4', '113', NULL, '0', '/profile/upload/2020/07/16/b6102e50a02d04c9b661c6bb8ec41553.png', 1, 1, 0, 0, '', 227, '2020-07-12 19:35:40'),
(427, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/e79aaf16333545d789af3ef9ccad460c.png', 'admin', '大奶少妇', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/496be277365ad3e5d9b044cfd99416f1.mp4', '59', NULL, '0', '/profile/upload/2020/07/16/e79aaf16333545d789af3ef9ccad460c.png', 1, 1, 0, 0, '', 229, '2020-07-12 19:41:47'),
(428, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/b68e3576ee3c9f9ee233dfcd31b42370.png', 'admin', '高潮的手机都拿不住', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/074c425bb064f7d74273daa334ff9834.mp4', '46', NULL, '0', '/profile/upload/2020/07/16/b68e3576ee3c9f9ee233dfcd31b42370.png', 1, 1, 0, 0, '', 229, '2020-07-12 19:53:28'),
(429, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/3fa7d3649377d5ae47bbe5b4ca9e5c26.png', 'admin', '附近约的小姐姐害羞了', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/e55770c98e81699a05320fad84aef127.mp4', '51', NULL, '0', '/profile/upload/2020/07/16/3fa7d3649377d5ae47bbe5b4ca9e5c26.png', 1, 1, 0, 0, '', 229, '2020-07-12 19:55:33'),
(430, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/f296ccc033711f635b79b8ee98a18ad7.png', 'admin', '约战黑丝大波妹', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/9036e062a7dbd777376487c4bfc85a43.mp4', '58', NULL, '0', '/profile/upload/2020/07/16/f296ccc033711f635b79b8ee98a18ad7.png', 1, 1, 0, 0, '', 229, '2020-07-12 19:56:45'),
(431, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/7ce8dd07a9960228310ad5daec406c12.png', 'admin', '粉嫩美少女', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/d55370d296674fee9ce3c0d21aee7e10.mp4', '102', NULL, '0', '/profile/upload/2020/07/16/7ce8dd07a9960228310ad5daec406c12.png', 1, 1, 0, 0, '', 229, '2020-07-12 19:58:54'),
(432, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/b64bf6a78d594fa55be3ac5ca199645c.png', 'admin', '慢慢的就来了高潮', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/5acc7532868ee1645dfa02ac47890d90.mp4', '105', NULL, '0', '/profile/upload/2020/07/16/b64bf6a78d594fa55be3ac5ca199645c.png', 1, 1, 0, 0, '', 229, '2020-07-12 20:00:48'),
(433, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/24f8d30bc2796a717969448b4045a496.png', 'admin', '附近约战小骚货', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/7af4d16fd3035506dc3b324f3c154bf5.mp4', '331', NULL, '0', '/profile/upload/2020/07/16/24f8d30bc2796a717969448b4045a496.png', 1, 1, 0, 0, '', 229, '2020-07-12 20:04:33'),
(434, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/45c600638370ab5168eedaa1c5eefbdf.png', 'admin', '骚货叫的真大声', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/f20317a11af0e807f177ddef1224ca9f.mp4', '21', NULL, '0', '/profile/upload/2020/07/16/45c600638370ab5168eedaa1c5eefbdf.png', 1, 1, 0, 0, '', 229, '2020-07-12 20:11:35'),
(435, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/bd34993bc36424dd13f22cd82c94ba9a.png', 'admin', '粉嫩小妹妹自慰', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/aebe02d43a9eeba9bd6e20bf8cfb9866.mp4', '67', NULL, '0', '/profile/upload/2020/07/16/bd34993bc36424dd13f22cd82c94ba9a.png', 1, 1, 0, 0, '', 229, '2020-07-12 20:13:51'),
(436, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/a1c55332a83d618426924046ee881460.png', 'admin', '大奶等你吃', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/ae5a77aba89a48f53221f52a402fb081.mp4', '100', NULL, '0', '/profile/upload/2020/07/16/a1c55332a83d618426924046ee881460.png', 1, 1, 0, 0, '', 229, '2020-07-12 20:16:18'),
(437, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/eefa9c30b573961f4339143e3a906c68.png', 'admin', '久别的女朋友来一发', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/5117ed0e59ba5be14b8690ee4b25b86e.mp4', '300', NULL, '0', '/profile/upload/2020/07/16/eefa9c30b573961f4339143e3a906c68.png', 1, 1, 0, 0, '', 229, '2020-07-12 20:24:35'),
(438, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/7ee1226119a6a4dbbd8affce590c00d3.png', 'admin', '高潮了笑的真开心', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/6087ffb99f014b6083ff9e94def65ac3.mp4', '103', NULL, '0', '/profile/upload/2020/07/16/7ee1226119a6a4dbbd8affce590c00d3.png', 1, 1, 0, 0, '', 229, '2020-07-12 20:30:43'),
(439, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/7aab0ea6ca59188836ea2f66f3151347.png', 'admin', '自慰给你看', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/21d31d9b487e2e589acd393949a1c4f2.mp4', '224', NULL, '0', '/profile/upload/2020/07/16/7aab0ea6ca59188836ea2f66f3151347.png', 1, 1, 0, 0, '', 229, '2020-07-12 20:35:56'),
(440, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/9acb239f8e8fdb3e84767ed3b7bf455a.png', 'admin', '掰开粉嫩的小穴', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/3856c1dab91a6f4ee00db29680b8bca5.mp4', '19', NULL, '0', '/profile/upload/2020/07/16/9acb239f8e8fdb3e84767ed3b7bf455a.png', 1, 1, 0, 0, '', 229, '2020-07-12 20:41:55'),
(441, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/e2cd71578d3fb7d7ab3cb1cce0839176.png', 'admin', '自慰湿湿的小穴', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/f40dec0878431017580124f2b5ce46ae.mp4', '180', NULL, '0', '/profile/upload/2020/07/16/e2cd71578d3fb7d7ab3cb1cce0839176.png', 1, 1, 0, 0, '', 229, '2020-07-12 20:46:12'),
(442, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/5424f56cf796038261ea73b426c02bff.png', 'admin', '高挑美女的制服诱惑', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/dcfd8aeba10a27a8c0ff8288454ad770.mp4', '162', NULL, '0', '/profile/upload/2020/07/16/5424f56cf796038261ea73b426c02bff.png', 1, 1, 0, 0, '', 230, '2020-07-12 20:50:29'),
(443, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/8def30f1ff47ec5f9e916103df400b23.png', 'admin', '用大香蕉插入', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/5ec28082202744c6021a233988b68836.mp4', '168', NULL, '0', '/profile/upload/2020/07/16/8def30f1ff47ec5f9e916103df400b23.png', 1, 1, 0, 0, '', 218, '2020-07-12 20:55:51'),
(444, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/b444800f585cff232c1be33ad9a282f8.png', 'admin', '妹妹好想要', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/1c67e6ac8371cc27399e0c950e8e01ca.mp4', '439', NULL, '0', '/profile/upload/2020/07/16/b444800f585cff232c1be33ad9a282f8.png', 1, 1, 0, 0, '', 229, '2020-07-12 21:04:57'),
(445, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/70cfe92e086ae3aae1843fa1f4430170.png', 'admin', '吃哥哥的大屌', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/803e2e82e4a4c18eb4195c33a0c9e8cd.mp4', '89', NULL, '0', '/profile/upload/2020/07/16/70cfe92e086ae3aae1843fa1f4430170.png', 1, 1, 0, 0, '', 230, '2020-07-12 21:07:20'),
(446, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/ae1cd670aa20c8768acc743a108bf6a1.png', 'admin', '跳脱衣舞给你看', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/23ed2c482fa02fbf56954f27d651893b.mp4', '50', NULL, '0', '/profile/upload/2020/07/16/ae1cd670aa20c8768acc743a108bf6a1.png', 1, 1, 0, 0, '', 229, '2020-07-12 21:08:55'),
(447, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/da449e401e99617e77dfb1968fee4b4d.png', 'admin', '大鲍鱼等你擦', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/5dd0cbb00476362e41d63b8b8b9c9882.mp4', '214', NULL, '0', '/profile/upload/2020/07/16/da449e401e99617e77dfb1968fee4b4d.png', 1, 1, 0, 0, '', 218, '2020-07-12 21:14:05'),
(448, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/d74049ac04bb9a83b3d11f71d6f81bf8.png', 'admin', '妹妹想要了', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/1e1c95d3f3cab39f3276a6babc917464.mp4', '94', NULL, '0', '/profile/upload/2020/07/16/d74049ac04bb9a83b3d11f71d6f81bf8.png', 1, 1, 0, 0, '', 218, '2020-07-12 21:29:21'),
(449, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/81329d73bb194ac74e596050aecf85ad.png', 'admin', '学生妹的自慰', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/bfd1508166f0dca65f96141b32c3537b.mp4', '176', NULL, '0', '/profile/upload/2020/07/16/81329d73bb194ac74e596050aecf85ad.png', 1, 1, 0, 0, '', 218, '2020-07-12 21:56:05'),
(450, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/5bb52361ed2bfc316ff318efa3d6e3ff.png', 'admin', '大奶自慰', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/e732fa5aacb40af55781f44ca9b1271a.mp4', '60', NULL, '0', '/profile/upload/2020/07/16/5bb52361ed2bfc316ff318efa3d6e3ff.png', 1, 1, 0, 0, '', 218, '2020-07-12 22:15:06'),
(451, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/d6a90416c78b90ffe11eac20e5a53463.png', 'admin', '哥哥大屌真好吃', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/8ced971cec3304cc150f29b2caa899cb.mp4', '679', NULL, '0', '/profile/upload/2020/07/16/d6a90416c78b90ffe11eac20e5a53463.png', 1, 1, 0, 0, '', 230, '2020-07-12 22:19:41'),
(452, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/b9466a1870136b567e9d4d0fab679be7.png', 'admin', '射到身上了', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/6cf7431f25dcbaf4ead3dfb89295fd28.mp4', '70', NULL, '0', '/profile/upload/2020/07/16/b9466a1870136b567e9d4d0fab679be7.png', 1, 1, 0, 0, '', 229, '2020-07-12 22:20:57'),
(453, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/734566b51d871572c7190442e778857c.png', 'admin', '一边看电视一边做', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/3132acbb45277a3f9e0ad19a296d0741.mp4', '154', NULL, '0', '/profile/upload/2020/07/16/734566b51d871572c7190442e778857c.png', 1, 1, 0, 0, '', 229, '2020-07-12 22:21:42'),
(454, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/9bc90cef8cebab3e43ef7177474082d3.png', 'admin', '豹纹内衣的大奶妹', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/e8bd803d1e9486b10218d319ca68491b.mp4', '66', NULL, '0', '/profile/upload/2020/07/16/9bc90cef8cebab3e43ef7177474082d3.png', 1, 1, 0, 0, '', 229, '2020-07-12 22:22:51'),
(455, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/b6b7d50859869b1dad038b4c3e5a88a7.png', 'admin', '流水的小穴', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/279589d6a364dd06f2e600e637c7344c.mp4', '31', NULL, '0', '/profile/upload/2020/07/16/b6b7d50859869b1dad038b4c3e5a88a7.png', 1, 1, 0, 0, '', 229, '2020-07-12 22:46:47'),
(456, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/7177b7713281ba82287d52cb0d4c9788.png', 'admin', '干了别人女朋友', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/d475769c50f1b8e3d75981c5dccc30ae.mp4', '290', NULL, '0', '/profile/upload/2020/07/16/7177b7713281ba82287d52cb0d4c9788.png', 1, 1, 0, 0, '', 229, '2020-07-12 22:48:48'),
(457, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/cf992836ee936d69f9f11ab7a4b4d6a5.png', 'admin', '约会情人', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/86f1d7e17a0270dd6b835eaead8245da.mp4', '65', NULL, '0', '/profile/upload/2020/07/16/cf992836ee936d69f9f11ab7a4b4d6a5.png', 1, 1, 0, 0, '', 229, '2020-07-12 22:51:17'),
(458, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/41a36068ad113a172a31137b94b21ff2.png', 'admin', '丰满的美少妇', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/5c403c27bb9b0f698ff647e9423f4ea7.mp4', '43', NULL, '0', '/profile/upload/2020/07/16/41a36068ad113a172a31137b94b21ff2.png', 1, 1, 0, 0, '', 229, '2020-07-12 22:53:39'),
(459, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/87457c46ffbb6a8dc08ad03089438a28.png', 'admin', '小穴想要了', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/0a6364a32cf3661b7024b31150ab8ae5.mp4', '69', NULL, '0', '/profile/upload/2020/07/16/87457c46ffbb6a8dc08ad03089438a28.png', 1, 1, 0, 0, '', 218, '2020-07-12 22:55:57'),
(460, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/922762ff7c2f1196e70e82d52cfe6613.png', 'admin', '一边接吻一边操', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/908572a0cccebab2c1492b67cd82c9b0.mp4', '120', NULL, '0', '/profile/upload/2020/07/16/922762ff7c2f1196e70e82d52cfe6613.png', 1, 1, 0, 0, '', 229, '2020-07-12 22:57:43'),
(461, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/502edee152049b6c16a85bfab069c81b.png', 'admin', '大奶美女', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/763e4c308eeeff6c102731e1416f8789.mp4', '61', NULL, '0', '/profile/upload/2020/07/16/502edee152049b6c16a85bfab069c81b.png', 1, 1, 0, 0, '', 229, '2020-07-12 22:59:22'),
(462, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/25f0b10199d22d9a6c274cbf74b43cf6.png', 'admin', '大奶子美女', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/a284f06ef69d432288a6378957edaec3.mp4', '110', NULL, '0', '/profile/upload/2020/07/16/25f0b10199d22d9a6c274cbf74b43cf6.png', 1, 1, 0, 0, '', 229, '2020-07-12 23:04:54'),
(463, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/aa1c89a427af07acadc75064c9a0c612.png', 'admin', '自慰扣的喷水', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/88c4ccbcdc8b8663433b0e75934a5082.mp4', '64', NULL, '0', '/profile/upload/2020/07/16/aa1c89a427af07acadc75064c9a0c612.png', 1, 1, 0, 0, '', 218, '2020-07-12 23:51:20'),
(464, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/119075e665b9adca2d733538ac58bdd0.png', 'admin', '干的骚货一直叫', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/03034dbbba1b327c1e822a8d8cade549.mp4', '221', NULL, '0', '/profile/upload/2020/07/16/119075e665b9adca2d733538ac58bdd0.png', 1, 1, 0, 0, '', 229, '2020-07-12 23:53:37'),
(465, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/762cb40cf87c1b2c351c67cada589c10.png', 'admin', '粗大的茄子擦骚逼', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/13db1b8983cab7f498cacb5cb7257156.mp4', '208', NULL, '0', '/profile/upload/2020/07/16/762cb40cf87c1b2c351c67cada589c10.png', 1, 1, 0, 0, '', 229, '2020-07-12 23:59:04'),
(466, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/a8bd1bad264b577142511c4e18cdc632.png', 'admin', '蒙着眼睛吃大屌', 'http://admin.grkfcs.cn/profile/upload/2020/07/13/8615ada691de777a82193d7bfc3e23f4.mp4', '177', NULL, '0', '/profile/upload/2020/07/16/a8bd1bad264b577142511c4e18cdc632.png', 1, 1, 0, 0, '', 230, '2020-07-13 00:10:49'),
(467, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/de4260772580e6a95ed26cd162a6a642.png', 'admin', '穿着丝袜扣着小穴', 'http://admin.grkfcs.cn/profile/upload/2020/07/13/951f471a5792a3ff6101665514eca263.mp4', '209', NULL, '0', '/profile/upload/2020/07/16/de4260772580e6a95ed26cd162a6a642.png', 1, 1, 0, 0, '', 218, '2020-07-13 00:13:20'),
(468, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/48c4c57e56ee1b6db41ecc9844157c12.png', 'admin', '含着你的大屌', 'http://admin.grkfcs.cn/profile/upload/2020/07/13/5edf2842ab28d10d20235b0feeab35bc.mp4', '150', NULL, '0', '/profile/upload/2020/07/16/48c4c57e56ee1b6db41ecc9844157c12.png', 1, 1, 0, 0, '', 230, '2020-07-13 00:16:19'),
(470, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/13/c332dac87ec8dd711d8ca9b36ecf1853.png', 'admin', '揉着奶子有感觉了', 'http://admin.grkfcs.cn/profile/upload/2020/07/12/5dd0cbb00476362e41d63b8b8b9c9882.mp4', NULL, NULL, '0', '/profile/upload/2020/07/13/c332dac87ec8dd711d8ca9b36ecf1853.png', 1, 1, 0, 0, '', 218, '2020-07-13 01:06:43'),
(511, '2-5', NULL, '37280', 'https://tp.jializyw.com/lunlipic/20200413-KR/750QXGrh.jpg', 'admin', '致命的引诱', 'https://vd6.zhiyuanhongda.com/20200413/750QXGrh/index.m3u8', NULL, NULL, '0', 'https://tp.jializyw.com/lunlipic/20200413-KR/750QXGrh.jpg', 1, 1, 0, 0, '', 272, '2020-07-15 20:29:52'),
(512, '2-5', NULL, '37279', 'https://tp.jializyw.com/lunlipic/20200413-KR/lowY6ou3.jpg', 'admin', '野外的刺激', 'https://vd6.zhiyuanhongda.com/20200413/lowY6ou3/index.m3u8', NULL, NULL, '0', 'https://tp.jializyw.com/lunlipic/20200413-KR/lowY6ou3.jpg', 1, 1, 0, 0, '', 272, '2020-07-15 20:29:52'),
(513, '2-5', NULL, '37278', 'https://tp.jializyw.com/lunlipic/20200413-KR/Dd59oUU6.jpg', 'admin', '岳母与我的秘事', 'https://vd6.zhiyuanhongda.com/20200413/Dd59oUU6/index.m3u8', NULL, NULL, '0', 'https://tp.jializyw.com/lunlipic/20200413-KR/Dd59oUU6.jpg', 1, 1, 0, 0, '', 272, '2020-07-15 20:29:52'),
(514, '2-5', NULL, '37277', 'https://tp.jializyw.com/upload/vod/20200709-1/89879632ff7f9b046069e716560a758e.jpg', 'admin', '看似感情美满的夫妇之中潜藏着微小的裂缝，没想到却与老公的主管疯狂偷情', 'https://video.jializyw.com:8800/20200708/kQcaRohn/index.m3u8', NULL, NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/89879632ff7f9b046069e716560a758e.jpg', 1, 1, 0, 0, '', 273, '2020-07-15 20:29:52'),
(515, '2-5', NULL, '37276', 'https://tp.jializyw.com/upload/vod/20200709-1/81284fd2e8941b12265ebf731fde7dc6.jpg', 'admin', '极品大学生美少女宿舍掰开粉洪嫩逼自慰', 'https://video.jializyw.com:8800/20200708/nlspMceM/index.m3u8', NULL, NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/81284fd2e8941b12265ebf731fde7dc6.jpg', 1, 1, 0, 0, '', 273, '2020-07-15 20:29:52'),
(516, '2-5', NULL, '37275', 'https://tp.jializyw.com/upload/vod/20200709-1/5b05ae1c259aded0a0f392dafd909609.jpg', 'admin', '搭讪熟女带回家干炮偷拍擅自卖给片商', 'https://video.jializyw.com:8800/20200708/T5XqcTz5/index.m3u8', NULL, NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/5b05ae1c259aded0a0f392dafd909609.jpg', 1, 1, 0, 0, '', 273, '2020-07-15 20:29:52'),
(517, '2-5', NULL, '37274', 'https://tp.jializyw.com/upload/vod/20200709-1/8d79e848196ec457a9576e52ca208461.jpg', 'admin', '和新女友开房趣~等她洗完澡就迫不及待压到床上啪啪啪啪啪~爱的鼓掌', 'https://video.jializyw.com:8800/20200708/djJBqV3F/index.m3u8', NULL, NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/8d79e848196ec457a9576e52ca208461.jpg', 1, 1, 0, 0, '', 273, '2020-07-15 20:29:52'),
(518, '2-5', NULL, '37273', 'https://tp.jializyw.com/upload/vod/20200709-1/47f357a13858910918fc5b3ea5e3502e.jpg', 'admin', '极品大奶主播自慰大秀完美巨乳自慰插逼呻吟可射', 'https://video.jializyw.com:8800/20200708/wZ1MFwSo/index.m3u8', NULL, NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/47f357a13858910918fc5b3ea5e3502e.jpg', 1, 1, 0, 0, '', 273, '2020-07-15 20:29:52'),
(519, '2-5', NULL, '37272', 'https://tp.jializyw.com/upload/vod/20200709-1/e6de8c4e2483279d447cd3c328483440.jpg', 'admin', '搭讪游击队访问憧憬熟女中出做爱', 'https://video.jializyw.com:8800/20200708/cIct3sIC/index.m3u8', NULL, NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/e6de8c4e2483279d447cd3c328483440.jpg', 1, 1, 0, 0, '', 273, '2020-07-15 20:29:52'),
(520, '2-5', NULL, '37271', 'https://tp.jializyw.com/upload/vod/20200709-1/6ff9adbcced9b50c5912b1d877f14de6.jpg', 'admin', '[欧美主播外流]姐姐妹妹一起来，闺密三人组一起起全裸自慰淫叫讨拍，看一部等于赚到三部', 'https://video.jializyw.com:8800/20200708/oBR4xvtn/index.m3u8', NULL, NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/6ff9adbcced9b50c5912b1d877f14de6.jpg', 1, 1, 0, 0, '', 273, '2020-07-15 20:29:52'),
(521, '2-5', NULL, '37270', 'https://tp.jializyw.com/upload/vod/20200709-1/bac6d8d63121e5b3fdddfec83a7bf0df.jpg', 'admin', '搭讪身材苗条的辣妹海边玩水后再去酒店打炮', 'https://video.jializyw.com:8800/20200708/t0efMEXA/index.m3u8', NULL, NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/bac6d8d63121e5b3fdddfec83a7bf0df.jpg', 1, 1, 0, 0, '', 273, '2020-07-15 20:29:52'),
(522, '2-5', NULL, '37269', 'https://tp.jializyw.com/upload/vod/20200709-1/c00e59be3cd47ce0a2d50f5871b432af.jpg', 'admin', '[欧美主播外流]性感的奶牛风骚扭动翘臀岔开腿掰开穴等你插入', 'https://video.jializyw.com:8800/20200708/rTAh7rL0/index.m3u8', NULL, NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/c00e59be3cd47ce0a2d50f5871b432af.jpg', 1, 1, 0, 0, '', 273, '2020-07-15 20:29:52'),
(523, '2-5', NULL, '37268', 'https://tp.jializyw.com/upload/vod/20200709-1/a9fccfcd44460bded90e6459e20d7cf2.jpg', 'admin', '[中文主播外流]高颜值可爱美女情欲难耐自慰高潮粉嫩鲍鱼', 'https://video.jializyw.com:8800/20200708/oeKslXCv/index.m3u8', NULL, NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/a9fccfcd44460bded90e6459e20d7cf2.jpg', 1, 1, 0, 0, '', 273, '2020-07-15 20:29:52'),
(524, '2-5', NULL, '37267', 'https://tp.jializyw.com/upload/vod/20200709-1/d91534c4e0f4d349f38b99dc12eced87.jpg', 'admin', '[韩国主播外流]长得酷似某韩国女星，皮肤白皙骚逼粉嫩嫩的', 'https://video.jializyw.com:8800/20200708/FieDOrw5/index.m3u8', NULL, NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/d91534c4e0f4d349f38b99dc12eced87.jpg', 1, 1, 0, 0, '', 273, '2020-07-15 20:29:52'),
(525, '2-5', NULL, '37266', 'https://tp.jializyw.com/upload/vod/20200709-1/dbbccc969f7a84c19d2fb2616806bf5e.jpg', 'admin', '[中文主播外流]“舔我好痒快点用大肉棒插进来”对白淫荡嘟嘟唇网红大奶骚美女直播挑逗你的每一处神经', 'https://video.jializyw.com:8800/20200708/lhmPDYrB/index.m3u8', NULL, NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/dbbccc969f7a84c19d2fb2616806bf5e.jpg', 1, 1, 0, 0, '', 273, '2020-07-15 20:29:52'),
(526, '2-5', NULL, '37265', 'https://tp.jializyw.com/upload/vod/20200709-1/b5f48a2cc98100980815993391928db9.jpg', 'admin', '[中文主播外流]新秀主播私密视频录制大秀身材自慰高潮', 'https://video.jializyw.com:8800/20200708/fYqLI04K/index.m3u8', NULL, NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/b5f48a2cc98100980815993391928db9.jpg', 1, 1, 0, 0, '', 273, '2020-07-15 20:29:52'),
(527, '2-5', NULL, '37264', 'https://tp.jializyw.com/upload/vod/20200709-1/09b6661c40c5ce24be9c7397a42febf8.jpg', 'admin', '[韩国主播外流]魔鬼身材的女主播骚臀骚穴扭动的让人欲罢不能', 'https://video.jializyw.com:8800/20200708/lfmNjO1h/index.m3u8', NULL, NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/09b6661c40c5ce24be9c7397a42febf8.jpg', 1, 1, 0, 0, '', 273, '2020-07-15 20:29:52'),
(528, '2-5', NULL, '37263', 'https://tp.jializyw.com/upload/vod/20200709-1/e15d210b57880b3aaaf43a0b90a8eabe.jpg', 'admin', '睡走朋友女友还偷拿来卖给片商', 'https://video.jializyw.com:8800/20200708/c5yaWghA/index.m3u8', NULL, NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/e15d210b57880b3aaaf43a0b90a8eabe.jpg', 1, 1, 0, 0, '', 273, '2020-07-15 20:29:52'),
(529, '2-5', NULL, '37262', 'https://tp.jializyw.com/upload/vod/20200709-1/723179a659ebea4da1a3f8b876c40312.jpg', 'admin', '[欧美主播外流]美艳女大学生下海做黄播清纯脸蛋藏不住一颗骚逼的心', 'https://video.jializyw.com:8800/20200708/QDB3wUWd/index.m3u8', NULL, NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/723179a659ebea4da1a3f8b876c40312.jpg', 1, 1, 0, 0, '', 273, '2020-07-15 20:29:52'),
(530, '2-5', NULL, '37261', 'https://tp.jializyw.com/upload/vod/20200709-1/718051067c4c1b77088ed1552a50803b.jpg', 'admin', '美女极品声音呻吟声嗲到不行直播自慰喷水', 'https://video.jializyw.com:8800/20200708/EJvqao8v/index.m3u8', NULL, NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/718051067c4c1b77088ed1552a50803b.jpg', 1, 1, 0, 0, '', 273, '2020-07-15 20:29:52'),
(531, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/28142da5a04c3fe8d464852956e6cd37.png', 'admin', '穿着豹纹自慰', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/264ff2868a6e556f7a9f27538eef232e.mp4', '180', NULL, '0', '/profile/upload/2020/07/15/28142da5a04c3fe8d464852956e6cd37.png', 1, 1, 0, 0, '', 218, '2020-07-15 21:36:58'),
(532, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/dda44f97a605029c53fb04e15c528575.png', 'admin', '午觉睡醒想要了', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/f863cdca4cb0ab620c2db11098ce6415.mp4', '183', NULL, '0', '/profile/upload/2020/07/15/dda44f97a605029c53fb04e15c528575.png', 1, 1, 0, 0, '', 229, '2020-07-15 21:38:21'),
(533, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/ab46c0c15220980f0dd74f559aa58da3.png', 'admin', '按摩被内射', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/1cae950c1669256d5403d05495670f9a.mp4', '460', NULL, '0', '/profile/upload/2020/07/15/ab46c0c15220980f0dd74f559aa58da3.png', 1, 1, 0, 0, '', 200, '2020-07-15 21:40:10'),
(534, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/dd412178993cc376f6f6d5d457ab3f8e.png', 'admin', '乖乖女自慰扣穴', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/4b1066dda08bef4778fc0e53c1e8d031.mp4', '461', NULL, '0', '/profile/upload/2020/07/15/dd412178993cc376f6f6d5d457ab3f8e.png', 1, 1, 0, 0, '', 218, '2020-07-15 21:41:31'),
(535, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/6c774f047ddaa39dd4d209be7e3e2938.png', 'admin', '一个人自慰喷水', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/f275289e797af286f41dbf7e9776cfd6.mp4', '211', NULL, '0', '/profile/upload/2020/07/15/6c774f047ddaa39dd4d209be7e3e2938.png', 1, 1, 0, 0, '', 218, '2020-07-15 21:42:33'),
(536, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/e97f06ed25989db310a5592ebe139c5c.png', 'admin', '深喉哥哥大屌', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/3288000e1a6b6d38ad7cb1a7211a3704.mp4', '58', NULL, '0', '/profile/upload/2020/07/15/e97f06ed25989db310a5592ebe139c5c.png', 1, 1, 0, 0, '', 230, '2020-07-15 21:44:54'),
(537, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/5d04a4cb55c649a289ecc10cbb99bc2a.png', 'admin', '约炮极品小妹', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/4d551630f8637ec77d69b9aaa3e4491e.mp4', '117', NULL, '0', '/profile/upload/2020/07/15/5d04a4cb55c649a289ecc10cbb99bc2a.png', 1, 1, 0, 0, '', 229, '2020-07-15 21:46:02'),
(538, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/0090bfea3857df2a8e53168a92023d03.png', 'admin', '按摩女舔菊花', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/067751dc7e82efba08f9cf361f092aa5.mp4', '74', NULL, '0', '/profile/upload/2020/07/15/0090bfea3857df2a8e53168a92023d03.png', 1, 1, 0, 0, '', 229, '2020-07-15 21:47:22'),
(539, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/5f4a25ffada40e3c4a2b846c2bc53dbd.png', 'admin', '可爱眼睛妹自慰扣穴', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/d14846d09ad24b09d19de28d9583d7bb.mp4', '59', NULL, '0', '/profile/upload/2020/07/15/5f4a25ffada40e3c4a2b846c2bc53dbd.png', 1, 1, 0, 0, '', 218, '2020-07-15 21:49:08'),
(540, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/71190ae86dbbabeb5f2203849ed347aa.png', 'admin', '激情69', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/03d8f0e28b4329936dd45363b99dea3b.mp4', '241', NULL, '0', '/profile/upload/2020/07/15/71190ae86dbbabeb5f2203849ed347aa.png', 1, 1, 0, 0, '', 200, '2020-07-15 21:50:54'),
(541, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/6d091e7c96479d65fb881411fb524c46.png', 'admin', '约的妹子直接内射', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/4cb875e83825da2c21abbf7b72b961f9.mp4', '67', NULL, '0', '/profile/upload/2020/07/15/6d091e7c96479d65fb881411fb524c46.png', 1, 1, 0, 0, '', 229, '2020-07-15 21:52:46'),
(542, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/ca92ad90a79cd8dcf54af3275b18d622.png', 'admin', '深情的吃着大屌', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/4b539a9f5c0b75892268dbefb3f6d8ad.mp4', '140', NULL, '0', '/profile/upload/2020/07/15/ca92ad90a79cd8dcf54af3275b18d622.png', 1, 1, 0, 0, '', 230, '2020-07-15 21:54:13'),
(543, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/71415357125a12d9bc0665d6d4de6302.png', 'admin', '一边吃大屌一边自拍', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/5b2ca84ab731fb2150efc2442f22b01f.mp4', '147', NULL, '0', '/profile/upload/2020/07/15/71415357125a12d9bc0665d6d4de6302.png', 1, 1, 0, 0, '', 230, '2020-07-15 21:55:32'),
(544, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/d5f2fef498b802e8161105ada2b5759e.png', 'admin', '酒店偷拍偷情男女', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/d671204d0c6f286ccc189d282206d998.mp4', '185', NULL, '0', '/profile/upload/2020/07/15/d5f2fef498b802e8161105ada2b5759e.png', 1, 1, 0, 0, '', 227, '2020-07-15 21:56:46'),
(545, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/11fbf63717ed3397bba79215ece40e21.png', 'admin', '美少妇自慰超多少', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/764e12b99cf7a73c97a1c7f4e12e2f70.mp4', '221', NULL, '0', '/profile/upload/2020/07/15/11fbf63717ed3397bba79215ece40e21.png', 1, 1, 0, 0, '', 218, '2020-07-15 21:57:48'),
(546, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/96616927ad80a5ed433c3d6d6c5ee70a.png', 'admin', '情侣许久不见激情做爱', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/f343f67ef59c72a8361895e99962e273.mp4', '204', NULL, '0', '/profile/upload/2020/07/15/96616927ad80a5ed433c3d6d6c5ee70a.png', 1, 1, 0, 0, '', 229, '2020-07-15 21:59:04'),
(547, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/4dcb58ee0a8ddba0ecec2a3900eebbc3.png', 'admin', '水汪汪的小骚货', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/e5e5082eb16335bd2acac3712b768e61.mp4', '217', NULL, '0', '/profile/upload/2020/07/15/4dcb58ee0a8ddba0ecec2a3900eebbc3.png', 1, 1, 0, 0, '', 218, '2020-07-15 22:00:21'),
(548, '2-5', NULL, NULL, 'http://admin.grkfcs.cn/profile/upload/2020/07/15/ca648f930c86bd62311b9b2ae92a01c4.png', 'admin', '玩着手机被操', 'http://admin.grkfcs.cn/profile/upload/2020/07/15/3f3244ba30376c71995125e9e193388d.mp4', '113', NULL, '0', '/profile/upload/2020/07/15/ca648f930c86bd62311b9b2ae92a01c4.png', 1, 1, 0, 0, '', 229, '2020-07-15 22:15:10'),
(549, '2-5', NULL, '37506', 'https://tp.jializyw.com/lunlipic/20200413-KR/uyAGs4XZ.jpg', 'admin', '隐秘的习惯', 'https://vd6.zhiyuanhongda.com/20200413/uyAGs4XZ/index.m3u8', '752', NULL, '0', 'https://tp.jializyw.com/lunlipic/20200413-KR/uyAGs4XZ.jpg', 1, 1, 0, 0, '', 272, '2020-07-16 16:42:37'),
(550, '2-5', NULL, '37505', 'https://tp.jializyw.com/lunlipic/20200413-KR/gGCwk4P2.jpg', 'admin', '浴室风景', 'https://vd6.zhiyuanhongda.com/20200413/gGCwk4P2/index.m3u8', '752', NULL, '0', 'https://tp.jializyw.com/lunlipic/20200413-KR/gGCwk4P2.jpg', 1, 1, 0, 0, '', 272, '2020-07-16 16:42:37'),
(551, '2-5', NULL, '37504', 'https://tp.jializyw.com/lunlipic/20200413-KR/hQuaUbn3.jpg', 'admin', '女人的香气', 'https://vd6.zhiyuanhongda.com/20200413/hQuaUbn3/index.m3u8', '752', NULL, '0', 'https://tp.jializyw.com/lunlipic/20200413-KR/hQuaUbn3.jpg', 1, 1, 0, 0, '', 272, '2020-07-16 16:42:37'),
(552, '2-5', NULL, '37503', 'https://tp.jializyw.com/upload/vod/20200709-1/9aafb2037156aec3663ce73a30f72161.jpg', 'admin', '清纯人妻拥有超乎想像的淫乱M女体质！让人绑起来玩弄、当成奴隶对待到不断高潮，来场变态性交！', 'https://video.jializyw.com:8800/20200708/hBXvyYL6/index.m3u8', '752', NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/9aafb2037156aec3663ce73a30f72161.jpg', 1, 1, 0, 0, '', 273, '2020-07-16 16:42:37'),
(553, '2-5', NULL, '37502', 'https://tp.jializyw.com/upload/vod/20200709-1/b007cea6f4d4aa43aa636e0632a7daa6.jpg', 'admin', '好姐妹一起开房洗澡互舔自慰比男友还爽', 'https://video.jializyw.com:8800/20200708/WcleAHr9/index.m3u8', '752', NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/b007cea6f4d4aa43aa636e0632a7daa6.jpg', 1, 1, 0, 0, '', 273, '2020-07-16 16:42:37'),
(554, '2-5', NULL, '37501', 'https://tp.jializyw.com/upload/vod/20200709-1/0b95fd5d04a19ab0e0316af1279a7c09.jpg', 'admin', '找了昔日高中同学一起来4P直播~给干爹们的年终回馈~吃鸡揉奶毫不扭捏', 'https://video.jializyw.com:8800/20200708/HY0DNhzB/index.m3u8', '752', NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/0b95fd5d04a19ab0e0316af1279a7c09.jpg', 1, 1, 0, 0, '', 273, '2020-07-16 16:42:37'),
(555, '2-5', NULL, '37500', 'https://tp.jializyw.com/upload/vod/20200709-1/914879a868e5157f6d9dd026a98eadaa.jpg', 'admin', '高颜值女主播_身材很好_插着自慰棒_随音乐摇摆身姿_十分诱惑', 'https://video.jializyw.com:8800/20200708/udYJdIbO/index.m3u8', '752', NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/914879a868e5157f6d9dd026a98eadaa.jpg', 1, 1, 0, 0, '', 273, '2020-07-16 16:42:37'),
(556, '2-5', NULL, '37499', 'https://tp.jializyw.com/upload/vod/20200709-1/63cd3a6ab894a3f302a1690aeb606999.jpg', 'admin', '逼逼无毛丰满身材少妇道具自慰_床上漏奶插完逼逼再插菊花翘着屁股', 'https://video.jializyw.com:8800/20200708/uG28N9cA/index.m3u8', '752', NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/63cd3a6ab894a3f302a1690aeb606999.jpg', 1, 1, 0, 0, '', 273, '2020-07-16 16:42:37'),
(557, '2-5', NULL, '37498', 'https://tp.jializyw.com/upload/vod/20200709-1/4535b013c09ef8a3f20035186f782a98.jpg', 'admin', '35岁的熟人妻为了解放性欲而来下海啦', 'https://video.jializyw.com:8800/20200708/CXo7MZ3i/index.m3u8', '752', NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/4535b013c09ef8a3f20035186f782a98.jpg', 1, 1, 0, 0, '', 273, '2020-07-16 16:42:37'),
(567, '2-5', NULL, '37488', 'https://tp.jializyw.com/upload/vod/20200709-1/93049e3ac8d5cdfa9028e100518f82ed.jpg', 'admin', '[韩国主播外流]我们在视频里恋爱，哥哥想看我的小穴穴吗', 'https://video.jializyw.com:8800/20200708/fKGTA8dI/index.m3u8', '752', NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/93049e3ac8d5cdfa9028e100518f82ed.jpg', 1, 1, 0, 0, '', 273, '2020-07-16 16:42:38'),
(568, '2-5', NULL, '37487', 'https://tp.jializyw.com/upload/vod/20200709-1/8b422fe99ca362b0674db0e34d5cacc2.jpg', 'admin', '[欧美主播外流]欧美正妹直播视讯无码片镜头前搔首弄姿极尽挑逗让粉丝疯狂', 'https://video.jializyw.com:8800/20200708/3LVyFWRv/index.m3u8', '752', NULL, '0', 'https://tp.jializyw.com/upload/vod/20200709-1/8b422fe99ca362b0674db0e34d5cacc2.jpg', 1, 1, 0, 0, '', 273, '2020-07-16 16:42:38'),
(569, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/18fa3fc2f3a168a6208857e1d0e26bfb.png', 'admin', '自慰扣穴', 'http://admin.niz47.top/profile/upload/2020/07/16/edebcee63517e2d3da2c4c087ae9b84b.mp4', '68', NULL, '0', '/profile/upload/2020/07/16/18fa3fc2f3a168a6208857e1d0e26bfb.png', 1, 1, 0, 0, '', 218, '2020-07-16 23:22:06'),
(570, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/ff130ad578a9ca7b270d7c3c853022f9.png', 'admin', '用道具擦得喷水', 'http://admin.niz47.top/profile/upload/2020/07/16/c8b2f0faeceac3af9525bd22e327b6f1.mp4', '175', NULL, '0', '/profile/upload/2020/07/16/ff130ad578a9ca7b270d7c3c853022f9.png', 1, 1, 0, 0, '', 218, '2020-07-16 23:31:12'),
(571, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/639a959e997fadcbf4061511281e4875.png', 'admin', '手指张开小穴', 'http://admin.niz47.top/profile/upload/2020/07/16/e47f9ee573fd067af3cf462b73961ee9.mp4', '175', NULL, '0', '/profile/upload/2020/07/16/639a959e997fadcbf4061511281e4875.png', 1, 1, 0, 0, '', 218, '2020-07-16 23:35:04'),
(572, '2-5', NULL, NULL, 'http://admin.niz47.top/profile/upload/2020/07/16/89d6920cb9405754c8f800c640ef6970.png', 'admin', '老外激情做爱', 'http://admin.niz47.top/profile/upload/2020/07/16/34343b3fc76741d1d5d6a9296ebc4055.mp4', '188', NULL, '0', '/profile/upload/2020/07/16/89d6920cb9405754c8f800c640ef6970.png', 1, 1, 0, 0, '', 202, '2020-07-16 23:36:47'),
(573, '2-5', NULL, '37917', 'https://tp.jializyw.com/lunlipic/20200413-KR/nGaHNRzo.jpg', 'admin', '丈夫不在家', 'https://vd6.zhiyuanhongda.com/20200413/nGaHNRzo/index.m3u8', '752', NULL, NULL, 'https://tp.jializyw.com/lunlipic/20200413-KR/nGaHNRzo.jpg', 1, 1, 0, 0, '', 272, '2020-07-18 23:42:28'),
(574, '2-5', NULL, '37916', 'https://tp.jializyw.com/lunlipic/20200413-KR/LshChx5Y.jpg', 'admin', '小姨子的欲望', 'https://vd6.zhiyuanhongda.com/20200413/LshChx5Y/index.m3u8', '752', NULL, NULL, 'https://tp.jializyw.com/lunlipic/20200413-KR/LshChx5Y.jpg', 1, 1, 0, 0, '', 272, '2020-07-18 23:42:28'),
(575, '2-5', NULL, '37915', 'https://tp.jializyw.com/lunlipic/20200413-KR/PAVvbZvi.jpg', 'admin', '拍摄艺术角度', 'https://vd6.zhiyuanhongda.com/20200413/PAVvbZvi/index.m3u8', '752', NULL, NULL, 'https://tp.jializyw.com/lunlipic/20200413-KR/PAVvbZvi.jpg', 1, 1, 0, 0, '', 272, '2020-07-18 23:42:28'),
(576, '2-5', NULL, '37914', 'https://tp.jializyw.com/upload/vod/20200709-1/efe790876d9a9d916947685fd5c60adf.jpg', 'admin', '[欧美主播外流]身材苗条美女嫩妹主播女大学生双人大秀美乳晃动给你华丽视觉享受', 'https://video.jializyw.com:8800/20200708/9tf8EyFX/index.m3u8', '752', NULL, NULL, 'https://tp.jializyw.com/upload/vod/20200709-1/efe790876d9a9d916947685fd5c60adf.jpg', 1, 1, 0, 0, '', 273, '2020-07-18 23:42:28'),
(577, '2-5', NULL, '37913', 'https://tp.jializyw.com/upload/vod/20200709-1/3b259561c5e747f4a09982d6281633db.jpg', 'admin', '[韩国主播外流]胸型超好看的气质御姐！自慰棒94要一直插着一直爽！', 'https://video.jializyw.com:8800/20200708/CaILZNdr/index.m3u8', '752', NULL, NULL, 'https://tp.jializyw.com/upload/vod/20200709-1/3b259561c5e747f4a09982d6281633db.jpg', 1, 1, 0, 0, '', 273, '2020-07-18 23:42:28'),
(578, '2-5', NULL, '37912', 'https://tp.jializyw.com/upload/vod/20200709-1/f88ff80f65a09ccd6d9beb9e4cc08655.jpg', 'admin', '[欧美主播外流]独家整理，美女网红视讯辑，性感情趣热舞，假屌插穴自慰', 'https://video.jializyw.com:8800/20200708/yv7Wanrm/index.m3u8', '752', NULL, NULL, 'https://tp.jializyw.com/upload/vod/20200709-1/f88ff80f65a09ccd6d9beb9e4cc08655.jpg', 1, 1, 0, 0, '', 273, '2020-07-18 23:42:28'),
(579, '2-5', NULL, '37911', 'https://tp.jializyw.com/upload/vod/20200709-1/d53b1f818bbde94e893e1273ddedbe48.jpg', 'admin', '女主播与闺密直播自慰抬腿开鲍抠穴实在有够淫乱', 'https://video.jializyw.com:8800/20200708/1KnGMulL/index.m3u8', '752', NULL, NULL, 'https://tp.jializyw.com/upload/vod/20200709-1/d53b1f818bbde94e893e1273ddedbe48.jpg', 1, 1, 0, 0, '', 273, '2020-07-18 23:42:28'),
(580, '2-5', NULL, '37910', 'https://tp.jializyw.com/upload/vod/20200709-1/b2144da52a0890fe9466a4ea73f426f2.jpg', 'admin', '[人妻偷情愿望]超美素人妻系列秋吉みお年齢：26歳结婚历：1年', 'https://video.jializyw.com:8800/20200708/seVssF2b/index.m3u8', '752', NULL, NULL, 'https://tp.jializyw.com/upload/vod/20200709-1/b2144da52a0890fe9466a4ea73f426f2.jpg', 1, 1, 0, 0, '', 273, '2020-07-18 23:42:28'),
(581, '2-5', NULL, '37909', 'https://tp.jializyw.com/upload/vod/20200709-1/e1c07433e69e6bd413167138590cba72.jpg', 'admin', '[人妻偷情愿望]超美素人妻系列中野夏希年齢：26歳结婚历：1年', 'https://video.jializyw.com:8800/20200708/JfoaeOqT/index.m3u8', '752', NULL, NULL, 'https://tp.jializyw.com/upload/vod/20200709-1/e1c07433e69e6bd413167138590cba72.jpg', 1, 1, 0, 0, '', 273, '2020-07-18 23:42:28'),
(582, '2-5', NULL, '37908', 'https://tp.jializyw.com/upload/vod/20200709-1/5b3fd8b76be8332b383eaa4f3bfe10e7.jpg', 'admin', '[人妻偷情愿望]超美素人妻系列小川亚美年齢：32歳结婚历：7年', 'https://video.jializyw.com:8800/20200708/nzBDM4xu/index.m3u8', '752', NULL, NULL, 'https://tp.jializyw.com/upload/vod/20200709-1/5b3fd8b76be8332b383eaa4f3bfe10e7.jpg', 1, 1, 0, 0, '', 273, '2020-07-18 23:42:28'),
(583, '2-5', NULL, '37907', 'https://tp.jializyw.com/upload/vod/20200709-1/2a5c97fc9fdc8e560c135f0fac40f8c8.jpg', 'admin', '[人妻偷情愿望]超美素人妻系列上岛尚子年齢：32歳结婚历：8年', 'https://video.jializyw.com:8800/20200708/MQci9NOa/index.m3u8', '752', NULL, NULL, 'https://tp.jializyw.com/upload/vod/20200709-1/2a5c97fc9fdc8e560c135f0fac40f8c8.jpg', 1, 1, 0, 0, '', 273, '2020-07-18 23:42:28'),
(584, '2-5', NULL, '37906', 'https://tp.jializyw.com/upload/vod/20200709-1/186548f8f3b6c924a9fcf7c163f08380.jpg', 'admin', '[人妻偷情愿望]超美素人妻系列吉永塔子年齢：39歳结婚历：10年', 'https://video.jializyw.com:8800/20200708/9k5tT4Je/index.m3u8', '752', NULL, NULL, 'https://tp.jializyw.com/upload/vod/20200709-1/186548f8f3b6c924a9fcf7c163f08380.jpg', 1, 1, 0, 0, '', 273, '2020-07-18 23:42:28'),
(585, '2-5', NULL, '37905', 'https://tp.jializyw.com/upload/vod/20200709-1/527a996ce869fb06f7b1ca31d1b1ef1f.jpg', 'admin', '【自慰视讯外流】亚洲高颜值女主播为冲人气镜头前脱衣揉奶抬腿开鲍小手伸进内裤抠穴自慰白皙肌肤真想狂入', 'https://video.jializyw.com:8800/20200708/AYOlNCgi/index.m3u8', '752', NULL, NULL, 'https://tp.jializyw.com/upload/vod/20200709-1/527a996ce869fb06f7b1ca31d1b1ef1f.jpg', 1, 1, 0, 0, '', 273, '2020-07-18 23:42:28'),
(586, '2-5', NULL, '37904', 'https://tp.jializyw.com/upload/vod/20200709-1/225bfed251f0f8319bb08a85aca5a642.jpg', 'admin', '短发素人妹子直播上无码自拍玩电动按摩棒自慰还不时挑逗观众引诱犯罪', 'https://video.jializyw.com:8800/20200708/CUVD8bm0/index.m3u8', '752', NULL, NULL, 'https://tp.jializyw.com/upload/vod/20200709-1/225bfed251f0f8319bb08a85aca5a642.jpg', 1, 1, 0, 0, '', 273, '2020-07-18 23:42:28'),
(587, '2-5', NULL, '37903', 'https://tp.jializyw.com/upload/vod/20200709-1/2ec96ee4041c537ff95fb963be69cf22.jpg', 'admin', '性感主播在镜头前扭腰摆臀摆弄BB再随手拿棒棒插进下面摇了起来', 'https://video.jializyw.com:8800/20200708/hAUkMo61/index.m3u8', '752', NULL, NULL, 'https://tp.jializyw.com/upload/vod/20200709-1/2ec96ee4041c537ff95fb963be69cf22.jpg', 1, 1, 0, 0, '', 273, '2020-07-18 23:42:28'),
(588, '2-5', NULL, '37902', 'https://tp.jializyw.com/upload/vod/20200709-1/4fc17dacb27380d272923f4ab457a2b8.jpg', 'admin', '直播实况主为救低靡的人气直播自拍全脱露出丰满大奶白的让人想咬一口', 'https://video.jializyw.com:8800/20200708/EJXpya5b/index.m3u8', '752', NULL, NULL, 'https://tp.jializyw.com/upload/vod/20200709-1/4fc17dacb27380d272923f4ab457a2b8.jpg', 1, 1, 0, 0, '', 273, '2020-07-18 23:42:28'),
(589, '2-5', NULL, '37901', 'https://tp.jializyw.com/upload/vod/20200709-1/9ee52e93e0b28fbfcb7ce269a6185742.jpg', 'admin', '[中文主播外流]豪乳女神欲望棒模拟做爱', 'https://video.jializyw.com:8800/20200708/xlyaMTlE/index.m3u8', '752', NULL, NULL, 'https://tp.jializyw.com/upload/vod/20200709-1/9ee52e93e0b28fbfcb7ce269a6185742.jpg', 1, 1, 0, 0, '', 273, '2020-07-18 23:42:28'),
(590, '2-5', NULL, '37900', 'https://tp.jializyw.com/upload/vod/20200709-1/8ceb46e75adc487614fa9240c8f58622.jpg', 'admin', '[中文主播外流]颜值不错肥逼妹子全裸跳蛋自慰大号阳具抽插粉嫩小穴', 'https://video.jializyw.com:8800/20200708/zfAkGnT1/index.m3u8', '752', NULL, NULL, 'https://tp.jializyw.com/upload/vod/20200709-1/8ceb46e75adc487614fa9240c8f58622.jpg', 1, 1, 0, 0, '', 273, '2020-07-18 23:42:28'),
(591, '2-5', NULL, '37899', 'https://tp.jializyw.com/upload/vod/20200709-1/8390f8d900ab087ebca8c950f0cc927a.jpg', 'admin', '[中文主播外流]缺炮妹子一边跟哥哥聊天一边自慰，满足空虚的嫩穴', 'https://video.jializyw.com:8800/20200708/1JDOSSm1/index.m3u8', '752', NULL, NULL, 'https://tp.jializyw.com/upload/vod/20200709-1/8390f8d900ab087ebca8c950f0cc927a.jpg', 1, 1, 0, 0, '', 273, '2020-07-18 23:42:28'),
(592, '2-5', NULL, '37898', 'https://tp.jializyw.com/upload/vod/20200709-1/c1320338d1b6a7a62960a21dc809f75e.jpg', 'admin', '[韩国主播外流]韩国美女吃了春药床上自慰抬腿开鲍抠穴黑丝袜美腿极品好身材看起来不满足想要找人来抽插', 'https://video.jializyw.com:8800/20200708/BVhaukGa/index.m3u8', '752', NULL, NULL, 'https://tp.jializyw.com/upload/vod/20200709-1/c1320338d1b6a7a62960a21dc809f75e.jpg', 1, 1, 0, 0, '', 273, '2020-07-18 23:42:28');

-- --------------------------------------------------------

--
-- 表的结构 `yqm`
--

CREATE TABLE IF NOT EXISTS `yqm` (
  `id` int(11) NOT NULL COMMENT '主键id',
  `user_id` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '代理id',
  `yqm` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邀请码',
  `duration` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '时间',
  `name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '使用者',
  `status` varchar(3) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `yqm`
--

INSERT INTO `yqm` (`id`, `user_id`, `yqm`, `duration`, `name`, `status`, `create_time`, `update_time`) VALUES
(28, 'admin', '13aA5iX6', '2020-03-26 18:35:44', '13aA5iX6', '1', '2020-03-26 18:35:44', '2020-03-26 18:36:03'),
(29, 'admin', 'mQFJEj71', '2020-03-26 18:52:46', 'mQFJEj71', '1', '2020-03-26 18:52:46', '2020-03-26 18:53:06'),
(30, 'admin', 'SfNYWe5c', '2020-04-09 18:19:53', 'SfNYWe5c', '1', '2020-04-09 18:19:53', '2020-04-09 18:20:21'),
(31, 'admin', 'LwrXdgu8', '2020-06-07 10:58:36', 'LwrXdgu8', '1', '2020-06-07 10:58:36', '2020-06-08 17:43:36'),
(32, 'admin', 'e79EH63o', '2020-06-08 17:55:57', 'e79EH63o', '1', '2020-06-08 17:55:57', '2020-06-08 17:56:12'),
(33, 'admin', 'F6Si1pHp', '2020-06-08 17:57:52', 'F6Si1pHp', '1', '2020-06-08 17:57:52', '2020-06-08 17:58:20'),
(34, 'admin', '6fzuYVKL', '2020-06-08 18:27:47', '6fzuYVKL', '1', '2020-06-08 18:27:47', '2020-06-08 18:28:05'),
(35, 'admin', 'WNz9dKGm', '2020-06-08 18:30:37', 'WNz9dKGm', '1', '2020-06-08 18:30:37', '2020-06-08 18:31:02'),
(36, 'admin', '0K9FpDRK', '2020-06-08 18:35:44', '0K9FpDRK', '1', '2020-06-08 18:35:44', '2020-06-08 18:36:14'),
(37, 'admin', 'QC6JpwMg', '2020-06-20 22:15:41', 'QC6JpwMg', '1', '2020-06-20 22:15:42', '2020-06-20 22:16:05'),
(38, 'admin', 'i8NavF5U', '2020-06-26 18:36:36', 'i8NavF5U', '1', '2020-06-26 18:36:36', '2020-06-26 18:36:46'),
(39, 'admin', 'R4zrXRJc', '2020-06-26 18:41:19', 'R4zrXRJc', '1', '2020-06-26 18:41:19', '2020-06-26 18:41:31'),
(40, 'admin', 'LEd2A7Es', '2020-06-26 18:48:36', 'LEd2A7Es', '1', '2020-06-26 18:48:36', '2020-06-26 18:48:47'),
(41, 'admin', 'NzwclLm9', '2020-07-17 21:04:35', 'xiaocai', '1', '2020-07-17 21:04:35', '2020-07-17 21:05:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_index` (`account_id`) USING BTREE;

--
-- Indexes for table `account_detail`
--
ALTER TABLE `account_detail`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_index` (`account_id`) USING BTREE;

--
-- Indexes for table `enterprise_info`
--
ALTER TABLE `enterprise_info`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `gen_table`
--
ALTER TABLE `gen_table`
  ADD PRIMARY KEY (`table_id`) USING BTREE;

--
-- Indexes for table `gen_table_column`
--
ALTER TABLE `gen_table_column`
  ADD PRIMARY KEY (`column_id`) USING BTREE;

--
-- Indexes for table `qrtz_blob_triggers`
--
ALTER TABLE `qrtz_blob_triggers`
  ADD PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE;

--
-- Indexes for table `qrtz_calendars`
--
ALTER TABLE `qrtz_calendars`
  ADD PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE;

--
-- Indexes for table `qrtz_cron_triggers`
--
ALTER TABLE `qrtz_cron_triggers`
  ADD PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE;

--
-- Indexes for table `qrtz_fired_triggers`
--
ALTER TABLE `qrtz_fired_triggers`
  ADD PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE;

--
-- Indexes for table `qrtz_job_details`
--
ALTER TABLE `qrtz_job_details`
  ADD PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE;

--
-- Indexes for table `qrtz_locks`
--
ALTER TABLE `qrtz_locks`
  ADD PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE;

--
-- Indexes for table `qrtz_paused_trigger_grps`
--
ALTER TABLE `qrtz_paused_trigger_grps`
  ADD PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE;

--
-- Indexes for table `qrtz_scheduler_state`
--
ALTER TABLE `qrtz_scheduler_state`
  ADD PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE;

--
-- Indexes for table `qrtz_simple_triggers`
--
ALTER TABLE `qrtz_simple_triggers`
  ADD PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE;

--
-- Indexes for table `qrtz_simprop_triggers`
--
ALTER TABLE `qrtz_simprop_triggers`
  ADD PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE;

--
-- Indexes for table `qrtz_triggers`
--
ALTER TABLE `qrtz_triggers`
  ADD PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  ADD KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE;

--
-- Indexes for table `sys_category`
--
ALTER TABLE `sys_category`
  ADD PRIMARY KEY (`category_id`) USING BTREE;

--
-- Indexes for table `sys_config`
--
ALTER TABLE `sys_config`
  ADD PRIMARY KEY (`config_id`) USING BTREE;

--
-- Indexes for table `sys_dept`
--
ALTER TABLE `sys_dept`
  ADD PRIMARY KEY (`dept_id`) USING BTREE;

--
-- Indexes for table `sys_dict_data`
--
ALTER TABLE `sys_dict_data`
  ADD PRIMARY KEY (`dict_code`) USING BTREE;

--
-- Indexes for table `sys_dict_type`
--
ALTER TABLE `sys_dict_type`
  ADD PRIMARY KEY (`dict_id`) USING BTREE,
  ADD UNIQUE KEY `dict_type` (`dict_type`) USING BTREE;

--
-- Indexes for table `sys_job`
--
ALTER TABLE `sys_job`
  ADD PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE;

--
-- Indexes for table `sys_job_log`
--
ALTER TABLE `sys_job_log`
  ADD PRIMARY KEY (`job_log_id`) USING BTREE;

--
-- Indexes for table `sys_logininfor`
--
ALTER TABLE `sys_logininfor`
  ADD PRIMARY KEY (`info_id`) USING BTREE;

--
-- Indexes for table `sys_menu`
--
ALTER TABLE `sys_menu`
  ADD PRIMARY KEY (`menu_id`) USING BTREE;

--
-- Indexes for table `sys_notice`
--
ALTER TABLE `sys_notice`
  ADD PRIMARY KEY (`notice_id`) USING BTREE;

--
-- Indexes for table `sys_oper_log`
--
ALTER TABLE `sys_oper_log`
  ADD PRIMARY KEY (`oper_id`);

--
-- Indexes for table `sys_order`
--
ALTER TABLE `sys_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_post`
--
ALTER TABLE `sys_post`
  ADD PRIMARY KEY (`post_id`) USING BTREE;

--
-- Indexes for table `sys_role`
--
ALTER TABLE `sys_role`
  ADD PRIMARY KEY (`role_id`) USING BTREE;

--
-- Indexes for table `sys_role_dept`
--
ALTER TABLE `sys_role_dept`
  ADD PRIMARY KEY (`role_id`,`dept_id`) USING BTREE;

--
-- Indexes for table `sys_role_menu`
--
ALTER TABLE `sys_role_menu`
  ADD PRIMARY KEY (`role_id`,`menu_id`) USING BTREE;

--
-- Indexes for table `sys_short`
--
ALTER TABLE `sys_short`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_user`
--
ALTER TABLE `sys_user`
  ADD PRIMARY KEY (`user_id`) USING BTREE;

--
-- Indexes for table `sys_user_online`
--
ALTER TABLE `sys_user_online`
  ADD PRIMARY KEY (`sessionId`) USING BTREE;

--
-- Indexes for table `sys_user_post`
--
ALTER TABLE `sys_user_post`
  ADD PRIMARY KEY (`user_id`,`post_id`) USING BTREE;

--
-- Indexes for table `sys_user_role`
--
ALTER TABLE `sys_user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`) USING BTREE;

--
-- Indexes for table `sys_web_main`
--
ALTER TABLE `sys_web_main`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_wechat_config`
--
ALTER TABLE `sys_wechat_config`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_001` (`config_code`,`env_type`) USING BTREE;

--
-- Indexes for table `sys_wechat_token`
--
ALTER TABLE `sys_wechat_token`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `trade`
--
ALTER TABLE `trade`
  ADD PRIMARY KEY (`trade_no`);

--
-- Indexes for table `ts`
--
ALTER TABLE `ts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_user_detail`
--
ALTER TABLE `t_user_detail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `user_index` (`user_id`);

--
-- Indexes for table `t_wechat_auth`
--
ALTER TABLE `t_wechat_auth`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `open_id` (`open_id`),
  ADD KEY `user_index` (`user_id`),
  ADD KEY `open_id_index` (`open_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yqm`
--
ALTER TABLE `yqm`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21735;
--
-- AUTO_INCREMENT for table `account_detail`
--
ALTER TABLE `account_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=113968;
--
-- AUTO_INCREMENT for table `enterprise_info`
--
ALTER TABLE `enterprise_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gen_table`
--
ALTER TABLE `gen_table`
  MODIFY `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `gen_table_column`
--
ALTER TABLE `gen_table_column`
  MODIFY `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',AUTO_INCREMENT=187;
--
-- AUTO_INCREMENT for table `sys_category`
--
ALTER TABLE `sys_category`
  MODIFY `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类目id',AUTO_INCREMENT=274;
--
-- AUTO_INCREMENT for table `sys_config`
--
ALTER TABLE `sys_config`
  MODIFY `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `sys_dept`
--
ALTER TABLE `sys_dept`
  MODIFY `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',AUTO_INCREMENT=110;
--
-- AUTO_INCREMENT for table `sys_dict_data`
--
ALTER TABLE `sys_dict_data`
  MODIFY `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `sys_dict_type`
--
ALTER TABLE `sys_dict_type`
  MODIFY `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sys_job`
--
ALTER TABLE `sys_job`
  MODIFY `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sys_job_log`
--
ALTER TABLE `sys_job_log`
  MODIFY `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID';
--
-- AUTO_INCREMENT for table `sys_logininfor`
--
ALTER TABLE `sys_logininfor`
  MODIFY `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',AUTO_INCREMENT=179;
--
-- AUTO_INCREMENT for table `sys_menu`
--
ALTER TABLE `sys_menu`
  MODIFY `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',AUTO_INCREMENT=2103;
--
-- AUTO_INCREMENT for table `sys_notice`
--
ALTER TABLE `sys_notice`
  MODIFY `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sys_oper_log`
--
ALTER TABLE `sys_oper_log`
  MODIFY `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `sys_order`
--
ALTER TABLE `sys_order`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=339;
--
-- AUTO_INCREMENT for table `sys_post`
--
ALTER TABLE `sys_post`
  MODIFY `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sys_role`
--
ALTER TABLE `sys_role`
  MODIFY `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sys_short`
--
ALTER TABLE `sys_short`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `sys_user`
--
ALTER TABLE `sys_user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=135;
--
-- AUTO_INCREMENT for table `sys_web_main`
--
ALTER TABLE `sys_web_main`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sys_wechat_config`
--
ALTER TABLE `sys_wechat_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `sys_wechat_token`
--
ALTER TABLE `sys_wechat_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `ts`
--
ALTER TABLE `ts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `t_user_detail`
--
ALTER TABLE `t_user_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=319882;
--
-- AUTO_INCREMENT for table `t_wechat_auth`
--
ALTER TABLE `t_wechat_auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=319104;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=593;
--
-- AUTO_INCREMENT for table `yqm`
--
ALTER TABLE `yqm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',AUTO_INCREMENT=42;
--
-- 限制导出的表
--

--
-- 限制表 `qrtz_blob_triggers`
--
ALTER TABLE `qrtz_blob_triggers`
  ADD CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`);


