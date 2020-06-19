-- MySQL dump 10.17  Distrib 10.3.14-MariaDB, for osx10.14 (x86_64)
--
-- Host: localhost    Database: ruoyi
-- ------------------------------------------------------
-- Server version	10.3.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (21722,'SfNYWe5c',260,'1','2020-04-17 00:08:20','SYSTEM','2020-04-17 19:42:02','SYSTEM','PROMOTION_MERCHANT'),(21723,'admin',129,'1','2020-04-17 00:08:23','SYSTEM','2020-06-11 16:11:58','SYSTEM','PROMOTION_MERCHANT');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_detail`
--

DROP TABLE IF EXISTS `account_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_detail`
--

LOCK TABLES `account_detail` WRITE;
/*!40000 ALTER TABLE `account_detail` DISABLE KEYS */;
INSERT INTO `account_detail` VALUES (113878,'SfNYWe5c',80,'0','返利',NULL,'ORDER_REBATE','519858158357712896','2020-04-17 00:08:21','2020-04-17 00:08:21','SYSTEM'),(113879,'admin',40,'0','返利',NULL,'ORDER_AUTHOR_REBATE','519858158357712896','2020-04-17 00:08:23','2020-04-17 00:08:23','SYSTEM'),(113880,'SfNYWe5c',40,'0','返利',NULL,'ORDER_REBATE','520023351905751040','2020-04-17 10:51:10','2020-04-17 10:51:10','SYSTEM'),(113881,'admin',20,'0','返利',NULL,'ORDER_AUTHOR_REBATE','520023351905751040','2020-04-17 10:51:10','2020-04-17 10:51:10','SYSTEM'),(113882,'SfNYWe5c',80,'0','返利',NULL,'ORDER_REBATE','520026381040488448','2020-04-17 11:06:02','2020-04-17 11:06:02','SYSTEM'),(113883,'admin',40,'0','返利',NULL,'ORDER_AUTHOR_REBATE','520026381040488448','2020-04-17 11:06:03','2020-04-17 11:06:03','SYSTEM'),(113884,'SfNYWe5c',60,'0','返利',NULL,'ORDER_REBATE','520050611564056576','2020-04-17 19:42:02','2020-04-17 19:42:02','SYSTEM'),(113885,'admin',30,'0','返利',NULL,'ORDER_AUTHOR_REBATE','520050611564056576','2020-04-17 19:42:02','2020-04-17 19:42:02','SYSTEM'),(113886,'admin',0,'1',NULL,NULL,'WITHDRAW',NULL,'2020-06-11 15:26:33','2020-06-11 15:26:33','SYSTEM'),(113887,'admin',0,'1',NULL,NULL,'WITHDRAW',NULL,'2020-06-11 15:27:51','2020-06-11 15:27:51','SYSTEM'),(113888,'admin',0,'1',NULL,NULL,'WITHDRAW',NULL,'2020-06-11 15:30:57','2020-06-11 15:30:57','SYSTEM'),(113890,'admin',0,'1',NULL,NULL,'WITHDRAW','540035606181318656','2020-06-11 16:11:58','2020-06-11 16:11:58','SYSTEM');
/*!40000 ALTER TABLE `account_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_info`
--

DROP TABLE IF EXISTS `enterprise_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_info`
--

LOCK TABLES `enterprise_info` WRITE;
/*!40000 ALTER TABLE `enterprise_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (2,'enterprise_info','','EnterpriseInfo','crud','com.ruoyi.system','system','info',NULL,'ruoyi',NULL,'admin','2019-09-06 11:06:59','',NULL,NULL),(3,'account','','Account','crud','com.ruoyi.system','system','account',NULL,'ruoyi',NULL,'admin','2019-09-09 16:26:13','',NULL,NULL),(4,'account_detail','','AccountDetail','crud','com.ruoyi.system','system','detail',NULL,'ruoyi',NULL,'admin','2019-09-09 16:26:13','',NULL,NULL),(5,'ts','','Ts','crud','com.ruoyi.system','system','ts',NULL,'ruoyi',NULL,'admin','2020-03-17 12:15:09','',NULL,NULL),(7,'yqm','邀请码','Yqm','crud','com.ruoyi.system','system','yqm','邀请码管理','ruoyi','{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}','admin','2020-03-17 15:44:39','','2020-03-17 15:45:20','邀请码'),(8,'sys_category','类目表','SysCategory','crud','com.ruoyi.system','system','category','类目','ruoyi',NULL,'admin','2020-03-18 10:08:24','',NULL,NULL),(9,'shipin','公共片库','Shipin','crud','com.ruoyi.system','system','shipin','邀请码管理','ruoyi','{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}','admin','2020-03-19 21:45:16','','2020-03-19 21:45:49','create_time'),(11,'trade','','Trade','crud','com.ruoyi.system','system','trade',NULL,'ruoyi',NULL,'admin','2020-06-06 22:47:42','',NULL,NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (21,'2','id',NULL,'int(11)','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2019-09-06 11:06:59','',NULL),(22,'2','enterprise_name','企业名称	','varchar(120)','String','enterpriseName','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2019-09-06 11:06:59','',NULL),(23,'2','account_opening_date','开户日期	','datetime','Date','accountOpeningDate','0','0',NULL,'1','1','1','1','EQ','datetime','',3,'admin','2019-09-06 11:06:59','',NULL),(24,'2','sales_manager','销售经理','varchar(120)','String','salesManager','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2019-09-06 11:06:59','',NULL),(25,'2','payment_type','付费类型','varchar(120)','String','paymentType','0','0',NULL,'1','1','1','1','EQ','select','',5,'admin','2019-09-06 11:06:59','',NULL),(26,'2','status','企业状态','varchar(120)','String','status','0','0',NULL,'1','1','1','1','EQ','radio','',6,'admin','2019-09-06 11:06:59','',NULL),(27,'2','remarks','备注','varchar(120)','String','remarks','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2019-09-06 11:06:59','',NULL),(28,'2','enterprise_account','企业登录账号','varchar(120)','String','enterpriseAccount','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2019-09-06 11:06:59','',NULL),(29,'2','enterprise_password','企业登录密码','varchar(120)','String','enterprisePassword','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2019-09-06 11:06:59','',NULL),(30,'2','send_the_template','是否模板发送','varchar(120)','String','sendTheTemplate','0','0',NULL,'1','1','1','1','EQ','input','',10,'admin','2019-09-06 11:06:59','',NULL),(31,'2','sensitive_word_review','是否敏感词审核','varchar(120)','String','sensitiveWordReview','0','0',NULL,'1','1','1','1','EQ','input','',11,'admin','2019-09-06 11:06:59','',NULL),(32,'2','gmt_create','创建时间','datetime','Date','gmtCreate','0','0',NULL,'1','1','1','1','EQ','datetime','',12,'admin','2019-09-06 11:06:59','',NULL),(33,'2','gmt_modified','修改时间','datetime','Date','gmtModified','0','0',NULL,'1','1','1','1','EQ','datetime','',13,'admin','2019-09-06 11:06:59','',NULL),(34,'2','contact','联系人','varchar(120)','String','contact','0','0',NULL,'1','1','1','1','EQ','input','',14,'admin','2019-09-06 11:06:59','',NULL),(35,'2','contact_phone','联系人号码','varchar(120)','String','contactPhone','0','0',NULL,'1','1','1','1','EQ','input','',15,'admin','2019-09-06 11:06:59','',NULL),(36,'3','id',NULL,'int(11)','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2019-09-09 16:26:13','',NULL),(37,'3','account_id','账户唯一标识','varchar(32)','String','accountId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2019-09-09 16:26:13','',NULL),(38,'3','balance','余额','bigint(20)','Long','balance','0','0','1','1','1','1','1','EQ','input','',3,'admin','2019-09-09 16:26:13','',NULL),(39,'3','state','状态[1:启用,0:禁用]','varchar(22)','String','state','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2019-09-09 16:26:13','',NULL),(40,'3','gmt_create','创建时间','datetime','Date','gmtCreate','0','0','1','1','1','1','1','EQ','datetime','',5,'admin','2019-09-09 16:26:13','',NULL),(41,'3','create_by',NULL,'varchar(120)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',6,'admin','2019-09-09 16:26:13','',NULL),(42,'3','gmt_modified','修改时间','datetime','Date','gmtModified','0','0','1','1','1','1','1','EQ','datetime','',7,'admin','2019-09-09 16:26:13','',NULL),(43,'3','modified_by',NULL,'varchar(120)','String','modifiedBy','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2019-09-09 16:26:13','',NULL),(44,'3','account_type','账户类型','varchar(120)','String','accountType','0','0',NULL,'1','1','1','1','EQ','select','',9,'admin','2019-09-09 16:26:13','',NULL),(45,'4','id','主键','bigint(20)','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2019-09-09 16:26:13','',NULL),(46,'4','account_id','账户唯一id','varchar(120)','String','accountId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2019-09-09 16:26:13','',NULL),(47,'4','amount','金额 分为单位','bigint(20)','Long','amount','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2019-09-09 16:26:13','',NULL),(48,'4','opt_type','操作类型 [0:收入][1:支出]','varchar(20)','String','optType','0','0','1','1','1','1','1','EQ','select','',4,'admin','2019-09-09 16:26:13','',NULL),(49,'4','remark','描述','varchar(512)','String','remark','0','0',NULL,'1','1','1',NULL,'EQ','textarea','',5,'admin','2019-09-09 16:26:13','',NULL),(50,'4','out_trade_no','订单id','varchar(128)','String','outTradeNo','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2019-09-09 16:26:13','',NULL),(51,'4','biz_code','业务代码','varchar(120)','String','bizCode','0','0','1','1','1','1','1','EQ','input','',7,'admin','2019-09-09 16:26:13','',NULL),(52,'4','source_code','来源业务编码','varchar(120)','String','sourceCode','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2019-09-09 16:26:13','',NULL),(53,'4','gmt_create','创建时间','datetime','Date','gmtCreate','0','0',NULL,'1','1','1','1','EQ','datetime','',9,'admin','2019-09-09 16:26:13','',NULL),(54,'4','gmt_modified','修改时间','datetime','Date','gmtModified','0','0',NULL,'1','1','1','1','EQ','datetime','',10,'admin','2019-09-09 16:26:13','',NULL),(55,'4','operator',NULL,'varchar(120)','String','operator','0','0',NULL,'1','1','1','1','EQ','input','',11,'admin','2019-09-09 16:26:13','',NULL),(56,'5','id',NULL,'int(11)','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2020-03-17 12:15:09','',NULL),(57,'5','ip',NULL,'varchar(30)','String','ip','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2020-03-17 12:15:09','',NULL),(58,'5','zt',NULL,'varchar(10)','String','zt','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2020-03-17 12:15:09','',NULL),(59,'5','neirong',NULL,'varchar(120)','String','neirong','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2020-03-17 12:15:09','',NULL),(60,'5','shijian',NULL,'varchar(30)','String','shijian','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2020-03-17 12:15:09','',NULL),(61,'5','typeto',NULL,'varchar(30)','String','typeto','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2020-03-17 12:15:09','',NULL),(62,'5','sid',NULL,'int(11)','Long','sid','0','0','1','1','1','1','1','EQ','input','',7,'admin','2020-03-17 12:15:09','',NULL),(63,'5','userid',NULL,'varchar(30)','String','userid','0','0','1','1','1','1','1','EQ','input','',8,'admin','2020-03-17 12:15:09','',NULL),(81,'7','id','null','int(11)','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2020-03-17 15:44:39',NULL,'2020-03-17 15:45:20'),(82,'7','userid','null','varchar(10)','String','userid','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2020-03-17 15:44:39',NULL,'2020-03-17 15:45:20'),(83,'7','yqm','null','varchar(20)','String','yqm','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2020-03-17 15:44:39',NULL,'2020-03-17 15:45:20'),(84,'7','shijian','null','varchar(20)','String','shijian','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2020-03-17 15:44:39',NULL,'2020-03-17 15:45:20'),(85,'7','name','null','varchar(20)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',5,'admin','2020-03-17 15:44:39',NULL,'2020-03-17 15:45:20'),(86,'7','zt','null','varchar(3)','String','zt','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2020-03-17 15:44:39',NULL,'2020-03-17 15:45:20'),(87,'8','catecory_id','类目id','bigint(20)','Long','catecoryId','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2020-03-18 10:08:24','',NULL),(88,'8','parent_id','父类目id','bigint(20)','Long','parentId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2020-03-18 10:08:24','',NULL),(89,'8','ancestors','祖级列表','varchar(50)','String','ancestors','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2020-03-18 10:08:24','',NULL),(90,'8','catecory_name','类目名称','varchar(30)','String','catecoryName','0','0',NULL,'1','1','1','1','LIKE','input','',4,'admin','2020-03-18 10:08:24','',NULL),(91,'8','del_flag','删除标志（0代表存在 2代表删除）','char(1)','String','delFlag','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',5,'admin','2020-03-18 10:08:24','',NULL),(92,'8','create_by','创建者','varchar(64)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',6,'admin','2020-03-18 10:08:24','',NULL),(93,'8','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',7,'admin','2020-03-18 10:08:24','',NULL),(94,'8','update_by','更新者','varchar(64)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',8,'admin','2020-03-18 10:08:24','',NULL),(95,'8','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',9,'admin','2020-03-18 10:08:24','',NULL),(96,'9','id','null','int(11)','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2020-03-19 21:45:16',NULL,'2020-03-19 21:45:49'),(97,'9','money','资源设置的打赏金额','varchar(5)','String','money','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2020-03-19 21:45:16',NULL,'2020-03-19 21:45:49'),(98,'9','sj','选择模式 1为 开启随机金额分配','varchar(5)','String','sj','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2020-03-19 21:45:16',NULL,'2020-03-19 21:45:49'),(99,'9','cs','打赏人数','varchar(10)','String','cs','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2020-03-19 21:45:16',NULL,'2020-03-19 21:45:49'),(100,'9','url','打赏图片','varchar(120)','String','url','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2020-03-19 21:45:16',NULL,'2020-03-19 21:45:49'),(101,'9','userid','用户ID','varchar(10)','String','userid','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2020-03-19 21:45:16',NULL,'2020-03-19 21:45:49'),(102,'9','name','资源名称','varchar(50)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',7,'admin','2020-03-19 21:45:16',NULL,'2020-03-19 21:45:49'),(103,'9','zykey','null','varchar(50)','String','zykey','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2020-03-19 21:45:16',NULL,'2020-03-19 21:45:49'),(104,'9','shijian','null','varchar(20)','String','shijian','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2020-03-19 21:45:16',NULL,'2020-03-19 21:45:49'),(105,'9','lx','null','varchar(8)','String','lx','0','0',NULL,'1','1','1','1','EQ','input','',10,'admin','2020-03-19 21:45:16',NULL,'2020-03-19 21:45:49'),(106,'9','zt','null','varchar(5)','String','zt','0','0',NULL,'1','1','1','1','EQ','input','',11,'admin','2020-03-19 21:45:16',NULL,'2020-03-19 21:45:49'),(107,'9','logo','null','varchar(120)','String','logo','0','0','1','1','1','1','1','EQ','input','',12,'admin','2020-03-19 21:45:16',NULL,'2020-03-19 21:45:49'),(108,'9','is_lei','null','tinyint(1)','Integer','isLei','0','0','1','1','1','1','1','EQ','input','',13,'admin','2020-03-19 21:45:16',NULL,'2020-03-19 21:45:49'),(109,'9','is_allow','null','tinyint(1)','Integer','isAllow','0','0','1','1','1','1','1','EQ','input','',14,'admin','2020-03-19 21:45:16',NULL,'2020-03-19 21:45:49'),(110,'9','click','null','int(11)','Long','click','0','0','1','1','1','1','1','EQ','input','',15,'admin','2020-03-19 21:45:16',NULL,'2020-03-19 21:45:49'),(111,'9','is_preview','null','tinyint(1)','Integer','isPreview','0','0','1','1','1','1','1','EQ','input','',16,'admin','2020-03-19 21:45:16',NULL,'2020-03-19 21:45:49'),(112,'9','shorturl','短链','varchar(120)','String','shorturl','0','0',NULL,'1','1','1','1','EQ','input','',17,'admin','2020-03-19 21:45:16',NULL,'2020-03-19 21:45:49'),(113,'9','category_id','类目id','int(11)','Long','categoryId','0','0','1','1','1','1','1','EQ','input','',18,'admin','2020-03-19 21:45:16',NULL,'2020-03-19 21:45:49'),(114,'9','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',19,'admin','2020-03-19 21:45:16',NULL,'2020-03-19 21:45:49'),(131,'11','trade_no','交易号','varchar(32)','String','tradeNo','1','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2020-06-06 22:47:42','',NULL),(132,'11','payer_type','付款方类型','varchar(32)','String','payerType','0','0','1','1','1','1','1','EQ','select','',2,'admin','2020-06-06 22:47:42','',NULL),(133,'11','payer','付款方','varchar(32)','String','payer','0','0','1','1','1','1','1','EQ','input','',3,'admin','2020-06-06 22:47:42','',NULL),(134,'11','payee_type','收款方类型','varchar(32)','String','payeeType','0','0','1','1','1','1','1','EQ','select','',4,'admin','2020-06-06 22:47:42','',NULL),(135,'11','payee','收款方','varchar(32)','String','payee','0','0','1','1','1','1','1','EQ','input','',5,'admin','2020-06-06 22:47:42','',NULL),(136,'11','amount','金额','bigint(20)','Long','amount','0','0','1','1','1','1','1','EQ','input','',6,'admin','2020-06-06 22:47:42','',NULL),(137,'11','state','状态','varchar(32)','String','state','0','0','1','1','1','1','1','EQ','input','',7,'admin','2020-06-06 22:47:42','',NULL),(138,'11','category','交易分类','varchar(32)','String','category','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2020-06-06 22:47:42','',NULL),(139,'11','pay_type','支付方式','varchar(32)','String','payType','0','0','1','1','1','1','1','EQ','select','',9,'admin','2020-06-06 22:47:42','',NULL),(140,'11','third_trade_no','外部交易号','varchar(64)','String','thirdTradeNo','0','0',NULL,'1','1','1','1','EQ','input','',10,'admin','2020-06-06 22:47:42','',NULL),(141,'11','description','描述','varchar(512)','String','description','0','0',NULL,'1','1','1','1','EQ','textarea','',11,'admin','2020-06-06 22:47:42','',NULL),(142,'11','remark','标记','varchar(512)','String','remark','0','0',NULL,'1','1','1',NULL,'EQ','textarea','',12,'admin','2020-06-06 22:47:42','',NULL),(143,'11','gmt_create','创建时间','datetime','Date','gmtCreate','0','0','1','1','1','1','1','EQ','datetime','',13,'admin','2020-06-06 22:47:42','',NULL),(144,'11','create_by',NULL,'varchar(255)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',14,'admin','2020-06-06 22:47:42','',NULL),(145,'11','gmt_modified','修改时间','datetime','Date','gmtModified','0','0','1','1','1','1','1','EQ','datetime','',15,'admin','2020-06-06 22:47:42','',NULL),(146,'11','modified_by','修改人','varchar(255)','String','modifiedBy','0','0',NULL,'1','1','1','1','EQ','input','',16,'admin','2020-06-06 22:47:42','',NULL),(147,'11','createTime','创建时间','datetime','Date','createtime','0','0',NULL,'1','1','1','1','EQ','datetime','',17,'admin','2020-06-06 22:47:42','',NULL),(148,'11','payee_no','收款账号','varchar(100)','String','payeeNo','0','0',NULL,'1','1','1','1','EQ','input','',18,'admin','2020-06-06 22:47:42','',NULL);
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `blob_data` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `calendar_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `cron_expression` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `time_zone_id` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','0/10 * * * * ?','Asia/Shanghai'),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','0/15 * * * * ?','Asia/Shanghai'),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','0/20 * * * * ?','Asia/Shanghai');
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `job_data` blob DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT',NULL,'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution','0','1','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0com.ruoyi.quartz.domain.SysJob\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0\'com.ruoyi.common.core.domain.BaseEntity\0\0\0\0\0\0\0\0L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xpt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0b,�)�xpt\0\0pppt\01t\00/10 * * * * ?t\0ryTask.ryNoParamst\0DEFAULTsr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0系统默认（无参）t\03t\01x\0'),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT',NULL,'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution','0','1','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0com.ruoyi.quartz.domain.SysJob\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0\'com.ruoyi.common.core.domain.BaseEntity\0\0\0\0\0\0\0\0L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xpt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0b,�)�xpt\0\0pppt\01t\00/15 * * * * ?t\0ryTask.ryParams(\'ry\')t\0DEFAULTsr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0系统默认（有参）t\03t\01x\0'),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT',NULL,'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution','0','1','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0com.ruoyi.quartz.domain.SysJob\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0\'com.ruoyi.common.core.domain.BaseEntity\0\0\0\0\0\0\0\0L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xpt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0b,�)�xpt\0\0pppt\01t\00/20 * * * * ?t\08ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)t\0DEFAULTsr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0系统默认（多参）t\03t\01x\0');
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `lock_name` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler','STATE_ACCESS'),('RuoyiScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `instance_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler','sunflowerdeMacBook-Pro.local1591166871043',1591166968868,15000);
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `job_data` blob DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','TASK_CLASS_NAME1','DEFAULT',NULL,1591166880000,-1,5,'PAUSED','CRON',1591166871000,0,NULL,2,''),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','TASK_CLASS_NAME2','DEFAULT',NULL,1591166880000,-1,5,'PAUSED','CRON',1591166871000,0,NULL,2,''),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','TASK_CLASS_NAME3','DEFAULT',NULL,1591166880000,-1,5,'PAUSED','CRON',1591166871000,0,NULL,2,'');
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipin`
--

DROP TABLE IF EXISTS `shipin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `is_lei` tinyint(1) NOT NULL DEFAULT 1,
  `is_allow` tinyint(1) NOT NULL DEFAULT 1,
  `click` int(11) NOT NULL,
  `is_preview` tinyint(1) NOT NULL DEFAULT 0,
  `shorturl` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '短链',
  `category_id` int(11) NOT NULL COMMENT '类目id',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipin`
--

LOCK TABLES `shipin` WRITE;
/*!40000 ALTER TABLE `shipin` DISABLE KEYS */;
INSERT INTO `shipin` VALUES (15,'2-5',NULL,NULL,'http://ds.wx40q.com/profile/upload/2020/03/22/cbb5f62ae4a1e8b16c65e0493dce09e9.jpg','admin','admin','http://ds.wx40q.com/profile/upload/2020/03/22/091b1a733efb1e11b2493bacbcaa7fee.mp4','164',NULL,NULL,'/profile/upload/2020/03/22/cbb5f62ae4a1e8b16c65e0493dce09e9.jpg',1,1,146,0,'http://mrw.so/4GcFJR',204,'2020-03-22 21:05:49'),(20,'2-5',NULL,NULL,'http://ds.wx40q.com/profile/upload/2020/04/08/31367489fd0026fb837290e9a5822c91.jpeg','admin','lizhi','http://ds.wx40q.com/profile/upload/2020/04/08/5c9b24cdb3b4b090338fc88e9a56b4f8.mp4','38',NULL,NULL,'/profile/upload/2020/04/08/31367489fd0026fb837290e9a5822c91.jpeg',1,1,39,0,'',204,'2020-04-08 21:34:33'),(21,'22-25',NULL,NULL,'http://ds.wx40q.com/profile/upload/2020/04/08/a4b14ce4b9c6a00c8454d765dfcebf39.jpeg','admin','d','http://ds.wx40q.com/profile/upload/2020/04/08/9cbb682a340fe03e91d1ba0c2cc7ba41.mp4','38',NULL,NULL,'/profile/upload/2020/04/08/a4b14ce4b9c6a00c8454d765dfcebf39.jpeg',1,1,18,0,'',208,'2020-04-08 21:35:16'),(22,'2-5',NULL,NULL,'http://ds.wx40q.com/profile/upload/2020/04/10/cb5d6cd626ec1ab2dd51167390bf916f.jpeg','admin','xp0205','http://ds.wx40q.com/profile/upload/2020/04/10/598cb03c08e3d29df0175809dbbcf9ef.mp4','38',NULL,NULL,'/profile/upload/2020/04/10/cb5d6cd626ec1ab2dd51167390bf916f.jpeg',1,1,15,0,'',206,'2020-04-10 21:18:59'),(23,'2-5',NULL,NULL,'http://ds.wx40q.com/profile/upload/2020/04/10/a503e69ad64b127e0f715f469f8f91c1.jpeg','admin','admin','http://ds.wx40q.com/profile/upload/2020/04/10/6a72bd457d82fc85d3488a2425babd10.mp4','38',NULL,NULL,'/profile/upload/2020/04/10/a503e69ad64b127e0f715f469f8f91c1.jpeg',1,1,25,0,'',202,'2020-04-10 21:20:37'),(24,'2-5',NULL,NULL,'http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg','admin','adminl','http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4','33',NULL,NULL,'/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg',1,1,61,0,'',200,'2020-04-13 20:24:26');
/*!40000 ALTER TABLE `shipin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_category`
--

DROP TABLE IF EXISTS `sys_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类目id',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父类目id',
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_category`
--

LOCK TABLES `sys_category` WRITE;
/*!40000 ALTER TABLE `sys_category` DISABLE KEYS */;
INSERT INTO `sys_category` VALUES (100,0,'0','大类目',0,'0','0','admin','2018-03-16 11:33:00','admin','2020-03-20 18:15:37'),(200,100,'0,100','日韩',1,'0','0','admin','2020-03-18 13:22:50','admin','2020-03-20 18:14:38'),(201,200,'0,100,200','淑女',1,'0','2','admin','2020-03-18 13:33:05','admin','2020-03-20 13:59:45'),(202,100,'0,100','欧美',2,'0','0','admin','2020-03-20 18:07:35','admin','2020-03-20 18:15:07'),(203,100,'0,100','动物',3,'0','0','admin','2020-03-20 18:08:41','admin','2020-03-20 18:15:22'),(204,100,'0,100','幼女',4,'0','0','admin','2020-03-20 18:09:09','admin','2020-03-20 18:15:37'),(205,100,'0,100','乱伦',5,'0','0','admin','2020-03-20 18:15:53','',NULL),(206,100,'0,100','强奸',6,'0','0','admin','2020-03-20 18:16:11','',NULL),(207,100,'0,100','丝袜',7,'0','0','admin','2020-03-20 18:16:27','',NULL),(208,100,'0,100','破处',8,'0','0','admin','2020-03-20 18:16:42','',NULL),(209,200,'0,100,200','日韩',1,'0','2','admin','2020-03-20 18:18:20','',NULL),(210,202,'0,100,202','欧美',1,'0','2','admin','2020-03-20 18:18:34','',NULL),(211,203,'0,100,203','动物',1,'0','2','admin','2020-03-20 18:18:42','',NULL),(212,204,'0,100,204','幼女',1,'0','2','admin','2020-03-20 18:18:56','',NULL),(213,205,'0,100,205','乱论',1,'0','2','admin','2020-03-20 18:19:20','',NULL),(214,100,'0,100','待添加1',9,'0','0','admin','2020-03-20 18:26:16','',NULL),(215,100,'0,100','待添加2',10,'0','0','admin','2020-03-20 18:26:25','',NULL),(216,100,'0,100','待添加11',11,'0','0','admin','2020-03-20 18:26:33','',NULL),(217,100,'0,100','待添加12',12,'0','0','admin','2020-03-20 18:26:39','',NULL),(218,100,'0,100','待添加13',13,'0','0','admin','2020-03-20 18:26:46','',NULL),(219,100,'0,100','待添加14',14,'0','0','admin','2020-03-20 18:26:54','',NULL),(220,100,'0,100','待添加15',15,'0','0','admin','2020-03-20 18:27:01','',NULL),(221,100,'0,100','待添加16',16,'0','0','admin','2020-03-20 18:27:09','',NULL),(222,100,'0,100','待添加17',17,'0','0','admin','2020-03-20 18:27:16','',NULL),(223,100,'0,100','待添加18',18,'0','0','admin','2020-03-20 18:27:23','',NULL),(224,100,'0,100','待添加19',19,'0','0','admin','2020-03-20 18:27:30','',NULL),(225,100,'0,100','待添加20',20,'0','0','admin','2020-03-20 18:27:38','',NULL);
/*!40000 ALTER TABLE `sys_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','深色主题theme-dark，浅色主题theme-light'),(4,'代理返佣比例配置','sys.order.rebate','20','N','admin','2020-04-13 23:06:13','',NULL,NULL),(5,'视频作者返佣比例配置','sys.author.rebate','10','N','admin','2020-04-13 23:09:23','',NULL,NULL),(6,'支付交易类型','sys.tradeType','NATIVE','N','admin','2020-04-16 23:46:07','admin','2020-06-04 15:33:41',''),(7,'xxx','sys.aliPay.userId','2088512802560474','N','admin','2020-04-21 11:20:05','',NULL,NULL),(8,'','admin','{\"item\":[{\"id\":\"24\",\"price\":\"4\"},{\"id\":\"23\",\"price\":\"4\"},{\"id\":\"22\",\"price\":\"3\"}],\"main\":\"33\"}','N','admin','2020-06-12 00:11:44','','2020-06-12 13:15:59',NULL);
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8mb4_bin DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','admin','2020-03-18 15:49:09'),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','admin','2020-03-18 15:49:09'),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','2','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','admin','2020-03-18 15:49:09'),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','2','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','2','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','2','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','2','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','2','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT 0 COMMENT '字典排序',
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','关闭状态'),(18,1,'新增','1','sys_oper_type','','info','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','新增操作'),(19,2,'修改','2','sys_oper_type','','info','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','修改操作'),(20,3,'删除','3','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','删除操作'),(21,4,'授权','4','sys_oper_type','','primary','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','授权操作'),(22,5,'导出','5','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','导出操作'),(23,6,'导入','6','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','导入操作'),(24,7,'强退','7','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','强退操作'),(25,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','生成操作'),(26,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','清空操作'),(27,1,'成功','0','sys_common_status','','primary','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),(28,2,'失败','1','sys_common_status','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','停用状态'),(29,10,'查询','10','sys_oper_type',NULL,'info','Y','0','admin','2020-04-15 13:26:35','',NULL,'查询操作');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (1,'admin','223.167.134.52','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-10 21:17:55'),(2,'admin','223.167.134.52','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-10 21:38:26'),(3,'admin','223.167.134.52','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-10 21:57:49'),(4,'admin','223.167.134.52','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-11 14:07:35'),(5,'admin','223.167.134.52','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-11 14:26:31'),(6,'admin','47.57.90.50','加利福尼亚 圣克拉拉','Chrome 8','Mac OS X','0','登录成功','2020-04-13 11:53:49'),(7,'admin','47.57.90.50','加利福尼亚 圣克拉拉','Chrome 8','Mac OS X','0','登录成功','2020-04-13 12:12:32'),(8,'admin','223.73.80.240','广东 云浮','Apple WebKit','Mac OS X (iPhone)','0','登录成功','2020-04-13 12:21:18'),(9,'admin','47.57.90.50','加利福尼亚 圣克拉拉','Chrome 8','Mac OS X','0','登录成功','2020-04-13 12:50:59'),(10,'admin','47.57.90.50','加利福尼亚 圣克拉拉','Chrome 8','Mac OS X','0','登录成功','2020-04-13 14:26:36'),(11,'admin','47.57.90.50','XX XX','Chrome 8','Mac OS X','0','退出成功','2020-04-13 14:44:11'),(12,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-13 14:44:27'),(13,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','退出成功','2020-04-13 14:44:36'),(14,'SfNYWe5c','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-13 14:44:40'),(15,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-13 16:22:33'),(16,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-13 17:00:51'),(17,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-13 17:20:47'),(18,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-13 17:30:41'),(19,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-13 17:37:35'),(20,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-13 17:44:55'),(21,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-13 19:32:21'),(22,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-13 19:44:16'),(23,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-13 20:39:24'),(24,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-13 20:51:42'),(25,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-13 21:05:41'),(26,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','退出成功','2020-04-13 21:10:19'),(27,'SfNYWe5c','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-13 21:10:23'),(28,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-13 21:25:59'),(29,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-13 21:29:40'),(30,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-13 21:30:06'),(31,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','退出成功','2020-04-13 21:30:18'),(32,'SfNYWe5c','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-13 21:30:21'),(33,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-13 22:09:50'),(34,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-13 23:04:57'),(35,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-14 09:47:29'),(36,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-14 10:54:21'),(37,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-14 11:55:22'),(38,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-15 11:26:43'),(39,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-15 11:43:59'),(40,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-15 13:01:19'),(41,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-15 13:10:31'),(42,'admin','40.83.127.184','香港 XX','Chrome 8','Mac OS X','0','登录成功','2020-04-15 14:42:36'),(43,'admin','40.83.127.184','香港 XX','Chrome 8','Mac OS X','0','登录成功','2020-04-15 15:14:09'),(44,'admin','40.83.127.184','香港 XX','Chrome 8','Mac OS X','0','登录成功','2020-04-15 16:55:10'),(45,'admin','40.83.127.184','香港 XX','Chrome 8','Mac OS X','0','登录成功','2020-04-15 17:45:20'),(46,'admin','223.166.134.39','上海 上海','Chrome 8','Mac OS X','0','登录成功','2020-04-15 19:49:12'),(47,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-15 20:48:55'),(48,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-15 21:26:55'),(49,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-15 22:49:46'),(50,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-16 11:17:59'),(51,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-16 12:48:05'),(52,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-16 13:39:20'),(53,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-16 15:17:23'),(54,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-16 17:00:08'),(55,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-16 18:35:44'),(56,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-16 19:55:55'),(57,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-16 21:43:25'),(58,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-16 23:35:55'),(59,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-16 23:53:51'),(60,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-17 10:49:42'),(61,'admin','223.166.134.39','XX XX','Chrome 8','Mac OS X','0','登录成功','2020-04-17 11:07:54'),(62,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-20 17:42:56'),(63,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-21 11:19:40'),(64,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-24 23:08:13'),(65,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-04-25 19:57:12'),(66,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-05-04 16:31:58'),(67,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-01 18:08:37'),(68,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-04 15:08:46'),(69,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-05 13:26:03'),(70,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-05 14:08:48'),(71,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-05 15:01:04'),(72,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-05 15:03:46'),(73,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-05 16:27:12'),(74,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-05 18:03:19'),(75,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-05 21:32:19'),(76,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-06 21:46:20'),(77,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-07 10:46:09'),(78,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-07 15:53:59'),(79,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-07 19:34:05'),(80,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-07 20:22:45'),(81,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-07 22:02:00'),(82,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-07 22:17:19'),(83,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-08 11:27:39'),(84,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-08 13:39:29'),(85,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-08 15:43:02'),(86,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-08 17:42:45'),(87,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-06-08 17:42:58'),(88,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-08 17:55:46'),(89,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-06-08 17:56:02'),(90,'e79EH63o','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-08 17:57:08'),(91,'e79EH63o','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-06-08 17:57:40'),(92,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-08 17:57:44'),(93,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-06-08 17:57:57'),(94,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-08 18:27:37'),(95,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-06-08 18:27:50'),(96,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-08 18:30:08'),(97,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-06-08 18:30:41'),(98,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-08 18:35:33'),(99,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','退出成功','2020-06-08 18:35:50'),(100,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-08 19:12:09'),(101,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-08 21:30:43'),(102,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-08 21:45:59'),(103,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-08 21:57:34'),(104,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-09 13:07:47'),(105,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-11 15:26:07'),(106,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-11 16:01:52'),(107,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-11 21:28:30'),(108,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-11 23:04:04'),(109,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-12 00:09:03'),(110,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-12 00:10:27'),(111,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-12 07:47:49'),(112,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-12 08:49:34'),(113,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-12 10:44:47'),(114,'admin','127.0.0.1','内网IP','Chrome 8','Mac OS X','0','登录成功','2020-06-12 13:15:37');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
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
) ENGINE=InnoDB AUTO_INCREMENT=2101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'#','','M','0','','fa fa-gear','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统管理目录'),(2,'系统监控',0,2,'#','menuItem','M','0','','fa fa-video-camera','admin','2018-03-16 11:33:00','admin','2020-03-19 22:04:35','系统监控目录'),(3,'系统工具',0,3,'#','','M','0','','fa fa-bars','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统工具目录'),(100,'用户管理',1,1,'/system/user','menuItem','C','0','system:user:view','#','admin','2018-03-16 11:33:00','admin','2020-04-13 20:07:21','用户管理菜单'),(101,'角色管理',1,2,'/system/role','menuItem','C','0','system:role:view','#','admin','2018-03-16 11:33:00','admin','2020-03-23 22:33:10','角色管理菜单'),(102,'菜单管理',1,3,'/system/menu','','C','0','system:menu:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','菜单管理菜单'),(103,'部门管理',1,4,'/system/dept','menuItem','C','1','system:dept:view','#','admin','2018-03-16 11:33:00','admin','2020-03-23 20:30:27','部门管理菜单'),(104,'岗位管理',1,5,'/system/post','menuItem','C','1','system:post:view','#','admin','2018-03-16 11:33:00','admin','2020-03-23 20:30:50','岗位管理菜单'),(105,'字典管理',1,6,'/system/dict','menuItem','C','0','system:dict:view','#','admin','2018-03-16 11:33:00','admin','2020-04-15 13:23:50','字典管理菜单'),(106,'参数设置',1,7,'/system/config','','C','0','system:config:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','参数设置菜单'),(107,'通知公告',1,8,'/system/notice','menuItem','C','0','system:notice:view','#','admin','2018-03-16 11:33:00','admin','2020-06-11 16:11:12','通知公告菜单'),(108,'日志管理',1,9,'#','','M','0','','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','日志管理菜单'),(109,'在线用户',2,1,'/monitor/online','','C','0','monitor:online:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','在线用户菜单'),(110,'定时任务',2,2,'/monitor/job','','C','0','monitor:job:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','定时任务菜单'),(111,'数据监控',2,3,'/monitor/data','','C','0','monitor:data:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','数据监控菜单'),(112,'服务监控',2,3,'/monitor/server','','C','0','monitor:server:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','服务监控菜单'),(113,'表单构建',3,1,'/tool/build','','C','0','tool:build:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','表单构建菜单'),(114,'代码生成',3,2,'/tool/gen','','C','0','tool:gen:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','代码生成菜单'),(115,'系统接口',3,3,'/tool/swagger','','C','0','tool:swagger:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统接口菜单'),(500,'操作日志',108,1,'/monitor/operlog','','C','0','monitor:operlog:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','操作日志菜单'),(501,'登录日志',108,2,'/monitor/logininfor','','C','0','monitor:logininfor:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','登录日志菜单'),(1000,'用户查询',100,1,'#','','F','0','system:user:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1001,'用户新增',100,2,'#','','F','0','system:user:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1002,'用户修改',100,3,'#','','F','0','system:user:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1003,'用户删除',100,4,'#','','F','0','system:user:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1004,'用户导出',100,5,'#','','F','0','system:user:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1005,'用户导入',100,6,'#','','F','0','system:user:import','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1006,'重置密码',100,7,'#','','F','0','system:user:resetPwd','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1007,'角色查询',101,1,'#','','F','0','system:role:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1008,'角色新增',101,2,'#','','F','0','system:role:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1009,'角色修改',101,3,'#','','F','0','system:role:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1010,'角色删除',101,4,'#','','F','0','system:role:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1011,'角色导出',101,5,'#','','F','0','system:role:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1012,'菜单查询',102,1,'#','','F','0','system:menu:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1013,'菜单新增',102,2,'#','','F','0','system:menu:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1014,'菜单修改',102,3,'#','','F','0','system:menu:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1015,'菜单删除',102,4,'#','','F','0','system:menu:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1016,'部门查询',103,1,'#','','F','0','system:dept:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1017,'部门新增',103,2,'#','','F','0','system:dept:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1018,'部门修改',103,3,'#','','F','0','system:dept:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1019,'部门删除',103,4,'#','','F','0','system:dept:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1020,'岗位查询',104,1,'#','','F','0','system:post:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1021,'岗位新增',104,2,'#','','F','0','system:post:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1022,'岗位修改',104,3,'#','','F','0','system:post:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1023,'岗位删除',104,4,'#','','F','0','system:post:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1024,'岗位导出',104,5,'#','','F','0','system:post:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1025,'字典查询',105,1,'#','','F','0','system:dict:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1026,'字典新增',105,2,'#','','F','0','system:dict:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1027,'字典修改',105,3,'#','','F','0','system:dict:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1028,'字典删除',105,4,'#','','F','0','system:dict:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1029,'字典导出',105,5,'#','','F','0','system:dict:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1030,'参数查询',106,1,'#','','F','0','system:config:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1031,'参数新增',106,2,'#','','F','0','system:config:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1032,'参数修改',106,3,'#','','F','0','system:config:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1033,'参数删除',106,4,'#','','F','0','system:config:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1034,'参数导出',106,5,'#','','F','0','system:config:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1035,'公告查询',107,1,'#','','F','0','system:notice:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1036,'公告新增',107,2,'#','','F','0','system:notice:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1037,'公告修改',107,3,'#','','F','0','system:notice:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1038,'公告删除',107,4,'#','','F','0','system:notice:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1039,'操作查询',500,1,'#','','F','0','monitor:operlog:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1040,'操作删除',500,2,'#','','F','0','monitor:operlog:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1041,'详细信息',500,3,'#','','F','0','monitor:operlog:detail','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1042,'日志导出',500,4,'#','','F','0','monitor:operlog:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1043,'登录查询',501,1,'#','','F','0','monitor:logininfor:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1044,'登录删除',501,2,'#','','F','0','monitor:logininfor:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1045,'日志导出',501,3,'#','','F','0','monitor:logininfor:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1046,'在线查询',109,1,'#','','F','0','monitor:online:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1047,'批量强退',109,2,'#','','F','0','monitor:online:batchForceLogout','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1048,'单条强退',109,3,'#','','F','0','monitor:online:forceLogout','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1049,'任务查询',110,1,'#','','F','0','monitor:job:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1050,'任务新增',110,2,'#','','F','0','monitor:job:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1051,'任务修改',110,3,'#','','F','0','monitor:job:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1052,'任务删除',110,4,'#','','F','0','monitor:job:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1053,'状态修改',110,5,'#','','F','0','monitor:job:changeStatus','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1054,'任务详细',110,6,'#','','F','0','monitor:job:detail','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1055,'任务导出',110,7,'#','','F','0','monitor:job:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1056,'生成查询',114,1,'#','','F','0','tool:gen:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1057,'生成修改',114,2,'#','','F','0','tool:gen:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1058,'生成删除',114,3,'#','','F','0','tool:gen:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1059,'预览代码',114,4,'#','','F','0','tool:gen:preview','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1060,'生成代码',114,5,'#','','F','0','tool:gen:code','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(2001,'企业信息',1,2,'system/info','menuItem','C','1','','fa fa-asterisk','admin','2019-09-05 15:52:21','admin','2020-03-23 20:30:15',''),(2002,'投诉列表',1,1,'/system/ts','menuItem','C','0','system:ts:view','#','admin','2018-03-01 00:00:00','admin','2020-03-17 12:17:11','【请填写功能名称】菜单'),(2003,'【请填写功能名称】查询',2002,1,'#','','F','0','system:ts:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2004,'【请填写功能名称】新增',2002,2,'#','','F','0','system:ts:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2005,'【请填写功能名称】修改',2002,3,'#','','F','0','system:ts:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2006,'【请填写功能名称】删除',2002,4,'#','','F','0','system:ts:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2007,'公共片库',1,1,'/system/shipin','menuItem','C','0','system:shipin:view','#','admin','2018-03-01 00:00:00','admin','2020-03-17 12:40:14','公共片库菜单'),(2008,'公共片库查询',2007,1,'#','','F','0','system:shipin:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2009,'公共片库新增',2007,2,'#','','F','0','system:shipin:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2010,'公共片库修改',2007,3,'#','','F','0','system:shipin:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2011,'公共片库删除',2007,4,'#','','F','0','system:shipin:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2012,'邀请码管理',1,1,'/system/yqm','menuItem','C','0','system:yqm:view','#','admin','2018-03-01 00:00:00','admin','2020-03-17 16:16:38','邀请码管理菜单'),(2013,'邀请码管理查询',2012,1,'#','','F','0','system:yqm:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2014,'邀请码管理新增',2012,2,'#','','F','0','system:yqm:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2015,'邀请码管理修改',2012,3,'#','','F','0','system:yqm:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2016,'邀请码管理删除',2012,4,'#','','F','0','system:yqm:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2017,'类目管理',1,1,'/system/category','menuItem','C','0','system:category:view','#','admin','2018-03-01 00:00:00','admin','2020-03-18 10:47:36','类目菜单'),(2018,'类目查询',2017,1,'#','','F','0','system:category:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2019,'类目新增',2017,2,'#','','F','0','system:category:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2020,'类目修改',2017,3,'#','','F','0','system:category:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2021,'类目删除',2017,4,'#','','F','0','system:category:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2028,'链接管理',2083,1,'/system/short','menuItem','C','0','system:short:view','#','admin','2018-03-01 00:00:00','admin','2020-04-13 20:08:51','链接管理菜单'),(2029,'链接管理查询',2028,1,'#','','F','0','system:short:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2030,'链接管理新增',2028,2,'#','','F','0','system:short:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2031,'链接管理修改',2028,3,'#','','F','0','system:short:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2032,'链接管理删除',2028,4,'#','','F','0','system:short:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2033,'链接管理导出',2028,5,'#','','F','0','system:short:export','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2040,'域名管理',2083,1,'/system/webmain','menuItem','C','0','system:webmain:view','#','admin','2018-03-01 00:00:00','admin','2020-04-13 20:09:12','域名管理菜单'),(2041,'域名管理查询',2040,1,'#','','F','0','system:webmain:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2042,'域名管理新增',2040,2,'#','','F','0','system:webmain:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2043,'域名管理修改',2040,3,'#','','F','0','system:webmain:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2044,'域名管理删除',2040,4,'#','','F','0','system:webmain:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2045,'域名管理导出',2040,5,'#','','F','0','system:webmain:export','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2046,'公众号配置信息',2083,1,'/system/wechatConfig','menuItem','C','0','system:wechatConfig:view','#','admin','2018-03-01 00:00:00','admin','2020-04-13 20:09:29','公众号配置信息菜单'),(2047,'公众号配置信息查询',2046,1,'#','','F','0','system:wechatConfig:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2048,'公众号配置信息新增',2046,2,'#','','F','0','system:wechatConfig:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2049,'公众号配置信息修改',2046,3,'#','','F','0','system:wechatConfig:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2050,'公众号配置信息删除',2046,4,'#','','F','0','system:wechatConfig:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2051,'公众号配置信息导出',2046,5,'#','','F','0','system:wechatConfig:export','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2058,'订单列表',2082,1,'/system/sysOrder','menuItem','C','0','system:sysOrder:view','#','admin','2018-03-01 00:00:00','admin','2020-04-13 20:12:07','订单列表菜单'),(2059,'订单列表查询',2058,1,'#','','F','0','system:sysOrder:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2060,'订单列表新增',2058,2,'#','','F','0','system:sysOrder:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2061,'订单列表修改',2058,3,'#','','F','0','system:sysOrder:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2062,'订单列表删除',2058,4,'#','','F','0','system:sysOrder:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2063,'订单列表导出',2058,5,'#','','F','0','system:sysOrder:export','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2064,'账户管理',2082,1,'/system/account','menuItem','C','0','system:account:view','#','admin','2018-03-01 00:00:00','admin','2020-04-13 19:48:25','【请填写功能名称】菜单'),(2065,'【请填写功能名称】查询',2064,1,'#','','F','0','system:account:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2066,'【请填写功能名称】新增',2064,2,'#','','F','0','system:account:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2067,'【请填写功能名称】修改',2064,3,'#','','F','0','system:account:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2068,'【请填写功能名称】删除',2064,4,'#','','F','0','system:account:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2069,'【请填写功能名称】导出',2064,5,'#','','F','0','system:account:export','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2070,'平台用户',2082,1,'/system/wxuser','menuItem','C','0','system:wxuser:view','#','admin','2018-03-01 00:00:00','admin','2020-04-13 19:49:02','平台用户菜单'),(2071,'平台用户查询',2070,1,'#','','F','0','system:wxuser:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2072,'平台用户新增',2070,2,'#','','F','0','system:wxuser:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2073,'平台用户修改',2070,3,'#','','F','0','system:wxuser:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2074,'平台用户删除',2070,4,'#','','F','0','system:wxuser:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2075,'平台用户导出',2070,5,'#','','F','0','system:wxuser:export','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2076,'账户明细',2082,1,'/system/accountDetail','menuItem','C','0','system:accountDetail:view','#','admin','2018-03-01 00:00:00','admin','2020-04-13 19:47:25','账户明细菜单'),(2077,'账户明细查询',2076,1,'#','','F','0','system:accountDetail:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2078,'账户明细新增',2076,2,'#','','F','0','system:accountDetail:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2079,'账户明细修改',2076,3,'#','','F','0','system:accountDetail:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2080,'账户明细删除',2076,4,'#','','F','0','system:accountDetail:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2081,'账户明细导出',2076,5,'#','','F','0','system:accountDetail:export','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2082,'账务管理',1,1,'#','menuItem','M','0',NULL,'fa fa-asterisk','admin','2020-04-13 19:45:39','',NULL,''),(2083,'配置管理',0,2,'#','menuItem','M','0',NULL,'fa fa-arrows','admin','2020-04-13 20:08:11','',NULL,''),(2084,'授权信息',3,1,'/system/wxauth','','C','0','system:wxauth:view','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','授权信息菜单'),(2085,'授权信息查询',2084,1,'#','','F','0','system:wxauth:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2086,'授权信息新增',2084,2,'#','','F','0','system:wxauth:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2087,'授权信息修改',2084,3,'#','','F','0','system:wxauth:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2088,'授权信息删除',2084,4,'#','','F','0','system:wxauth:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2089,'授权信息导出',2084,5,'#','','F','0','system:wxauth:export','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2090,'打赏记录',1,1,'/statistics/record','menuItem','C','0','','#','admin','2020-06-05 13:26:31','admin','2020-06-05 13:50:36',''),(2091,'打赏统计',1,1,'/statistics/statistics','menuItem','C','0','','#','admin','2020-06-05 13:26:46','admin','2020-06-05 14:49:15',''),(2093,'申请提现',1,1,'/statistics/withdrawal/withdrawalRecord','menuItem','C','0','','#','admin','2020-06-05 16:27:48','admin','2020-06-07 11:14:29',''),(2094,'交易信息',1,1,'/system/trade','menuItem','C','0','system:trade:view','#','admin','2018-03-01 00:00:00','admin','2020-06-05 18:42:43','交易信息菜单'),(2095,'交易信息查询',2094,1,'#','','F','0','system:trade:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2096,'交易信息新增',2094,2,'#','','F','0','system:trade:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2097,'交易信息修改',2094,3,'#','','F','0','system:trade:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2098,'交易信息删除',2094,4,'#','','F','0','system:trade:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2099,'交易信息导出',2094,5,'#','','F','0','system:trade:export','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2100,'私人片库',1,1,'/system/shipin/pshipin','menuItem','C','0',NULL,'#','admin','2020-06-11 21:31:09','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2','新版本内容','1','admin','2018-03-16 11:33:00','admin','2020-06-11 16:11:22','管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1','维护内容','1','admin','2018-03-16 11:33:00','admin','2020-06-11 16:11:25','管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(120) COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (1,'操作日志',9,'com.ruoyi.web.controller.monitor.SysOperlogController.clean()','POST',1,'admin','研发部门','/monitor/operlog/clean','223.166.134.39','上海 上海','{ }','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-15 19:50:15'),(2,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','上海 上海','{\n  \"id\" : [ \"15\" ],\n  \"op\" : [ \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-15 20:04:12'),(3,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','上海 上海','{\n  \"id\" : [ \"23\" ],\n  \"op\" : [ \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-15 20:17:43'),(4,'前台类目首页',10,'com.ruoyi.web.controller.common.PronController.category()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/category','223.166.134.39','上海 上海','{\n  \"categoryId\" : [ \"206\" ]\n}','\"pron/category\"',0,NULL,'2020-04-15 20:17:52'),(5,'前台类目首页',10,'com.ruoyi.web.controller.common.PronController.category()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/category','223.166.134.39','XX XX','{\n  \"categoryId\" : [ \"206\" ]\n}','\"pron/category\"',0,NULL,'2020-04-15 20:42:40'),(6,'前台类目首页',10,'com.ruoyi.web.controller.common.PronController.category()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/category','223.166.134.39','XX XX','{\n  \"categoryId\" : [ \"200\" ]\n}','\"pron/category\"',0,NULL,'2020-04-15 20:42:56'),(7,'前台类目首页',10,'com.ruoyi.web.controller.common.PronController.category()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/category','223.166.134.39','XX XX','{\n  \"categoryId\" : [ \"216\" ]\n}','\"pron/category\"',0,NULL,'2020-04-15 20:42:59'),(8,'前台类目首页',10,'com.ruoyi.web.controller.common.PronController.category()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/category','223.166.134.39','XX XX','{\n  \"categoryId\" : [ \"202\" ]\n}','\"pron/category\"',0,NULL,'2020-04-15 20:43:19'),(9,'前台类目首页',10,'com.ruoyi.web.controller.common.PronController.category()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/category','223.166.134.39','XX XX','{\n  \"categoryId\" : [ \"206\" ]\n}','\"pron/category\"',0,NULL,'2020-04-15 20:50:22'),(10,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron','223.166.134.39','XX XX','{ }','\"redirect:http://ds.wx40q.com/pron/redirect?userid=\"',0,NULL,'2020-04-15 20:50:25'),(11,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron','223.166.134.39','XX XX','{ }','\"redirect:http://ds.wx40q.com/pron/redirect?userid=\"',0,NULL,'2020-04-15 20:50:27'),(12,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron','223.166.134.39','XX XX','{ }','\"redirect:http://ds.wx40q.com/pron/redirect?userid=\"',0,NULL,'2020-04-15 20:50:28'),(13,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron','223.166.134.39','XX XX','{ }','\"redirect:http://ds.wx40q.com/pron/redirect?userid=\"',0,NULL,'2020-04-15 20:50:28'),(14,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron','223.166.134.39','XX XX','{ }','\"redirect:http://ds.wx40q.com/pron/redirect?userid=\"',0,NULL,'2020-04-15 20:50:29'),(15,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron','223.166.134.39','XX XX','{ }','\"redirect:http://ds.wx40q.com/pron/redirect?userid=\"',0,NULL,'2020-04-15 20:50:29'),(16,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron','223.166.134.39','XX XX','{ }','\"redirect:http://ds.wx40q.com/pron/redirect?userid=\"',0,NULL,'2020-04-15 20:50:31'),(17,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"\" ],\n  \"op\" : [ \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\" ]\n}','\"pron/index\"',0,NULL,'2020-04-15 20:50:38'),(18,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw9nFv6sqnmmii2rwhbg1yXY',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 14:59:31'),(19,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw9nFv6sqnmmii2rwhbg1yXY',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 14:59:35'),(20,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw9nFv6sqnmmii2rwhbg1yXY',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-15 03:32:10\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-15 03:33:05\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 141,\n    \"orderId\" : \"519309083761709056\",\n    \"money\" : 400,\n    \"moneyStr\" : \"4.00\",\n    \"price\" : 400,\n    \"priceStr\" : \"4.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : \"wx15113217984823977a34ade31177666100\",\n    \"param\" : null,\n    \"payTime\" : 1586921580000,\n    \"payTag\" : \"4.00\",\n    \"status\" : 1,\n    \"statusStr\" : \"已支付\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":18,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw9nFv6sqnmmii2rwhbg1yXY\",\n    \"extensionUserId\" : null\n  }\n}',0,NULL,'2020-04-16 14:59:38'),(21,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw9nFv6sqnmmii2rwhbg1yXY',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"23\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 14:59:47'),(22,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw9nFv6sqnmmii2rwhbg1yXY',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"23\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 06:59:43\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 06:59:43\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 143,\n    \"orderId\" : \"519723706663047168\",\n    \"money\" : 400,\n    \"moneyStr\" : \"4.00\",\n    \"price\" : 400,\n    \"priceStr\" : \"4.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"4.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 23,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":202,\\\"click\\\":15,\\\"createTime\\\":1586524837000,\\\"id\\\":23,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/10/a503e69ad64b127e0f715f469f8f91c1.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"admin\\\",\\\"shijian\\\":\\\"38\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/a503e69ad64b127e0f715f469f8f91c1.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/6a72bd457d82fc85d3488a2425babd10.mp4\\\"}\",\n    \"openId\" : \"oE-QCw9nFv6sqnmmii2rwhbg1yXY\",\n    \"extensionUserId\" : null\n  }\n}',0,NULL,'2020-04-16 14:59:49'),(23,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1BX_3TiPLJ68bOs04KLmuQ',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ],\n  \"op\" : [ \"oE-QCw1BX_3TiPLJ68bOs04KLmuQ\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 15:41:26'),(24,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1BX_3TiPLJ68bOs04KLmuQ',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"20\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 15:43:50'),(25,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1BX_3TiPLJ68bOs04KLmuQ',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"20\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 07:43:47\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 07:43:47\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 144,\n    \"orderId\" : \"519734793684914176\",\n    \"money\" : 400,\n    \"moneyStr\" : \"4.00\",\n    \"price\" : 400,\n    \"priceStr\" : \"4.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"4.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 20,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":204,\\\"click\\\":37,\\\"createTime\\\":1586352873000,\\\"id\\\":20,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/08/31367489fd0026fb837290e9a5822c91.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"lizhi\\\",\\\"shijian\\\":\\\"38\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/08/31367489fd0026fb837290e9a5822c91.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/08/5c9b24cdb3b4b090338fc88e9a56b4f8.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1BX_3TiPLJ68bOs04KLmuQ\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 15:43:53'),(26,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1BX_3TiPLJ68bOs04KLmuQ',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"20\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 07:43:47\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 07:48:33\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 144,\n    \"orderId\" : \"519734793684914176\",\n    \"money\" : 400,\n    \"moneyStr\" : \"4.00\",\n    \"price\" : 400,\n    \"priceStr\" : \"4.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : \"wx1615491305769056f6987b7a1329688000\",\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"4.00\",\n    \"status\" : 2,\n    \"statusStr\" : \"支付中\",\n    \"goodsId\" : 20,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":204,\\\"click\\\":37,\\\"createTime\\\":1586352873000,\\\"id\\\":20,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/08/31367489fd0026fb837290e9a5822c91.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"lizhi\\\",\\\"shijian\\\":\\\"38\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/08/31367489fd0026fb837290e9a5822c91.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/08/5c9b24cdb3b4b090338fc88e9a56b4f8.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1BX_3TiPLJ68bOs04KLmuQ\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 15:48:44'),(27,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ],\n  \"op\" : [ \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 16:10:47'),(28,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"20\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 16:11:04'),(29,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"20\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 08:11:02\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 08:11:02\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 145,\n    \"orderId\" : \"519741651543920640\",\n    \"money\" : 300,\n    \"moneyStr\" : \"3.00\",\n    \"price\" : 300,\n    \"priceStr\" : \"3.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"3.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 20,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":204,\\\"click\\\":38,\\\"createTime\\\":1586352873000,\\\"id\\\":20,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/08/31367489fd0026fb837290e9a5822c91.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"lizhi\\\",\\\"shijian\\\":\\\"38\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/08/31367489fd0026fb837290e9a5822c91.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/08/5c9b24cdb3b4b090338fc88e9a56b4f8.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 16:11:08'),(30,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','101.89.239.232','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ],\n  \"op\" : [ \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 16:11:45'),(31,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 16:39:49'),(32,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 16:39:55'),(33,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-13 13:06:38\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-13 13:07:00\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 137,\n    \"orderId\" : \"518728880689778688\",\n    \"money\" : 200,\n    \"moneyStr\" : \"2.00\",\n    \"price\" : 200,\n    \"priceStr\" : \"2.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : \"wx13210737492229f98e9dbf481219624800\",\n    \"param\" : null,\n    \"payTime\" : 1586783220000,\n    \"payTag\" : \"2.00\",\n    \"status\" : 1,\n    \"statusStr\" : \"已支付\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":4,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 16:39:58'),(34,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 16:40:10'),(35,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 16:40:14'),(36,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"22\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 16:40:20'),(37,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"22\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 08:40:16\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 08:40:16\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 146,\n    \"orderId\" : \"519749009699508224\",\n    \"money\" : 300,\n    \"moneyStr\" : \"3.00\",\n    \"price\" : 300,\n    \"priceStr\" : \"3.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"3.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 22,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":206,\\\"click\\\":6,\\\"createTime\\\":1586524739000,\\\"id\\\":22,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/10/cb5d6cd626ec1ab2dd51167390bf916f.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"xp0205\\\",\\\"shijian\\\":\\\"38\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/cb5d6cd626ec1ab2dd51167390bf916f.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/598cb03c08e3d29df0175809dbbcf9ef.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 16:40:22'),(38,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"22\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 08:40:16\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 08:40:16\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 146,\n    \"orderId\" : \"519749009699508224\",\n    \"money\" : 300,\n    \"moneyStr\" : \"3.00\",\n    \"price\" : 300,\n    \"priceStr\" : \"3.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"3.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 22,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":206,\\\"click\\\":6,\\\"createTime\\\":1586524739000,\\\"id\\\":22,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/10/cb5d6cd626ec1ab2dd51167390bf916f.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"xp0205\\\",\\\"shijian\\\":\\\"38\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/cb5d6cd626ec1ab2dd51167390bf916f.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/598cb03c08e3d29df0175809dbbcf9ef.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 16:44:27'),(39,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 16:59:22'),(40,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"20\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 16:59:44'),(41,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"20\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 08:11:02\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 08:19:02\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 145,\n    \"orderId\" : \"519741651543920640\",\n    \"money\" : 300,\n    \"moneyStr\" : \"3.00\",\n    \"price\" : 300,\n    \"priceStr\" : \"3.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : 1587025140000,\n    \"payTag\" : \"3.00\",\n    \"status\" : 1,\n    \"statusStr\" : \"已支付\",\n    \"goodsId\" : 20,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":204,\\\"click\\\":38,\\\"createTime\\\":1586352873000,\\\"id\\\":20,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/08/31367489fd0026fb837290e9a5822c91.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"lizhi\\\",\\\"shijian\\\":\\\"38\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/08/31367489fd0026fb837290e9a5822c91.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/08/5c9b24cdb3b4b090338fc88e9a56b4f8.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 16:59:50'),(42,'订单列表',3,'com.ruoyi.web.controller.system.SysOrderController.remove()','POST',1,'admin','研发部门','/system/sysOrder/remove','223.166.134.39','XX XX','{\n  \"ids\" : [ \"146,145,144,143,142,141,140,139,138,137\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 17:00:33'),(43,'【账户删除】',3,'com.ruoyi.web.controller.system.AccountController.remove()','POST',1,'admin','研发部门','/system/account/remove','223.166.134.39','XX XX','{\n  \"ids\" : [ \"21715\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 17:00:47'),(44,'【账户删除】',3,'com.ruoyi.web.controller.system.AccountController.remove()','POST',1,'admin','研发部门','/system/account/remove','223.166.134.39','XX XX','{\n  \"ids\" : [ \"21716\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 17:00:49'),(45,'账户明细',3,'com.ruoyi.web.controller.system.AccountDetailController.remove()','POST',1,'admin','研发部门','/system/accountDetail/remove','223.166.134.39','XX XX','{\n  \"ids\" : [ \"113850,113851,113852,113853,113854,113855,113856,113857,113858,113859\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 17:01:00'),(46,'账户明细',3,'com.ruoyi.web.controller.system.AccountDetailController.remove()','POST',1,'admin','研发部门','/system/accountDetail/remove','223.166.134.39','XX XX','{\n  \"ids\" : [ \"113860,113861,113862,113863,113864\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 17:01:03'),(47,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 17:01:13'),(48,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 17:01:16'),(49,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 09:01:12\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 09:01:12\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 147,\n    \"orderId\" : \"519754279368527872\",\n    \"money\" : 300,\n    \"moneyStr\" : \"3.00\",\n    \"price\" : 300,\n    \"priceStr\" : \"3.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"3.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":24,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 17:01:19'),(50,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'oE-QCw9nFv6sqnmmii2rwhbg1yXY',NULL,'/pron','223.166.134.39','XX XX','{ }','\"redirect:http://ds.wx40q.com/pron/redirect?userid=\"',0,NULL,'2020-04-16 17:40:13'),(51,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw9nFv6sqnmmii2rwhbg1yXY',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 17:40:16'),(52,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw9nFv6sqnmmii2rwhbg1yXY',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 17:40:23'),(53,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw9nFv6sqnmmii2rwhbg1yXY',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 17:40:23'),(54,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw9nFv6sqnmmii2rwhbg1yXY',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 09:40:19\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 09:40:19\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 148,\n    \"orderId\" : \"519764122884116480\",\n    \"money\" : 400,\n    \"moneyStr\" : \"4.00\",\n    \"price\" : 400,\n    \"priceStr\" : \"4.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"4.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":26,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw9nFv6sqnmmii2rwhbg1yXY\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 17:40:25'),(55,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1BX_3TiPLJ68bOs04KLmuQ',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 18:31:44'),(56,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1BX_3TiPLJ68bOs04KLmuQ',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 18:31:53'),(57,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1BX_3TiPLJ68bOs04KLmuQ',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 10:31:50\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 10:31:50\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 149,\n    \"orderId\" : \"519777086576005120\",\n    \"money\" : 400,\n    \"moneyStr\" : \"4.00\",\n    \"price\" : 400,\n    \"priceStr\" : \"4.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"4.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":27,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1BX_3TiPLJ68bOs04KLmuQ\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 18:31:56'),(58,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"\" ],\n  \"op\" : [ \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 18:32:28'),(59,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 18:32:32'),(60,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 09:01:12\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 09:02:00\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 147,\n    \"orderId\" : \"519754279368527872\",\n    \"money\" : 300,\n    \"moneyStr\" : \"3.00\",\n    \"price\" : 300,\n    \"priceStr\" : \"3.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : 1587027720000,\n    \"payTag\" : \"3.00\",\n    \"status\" : 1,\n    \"statusStr\" : \"已支付\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":24,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 18:32:37'),(61,'前台类目首页',10,'com.ruoyi.web.controller.common.PronController.category()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/category','223.166.134.39','XX XX','{\n  \"categoryId\" : [ \"202\" ]\n}','\"pron/category\"',0,NULL,'2020-04-16 18:32:41'),(62,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"23\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 18:32:46'),(63,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"23\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 10:32:43\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 10:32:43\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 150,\n    \"orderId\" : \"519777306755993600\",\n    \"money\" : 400,\n    \"moneyStr\" : \"4.00\",\n    \"price\" : 400,\n    \"priceStr\" : \"4.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"4.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 23,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":202,\\\"click\\\":16,\\\"createTime\\\":1586524837000,\\\"id\\\":23,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/10/a503e69ad64b127e0f715f469f8f91c1.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"admin\\\",\\\"shijian\\\":\\\"38\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/a503e69ad64b127e0f715f469f8f91c1.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/6a72bd457d82fc85d3488a2425babd10.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 18:32:49'),(64,'订单列表',3,'com.ruoyi.web.controller.system.SysOrderController.remove()','POST',1,'admin','研发部门','/system/sysOrder/remove','223.166.134.39','XX XX','{\n  \"ids\" : [ \"150,149,148,147\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 18:35:58'),(65,'【账户删除】',3,'com.ruoyi.web.controller.system.AccountController.remove()','POST',1,'admin','研发部门','/system/account/remove','223.166.134.39','XX XX','{\n  \"ids\" : [ \"21718\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 18:36:07'),(66,'【账户删除】',3,'com.ruoyi.web.controller.system.AccountController.remove()','POST',1,'admin','研发部门','/system/account/remove','223.166.134.39','XX XX','{\n  \"ids\" : [ \"21717\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 18:36:10'),(67,'账户明细',3,'com.ruoyi.web.controller.system.AccountDetailController.remove()','POST',1,'admin','研发部门','/system/accountDetail/remove','223.166.134.39','XX XX','{\n  \"ids\" : [ \"113865,113866,113867,113868,113869,113870,113871,113872\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 18:36:19'),(68,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1BX_3TiPLJ68bOs04KLmuQ',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 18:36:32'),(69,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1BX_3TiPLJ68bOs04KLmuQ',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 18:36:38'),(70,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1BX_3TiPLJ68bOs04KLmuQ',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 10:36:35\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 10:36:35\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 151,\n    \"orderId\" : \"519778282837643264\",\n    \"money\" : 300,\n    \"moneyStr\" : \"3.00\",\n    \"price\" : 300,\n    \"priceStr\" : \"3.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"3.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":29,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1BX_3TiPLJ68bOs04KLmuQ\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 18:36:41'),(71,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1BX_3TiPLJ68bOs04KLmuQ',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 18:57:25'),(72,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1BX_3TiPLJ68bOs04KLmuQ',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"23\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 18:57:30'),(73,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1BX_3TiPLJ68bOs04KLmuQ',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"23\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 10:57:27\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 10:57:27\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 152,\n    \"orderId\" : \"519783533124784128\",\n    \"money\" : 200,\n    \"moneyStr\" : \"2.00\",\n    \"price\" : 200,\n    \"priceStr\" : \"2.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"2.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 23,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":202,\\\"click\\\":17,\\\"createTime\\\":1586524837000,\\\"id\\\":23,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/10/a503e69ad64b127e0f715f469f8f91c1.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"admin\\\",\\\"shijian\\\":\\\"38\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/a503e69ad64b127e0f715f469f8f91c1.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/6a72bd457d82fc85d3488a2425babd10.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1BX_3TiPLJ68bOs04KLmuQ\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 18:57:33'),(74,'订单列表',3,'com.ruoyi.web.controller.system.SysOrderController.remove()','POST',1,'admin','研发部门','/system/sysOrder/remove','223.166.134.39','XX XX','{\n  \"ids\" : [ \"152\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 21:43:43'),(75,'订单列表',3,'com.ruoyi.web.controller.system.SysOrderController.remove()','POST',1,'admin','研发部门','/system/sysOrder/remove','223.166.134.39','XX XX','{\n  \"ids\" : [ \"151\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 21:43:45'),(76,'【账户删除】',3,'com.ruoyi.web.controller.system.AccountController.remove()','POST',1,'admin','研发部门','/system/account/remove','223.166.134.39','XX XX','{\n  \"ids\" : [ \"21719\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 21:43:52'),(77,'【账户删除】',3,'com.ruoyi.web.controller.system.AccountController.remove()','POST',1,'admin','研发部门','/system/account/remove','223.166.134.39','XX XX','{\n  \"ids\" : [ \"21720\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 21:43:54'),(78,'账户明细',3,'com.ruoyi.web.controller.system.AccountDetailController.remove()','POST',1,'admin','研发部门','/system/accountDetail/remove','223.166.134.39','XX XX','{\n  \"ids\" : [ \"113873,113874,113875,113876\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 21:44:05'),(79,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 21:44:21'),(80,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 21:44:29'),(81,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 13:44:26\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 13:44:26\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 153,\n    \"orderId\" : \"519825556275990528\",\n    \"money\" : 200,\n    \"moneyStr\" : \"2.00\",\n    \"price\" : 200,\n    \"priceStr\" : \"2.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"2.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":30,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : null\n  }\n}',0,NULL,'2020-04-16 21:44:33'),(82,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 13:44:26\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 13:44:32\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 153,\n    \"orderId\" : \"519825556275990528\",\n    \"money\" : 200,\n    \"moneyStr\" : \"2.00\",\n    \"price\" : 200,\n    \"priceStr\" : \"2.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"2.00\",\n    \"status\" : 2,\n    \"statusStr\" : \"支付中\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":30,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : null\n  }\n}',0,NULL,'2020-04-16 21:44:44'),(83,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'oE-QCw8fkoCzw5hNbH_fur4qIgdg',NULL,'/pron','120.239.133.150','XX XX','{\n  \"op\" : [ \"oE-QCw8fkoCzw5hNbH_fur4qIgdg\" ]\n}','\"redirect:http://ds.wx40q.com/pron/redirect?userid=\"',0,NULL,'2020-04-16 21:47:03'),(84,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw8fkoCzw5hNbH_fur4qIgdg',NULL,'/pron/redirect','120.239.133.150','XX XX','{\n  \"userid\" : [ \"\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 21:47:03'),(85,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw8fkoCzw5hNbH_fur4qIgdg',NULL,'/pron/detail','120.239.133.150','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 21:47:19'),(86,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw8fkoCzw5hNbH_fur4qIgdg',NULL,'/pron/queryOrder','120.239.133.150','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 13:47:16\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 13:47:16\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 154,\n    \"orderId\" : \"519826269198618624\",\n    \"money\" : 300,\n    \"moneyStr\" : \"3.00\",\n    \"price\" : 300,\n    \"priceStr\" : \"3.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"3.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":31,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw8fkoCzw5hNbH_fur4qIgdg\",\n    \"extensionUserId\" : null\n  }\n}',0,NULL,'2020-04-16 21:47:22'),(87,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'oE-QCw8fkoCzw5hNbH_fur4qIgdg',NULL,'/pron','120.239.133.150','XX XX','{ }','\"redirect:http://ds.wx40q.com/pron/redirect?userid=\"',0,NULL,'2020-04-16 21:47:55'),(88,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw8fkoCzw5hNbH_fur4qIgdg',NULL,'/pron/redirect','120.239.133.150','XX XX','{\n  \"userid\" : [ \"\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 21:47:56'),(89,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw8fkoCzw5hNbH_fur4qIgdg',NULL,'/pron/detail','120.239.133.150','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 21:48:07'),(90,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw8fkoCzw5hNbH_fur4qIgdg',NULL,'/pron/queryOrder','120.239.133.150','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 13:47:16\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 13:47:43\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 154,\n    \"orderId\" : \"519826269198618624\",\n    \"money\" : 300,\n    \"moneyStr\" : \"3.00\",\n    \"price\" : 300,\n    \"priceStr\" : \"3.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"3.00\",\n    \"status\" : 2,\n    \"statusStr\" : \"支付中\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":31,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw8fkoCzw5hNbH_fur4qIgdg\",\n    \"extensionUserId\" : null\n  }\n}',0,NULL,'2020-04-16 21:48:16'),(91,'订单列表',3,'com.ruoyi.web.controller.system.SysOrderController.remove()','POST',1,'admin','研发部门','/system/sysOrder/remove','223.166.134.39','XX XX','{\n  \"ids\" : [ \"154,153\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 22:02:34'),(92,'【账户删除】',3,'com.ruoyi.web.controller.system.AccountController.remove()','POST',1,'admin','研发部门','/system/account/remove','223.166.134.39','XX XX','{\n  \"ids\" : [ \"21721\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 22:02:41'),(93,'账户明细',3,'com.ruoyi.web.controller.system.AccountDetailController.remove()','POST',1,'admin','研发部门','/system/accountDetail/remove','223.166.134.39','XX XX','{\n  \"ids\" : [ \"113877\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 22:02:51'),(94,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 22:06:17'),(95,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 22:06:21'),(96,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ],\n  \"op\" : [ \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 22:16:13'),(97,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 22:16:26'),(98,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 14:16:29\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 14:16:29\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 155,\n    \"orderId\" : \"519833621821919232\",\n    \"money\" : 200,\n    \"moneyStr\" : \"2.00\",\n    \"price\" : 200,\n    \"priceStr\" : \"2.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"2.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":34,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 22:16:35'),(99,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 22:19:09'),(100,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 22:19:14'),(101,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 14:16:29\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 14:16:33\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 155,\n    \"orderId\" : \"519833621821919232\",\n    \"money\" : 200,\n    \"moneyStr\" : \"2.00\",\n    \"price\" : 200,\n    \"priceStr\" : \"2.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"2.00\",\n    \"status\" : 2,\n    \"statusStr\" : \"支付中\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":34,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 22:19:28'),(102,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 23:32:12'),(103,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 23:32:22'),(104,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 14:16:29\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 14:19:24\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 155,\n    \"orderId\" : \"519833621821919232\",\n    \"money\" : 200,\n    \"moneyStr\" : \"2.00\",\n    \"price\" : 200,\n    \"priceStr\" : \"2.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"2.00\",\n    \"status\" : 2,\n    \"statusStr\" : \"支付中\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":34,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 23:32:28'),(105,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 23:35:20'),(106,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 23:35:27'),(107,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 14:16:29\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 14:19:24\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 155,\n    \"orderId\" : \"519833621821919232\",\n    \"money\" : 200,\n    \"moneyStr\" : \"2.00\",\n    \"price\" : 200,\n    \"priceStr\" : \"2.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"2.00\",\n    \"status\" : 2,\n    \"statusStr\" : \"支付中\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":34,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 23:35:29'),(108,'订单列表',3,'com.ruoyi.web.controller.system.SysOrderController.remove()','POST',1,'admin','研发部门','/system/sysOrder/remove','223.166.134.39','XX XX','{\n  \"ids\" : [ \"155\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 23:38:43'),(109,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 15:38:46\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 15:38:46\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 156,\n    \"orderId\" : \"519854328819748864\",\n    \"money\" : 200,\n    \"moneyStr\" : \"2.00\",\n    \"price\" : 200,\n    \"priceStr\" : \"2.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"2.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":37,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 23:38:52'),(110,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 23:40:20'),(111,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 15:38:46\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 15:39:06\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 156,\n    \"orderId\" : \"519854328819748864\",\n    \"money\" : 200,\n    \"moneyStr\" : \"2.00\",\n    \"price\" : 200,\n    \"priceStr\" : \"2.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : \"wx16233946351366152b4365581792485500\",\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"2.00\",\n    \"status\" : 2,\n    \"statusStr\" : \"支付中\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":37,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 23:40:24'),(112,'参数管理',1,'com.ruoyi.web.controller.system.SysConfigController.addSave()','POST',1,'admin','研发部门','/system/config/add','223.166.134.39','XX XX','{\n  \"configName\" : [ \"支付交易类型\" ],\n  \"configKey\" : [ \"sys.tradetype\" ],\n  \"configValue\" : [ \"JSAPI\" ],\n  \"configType\" : [ \"N\" ],\n  \"remark\" : [ \"\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 23:46:13'),(113,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.editSave()','POST',1,'admin','研发部门','/system/config/edit','223.166.134.39','XX XX','{\n  \"configId\" : [ \"6\" ],\n  \"configName\" : [ \"支付交易类型\" ],\n  \"configKey\" : [ \"sys.tradeType\" ],\n  \"configValue\" : [ \"JSAPI\" ],\n  \"configType\" : [ \"N\" ],\n  \"remark\" : [ \"\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 23:46:29'),(114,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.editSave()','POST',1,'admin','研发部门','/system/config/edit','223.166.134.39','XX XX','{\n  \"configId\" : [ \"6\" ],\n  \"configName\" : [ \"支付交易类型\" ],\n  \"configKey\" : [ \"sys.tradeType\" ],\n  \"configValue\" : [ \"NATIVE\" ],\n  \"configType\" : [ \"N\" ],\n  \"remark\" : [ \"\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 23:48:47'),(115,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ]\n}','\"pron/index\"',0,NULL,'2020-04-16 23:53:08'),(116,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-16 23:53:12'),(117,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 15:38:46\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 15:43:38\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 156,\n    \"orderId\" : \"519854328819748864\",\n    \"money\" : 200,\n    \"moneyStr\" : \"2.00\",\n    \"price\" : 200,\n    \"priceStr\" : \"2.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : \"wx16234418215482152b4365581091310800\",\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"2.00\",\n    \"status\" : 2,\n    \"statusStr\" : \"支付中\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":37,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 23:53:19'),(118,'订单列表',3,'com.ruoyi.web.controller.system.SysOrderController.remove()','POST',1,'admin','研发部门','/system/sysOrder/remove','223.166.134.39','XX XX','{\n  \"ids\" : [ \"156\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-16 23:53:59'),(119,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 15:53:59\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 15:53:59\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 157,\n    \"orderId\" : \"519858158357712896\",\n    \"money\" : 400,\n    \"moneyStr\" : \"4.00\",\n    \"price\" : 400,\n    \"priceStr\" : \"4.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"4.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":39,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-16 23:54:05'),(120,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ]\n}','\"pron/index\"',0,NULL,'2020-04-17 00:01:51'),(121,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-17 00:02:04'),(122,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 15:53:59\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 15:54:01\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 157,\n    \"orderId\" : \"519858158357712896\",\n    \"money\" : 400,\n    \"moneyStr\" : \"4.00\",\n    \"price\" : 400,\n    \"priceStr\" : \"4.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"4.00\",\n    \"status\" : 2,\n    \"statusStr\" : \"支付中\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":39,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-17 00:02:10'),(123,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ]\n}','\"pron/index\"',0,NULL,'2020-04-17 00:06:25'),(124,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-17 00:06:29'),(125,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 15:53:59\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 16:02:08\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 157,\n    \"orderId\" : \"519858158357712896\",\n    \"money\" : 400,\n    \"moneyStr\" : \"4.00\",\n    \"price\" : 400,\n    \"priceStr\" : \"4.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"4.00\",\n    \"status\" : 2,\n    \"statusStr\" : \"支付中\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":39,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-17 00:06:33'),(126,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 15:53:59\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 16:06:29\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 157,\n    \"orderId\" : \"519858158357712896\",\n    \"money\" : 400,\n    \"moneyStr\" : \"4.00\",\n    \"price\" : 400,\n    \"priceStr\" : \"4.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"4.00\",\n    \"status\" : 2,\n    \"statusStr\" : \"支付中\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":39,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-17 00:08:10'),(127,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ],\n  \"op\" : [ \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\" ]\n}','\"pron/index\"',0,NULL,'2020-04-17 10:49:22'),(128,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-17 10:49:29'),(129,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-16 15:53:59\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-16 16:08:19\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 157,\n    \"orderId\" : \"519858158357712896\",\n    \"money\" : 400,\n    \"moneyStr\" : \"4.00\",\n    \"price\" : 400,\n    \"priceStr\" : \"4.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : 1587053298000,\n    \"payTag\" : \"4.00\",\n    \"status\" : 1,\n    \"statusStr\" : \"已支付\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":39,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-17 10:49:54'),(130,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ]\n}','\"pron/index\"',0,NULL,'2020-04-17 10:50:18'),(131,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-17 10:50:24'),(132,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"23\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-17 10:50:28'),(133,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"23\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-17 02:50:24\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-17 02:50:24\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 158,\n    \"orderId\" : \"520023351905751040\",\n    \"money\" : 200,\n    \"moneyStr\" : \"2.00\",\n    \"price\" : 200,\n    \"priceStr\" : \"2.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"2.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 23,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":202,\\\"click\\\":18,\\\"createTime\\\":1586524837000,\\\"id\\\":23,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/10/a503e69ad64b127e0f715f469f8f91c1.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"admin\\\",\\\"shijian\\\":\\\"38\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/a503e69ad64b127e0f715f469f8f91c1.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/6a72bd457d82fc85d3488a2425babd10.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-17 10:50:30'),(134,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ]\n}','\"pron/index\"',0,NULL,'2020-04-17 10:54:10'),(135,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"23\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-17 10:56:29'),(136,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ]\n}','\"pron/index\"',0,NULL,'2020-04-17 11:02:11'),(137,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"22\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-17 11:02:28'),(138,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"22\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-17 03:02:27\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-17 03:02:26\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 159,\n    \"orderId\" : \"520026381040488448\",\n    \"money\" : 400,\n    \"moneyStr\" : \"4.00\",\n    \"price\" : 400,\n    \"priceStr\" : \"4.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"4.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 22,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":206,\\\"click\\\":7,\\\"createTime\\\":1586524739000,\\\"id\\\":22,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/10/cb5d6cd626ec1ab2dd51167390bf916f.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"xp0205\\\",\\\"shijian\\\":\\\"38\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/cb5d6cd626ec1ab2dd51167390bf916f.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/598cb03c08e3d29df0175809dbbcf9ef.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-17 11:02:33'),(139,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1BX_3TiPLJ68bOs04KLmuQ',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"SfNYWe5c\" ]\n}','\"pron/index\"',0,NULL,'2020-04-17 11:50:29'),(140,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1BX_3TiPLJ68bOs04KLmuQ',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"15\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-17 11:50:52'),(141,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1BX_3TiPLJ68bOs04KLmuQ',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"15\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-17 03:50:51\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-17 03:50:51\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 160,\n    \"orderId\" : \"520038563929133056\",\n    \"money\" : 200,\n    \"moneyStr\" : \"2.00\",\n    \"price\" : 200,\n    \"priceStr\" : \"2.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"2.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 15,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":204,\\\"click\\\":144,\\\"createTime\\\":1584882349000,\\\"id\\\":15,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/03/22/cbb5f62ae4a1e8b16c65e0493dce09e9.jpg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"admin\\\",\\\"shijian\\\":\\\"164\\\",\\\"shorturl\\\":\\\"http://mrw.so/4GcFJR\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/03/22/cbb5f62ae4a1e8b16c65e0493dce09e9.jpg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/03/22/091b1a733efb1e11b2493bacbcaa7fee.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1BX_3TiPLJ68bOs04KLmuQ\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-17 11:50:58'),(142,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/redirect','223.166.134.39','XX XX','{\n  \"userid\" : [ \"\" ]\n}','\"pron/index\"',0,NULL,'2020-04-17 12:38:34'),(143,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/detail','223.166.134.39','XX XX','{\n  \"id\" : [ \"15\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-17 12:38:44'),(144,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'oE-QCw1sLCEA19BxvtPFnaVKmzJg',NULL,'/pron/queryOrder','223.166.134.39','XX XX','{\n  \"id\" : [ \"15\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-17 04:38:43\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-17 04:38:43\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 161,\n    \"orderId\" : \"520050611564056576\",\n    \"money\" : 300,\n    \"moneyStr\" : \"3.00\",\n    \"price\" : 300,\n    \"priceStr\" : \"3.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"3.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 15,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":204,\\\"click\\\":145,\\\"createTime\\\":1584882349000,\\\"id\\\":15,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/03/22/cbb5f62ae4a1e8b16c65e0493dce09e9.jpg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"admin\\\",\\\"shijian\\\":\\\"164\\\",\\\"shorturl\\\":\\\"http://mrw.so/4GcFJR\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/03/22/cbb5f62ae4a1e8b16c65e0493dce09e9.jpg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/03/22/091b1a733efb1e11b2493bacbcaa7fee.mp4\\\"}\",\n    \"openId\" : \"oE-QCw1sLCEA19BxvtPFnaVKmzJg\",\n    \"extensionUserId\" : \"SfNYWe5c\"\n  }\n}',0,NULL,'2020-04-17 12:38:50'),(145,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,NULL,NULL,'/pron','127.0.0.1','内网IP','{ }','\"redirect:http://ds.wx40q.com/pron/redirect?userid=\"',0,NULL,'2020-04-20 17:42:38'),(146,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'admin','研发部门','/pron','127.0.0.1','内网IP','{ }','\"redirect:http://ds.wx40q.com/pron/redirect?userid=\"',0,NULL,'2020-04-20 17:43:17'),(147,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'admin','研发部门','/pron','127.0.0.1','内网IP','{ }','\"redirect:http://ds.wx40q.com/pron/redirect?userid=\"',0,NULL,'2020-04-20 17:43:35'),(148,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'admin','研发部门','/pron','127.0.0.1','内网IP','{ }','\"redirect:http://ds.wx40q.com/pron/redirect?userid=\"',0,NULL,'2020-04-20 17:45:20'),(149,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'admin','研发部门','/pron/','127.0.0.1','内网IP','{ }','\"redirect:http://ds.wx40q.com/pron/redirect?userid=\"',0,NULL,'2020-04-20 17:47:56'),(150,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'admin','研发部门','/pron/','127.0.0.1','内网IP','{ }','\"redirect:http://ds.wx40q.com/pron/redirect?userid=\"',0,NULL,'2020-04-20 17:52:06'),(151,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'admin','研发部门','/pron','127.0.0.1','内网IP','{ }','\"redirect:http://ds.wx40q.com/pron/redirect?userid=\"',0,NULL,'2020-04-20 18:00:00'),(152,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'admin','研发部门','/pron','127.0.0.1','内网IP','{ }','\"pron/index\"',0,NULL,'2020-04-20 18:04:29'),(153,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'admin','研发部门','/pron/detail','127.0.0.1','内网IP','{\n  \"id\" : [ \"23\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-20 18:07:37'),(154,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'admin','研发部门','/pron/queryOrder','127.0.0.1','内网IP','{\n  \"id\" : [ \"23\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-20 10:07:39\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-20 10:07:39\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 162,\n    \"orderId\" : \"521220551641927680\",\n    \"money\" : 200,\n    \"moneyStr\" : \"2.00\",\n    \"price\" : 200,\n    \"priceStr\" : \"2.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"2.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 23,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":202,\\\"click\\\":20,\\\"createTime\\\":1586524837000,\\\"id\\\":23,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/10/a503e69ad64b127e0f715f469f8f91c1.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"admin\\\",\\\"shijian\\\":\\\"38\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/a503e69ad64b127e0f715f469f8f91c1.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/6a72bd457d82fc85d3488a2425babd10.mp4\\\"}\",\n    \"openId\" : \"x\",\n    \"extensionUserId\" : \"x\"\n  }\n}',0,NULL,'2020-04-20 18:07:39'),(155,'域名管理',3,'com.ruoyi.web.controller.system.SysWebMainController.remove()','POST',1,'admin','研发部门','/system/webmain/remove','127.0.0.1','内网IP','{\n  \"ids\" : [ \"2\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-20 18:21:10'),(156,'域名管理',3,'com.ruoyi.web.controller.system.SysWebMainController.remove()','POST',1,'admin','研发部门','/system/webmain/remove','127.0.0.1','内网IP','{\n  \"ids\" : [ \"3\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-20 18:21:12'),(157,'域名管理',2,'com.ruoyi.web.controller.system.SysWebMainController.editSave()','POST',1,'admin','研发部门','/system/webmain/edit','127.0.0.1','内网IP','{\n  \"id\" : [ \"7\" ],\n  \"mainUrl\" : [ \"http://127.0.0.1:9999\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-20 18:21:35'),(158,'域名管理',3,'com.ruoyi.web.controller.system.SysWebMainController.remove()','POST',1,'admin','研发部门','/system/webmain/remove','127.0.0.1','内网IP','{\n  \"ids\" : [ \"6\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-20 18:21:39'),(159,'域名管理',3,'com.ruoyi.web.controller.system.SysWebMainController.remove()','POST',1,'admin','研发部门','/system/webmain/remove','127.0.0.1','内网IP','{\n  \"ids\" : [ \"5\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-20 18:21:41'),(160,'域名管理',3,'com.ruoyi.web.controller.system.SysWebMainController.remove()','POST',1,'admin','研发部门','/system/webmain/remove','127.0.0.1','内网IP','{\n  \"ids\" : [ \"4\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-20 18:21:42'),(161,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'admin','研发部门','/pron','127.0.0.1','内网IP','{ }','\"pron/index\"',0,NULL,'2020-04-20 18:21:49'),(162,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'admin','研发部门','/pron','127.0.0.1','内网IP','{ }','\"pron/index\"',0,NULL,'2020-04-20 18:21:51'),(163,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'admin','研发部门','/pron','127.0.0.1','内网IP','{ }','\"pron/index\"',0,NULL,'2020-04-20 18:21:54'),(164,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'x',NULL,'/pron','127.0.0.1','内网IP','{ }','\"pron/index\"',0,NULL,'2020-04-20 18:56:22'),(165,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'x',NULL,'/pron/detail','127.0.0.1','内网IP','{\n  \"id\" : [ \"22\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-20 18:56:29'),(166,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'x',NULL,'/pron/queryOrder','127.0.0.1','内网IP','{\n  \"id\" : [ \"22\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-20 10:57:58\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-20 10:57:58\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 163,\n    \"orderId\" : \"521233215503994880\",\n    \"money\" : 200,\n    \"moneyStr\" : \"2.00\",\n    \"price\" : 200,\n    \"priceStr\" : \"2.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"2.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 22,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":206,\\\"click\\\":8,\\\"createTime\\\":1586524739000,\\\"id\\\":22,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/10/cb5d6cd626ec1ab2dd51167390bf916f.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"xp0205\\\",\\\"shijian\\\":\\\"38\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/cb5d6cd626ec1ab2dd51167390bf916f.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/598cb03c08e3d29df0175809dbbcf9ef.mp4\\\"}\",\n    \"openId\" : \"x\",\n    \"extensionUserId\" : \"x\"\n  }\n}',0,NULL,'2020-04-20 18:57:58'),(167,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'x',NULL,'/pron/queryOrder','127.0.0.1','内网IP','{\n  \"id\" : [ \"22\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-20 10:57:58\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-20 10:57:58\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 163,\n    \"orderId\" : \"521233215503994880\",\n    \"money\" : 200,\n    \"moneyStr\" : \"2.00\",\n    \"price\" : 200,\n    \"priceStr\" : \"2.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"2.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 22,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":206,\\\"click\\\":8,\\\"createTime\\\":1586524739000,\\\"id\\\":22,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/10/cb5d6cd626ec1ab2dd51167390bf916f.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"xp0205\\\",\\\"shijian\\\":\\\"38\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/cb5d6cd626ec1ab2dd51167390bf916f.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/598cb03c08e3d29df0175809dbbcf9ef.mp4\\\"}\",\n    \"openId\" : \"x\",\n    \"extensionUserId\" : \"x\"\n  }\n}',0,NULL,'2020-04-20 18:58:02'),(168,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'x',NULL,'/pron/','127.0.0.1','内网IP','{ }','\"pron/index\"',0,NULL,'2020-04-21 11:17:51'),(169,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'x',NULL,'/pron/detail','127.0.0.1','内网IP','{\n  \"id\" : [ \"23\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-21 11:17:54'),(170,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'x',NULL,'/pron/queryOrder','127.0.0.1','内网IP','{\n  \"id\" : [ \"23\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-21 03:17:57\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-21 03:17:57\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 164,\n    \"orderId\" : \"521479833629233152\",\n    \"money\" : 400,\n    \"moneyStr\" : \"4.00\",\n    \"price\" : 400,\n    \"priceStr\" : \"4.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"4.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 23,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":202,\\\"click\\\":21,\\\"createTime\\\":1586524837000,\\\"id\\\":23,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/10/a503e69ad64b127e0f715f469f8f91c1.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"admin\\\",\\\"shijian\\\":\\\"38\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/a503e69ad64b127e0f715f469f8f91c1.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/6a72bd457d82fc85d3488a2425babd10.mp4\\\"}\",\n    \"openId\" : \"1\",\n    \"extensionUserId\" : \"x\"\n  }\n}',0,NULL,'2020-04-21 11:17:57'),(171,'参数管理',1,'com.ruoyi.web.controller.system.SysConfigController.addSave()','POST',1,'admin','研发部门','/system/config/add','127.0.0.1','内网IP','{\n  \"configName\" : [ \"xxx\" ],\n  \"configKey\" : [ \"sys.aliPay.userId\" ],\n  \"configValue\" : [ \"2088512802560474\" ],\n  \"configType\" : [ \"N\" ],\n  \"remark\" : [ \"\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-21 11:20:05'),(172,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.editSave()','POST',1,'admin','研发部门','/system/config/edit','127.0.0.1','内网IP','{\n  \"configId\" : [ \"6\" ],\n  \"configName\" : [ \"支付交易类型\" ],\n  \"configKey\" : [ \"sys.tradeType\" ],\n  \"configValue\" : [ \"--NATIVE\" ],\n  \"configType\" : [ \"N\" ],\n  \"remark\" : [ \"\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-21 11:24:13'),(173,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'admin','研发部门','/pron','127.0.0.1','内网IP','{ }','\"pron/index\"',0,NULL,'2020-04-21 11:24:24'),(174,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'admin','研发部门','/pron/detail','127.0.0.1','内网IP','{\n  \"id\" : [ \"22\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-21 11:24:25'),(175,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'admin','研发部门','/pron/queryOrder','127.0.0.1','内网IP','{\n  \"id\" : [ \"22\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-21 03:24:28\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-21 03:24:28\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 165,\n    \"orderId\" : \"521481475435008000\",\n    \"money\" : 400,\n    \"moneyStr\" : \"4.00\",\n    \"price\" : 400,\n    \"priceStr\" : \"4.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"4.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 22,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":206,\\\"click\\\":9,\\\"createTime\\\":1586524739000,\\\"id\\\":22,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/10/cb5d6cd626ec1ab2dd51167390bf916f.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"xp0205\\\",\\\"shijian\\\":\\\"38\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/cb5d6cd626ec1ab2dd51167390bf916f.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/10/598cb03c08e3d29df0175809dbbcf9ef.mp4\\\"}\",\n    \"openId\" : \"1\",\n    \"extensionUserId\" : \"x\"\n  }\n}',0,NULL,'2020-04-21 11:24:28'),(176,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'x',NULL,'/pron','127.0.0.1','内网IP','{ }','\"pron/index\"',0,NULL,'2020-04-21 18:11:11'),(177,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'x',NULL,'/pron/detail','127.0.0.1','内网IP','{\n  \"id\" : [ \"22\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-21 18:11:12'),(178,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'x',NULL,'/pron/queryOrder','127.0.0.1','内网IP','{\n  \"id\" : [ \"22\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-21 03:24:28\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-21 03:24:28\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 165,\n    \"orderId\" : \"521481475435008000\",\n    \"money\" : 400,\n    \"moneyStr\" : \"4.00\",\n    \"price\" : 400,\n    \"priceStr\" : \"4.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"4.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 22,\n    \"goodsSnapshot\" : null,\n    \"openId\" : \"1\",\n    \"extensionUserId\" : \"x\"\n  }\n}',0,NULL,'2020-04-21 18:11:14'),(179,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'x',NULL,'/pron/detail','127.0.0.1','内网IP','{\n  \"id\" : [ \"22\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-21 18:28:58'),(180,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'x',NULL,'/pron/queryOrder','127.0.0.1','内网IP','{\n  \"id\" : [ \"22\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-21 03:24:28\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-21 03:24:28\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 165,\n    \"orderId\" : \"521481475435008000\",\n    \"money\" : 400,\n    \"moneyStr\" : \"4.00\",\n    \"price\" : 400,\n    \"priceStr\" : \"4.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"4.00\",\n    \"status\" : 1,\n    \"statusStr\" : \"已支付\",\n    \"goodsId\" : 22,\n    \"goodsSnapshot\" : null,\n    \"openId\" : \"1\",\n    \"extensionUserId\" : \"x\"\n  }\n}',0,NULL,'2020-04-21 18:29:04'),(181,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'x',NULL,'/pron/detail','127.0.0.1','内网IP','{\n  \"id\" : [ \"22\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-21 18:29:07'),(182,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'x',NULL,'/pron/queryOrder','127.0.0.1','内网IP','{\n  \"id\" : [ \"22\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-21 03:24:28\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-21 03:24:28\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 165,\n    \"orderId\" : \"521481475435008000\",\n    \"money\" : 400,\n    \"moneyStr\" : \"4.00\",\n    \"price\" : 400,\n    \"priceStr\" : \"4.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"4.00\",\n    \"status\" : 1,\n    \"statusStr\" : \"已支付\",\n    \"goodsId\" : 22,\n    \"goodsSnapshot\" : null,\n    \"openId\" : \"1\",\n    \"extensionUserId\" : \"x\"\n  }\n}',0,NULL,'2020-04-21 18:29:09'),(183,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,'x',NULL,'/pron','127.0.0.1','内网IP','{ }','\"pron/index\"',0,NULL,'2020-04-21 18:42:26'),(184,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'x',NULL,'/pron/detail','127.0.0.1','内网IP','{\n  \"id\" : [ \"24\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-21 18:42:28'),(185,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'x',NULL,'/pron/queryOrder','127.0.0.1','内网IP','{\n  \"id\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-21 10:42:29\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-21 10:42:29\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 166,\n    \"orderId\" : \"521591705888100352\",\n    \"money\" : 200,\n    \"moneyStr\" : \"2.00\",\n    \"price\" : 200,\n    \"priceStr\" : \"2.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"2.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 24,\n    \"goodsSnapshot\" : \"{\\\"categoryId\\\":200,\\\"click\\\":44,\\\"createTime\\\":1586780666000,\\\"id\\\":24,\\\"isAllow\\\":true,\\\"isLei\\\":true,\\\"isPreview\\\":false,\\\"logo\\\":\\\"/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"money\\\":\\\"2-5\\\",\\\"name\\\":\\\"adminl\\\",\\\"shijian\\\":\\\"33\\\",\\\"shorturl\\\":\\\"\\\",\\\"url\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/759efe992ff6820da02a901ec81c6271.jpeg\\\",\\\"userid\\\":\\\"admin\\\",\\\"zykey\\\":\\\"http://ds.wx40q.com/profile/upload/2020/04/13/fb09c5c6b6deef09715ca35a62e6d9b5.mp4\\\"}\",\n    \"openId\" : \"1\",\n    \"extensionUserId\" : \"x\"\n  }\n}',0,NULL,'2020-04-21 18:42:29'),(186,'视频首页',10,'com.ruoyi.web.controller.common.PronController.index()','GET',1,NULL,NULL,'/pron','127.0.0.1','内网IP','{ }','\"redirect:http://127.0.0.1:9999/pron/redirect?userid=\"',0,NULL,'2020-04-24 11:16:12'),(187,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,NULL,NULL,'/pron/redirect','127.0.0.1','内网IP','{\n  \"userid\" : [ \"\" ]\n}','\"pron/index\"',0,NULL,'2020-04-24 11:16:12'),(188,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,NULL,NULL,'/pron/detail','127.0.0.1','内网IP','{\n  \"id\" : [ \"22\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-24 11:16:17'),(189,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,NULL,NULL,'/pron/queryOrder','127.0.0.1','内网IP','{\n  \"id\" : [ \"22\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-20 10:57:58\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-20 10:57:58\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 163,\n    \"orderId\" : \"521233215503994880\",\n    \"money\" : 200,\n    \"moneyStr\" : \"2.00\",\n    \"price\" : 200,\n    \"priceStr\" : \"2.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"2.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 22,\n    \"goodsSnapshot\" : null,\n    \"openId\" : \"x\",\n    \"extensionUserId\" : \"x\"\n  }\n}',0,NULL,'2020-04-24 11:16:18'),(190,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'x',NULL,'/pron/detail','127.0.0.1','内网IP','{\n  \"id\" : [ \"22\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-24 11:18:24'),(191,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'x',NULL,'/pron/detail','127.0.0.1','内网IP','{\n  \"id\" : [ \"22\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-24 11:18:34'),(192,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'x',NULL,'/pron/queryOrder','127.0.0.1','内网IP','{\n  \"id\" : [ \"22\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-21 03:24:28\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-21 03:24:28\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 165,\n    \"orderId\" : \"521481475435008000\",\n    \"money\" : 400,\n    \"moneyStr\" : \"4.00\",\n    \"price\" : 400,\n    \"priceStr\" : \"4.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"4.00\",\n    \"status\" : 1,\n    \"statusStr\" : \"已支付\",\n    \"goodsId\" : 22,\n    \"goodsSnapshot\" : null,\n    \"openId\" : \"1\",\n    \"extensionUserId\" : \"x\"\n  }\n}',0,NULL,'2020-04-24 11:18:36'),(193,'视频详情页面',10,'com.ruoyi.web.controller.common.PronController.detail()','GET',1,'x',NULL,'/pron/detail','127.0.0.1','内网IP','{\n  \"id\" : [ \"23\" ],\n  \"author\" : [ \"admin\" ]\n}','\"pron/detail\"',0,NULL,'2020-04-24 11:18:41'),(194,'前台查询订单',10,'com.ruoyi.web.controller.common.PronController.queryOrder()','POST',1,'x',NULL,'/pron/queryOrder','127.0.0.1','内网IP','{\n  \"id\" : [ \"23\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0,\n  \"data\" : {\n    \"searchValue\" : null,\n    \"createBy\" : null,\n    \"createTime\" : \"2020-04-21 03:17:57\",\n    \"updateBy\" : null,\n    \"updateTime\" : \"2020-04-21 03:17:57\",\n    \"remark\" : null,\n    \"params\" : { },\n    \"id\" : 164,\n    \"orderId\" : \"521479833629233152\",\n    \"money\" : 400,\n    \"moneyStr\" : \"4.00\",\n    \"price\" : 400,\n    \"priceStr\" : \"4.00\",\n    \"type\" : 1,\n    \"typeStr\" : \"微信支付\",\n    \"payNo\" : null,\n    \"param\" : null,\n    \"payTime\" : null,\n    \"payTag\" : \"4.00\",\n    \"status\" : 0,\n    \"statusStr\" : \"未支付\",\n    \"goodsId\" : 23,\n    \"goodsSnapshot\" : null,\n    \"openId\" : \"1\",\n    \"extensionUserId\" : \"x\"\n  }\n}',0,NULL,'2020-04-24 11:18:42'),(195,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'x',NULL,'/pron/redirect','127.0.0.1','内网IP','{\n  \"userid\" : [ \"\" ]\n}','\"pron/index\"',0,NULL,'2020-04-24 23:07:33'),(196,'视频重定向',10,'com.ruoyi.web.controller.common.PronController.redirect()','GET',1,'x',NULL,'/pron/redirect','127.0.0.1','内网IP','{\n  \"userid\" : [ \"\" ]\n}','\"pron/index\"',0,NULL,'2020-04-24 23:08:03'),(197,'域名管理',2,'com.ruoyi.web.controller.system.SysWebMainController.editSave()','POST',1,'admin','研发部门','/system/webmain/edit','127.0.0.1','内网IP','{\n  \"id\" : [ \"7\" ],\n  \"mainUrl\" : [ \"http://127.0.0.1:8083\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-04-24 23:08:38'),(198,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.editSave()','POST',1,'admin','研发部门','/system/config/edit','127.0.0.1','内网IP','{\n  \"tradeType\" : [ \"JSAPI\" ],\n  \"configId\" : [ \"6\" ],\n  \"configName\" : [ \"支付交易类型\" ],\n  \"configKey\" : [ \"sys.tradeType\" ],\n  \"configValue\" : [ \"NATIVE\" ],\n  \"configType\" : [ \"N\" ],\n  \"remark\" : [ \"\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-04 15:33:41'),(199,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.addSave()','POST',1,'admin','研发部门','/system/menu/add','127.0.0.1','内网IP','{\n  \"parentId\" : [ \"1\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"打赏记录\" ],\n  \"url\" : [ \"\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"\" ],\n  \"visible\" : [ \"0\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-05 13:26:31'),(200,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.addSave()','POST',1,'admin','研发部门','/system/menu/add','127.0.0.1','内网IP','{\n  \"parentId\" : [ \"1\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"打赏统计\" ],\n  \"url\" : [ \"\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"\" ],\n  \"visible\" : [ \"0\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-05 13:26:46'),(201,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\n  \"menuId\" : [ \"2090\" ],\n  \"parentId\" : [ \"1\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"打赏记录\" ],\n  \"url\" : [ \"statistics/record\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"#\" ],\n  \"visible\" : [ \"0\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-05 13:50:26'),(202,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\n  \"menuId\" : [ \"2090\" ],\n  \"parentId\" : [ \"1\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"打赏记录\" ],\n  \"url\" : [ \"/statistics/record\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"#\" ],\n  \"visible\" : [ \"0\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-05 13:50:36'),(203,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\n  \"menuId\" : [ \"2091\" ],\n  \"parentId\" : [ \"1\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"打赏统计\" ],\n  \"url\" : [ \"/statistics/record\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"#\" ],\n  \"visible\" : [ \"0\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-05 13:50:48'),(204,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\n  \"menuId\" : [ \"2091\" ],\n  \"parentId\" : [ \"1\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"打赏统计\" ],\n  \"url\" : [ \"/statistics/statistics\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"#\" ],\n  \"visible\" : [ \"0\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-05 14:49:15'),(205,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.addSave()','POST',1,'admin','研发部门','/system/menu/add','127.0.0.1','内网IP','{\n  \"parentId\" : [ \"1\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"申请提现\" ],\n  \"url\" : [ \"\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"\" ],\n  \"visible\" : [ \"0\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-05 16:27:34'),(206,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.addSave()','POST',1,'admin','研发部门','/system/menu/add','127.0.0.1','内网IP','{\n  \"parentId\" : [ \"1\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"提现记录\" ],\n  \"url\" : [ \"\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"\" ],\n  \"visible\" : [ \"0\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-05 16:27:48'),(207,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\n  \"menuId\" : [ \"2092\" ],\n  \"parentId\" : [ \"1\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"申请提现\" ],\n  \"url\" : [ \"/statistics/withdrawal/applyWithdrawal\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"#\" ],\n  \"visible\" : [ \"0\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-05 18:04:05'),(208,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\n  \"menuId\" : [ \"2093\" ],\n  \"parentId\" : [ \"1\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"提现记录\" ],\n  \"url\" : [ \"/statistics/withdrawal/withdrawalRecord\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"#\" ],\n  \"visible\" : [ \"0\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-05 18:04:26'),(209,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\n  \"tables\" : [ \"trade\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-05 18:35:50'),(210,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\n  \"tableId\" : [ \"10\" ],\n  \"tableName\" : [ \"trade\" ],\n  \"tableComment\" : [ \"trade\" ],\n  \"className\" : [ \"Trade\" ],\n  \"functionAuthor\" : [ \"s\" ],\n  \"remark\" : [ \"\" ],\n  \"columns[0].columnId\" : [ \"115\" ],\n  \"columns[0].sort\" : [ \"1\" ],\n  \"columns[0].columnComment\" : [ \"交易号\" ],\n  \"columns[0].javaType\" : [ \"String\" ],\n  \"columns[0].javaField\" : [ \"tradeNo\" ],\n  \"columns[0].isInsert\" : [ \"1\" ],\n  \"columns[0].queryType\" : [ \"EQ\" ],\n  \"columns[0].htmlType\" : [ \"input\" ],\n  \"columns[0].dictType\" : [ \"\" ],\n  \"columns[1].columnId\" : [ \"116\" ],\n  \"columns[1].sort\" : [ \"2\" ],\n  \"columns[1].columnComment\" : [ \"\" ],\n  \"columns[1].javaType\" : [ \"String\" ],\n  \"columns[1].javaField\" : [ \"payerType\" ],\n  \"columns[1].isInsert\" : [ \"1\" ],\n  \"columns[1].isEdit\" : [ \"1\" ],\n  \"columns[1].isList\" : [ \"1\" ],\n  \"columns[1].isQuery\" : [ \"1\" ],\n  \"columns[1].queryType\" : [ \"EQ\" ],\n  \"columns[1].isRequired\" : [ \"1\" ],\n  \"columns[1].htmlType\" : [ \"select\" ],\n  \"columns[1].dictType\" : [ \"\" ],\n  \"columns[2].columnId\" : [ \"117\" ],\n  \"columns[2].sort\" : [ \"3\" ],\n  \"columns[2].columnComment\" : [ \"付款方\" ],\n  \"columns[2].javaType\" : [ \"String\" ],\n  \"columns[2].javaField\" : [ \"payer\" ],\n  \"columns[2].isInsert\" : [ \"1\" ],\n  \"columns[2].isEdit\" : [ \"1\" ],\n  \"columns[2].isList\" : [ \"1\" ],\n  \"columns[2].isQuery\" : [ \"1\" ],\n  \"columns[2].queryType\" : [ \"EQ\" ],\n  \"columns[2].isRequired\" : [ \"1\" ],\n  \"columns[2].htmlType\" : [ \"input\" ],\n  \"columns[2].dictType\" : [ \"\" ],\n  \"columns[3].columnId\" : [ \"118\" ],\n  \"columns[3].sort\" : [ \"4\" ],\n  \"columns[3].columnComment\" : [ \"\" ],\n  \"columns[3].javaType\" : [ \"String\" ],\n  \"columns[3].javaField\" : [ \"payeeType\" ],\n  \"columns[3].isInsert\" : [ \"1\" ],\n  \"columns[3].isEdit\" : [ \"1\" ],\n  \"columns[3].isList\" : [ \"1\" ],\n  \"columns[3].isQuery\" : [ \"1\" ],\n  \"columns[3].queryType\" : [ \"EQ\" ],\n  \"columns[3].isRequired\" : [ \"1\" ],\n  \"columns[3].htmlType\" : [ \"select\" ],\n  \"columns[3].dictType\" : [ \"\" ],\n  \"columns[4].columnId\" : [ \"119\" ],\n  \"columns[4].sort\" : [ \"5\" ],\n  \"colum','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-05 18:37:45'),(211,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\n  \"tableId\" : [ \"10\" ],\n  \"tableName\" : [ \"trade\" ],\n  \"tableComment\" : [ \"trade\" ],\n  \"className\" : [ \"Trade\" ],\n  \"functionAuthor\" : [ \"s\" ],\n  \"remark\" : [ \"\" ],\n  \"columns[0].columnId\" : [ \"115\" ],\n  \"columns[0].sort\" : [ \"1\" ],\n  \"columns[0].columnComment\" : [ \"交易号\" ],\n  \"columns[0].javaType\" : [ \"String\" ],\n  \"columns[0].javaField\" : [ \"tradeNo\" ],\n  \"columns[0].isInsert\" : [ \"1\" ],\n  \"columns[0].queryType\" : [ \"EQ\" ],\n  \"columns[0].htmlType\" : [ \"input\" ],\n  \"columns[0].dictType\" : [ \"\" ],\n  \"columns[1].columnId\" : [ \"116\" ],\n  \"columns[1].sort\" : [ \"2\" ],\n  \"columns[1].columnComment\" : [ \"\" ],\n  \"columns[1].javaType\" : [ \"String\" ],\n  \"columns[1].javaField\" : [ \"payerType\" ],\n  \"columns[1].isInsert\" : [ \"1\" ],\n  \"columns[1].isEdit\" : [ \"1\" ],\n  \"columns[1].isList\" : [ \"1\" ],\n  \"columns[1].isQuery\" : [ \"1\" ],\n  \"columns[1].queryType\" : [ \"EQ\" ],\n  \"columns[1].isRequired\" : [ \"1\" ],\n  \"columns[1].htmlType\" : [ \"select\" ],\n  \"columns[1].dictType\" : [ \"\" ],\n  \"columns[2].columnId\" : [ \"117\" ],\n  \"columns[2].sort\" : [ \"3\" ],\n  \"columns[2].columnComment\" : [ \"付款方\" ],\n  \"columns[2].javaType\" : [ \"String\" ],\n  \"columns[2].javaField\" : [ \"payer\" ],\n  \"columns[2].isInsert\" : [ \"1\" ],\n  \"columns[2].isEdit\" : [ \"1\" ],\n  \"columns[2].isList\" : [ \"1\" ],\n  \"columns[2].isQuery\" : [ \"1\" ],\n  \"columns[2].queryType\" : [ \"EQ\" ],\n  \"columns[2].isRequired\" : [ \"1\" ],\n  \"columns[2].htmlType\" : [ \"input\" ],\n  \"columns[2].dictType\" : [ \"\" ],\n  \"columns[3].columnId\" : [ \"118\" ],\n  \"columns[3].sort\" : [ \"4\" ],\n  \"columns[3].columnComment\" : [ \"\" ],\n  \"columns[3].javaType\" : [ \"String\" ],\n  \"columns[3].javaField\" : [ \"payeeType\" ],\n  \"columns[3].isInsert\" : [ \"1\" ],\n  \"columns[3].isEdit\" : [ \"1\" ],\n  \"columns[3].isList\" : [ \"1\" ],\n  \"columns[3].isQuery\" : [ \"1\" ],\n  \"columns[3].queryType\" : [ \"EQ\" ],\n  \"columns[3].isRequired\" : [ \"1\" ],\n  \"columns[3].htmlType\" : [ \"select\" ],\n  \"columns[3].dictType\" : [ \"\" ],\n  \"columns[4].columnId\" : [ \"119\" ],\n  \"columns[4].sort\" : [ \"5\" ],\n  \"colum','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-05 18:38:16'),(212,'代码生成',8,'com.ruoyi.generator.controller.GenController.genCode()','GET',1,'admin','研发部门','/tool/gen/genCode/trade','127.0.0.1','内网IP','{ }','null',0,NULL,'2020-06-05 18:38:30'),(213,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\n  \"menuId\" : [ \"2094\" ],\n  \"parentId\" : [ \"1\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"交易信息\" ],\n  \"url\" : [ \"/system/trade\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"system:trade:view\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"#\" ],\n  \"visible\" : [ \"0\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-05 18:42:43'),(214,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"11\" ],\n  \"payee\" : [ \"11\" ]\n}','null',1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'money\' doesn\'t have a default value\n### The error may involve com.ruoyi.system.mapper.SysOrderMapper.insertSysOrder-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_order          ( order_id,                                                                                                                     create_time )           values ( ?,                                                                                                                     ? )\n### Cause: java.sql.SQLException: Field \'money\' doesn\'t have a default value\n; Field \'money\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'money\' doesn\'t have a default value','2020-06-05 21:53:11'),(215,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"1\" ],\n  \"password\" : [ \"1\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','{\n  \"msg\" : \"余额不足\",\n  \"code\" : 500\n}',0,NULL,'2020-06-06 22:04:51'),(216,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"1\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','{\n  \"msg\" : \"用户密码错误\",\n  \"code\" : 500\n}',0,NULL,'2020-06-06 22:05:11'),(217,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"1\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','{\n  \"msg\" : \"用户密码错误\",\n  \"code\" : 500\n}',0,NULL,'2020-06-06 22:14:17'),(218,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','{\n  \"msg\" : \"用户密码错误\",\n  \"code\" : 500\n}',0,NULL,'2020-06-06 22:14:32'),(219,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"111111\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','{\n  \"msg\" : \"用户密码错误\",\n  \"code\" : 500\n}',0,NULL,'2020-06-06 22:14:45'),(220,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"123456\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','{\n  \"msg\" : \"用户密码错误\",\n  \"code\" : 500\n}',0,NULL,'2020-06-06 22:15:08'),(221,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','null',1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'trade_no\' doesn\'t have a default value\n### The error may involve com.ruoyi.reward.mapper.TradeMapper.insertTrade-Inline\n### The error occurred while setting parameters\n### SQL: insert into trade          ( payee_type,             payee,             amount,             state )           values ( ?,             ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field \'trade_no\' doesn\'t have a default value\n; Field \'trade_no\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'trade_no\' doesn\'t have a default value','2020-06-06 22:15:41'),(222,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','null',1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'payer_type\' doesn\'t have a default value\n### The error may involve com.ruoyi.reward.mapper.TradeMapper.insertTrade-Inline\n### The error occurred while setting parameters\n### SQL: insert into trade          ( trade_no,                                       payee_type,             payee,             amount,             state )           values ( ?,                                       ?,             ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field \'payer_type\' doesn\'t have a default value\n; Field \'payer_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'payer_type\' doesn\'t have a default value','2020-06-06 22:19:16'),(223,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','POST',1,'admin','研发部门','/tool/gen/remove','127.0.0.1','内网IP','{\n  \"ids\" : [ \"10\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-06 22:47:38'),(224,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\n  \"tables\" : [ \"trade\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-06 22:47:42'),(225,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','null',1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'pay_type\' doesn\'t have a default value\n### The error may involve com.ruoyi.reward.mapper.TradeMapper.insertTrade-Inline\n### The error occurred while setting parameters\n### SQL: insert into trade          ( trade_no,             payer_type,             payer,             payee_type,             payee,             amount,             state )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field \'pay_type\' doesn\'t have a default value\n; Field \'pay_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'pay_type\' doesn\'t have a default value','2020-06-06 22:51:08'),(226,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','null',1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'createtime\' in \'class com.ruoyi.reward.domain.Trade\'','2020-06-07 10:47:14'),(227,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','null',1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'createtime\' in \'class com.ruoyi.reward.domain.Trade\'','2020-06-07 10:49:02'),(228,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','null',1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'createtime\' in \'class com.ruoyi.reward.domain.Trade\'','2020-06-07 10:49:20'),(229,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','null',1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'gmt_create\' doesn\'t have a default value\n### The error may involve com.ruoyi.reward.mapper.TradeMapper.insertTrade-Inline\n### The error occurred while setting parameters\n### SQL: insert into trade          ( trade_no,             payer_type,             payer,             payee_type,             payee,             amount,             state,                          pay_type,                                                                                                        create_time,             payee_no )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ?,                                                                                                        ?,             ? )\n### Cause: java.sql.SQLException: Field \'gmt_create\' doesn\'t have a default value\n; Field \'gmt_create\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'gmt_create\' doesn\'t have a default value','2020-06-07 10:53:24'),(230,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-07 10:58:12'),(231,'邀请码管理',1,'com.ruoyi.web.controller.system.YqmController.addSave()','POST',1,'admin','研发部门','/system/yqm/add','127.0.0.1','内网IP','{\n  \"userid\" : [ \"admin\" ],\n  \"yqm\" : [ \"LwrXdgu8\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-07 10:58:36'),(232,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-07 10:59:27'),(233,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-07 11:01:41'),(234,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','GET',1,'admin','研发部门','/system/menu/remove/2092','127.0.0.1','内网IP','{ }','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-07 11:11:58'),(235,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\n  \"menuId\" : [ \"2093\" ],\n  \"parentId\" : [ \"1\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"申请提现\" ],\n  \"url\" : [ \"/statistics/withdrawal/withdrawalRecord\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"#\" ],\n  \"visible\" : [ \"0\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-07 11:14:29'),(236,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-07 11:15:10'),(237,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\n  \"deptId\" : [ \"105\" ],\n  \"userName\" : [ \"的订单\" ],\n  \"deptName\" : [ \"测试部门\" ],\n  \"phonenumber\" : [ \"13900000002\" ],\n  \"email\" : [ \"lizhichange@gmail.com\" ],\n  \"loginName\" : [ \"13900000002\" ],\n  \"password\" : [ \"123456\" ],\n  \"sex\" : [ \"0\" ],\n  \"role\" : [ \"2\" ],\n  \"remark\" : [ \"dd\" ],\n  \"status\" : [ \"0\" ],\n  \"roleIds\" : [ \"2\" ],\n  \"postIds\" : [ \"2\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-07 11:16:06'),(238,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-07 11:16:35'),(239,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-07 11:38:07'),(240,'交易信息',3,'com.ruoyi.reward.controller.TradeController.remove()','POST',1,'admin','研发部门','/system/trade/remove','127.0.0.1','内网IP','{\n  \"ids\" : [ \"538507096035954688,538507408666791936,538507970028244992,538511363119517696,538511722437152768,538517140777472000\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-07 11:42:55'),(241,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payee\" : [ \"0\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-07 11:43:18'),(242,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ],\n  \"payeeType\" : [ \"1\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-07 11:46:52'),(243,'代理商户注册',0,'com.ruoyi.web.controller.common.WebController.reg()','POST',1,NULL,NULL,'/webLogin/reg','127.0.0.1','内网IP','{\n  \"loginName\" : [ \"LwrXdgu8\" ],\n  \"userName\" : [ \"LwrXdgu8\" ],\n  \"password\" : [ \"LwrXdgu8\" ],\n  \"yqm\" : [ \"LwrXdgu8\" ],\n  \"payee\" : [ \"LwrXdgu8\" ],\n  \"payeeAccount\" : [ \"LwrXdgu8\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-08 17:46:33'),(244,'邀请码管理',1,'com.ruoyi.web.controller.system.YqmController.addSave()','POST',1,'admin','研发部门','/system/yqm/add','127.0.0.1','内网IP','{\n  \"userid\" : [ \"admin\" ],\n  \"yqm\" : [ \"e79EH63o\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-08 17:55:57'),(245,'代理商户注册',0,'com.ruoyi.web.controller.common.WebController.reg()','POST',1,NULL,NULL,'/webLogin/reg','127.0.0.1','内网IP','{\n  \"loginName\" : [ \"e79EH63o\" ],\n  \"userName\" : [ \"e79EH63o\" ],\n  \"password\" : [ \"e79EH63o\" ],\n  \"yqm\" : [ \"e79EH63o\" ],\n  \"payee\" : [ \"e79EH63o\" ],\n  \"payeeAccount\" : [ \"e79EH63o\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-08 17:56:12'),(246,'邀请码管理',1,'com.ruoyi.web.controller.system.YqmController.addSave()','POST',1,'admin','研发部门','/system/yqm/add','127.0.0.1','内网IP','{\n  \"userid\" : [ \"admin\" ],\n  \"yqm\" : [ \"F6Si1pHp\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-08 17:57:52'),(247,'代理商户注册',0,'com.ruoyi.web.controller.common.WebController.reg()','POST',1,NULL,NULL,'/webLogin/reg','127.0.0.1','内网IP','{\n  \"loginName\" : [ \"F6Si1pHp\" ],\n  \"userName\" : [ \"F6Si1pHp\" ],\n  \"password\" : [ \"F6Si1pHp\" ],\n  \"yqm\" : [ \"F6Si1pHp\" ],\n  \"payee\" : [ \"F6Si1pHp\" ],\n  \"payeeAccount\" : [ \"F6Si1pHp\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-08 17:58:26'),(248,'邀请码管理',1,'com.ruoyi.web.controller.system.YqmController.addSave()','POST',1,'admin','研发部门','/system/yqm/add','127.0.0.1','内网IP','{\n  \"userid\" : [ \"admin\" ],\n  \"yqm\" : [ \"6fzuYVKL\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-08 18:27:47'),(249,'代理商户注册',0,'com.ruoyi.web.controller.common.WebController.reg()','POST',1,NULL,NULL,'/webLogin/reg','127.0.0.1','内网IP','{\n  \"loginName\" : [ \"6fzuYVKL\" ],\n  \"userName\" : [ \"6fzuYVKL\" ],\n  \"password\" : [ \"6fzuYVKL\" ],\n  \"yqm\" : [ \"6fzuYVKL\" ],\n  \"payee\" : [ \"6fzuYVKL\" ],\n  \"payeeAccount\" : [ \"6fzuYVKL\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-08 18:28:08'),(250,'邀请码管理',1,'com.ruoyi.web.controller.system.YqmController.addSave()','POST',1,'admin','研发部门','/system/yqm/add','127.0.0.1','内网IP','{\n  \"userid\" : [ \"admin\" ],\n  \"yqm\" : [ \"WNz9dKGm\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-08 18:30:37'),(251,'代理商户注册',0,'com.ruoyi.web.controller.common.WebController.reg()','POST',1,NULL,NULL,'/webLogin/reg','127.0.0.1','内网IP','{\n  \"loginName\" : [ \"WNz9dKGm\" ],\n  \"userName\" : [ \"WNz9dKGm\" ],\n  \"password\" : [ \"WNz9dKGm\" ],\n  \"yqm\" : [ \"WNz9dKGm\" ],\n  \"payee\" : [ \"WNz9dKGm\" ],\n  \"payeeAccount\" : [ \"WNz9dKGm\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-08 18:31:05'),(252,'邀请码管理',1,'com.ruoyi.web.controller.system.YqmController.addSave()','POST',1,'admin','研发部门','/system/yqm/add','127.0.0.1','内网IP','{\n  \"userid\" : [ \"admin\" ],\n  \"yqm\" : [ \"0K9FpDRK\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-08 18:35:44'),(253,'代理商户注册',0,'com.ruoyi.web.controller.common.WebController.reg()','POST',1,NULL,NULL,'/webLogin/reg','127.0.0.1','内网IP','{\n  \"loginName\" : [ \"0K9FpDRK\" ],\n  \"userName\" : [ \"0K9FpDRK\" ],\n  \"password\" : [ \"0K9FpDRK\" ],\n  \"yqm\" : [ \"0K9FpDRK\" ],\n  \"payee\" : [ \"0K9FpDRK\" ],\n  \"payeeAccount\" : [ \"0K9FpDRK\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-08 18:36:17'),(254,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payeeType\" : [ \"alipay\" ],\n  \"payeeBank\" : [ \"\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-08 21:52:58'),(255,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payeeType\" : [ \"bank\" ],\n  \"payeeBank\" : [ \"1\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"1\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-08 21:53:18'),(256,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payeeType\" : [ \"bank\" ],\n  \"remark\" : [ \"建设银行\" ],\n  \"payee\" : [ \"王涛\" ],\n  \"payeeNo\" : [ \"12235444444444444\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-08 21:56:29'),(257,'交易信息',3,'com.ruoyi.reward.controller.TradeController.remove()','POST',1,'admin','研发部门','/system/trade/remove','127.0.0.1','内网IP','{\n  \"ids\" : [ \"539035143810060288,539034342823825408,539034258438623232,538519343177142272,538518443763175424\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-08 22:13:43'),(258,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payeeType\" : [ \"bank\" ],\n  \"remark\" : [ \"0\" ],\n  \"payee\" : [ \"0K9FpDRK\" ],\n  \"payeeNo\" : [ \"0\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-11 15:26:27'),(259,'交易管理',2,'com.ruoyi.reward.controller.TradeController.changeState()','POST',1,'admin','研发部门','/system/trade/changeState','127.0.0.1','内网IP','{\n  \"tradeNo\" : [ \"540024151658729472\" ],\n  \"status\" : [ \"1\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-11 15:26:33'),(260,'交易管理',2,'com.ruoyi.reward.controller.TradeController.changeState()','POST',1,'admin','研发部门','/system/trade/changeState','127.0.0.1','内网IP','{\n  \"tradeNo\" : [ \"540024151658729472\" ],\n  \"status\" : [ \"1\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-11 15:27:54'),(261,'交易管理',2,'com.ruoyi.reward.controller.TradeController.changeState()','POST',1,'admin','研发部门','/system/trade/changeState','127.0.0.1','内网IP','{\n  \"tradeNo\" : [ \"540024151658729472\" ],\n  \"state\" : [ \"1\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-11 15:30:57'),(262,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"1\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payeeType\" : [ \"bank\" ],\n  \"remark\" : [ \"建设银行\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"111\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-11 15:33:03'),(263,'交易管理',2,'com.ruoyi.reward.controller.TradeController.changeState()','POST',1,'admin','研发部门','/system/trade/changeState','127.0.0.1','内网IP','{\n  \"tradeNo\" : [ \"540025812850577408\" ],\n  \"state\" : [ \"1\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-11 15:33:27'),(264,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\n  \"menuId\" : [ \"107\" ],\n  \"parentId\" : [ \"1\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"通知公告\" ],\n  \"url\" : [ \"/system/notice\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"system:notice:view\" ],\n  \"orderNum\" : [ \"8\" ],\n  \"icon\" : [ \"#\" ],\n  \"visible\" : [ \"0\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-11 16:11:12'),(265,'通知公告',2,'com.ruoyi.web.controller.system.SysNoticeController.editSave()','POST',1,'admin','研发部门','/system/notice/edit','127.0.0.1','内网IP','{\n  \"noticeId\" : [ \"1\" ],\n  \"noticeTitle\" : [ \"温馨提醒：2018-07-01 若依新版本发布啦\" ],\n  \"noticeType\" : [ \"2\" ],\n  \"noticeContent\" : [ \"新版本内容\" ],\n  \"status\" : [ \"1\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-11 16:11:22'),(266,'通知公告',2,'com.ruoyi.web.controller.system.SysNoticeController.editSave()','POST',1,'admin','研发部门','/system/notice/edit','127.0.0.1','内网IP','{\n  \"noticeId\" : [ \"2\" ],\n  \"noticeTitle\" : [ \"维护通知：2018-07-01 若依系统凌晨维护\" ],\n  \"noticeType\" : [ \"1\" ],\n  \"noticeContent\" : [ \"维护内容\" ],\n  \"status\" : [ \"1\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-11 16:11:26'),(267,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"0\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payeeType\" : [ \"bank\" ],\n  \"remark\" : [ \"0\" ],\n  \"payee\" : [ \"1\" ],\n  \"payeeNo\" : [ \"0\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-11 16:11:58'),(268,'账户明细',3,'com.ruoyi.web.controller.system.AccountDetailController.remove()','POST',1,'admin','研发部门','/system/accountDetail/remove','127.0.0.1','内网IP','{\n  \"ids\" : [ \"113889\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-11 16:12:20'),(269,'申请提现',1,'com.ruoyi.web.controller.statistics.WithdrawalRecordController.addSave()','POST',1,'admin','研发部门','/statistics/withdrawal/add','127.0.0.1','内网IP','{\n  \"amount\" : [ \"11\" ],\n  \"password\" : [ \"admin123\" ],\n  \"payeeType\" : [ \"bank\" ],\n  \"remark\" : [ \"0\" ],\n  \"payee\" : [ \"0K9FpDRK\" ],\n  \"payeeNo\" : [ \"0\" ]\n}','{\n  \"msg\" : \"余额不足\",\n  \"code\" : 500\n}',0,NULL,'2020-06-11 16:28:39'),(270,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.addSave()','POST',1,'admin','研发部门','/system/menu/add','127.0.0.1','内网IP','{\n  \"parentId\" : [ \"1\" ],\n  \"menuType\" : [ \"C\" ],\n  \"menuName\" : [ \"私人片库\" ],\n  \"url\" : [ \"/system/shipin/pshipin\" ],\n  \"target\" : [ \"menuItem\" ],\n  \"perms\" : [ \"\" ],\n  \"orderNum\" : [ \"1\" ],\n  \"icon\" : [ \"\" ],\n  \"visible\" : [ \"0\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-11 21:31:09'),(271,'一键发布价格',1,'com.ruoyi.web.controller.system.ShipinController.price()','POST',1,'admin','研发部门','/system/shipin/price','127.0.0.1','内网IP','{\n  \"price\" : [ \"2\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-12 00:11:44'),(272,'一键发布价格',1,'com.ruoyi.web.controller.system.ShipinController.price()','POST',1,'admin','研发部门','/system/shipin/price','127.0.0.1','内网IP','{\n  \"price\" : [ \"1111\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-12 00:13:47'),(273,'批量发布价格',1,'com.ruoyi.web.controller.system.ShipinController.batchForceLogout()','POST',1,'admin','研发部门','/system/shipin/batchForceLogout','127.0.0.1','内网IP','{\n  \"price\" : [ \"1\" ],\n  \"ids[]\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-12 07:57:39'),(274,'批量发布价格',1,'com.ruoyi.web.controller.system.ShipinController.batchForceLogout()','POST',1,'admin','研发部门','/system/shipin/batchForceLogout','127.0.0.1','内网IP','{\n  \"price\" : [ \"1\" ],\n  \"ids[]\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-12 07:58:04'),(275,'批量发布价格',1,'com.ruoyi.web.controller.system.ShipinController.batchForceLogout()','POST',1,'admin','研发部门','/system/shipin/batchForceLogout','127.0.0.1','内网IP','{\n  \"price\" : [ \"22\" ],\n  \"ids[]\" : [ \"24\", \"23\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-12 07:58:21'),(276,'批量发布价格',1,'com.ruoyi.web.controller.system.ShipinController.batchForceLogout()','POST',1,'admin','研发部门','/system/shipin/batchForceLogout','127.0.0.1','内网IP','{\n  \"price\" : [ \"9\" ],\n  \"ids[]\" : [ \"24\", \"23\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-12 08:52:56'),(277,'批量发布价格',1,'com.ruoyi.web.controller.system.ShipinController.batchForceLogout()','POST',1,'admin','研发部门','/system/shipin/batchForceLogout','127.0.0.1','内网IP','{\n  \"price\" : [ \"1\" ],\n  \"ids[]\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-12 09:34:28'),(278,'批量发布价格',1,'com.ruoyi.web.controller.system.ShipinController.batchForceLogout()','POST',1,'admin','研发部门','/system/shipin/batchForceLogout','127.0.0.1','内网IP','{\n  \"price\" : [ \"222\" ],\n  \"ids[]\" : [ \"24\", \"23\" ]\n}','null',1,'com.alibaba.fastjson.JSONObject cannot be cast to com.ruoyi.web.param.PriceParam','2020-06-12 09:36:07'),(279,'批量发布价格',1,'com.ruoyi.web.controller.system.ShipinController.batchForceLogout()','POST',1,'admin','研发部门','/system/shipin/batchForceLogout','127.0.0.1','内网IP','{\n  \"price\" : [ \"2\" ],\n  \"ids[]\" : [ \"24\", \"23\" ]\n}','null',1,'com.alibaba.fastjson.JSONObject cannot be cast to com.ruoyi.web.param.PriceParam','2020-06-12 09:39:45'),(280,'批量发布价格',1,'com.ruoyi.web.controller.system.ShipinController.batchForceLogout()','POST',1,'admin','研发部门','/system/shipin/batchForceLogout','127.0.0.1','内网IP','{\n  \"price\" : [ \"333\" ],\n  \"ids[]\" : [ \"24\", \"23\" ]\n}','null',1,'com.alibaba.fastjson.JSONObject cannot be cast to com.ruoyi.web.param.PriceParam','2020-06-12 09:44:36'),(281,'一键发布价格',1,'com.ruoyi.web.controller.system.ShipinController.price()','POST',1,'admin','研发部门','/system/shipin/price','127.0.0.1','内网IP','{\n  \"price\" : [ \"e\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-12 09:45:09'),(282,'一键发布价格',1,'com.ruoyi.web.controller.system.ShipinController.price()','POST',1,'admin','研发部门','/system/shipin/price','127.0.0.1','内网IP','{\n  \"price\" : [ \"1\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-12 09:45:15'),(283,'批量发布价格',1,'com.ruoyi.web.controller.system.ShipinController.batchForceLogout()','POST',1,'admin','研发部门','/system/shipin/batchForceLogout','127.0.0.1','内网IP','{\n  \"price\" : [ \"3\" ],\n  \"ids[]\" : [ \"24\", \"23\" ]\n}','null',1,'com.alibaba.fastjson.JSONObject cannot be cast to com.ruoyi.web.param.PriceParam','2020-06-12 09:46:03'),(284,'批量发布价格',1,'com.ruoyi.web.controller.system.ShipinController.batchForceLogout()','POST',1,'admin','研发部门','/system/shipin/batchForceLogout','127.0.0.1','内网IP','{\n  \"price\" : [ \"3\" ],\n  \"ids[]\" : [ \"24\", \"23\", \"22\", \"21\", \"20\", \"15\" ]\n}','null',1,'\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'config_value\' at row 1\n### The error may involve com.ruoyi.system.mapper.SysConfigMapper.updateConfig-Inline\n### The error occurred while setting parameters\n### SQL: update sys_config           SET config_value = ?,                                            update_time = sysdate()          where config_id = ?\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'config_value\' at row 1\n; Data truncation: Data too long for column \'config_value\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'config_value\' at row 1','2020-06-12 10:45:08'),(285,'批量发布价格',1,'com.ruoyi.web.controller.system.ShipinController.batchForceLogout()','POST',1,'admin','研发部门','/system/shipin/batchForceLogout','127.0.0.1','内网IP','{\n  \"price\" : [ \"3\" ],\n  \"ids[]\" : [ \"24\", \"23\", \"22\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-12 10:45:21'),(286,'批量发布价格',1,'com.ruoyi.web.controller.system.ShipinController.batchForceLogout()','POST',1,'admin','研发部门','/system/shipin/batchForceLogout','127.0.0.1','内网IP','{\n  \"price\" : [ \"3\" ],\n  \"ids[]\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-12 10:58:07'),(287,'一键发布价格',1,'com.ruoyi.web.controller.system.ShipinController.price()','POST',1,'admin','研发部门','/system/shipin/price','127.0.0.1','内网IP','{\n  \"price\" : [ \"33\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-12 10:58:11'),(288,'批量发布价格',1,'com.ruoyi.web.controller.system.ShipinController.batchForceLogout()','POST',1,'admin','研发部门','/system/shipin/batchForceLogout','127.0.0.1','内网IP','{\n  \"price\" : [ \"4\" ],\n  \"ids[]\" : [ \"24\", \"23\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-12 13:15:50'),(289,'批量发布价格',1,'com.ruoyi.web.controller.system.ShipinController.batchForceLogout()','POST',1,'admin','研发部门','/system/shipin/batchForceLogout','127.0.0.1','内网IP','{\n  \"price\" : [ \"4\" ],\n  \"ids[]\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-12 13:15:54'),(290,'批量发布价格',1,'com.ruoyi.web.controller.system.ShipinController.batchForceLogout()','POST',1,'admin','研发部门','/system/shipin/batchForceLogout','127.0.0.1','内网IP','{\n  \"price\" : [ \"4\" ],\n  \"ids[]\" : [ \"24\" ]\n}','{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}',0,NULL,'2020-06-12 13:15:59');
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_order`
--

DROP TABLE IF EXISTS `sys_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '订单ID',
  `money` int(10) unsigned NOT NULL COMMENT '实际金额，单位分\n',
  `price` int(11) NOT NULL COMMENT '原价，单位分\n',
  `type` int(1) NOT NULL DEFAULT 1 COMMENT '支付方式',
  `pay_no` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '流水号',
  `param` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '自定义参数',
  `pay_time` datetime DEFAULT NULL COMMENT '付款时间',
  `pay_tag` varchar(100) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '金额的备注',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '订单状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品信息',
  `goods_snapshot` text COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品快照',
  `open_id` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户的openId',
  `extension_user_id` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '推广人的id',
  `user_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_order`
--

LOCK TABLES `sys_order` WRITE;
/*!40000 ALTER TABLE `sys_order` DISABLE KEYS */;
INSERT INTO `sys_order` VALUES (169,'537615618740850688',231,300,2,'4200000607202006046682331620','20200604235748','2020-06-04 23:56:41','3.00',1,'2020-06-08 23:55:48','2020-06-05 00:23:12',1,'{\"categoryId\":202,\"click\":64,\"createTime\":1591176216000,\"id\":1,\"isAllow\":true,\"isLei\":true,\"isPreview\":false,\"logo\":\"/profile/upload/2020/06/03/56a216e09cbf1e1a0e95db77491ce539.png\",\"money\":\"2-5\",\"name\":\"admin\",\"shijian\":\"752\",\"shorturl\":\"\",\"url\":\"http://admin.grkfcs.cn/profile/upload/2020/06/03/56a216e09cbf1e1a0e95db77491ce539.png\",\"userid\":\"admin\",\"zykey\":\"http://admin.grkfcs.cn/profile/upload/2020/06/03/d74ecbf8d85c0593ac88b92a413980b2.mp4\"}','oE-QCw1sLCEA19BxvtPFnaVKmzJg','admin',NULL),(170,'537799943511871488',382,400,3,'wx05205937134439b0a229e3601888031500',NULL,NULL,'4.00',2,'2020-06-08 12:08:14','2020-06-05 20:59:11',2,'{\"categoryId\":200,\"click\":26,\"createTime\":1591198385000,\"id\":2,\"isAllow\":true,\"isLei\":true,\"isPreview\":false,\"logo\":\"/profile/upload/2020/06/03/a9eff7c8afa616d9c93a88f22bc7b823.png\",\"money\":\"2-5\",\"name\":\"3\",\"shijian\":\"752\",\"shorturl\":\"\",\"url\":\"http://admin.grkfcs.cn/profile/upload/2020/06/03/a9eff7c8afa616d9c93a88f22bc7b823.png\",\"userid\":\"admin\",\"zykey\":\"http://admin.grkfcs.cn/profile/upload/2020/06/03/06072fccb54f90b6533d439572ea02d7.mp4\"}','oE-QCw1sLCEA19BxvtPFnaVKmzJg','admin','537153140672172032');
/*!40000 ALTER TABLE `sys_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(2,'se','项目经理',2,'0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(3,'hr','人力资源',3,'0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(4,'user','普通员工',4,'0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'管理员','admin',1,'1','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','管理员'),(2,'普通角色','common',2,'2','0','0','admin','2018-03-16 11:33:00','admin','2020-03-23 22:33:47','普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2007),(2,2008),(2,2009),(2,2010),(2,2011),(2,2012),(2,2013),(2,2014),(2,2015),(2,2016);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_short`
--

DROP TABLE IF EXISTS `sys_short`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_short`
--

LOCK TABLES `sys_short` WRITE;
/*!40000 ALTER TABLE `sys_short` DISABLE KEYS */;
INSERT INTO `sys_short` VALUES (9,'mQFJEj71','https://dwz.cn/pUMzLug3','http://yuluncc.top/?userid=mQFJEj71','0','2020-03-26 18:53:08',NULL),(10,'SfNYWe5c','https://dwz.cn/Hax4dgWG','http://yuluncc.top/?userid=SfNYWe5c','0','2020-04-09 18:20:24',NULL),(11,'WNz9dKGm','post','http://yuluncc.top/?userid=WNz9dKGm','0','2020-06-08 18:32:29',NULL),(12,'0K9FpDRK','post','http://yuluncc.top/?userid=0K9FpDRK','0','2020-06-08 19:12:09',NULL);
/*!40000 ALTER TABLE `sys_short` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','admin','00','ry@163.com','15888888888','0','/profile/avatar/2020/04/08/a6d0271847736226a25c2b6b57f400ef.png','29c67a30398638269fe600f73a054934','111111','0','0','127.0.0.1','2020-06-12 13:15:37','admin','2018-03-16 11:33:00','ry','2020-06-12 13:15:37','管理员',NULL,NULL),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','8e6d98b90472783cc73c17047ddccf36','222222','0','0','127.0.0.1','2018-03-16 11:33:00','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','测试员',NULL,NULL),(100,105,'1111','的订单','00','syst1em@163.com','13902000000','1','','79f944a0ae0dad2cced8e81fe47aeee1','5aa645','0','2','',NULL,'admin','2020-03-17 23:19:11','admin','2020-03-17 23:35:32','',NULL,NULL),(101,105,'11111','11111','00','syst2em@163.com','13900000000','1','','634df297ad5ee27f8ca538b76ee8b901','9ca760','0','2','127.0.0.1','2020-03-17 23:36:10','admin','2020-03-17 23:26:15','','2020-03-17 23:36:10','代理用户',NULL,NULL),(102,105,'111111','的订单','00','system@163.com','13152602082','1','','ad7ffc392edb700c6fe97c3065238de0','139c73','0','2','',NULL,'admin','2020-03-18 09:39:33','admin','2020-03-18 09:44:08','代理用户',NULL,NULL),(103,105,'p','4S1CowT0','00','system@163.com','18257824232','1','','29c67a30398638269fe600f73a054934','111111','0','2','',NULL,'admin','2020-03-18 09:45:03','',NULL,'代理用户',NULL,NULL),(104,105,'lizhi','lizhi','00','system@163.com','18069267499','1','','8b8d063ca5746c8d1f25c1a6e32571b3','65e222','0','2','127.0.0.1','2020-03-18 09:48:11','admin','2020-03-18 09:48:01','','2020-03-18 09:48:11','代理用户',NULL,NULL),(105,105,'eFHfoWRK','的订单','00','system@163.com','15186479998','1','','b9048ae7028838669fa29b64c5c2c396','0d3c17','0','2','127.0.0.1','2020-03-22 22:51:35','admin','2020-03-22 22:34:24','','2020-03-22 22:51:35','代理用户',NULL,NULL),(106,105,'lijiao','lijiao','00','lijiao@163.com','13999999999','0','','540b139b585a861c68b25917c4d23d45','54665a','0','2','127.0.0.1','2020-03-22 22:53:19','admin','2020-03-22 22:52:58','','2020-03-22 22:53:19',NULL,NULL,NULL),(107,105,'13900000001','11111','00','13900000001@163.com','13900000001','0','','21c77ae0f549232c4db199c579e3258f','7215f5','0','2','',NULL,'admin','2020-03-22 22:58:53','',NULL,'1',NULL,NULL),(108,105,'pMBzr6PX','pMBzr6PX','00','system@163.com','13021455977','1','/profile/avatar/2020/03/22/e57f73eca09c1a8f583e6e7029f39d4c.png','46d8fdae95df9c9ef0cb9111c9bfbab7','34ae05','0','2','127.0.0.1','2020-03-22 23:44:48','admin','2020-03-22 23:02:52','','2020-03-22 23:44:48','代理用户',NULL,NULL),(109,105,'HvlhdQp4','HvlhdQp4','00','system@163.com','17108940375','1','','3d9986f5e4bb4e50635e7f7f5f920056','f37943','0','2','127.0.0.1','2020-03-23 11:12:15','admin','2020-03-23 11:12:10','','2020-03-23 11:12:15','代理用户',NULL,NULL),(110,105,'PSJGU5OG','PSJGU5OG','00','system@163.com','15046844832','1','','2ba45bed2a36228a546ae6ae0d30fad0','18e195','0','2','127.0.0.1','2020-03-23 13:37:06','admin','2020-03-23 13:37:00','','2020-03-23 13:37:06','代理用户',NULL,NULL),(111,105,'gCCs9Lry','gCCs9Lry','00','system@163.com','13686297920','1','','c2562e327b14270876e0b19050fc7009','479e79','0','2','',NULL,'admin','2020-03-23 13:39:54','',NULL,'代理用户',NULL,NULL),(112,105,'6eaJSulU','6eaJSulU','00','system@163.com','17002456229','1','','1ea0ef0f8a9da4239a60008a08c1a48f','d812fd','0','2','',NULL,'admin','2020-03-23 13:48:19','',NULL,'代理用户',NULL,NULL),(113,105,'0DwXA9Cg','0DwXA9Cg','00','system@163.com','18289621212','1','','fe910c99471f2eab9aa381f42152aef4','3435a4','0','2','',NULL,'admin','2020-03-23 13:51:02','',NULL,'代理用户',NULL,NULL),(114,105,'n0TaVdrW','n0TaVdrW','00','system@163.com','15288995473','1','','d02864daaa87e833744534b6804079c5','f0ff2a','0','2','',NULL,'admin','2020-03-23 13:54:18','',NULL,'代理用户',NULL,NULL),(115,105,'ZEVcL34H','ZEVcL34H','00','system@163.com','17082524040','1','','155aff1df444d1d51abd71ec0daf85fd','f3f882','0','0','',NULL,'admin','2020-03-23 13:58:32','',NULL,'代理用户',NULL,NULL),(116,105,'EGbJ2hg0','EGbJ2hg0','00','system@163.com','17015773313','1','','30492cd20fce3acb454d6ca98c9f8f27','98fb0b','0','0','',NULL,'admin','2020-03-23 14:52:22','',NULL,'代理用户',NULL,NULL),(118,105,'DwpqVNYS','DwpqVNYS','00','system@163.com','18070683074','1','','668d83745bac4035b5698d5c21e58e37','19a570','0','0','',NULL,'admin','2020-03-23 15:16:16','',NULL,'代理用户',NULL,NULL),(119,105,'yHUGMiTt','yHUGMiTt','00','system@163.com','17535027943','1','','deb81e1cab3ed05f817b7272b2d7c432','8fb8fb','0','0','127.0.0.1','2020-03-23 16:55:24','admin','2020-03-23 15:19:19','','2020-03-24 12:46:52','代理用户',NULL,NULL),(120,105,'13aA5iX6','13aA5iX6','00','system@163.com','14784152565','1','','6633e269189935a051b3296e39f3a024','d96f4d','0','0','139.227.72.2','2020-03-26 18:36:07','admin','2020-03-26 18:36:03','','2020-03-26 18:36:07','代理用户','13aA5iX6','13aA5iX6'),(121,105,'mQFJEj71','mQFJEj71','00','system@163.com','13388186271','1','','5cabf52c2142d4edda7d3221a364c9ff','9905d1','0','0','139.227.72.2','2020-03-26 18:53:10','admin','2020-03-26 18:53:06','','2020-03-26 18:53:10','代理用户','mQFJEj71','mQFJEj71'),(122,105,'SfNYWe5c','SfNYWe5c','00','system@163.com','17105303609','1','','127da095e43042ec8049a8d2263736b4','71a8c5','0','0','223.166.134.39','2020-04-13 21:30:21','admin','2020-04-09 18:20:21','','2020-04-13 21:30:21','代理用户','SfNYWe5c','SfNYWe5c'),(123,105,'13900000002','的订单','00','lizhichange@gmail.com','13900000002','0','','56f4c5ac0707822481612997bebace68','e28f25','0','0','',NULL,'admin','2020-06-07 11:16:06','',NULL,'dd',NULL,NULL),(124,105,'LwrXdgu8','LwrXdgu8','00','system@163.com','13356185603','1','','976a82adbb951756d80616c60b4d80d2','1548df','0','0','',NULL,'admin','2020-06-08 17:43:30','',NULL,'代理用户','LwrXdgu8','LwrXdgu8'),(125,105,'e79EH63o','e79EH63o','00','system@163.com','17343151168','1','','f1628388849283851f01a4832caf36c2','4f8733','0','0','127.0.0.1','2020-06-08 17:57:08','admin','2020-06-08 17:56:12','','2020-06-08 17:57:08','代理用户','e79EH63o','e79EH63o'),(126,105,'F6Si1pHp','F6Si1pHp','00','system@163.com','13689741916','1','','01a48fa9aa052218bc91b19db4f266b9','83647b','0','0','',NULL,'admin','2020-06-08 17:58:17','',NULL,'代理用户','F6Si1pHp','F6Si1pHp'),(127,105,'6fzuYVKL','6fzuYVKL','00','system@163.com','18781805152','1','','7b74874909d8cf6dca16727f7cfda26b','29618b','0','0','',NULL,'admin','2020-06-08 18:28:05','',NULL,'代理用户','6fzuYVKL','6fzuYVKL'),(128,105,'WNz9dKGm','WNz9dKGm','00','system@163.com','18926421343','1','','c9dbb7c45fa638cbcdc514638ea0cea2','7d2311','0','0','',NULL,'admin','2020-06-08 18:31:02','',NULL,'代理用户','WNz9dKGm','WNz9dKGm'),(129,105,'0K9FpDRK','0K9FpDRK','00','system@163.com','17275191735','1','','55dbc34e101b06f23495178c1eae1f75','dcaf9f','0','0','',NULL,'admin','2020-06-08 18:36:14','',NULL,'代理用户','0K9FpDRK','0K9FpDRK');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_online`
--

DROP TABLE IF EXISTS `sys_user_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `expire_time` int(5) DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='在线用户记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_online`
--

LOCK TABLES `sys_user_online` WRITE;
/*!40000 ALTER TABLE `sys_user_online` DISABLE KEYS */;
INSERT INTO `sys_user_online` VALUES ('31383102-8162-4cf4-9cfe-339c8b00751e','admin','研发部门','127.0.0.1','内网IP','Chrome 8','Mac OS X','on_line','2020-06-12 13:15:35','2020-06-12 13:15:37',1800000);
/*!40000 ALTER TABLE `sys_user_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2),(100,4),(101,4),(102,4),(103,4),(104,4),(105,4),(106,4),(107,4),(108,4),(109,4),(110,4),(111,4),(120,4),(121,4),(122,4),(123,2),(124,4),(125,4),(126,4),(127,4),(128,4),(129,4);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(100,2),(101,2),(102,2),(105,2),(106,2),(107,2),(108,2),(109,2),(110,2),(111,2),(120,2),(121,2),(122,2),(123,2),(124,2),(125,2),(126,2),(127,2),(128,2),(129,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_web_main`
--

DROP TABLE IF EXISTS `sys_web_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_web_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `main_url` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '链接地址',
  `main_status` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_web_main`
--

LOCK TABLES `sys_web_main` WRITE;
/*!40000 ALTER TABLE `sys_web_main` DISABLE KEYS */;
INSERT INTO `sys_web_main` VALUES (7,'http://127.0.0.1:8083','0','2020-04-08 22:04:04','2020-04-24 23:08:38');
/*!40000 ALTER TABLE `sys_web_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wechat_config`
--

DROP TABLE IF EXISTS `sys_wechat_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `gmt_modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新日期',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uq_idx_001` (`config_code`,`env_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wechat_config`
--

LOCK TABLES `sys_wechat_config` WRITE;
/*!40000 ALTER TABLE `sys_wechat_config` DISABLE KEYS */;
INSERT INTO `sys_wechat_config` VALUES (10,'WY_FULI','dev','wx590af156c3a3eae9','8af481db51cd509f26c857a75712c9ce',NULL,'22f5c38598681b0d5179d84fc3bc576a',NULL,NULL,NULL,'2016-12-13 10:08:57','2020-04-01 13:37:07',NULL,NULL),(11,'WY_FULI','druid','wx590af156c3a3eae9','8af481db51cd509f26c857a75712c9ce',NULL,'22f5c38598681b0d5179d84fc3bc576a',NULL,NULL,NULL,'2020-04-01 13:07:41','2020-04-01 13:37:07',NULL,NULL),(12,'FULIHUI_YOUFULI','dev','wx851c20b0d27a586b','666155ee0ef3dbd6224447d000483298','1487632962','22f5c38598681b0d5179d84fc3bc576a','/home/fulihui/secure/youfuli_apiclient_cert.p12','EvIYhBs2ZuM0EvjScv2J9Ad2dbIlaZSU','lxOjHNlrewtzPEHCBh7boSmq9jlAe7JF5CINVf2a8IZ','2017-11-24 09:24:50','2020-04-01 13:37:07',NULL,NULL),(13,'FULIHUI_YOUFULI','druid','wx851c20b0d27a586b','666155ee0ef3dbd6224447d000483298','1487632962','22f5c38598681b0d5179d84fc3bc576a','/home/fulihui/secure/youfuli_apiclient_cert.p12','EvIYhBs2ZuM0EvjScv2J9Ad2dbIlaZSU','lxOjHNlrewtzPEHCBh7boSmq9jlAe7JF5CINVf2a8IZ','2017-11-24 09:24:50','2020-04-01 13:37:07',NULL,NULL);
/*!40000 ALTER TABLE `sys_wechat_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wechat_token`
--

DROP TABLE IF EXISTS `sys_wechat_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wechat_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `appid` varchar(64) NOT NULL COMMENT '微信公众号标识',
  `secret` varchar(128) DEFAULT NULL,
  `token` varchar(512) NOT NULL COMMENT '凭证',
  `token_type` varchar(32) NOT NULL COMMENT '凭证类型',
  `expires_in` int(11) NOT NULL COMMENT '凭证有效时间，单位：秒',
  `gmt_create` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `gmt_modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wechat_token`
--

LOCK TABLES `sys_wechat_token` WRITE;
/*!40000 ALTER TABLE `sys_wechat_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_wechat_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_detail`
--

DROP TABLE IF EXISTS `t_user_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_detail`
--

LOCK TABLES `t_user_detail` WRITE;
/*!40000 ALTER TABLE `t_user_detail` DISABLE KEYS */;
INSERT INTO `t_user_detail` VALUES (319856,'ce76933d-24b5-4692-ae32-fbf3f10935b9','6ZSZ5Yir5a2X44CC',NULL,'男',NULL,NULL,NULL,'2020-04-11 14:05:42',NULL,'2020-04-11 14:05:42',NULL,NULL,NULL,'',NULL,NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/jUmdG7ShH21iaKE6Dgdm7Dyosm0n1JtzPHLdJWlWbs40kpobEWibhefhBlj85XC7ic5htt4OD3YrQ7qGV0RUqLkoQ/132',NULL,NULL,NULL),(319857,'4ed66873-93da-4292-b1c9-0f0740a419a4','aGVsbG8=',NULL,'男',NULL,NULL,NULL,'2020-04-13 11:52:35',NULL,'2020-04-13 11:52:35',NULL,NULL,NULL,'',NULL,NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/crPfj3icZB3Ufw6JIeXZ0rRRPO48rgpqNcdcUSXnyyqiaRCXmXmEJ9x9ibUztK6S9rA5ERJlia5PLI0SOyic2MbicpKA/132',NULL,NULL,NULL),(319858,'3e57ac79-abb2-407b-b739-440c61c91e4c','5Lmx5LqG5oCd57uq8J+MtPCfjLQ=',NULL,'男',NULL,NULL,NULL,'2020-04-13 12:21:26',NULL,'2020-04-13 12:21:26',NULL,NULL,NULL,'',NULL,NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/p1ut5BVxyhwJ7lD62TuGIzTW4yXcUgz0J7DoF3KsliaaMfnKZx1DkhGtgkf6B25xnt65aGlPUWLic9zoN0xMHfhA/132',NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_user_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_wechat_auth`
--

DROP TABLE IF EXISTS `t_wechat_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_wechat_auth`
--

LOCK TABLES `t_wechat_auth` WRITE;
/*!40000 ALTER TABLE `t_wechat_auth` DISABLE KEYS */;
INSERT INTO `t_wechat_auth` VALUES (319078,'oE-QCw1sLCEA19BxvtPFnaVKmzJg','ce76933d-24b5-4692-ae32-fbf3f10935b9','1','wx851c20b0d27a586b','odN-NwA2ixxV2hzl09jM2n2eoTSk','\\0','2020-04-11 14:05:42',NULL,'2020-04-11 14:05:42',NULL),(319079,'oE-QCw1BX_3TiPLJ68bOs04KLmuQ','4ed66873-93da-4292-b1c9-0f0740a419a4','1','wx851c20b0d27a586b','odN-NwO12CJEGiGvy1UAtdjgIwTg','\\0','2020-04-13 11:52:36',NULL,'2020-04-13 11:52:36',NULL),(319080,'oE-QCw8fkoCzw5hNbH_fur4qIgdg','3e57ac79-abb2-407b-b739-440c61c91e4c','1','wx851c20b0d27a586b','odN-NwIXtuN4tJNja-7gQ02vtAv0','\\0','2020-04-13 12:21:26',NULL,'2020-04-13 12:21:26',NULL);
/*!40000 ALTER TABLE `t_wechat_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade`
--

DROP TABLE IF EXISTS `trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade`
--

LOCK TABLES `trade` WRITE;
/*!40000 ALTER TABLE `trade` DISABLE KEYS */;
INSERT INTO `trade` VALUES ('540024151658729472','system','system','bank','0K9FpDRK',0,'1',NULL,'system',NULL,NULL,'0','2020-06-11 15:26:27','admin','2020-06-11 15:30:57',NULL,'2020-06-11 15:26:27','0'),('540025812850577408','system','system','bank','1',1,'1',NULL,'system',NULL,NULL,'建设银行','2020-06-11 15:33:03','admin','2020-06-11 15:33:27',NULL,'2020-06-11 15:33:03','111'),('540035606181318656','system','system','bank','1',0,'0',NULL,'system',NULL,NULL,'0','2020-06-11 16:11:57','admin','2020-06-11 16:11:57',NULL,'2020-06-11 16:11:57','0');
/*!40000 ALTER TABLE `trade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts`
--

DROP TABLE IF EXISTS `ts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts`
--

LOCK TABLES `ts` WRITE;
/*!40000 ALTER TABLE `ts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yqm`
--

DROP TABLE IF EXISTS `yqm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yqm`
--

LOCK TABLES `yqm` WRITE;
/*!40000 ALTER TABLE `yqm` DISABLE KEYS */;
INSERT INTO `yqm` VALUES (28,'admin','13aA5iX6','2020-03-26 18:35:44','13aA5iX6','1','2020-03-26 18:35:44','2020-03-26 18:36:03'),(29,'admin','mQFJEj71','2020-03-26 18:52:46','mQFJEj71','1','2020-03-26 18:52:46','2020-03-26 18:53:06'),(30,'admin','SfNYWe5c','2020-04-09 18:19:53','SfNYWe5c','1','2020-04-09 18:19:53','2020-04-09 18:20:21'),(31,'admin','LwrXdgu8','2020-06-07 10:58:36','LwrXdgu8','1','2020-06-07 10:58:36','2020-06-08 17:43:36'),(32,'admin','e79EH63o','2020-06-08 17:55:57','e79EH63o','1','2020-06-08 17:55:57','2020-06-08 17:56:12'),(33,'admin','F6Si1pHp','2020-06-08 17:57:52','F6Si1pHp','1','2020-06-08 17:57:52','2020-06-08 17:58:20'),(34,'admin','6fzuYVKL','2020-06-08 18:27:47','6fzuYVKL','1','2020-06-08 18:27:47','2020-06-08 18:28:05'),(35,'admin','WNz9dKGm','2020-06-08 18:30:37','WNz9dKGm','1','2020-06-08 18:30:37','2020-06-08 18:31:02'),(36,'admin','0K9FpDRK','2020-06-08 18:35:44','0K9FpDRK','1','2020-06-08 18:35:44','2020-06-08 18:36:14');
/*!40000 ALTER TABLE `yqm` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-19 14:27:04
