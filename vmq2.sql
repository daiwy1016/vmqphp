/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : vmq

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 20/10/2020 16:43:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pay_order
-- ----------------------------
DROP TABLE IF EXISTS `pay_order`;
CREATE TABLE `pay_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `close_date` bigint(20) NOT NULL,
  `create_date` bigint(20) NOT NULL,
  `is_auto` int(11) NOT NULL,
  `notify_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_date` bigint(20) NOT NULL,
  `pay_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NOT NULL,
  `really_price` double NOT NULL,
  `return_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_order
-- ----------------------------
INSERT INTO `pay_order` VALUES (2, 0, 1603179004, 1, 'http://vmqphp.test/notifyUrl', '202010201510043552', 'c1', 0, '1547129707139', 'wxp://f2f0QQQ4Zb8YmJhajc3J_JCjcQlDbGMTSy2A', 0.1, 0.1, 'http://vmqphp.test/returnUrl', 1, 1);

-- ----------------------------
-- Table structure for pay_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `pay_qrcode`;
CREATE TABLE `pay_qrcode`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pay_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `vkey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vvalue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`vkey`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES ('user', 'admin');
INSERT INTO `setting` VALUES ('pass', 'admin58451201314');
INSERT INTO `setting` VALUES ('notifyUrl', 'http://vmqphp.test/notifyUrl');
INSERT INTO `setting` VALUES ('returnUrl', 'http://vmqphp.test/returnUrl');
INSERT INTO `setting` VALUES ('key', '123456789');
INSERT INTO `setting` VALUES ('lastheart', '1603178954');
INSERT INTO `setting` VALUES ('lastpay', '0');
INSERT INTO `setting` VALUES ('jkstate', '1');
INSERT INTO `setting` VALUES ('close', '5');
INSERT INTO `setting` VALUES ('payQf', '1');
INSERT INTO `setting` VALUES ('wxpay', 'wxp://f2f0QQQ4Zb8YmJhajc3J_JCjcQlDbGMTSy2A');
INSERT INTO `setting` VALUES ('zfbpay', 'https://qr.alipay.com/fkx16710vzcvjtufuajym8f');

-- ----------------------------
-- Table structure for tmp_price
-- ----------------------------
DROP TABLE IF EXISTS `tmp_price`;
CREATE TABLE `tmp_price`  (
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `oid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`price`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tmp_price
-- ----------------------------
INSERT INTO `tmp_price` VALUES ('10-1', '202010201510043552');
INSERT INTO `tmp_price` VALUES ('11-1', '202010201510317312');

SET FOREIGN_KEY_CHECKS = 1;
