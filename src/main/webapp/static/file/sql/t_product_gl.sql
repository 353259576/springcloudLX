/*
Navicat MySQL Data Transfer

Source Server         : ws
Source Server Version : 50637
Source Host           : localhost:3306
Source Database       : qupu

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2017-09-08 11:00:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_product_gl`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_gl`;
CREATE TABLE `t_product_gl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `coupon_type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product_gl
-- ----------------------------
INSERT INTO `t_product_gl` VALUES ('6', '104', '3');
INSERT INTO `t_product_gl` VALUES ('7', '105', '3');
INSERT INTO `t_product_gl` VALUES ('8', '106', '3');
INSERT INTO `t_product_gl` VALUES ('9', '107', '3');
INSERT INTO `t_product_gl` VALUES ('10', '133', '3');
INSERT INTO `t_product_gl` VALUES ('11', '134', '3');
INSERT INTO `t_product_gl` VALUES ('12', '135', '3');
INSERT INTO `t_product_gl` VALUES ('13', '136', '3');
INSERT INTO `t_product_gl` VALUES ('14', '153', '3');
INSERT INTO `t_product_gl` VALUES ('15', '154', '3');
INSERT INTO `t_product_gl` VALUES ('16', '155', '3');
INSERT INTO `t_product_gl` VALUES ('17', '109', '3');
INSERT INTO `t_product_gl` VALUES ('18', '110', '3');
INSERT INTO `t_product_gl` VALUES ('19', '111', '3');
INSERT INTO `t_product_gl` VALUES ('20', '112', '3');
INSERT INTO `t_product_gl` VALUES ('21', '113', '3');
INSERT INTO `t_product_gl` VALUES ('22', '94', '4');
INSERT INTO `t_product_gl` VALUES ('23', '95', '4');
INSERT INTO `t_product_gl` VALUES ('24', '96', '4');
INSERT INTO `t_product_gl` VALUES ('25', '97', '4');
INSERT INTO `t_product_gl` VALUES ('26', '98', '4');
INSERT INTO `t_product_gl` VALUES ('27', '141', '4');
INSERT INTO `t_product_gl` VALUES ('28', '143', '4');
INSERT INTO `t_product_gl` VALUES ('29', '156', '4');
INSERT INTO `t_product_gl` VALUES ('30', '157', '4');
INSERT INTO `t_product_gl` VALUES ('31', '158', '4');
INSERT INTO `t_product_gl` VALUES ('32', '109', '4');
INSERT INTO `t_product_gl` VALUES ('33', '110', '4');
INSERT INTO `t_product_gl` VALUES ('34', '111', '4');
INSERT INTO `t_product_gl` VALUES ('35', '112', '4');
INSERT INTO `t_product_gl` VALUES ('36', '113', '4');
INSERT INTO `t_product_gl` VALUES ('37', '179', '4');
INSERT INTO `t_product_gl` VALUES ('38', '180', '4');
INSERT INTO `t_product_gl` VALUES ('39', '181', '4');
INSERT INTO `t_product_gl` VALUES ('40', '182', '4');
INSERT INTO `t_product_gl` VALUES ('41', '183', '4');
INSERT INTO `t_product_gl` VALUES ('42', '184', '4');
INSERT INTO `t_product_gl` VALUES ('43', '185', '4');
INSERT INTO `t_product_gl` VALUES ('44', '186', '4');
INSERT INTO `t_product_gl` VALUES ('45', '187', '4');
INSERT INTO `t_product_gl` VALUES ('46', '165', '4');
INSERT INTO `t_product_gl` VALUES ('47', '129', '4');
INSERT INTO `t_product_gl` VALUES ('48', '130', '4');
INSERT INTO `t_product_gl` VALUES ('49', '131', '4');
INSERT INTO `t_product_gl` VALUES ('50', '132', '4');
INSERT INTO `t_product_gl` VALUES ('51', '149', '4');
INSERT INTO `t_product_gl` VALUES ('52', '150', '4');
INSERT INTO `t_product_gl` VALUES ('53', '151', '4');
INSERT INTO `t_product_gl` VALUES ('54', '152', '4');
INSERT INTO `t_product_gl` VALUES ('55', '153', '4');
INSERT INTO `t_product_gl` VALUES ('56', '154', '4');
INSERT INTO `t_product_gl` VALUES ('57', '155', '4');
INSERT INTO `t_product_gl` VALUES ('58', '144', '5');
INSERT INTO `t_product_gl` VALUES ('59', '145', '5');
INSERT INTO `t_product_gl` VALUES ('60', '146', '5');
INSERT INTO `t_product_gl` VALUES ('61', '147', '5');
INSERT INTO `t_product_gl` VALUES ('62', '148', '5');
INSERT INTO `t_product_gl` VALUES ('63', '174', '5');
INSERT INTO `t_product_gl` VALUES ('64', '175', '5');
INSERT INTO `t_product_gl` VALUES ('65', '176', '5');
INSERT INTO `t_product_gl` VALUES ('66', '177', '5');
INSERT INTO `t_product_gl` VALUES ('67', '178', '5');
INSERT INTO `t_product_gl` VALUES ('68', '104', '6');
INSERT INTO `t_product_gl` VALUES ('69', '105', '6');
INSERT INTO `t_product_gl` VALUES ('70', '106', '6');
INSERT INTO `t_product_gl` VALUES ('71', '107', '6');
INSERT INTO `t_product_gl` VALUES ('72', '94', '7');
INSERT INTO `t_product_gl` VALUES ('73', '95', '7');
INSERT INTO `t_product_gl` VALUES ('74', '96', '7');
INSERT INTO `t_product_gl` VALUES ('75', '97', '7');
INSERT INTO `t_product_gl` VALUES ('76', '98', '7');
INSERT INTO `t_product_gl` VALUES ('77', '156', '7');
INSERT INTO `t_product_gl` VALUES ('78', '157', '7');
INSERT INTO `t_product_gl` VALUES ('79', '158', '7');
INSERT INTO `t_product_gl` VALUES ('80', '129', '7');
INSERT INTO `t_product_gl` VALUES ('81', '130', '7');
INSERT INTO `t_product_gl` VALUES ('82', '131', '7');
INSERT INTO `t_product_gl` VALUES ('83', '132', '7');
INSERT INTO `t_product_gl` VALUES ('104', '104', '8');
INSERT INTO `t_product_gl` VALUES ('105', '105', '8');
INSERT INTO `t_product_gl` VALUES ('106', '106', '8');
INSERT INTO `t_product_gl` VALUES ('107', '107', '8');
INSERT INTO `t_product_gl` VALUES ('108', '144', '8');
INSERT INTO `t_product_gl` VALUES ('109', '145', '8');
INSERT INTO `t_product_gl` VALUES ('110', '146', '8');
INSERT INTO `t_product_gl` VALUES ('111', '147', '8');
INSERT INTO `t_product_gl` VALUES ('112', '148', '8');
INSERT INTO `t_product_gl` VALUES ('113', '174', '47');
INSERT INTO `t_product_gl` VALUES ('114', '175', '47');
INSERT INTO `t_product_gl` VALUES ('115', '176', '47');
INSERT INTO `t_product_gl` VALUES ('116', '177', '47');
INSERT INTO `t_product_gl` VALUES ('117', '178', '47');
INSERT INTO `t_product_gl` VALUES ('118', '179', '46');
INSERT INTO `t_product_gl` VALUES ('119', '180', '46');
INSERT INTO `t_product_gl` VALUES ('120', '181', '46');
INSERT INTO `t_product_gl` VALUES ('121', '182', '46');
INSERT INTO `t_product_gl` VALUES ('122', '183', '46');
INSERT INTO `t_product_gl` VALUES ('123', '184', '46');
INSERT INTO `t_product_gl` VALUES ('124', '185', '46');
INSERT INTO `t_product_gl` VALUES ('125', '186', '46');
INSERT INTO `t_product_gl` VALUES ('126', '187', '46');
INSERT INTO `t_product_gl` VALUES ('127', '144', '43');
INSERT INTO `t_product_gl` VALUES ('128', '145', '43');
INSERT INTO `t_product_gl` VALUES ('129', '146', '43');
INSERT INTO `t_product_gl` VALUES ('130', '147', '43');
INSERT INTO `t_product_gl` VALUES ('131', '148', '43');
INSERT INTO `t_product_gl` VALUES ('132', '121', '43');
INSERT INTO `t_product_gl` VALUES ('133', '122', '43');
INSERT INTO `t_product_gl` VALUES ('134', '123', '43');
INSERT INTO `t_product_gl` VALUES ('135', '124', '43');
INSERT INTO `t_product_gl` VALUES ('136', '125', '43');
INSERT INTO `t_product_gl` VALUES ('137', '133', '43');
INSERT INTO `t_product_gl` VALUES ('138', '134', '43');
INSERT INTO `t_product_gl` VALUES ('139', '135', '43');
INSERT INTO `t_product_gl` VALUES ('140', '136', '43');
INSERT INTO `t_product_gl` VALUES ('141', '140', '45');
INSERT INTO `t_product_gl` VALUES ('142', '141', '45');
INSERT INTO `t_product_gl` VALUES ('143', '142', '45');
INSERT INTO `t_product_gl` VALUES ('144', '143', '45');
INSERT INTO `t_product_gl` VALUES ('145', '156', '45');
INSERT INTO `t_product_gl` VALUES ('146', '157', '45');
INSERT INTO `t_product_gl` VALUES ('147', '158', '45');
INSERT INTO `t_product_gl` VALUES ('148', '108', '45');
INSERT INTO `t_product_gl` VALUES ('149', '144', '45');
INSERT INTO `t_product_gl` VALUES ('150', '145', '45');
INSERT INTO `t_product_gl` VALUES ('151', '146', '45');
INSERT INTO `t_product_gl` VALUES ('152', '147', '45');
INSERT INTO `t_product_gl` VALUES ('153', '148', '45');
INSERT INTO `t_product_gl` VALUES ('154', '133', '12');
INSERT INTO `t_product_gl` VALUES ('155', '134', '12');
INSERT INTO `t_product_gl` VALUES ('156', '135', '12');
INSERT INTO `t_product_gl` VALUES ('157', '136', '12');
INSERT INTO `t_product_gl` VALUES ('158', '114', '12');
INSERT INTO `t_product_gl` VALUES ('159', '115', '12');
INSERT INTO `t_product_gl` VALUES ('160', '116', '12');
