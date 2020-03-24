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

 Date: 18/12/2019 21:45:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_wechat_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_wechat_token`;
CREATE TABLE `sys_wechat_token`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `appid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信公众号标识',
  `secret` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '凭证',
  `token_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '凭证类型',
  `expires_in` int(11) NOT NULL COMMENT '凭证有效时间，单位：秒',
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_wechat_token
-- ----------------------------
INSERT INTO `sys_wechat_token` VALUES (21, 'wxc4e652fa7a6befad', '4381ebd5a7f9ec3192f787eab602ed46', '24_IA8w6hsvG_sTimCgUrM6PJTcyseGZlV5H4qxmidNilPgC_KRwH_U3UouppB2_BGX2v5k8f_9XVy0Cb5xXoiagrhmo82nEF6Zb-psvTa97TkQU8qgXxJaA1KddtzJyhZuRoTEfpTSHoTUJNwyETRbADALAY', 'ACCESS_TOKEN', 7200, '2018-03-09 18:23:36', '2019-08-16 21:18:00');
INSERT INTO `sys_wechat_token` VALUES (22, 'wxc4e652fa7a6befad', '4381ebd5a7f9ec3192f787eab602ed46', 'kgt8ON7yVITDhtdwci0qeSu8cRAIfDqoocl4pGxLn6DQA6yGdYH2UyBHNdQOEOYV76vgy3dQz_LywOOYntmnag', 'JS_API_TICKET', 7200, '2018-03-09 18:23:36', '2019-08-16 21:18:00');
INSERT INTO `sys_wechat_token` VALUES (34, 'wx7ba7071deb746a7b', '910da681a7ac902ffbf8fa77af2b4321', '27_zui4vx7JM-wRJkIIycjhdgD8h3k0jhbta_HlH7W2tp0yPEnDNlzCpivgZfgAjYqZ0z6AwZqzEBhBdauzaMeiirIi5Kdc8QgEGDfsDqOOczh5Sh1387EaUe8jn-1YNkD_JsRlm38UI4YKU7v6LNBcAGABDR', 'ACCESS_TOKEN', 7200, '2018-06-10 14:53:47', '2019-11-27 00:39:00');
INSERT INTO `sys_wechat_token` VALUES (35, 'wx7ba7071deb746a7b', '910da681a7ac902ffbf8fa77af2b4321', 'kgt8ON7yVITDhtdwci0qebd7OZ2VzvGlgfzKSpHIJYKIfFBHeLcHFn3H1k-ffG11kzlttqPKTHkAwTdXh9ah4g', 'JS_API_TICKET', 7200, '2018-06-10 14:53:47', '2019-11-27 00:39:00');
INSERT INTO `sys_wechat_token` VALUES (36, 'wxc1fedef4ed755cdc', '8801f1045b10e12e28a6fe76471bb042', '27_iQr4Zvh360GflreXUdrcsEAfFnk2VHmCOu_U_klEF6dojHMVOeNkDRIEYuZ-XZ6yhhs_VcQuv5B-FqdFzVX8aLpR82YYfBcaQj80H2QvEGBuR3QLrw3LGxi5y_DIUlielewL5pQOj-9hIJLgEPNfABAWHF', 'ACCESS_TOKEN', 7200, '2018-11-05 15:03:05', '2019-11-27 01:15:00');
INSERT INTO `sys_wechat_token` VALUES (37, 'wxc1fedef4ed755cdc', '8801f1045b10e12e28a6fe76471bb042', 'kgt8ON7yVITDhtdwci0qea1blH3_qE0H-kpU8hs9oSNQffgHX6n1cKhseygMlO-tpOgIKwBx9TUnhf-jmFAjbg', 'JS_API_TICKET', 7200, '2018-11-05 15:03:05', '2019-11-27 01:15:00');

SET FOREIGN_KEY_CHECKS = 1;
