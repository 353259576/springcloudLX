/*
Navicat MySQL Data Transfer

Source Server         : ws
Source Server Version : 50637
Source Host           : localhost:3306
Source Database       : qupu

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2017-09-08 11:00:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_vendor_gl`
-- ----------------------------
DROP TABLE IF EXISTS `t_vendor_gl`;
CREATE TABLE `t_vendor_gl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint(20) NOT NULL,
  `coupon_type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_vendor_gl
-- ----------------------------
INSERT INTO `t_vendor_gl` VALUES ('4', '4', '3');
INSERT INTO `t_vendor_gl` VALUES ('5', '16', '3');
INSERT INTO `t_vendor_gl` VALUES ('6', '20', '3');
INSERT INTO `t_vendor_gl` VALUES ('7', '10', '3');
INSERT INTO `t_vendor_gl` VALUES ('8', '2', '4');
INSERT INTO `t_vendor_gl` VALUES ('9', '17', '4');
INSERT INTO `t_vendor_gl` VALUES ('10', '21', '4');
INSERT INTO `t_vendor_gl` VALUES ('11', '10', '4');
INSERT INTO `t_vendor_gl` VALUES ('12', '27', '4');
INSERT INTO `t_vendor_gl` VALUES ('13', '24', '4');
INSERT INTO `t_vendor_gl` VALUES ('14', '15', '4');
INSERT INTO `t_vendor_gl` VALUES ('15', '19', '4');
INSERT INTO `t_vendor_gl` VALUES ('16', '20', '4');
INSERT INTO `t_vendor_gl` VALUES ('17', '18', '5');
INSERT INTO `t_vendor_gl` VALUES ('18', '26', '5');
INSERT INTO `t_vendor_gl` VALUES ('19', '4', '6');
INSERT INTO `t_vendor_gl` VALUES ('20', '2', '7');
INSERT INTO `t_vendor_gl` VALUES ('21', '21', '7');
INSERT INTO `t_vendor_gl` VALUES ('22', '15', '7');
INSERT INTO `t_vendor_gl` VALUES ('30', '4', '8');
INSERT INTO `t_vendor_gl` VALUES ('31', '18', '8');
INSERT INTO `t_vendor_gl` VALUES ('32', '26', '47');
INSERT INTO `t_vendor_gl` VALUES ('33', '4', '46');
INSERT INTO `t_vendor_gl` VALUES ('34', '27', '46');
INSERT INTO `t_vendor_gl` VALUES ('35', '18', '43');
INSERT INTO `t_vendor_gl` VALUES ('36', '13', '43');
INSERT INTO `t_vendor_gl` VALUES ('37', '16', '43');
INSERT INTO `t_vendor_gl` VALUES ('38', '17', '45');
INSERT INTO `t_vendor_gl` VALUES ('39', '21', '45');
INSERT INTO `t_vendor_gl` VALUES ('40', '5', '45');
INSERT INTO `t_vendor_gl` VALUES ('41', '18', '45');
INSERT INTO `t_vendor_gl` VALUES ('42', '16', '12');
INSERT INTO `t_vendor_gl` VALUES ('43', '11', '12');
