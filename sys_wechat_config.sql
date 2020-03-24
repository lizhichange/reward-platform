/*
 Navicat Premium Data Transfer

 Source Server         : 172.16.50.131
 Source Server Type    : MySQL
 Source Server Version : 50632
 Source Host           : 172.16.50.131:3306
 Source Schema         : systemcore

 Target Server Type    : MySQL
 Target Server Version : 50632
 File Encoding         : 65001

 Date: 18/12/2019 21:16:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_wechat_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_wechat_config`;
CREATE TABLE `sys_wechat_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `config_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信配置标识',
  `env_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '环境类型',
  `app_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信appid',
  `appsecret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信 appsecret',
  `mch_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户id',
  `sign_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名key',
  `cert_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证书地址',
  `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'token令牌',
  `encoding_aes_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息加解密密钥',
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建日期',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_idx_001`(`config_code`, `env_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_wechat_config
-- ----------------------------
INSERT INTO `sys_wechat_config` VALUES (1, 'FULIHUI_WECHAT', 'RELEASE', 'wx7ba7071deb746a7b', '910da681a7ac902ffbf8fa77af2b4321', '1358533402', 'rCyVjzGxJqwfdfMeLacicM4SUbr2RbQv', '/home/fulihui/secure/apiclient_cert.p12', 'rCyVjzGxJqwfdfMeLacicM4SUbr2RbQv', 'iEiwCCtIjZihErAm0kxnp8zVZy5JIFDdulOoxwuww2m', '2016-06-29 13:00:05', '2017-01-06 03:22:00');
INSERT INTO `sys_wechat_config` VALUES (3, 'HAHA_FULI', 'RELEASE', 'wxc1fedef4ed755cdc', '8801f1045b10e12e28a6fe76471bb042', NULL, NULL, NULL, NULL, NULL, '2016-12-13 18:08:57', '2016-12-16 19:35:02');
INSERT INTO `sys_wechat_config` VALUES (4, 'DUIHUAN_WECHAT', 'RELEASE', 'wxc4e652fa7a6befad', '4381ebd5a7f9ec3192f787eab602ed46', '1492103602', '22f5c38598681b0d5179d84fc3bc576a', '/home/fulihui/secure/apiclient_cert.p12\r\n', '', '', '2017-11-24 17:24:50', '2017-11-27 17:00:08');
INSERT INTO `sys_wechat_config` VALUES (5, 'FULIHUI_YOUFULI', 'RELEASE', 'wx851c20b0d27a586b', '01bd403f94c28429b5d8317d66180a26', '1487632962', '22f5c38598681b0d5179d84fc3bc576a', '/home/fulihui/secure/youfuli_apiclient_cert.p12', '', '', '2017-11-24 17:24:50', '2018-01-16 13:48:54');

SET FOREIGN_KEY_CHECKS = 1;
