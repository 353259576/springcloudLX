/*
Navicat MySQL Data Transfer

Source Server         : ws
Source Server Version : 50637
Source Host           : localhost:3306
Source Database       : qupu

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2017-09-11 10:22:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_activity_list`
-- ----------------------------
DROP TABLE IF EXISTS `t_activity_list`;
CREATE TABLE `t_activity_list` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `update_user` varchar(255) DEFAULT NULL,
  `status` varchar(4) DEFAULT '0' COMMENT '活动类型',
  `to_url` varchar(255) DEFAULT NULL,
  `state` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100022 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_activity_list
-- ----------------------------
INSERT INTO `t_activity_list` VALUES ('100005', 'http://localhost:8080/static/upload/images/201708/150362131162912752.jpg', '519847818', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '2017-08-25 08:35:19', '2017-08-25 08:35:19', null, null, '1', 'admin/admin/login.do', '');
INSERT INTO `t_activity_list` VALUES ('100006', 'http://localhost:8080/static/upload/images/201708/150362145628248944.jpg', 'dsfsdfsd', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '2017-08-25 08:37:44', '2017-08-25 08:49:29', '10001', '10001', '2', 'admin/admin/login.do', '');
INSERT INTO `t_activity_list` VALUES ('100007', 'http://localhost:8080/static/upload/images/201708/150362157047114650.jpg', 'sdfsdfsd', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '2017-08-25 08:39:39', '2017-08-25 08:40:10', '10001', '10001', '1', 'admin/admin/login.do', '');
INSERT INTO `t_activity_list` VALUES ('100008', 'http://localhost:8080/static/upload/images/201708/150362166139590123.jpg', 'gdfgdfgfd', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '2017-08-25 08:41:09', '2017-08-25 08:41:09', '10001', null, '1', 'admin/admin/login.do', '');
INSERT INTO `t_activity_list` VALUES ('100009', 'http://localhost:8080/static/upload/images/201708/150362168053796038.jpg', '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '2017-08-25 08:41:30', '2017-08-29 16:06:43', '10001', '10001', '1', 'admin/admin/login.do', '');
INSERT INTO `t_activity_list` VALUES ('100010', 'http://localhost:8080/static/upload/images/201708/150414684209421936.jpg', 'gfdgdfgds', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '2017-08-25 08:41:48', '2017-08-31 10:34:04', '10001', '10001', '1', 'admin/admin/login.do', '');
INSERT INTO `t_activity_list` VALUES ('100011', 'http://localhost:8080/static/upload/images/201708/150362172695032931.jpg', '梵蒂冈地方规定发给', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '2017-08-25 08:42:15', '2017-08-25 08:42:15', '10001', null, '1', 'admin/admin/login.do', '');
INSERT INTO `t_activity_list` VALUES ('100012', 'http://localhost:8080/static/upload/images/201708/150362175161718762.jpg', '地方规定发给对方', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '2017-08-25 08:42:45', '2017-08-25 08:42:45', '10001', null, '1', 'admin/admin/login.do', '');
INSERT INTO `t_activity_list` VALUES ('100013', 'http://localhost:8080/static/upload/images/201708/150362177307260583.jpg', '是的范德萨发斯蒂芬', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '2017-08-25 08:43:02', '2017-08-25 08:43:02', '10001', null, '1', 'admin/admin/login.do', '');
INSERT INTO `t_activity_list` VALUES ('100014', 'http://localhost:8080/static/upload/images/201708/150362179499989183.jpg', '防守打法多少', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '2017-08-25 08:43:23', '2017-08-25 08:43:23', '10001', null, '1', 'admin/admin/login.do', '');
INSERT INTO `t_activity_list` VALUES ('100015', 'http://localhost:8080/static/upload/images/201708/150362181500460954.jpg', '胜多负少东方闪电541541', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '2017-08-25 08:43:43', '2017-08-25 08:43:43', '10001', null, '1', 'admin/admin/login.do', '');
INSERT INTO `t_activity_list` VALUES ('100016', 'http://localhost:8080/static/upload/images/201708/150362183213272466.jpg', '十', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '2017-08-25 08:44:00', '2017-09-01 01:37:50', '10001', '10001', '1', 'admin/admin/login.do', '');
INSERT INTO `t_activity_list` VALUES ('100017', '1', null, null, null, '2017-08-29 13:34:26', '2017-08-29 13:34:26', '10001', null, null, null, '');
INSERT INTO `t_activity_list` VALUES ('100018', '1', null, null, null, '2017-08-29 13:46:01', '2017-08-29 13:46:01', '10001', null, null, null, '');
INSERT INTO `t_activity_list` VALUES ('100019', '1', null, null, null, '2017-08-29 13:48:23', '2017-08-29 13:48:23', '10001', null, null, null, '');
INSERT INTO `t_activity_list` VALUES ('100020', 'http://localhost:8080/static/upload/images/201709/150426028804861150.jpg', '1000', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '2017-08-30 13:24:37', '2017-09-01 18:04:50', '10001', '10001', '1', '10000', '');
INSERT INTO `t_activity_list` VALUES ('100021', 'http://localhost:8080/static/upload/images/201709/150475193042949935.jpg', '123423', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '2017-09-07 10:38:55', '2017-09-07 10:38:55', '10001', null, '123', '123', '');

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` bigint(20) NOT NULL COMMENT '用户组id',
  `admin_name` varchar(32) NOT NULL COMMENT '用户名',
  `admin_realname` varchar(16) DEFAULT NULL COMMENT '真实姓名',
  `admin_password` varchar(32) DEFAULT NULL COMMENT '登录密码',
  `admin_phone` varchar(16) DEFAULT NULL COMMENT '手机号',
  `admin_num` varchar(16) DEFAULT NULL COMMENT '员工编号',
  `admin_addr` varchar(255) DEFAULT NULL COMMENT '所属区域',
  `admin_create_time` datetime DEFAULT NULL COMMENT '账号创建日期',
  `admin_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `admin_login_ip` varchar(64) DEFAULT NULL COMMENT '上次登录ip',
  `admin_flag` tinyint(2) DEFAULT '1' COMMENT '是否可编辑 1-可编辑 0-不可编辑',
  `is_delete` bit(1) DEFAULT b'0' COMMENT '是否删除 1-是 0-否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_admin_username` (`admin_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台管理员';

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('10000', '10000', 'superadmin', '超管', '0ff0313fbae6183f40f8f919cc81d8a7', '17730215488', '001', null, '2016-04-23 15:36:55', '2017-06-06 16:52:02', '127.0.0.1', '0', '');
INSERT INTO `t_admin` VALUES ('10001', '10001', 'admin', '技术管理', 'c4ca4238a0b923820dcc509a6f75849b', '17730215423', '002', null, '2016-04-28 16:40:33', '2017-09-01 01:25:47', '0:0:0:0:0:0:0:1', '0', '');
INSERT INTO `t_admin` VALUES ('10002', '10002', 'gaomin', '高敏', '72738ce8b80899cb12636333525f4e12', '13966684228', '007', '安徽省/合肥市/蜀山区', '2016-05-13 10:58:17', '2017-06-06 16:21:57', '127.0.0.1', '1', '');
INSERT INTO `t_admin` VALUES ('10003', '10003', 'zhang', '老张', 'c4ca4238a0b923820dcc509a6f75849b', '17730215512', '004', null, '2016-05-13 11:37:13', null, null, '1', '');
INSERT INTO `t_admin` VALUES ('10004', '10004', 'laoli', '老李', 'c4ca4238a0b923820dcc509a6f75849b', '17730215424', '005', null, '2016-06-01 12:33:35', null, null, '1', '');
INSERT INTO `t_admin` VALUES ('10005', '10004', 'test', '测试', 'c4ca4238a0b923820dcc509a6f75849b', '17730215412', '006', null, '2016-08-29 16:26:23', null, null, '1', '');
INSERT INTO `t_admin` VALUES ('10006', '10004', 'test02', '啊啊啊', 'c4ca4238a0b923820dcc509a6f75849b', '17730215429', '007', null, '2016-10-09 15:47:13', null, null, '1', '');

-- ----------------------------
-- Table structure for `t_article`
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `article_title` varchar(64) DEFAULT NULL COMMENT '标题',
  `article_content` text COMMENT '内容',
  `article_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `article_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `article_update_admin` varchar(32) DEFAULT NULL COMMENT '更新人',
  `is_delete` bit(1) DEFAULT b'0' COMMENT '状态 0-删除 1-正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='文章表';

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('10000', '标题2', '123', '2016-09-24 10:20:16', '2016-09-24 14:50:46', 'admin', '');
INSERT INTO `t_article` VALUES ('10001', '标题3', 'dsadas', '2016-09-26 09:30:06', null, 'admin', '');
INSERT INTO `t_article` VALUES ('10002', '标题1', '123', '2016-09-24 10:20:17', null, null, '');
INSERT INTO `t_article` VALUES ('10003', '标题4', null, '2016-10-20 16:55:15', null, 'admin', '');
INSERT INTO `t_article` VALUES ('10004', '标题5', 'dasd sad', '2016-11-12 09:44:10', '2016-11-12 09:44:33', 'admin', '');

-- ----------------------------
-- Table structure for `t_banner`
-- ----------------------------
DROP TABLE IF EXISTS `t_banner`;
CREATE TABLE `t_banner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `banner_title` varchar(64) DEFAULT NULL COMMENT '标题',
  `banner_image` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `banner_url` varchar(255) DEFAULT NULL COMMENT '指向地址',
  `banner_sort` tinyint(5) DEFAULT '0' COMMENT '排序',
  `banner_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `banner_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `banner_update_admin` varchar(32) DEFAULT NULL COMMENT '更新人',
  `is_delete` bit(1) DEFAULT b'0' COMMENT '状态 0-删除 1-正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10009 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='轮播图';

-- ----------------------------
-- Records of t_banner
-- ----------------------------
INSERT INTO `t_banner` VALUES ('10004', 'banner1', 'http://116.62.144.206/static/upload/images/201705/149515997222742112.jpg', 'www.banner1.com', '1', '2017-05-19 10:13:09', null, 'admin', '');
INSERT INTO `t_banner` VALUES ('10006', 'banner3', 'http://116.62.144.206/static/upload/images/201705/149516001349341388.jpg', 'www.banner3.com', '3', '2017-05-19 10:13:38', null, 'admin', '');
INSERT INTO `t_banner` VALUES ('10008', 'banner2', 'http://116.62.144.206/static/upload/images/201706/149630796913160184.jpg', 'www.banner2.com', '2', '2017-06-01 17:06:42', null, 'admin', '');

-- ----------------------------
-- Table structure for `t_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config` (
  `id` int(11) NOT NULL,
  `per1` int(11) DEFAULT NULL COMMENT '可贷金额比例',
  `per2` decimal(2,2) DEFAULT NULL COMMENT '砍价比例',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='配置';

-- ----------------------------
-- Records of t_config
-- ----------------------------
INSERT INTO `t_config` VALUES ('1', '80', '0.01');

-- ----------------------------
-- Table structure for `t_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon`;
CREATE TABLE `t_coupon` (
  `id` bigint(25) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `price` decimal(10,0) DEFAULT NULL COMMENT '价格',
  `end_time` datetime DEFAULT NULL COMMENT '使用结束时间',
  `start_time` datetime DEFAULT NULL COMMENT '使用开始时间',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态',
  `v_time` datetime DEFAULT NULL COMMENT '使用时间',
  `type` varchar(255) DEFAULT NULL COMMENT '优惠券类型',
  `create_time` datetime DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `tackId` bigint(20) DEFAULT NULL COMMENT '订单号',
  `user_id` bigint(25) DEFAULT NULL,
  `coupon_type_id` bigint(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000025 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_coupon
-- ----------------------------
INSERT INTO `t_coupon` VALUES ('100000016', '打蜡', '3', '2017-09-24 00:00:00', '2017-08-24 10:38:39', '0', null, '0', '2017-08-24 10:38:39', '100017', null, null, '824103838724873', '100017', null);
INSERT INTO `t_coupon` VALUES ('100000017', '玻璃水', '3', '2017-09-24 00:00:00', '2017-08-24 10:38:51', '0', null, '0', '2017-08-24 10:38:51', '100017', null, null, '824103850551376', '100017', null);
INSERT INTO `t_coupon` VALUES ('100000018', '玻璃水', '3', '2017-09-24 00:00:00', '2017-08-24 10:38:57', '0', null, '0', '2017-08-24 10:38:57', '100017', null, null, '824103857492765', '100017', null);
INSERT INTO `t_coupon` VALUES ('100000019', '玻璃水', '3', '2017-09-25 00:00:00', '2017-08-25 08:32:41', '0', null, '0', '2017-08-25 08:32:41', '100017', null, null, '825083240571466', '100017', null);
INSERT INTO `t_coupon` VALUES ('100000020', '优惠券max', '100000', '2017-10-10 12:12:12', '2017-01-10 12:12:12', '0', null, '0', '2017-09-08 10:08:06', '10161', null, null, null, '10161', '8');
INSERT INTO `t_coupon` VALUES ('100000021', '优惠券max', '100000', '2017-10-10 12:12:12', '2017-01-10 12:12:12', '1', '2017-09-08 17:27:32', '0', '2017-09-08 10:10:54', '10161', null, null, null, '10161', '8');
INSERT INTO `t_coupon` VALUES ('100000022', '1561', '62', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '0', null, '0', '2017-09-08 13:09:00', '10161', null, null, null, '10161', '13');
INSERT INTO `t_coupon` VALUES ('100000023', '1561', '62', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '0', null, '0', '2017-09-08 14:45:19', '10161', null, null, '90814451980839', '10161', '13');
INSERT INTO `t_coupon` VALUES ('100000024', '1561', '62', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '0', null, '0', '2017-09-11 10:04:18', '10164', null, null, '911100417924851', '10164', '13');

-- ----------------------------
-- Table structure for `t_coupon_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_type`;
CREATE TABLE `t_coupon_type` (
  `id` bigint(25) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '优惠券名',
  `type` tinyint(4) DEFAULT NULL,
  `num` int(10) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` bigint(25) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` bigint(25) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `remakes` varchar(255) DEFAULT NULL COMMENT '备注',
  `condition` varchar(25) DEFAULT NULL COMMENT '使用条件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_coupon_type
-- ----------------------------
INSERT INTO `t_coupon_type` VALUES ('1', '优惠券1', '1', '10', '100', '2017-09-14 08:52:38', '10005', '2017-09-08 13:14:05', '10001', '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '101111112', '1100');
INSERT INTO `t_coupon_type` VALUES ('2', '1', '1', '12', '22', '2017-09-07 09:16:06', '10005', null, null, '0', '2017-01-01 00:00:00', '2017-02-02 00:00:00', '453', '45345');
INSERT INTO `t_coupon_type` VALUES ('3', '1245', '123', '523', '123', '2017-09-07 09:19:22', '10001', null, null, '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '312', '23');
INSERT INTO `t_coupon_type` VALUES ('4', '优惠券2', '1', '12', '100', '2017-09-07 09:44:44', '10001', null, null, '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '453453', '1000');
INSERT INTO `t_coupon_type` VALUES ('5', '52345', '53', '453', '543', '2017-09-07 10:23:42', '10001', null, null, '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '453', '543');
INSERT INTO `t_coupon_type` VALUES ('6', '121212', '9', '12121', '2121', '2017-09-07 10:25:36', '10001', null, null, '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '2122', '12');
INSERT INTO `t_coupon_type` VALUES ('7', '1561', '1', '61', '62', '2017-09-07 11:34:11', '10001', null, null, '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('8', '优惠券max', '1', '9', '100000', '2017-09-07 11:34:24', '10001', '2017-09-07 16:40:45', null, '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', 'max', '0');
INSERT INTO `t_coupon_type` VALUES ('9', '1561', '1', '61', '62', '2017-09-07 11:34:28', '10001', null, null, '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('10', '删除', '1', '61', '62', '2017-09-07 11:34:28', '10001', '2017-09-07 16:46:21', null, '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('11', '1561', '1', '61', '62', '2017-09-07 11:34:29', '10001', '2017-09-08 13:13:26', '10001', '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('12', '优惠券改', '1', '61', '62', '2017-09-07 11:34:29', '10001', '2017-09-08 11:24:43', '10001', '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('13', '1561', '1', '58', '62', '2017-09-07 11:34:29', '10001', '2017-09-11 08:59:38', '10001', '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('14', '1561', '1', '61', '62', '2017-09-07 11:34:29', '10001', null, null, '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('15', '1561', '1', '61', '62', '2017-09-07 11:34:29', '10001', null, null, '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('16', '1561', '1', '61', '62', '2017-09-07 11:34:30', '10001', null, null, '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('17', '1561', '1', '61', '62', '2017-09-07 11:34:30', '10001', null, null, '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('18', '1561', '1', '61', '62', '2017-09-07 11:34:30', '10001', null, null, '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('19', '1561', '1', '61', '62', '2017-09-07 11:34:31', '10001', null, null, '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('20', '1561', '1', '61', '62', '2017-09-07 11:34:31', '10001', null, null, '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('21', '1561', '1', '61', '62', '2017-09-07 11:34:31', '10001', null, null, '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('22', '1561', '1', '61', '62', '2017-09-07 11:34:31', '10001', null, null, '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('23', '1561', '1', '61', '62', '2017-09-07 11:34:32', '10001', null, null, '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('24', '1561', '1', '61', '62', '2017-09-07 11:34:32', '10001', null, null, '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('25', '1561', '1', '61', '62', '2017-09-07 11:34:32', '10001', null, null, '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('26', '1561', '1', '61', '62', '2017-09-07 11:34:32', '10001', null, null, '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('27', '1561', '1', '61', '62', '2017-09-07 11:34:32', '10001', null, null, '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('28', '1561', '1', '61', '62', '2017-09-07 11:34:32', '10001', null, null, '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('29', '1561', '1', '61', '62', '2017-09-07 11:34:33', '10001', null, null, '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('30', '1561', '1', '61', '62', '2017-09-07 11:34:33', '10001', null, null, '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('31', '1561', '1', '61', '62', '2017-09-07 11:34:33', '10001', null, null, '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('32', '1561', '1', '61', '62', '2017-09-07 11:34:33', '10001', null, null, '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('33', '1561', '1', '61', '62', '2017-09-07 11:34:33', '10001', null, null, '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('34', '1561', '1', '61', '62', '2017-09-07 11:34:34', '10001', null, null, '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('35', '1561', '1', '61', '62', '2017-09-07 11:34:34', '10001', null, null, '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('36', '1561', '1', '61', '62', '2017-09-07 11:34:34', '10001', null, null, '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('37', '1561', '1', '61', '62', '2017-09-07 11:34:34', '10001', '2017-09-08 13:26:31', '10001', '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('38', '1561', '1', '61', '62', '2017-09-07 11:34:34', '10001', null, null, '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('39', '1561', '1', '61', '62', '2017-09-07 11:34:34', '10001', null, null, '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('40', '1561', '1', '61', '62', '2017-09-07 11:34:35', '10001', null, null, '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('41', '1561', '1', '61', '62', '2017-09-07 11:34:35', '10001', null, null, '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('42', '1561', '1', '61', '62', '2017-09-07 11:34:35', '10001', null, null, '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '51', '15');
INSERT INTO `t_coupon_type` VALUES ('43', '优惠券4', '1', '10', '100', '2017-09-07 12:01:02', '10001', '2017-09-08 08:12:27', '10001', '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '1001', '1000');
INSERT INTO `t_coupon_type` VALUES ('44', '999', '99', '99', '99', '2017-09-06 12:54:03', '10001', null, null, null, null, null, null, null);
INSERT INTO `t_coupon_type` VALUES ('45', '999', '99', '999', '999', '2017-09-07 12:56:39', '10001', '2017-09-08 08:13:23', '10001', '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '99', '99');
INSERT INTO `t_coupon_type` VALUES ('46', '1233213231', '12', '12', '21', '2017-09-07 15:06:19', '10001', '2017-09-08 08:08:10', '10001', '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '123', '123');
INSERT INTO `t_coupon_type` VALUES ('47', '12312', '1', '100', '100', '2017-09-07 15:26:23', '10001', '2017-09-08 08:07:51', '10001', '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '123', '100');
INSERT INTO `t_coupon_type` VALUES ('48', '优惠券改1', '1', '100', '100', '2017-09-08 11:25:22', '10001', null, null, '0', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '12124', '1000');

-- ----------------------------
-- Table structure for `t_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `content` varchar(512) DEFAULT NULL COMMENT '内容',
  `image` varchar(128) DEFAULT NULL COMMENT '图片',
  `concat` varchar(32) DEFAULT NULL COMMENT '联系方式',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='意见反馈';

-- ----------------------------
-- Records of t_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `t_finance`
-- ----------------------------
DROP TABLE IF EXISTS `t_finance`;
CREATE TABLE `t_finance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `apply_count` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='金融机构';

-- ----------------------------
-- Records of t_finance
-- ----------------------------
INSERT INTO `t_finance` VALUES ('1', '去扑金融', '156', '100%申请通过');

-- ----------------------------
-- Table structure for `t_fund_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_fund_detail`;
CREATE TABLE `t_fund_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型 1-充值 2-抢购 3-积分',
  `money` decimal(15,2) DEFAULT NULL COMMENT '金额',
  `score` int(11) DEFAULT NULL COMMENT '积分',
  `plus` bit(1) DEFAULT NULL COMMENT '是否收入 1-是 0-否',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `curr_money` decimal(15,2) DEFAULT NULL COMMENT '当前余额',
  `curr_score` int(11) DEFAULT NULL COMMENT '当前积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10597 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='资金记录';

-- ----------------------------
-- Records of t_fund_detail
-- ----------------------------
INSERT INTO `t_fund_detail` VALUES ('10568', '10155', '3', null, '10', null, '2017-08-01 17:27:04', '绑定手机号', '0.00', '10');
INSERT INTO `t_fund_detail` VALUES ('10569', '10155', '3', null, '5', null, '2017-08-01 17:27:04', '每日登陆', '0.00', '15');
INSERT INTO `t_fund_detail` VALUES ('10570', '10155', '4', '5.00', null, '', '2017-08-01 17:27:04', '绑定手机号', '5.00', '15');
INSERT INTO `t_fund_detail` VALUES ('10571', '10156', '3', null, '10', null, '2017-08-01 17:28:40', '绑定手机号', '0.00', '10');
INSERT INTO `t_fund_detail` VALUES ('10572', '10156', '3', null, '5', null, '2017-08-01 17:28:40', '每日登陆', '0.00', '15');
INSERT INTO `t_fund_detail` VALUES ('10573', '10156', '4', '5.00', null, '', '2017-08-01 17:28:40', '绑定手机号', '5.00', '15');
INSERT INTO `t_fund_detail` VALUES ('10574', '10157', '3', null, '10', null, '2017-08-01 17:35:29', '绑定手机号', '0.00', '10');
INSERT INTO `t_fund_detail` VALUES ('10575', '10157', '3', null, '5', null, '2017-08-01 17:35:29', '每日登陆', '0.00', '15');
INSERT INTO `t_fund_detail` VALUES ('10576', '10157', '4', '5.00', null, '', '2017-08-01 17:35:29', '绑定手机号', '5.00', '15');
INSERT INTO `t_fund_detail` VALUES ('10577', '10157', '3', null, '20', null, '2017-08-01 18:56:14', '补全我的资质', '5.00', '35');
INSERT INTO `t_fund_detail` VALUES ('10578', '10156', '3', null, '5', null, '2017-08-02 08:38:49', '每日登陆', '5.00', '20');
INSERT INTO `t_fund_detail` VALUES ('10579', '10157', '3', null, '5', null, '2017-08-02 09:26:07', '每日登陆', '5.00', '40');
INSERT INTO `t_fund_detail` VALUES ('10580', '10157', '3', null, '5', null, '2017-08-03 13:35:22', '每日登陆', '5.00', '45');
INSERT INTO `t_fund_detail` VALUES ('10581', '10155', '3', null, '5', null, '2017-08-09 08:50:13', '每日登陆', '5.00', '20');
INSERT INTO `t_fund_detail` VALUES ('10582', '10156', '3', null, '5', null, '2017-08-09 13:33:03', '每日登陆', '5.00', '25');
INSERT INTO `t_fund_detail` VALUES ('10583', '10156', '3', null, '5', null, '2017-08-10 08:50:38', '每日登陆', '5.00', '30');
INSERT INTO `t_fund_detail` VALUES ('10584', '10158', '3', null, '10', null, '2017-08-10 10:00:33', '绑定手机号', '0.00', '10');
INSERT INTO `t_fund_detail` VALUES ('10585', '10158', '3', null, '5', null, '2017-08-10 10:00:33', '每日登陆', '0.00', '15');
INSERT INTO `t_fund_detail` VALUES ('10586', '10158', '4', '5.00', null, '', '2017-08-10 10:00:33', '绑定手机号', '5.00', '15');
INSERT INTO `t_fund_detail` VALUES ('10587', '10155', '3', null, '5', null, '2017-08-10 10:52:33', '每日登陆', '5.00', '25');
INSERT INTO `t_fund_detail` VALUES ('10588', '10157', '3', null, '5', null, '2017-08-10 11:15:38', '每日登陆', '5.00', '50');
INSERT INTO `t_fund_detail` VALUES ('10589', '10156', '3', null, '5', null, '2017-08-15 13:54:39', '每日登陆', '5.00', '35');
INSERT INTO `t_fund_detail` VALUES ('10590', '10156', '3', null, '5', null, '2017-08-18 13:32:37', '每日登陆', '5.00', '40');
INSERT INTO `t_fund_detail` VALUES ('10591', '10160', '3', null, '10', null, '2017-09-08 10:01:38', '绑定手机号', '0.00', '10');
INSERT INTO `t_fund_detail` VALUES ('10592', '10160', '3', null, '5', null, '2017-09-08 10:01:38', '每日登陆', '0.00', '15');
INSERT INTO `t_fund_detail` VALUES ('10593', '10160', '4', '5.00', null, '', '2017-09-08 10:01:38', '绑定手机号', '5.00', '15');
INSERT INTO `t_fund_detail` VALUES ('10594', '10161', '3', null, '10', null, '2017-09-08 10:08:06', '绑定手机号', '0.00', '10');
INSERT INTO `t_fund_detail` VALUES ('10595', '10161', '3', null, '5', null, '2017-09-08 10:08:06', '每日登陆', '0.00', '15');
INSERT INTO `t_fund_detail` VALUES ('10596', '10161', '4', '5.00', null, '', '2017-09-08 10:08:06', '绑定手机号', '5.00', '15');

-- ----------------------------
-- Table structure for `t_grade`
-- ----------------------------
DROP TABLE IF EXISTS `t_grade`;
CREATE TABLE `t_grade` (
  `id` int(11) NOT NULL,
  `gname` varchar(255) DEFAULT NULL,
  `gimage` varchar(255) DEFAULT NULL,
  `gvalue` int(11) DEFAULT NULL COMMENT '最低分值',
  `kcount` int(11) DEFAULT NULL COMMENT '可砍价次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员等级';

-- ----------------------------
-- Records of t_grade
-- ----------------------------
INSERT INTO `t_grade` VALUES ('1', '注册会员', null, '10', '1');
INSERT INTO `t_grade` VALUES ('2', '青铜会员', null, '100', '2');
INSERT INTO `t_grade` VALUES ('3', '白银会员', null, '1500', '3');
INSERT INTO `t_grade` VALUES ('4', '黄金会员', null, '5000', '4');
INSERT INTO `t_grade` VALUES ('5', '钻石会员', null, '10000', '5');

-- ----------------------------
-- Table structure for `t_insurance`
-- ----------------------------
DROP TABLE IF EXISTS `t_insurance`;
CREATE TABLE `t_insurance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `plate` varchar(16) DEFAULT NULL COMMENT '车牌号',
  `xing_license_front` varchar(128) DEFAULT NULL,
  `xing_license_back` varchar(128) DEFAULT NULL,
  `driver_license_back` varchar(128) DEFAULT NULL,
  `driver_license_front` varchar(128) DEFAULT NULL,
  `driver_license` varchar(128) DEFAULT NULL COMMENT '行驶证',
  `car_name` varchar(255) DEFAULT NULL COMMENT '汽车型号',
  `realname` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `idcard` varchar(32) DEFAULT NULL COMMENT '身份证号码',
  `mobile_phone` varchar(16) DEFAULT NULL COMMENT '手机号',
  `car_addr` varchar(255) DEFAULT NULL COMMENT '地址 省-市-区',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `ins_num` varchar(32) DEFAULT NULL COMMENT '单号',
  `second` int(4) DEFAULT NULL COMMENT '一年内是否是二手车',
  `listing` bit(1) DEFAULT NULL COMMENT '是否挂牌',
  `ins_state` tinyint(4) DEFAULT '0' COMMENT '状态 0-申请中 1-已申请 2-电话回访 3-上门服务 4-投保成功',
  `car_age` int(4) DEFAULT NULL,
  `status` int(4) DEFAULT '1',
  `carjia_code` varchar(50) DEFAULT NULL COMMENT '识别号',
  `shibie_code` varchar(50) DEFAULT NULL,
  `fadongjiNum` varchar(50) DEFAULT NULL,
  `registrationDate` datetime DEFAULT NULL,
  `jiashiCode` varchar(50) DEFAULT NULL,
  `shenqingDate` datetime DEFAULT NULL,
  `baodanDate` datetime DEFAULT NULL,
  `querenDate` datetime DEFAULT NULL,
  `toubaoDate` datetime DEFAULT NULL,
  `errordate` datetime DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `zipStatus` int(4) DEFAULT NULL,
  `listing1` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='保险';

-- ----------------------------
-- Records of t_insurance
-- ----------------------------
INSERT INTO `t_insurance` VALUES ('88', '10148', null, null, null, 'http://localhost:8080/static/upload/images/201708/150157559361173219.jpeg', 'http://localhost:8080/static/upload/images/201708/150157558913690647.jpeg', null, null, '张又一', null, null, '合肥市', '2017-08-01 16:19:55', '0801161955252611', null, '', '0', '4', '2', '11111111111111111', '111', '111111', null, '123123', '2017-08-01 16:22:10', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('89', '10147', '藏Fewwww', 'http://localhost:8080/static/upload/images/201708/150157571800856849.png', 'http://localhost:8080/static/upload/images/201708/150157572562691854.png', 'http://localhost:8080/static/upload/images/201708/150157571176841368.png', 'http://localhost:8080/static/upload/images/201708/150157570412076434.png', null, null, '234', null, null, '阿里地区/噶尔县', '2017-08-01 16:22:08', '0801162207619241', null, '', '0', '3', '3', '234', '234', '234', null, '324', '2017-08-01 16:23:51', null, '2017-08-01 16:24:50', null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('90', '10148', null, null, null, 'http://localhost:8080/static/upload/images/201708/150157577780925522.jpeg', 'http://localhost:8080/static/upload/images/201708/150157577347191920.jpeg', null, null, null, null, null, '合肥市', '2017-08-01 16:22:59', '0801162259403402', null, '', '0', '4', '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('91', '10151', '豫E55555', 'http://localhost:8080/static/upload/images/201708/150157744044415212.png', 'http://localhost:8080/static/upload/images/201708/150157744436425509.png', 'http://localhost:8080/static/upload/images/201708/150157743646846210.png', 'http://localhost:8080/static/upload/images/201708/150157743267648853.png', null, null, null, null, null, '安阳市/林州市', '2017-08-01 16:50:46', '0801165045574677', null, '', '0', '5', '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('92', '10148', null, null, null, 'http://localhost:8080/static/upload/images/201708/150157836634942267.jpeg', 'http://localhost:8080/static/upload/images/201708/150157836067979771.jpeg', null, null, 'zyy', null, null, '合肥市', '2017-08-01 17:06:08', '0801170608124660', null, '', '0', '4', '3', '11111111111111111', '1111', '111', null, '111', '2017-08-01 17:07:19', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('93', '10151', null, null, null, 'http://localhost:8080/static/upload/images/201708/150157860566724922.png', 'http://localhost:8080/static/upload/images/201708/150157859982346823.png', null, null, null, null, null, '阿坝藏族羌族自治州/理县', '2017-08-01 17:10:07', '0801171007104139', null, '', '0', '6', '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('94', '10151', '川hhhhhh', 'http://localhost:8080/static/upload/images/201708/150157863143675181.png', 'http://localhost:8080/static/upload/images/201708/150157863538029518.png', 'http://localhost:8080/static/upload/images/201708/150157862695180793.png', 'http://localhost:8080/static/upload/images/201708/150157862317697596.png', null, null, null, null, null, '阿坝藏族羌族自治州/理县', '2017-08-01 17:10:37', '0801171036884649', null, '', '0', '6', '3', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('95', '10147', '豫Eweeee', 'http://localhost:8080/static/upload/images/201708/150157886704226886.png', 'http://localhost:8080/static/upload/images/201708/150157887318665061.png', 'http://localhost:8080/static/upload/images/201708/150157886025370015.png', 'http://localhost:8080/static/upload/images/201708/150157885126775103.png', null, null, '12', null, null, '安阳市/林州市', '2017-08-01 17:14:35', '0801171434733676', null, '', '0', '3', '3', '123', '123', '123', null, '123', '2017-08-01 17:20:53', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('96', '10155', '皖Hiiiii', 'http://localhost:8080/static/upload/images/201708/150157965616376153.png', 'http://localhost:8080/static/upload/images/201708/150157966146531860.png', 'http://localhost:8080/static/upload/images/201708/150157965111455602.png', 'http://localhost:8080/static/upload/images/201708/150157964630116231.png', null, null, '魏冬', null, null, '安庆市/怀宁县', '2017-08-01 17:27:43', '0801172742749127', null, '', '0', '4', '3', '111111', '444444', '222223', null, '333333', '2017-08-01 17:29:20', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('97', '10156', null, null, null, 'http://localhost:8080/static/upload/images/201708/150157975535892805.jpeg', 'http://localhost:8080/static/upload/images/201708/150157975047023359.jpeg', null, null, 'zyy', null, null, '合肥市', '2017-08-01 17:29:17', '080117291722961', null, '', '0', '1', '3', '111111', '1', '1', null, '1', '2017-08-01 17:31:56', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('98', '10157', '皖Hyuuuu', 'http://localhost:8080/static/upload/images/201708/150158032419890453.png', 'http://localhost:8080/static/upload/images/201708/150158033271773471.png', 'http://localhost:8080/static/upload/images/201708/150158031514162753.png', 'http://localhost:8080/static/upload/images/201708/150158030639275656.png', null, null, null, null, null, '安庆市/宿松县', '2017-08-01 17:38:54', '0801173854352443', null, '', '0', '6', '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('99', '10155', '豫888888', 'http://localhost:8080/static/upload/images/201708/150158034317446165.png', 'http://localhost:8080/static/upload/images/201708/150158034713957060.png', 'http://localhost:8080/static/upload/images/201708/150158033498395256.png', 'http://localhost:8080/static/upload/images/201708/150158032961175766.png', null, null, null, null, null, '安阳市/龙安区', '2017-08-01 17:39:08', '0801173908482617', null, '', '0', '6', '3', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('100', '10157', '皖Huuhhh', 'http://localhost:8080/static/upload/images/201708/150158082951449119.png', 'http://localhost:8080/static/upload/images/201708/150158083713622509.png', 'http://localhost:8080/static/upload/images/201708/150158082116376774.png', 'http://localhost:8080/static/upload/images/201708/150158081323662720.png', null, null, null, null, null, '安庆市/宿松县', '2017-08-01 17:47:54', '0801174753756406', null, '', '0', '6', '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('102', '10157', '川Uuuuui', 'http://localhost:8080/static/upload/images/201708/150158101179757476.png', 'http://localhost:8080/static/upload/images/201708/150158102041942843.png', 'http://localhost:8080/static/upload/images/201708/150158100315150469.png', 'http://localhost:8080/static/upload/images/201708/150158099477298917.png', null, null, null, null, null, '阿坝藏族羌族自治州/理县', '2017-08-01 17:51:06', '080117510469301', null, '', '0', '6', '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('103', '10157', '川Uuuuui', 'http://localhost:8080/static/upload/images/201708/150158101179757476.png', 'http://localhost:8080/static/upload/images/201708/150158102041942843.png', 'http://localhost:8080/static/upload/images/201708/150158100315150469.png', 'http://localhost:8080/static/upload/images/201708/150158099477298917.png', null, null, null, null, null, '阿坝藏族羌族自治州/理县', '2017-08-01 17:51:12', '0801175111801290', null, '', '0', '6', '3', null, null, null, null, null, null, null, '2017-08-01 18:02:03', null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('104', '10157', '川Uxxxxx', 'http://localhost:8080/static/upload/images/201708/150158132363419466.png', 'http://localhost:8080/static/upload/images/201708/150158132998145860.png', 'http://localhost:8080/static/upload/images/201708/150158131768933463.png', 'http://localhost:8080/static/upload/images/201708/150158131112723445.png', null, null, null, null, null, '阿坝藏族羌族自治州/理县', '2017-08-01 17:55:37', '0801175536982449', null, '', '0', '3', '1', null, null, null, null, null, '2017-08-01 17:55:38', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('105', '10157', '川Uxxxxx', 'http://localhost:8080/static/upload/images/201708/150158132363419466.png', 'http://localhost:8080/static/upload/images/201708/150158132998145860.png', 'http://localhost:8080/static/upload/images/201708/150158131768933463.png', 'http://localhost:8080/static/upload/images/201708/150158131112723445.png', null, null, '1', null, null, '阿坝藏族羌族自治州/理县', '2017-08-01 17:56:06', '0801175605504851', null, '', '0', '3', '3', '2', '3', '4', null, '5', '2017-08-01 17:58:17', null, '2017-08-03 14:12:51', null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('106', '10157', '皖Hdddxx', 'http://localhost:8080/static/upload/images/201708/150158228861140140.png', 'http://localhost:8080/static/upload/images/201708/150158229559832424.png', 'http://localhost:8080/static/upload/images/201708/150158227676470287.png', 'http://localhost:8080/static/upload/images/201708/150158226263688961.png', null, null, null, null, null, '安庆市/宿松县', '2017-08-01 18:13:22', '0801181322142185', null, '', '0', '4', '1', null, null, null, null, null, '2017-08-01 18:13:22', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('107', '10157', '皖Hdddxx', 'http://localhost:8080/static/upload/images/201708/150158228861140140.png', 'http://localhost:8080/static/upload/images/201708/150158229559832424.png', 'http://localhost:8080/static/upload/images/201708/150158227676470287.png', 'http://localhost:8080/static/upload/images/201708/150158226263688961.png', null, null, null, null, null, '安庆市/宿松县', '2017-08-01 18:13:22', '0801181322157872', null, '', '0', '4', '1', null, null, null, null, null, '2017-08-01 18:13:22', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('108', '10155', null, null, null, 'http://localhost:8080/static/upload/images/201708/150158316530864839.png', 'http://localhost:8080/static/upload/images/201708/150158316180396502.png', null, null, 'weidong', null, null, '安阳市/内黄县', '2017-08-01 18:26:07', '0801182606755338', null, '', '0', '4', '2', '123123213', '123213213', '12321312', null, '123213123', '2017-08-01 18:27:02', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('109', '10157', '辽Cxcccc', 'http://localhost:8080/static/upload/images/201708/150158450497467456.png', 'http://localhost:8080/static/upload/images/201708/150158451222067122.png', 'http://localhost:8080/static/upload/images/201708/150158449876479495.png', 'http://localhost:8080/static/upload/images/201708/150158449232896047.png', null, null, 'xudingding', null, null, '鞍山市/千山区', '2017-08-01 18:48:34', '0801184833710514', null, '', '0', '6', '3', 'asdjflaj', 'asdfasdff', 'asdfasdf', null, 'asdfasdf', '2017-08-01 18:50:39', null, '2017-08-03 14:49:41', null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('110', '10155', null, null, null, 'http://localhost:8080/static/upload/images/201708/150163408259921867.png', 'http://localhost:8080/static/upload/images/201708/150163407865897852.png', null, null, null, null, null, '安阳市/龙安区', '2017-08-02 08:34:44', '0802083444221522', null, '', '0', '4', '1', null, null, null, null, null, '2017-08-02 08:34:44', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('111', '10155', '皖Hhhhhh', 'http://localhost:8080/static/upload/images/201708/150163427597091908.png', 'http://localhost:8080/static/upload/images/201708/150163428575088835.png', 'http://localhost:8080/static/upload/images/201708/150163426196685613.png', 'http://localhost:8080/static/upload/images/201708/150163425678873285.png', null, null, null, null, null, '安庆市/怀宁县', '2017-08-02 08:38:07', '0802083807103478', null, '', '0', '3', '1', null, null, null, null, null, '2017-08-02 08:38:07', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('112', '10156', null, null, null, 'http://localhost:8080/static/upload/images/201708/150163436447041821.jpeg', 'http://localhost:8080/static/upload/images/201708/150163435953558146.jpeg', null, null, 'zyy', null, null, '合肥市', '2017-08-02 08:41:05', '0802084105177417', null, '', '0', '5', '3', '1', '1', '1', null, '1', '2017-08-02 08:43:01', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('113', '10155', null, null, null, 'http://localhost:8080/static/upload/images/201708/150163464189854915.png', 'http://localhost:8080/static/upload/images/201708/150163463786912232.png', null, null, null, null, null, '安庆市/宿松县', '2017-08-02 08:44:03', '0802084403263223', null, '', '0', '6', '1', null, null, null, null, null, '2017-08-02 08:44:03', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('114', '10155', '皖H88888', 'http://localhost:8080/static/upload/images/201708/150163476850482797.png', 'http://localhost:8080/static/upload/images/201708/150163477277468938.png', 'http://localhost:8080/static/upload/images/201708/150163476452729294.png', 'http://localhost:8080/static/upload/images/201708/150163476041191768.png', null, null, 'payne', null, null, '安庆市/怀宁县', '2017-08-02 08:46:14', '080208461455219', null, '', '0', '6', '3', '000000', '2222222', '1111111', null, '2222222', '2017-08-02 08:47:46', null, '2017-08-02 08:51:18', null, null, null, '1', null);
INSERT INTO `t_insurance` VALUES ('115', '10155', '皖H66666', 'http://localhost:8080/static/upload/images/201708/150163514177864170.png', 'http://localhost:8080/static/upload/images/201708/150163514597192078.png', 'http://localhost:8080/static/upload/images/201708/150163513752750544.png', 'http://localhost:8080/static/upload/images/201708/150163513345928655.png', null, null, 'Yy', null, null, '安庆市/潜山县', '2017-08-02 08:52:27', '0802085227338112', null, '', '0', '4', '3', '111111', '1111111', '111111', null, '111111', '2017-08-02 08:53:44', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('116', '10155', '豫E99999', 'http://localhost:8080/static/upload/images/201708/150163554606812617.png', 'http://localhost:8080/static/upload/images/201708/150163554968425651.png', 'http://localhost:8080/static/upload/images/201708/150163554184514568.png', 'http://localhost:8080/static/upload/images/201708/150163553778639727.png', null, null, 'Yyx', null, null, '安阳市/林州市', '2017-08-02 08:59:11', '0802085910820830', null, '', '0', '6', '3', '111111', '111111', '111111', null, '111111', '2017-08-02 09:00:15', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('117', '10156', '皖Aaaaaa', 'http://localhost:8080/static/upload/images/201708/150163562251042443.jpeg', 'http://localhost:8080/static/upload/images/201708/150163562770825161.jpeg', 'http://localhost:8080/static/upload/images/201708/150163561817085368.jpeg', 'http://localhost:8080/static/upload/images/201708/150163561362575120.jpeg', null, null, 'zyy', null, null, '合肥市', '2017-08-02 09:00:29', '0802090029429713', null, '', '0', '4', '3', '1', '1', '1', null, '1', '2017-08-02 09:06:29', null, null, '2017-08-02 09:10:38', null, null, null, null);
INSERT INTO `t_insurance` VALUES ('118', '10155', '皖H88888', 'http://localhost:8080/static/upload/images/201708/150163688097232136.png', 'http://localhost:8080/static/upload/images/201708/150163688709374456.png', 'http://localhost:8080/static/upload/images/201708/150163687417169608.png', 'http://localhost:8080/static/upload/images/201708/150163686742712356.png', null, null, null, null, null, '安庆市/宿松县', '2017-08-02 09:21:29', '0802092129327640', null, '', '0', '5', '3', null, null, null, null, null, '2017-08-02 09:21:29', null, '2017-08-03 14:33:28', null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('119', '10155', '豫Emmmmm', 'http://localhost:8080/static/upload/images/201708/150163704082348600.png', 'http://localhost:8080/static/upload/images/201708/150163704461781389.png', 'http://localhost:8080/static/upload/images/201708/150163703691495962.png', 'http://localhost:8080/static/upload/images/201708/150163703342726353.png', null, null, null, null, null, '安阳市/龙安区', '2017-08-02 09:24:06', '0802092405894211', null, '', '0', '6', '1', null, null, null, null, null, '2017-08-02 09:24:06', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('120', '10155', '川Ujjjjj', 'http://localhost:8080/static/upload/images/201708/150163714206296346.png', 'http://localhost:8080/static/upload/images/201708/150163714563634941.png', 'http://localhost:8080/static/upload/images/201708/150163713818478768.png', 'http://localhost:8080/static/upload/images/201708/150163713511628109.png', null, null, null, null, null, '阿坝藏族羌族自治州/九寨沟县', '2017-08-02 09:25:47', '0802092547243529', null, '', '0', '6', '1', null, null, null, null, null, '2017-08-02 09:25:47', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('121', '10157', '皖Hjjjjj', 'http://localhost:8080/static/upload/images/201708/150163720674675812.png', 'http://localhost:8080/static/upload/images/201708/150163721336893769.png', 'http://localhost:8080/static/upload/images/201708/150163719976281096.png', 'http://localhost:8080/static/upload/images/201708/150163719169893098.png', null, null, 'xudingding', null, null, '安庆市/桐城市', '2017-08-02 09:26:55', '0802092654709209', null, '', '0', '6', '2', 'asdlfkj', 'asdfj', 'sadfkl', null, 'sdfasdf', '2017-08-02 09:28:36', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('122', '10155', null, null, null, 'http://localhost:8080/static/upload/images/201708/150163752730773056.png', 'http://localhost:8080/static/upload/images/201708/150163752294010487.png', null, null, null, null, null, '安庆市/桐城市', '2017-08-02 09:32:09', '0802093208553941', null, '', '0', '5', '1', null, null, null, null, null, '2017-08-02 09:32:09', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('123', '10155', '皖oooooo', 'http://localhost:8080/static/upload/images/201708/150163756838625775.png', 'http://localhost:8080/static/upload/images/201708/150163757201242103.png', 'http://localhost:8080/static/upload/images/201708/150163756423963988.png', 'http://localhost:8080/static/upload/images/201708/150163756072738664.png', null, null, null, null, null, '安庆市/桐城市', '2017-08-02 09:32:53', '0802093253138885', null, '', '0', '5', '2', null, null, null, null, null, '2017-08-02 09:32:53', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('124', '10156', null, null, null, 'http://localhost:8080/static/upload/images/201708/150172322802824773.jpeg', 'http://localhost:8080/static/upload/images/201708/150172322307648767.jpeg', null, null, '1', null, null, '合肥市', '2017-08-03 09:20:30', '0803092029695246', null, '', '0', '4', '3', '1', '1', '1', null, '1', '2017-08-03 10:51:35', '2017-08-03 11:26:14', '2017-08-03 13:28:58', null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('125', '10157', '皖Hsaaaa', 'http://localhost:8080/static/upload/images/201708/150173855582047301.png', 'http://localhost:8080/static/upload/images/201708/150173856208963164.png', 'http://localhost:8080/static/upload/images/201708/150173854981699979.png', 'http://localhost:8080/static/upload/images/201708/150173854427370319.png', null, null, null, null, null, '安庆市/宿松县', '2017-08-03 13:36:04', '0803133603565897', null, '', '0', '8', '1', null, null, null, null, null, '2017-08-03 13:36:04', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('126', '10157', '豫Eiiiii', 'http://localhost:8080/static/upload/images/201708/150173875253094222.png', 'http://localhost:8080/static/upload/images/201708/150173875881773767.png', 'http://localhost:8080/static/upload/images/201708/150173874608869985.png', 'http://localhost:8080/static/upload/images/201708/150173873984275506.png', null, null, 'xudingding', null, null, '安阳市/林州市', '2017-08-03 13:39:20', '0803133920489156', null, '', '0', '6', '2', 'adjf', 'asldfj', 'asdfj', null, 'sadf', '2017-08-03 13:40:29', '2017-08-03 15:36:06', null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('127', '10157', '豫Eqqqqq', 'http://localhost:8080/static/upload/images/201708/150173920410987134.png', 'http://localhost:8080/static/upload/images/201708/150173921079614080.png', 'http://localhost:8080/static/upload/images/201708/150173919718085988.png', 'http://localhost:8080/static/upload/images/201708/150173919020955826.png', null, null, 'xdd', null, null, '安阳市/林州市', '2017-08-03 13:46:53', '0803134652641133', null, '', '0', '6', '3', 'sdafklja', 'asdkfj', 'dsfaskl', null, 'asdf', '2017-08-03 13:47:33', '2017-08-03 13:48:06', '2017-08-03 14:49:47', '2017-08-03 13:50:43', null, null, '1', null);
INSERT INTO `t_insurance` VALUES ('128', '10156', null, null, null, 'http://localhost:8080/static/upload/images/201708/150174184853299414.jpeg', 'http://localhost:8080/static/upload/images/201708/150174184205615300.jpeg', null, null, 'zyy', null, null, '合肥市', '2017-08-03 14:30:50', '0803143050161365', null, '', '0', '3', '3', '1', '1', '1', null, '1', '2017-08-03 14:32:04', '2017-08-03 14:33:00', '2017-08-03 14:56:12', '2017-08-03 14:34:49', null, null, '1', null);
INSERT INTO `t_insurance` VALUES ('129', '10157', null, null, null, 'http://localhost:8080/static/upload/images/201708/150174204477285161.png', 'http://localhost:8080/static/upload/images/201708/150174203869630718.png', null, null, null, null, null, '安庆市/宿松县', '2017-08-03 14:34:06', '0803143406294417', null, '', '0', '4', '3', null, null, null, null, null, '2017-08-03 14:34:06', null, '2017-08-03 14:50:23', '2017-08-03 14:35:33', null, null, null, null);
INSERT INTO `t_insurance` VALUES ('130', '10155', '豫E22222', 'http://localhost:8080/static/upload/images/201708/150174221545115736.png', 'http://localhost:8080/static/upload/images/201708/150174221923996521.png', 'http://localhost:8080/static/upload/images/201708/150174221184423788.png', 'http://localhost:8080/static/upload/images/201708/150174220800566843.png', null, null, '二蛋', null, null, '安阳市/龙安区', '2017-08-03 14:37:01', '0803143700512864', null, '', '0', '3', '4', '222222', '22222', '222222', null, '222222', '2017-08-03 14:38:12', '2017-08-03 14:54:58', '2017-08-03 15:08:13', '2017-08-03 15:11:16', null, null, '1', null);
INSERT INTO `t_insurance` VALUES ('131', '10156', null, null, null, 'http://localhost:8080/static/upload/images/201708/150174520601316582.jpeg', 'http://localhost:8080/static/upload/images/201708/150174520064765410.jpeg', null, null, 'dfghjkl', null, null, '合肥市', '2017-08-03 15:26:48', '0803152647669569', null, '', '0', '3', '1', '1', '1', '1', null, '1', '2017-08-03 15:27:39', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('132', '10155', '晋K99999', 'http://localhost:8080/static/upload/images/201708/150174524795570354.png', 'http://localhost:8080/static/upload/images/201708/150174525134093056.png', 'http://localhost:8080/static/upload/images/201708/150174524350428124.png', 'http://localhost:8080/static/upload/images/201708/150174523653136658.png', null, null, '猫王', null, null, '晋中市/祁  县', '2017-08-03 15:27:33', '0803152732716685', null, '', '0', '6', '4', '111111', '111111', '111111', null, '111111', '2017-08-03 15:29:05', '2017-08-03 15:33:05', '2017-08-03 15:33:36', '2017-08-03 15:42:13', null, null, null, null);
INSERT INTO `t_insurance` VALUES ('133', '10157', '陕Giiiii', 'http://localhost:8080/static/upload/images/201708/150174582194955653.png', 'http://localhost:8080/static/upload/images/201708/150174582883980469.png', 'http://localhost:8080/static/upload/images/201708/150174581362246552.png', 'http://localhost:8080/static/upload/images/201708/150174580506893486.png', null, null, '1', null, null, '安康市/平利县', '2017-08-03 15:37:10', '0803153710202481', null, '', '0', '7', '1', '12', '3', '12', null, '23', '2017-08-03 15:38:11', '2017-08-03 16:38:14', '2017-08-03 16:57:57', null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('134', '10156', null, null, null, 'http://localhost:8080/static/upload/images/201708/150174861169144485.jpeg', 'http://localhost:8080/static/upload/images/201708/150174860279949129.jpeg', null, null, 'dfghjk', null, null, '合肥市', '2017-08-03 16:23:33', '0803162333255837', null, '', '0', '3', '2', '1', '1', '1', null, '1', '2017-08-03 16:24:07', '2017-08-03 16:37:48', null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('135', '10157', '吉Fddxxx', 'http://localhost:8080/static/upload/images/201708/150174973016198512.png', 'http://localhost:8080/static/upload/images/201708/150174973631726757.png', 'http://localhost:8080/static/upload/images/201708/150174972277338492.png', 'http://localhost:8080/static/upload/images/201708/150174971541315178.png', null, null, 'xdd', null, null, '白山市/靖宇县', '2017-08-03 16:42:18', '0803164218112550', null, '', '0', '7', '4', 'adsf', 'sdasd', 'asdf', null, 'asdf', '2017-08-03 16:42:50', '2017-08-03 16:44:07', '2017-08-03 16:44:41', '2017-08-03 16:45:18', null, null, null, null);
INSERT INTO `t_insurance` VALUES ('136', '10157', null, null, null, 'http://localhost:8080/static/upload/images/201708/150175016342124016.png', 'http://localhost:8080/static/upload/images/201708/150175015610865261.png', null, null, 'jhgfdsa', null, null, '鞍山市/铁东区', '2017-08-03 16:49:25', '0803164924804857', null, '', '0', '4', '3', '1', '1', '1', null, '1', '2017-08-03 16:50:17', '2017-08-03 16:51:03', '2017-08-03 17:17:44', null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('137', '10156', null, null, null, 'http://localhost:8080/static/upload/images/201708/150175033265328957.jpeg', 'http://localhost:8080/static/upload/images/201708/150175032799135394.jpeg', null, null, 'hgfddsbnm', null, null, '安庆市/怀宁县', '2017-08-03 16:52:14', '0803165214408826', null, '', '0', '4', '1', '1', '1', '1', null, '1', '2017-08-03 16:52:41', '2017-08-03 16:55:05', '2017-08-03 16:55:14', null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('138', '10156', null, null, null, 'http://localhost:8080/static/upload/images/201708/150175070081549554.jpeg', 'http://localhost:8080/static/upload/images/201708/150175069607513754.jpeg', null, null, 'jhgfdh', null, null, '合肥市', '2017-08-03 16:58:22', '0803165822341359', null, '', '0', '2', '1', '1', '1', '1', null, '1', '2017-08-03 16:58:48', '2017-08-03 16:59:16', '2017-08-03 16:59:18', null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('139', '10157', '豫Eddddc', 'http://localhost:8080/static/upload/images/201708/150175182513172479.png', 'http://localhost:8080/static/upload/images/201708/150175183083683305.png', 'http://localhost:8080/static/upload/images/201708/150175181895310728.png', 'http://localhost:8080/static/upload/images/201708/150175181294119555.png', null, null, null, null, null, '安阳市/林州市', '2017-08-03 17:17:14', '0803171713534700', null, '', '0', '6', '3', null, null, null, null, null, '2017-08-03 17:17:14', null, '2017-08-03 17:17:47', null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('140', '10155', '皖H99999', 'http://localhost:8080/static/upload/images/201708/150180833155462294.png', 'http://localhost:8080/static/upload/images/201708/150180833516417740.png', 'http://localhost:8080/static/upload/images/201708/150180832709940700.png', 'http://localhost:8080/static/upload/images/201708/150180832300141866.png', null, null, 'shabby', null, null, '安庆市/宿松县', '2017-08-04 08:58:56', '0804085856482973', null, '', '0', '3', '4', '111111', '111111', '111111', null, '111111', '2017-08-04 09:01:05', '2017-08-04 09:01:54', '2017-08-04 09:01:58', '2017-08-04 09:11:17', null, null, null, null);
INSERT INTO `t_insurance` VALUES ('141', '10155', '辽Chhhhh', 'http://localhost:8080/static/upload/images/201708/150180872956876326.png', 'http://localhost:8080/static/upload/images/201708/150180873352971439.png', 'http://localhost:8080/static/upload/images/201708/150180871431224855.png', 'http://localhost:8080/static/upload/images/201708/150180870789173591.png', null, null, null, null, null, '鞍山市/千山区', '2017-08-04 09:05:35', '0804090534879771', null, '', '0', '4', '3', null, null, null, null, null, '2017-08-04 09:05:35', null, '2017-08-04 09:06:27', null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('142', '10155', '皖Hvvggg', 'http://localhost:8080/static/upload/images/201708/150181026437115062.png', 'http://localhost:8080/static/upload/images/201708/150181026776767380.png', 'http://localhost:8080/static/upload/images/201708/150181026084591047.png', 'http://localhost:8080/static/upload/images/201708/150181025684953163.png', null, null, 'nb', null, null, '安庆市/宿松县', '2017-08-04 09:31:09', '080409310977499', null, '', '0', '5', '4', '11', '111', '11', null, '11', '2017-08-04 09:35:38', '2017-08-04 09:46:49', '2017-08-04 09:46:55', '2017-08-04 09:47:38', null, null, null, null);
INSERT INTO `t_insurance` VALUES ('143', '10156', '辽C22222', 'http://localhost:8080/static/upload/images/201708/150182338239151047.jpeg', 'http://localhost:8080/static/upload/images/201708/150182339123862473.jpeg', 'http://localhost:8080/static/upload/images/201708/150182337319314097.jpeg', 'http://localhost:8080/static/upload/images/201708/150182336418550299.jpeg', null, null, 'gfdsa', null, null, '鞍山市/立山区', '2017-08-04 13:09:53', '0804130952887855', null, '', '0', '5', '1', '1', '1', '1', null, '1', '2017-08-04 13:11:48', '2017-08-04 13:12:21', '2017-08-04 13:12:23', null, '2017-08-04 13:15:14', null, null, null);
INSERT INTO `t_insurance` VALUES ('144', '10156', null, null, null, 'http://localhost:8080/static/upload/images/201708/150182380541745712.jpeg', 'http://localhost:8080/static/upload/images/201708/150182380005165433.jpeg', null, null, 'qw', null, null, '安顺市/普定县', '2017-08-04 13:16:47', '080413164760780', null, '', '0', '5', '0', 'qwre', 'qw', 'qwer', null, 'wqer', '2017-08-04 13:17:20', '2017-08-04 13:18:09', '2017-08-04 13:18:11', '2017-08-04 13:18:39', '2017-08-04 13:31:52', null, '1', null);
INSERT INTO `t_insurance` VALUES ('145', '10152', '豫Edddsd', 'http://localhost:8080/static/upload/images/201708/150182487998094279.png', 'http://localhost:8080/static/upload/images/201708/150182488759731959.png', 'http://localhost:8080/static/upload/images/201708/150182487148317374.png', 'http://localhost:8080/static/upload/images/201708/150182486314742533.png', null, null, 'adf', null, null, '安阳市/林州市', '2017-08-04 13:34:50', '080413345064833', null, '', '0', '6', '0', 'adsf', 'ad', 'adf', null, 'ad', '2017-08-04 13:34:50', null, null, null, '2017-08-04 14:44:05', null, null, null);
INSERT INTO `t_insurance` VALUES ('146', '10155', '皖H11111', 'http://localhost:8080/static/upload/images/201708/150233376893654797.png', 'http://localhost:8080/static/upload/images/201708/150233377838156410.png', 'http://localhost:8080/static/upload/images/201708/150233379218056715.png', 'http://localhost:8080/static/upload/images/201708/150233378571679969.png', null, null, 'gfds', null, null, '安庆市/宿松县', '2017-08-10 10:56:34', '0810105634166574', null, '', '0', '6', '3', '1', '1', '1', null, '1', '2017-08-10 10:58:17', '2017-08-10 10:58:51', '2017-08-10 10:59:03', null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('147', '10155', null, null, null, 'http://localhost:8080/static/upload/images/201708/150234663017948027.png', 'http://localhost:8080/static/upload/images/201708/150234662577730694.png', null, null, null, null, null, '安阳市/林州市', '2017-08-10 14:30:31', '0810143031205481', null, '', '0', '5', '1', null, null, null, null, null, '2017-08-10 14:30:31', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('148', '10155', '豫Ehhhhh', 'http://localhost:8080/static/upload/images/201708/150243079602671773.png', 'http://localhost:8080/static/upload/images/201708/150243080001826683.png', 'http://localhost:8080/static/upload/images/201708/150243080800377979.png', 'http://localhost:8080/static/upload/images/201708/150243080391730225.png', null, null, null, null, null, '安阳市/内黄县', '2017-08-11 13:53:29', '0811135329336222', null, '', '0', '4', '1', null, null, null, null, null, '2017-08-11 13:53:29', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('149', '10155', null, null, null, 'http://localhost:8080/static/upload/images/201708/150364269360430092.png', 'http://localhost:8080/static/upload/images/201708/150364268919629235.png', null, null, null, null, null, '鞍山市/千山区', '2017-08-25 14:31:35', '0825143134611274', null, '', '0', '7', '1', null, null, null, null, null, '2017-08-25 14:31:35', null, null, null, null, null, null, null);
INSERT INTO `t_insurance` VALUES ('150', '10155', null, null, null, 'http://localhost:8080/static/upload/images/201708/150364940920457804.png', 'http://localhost:8080/static/upload/images/201708/150364940484178457.png', null, null, null, null, null, '鞍山市/铁东区', '2017-08-25 16:23:30', '0825162330281973', null, '', '0', '6', '1', null, null, null, null, null, '2017-08-25 16:23:30', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `t_insurancecom_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_insurancecom_company`;
CREATE TABLE `t_insurancecom_company` (
  `id` int(11) NOT NULL,
  `insuranceCom` varchar(255) DEFAULT NULL COMMENT '保险公司',
  `isdelete` bit(1) DEFAULT b'0',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `stat` tinyint(4) DEFAULT NULL,
  `insuranceTpye` tinyint(1) DEFAULT NULL COMMENT '保险类型',
  `t_insurance_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保险公司';

-- ----------------------------
-- Records of t_insurancecom_company
-- ----------------------------
INSERT INTO `t_insurancecom_company` VALUES ('1', '安邦保险', '', '2017-07-26 15:56:03', null, null, null, '10001');
INSERT INTO `t_insurancecom_company` VALUES ('2', '中国人保', '', '2017-07-26 15:56:30', null, null, null, '10002');
INSERT INTO `t_insurancecom_company` VALUES ('3', '平安保险', '', '2017-07-26 15:57:03', null, null, null, '10003');

-- ----------------------------
-- Table structure for `t_insurance_commercial`
-- ----------------------------
DROP TABLE IF EXISTS `t_insurance_commercial`;
CREATE TABLE `t_insurance_commercial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vehicledamage` tinyint(1) DEFAULT NULL COMMENT '车辆损失险',
  `robbery` tinyint(1) DEFAULT NULL COMMENT '抢盗险',
  `driverseatliability` decimal(8,4) DEFAULT NULL COMMENT '司机座位责任险',
  `passengerseatliability` decimal(8,4) DEFAULT NULL COMMENT '司机座位责任险',
  `riskspontaneous` tinyint(1) DEFAULT NULL COMMENT '自燃损失险',
  `riskglass` tinyint(1) DEFAULT NULL COMMENT '玻璃单独损失险',
  `riskscratch` decimal(11,0) DEFAULT NULL COMMENT '划痕险',
  `riskwading` tinyint(1) DEFAULT NULL COMMENT '涉水险',
  `notthird` tinyint(1) DEFAULT NULL COMMENT '找不到第三方特约险',
  `alldeductible` tinyint(1) DEFAULT NULL COMMENT '全部不计免赔险',
  `end_time` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(255) DEFAULT NULL,
  `insurance_com_id` bigint(11) DEFAULT NULL COMMENT '保险公司id',
  `insurance_id` bigint(20) DEFAULT NULL COMMENT 't_insurance关联',
  `thirdpartyliability` decimal(8,4) DEFAULT NULL COMMENT '第三方',
  `start_time` datetime DEFAULT NULL,
  `comGuaranteeDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='商业保险（保额）';

-- ----------------------------
-- Records of t_insurance_commercial
-- ----------------------------
INSERT INTO `t_insurance_commercial` VALUES ('35', '0801161955252611', '10148', '1', '0', '1.0000', '1.0000', '1', '0', '0', '0', '0', '1', null, '0', '2017-08-01 16:20:06', '10148', null, null, null, '10003', '50.0000', null, '2017-08-01 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('36', '0801162207619241', '10147', '1', '1', '1.0000', '1.0000', '1', '1', '10000', '1', '1', '1', null, '0', '2017-08-01 16:22:40', '10147', null, null, null, '10001', '50.0000', null, '1917-08-02 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('37', '0801162259403402', '10148', '1', '0', '1.0000', '1.0000', '1', '0', '0', '0', '0', '1', null, '0', '2017-08-01 16:23:07', '10148', null, null, null, '10001', '50.0000', null, '2017-08-01 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('38', '0801170608124660', '10148', '1', '0', '1.0000', '1.0000', '1', '0', '0', '0', '0', '1', null, '0', '2017-08-01 17:06:18', '10148', null, null, '0', '0', '50.0000', null, '2017-08-01 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('39', '0801171036884649', '10151', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-01 17:11:05', '10151', null, null, null, '10001', '50.0000', null, '1917-08-26 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('40', '0801171434733676', '10147', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-01 17:14:47', '10147', null, null, null, '10001', '50.0000', null, '1917-08-26 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('41', '0801172742749127', '10155', '1', '0', '1.0000', '1.0000', '1', '0', '2000', '0', '1', '1', null, '0', '2017-08-01 17:27:58', '10155', null, null, '0', '0', '50.0000', null, '2017-08-01 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('42', '080117291722961', '10156', '1', '0', '1.0000', '1.0000', '1', '0', '0', '0', '0', '1', null, '0', '2017-08-01 17:29:58', '10156', null, null, null, '10002', '50.0000', null, '2017-08-01 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('43', '0801173908482617', '10155', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-01 17:39:21', '10155', null, null, null, '10002', '50.0000', null, '1917-08-26 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('44', '0801173854352443', '10157', '1', '1', '20.0000', '10.0000', '1', '1', '10000', '1', '1', '1', null, '0', '2017-08-01 17:39:29', '10157', null, null, null, '10001', '50.0000', null, '1917-08-26 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('45', '0801174754172423', '10157', '1', '1', '1.0000', '1.0000', '1', '1', '10000', '1', '1', '1', null, '0', '2017-08-01 17:47:56', '10157', null, null, null, '10001', '50.0000', null, '1917-08-27 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('46', '0801175605504851', '10157', '1', '1', '1.0000', '1.0000', '1', '1', '5000', '1', '1', '1', null, '0', '2017-08-01 17:57:29', '10157', null, null, null, '10002', '50.0000', null, '1917-08-24 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('47', '0801182606755338', '10155', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-01 18:26:16', '10155', null, null, '0', '10001', '50.0000', null, '2017-08-01 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('48', '0801184833710514', '10157', '1', '1', '1.0000', '1.0000', '1', '1', '20000', '1', '1', '1', null, '0', '2017-08-01 18:49:08', '10157', null, null, null, '10002', '50.0000', null, '1917-08-26 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('49', '0802083807103478', '10155', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-02 08:41:05', '10155', null, null, null, '10001', '50.0000', null, '1917-08-27 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('50', '0802083807103478', '10155', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-02 08:41:05', '10155', null, null, null, '10001', '50.0000', null, '1917-08-27 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('51', '0802083807103478', '10155', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-02 08:41:05', '10155', null, null, null, '10001', '50.0000', null, '1917-08-27 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('52', '0802083807103478', '10155', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-02 08:41:05', '10155', null, null, null, '10001', '50.0000', null, '1917-08-27 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('53', '0802084105177417', '10156', '1', '0', '1.0000', '1.0000', '1', '0', '0', '0', '0', '1', null, '0', '2017-08-02 08:41:20', '10156', null, null, null, '10001', '50.0000', null, '2017-08-02 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('54', '080208461455219', '10155', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-02 08:46:38', '10155', null, null, null, '10002', '50.0000', null, '1917-08-27 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('55', '0802085227338112', '10155', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-02 08:52:45', '10155', null, null, null, '10001', '50.0000', null, '1917-08-27 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('56', '0802085910820830', '10155', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-02 08:59:23', '10155', null, null, null, '10001', '50.0000', null, '1917-08-27 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('57', '0802090029429713', '10156', '1', '0', '1.0000', '1.0000', '1', '0', '0', '0', '0', '1', null, '0', '2017-08-02 09:00:51', '10156', null, null, null, '10001', '50.0000', null, '2017-08-02 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('58', '0802092654709209', '10157', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-02 09:27:28', '10157', null, null, null, '10002', '50.0000', null, '1917-08-02 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('59', '0803092029695246', '10156', '1', '0', '1.0000', '1.0000', '1', '0', '0', '0', '0', '1', null, '0', '2017-08-03 09:20:52', '10156', null, null, null, '10001', '50.0000', null, '2017-08-03 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('60', '0803133920489156', '10157', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-03 13:39:39', '10157', null, null, null, '10003', '50.0000', null, '1917-08-28 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('61', '0803133920489156', '10157', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-03 13:39:39', '10157', null, null, null, '10003', '50.0000', null, '1917-08-28 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('62', '0803134652641133', '10157', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-03 13:47:00', '10157', null, null, null, '10003', '50.0000', null, '1917-08-28 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('63', '0803143050161365', '10156', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-03 14:31:01', '10156', null, null, null, '10001', '50.0000', null, '2017-08-03 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('64', '0803143406294417', '10157', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-03 14:34:36', '10157', null, null, null, '10002', '50.0000', null, '1917-08-28 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('65', '0803143700512864', '10155', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-03 14:37:17', '10155', null, null, null, '10001', '50.0000', null, '1917-08-28 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('66', '0803152647669569', '10156', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-03 15:26:57', '10156', null, null, null, '10001', '50.0000', null, '2017-08-03 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('67', '0803152732716685', '10155', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-03 15:27:46', '10155', null, null, null, '10001', '50.0000', null, '1917-08-28 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('68', '0803153710202481', '10157', '1', '1', '1.0000', '1.0000', '1', '1', '10000', '1', '1', '1', null, '0', '2017-08-03 15:37:38', '10157', null, null, '0', '10002', '50.0000', null, '2017-08-03 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('70', '0803164218112550', '10157', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-03 16:42:32', '10157', null, null, null, '10002', '50.0000', null, '1917-08-28 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('71', '0803164924804857', '10157', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-03 16:49:43', '10157', null, null, '0', '10001', '50.0000', null, '2017-08-03 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('72', '0803165214408826', '10156', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-03 16:52:22', '10156', null, null, '0', '0', '50.0000', null, '2017-08-03 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('73', '0803165822341359', '10156', '0', '1', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-03 16:58:31', '10156', null, null, '0', '0', '50.0000', null, '2017-08-03 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('74', '0803171713534700', '10157', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-03 17:17:29', '10157', null, null, null, '10002', '50.0000', null, '1917-08-28 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('75', '0804085856482973', '10155', '1', '0', '1.0000', '1.0000', '1', '0', '0', '0', '0', '1', null, '0', '2017-08-04 08:59:14', '10155', null, null, null, '10002', '50.0000', null, '1917-08-29 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('76', '0804090534879771', '10155', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-04 09:06:03', '10155', null, null, null, '10001', '50.0000', null, '1917-08-29 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('77', '080409310977499', '10155', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-04 09:31:15', '10155', null, null, '0', '10001', '50.0000', null, '2017-08-11 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('78', '0804130952887855', '10156', '0', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-04 13:10:26', '10156', null, null, '0', '0', '50.0000', null, '2017-08-04 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('79', '080413164760780', '10156', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-04 13:16:55', '10156', null, null, null, '10002', '50.0000', null, '2017-08-04 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('80', '0810105634166574', '10155', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-10 10:56:47', '10155', null, null, null, '10001', '50.0000', null, '1917-09-04 00:00:00');
INSERT INTO `t_insurance_commercial` VALUES ('81', '0811135329336222', '10155', '1', '0', '1.0000', '1.0000', '0', '0', '0', '0', '0', '1', null, '0', '2017-08-11 13:53:40', '10155', null, null, null, '10001', '50.0000', null, '1917-09-05 00:00:00');

-- ----------------------------
-- Table structure for `t_insurance_commercial_fee`
-- ----------------------------
DROP TABLE IF EXISTS `t_insurance_commercial_fee`;
CREATE TABLE `t_insurance_commercial_fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vehicledamagefee` decimal(8,4) DEFAULT NULL COMMENT '车辆损失险',
  `robberyfee` decimal(8,4) DEFAULT NULL COMMENT '抢盗险',
  `driverseatliabilityfee` decimal(8,4) DEFAULT NULL COMMENT '司机座位责任险',
  `passengerseatliabilityfee` decimal(8,4) DEFAULT NULL COMMENT '司机座位责任险',
  `thirdpartyliabilityfee` decimal(8,4) DEFAULT NULL COMMENT '第三者责任险',
  `riskspontaneousfee` decimal(8,4) DEFAULT NULL COMMENT '自燃损失险',
  `riskglassfee` decimal(8,4) DEFAULT NULL COMMENT '玻璃单独损失险',
  `riskscratchfee` decimal(8,4) DEFAULT NULL COMMENT '划痕险',
  `riskwadingfee` decimal(8,4) DEFAULT NULL COMMENT '涉水险',
  `notthirdfee` decimal(8,4) DEFAULT NULL COMMENT '找不到第三方特约险',
  `alldeductiblefee` decimal(8,4) DEFAULT NULL COMMENT '全部不计免赔险',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(255) DEFAULT NULL,
  `insurance_com_id` bigint(11) DEFAULT NULL COMMENT '保险公司id',
  `insurance_id` bigint(20) DEFAULT NULL COMMENT 't_insurance关联',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COMMENT='商业保险（保费）';

-- ----------------------------
-- Records of t_insurance_commercial_fee
-- ----------------------------
INSERT INTO `t_insurance_commercial_fee` VALUES ('81', '0801172742749127', null, '1.0000', '1.0000', '1.0000', '1.0000', '1.0000', '1.0000', '1.0000', '1.0000', '1.0000', '1.0000', '1.0000', '2017-08-01 17:30:32', '2017-08-01 17:30:32', '0', '2017-08-01 17:30:32', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('82', '080117291722961', null, '13.0000', '13.0000', '13.0000', '13.0000', '13.0000', '13.0000', '13.0000', '13.0000', '13.0000', '13.0000', '13.0000', '2017-08-01 17:32:30', '2017-08-01 17:32:30', '0', '2017-08-01 17:32:30', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('83', '0801182606755338', null, '1.0000', '1.0000', '1.0000', '1.0000', '1.0000', '1.0000', '11.0000', '1.0000', '11.0000', '1.0000', '1.0000', '2017-08-01 18:27:40', '2017-08-01 18:27:40', '0', '2017-08-01 18:27:40', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('84', '0801182606755338', null, '5.0000', '7.0000', '345.0000', '8.0000', '6.0000', '23.0000', '8.0000', '7.0000', '9.0000', '23.0000', '87.0000', '2017-08-01 18:33:45', '2017-08-01 18:33:45', '0', '2017-08-01 18:33:45', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('85', '0801182606755338', null, '5.0000', '7.0000', '345.0000', '8.0000', '6.0000', '23.0000', '8.0000', '7.0000', '9.0000', '23.0000', '87.0000', '2017-08-01 18:36:47', '2017-08-01 18:36:47', '0', '2017-08-01 18:36:47', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('86', '0801182606755338', null, '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '213.0000', '123.0000', '123.0000', '123.0000', '123.0000', '2017-08-01 18:41:02', '2017-08-01 18:41:02', '0', '2017-08-01 18:41:02', null, null, null, null, '10003');
INSERT INTO `t_insurance_commercial_fee` VALUES ('87', '080208461455219', null, '111.0000', '11.0000', '11.0000', '1.0000', '11.0000', '11.0000', '111.0000', '11.0000', '111.0000', '11.0000', '111.0000', '2017-08-02 08:48:21', '2017-08-02 08:48:21', '0', '2017-08-02 08:48:21', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('88', '080208461455219', null, '111.0000', '11.0000', '11.0000', '1.0000', '11.0000', '11.0000', '111.0000', '11.0000', '111.0000', '11.0000', '111.0000', '2017-08-02 08:49:48', '2017-08-02 08:49:48', '0', '2017-08-02 08:49:48', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('89', '0802085227338112', null, '111.0000', '111.0000', '11.0000', '111.0000', '111.0000', '11.0000', '111.0000', '111.0000', '111.0000', '111.0000', '111.0000', '2017-08-02 08:54:22', '2017-08-02 08:54:22', '0', '2017-08-02 08:54:22', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('90', '0802085910820830', null, '111.0000', '11.0000', '11.0000', '1.0000', '11.0000', '11.0000', '111.0000', '11.0000', '111.0000', '11.0000', '111.0000', '2017-08-02 09:01:34', '2017-08-02 09:01:34', '0', '2017-08-02 09:01:34', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('91', '0802090029429713', null, '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '132.0000', '2017-08-02 09:07:36', '2017-08-02 09:07:36', '0', '2017-08-02 09:07:36', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('92', '0802092654709209', null, '12.0000', '0.0000', '13.0000', '14.0000', '123.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '2017-08-02 09:31:32', '2017-08-02 09:31:32', '0', '2017-08-02 09:31:32', null, null, null, null, '10002');
INSERT INTO `t_insurance_commercial_fee` VALUES ('93', '0802092654709209', null, '12.0000', '0.0000', '13.0000', '14.0000', '123.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '2017-08-02 09:33:11', '2017-08-02 09:33:11', '0', '2017-08-02 09:33:11', null, null, null, null, '10002');
INSERT INTO `t_insurance_commercial_fee` VALUES ('94', '0802092654709209', null, '12.0000', '0.0000', '13.0000', '14.0000', '123.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '2017-08-02 09:37:14', '2017-08-02 09:37:14', '0', '2017-08-02 09:37:14', null, null, null, null, '10002');
INSERT INTO `t_insurance_commercial_fee` VALUES ('95', '0802092654709209', null, '12.0000', '0.0000', '13.0000', '14.0000', '123.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '2017-08-02 09:38:24', '2017-08-02 09:38:24', '0', '2017-08-02 09:38:24', null, null, null, null, '10002');
INSERT INTO `t_insurance_commercial_fee` VALUES ('96', '0802092654709209', null, '12.0000', '0.0000', '13.0000', '14.0000', '123.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', '2017-08-02 09:39:30', '2017-08-02 09:39:30', '0', '2017-08-02 09:39:30', null, null, null, null, '10002');
INSERT INTO `t_insurance_commercial_fee` VALUES ('97', '0802092654709209', null, '1.0000', '0.0000', '12.0000', '3.0000', '2.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '2017-08-02 09:42:58', '2017-08-02 09:42:58', '0', '2017-08-02 09:42:58', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('98', '0802093253138885', null, '1.0000', '0.0000', '1.0000', '1.0000', '1.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '2017-08-02 09:45:17', '2017-08-02 09:45:17', '0', '2017-08-02 09:45:17', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('99', '0802093253138885', null, '1.0000', '0.0000', '1.0000', '1.0000', '1.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '2017-08-02 09:45:34', '2017-08-02 09:45:34', '0', '2017-08-02 09:45:34', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('100', '0802093253138885', null, '1.0000', '0.0000', '1.0000', '1.0000', '1.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '2017-08-02 09:46:10', '2017-08-02 09:46:10', '0', '2017-08-02 09:46:10', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('101', '0802092654709209', null, '1.0000', '0.0000', '1.0000', '1.0000', '1.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '2017-08-02 09:48:40', '2017-08-02 09:48:40', '0', '2017-08-02 09:48:40', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('102', '0803092029695246', null, '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '2017-08-03 11:26:43', '2017-08-03 11:26:43', '0', '2017-08-03 09:23:05', null, '2017-08-03 11:26:43', null, '0', '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('103', '0803133920489156', null, '1.0000', '12.0000', '1.0000', '12.0000', '12.0000', '1.0000', '12.0000', '1.0000', '12.0000', '1.0000', '10.0000', '2017-08-05 00:00:00', '2017-08-04 00:00:00', '0', '2017-08-03 13:41:43', null, '2017-08-03 15:36:06', null, '0', '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('104', '0803134652641133', null, '12.0000', '12.0000', '12.0000', '12.0000', '12.0000', '12.0000', '12.0000', '12.0000', '12.0000', '12.0000', '12.0000', '2017-08-03 13:48:06', '2017-08-03 13:48:06', '0', '2017-08-03 13:48:06', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('105', '0803143700512864', null, '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '2017-08-03 14:54:58', '2017-08-03 14:54:58', '0', '2017-08-03 14:38:52', null, '2017-08-03 14:54:58', null, '0', '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('106', '0803152732716685', null, '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '2017-08-03 00:00:00', '2017-08-23 00:00:00', '0', '2017-08-03 15:28:43', null, '2017-08-03 15:33:14', null, '0', '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('108', '0803162333255837', null, '12.0000', '1.0000', '3.0000', '3.0000', '3.0000', '23.0000', '3.0000', '3.0000', '3.0000', '31.0000', '1.0000', '2017-08-03 00:00:00', '2017-08-24 00:00:00', '0', '2017-08-03 16:32:36', null, '2017-08-03 16:37:48', null, '0', '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('109', '0803153710202481', null, '12.0000', '1.0000', '3.0000', '3.0000', '3.0000', '23.0000', '3.0000', '3.0000', '3.0000', '31.0000', '1.0000', '2017-08-03 00:00:00', '2017-08-24 00:00:00', '0', '2017-08-03 16:38:38', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('110', '0803164218112550', null, '12.0000', '12.0000', '213.0000', '123.0000', '123.0000', '123.0000', '123.0000', '1231.0000', '123.0000', '31.0000', '123.0000', '2017-09-01 00:00:00', '2017-09-02 00:00:00', '0', '2017-08-03 16:44:07', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('111', '0803164924804857', null, '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '2017-08-03 00:00:00', '2017-08-16 00:00:00', '0', '2017-08-03 16:51:03', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('112', '0803165214408826', null, '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '2017-08-03 00:00:00', '2017-08-24 00:00:00', '0', '2017-08-03 16:53:54', null, '2017-08-03 16:55:05', null, '0', '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('113', '0803165822341359', null, '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '2017-08-03 00:00:00', '2017-08-24 00:00:00', '0', '2017-08-03 16:59:16', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('114', '0804085856482973', null, '1.0000', '11.0000', '1.0000', '1.0000', '11.0000', '1.0000', '1.0000', '1.0000', '1.0000', '1.0000', '1.0000', '2017-08-17 00:00:00', '2017-08-03 00:00:00', '0', '2017-08-04 09:01:54', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('115', '080409310977499', null, '111.0000', '11.0000', '11.0000', '1.0000', '1.0000', '1.0000', '1.0000', '1.0000', '1.0000', '11.0000', '1.0000', '2017-08-11 00:00:00', '2017-08-03 00:00:00', '0', '2017-08-04 09:36:28', null, '2017-08-04 09:46:49', null, '0', '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('116', '0804130952887855', null, '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '2017-08-04 00:00:00', '2017-08-25 00:00:00', '0', '2017-08-04 13:12:21', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('117', '080413164760780', null, '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '2017-08-04 00:00:00', '2017-08-27 00:00:00', '0', '2017-08-04 13:18:09', null, null, null, null, '10001');
INSERT INTO `t_insurance_commercial_fee` VALUES ('118', '0810105634166574', null, '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '123.0000', '2017-08-10 00:00:00', '2017-08-25 00:00:00', '0', '2017-08-10 10:58:55', null, null, null, null, '10001');

-- ----------------------------
-- Table structure for `t_insurance_compulsory`
-- ----------------------------
DROP TABLE IF EXISTS `t_insurance_compulsory`;
CREATE TABLE `t_insurance_compulsory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `guaranteeDate` datetime DEFAULT NULL COMMENT '期保日期',
  `order_code` varchar(25) DEFAULT NULL COMMENT '单号',
  `status` int(11) DEFAULT NULL COMMENT '状态 0 ',
  `start_date` datetime DEFAULT NULL COMMENT '保障开始日期',
  `end_date` datetime DEFAULT NULL COMMENT '保障结束日期',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `fareStatus` varchar(4) DEFAULT NULL COMMENT '是否缴车船费',
  `fare` decimal(11,4) DEFAULT NULL COMMENT '车船费',
  `compulsoryInsurance` decimal(11,4) DEFAULT NULL COMMENT '交强险',
  `farefee` decimal(11,4) DEFAULT NULL,
  `compulsoryInsurancefee` decimal(11,4) DEFAULT NULL,
  `insurance_id` bigint(20) DEFAULT NULL COMMENT '保险公司id',
  `insurance_com_id` bigint(11) DEFAULT NULL COMMENT '保险公司id',
  `appointment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_insurance_compulsory
-- ----------------------------
INSERT INTO `t_insurance_compulsory` VALUES ('50', '10155', '2017-01-24 00:00:00', '0801172742749127', '1', '2017-01-24 00:08:00', '2017-01-10 00:08:00', '2017-08-01 17:27:58', '10155', '2017-08-01 18:25:07', '10155', '1', '1.0000', '1.0000', '1.0000', '1.0000', '0', null, 'moistly giiooobbjjjjjhhhbhyytet his');
INSERT INTO `t_insurance_compulsory` VALUES ('51', '10156', '2017-01-02 00:08:00', '080117291722961', '0', '2017-01-02 00:08:00', '2017-01-12 00:08:00', '2017-08-01 17:29:58', '10156', null, null, '0', '13.0000', '13.0000', '13.0000', '13.0000', '0', null, 'in');
INSERT INTO `t_insurance_compulsory` VALUES ('52', '10155', '1917-08-26 00:00:00', '0801173908482617', '0', null, null, '2017-08-01 17:39:21', '10155', null, null, '1', null, null, null, null, '10002', null, 'knight');
INSERT INTO `t_insurance_compulsory` VALUES ('53', '10157', '1917-08-26 00:00:00', '0801173854352443', '0', null, null, '2017-08-01 17:39:29', '10157', null, null, '1', null, null, null, null, '10001', null, null);
INSERT INTO `t_insurance_compulsory` VALUES ('54', '10157', '1917-08-26 00:00:00', '0801174754172423', '0', null, null, '2017-08-01 17:47:56', '10157', null, null, '1', null, null, null, null, '10001', null, null);
INSERT INTO `t_insurance_compulsory` VALUES ('55', '10157', '1917-08-24 00:00:00', '0801175605504851', '0', null, null, '2017-08-01 17:57:29', '10157', null, null, '1', null, null, null, null, '10002', null, null);
INSERT INTO `t_insurance_compulsory` VALUES ('56', '10155', '2017-02-01 00:00:00', '0801182606755338', '0', '2017-02-02 00:00:00', '2017-02-03 00:00:00', '2017-08-01 18:26:16', '10155', '2017-08-01 18:28:27', '10155', '0', '13.0000', '123.0000', '123.0000', '123.0000', '0', null, '12321ggghhh3123');
INSERT INTO `t_insurance_compulsory` VALUES ('57', '10157', '2016-11-29 00:00:00', '0801184833710514', '0', '2015-10-29 00:00:00', '2015-10-29 00:00:00', '2017-08-01 18:49:08', '10157', null, null, '0', '12.0000', '123.0000', '123.0000', '123.0000', '0', null, '中央音乐学院');
INSERT INTO `t_insurance_compulsory` VALUES ('58', '10155', '2017-08-02 00:00:00', '0802083807103478', '0', null, null, '2017-08-02 08:41:05', '10155', null, null, '1', null, null, null, null, '10001', null, 'king good');
INSERT INTO `t_insurance_compulsory` VALUES ('59', '10155', '2017-08-02 00:00:00', '0802083807103478', '0', null, null, '2017-08-02 08:41:05', '10155', null, null, '1', null, null, null, null, '10001', null, 'king good');
INSERT INTO `t_insurance_compulsory` VALUES ('60', '10155', '2017-08-02 00:00:00', '0802083807103478', '0', null, null, '2017-08-02 08:41:05', '10155', null, null, '1', null, null, null, null, '10001', null, 'king good');
INSERT INTO `t_insurance_compulsory` VALUES ('61', '10155', '2017-08-02 00:00:00', '0802083807103478', '0', null, null, '2017-08-02 08:41:05', '10155', null, null, '1', null, null, null, null, '10001', null, 'king good');
INSERT INTO `t_insurance_compulsory` VALUES ('62', '10156', '2017-08-02 00:00:00', '0802084105177417', '0', null, null, '2017-08-02 08:41:20', '10156', null, null, '1', null, null, null, null, '10001', null, '你好');
INSERT INTO `t_insurance_compulsory` VALUES ('63', '10155', '2017-08-08 00:00:00', '080208461455219', '0', '2017-08-16 00:00:00', '2017-08-16 00:00:00', '2017-08-02 08:46:38', '10155', null, null, '0', '11.0000', '11.0000', '11.0000', '11.0000', '0', null, 'Yuki');
INSERT INTO `t_insurance_compulsory` VALUES ('64', '10155', '2017-08-17 00:00:00', '0802085227338112', '0', '2017-08-23 00:00:00', '2017-08-09 00:00:00', '2017-08-02 08:52:45', '10155', null, null, '0', '11.0000', '11.0000', '11.0000', '11.0000', '0', null, 'HB but');
INSERT INTO `t_insurance_compulsory` VALUES ('65', '10155', '2017-08-24 00:00:00', '0802085910820830', '0', '2017-08-16 00:00:00', '2017-08-23 00:00:00', '2017-08-02 08:59:23', '10155', null, null, '0', '11.0000', '11.0000', '11.0000', '11.0000', '0', null, 'most day');
INSERT INTO `t_insurance_compulsory` VALUES ('66', '10156', '2017-08-02 00:00:00', '0802090029429713', '0', '2017-08-02 00:00:00', '2017-08-12 00:00:00', '2017-08-02 09:00:51', '10156', null, null, '0', '123.0000', '123.0000', '123.0000', '123.0000', '0', null, 'fuck');
INSERT INTO `t_insurance_compulsory` VALUES ('67', '10157', '2017-08-02 00:00:00', '0802092654709209', '0', '2017-08-09 00:00:00', '2017-08-02 00:00:00', '2017-08-02 09:27:28', '10157', null, null, '1', '1.0000', '1.0000', '11.0000', '1.0000', '0', null, null);
INSERT INTO `t_insurance_compulsory` VALUES ('68', '10156', '2017-08-03 00:00:00', '0803092029695246', '0', '2017-08-03 00:00:00', '2017-08-03 00:00:00', '2017-08-03 09:20:52', '10156', null, null, '0', '123.0000', '123.0000', '123.0000', '123.0000', '0', null, '车');
INSERT INTO `t_insurance_compulsory` VALUES ('69', '10157', '2017-08-01 00:00:00', '0803133920489156', '0', '2017-08-02 00:00:00', '2017-08-03 00:00:00', '2017-08-03 13:39:39', '10157', null, null, '0', '1.0000', '1.0000', '1.0000', '1.0000', '0', null, '');
INSERT INTO `t_insurance_compulsory` VALUES ('70', '10157', '2017-08-01 00:00:00', '0803133920489156', '0', '2017-08-02 00:00:00', '2017-08-03 00:00:00', '2017-08-03 13:39:39', '10157', null, null, '0', '1.0000', '1.0000', '1.0000', '1.0000', '0', null, '');
INSERT INTO `t_insurance_compulsory` VALUES ('71', '10157', '2017-08-01 00:00:00', '0803134652641133', '0', '2017-08-03 00:00:00', '2017-08-02 00:00:00', '2017-08-03 13:47:00', '10157', null, null, '0', '12.0000', '12.0000', '12.0000', '12.0000', '0', null, '');
INSERT INTO `t_insurance_compulsory` VALUES ('72', '10156', '2017-08-03 00:00:00', '0803143050161365', '0', '2017-08-03 00:00:00', '2017-08-13 00:00:00', '2017-08-03 14:31:01', '10156', null, null, '0', '123.0000', '123.0000', '123123.0000', '123.0000', '0', null, '我');
INSERT INTO `t_insurance_compulsory` VALUES ('73', '10157', '1917-08-28 00:00:00', '0803143406294417', '0', null, null, '2017-08-03 14:34:36', '10157', null, null, '1', null, null, null, null, '10002', null, '');
INSERT INTO `t_insurance_compulsory` VALUES ('74', '10155', '2017-08-03 00:00:00', '0803143700512864', '0', '2017-08-03 00:00:00', '2017-08-13 00:00:00', '2017-08-03 14:37:17', '10155', null, null, '0', '123.0000', '123.0000', '123.0000', '123.0000', '0', null, 'of the just');
INSERT INTO `t_insurance_compulsory` VALUES ('75', '10156', '2017-08-03 00:00:00', '0803152647669569', '0', null, null, '2017-08-03 15:26:57', '10156', null, null, '1', null, null, null, null, '10001', null, '这');
INSERT INTO `t_insurance_compulsory` VALUES ('76', '10155', '2017-08-30 00:00:00', '0803152732716685', '0', '2017-08-03 00:00:00', '2017-08-23 00:00:00', '2017-08-03 15:27:46', '10155', null, null, '0', '123.0000', '123.0000', '123.0000', '123.0000', '0', null, 'in get');
INSERT INTO `t_insurance_compulsory` VALUES ('77', '10157', '2017-08-03 00:00:00', '0803153710202481', '1', '2017-08-03 00:00:00', '2017-08-24 00:00:00', '2017-08-03 15:37:38', '10157', '2017-08-03 17:18:08', '10157', '1', '1.0000', '3.0000', '1.0000', '12.0000', '10002', null, '干会');
INSERT INTO `t_insurance_compulsory` VALUES ('78', '10156', '2017-08-01 00:00:00', '0803162333255837', '0', '2017-08-03 00:00:00', '2017-08-24 00:00:00', '2017-08-03 16:23:43', '10156', null, null, '1', '1.0000', '3.0000', '1.0000', '12.0000', '0', null, '这');
INSERT INTO `t_insurance_compulsory` VALUES ('79', '10157', '2017-08-03 00:00:00', '0803164218112550', '0', '2017-08-30 00:00:00', '2017-08-31 00:00:00', '2017-08-03 16:42:32', '10157', null, null, '1', '12.0000', '3.0000', '1.0000', '3.0000', '0', null, '');
INSERT INTO `t_insurance_compulsory` VALUES ('80', '10157', '2017-08-03 00:00:00', '0803164924804857', '1', '2017-08-03 00:00:00', '2017-08-24 00:00:00', '2017-08-03 16:49:43', '10157', '2017-08-03 17:08:45', '10157', '1', '123.0000', '123.0000', '123.0000', '123.0000', '10001', null, '才');
INSERT INTO `t_insurance_compulsory` VALUES ('81', '10156', '2017-08-03 00:00:00', '0803165214408826', '1', '2017-08-03 00:00:00', '2017-08-24 00:00:00', '2017-08-03 16:52:22', '10156', '2017-08-03 17:09:07', '10156', '1', '123.0000', '123.0000', '123.0000', '123.0000', '0', null, '在');
INSERT INTO `t_insurance_compulsory` VALUES ('82', '10156', '2017-08-03 00:00:00', '0803165822341359', '1', '2017-08-03 00:00:00', '2017-08-24 00:00:00', '2017-08-03 16:58:31', '10156', '2017-08-03 17:09:23', '10156', '1', '123.0000', '123.0000', '123.0000', '123.0000', '0', null, '无');
INSERT INTO `t_insurance_compulsory` VALUES ('83', '10157', '1917-08-28 00:00:00', '0803171713534700', '0', null, null, '2017-08-03 17:17:29', '10157', null, null, '1', null, null, null, null, '10002', null, '干会');
INSERT INTO `t_insurance_compulsory` VALUES ('84', '10155', '2017-08-30 00:00:00', '0804085856482973', '0', '2017-08-23 00:00:00', '2017-08-02 00:00:00', '2017-08-04 08:59:14', '10155', null, null, '1', '11.0000', '11.0000', '11.0000', '11.0000', '0', null, 'just run');
INSERT INTO `t_insurance_compulsory` VALUES ('85', '10155', '1917-08-29 00:00:00', '0804090534879771', '0', null, null, '2017-08-04 09:06:03', '10155', null, null, '1', null, null, null, null, '10001', null, '');
INSERT INTO `t_insurance_compulsory` VALUES ('86', '10155', '2017-08-16 00:00:00', '080409310977499', '0', '2017-08-08 00:00:00', '2017-08-23 00:00:00', '2017-08-04 09:31:15', '10155', '2017-08-04 09:46:31', '10155', '1', '11.0000', '11.0000', '11.0000', '2.0000', '0', null, 'Hugh');
INSERT INTO `t_insurance_compulsory` VALUES ('87', '10156', '2017-08-04 00:00:00', '0804130952887855', '1', '2017-08-04 00:00:00', '2017-08-25 00:00:00', '2017-08-04 13:10:26', '10156', '2017-08-04 13:13:31', '10156', '1', '123.0000', '123.0000', '123.0000', '123.0000', '0', null, '这');
INSERT INTO `t_insurance_compulsory` VALUES ('88', '10156', '2017-08-04 00:00:00', '080413164760780', '0', '2017-08-04 00:00:00', '2017-08-26 00:00:00', '2017-08-04 13:16:55', '10156', null, null, '1', '123.0000', '123.0000', '123.0000', '123.0000', '0', null, '');
INSERT INTO `t_insurance_compulsory` VALUES ('89', '10155', '2017-08-10 00:00:00', '0810105634166574', '0', '2017-08-10 00:00:00', '2017-08-25 00:00:00', '2017-08-10 10:56:47', '10155', null, null, '1', '123.0000', '123.0000', '123.0000', '123.0000', '0', null, '36');
INSERT INTO `t_insurance_compulsory` VALUES ('90', '10155', '1917-09-05 00:00:00', '0811135329336222', '0', null, null, '2017-08-11 13:53:40', '10155', null, null, '1', null, null, null, null, '10001', null, 'Iloilo');

-- ----------------------------
-- Table structure for `t_insurance_linkman_msg`
-- ----------------------------
DROP TABLE IF EXISTS `t_insurance_linkman_msg`;
CREATE TABLE `t_insurance_linkman_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linkManId` int(11) DEFAULT NULL,
  `linkManName` varchar(50) DEFAULT NULL,
  `linkManPhone` varchar(15) DEFAULT NULL,
  `linkManZipCode` int(8) DEFAULT NULL,
  `linkManAddress` varchar(500) DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(11) DEFAULT NULL,
  `order_code` varchar(50) DEFAULT NULL,
  `user_id` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_insurance_linkman_msg
-- ----------------------------
INSERT INTO `t_insurance_linkman_msg` VALUES ('1', null, '和', '15901646896', '111444', '干会PSP', '0', '2017-08-03 14:11:03', '10157', null, null, '0803134652641133', '10157');
INSERT INTO `t_insurance_linkman_msg` VALUES ('2', null, '干会', '15901646896', '111111', '回归号四区', '0', '2017-08-03 14:13:22', '10157', null, null, '0803134652641133', '10157');
INSERT INTO `t_insurance_linkman_msg` VALUES ('3', null, '干会', '15901646896', '111111', '回归号四区', '0', '2017-08-03 14:14:57', '10157', null, null, '0803134652641133', '10157');
INSERT INTO `t_insurance_linkman_msg` VALUES ('4', null, '干会', '15901646896', '111111', '回归号四区', '0', '2017-08-03 14:15:17', '10157', null, null, '0803134652641133', '10157');
INSERT INTO `t_insurance_linkman_msg` VALUES ('5', null, '干会', '15901646896', '111111', '回归号四区', '0', '2017-08-03 14:16:00', '10157', null, null, '0803134652641133', '10157');
INSERT INTO `t_insurance_linkman_msg` VALUES ('6', null, '干会', '15901646896', '111111', '回归号四区', '0', '2017-08-03 14:16:47', '10157', null, null, '0803134652641133', '10157');
INSERT INTO `t_insurance_linkman_msg` VALUES ('7', null, '干会', '15901646896', '111111', '回归号四区', '0', '2017-08-03 14:16:54', '10157', null, null, '0803134652641133', '10157');
INSERT INTO `t_insurance_linkman_msg` VALUES ('8', null, '我', '13665552312', '234800', '车', '0', '2017-08-03 14:35:03', '10156', null, null, '0803143050161365', '10156');
INSERT INTO `t_insurance_linkman_msg` VALUES ('9', null, '无', '13665552312', '234000', '去', '0', '2017-08-04 13:19:00', '10156', null, null, '080413164760780', '10156');

-- ----------------------------
-- Table structure for `t_kan`
-- ----------------------------
DROP TABLE IF EXISTS `t_kan`;
CREATE TABLE `t_kan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL COMMENT '商品id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `kan_price` decimal(10,2) DEFAULT NULL COMMENT '砍价金额',
  `kan_time` datetime DEFAULT NULL COMMENT '砍价时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=394 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='砍价详情';

-- ----------------------------
-- Records of t_kan
-- ----------------------------
INSERT INTO `t_kan` VALUES ('179', '91', '10055', '1.00', '2017-06-02 16:38:04');
INSERT INTO `t_kan` VALUES ('180', '92', '10054', '1.00', '2017-06-03 11:41:51');
INSERT INTO `t_kan` VALUES ('181', '93', '10058', '0.00', '2017-06-03 11:49:06');
INSERT INTO `t_kan` VALUES ('182', '100', '10058', '1.00', '2017-06-03 13:40:39');
INSERT INTO `t_kan` VALUES ('183', '99', '10058', '1.00', '2017-06-03 13:43:19');
INSERT INTO `t_kan` VALUES ('184', '150', '10051', '1.00', '2017-06-03 17:09:42');
INSERT INTO `t_kan` VALUES ('185', '102', '10058', '18.00', '2017-06-03 18:23:42');
INSERT INTO `t_kan` VALUES ('186', '102', '10058', '5.00', '2017-06-03 18:23:45');
INSERT INTO `t_kan` VALUES ('187', '102', '10060', '15.00', '2017-06-03 19:35:01');
INSERT INTO `t_kan` VALUES ('188', '101', '10060', '5.00', '2017-06-03 19:35:09');
INSERT INTO `t_kan` VALUES ('189', '124', '10058', '5.00', '2017-06-04 10:33:09');
INSERT INTO `t_kan` VALUES ('190', '124', '10058', '18.00', '2017-06-04 10:33:10');
INSERT INTO `t_kan` VALUES ('191', '165', '10058', '2.00', '2017-06-04 11:02:21');
INSERT INTO `t_kan` VALUES ('192', '165', '10058', '1.00', '2017-06-04 11:02:21');
INSERT INTO `t_kan` VALUES ('193', '116', '10058', '3.00', '2017-06-04 11:18:17');
INSERT INTO `t_kan` VALUES ('194', '116', '10058', '1.00', '2017-06-04 11:18:19');
INSERT INTO `t_kan` VALUES ('195', '101', '10058', '4.00', '2017-06-04 22:03:34');
INSERT INTO `t_kan` VALUES ('196', '101', '10058', '5.00', '2017-06-04 22:03:35');
INSERT INTO `t_kan` VALUES ('197', '100', '10058', '2.00', '2017-06-04 22:03:48');
INSERT INTO `t_kan` VALUES ('198', '100', '10058', '1.00', '2017-06-04 22:03:49');
INSERT INTO `t_kan` VALUES ('199', '99', '10058', '3.00', '2017-06-04 22:03:54');
INSERT INTO `t_kan` VALUES ('200', '148', '10051', '2.00', '2017-06-05 11:41:35');
INSERT INTO `t_kan` VALUES ('201', '152', '10058', '8.00', '2017-06-05 15:34:37');
INSERT INTO `t_kan` VALUES ('202', '152', '10058', '11.00', '2017-06-05 15:34:39');
INSERT INTO `t_kan` VALUES ('203', '132', '10058', '5.00', '2017-06-05 15:34:40');
INSERT INTO `t_kan` VALUES ('204', '132', '10058', '3.00', '2017-06-05 15:34:42');
INSERT INTO `t_kan` VALUES ('205', '111', '10058', '4.00', '2017-06-05 15:39:57');
INSERT INTO `t_kan` VALUES ('206', '111', '10058', '4.00', '2017-06-05 15:39:59');
INSERT INTO `t_kan` VALUES ('207', '148', '10050', '15.00', '2017-06-05 18:21:23');
INSERT INTO `t_kan` VALUES ('208', '149', '10058', '1.00', '2017-06-05 19:05:24');
INSERT INTO `t_kan` VALUES ('209', '125', '10058', '23.00', '2017-06-05 19:05:34');
INSERT INTO `t_kan` VALUES ('210', '124', '10058', '5.00', '2017-06-05 19:05:39');
INSERT INTO `t_kan` VALUES ('211', '106', '10058', '2.00', '2017-06-05 19:08:57');
INSERT INTO `t_kan` VALUES ('212', '101', '10058', '3.00', '2017-06-05 19:09:46');
INSERT INTO `t_kan` VALUES ('213', '93', '10030', '0.00', '2017-06-05 22:51:54');
INSERT INTO `t_kan` VALUES ('214', '165', '10029', '2.00', '2017-06-06 08:49:54');
INSERT INTO `t_kan` VALUES ('215', '165', '10029', '1.00', '2017-06-06 08:51:58');
INSERT INTO `t_kan` VALUES ('216', '116', '10044', '1.00', '2017-06-06 10:09:21');
INSERT INTO `t_kan` VALUES ('217', '149', '10062', '2.00', '2017-06-06 13:19:34');
INSERT INTO `t_kan` VALUES ('218', '125', '10062', '28.00', '2017-06-06 13:19:57');
INSERT INTO `t_kan` VALUES ('219', '124', '10062', '13.00', '2017-06-06 13:20:00');
INSERT INTO `t_kan` VALUES ('220', '123', '10062', '2.00', '2017-06-06 13:20:04');
INSERT INTO `t_kan` VALUES ('221', '122', '10062', '3.00', '2017-06-06 13:20:07');
INSERT INTO `t_kan` VALUES ('222', '121', '10062', '3.00', '2017-06-06 13:20:10');
INSERT INTO `t_kan` VALUES ('223', '152', '10062', '4.00', '2017-06-06 13:20:14');
INSERT INTO `t_kan` VALUES ('224', '151', '10062', '1.00', '2017-06-06 13:20:17');
INSERT INTO `t_kan` VALUES ('225', '150', '10062', '3.00', '2017-06-06 13:20:25');
INSERT INTO `t_kan` VALUES ('226', '148', '10062', '19.00', '2017-06-06 13:20:28');
INSERT INTO `t_kan` VALUES ('227', '147', '10062', '15.00', '2017-06-06 13:20:30');
INSERT INTO `t_kan` VALUES ('228', '146', '10062', '3.00', '2017-06-06 13:20:33');
INSERT INTO `t_kan` VALUES ('229', '145', '10062', '2.00', '2017-06-06 13:20:38');
INSERT INTO `t_kan` VALUES ('230', '144', '10062', '1.00', '2017-06-06 13:20:41');
INSERT INTO `t_kan` VALUES ('231', '120', '10062', '10.00', '2017-06-06 13:20:45');
INSERT INTO `t_kan` VALUES ('232', '119', '10062', '3.00', '2017-06-06 13:20:47');
INSERT INTO `t_kan` VALUES ('233', '117', '10062', '2.00', '2017-06-06 13:20:52');
INSERT INTO `t_kan` VALUES ('234', '118', '10062', '1.00', '2017-06-06 13:20:58');
INSERT INTO `t_kan` VALUES ('235', '130', '10062', '2.00', '2017-06-06 13:21:12');
INSERT INTO `t_kan` VALUES ('236', '145', '10031', '3.00', '2017-06-06 13:31:21');
INSERT INTO `t_kan` VALUES ('237', '165', '10062', '2.00', '2017-06-06 14:09:27');
INSERT INTO `t_kan` VALUES ('238', '103', '10062', '16.00', '2017-06-06 14:09:34');
INSERT INTO `t_kan` VALUES ('239', '102', '10062', '6.00', '2017-06-06 14:09:37');
INSERT INTO `t_kan` VALUES ('240', '101', '10062', '1.00', '2017-06-06 16:16:29');
INSERT INTO `t_kan` VALUES ('241', '170', '10062', '31.00', '2017-06-06 16:17:40');
INSERT INTO `t_kan` VALUES ('242', '169', '10062', '30.00', '2017-06-06 16:17:52');
INSERT INTO `t_kan` VALUES ('243', '165', '10058', '2.00', '2017-06-06 17:47:20');
INSERT INTO `t_kan` VALUES ('244', '165', '10058', '2.00', '2017-06-06 17:47:22');
INSERT INTO `t_kan` VALUES ('245', '110', '10058', '1.00', '2017-06-06 17:47:25');
INSERT INTO `t_kan` VALUES ('246', '110', '10058', '1.00', '2017-06-06 17:47:27');
INSERT INTO `t_kan` VALUES ('247', '125', '10058', '26.00', '2017-06-06 17:47:29');
INSERT INTO `t_kan` VALUES ('248', '125', '10058', '27.00', '2017-06-06 17:47:31');
INSERT INTO `t_kan` VALUES ('249', '168', '10058', '2.00', '2017-06-06 18:07:38');
INSERT INTO `t_kan` VALUES ('250', '168', '10058', '1.00', '2017-06-06 18:07:39');
INSERT INTO `t_kan` VALUES ('251', '165', '10050', '2.00', '2017-06-06 18:29:33');
INSERT INTO `t_kan` VALUES ('252', '172', '10050', '9.00', '2017-06-06 18:30:33');
INSERT INTO `t_kan` VALUES ('253', '173', '10050', '2.00', '2017-06-06 18:30:57');
INSERT INTO `t_kan` VALUES ('254', '105', '10050', '1.00', '2017-06-06 18:31:09');
INSERT INTO `t_kan` VALUES ('255', '165', '10065', '1.00', '2017-06-06 18:44:39');
INSERT INTO `t_kan` VALUES ('256', '165', '10066', '1.00', '2017-06-06 18:53:37');
INSERT INTO `t_kan` VALUES ('257', '103', '10058', '28.00', '2017-06-06 22:10:47');
INSERT INTO `t_kan` VALUES ('258', '102', '10058', '5.00', '2017-06-06 22:10:52');
INSERT INTO `t_kan` VALUES ('259', '102', '10058', '12.00', '2017-06-06 22:10:54');
INSERT INTO `t_kan` VALUES ('260', '101', '10058', '1.00', '2017-06-06 22:10:58');
INSERT INTO `t_kan` VALUES ('261', '101', '10058', '4.00', '2017-06-06 22:11:00');
INSERT INTO `t_kan` VALUES ('262', '116', '10058', '3.00', '2017-06-06 22:11:03');
INSERT INTO `t_kan` VALUES ('263', '116', '10058', '2.00', '2017-06-06 22:11:05');
INSERT INTO `t_kan` VALUES ('264', '100', '10058', '2.00', '2017-06-06 22:11:08');
INSERT INTO `t_kan` VALUES ('265', '100', '10058', '1.00', '2017-06-06 22:11:10');
INSERT INTO `t_kan` VALUES ('266', '115', '10058', '2.00', '2017-06-06 22:11:13');
INSERT INTO `t_kan` VALUES ('267', '115', '10058', '2.00', '2017-06-06 22:11:14');
INSERT INTO `t_kan` VALUES ('268', '143', '10058', '14.00', '2017-06-06 22:11:46');
INSERT INTO `t_kan` VALUES ('269', '126', '10058', '1.00', '2017-06-06 22:11:49');
INSERT INTO `t_kan` VALUES ('270', '127', '10058', '2.00', '2017-06-06 22:11:52');
INSERT INTO `t_kan` VALUES ('271', '128', '10058', '2.00', '2017-06-06 22:11:55');
INSERT INTO `t_kan` VALUES ('272', '144', '10058', '3.00', '2017-06-06 22:11:57');
INSERT INTO `t_kan` VALUES ('273', '94', '10058', '8.00', '2017-06-06 22:12:00');
INSERT INTO `t_kan` VALUES ('274', '145', '10058', '3.00', '2017-06-06 22:12:02');
INSERT INTO `t_kan` VALUES ('275', '95', '10058', '3.00', '2017-06-06 22:12:05');
INSERT INTO `t_kan` VALUES ('276', '146', '10058', '4.00', '2017-06-06 22:12:08');
INSERT INTO `t_kan` VALUES ('277', '96', '10058', '4.00', '2017-06-06 22:12:10');
INSERT INTO `t_kan` VALUES ('278', '149', '10063', '1.00', '2017-06-06 22:52:04');
INSERT INTO `t_kan` VALUES ('279', '155', '10029', '3.00', '2017-06-07 09:35:48');
INSERT INTO `t_kan` VALUES ('280', '154', '10029', '1.00', '2017-06-07 09:35:52');
INSERT INTO `t_kan` VALUES ('281', '153', '10029', '2.00', '2017-06-07 09:35:56');
INSERT INTO `t_kan` VALUES ('282', '153', '10029', '2.00', '2017-06-07 09:35:56');
INSERT INTO `t_kan` VALUES ('283', '103', '10058', '23.00', '2017-06-07 09:38:04');
INSERT INTO `t_kan` VALUES ('284', '103', '10058', '22.00', '2017-06-07 09:38:04');
INSERT INTO `t_kan` VALUES ('285', '103', '10058', '24.00', '2017-06-07 09:38:04');
INSERT INTO `t_kan` VALUES ('286', '102', '10058', '10.00', '2017-06-07 09:38:13');
INSERT INTO `t_kan` VALUES ('287', '102', '10058', '8.00', '2017-06-07 09:38:15');
INSERT INTO `t_kan` VALUES ('288', '165', '10058', '1.00', '2017-06-07 09:38:21');
INSERT INTO `t_kan` VALUES ('289', '165', '10058', '1.00', '2017-06-07 09:38:25');
INSERT INTO `t_kan` VALUES ('290', '101', '10058', '4.00', '2017-06-07 09:39:27');
INSERT INTO `t_kan` VALUES ('291', '101', '10058', '1.00', '2017-06-07 09:39:28');
INSERT INTO `t_kan` VALUES ('292', '100', '10058', '2.00', '2017-06-07 09:39:38');
INSERT INTO `t_kan` VALUES ('293', '100', '10058', '1.00', '2017-06-07 09:39:39');
INSERT INTO `t_kan` VALUES ('294', '99', '10058', '2.00', '2017-06-07 09:39:44');
INSERT INTO `t_kan` VALUES ('295', '99', '10058', '1.00', '2017-06-07 09:39:46');
INSERT INTO `t_kan` VALUES ('296', '130', '10058', '3.00', '2017-06-07 09:45:51');
INSERT INTO `t_kan` VALUES ('297', '130', '10058', '3.00', '2017-06-07 09:45:52');
INSERT INTO `t_kan` VALUES ('298', '114', '10058', '1.00', '2017-06-07 09:45:54');
INSERT INTO `t_kan` VALUES ('299', '114', '10058', '1.00', '2017-06-07 09:45:55');
INSERT INTO `t_kan` VALUES ('300', '129', '10058', '2.00', '2017-06-07 09:45:56');
INSERT INTO `t_kan` VALUES ('301', '129', '10058', '1.00', '2017-06-07 09:45:57');
INSERT INTO `t_kan` VALUES ('302', '165', '10054', '1.00', '2017-06-07 09:46:40');
INSERT INTO `t_kan` VALUES ('303', '155', '10029', '3.00', '2017-06-07 09:54:14');
INSERT INTO `t_kan` VALUES ('304', '110', '10058', '3.00', '2017-06-07 09:55:14');
INSERT INTO `t_kan` VALUES ('305', '110', '10058', '3.00', '2017-06-07 09:55:15');
INSERT INTO `t_kan` VALUES ('306', '109', '10058', '1.00', '2017-06-07 09:55:16');
INSERT INTO `t_kan` VALUES ('307', '109', '10058', '1.00', '2017-06-07 09:55:19');
INSERT INTO `t_kan` VALUES ('308', '108', '10058', '2.00', '2017-06-07 09:55:21');
INSERT INTO `t_kan` VALUES ('309', '108', '10058', '5.00', '2017-06-07 09:55:22');
INSERT INTO `t_kan` VALUES ('310', '107', '10058', '6.00', '2017-06-07 09:55:28');
INSERT INTO `t_kan` VALUES ('311', '107', '10058', '20.00', '2017-06-07 09:55:29');
INSERT INTO `t_kan` VALUES ('312', '172', '10058', '11.00', '2017-06-07 09:55:31');
INSERT INTO `t_kan` VALUES ('313', '172', '10058', '7.00', '2017-06-07 09:55:32');
INSERT INTO `t_kan` VALUES ('314', '171', '10058', '4.00', '2017-06-07 09:55:35');
INSERT INTO `t_kan` VALUES ('315', '171', '10058', '5.00', '2017-06-07 09:55:35');
INSERT INTO `t_kan` VALUES ('316', '170', '10058', '3.00', '2017-06-07 09:55:37');
INSERT INTO `t_kan` VALUES ('317', '170', '10058', '39.00', '2017-06-07 09:55:38');
INSERT INTO `t_kan` VALUES ('318', '165', '10029', '1.00', '2017-06-07 10:00:31');
INSERT INTO `t_kan` VALUES ('319', '165', '10029', '2.00', '2017-06-07 10:00:43');
INSERT INTO `t_kan` VALUES ('320', '101', '10058', '1.00', '2017-07-03 14:51:17');
INSERT INTO `t_kan` VALUES ('321', '182', '10073', '41.00', '2017-07-03 17:47:06');
INSERT INTO `t_kan` VALUES ('322', '165', '10054', '2.00', '2017-07-03 17:48:56');
INSERT INTO `t_kan` VALUES ('323', '165', '10054', '1.00', '2017-07-04 09:45:09');
INSERT INTO `t_kan` VALUES ('324', '102', '10054', '19.00', '2017-07-04 11:16:01');
INSERT INTO `t_kan` VALUES ('325', '99', '10054', '1.00', '2017-07-04 11:16:04');
INSERT INTO `t_kan` VALUES ('326', '165', '10074', '1.00', '2017-07-04 11:21:48');
INSERT INTO `t_kan` VALUES ('327', '103', '10074', '11.00', '2017-07-04 11:21:57');
INSERT INTO `t_kan` VALUES ('328', '102', '10074', '11.00', '2017-07-04 11:22:05');
INSERT INTO `t_kan` VALUES ('329', '107', '10074', '16.00', '2017-07-04 17:19:51');
INSERT INTO `t_kan` VALUES ('330', '178', '10075', '3.00', '2017-07-05 15:33:33');
INSERT INTO `t_kan` VALUES ('331', '178', '10074', '12.00', '2017-07-07 14:20:54');
INSERT INTO `t_kan` VALUES ('338', '182', '10147', '78.60', '2017-07-14 14:03:40');
INSERT INTO `t_kan` VALUES ('339', '165', '10147', '1.00', '2017-07-14 14:03:53');
INSERT INTO `t_kan` VALUES ('340', '103', '10147', '267.00', '2017-07-14 14:07:26');
INSERT INTO `t_kan` VALUES ('341', '102', '10147', '157.00', '2017-07-14 14:07:33');
INSERT INTO `t_kan` VALUES ('342', '101', '10147', '1.00', '2017-07-14 14:07:37');
INSERT INTO `t_kan` VALUES ('343', '101', '10148', '1.00', '2017-07-14 17:14:43');
INSERT INTO `t_kan` VALUES ('344', '100', '10148', '2.32', '2017-07-14 17:18:09');
INSERT INTO `t_kan` VALUES ('346', '103', '10147', '267.00', '2017-07-15 10:38:16');
INSERT INTO `t_kan` VALUES ('347', '102', '10147', '157.00', '2017-07-15 10:38:19');
INSERT INTO `t_kan` VALUES ('348', '183', '10147', '0.06', '2017-07-15 10:41:05');
INSERT INTO `t_kan` VALUES ('349', '99', '10147', '1.00', '2017-07-15 10:42:20');
INSERT INTO `t_kan` VALUES ('350', '100', '10147', '2.32', '2017-07-15 11:24:55');
INSERT INTO `t_kan` VALUES ('351', '182', '10150', '40.60', '2017-07-15 15:31:54');
INSERT INTO `t_kan` VALUES ('352', '165', '10150', '1.00', '2017-07-15 15:32:19');
INSERT INTO `t_kan` VALUES ('353', '99', '10150', '1.00', '2017-07-17 09:19:30');
INSERT INTO `t_kan` VALUES ('354', '184', '10150', '0.00', '2017-07-17 09:23:29');
INSERT INTO `t_kan` VALUES ('355', '185', '10147', '0.01', '2017-07-17 14:32:16');
INSERT INTO `t_kan` VALUES ('356', '165', '10148', '1.00', '2017-07-18 11:08:23');
INSERT INTO `t_kan` VALUES ('357', '144', '10148', '1.60', '2017-07-18 11:10:10');
INSERT INTO `t_kan` VALUES ('358', '184', '10153', '0.00', '2017-07-18 14:43:49');
INSERT INTO `t_kan` VALUES ('359', '184', '10153', '0.00', '2017-07-18 14:43:50');
INSERT INTO `t_kan` VALUES ('360', '102', '10153', '157.00', '2017-07-18 14:44:27');
INSERT INTO `t_kan` VALUES ('361', '184', '10147', '0.00', '2017-07-19 08:52:02');
INSERT INTO `t_kan` VALUES ('362', '165', '10147', '1.00', '2017-07-20 12:14:02');
INSERT INTO `t_kan` VALUES ('363', '94', '10147', '2.00', '2017-07-20 12:25:24');
INSERT INTO `t_kan` VALUES ('364', '103', '10147', '267.00', '2017-07-20 12:25:42');
INSERT INTO `t_kan` VALUES ('365', '99', '10147', '1.00', '2017-07-20 12:25:44');
INSERT INTO `t_kan` VALUES ('366', '101', '10147', '1.00', '2017-07-20 12:25:53');
INSERT INTO `t_kan` VALUES ('367', '94', '10151', '2.00', '2017-07-21 08:45:55');
INSERT INTO `t_kan` VALUES ('368', '180', '10151', '4.08', '2017-07-21 08:46:05');
INSERT INTO `t_kan` VALUES ('369', '179', '10151', '1.40', '2017-07-21 08:48:24');
INSERT INTO `t_kan` VALUES ('370', '151', '10151', '1.40', '2017-07-21 08:51:40');
INSERT INTO `t_kan` VALUES ('371', '124', '10151', '30.60', '2017-07-21 08:51:56');
INSERT INTO `t_kan` VALUES ('372', '123', '10151', '3.20', '2017-07-21 08:52:02');
INSERT INTO `t_kan` VALUES ('373', '118', '10151', '3.92', '2017-07-21 08:52:15');
INSERT INTO `t_kan` VALUES ('374', '113', '10151', '52.60', '2017-07-21 08:52:28');
INSERT INTO `t_kan` VALUES ('375', '94', '10152', '2.00', '2017-07-21 08:55:48');
INSERT INTO `t_kan` VALUES ('376', '165', '10152', '1.00', '2017-07-21 08:55:51');
INSERT INTO `t_kan` VALUES ('377', '101', '10152', '1.00', '2017-07-21 08:55:54');
INSERT INTO `t_kan` VALUES ('378', '100', '10152', '2.32', '2017-07-21 08:55:57');
INSERT INTO `t_kan` VALUES ('379', '99', '10152', '1.00', '2017-07-21 08:56:01');
INSERT INTO `t_kan` VALUES ('380', '103', '10152', '267.00', '2017-07-21 08:56:03');
INSERT INTO `t_kan` VALUES ('381', '102', '10152', '157.00', '2017-07-21 08:56:06');
INSERT INTO `t_kan` VALUES ('382', '116', '10152', '3.20', '2017-07-21 08:56:09');
INSERT INTO `t_kan` VALUES ('383', '115', '10152', '3.92', '2017-07-21 08:56:12');
INSERT INTO `t_kan` VALUES ('384', '114', '10152', '1.92', '2017-07-21 08:56:17');
INSERT INTO `t_kan` VALUES ('385', '109', '10152', '1.92', '2017-07-21 08:56:19');
INSERT INTO `t_kan` VALUES ('386', '104', '10152', '1.92', '2017-07-21 08:56:28');
INSERT INTO `t_kan` VALUES ('387', '165', '10147', '1.00', '2017-07-21 11:47:40');
INSERT INTO `t_kan` VALUES ('388', '94', '10148', '2.00', '2017-07-31 08:30:16');
INSERT INTO `t_kan` VALUES ('389', '165', '10148', '1.00', '2017-07-31 08:30:20');
INSERT INTO `t_kan` VALUES ('390', '103', '10148', '267.00', '2017-07-31 08:32:25');
INSERT INTO `t_kan` VALUES ('391', '94', '10148', '2.00', '2017-08-01 08:37:27');
INSERT INTO `t_kan` VALUES ('392', '94', '10156', '2.00', '2017-08-10 08:55:32');
INSERT INTO `t_kan` VALUES ('393', '187', '10156', '10.00', '2017-08-10 09:55:33');

-- ----------------------------
-- Table structure for `t_loan`
-- ----------------------------
DROP TABLE IF EXISTS `t_loan`;
CREATE TABLE `t_loan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `finance_id` bigint(20) DEFAULT NULL,
  `order_num` varchar(64) DEFAULT NULL COMMENT '单号',
  `realname` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `idcard_num` varchar(32) DEFAULT NULL COMMENT '身份证号',
  `card_front` varchar(255) DEFAULT NULL COMMENT '身份证正面照',
  `card_back` varchar(255) DEFAULT NULL COMMENT '身份证背面照',
  `license` varchar(255) DEFAULT NULL COMMENT '营业执照',
  `mobile_phone` varchar(16) DEFAULT NULL COMMENT '联系电话',
  `loan_addr` varchar(255) DEFAULT NULL COMMENT '地址 省-市-区',
  `loan_addr_detail` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `car_type` varchar(512) DEFAULT NULL COMMENT '车型',
  `car_pic` varchar(1024) DEFAULT NULL COMMENT '车型图片',
  `car_count` varchar(128) DEFAULT NULL COMMENT '车辆数量',
  `car_eva` varchar(128) DEFAULT NULL COMMENT '车型估价',
  `car_time` datetime DEFAULT NULL COMMENT '上牌时间',
  `car_dist` int(11) DEFAULT NULL COMMENT '行驶里程',
  `appr_handler` varchar(16) DEFAULT NULL COMMENT '处理人',
  `appr_handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `appr_remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `loan_type` tinyint(4) DEFAULT NULL COMMENT '类型 1-个人新车 2-个人二手车 3-车商新车 4-车商二手车 5-车抵贷',
  `loan_state` tinyint(4) DEFAULT '0' COMMENT '状态 0-申请中 1-已回访 2-收集资料中 3-贷款成功 4-申请失败 5-已贷款',
  `loan_create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `back_time` datetime DEFAULT NULL,
  `collect_time` datetime DEFAULT NULL,
  `success_time` datetime DEFAULT NULL,
  `fail_time` datetime DEFAULT NULL,
  `loan_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `loan_time` datetime DEFAULT NULL COMMENT '已贷款时间',
  `loan_money` int(11) DEFAULT NULL COMMENT '预估可贷金额',
  `loan_peroid` int(11) DEFAULT NULL COMMENT '贷款期数',
  `loan_per` decimal(5,2) DEFAULT NULL COMMENT '年化利息',
  `loan_month` decimal(15,2) DEFAULT NULL COMMENT '月还款金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='个人贷款';

-- ----------------------------
-- Records of t_loan
-- ----------------------------
INSERT INTO `t_loan` VALUES ('62', '10157', '1', '20170801185617120585', '考虑考虑', '342622198410297095', null, null, null, null, '阿坝藏族羌族自治州/理县', null, '思铭-2012款 1.8L 自动', 'http://api.jisuapi.com/car/static/images/logo/300/293.jpg', null, null, null, null, null, null, null, '1', '0', '2017-08-01 18:56:17', null, null, null, null, null, null, '83860', '48', null, null);

-- ----------------------------
-- Table structure for `t_loan_met`
-- ----------------------------
DROP TABLE IF EXISTS `t_loan_met`;
CREATE TABLE `t_loan_met` (
  `id` bigint(20) NOT NULL,
  `material1` varchar(1024) DEFAULT NULL,
  `material2` varchar(1024) DEFAULT NULL,
  `material3` varchar(1024) DEFAULT NULL,
  `material4` varchar(1024) DEFAULT NULL,
  `material5` varchar(1024) DEFAULT NULL,
  `material6` varchar(1024) DEFAULT NULL,
  `material7` varchar(1024) DEFAULT NULL,
  `material8` varchar(1024) DEFAULT NULL,
  `material9` varchar(1024) DEFAULT NULL,
  `material10` varchar(1024) DEFAULT NULL,
  `material11` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='贷款材料';

-- ----------------------------
-- Records of t_loan_met
-- ----------------------------
INSERT INTO `t_loan_met` VALUES ('62', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `t_loan_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_loan_type`;
CREATE TABLE `t_loan_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='贷款材料类型';

-- ----------------------------
-- Records of t_loan_type
-- ----------------------------
INSERT INTO `t_loan_type` VALUES ('1', '个人贷款', '0');
INSERT INTO `t_loan_type` VALUES ('2', '个人二手车贷款', '0');
INSERT INTO `t_loan_type` VALUES ('3', '车商贷款', '0');
INSERT INTO `t_loan_type` VALUES ('4', '车商二手车贷款', '0');
INSERT INTO `t_loan_type` VALUES ('5', '车抵贷', '0');
INSERT INTO `t_loan_type` VALUES ('6', '夫妻双方身份证', '1');
INSERT INTO `t_loan_type` VALUES ('7', '户口本', '1');
INSERT INTO `t_loan_type` VALUES ('8', '银行资金流水', '1');

-- ----------------------------
-- Table structure for `t_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_user` varchar(64) DEFAULT NULL COMMENT '操作人',
  `log_remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `log_ip` varchar(32) DEFAULT NULL COMMENT 'ip',
  `log_params` varchar(255) DEFAULT NULL COMMENT '参数',
  `log_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1547 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='日志表';

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('446', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2016-12-09 13:41:28');
INSERT INTO `t_log` VALUES ('447', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2016-12-09 13:56:26');
INSERT INTO `t_log` VALUES ('448', 'admin', '执行查询SQL', '0:0:0:0:0:0:0:1', 'sql=select * from t_user;', '2016-12-09 14:09:13');
INSERT INTO `t_log` VALUES ('449', 'admin', '执行查询SQL', '0:0:0:0:0:0:0:1', 'sql=select * from t_user', '2016-12-09 14:09:25');
INSERT INTO `t_log` VALUES ('450', 'admin', '执行查询SQL', '0:0:0:0:0:0:0:1', 'sql=select * from t_user', '2016-12-09 14:10:00');
INSERT INTO `t_log` VALUES ('451', 'admin', '执行查询SQL', '0:0:0:0:0:0:0:1', 'sql=select * from t_user', '2016-12-09 14:10:31');
INSERT INTO `t_log` VALUES ('452', 'admin', '执行查询SQL', '0:0:0:0:0:0:0:1', 'sql=select * from t_user', '2016-12-09 14:10:48');
INSERT INTO `t_log` VALUES ('453', 'admin', '执行查询SQL', '0:0:0:0:0:0:0:1', 'sql=select * from t_admin', '2016-12-09 14:11:29');
INSERT INTO `t_log` VALUES ('454', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2016-12-14 18:43:00');
INSERT INTO `t_log` VALUES ('455', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2016-12-15 19:34:01');
INSERT INTO `t_log` VALUES ('456', 'admin', '禁用/启用管理员', '0:0:0:0:0:0:0:1', 'id=10005', '2016-12-15 19:34:12');
INSERT INTO `t_log` VALUES ('457', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2016-12-21 13:35:03');
INSERT INTO `t_log` VALUES ('458', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2016-12-21 13:39:09');
INSERT INTO `t_log` VALUES ('459', 'admin', '禁用/启用用户', '0:0:0:0:0:0:0:1', 'id=10002', '2016-12-21 13:39:38');
INSERT INTO `t_log` VALUES ('460', 'admin', '编辑用户', '0:0:0:0:0:0:0:1', 'username=xujunfei', '2016-12-21 13:40:40');
INSERT INTO `t_log` VALUES ('461', 'admin', '编辑用户', '0:0:0:0:0:0:0:1', 'username=xujunfei', '2016-12-21 13:47:09');
INSERT INTO `t_log` VALUES ('462', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2016-12-21 14:09:50');
INSERT INTO `t_log` VALUES ('463', 'admin', '编辑用户', '0:0:0:0:0:0:0:1', 'username=test01', '2016-12-21 14:19:36');
INSERT INTO `t_log` VALUES ('464', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-01-19 22:13:49');
INSERT INTO `t_log` VALUES ('465', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-02-15 10:44:36');
INSERT INTO `t_log` VALUES ('466', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-01 10:57:01');
INSERT INTO `t_log` VALUES ('467', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-04 10:27:23');
INSERT INTO `t_log` VALUES ('468', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-04 10:40:12');
INSERT INTO `t_log` VALUES ('469', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-04 10:51:53');
INSERT INTO `t_log` VALUES ('470', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-04 10:54:15');
INSERT INTO `t_log` VALUES ('471', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-04 10:59:29');
INSERT INTO `t_log` VALUES ('472', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-04 11:25:04');
INSERT INTO `t_log` VALUES ('473', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-04 11:35:37');
INSERT INTO `t_log` VALUES ('474', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-06 15:15:53');
INSERT INTO `t_log` VALUES ('475', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-06 15:29:21');
INSERT INTO `t_log` VALUES ('476', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 10:22:49');
INSERT INTO `t_log` VALUES ('477', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 10:33:26');
INSERT INTO `t_log` VALUES ('478', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 10:39:18');
INSERT INTO `t_log` VALUES ('479', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 10:44:03');
INSERT INTO `t_log` VALUES ('480', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 11:00:03');
INSERT INTO `t_log` VALUES ('481', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 11:14:18');
INSERT INTO `t_log` VALUES ('482', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 12:28:26');
INSERT INTO `t_log` VALUES ('483', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 12:30:03');
INSERT INTO `t_log` VALUES ('484', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 14:44:04');
INSERT INTO `t_log` VALUES ('485', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 14:46:47');
INSERT INTO `t_log` VALUES ('486', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 14:49:26');
INSERT INTO `t_log` VALUES ('487', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 16:35:05');
INSERT INTO `t_log` VALUES ('488', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 16:46:38');
INSERT INTO `t_log` VALUES ('489', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 16:47:43');
INSERT INTO `t_log` VALUES ('490', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 16:53:49');
INSERT INTO `t_log` VALUES ('491', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 17:01:30');
INSERT INTO `t_log` VALUES ('492', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 17:06:00');
INSERT INTO `t_log` VALUES ('493', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 20:50:46');
INSERT INTO `t_log` VALUES ('494', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 20:52:42');
INSERT INTO `t_log` VALUES ('495', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 21:02:23');
INSERT INTO `t_log` VALUES ('496', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 21:14:17');
INSERT INTO `t_log` VALUES ('497', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-03-18 21:29:33');
INSERT INTO `t_log` VALUES ('498', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-21 13:43:31');
INSERT INTO `t_log` VALUES ('499', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-21 14:05:18');
INSERT INTO `t_log` VALUES ('500', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-21 14:14:33');
INSERT INTO `t_log` VALUES ('501', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-21 16:34:53');
INSERT INTO `t_log` VALUES ('502', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-21 17:01:07');
INSERT INTO `t_log` VALUES ('503', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-22 09:42:50');
INSERT INTO `t_log` VALUES ('504', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-22 10:03:35');
INSERT INTO `t_log` VALUES ('505', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-22 11:09:21');
INSERT INTO `t_log` VALUES ('506', 'admin', '新增商家', '127.0.0.1', 'vendorName=轮胎店', '2017-03-22 11:10:08');
INSERT INTO `t_log` VALUES ('507', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-22 11:31:04');
INSERT INTO `t_log` VALUES ('508', 'admin', '新增商品', '127.0.0.1', 'productName=米其林轮胎', '2017-03-22 11:31:43');
INSERT INTO `t_log` VALUES ('509', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-22 11:39:25');
INSERT INTO `t_log` VALUES ('510', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-22 12:54:07');
INSERT INTO `t_log` VALUES ('511', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-22 18:40:14');
INSERT INTO `t_log` VALUES ('512', 'admin', '授权组', '127.0.0.1', 'roleId=10001', '2017-03-22 18:40:40');
INSERT INTO `t_log` VALUES ('513', 'admin', '更新管理员', '127.0.0.1', 'username=huang', '2017-03-22 18:43:36');
INSERT INTO `t_log` VALUES ('514', 'admin', '分类编辑', '127.0.0.1', '', '2017-03-22 18:45:17');
INSERT INTO `t_log` VALUES ('515', 'admin', '新增分类', '127.0.0.1', '', '2017-03-22 18:46:30');
INSERT INTO `t_log` VALUES ('516', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-23 09:58:30');
INSERT INTO `t_log` VALUES ('517', 'admin', '新增分类', '127.0.0.1', '', '2017-03-23 10:04:21');
INSERT INTO `t_log` VALUES ('518', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-23 10:48:00');
INSERT INTO `t_log` VALUES ('519', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-23 14:51:10');
INSERT INTO `t_log` VALUES ('520', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-23 14:55:35');
INSERT INTO `t_log` VALUES ('521', 'admin', '组禁用或启用', '127.0.0.1', 'roleId=10002', '2017-03-23 14:56:47');
INSERT INTO `t_log` VALUES ('522', 'huang', '管理员登录', '127.0.0.1', 'username=huang', '2017-03-23 14:57:00');
INSERT INTO `t_log` VALUES ('523', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-23 14:57:43');
INSERT INTO `t_log` VALUES ('524', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-28 09:34:26');
INSERT INTO `t_log` VALUES ('525', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-31 10:30:25');
INSERT INTO `t_log` VALUES ('526', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-03-31 10:38:21');
INSERT INTO `t_log` VALUES ('527', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-01 09:21:40');
INSERT INTO `t_log` VALUES ('528', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-01 09:55:43');
INSERT INTO `t_log` VALUES ('529', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-01 13:58:09');
INSERT INTO `t_log` VALUES ('530', 'admin', '授权组', '127.0.0.1', 'roleId=10001', '2017-04-01 13:58:31');
INSERT INTO `t_log` VALUES ('531', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-01 15:33:53');
INSERT INTO `t_log` VALUES ('532', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-01 16:18:14');
INSERT INTO `t_log` VALUES ('533', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-05 10:10:52');
INSERT INTO `t_log` VALUES ('534', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-06 14:28:26');
INSERT INTO `t_log` VALUES ('535', 'admin', '授权组', '127.0.0.1', 'roleId=10001', '2017-04-06 14:28:47');
INSERT INTO `t_log` VALUES ('536', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-06 21:40:28');
INSERT INTO `t_log` VALUES ('537', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-07 10:35:20');
INSERT INTO `t_log` VALUES ('538', 'admin', '授权组', '127.0.0.1', 'roleId=10001', '2017-04-07 10:35:39');
INSERT INTO `t_log` VALUES ('539', 'admin', '授权组', '127.0.0.1', 'roleId=10000', '2017-04-07 10:36:07');
INSERT INTO `t_log` VALUES ('540', 'admin', '授权组', '127.0.0.1', 'roleId=10002', '2017-04-07 10:36:38');
INSERT INTO `t_log` VALUES ('541', 'admin', '授权组', '127.0.0.1', 'roleId=10003', '2017-04-07 10:36:57');
INSERT INTO `t_log` VALUES ('542', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-11 10:06:40');
INSERT INTO `t_log` VALUES ('543', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-11 10:17:05');
INSERT INTO `t_log` VALUES ('544', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-11 10:38:58');
INSERT INTO `t_log` VALUES ('545', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-11 11:11:32');
INSERT INTO `t_log` VALUES ('546', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-11 14:06:06');
INSERT INTO `t_log` VALUES ('547', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-17 13:15:38');
INSERT INTO `t_log` VALUES ('548', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-18 14:21:15');
INSERT INTO `t_log` VALUES ('549', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-18 16:45:22');
INSERT INTO `t_log` VALUES ('550', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-21 12:33:45');
INSERT INTO `t_log` VALUES ('551', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-24 19:06:41');
INSERT INTO `t_log` VALUES ('552', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-25 10:59:57');
INSERT INTO `t_log` VALUES ('553', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-25 12:16:26');
INSERT INTO `t_log` VALUES ('554', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-27 10:01:26');
INSERT INTO `t_log` VALUES ('555', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-27 10:06:36');
INSERT INTO `t_log` VALUES ('556', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-04-28 13:09:35');
INSERT INTO `t_log` VALUES ('557', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-03 17:06:56');
INSERT INTO `t_log` VALUES ('558', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-07 09:37:00');
INSERT INTO `t_log` VALUES ('559', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-07 09:38:38');
INSERT INTO `t_log` VALUES ('560', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-11 16:37:12');
INSERT INTO `t_log` VALUES ('561', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-11 16:47:11');
INSERT INTO `t_log` VALUES ('562', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-11 17:22:31');
INSERT INTO `t_log` VALUES ('563', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-15 09:11:42');
INSERT INTO `t_log` VALUES ('564', 'admin', '新增商家', '127.0.0.1', 'vendorName=Test', '2017-05-15 09:13:15');
INSERT INTO `t_log` VALUES ('565', 'admin', '新增商品', '127.0.0.1', 'productName=Test', '2017-05-15 09:13:56');
INSERT INTO `t_log` VALUES ('566', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-15 21:58:34');
INSERT INTO `t_log` VALUES ('567', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-16 17:00:55');
INSERT INTO `t_log` VALUES ('568', 'admin', '新增商家', '127.0.0.1', 'vendorName=哈哈', '2017-05-16 17:01:27');
INSERT INTO `t_log` VALUES ('569', 'admin', '新增商品', '127.0.0.1', 'productName=哈哈', '2017-05-16 17:02:07');
INSERT INTO `t_log` VALUES ('570', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-16 17:15:35');
INSERT INTO `t_log` VALUES ('571', 'admin', '新增商家', '127.0.0.1', 'vendorName=222222', '2017-05-16 17:16:05');
INSERT INTO `t_log` VALUES ('572', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-17 11:20:25');
INSERT INTO `t_log` VALUES ('573', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-17 14:30:08');
INSERT INTO `t_log` VALUES ('574', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-17 14:32:53');
INSERT INTO `t_log` VALUES ('575', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-17 15:31:18');
INSERT INTO `t_log` VALUES ('576', 'admin', '商品上/下架', '127.0.0.1', 'productId=3', '2017-05-17 15:33:50');
INSERT INTO `t_log` VALUES ('577', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-17 15:34:03');
INSERT INTO `t_log` VALUES ('578', 'admin', '新增商品', '127.0.0.1', 'productName=宝马一号', '2017-05-17 15:40:27');
INSERT INTO `t_log` VALUES ('579', 'admin', '新增商品', '127.0.0.1', 'productName=会飞的石头', '2017-05-17 15:45:16');
INSERT INTO `t_log` VALUES ('580', 'admin', '新增商品', '127.0.0.1', 'productName=天王盖地虎', '2017-05-17 15:50:21');
INSERT INTO `t_log` VALUES ('581', 'admin', '商品上/下架', '127.0.0.1', 'productId=2', '2017-05-17 15:51:04');
INSERT INTO `t_log` VALUES ('582', 'admin', '商品上/下架', '127.0.0.1', 'productId=1', '2017-05-17 15:51:08');
INSERT INTO `t_log` VALUES ('583', 'admin', '商品上/下架', '127.0.0.1', 'productId=3', '2017-05-17 15:52:35');
INSERT INTO `t_log` VALUES ('584', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-17 16:13:16');
INSERT INTO `t_log` VALUES ('585', 'admin', '商品上/下架', '127.0.0.1', 'productId=3', '2017-05-17 16:13:34');
INSERT INTO `t_log` VALUES ('586', 'admin', '商品上/下架', '127.0.0.1', 'productId=1', '2017-05-17 16:13:47');
INSERT INTO `t_log` VALUES ('587', 'admin', '商品上/下架', '127.0.0.1', 'productId=1', '2017-05-17 16:16:41');
INSERT INTO `t_log` VALUES ('588', 'admin', '新增商品', '127.0.0.1', 'productName=宝马1000000', '2017-05-17 16:17:27');
INSERT INTO `t_log` VALUES ('589', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-17 16:42:42');
INSERT INTO `t_log` VALUES ('590', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-17 17:22:13');
INSERT INTO `t_log` VALUES ('591', 'admin', '新增商品', '127.0.0.1', 'productName=插座', '2017-05-17 17:23:45');
INSERT INTO `t_log` VALUES ('592', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-17 18:28:54');
INSERT INTO `t_log` VALUES ('593', 'admin', '新增商家', '127.0.0.1', 'vendorName=合肥长江西路店', '2017-05-17 18:29:54');
INSERT INTO `t_log` VALUES ('594', 'admin', '新增商品', '127.0.0.1', 'productName=宝马一号', '2017-05-17 18:30:27');
INSERT INTO `t_log` VALUES ('595', 'admin', '新增商品', '127.0.0.1', 'productName=超级大轮胎', '2017-05-17 18:51:38');
INSERT INTO `t_log` VALUES ('596', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-17 19:40:05');
INSERT INTO `t_log` VALUES ('597', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-18 08:51:49');
INSERT INTO `t_log` VALUES ('598', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-18 08:54:38');
INSERT INTO `t_log` VALUES ('599', 'admin', '新增商品', '127.0.0.1', 'productName=法拉利', '2017-05-18 08:56:40');
INSERT INTO `t_log` VALUES ('600', 'admin', '新增商品', '127.0.0.1', 'productName=奔驰2号', '2017-05-18 08:59:10');
INSERT INTO `t_log` VALUES ('601', 'admin', '新增商品', '127.0.0.1', 'productName=倚天剑一把', '2017-05-18 09:05:44');
INSERT INTO `t_log` VALUES ('602', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-18 09:36:59');
INSERT INTO `t_log` VALUES ('603', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-18 09:37:06');
INSERT INTO `t_log` VALUES ('604', 'admin', '商品上/下架', '127.0.0.1', 'productId=9', '2017-05-18 09:37:17');
INSERT INTO `t_log` VALUES ('605', 'admin', '商品上/下架', '127.0.0.1', 'productId=10', '2017-05-18 09:37:21');
INSERT INTO `t_log` VALUES ('606', 'admin', '商品上/下架', '127.0.0.1', 'productId=11', '2017-05-18 09:37:24');
INSERT INTO `t_log` VALUES ('607', 'admin', '商品上/下架', '127.0.0.1', 'productId=12', '2017-05-18 09:37:28');
INSERT INTO `t_log` VALUES ('608', 'admin', '商品上/下架', '127.0.0.1', 'productId=13', '2017-05-18 09:37:33');
INSERT INTO `t_log` VALUES ('609', 'admin', '新增商品', '127.0.0.1', 'productName=迪卡侬', '2017-05-18 09:38:14');
INSERT INTO `t_log` VALUES ('610', 'admin', '实名认证审核', '127.0.0.1', 'id=10027,state=1', '2017-05-18 09:50:18');
INSERT INTO `t_log` VALUES ('611', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-18 14:01:45');
INSERT INTO `t_log` VALUES ('612', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-18 15:07:19');
INSERT INTO `t_log` VALUES ('613', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-18 16:44:18');
INSERT INTO `t_log` VALUES ('614', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-18 17:23:42');
INSERT INTO `t_log` VALUES ('615', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-18 17:34:52');
INSERT INTO `t_log` VALUES ('616', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-18 17:38:13');
INSERT INTO `t_log` VALUES ('617', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-18 18:05:14');
INSERT INTO `t_log` VALUES ('618', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-18 18:54:31');
INSERT INTO `t_log` VALUES ('619', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-18 18:56:31');
INSERT INTO `t_log` VALUES ('620', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-19 10:07:12');
INSERT INTO `t_log` VALUES ('621', 'admin', '删除轮播图', '127.0.0.1', 'id=10002', '2017-05-19 10:07:28');
INSERT INTO `t_log` VALUES ('622', 'admin', '删除轮播图', '127.0.0.1', 'id=10001', '2017-05-19 10:07:32');
INSERT INTO `t_log` VALUES ('623', 'admin', '删除轮播图', '127.0.0.1', 'id=10000', '2017-05-19 10:07:35');
INSERT INTO `t_log` VALUES ('624', 'admin', '删除轮播图', '127.0.0.1', 'id=10003', '2017-05-19 10:07:39');
INSERT INTO `t_log` VALUES ('625', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-19 10:12:28');
INSERT INTO `t_log` VALUES ('626', 'admin', '新增轮播图', '127.0.0.1', 'title=banner1', '2017-05-19 10:13:09');
INSERT INTO `t_log` VALUES ('627', 'admin', '新增轮播图', '127.0.0.1', 'title=banner2', '2017-05-19 10:13:24');
INSERT INTO `t_log` VALUES ('628', 'admin', '新增轮播图', '127.0.0.1', 'title=banner3', '2017-05-19 10:13:38');
INSERT INTO `t_log` VALUES ('629', 'admin', '商品上/下架', '127.0.0.1', 'productId=13', '2017-05-19 10:16:01');
INSERT INTO `t_log` VALUES ('630', 'admin', '商品上/下架', '127.0.0.1', 'productId=12', '2017-05-19 10:16:05');
INSERT INTO `t_log` VALUES ('631', 'admin', '新增商品', '127.0.0.1', 'productName=西西', '2017-05-19 10:20:20');
INSERT INTO `t_log` VALUES ('632', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-19 16:46:09');
INSERT INTO `t_log` VALUES ('633', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-20 10:24:42');
INSERT INTO `t_log` VALUES ('634', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-22 11:08:08');
INSERT INTO `t_log` VALUES ('635', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-23 12:04:29');
INSERT INTO `t_log` VALUES ('636', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-23 16:00:10');
INSERT INTO `t_log` VALUES ('637', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-23 18:12:21');
INSERT INTO `t_log` VALUES ('638', 'admin', '新增轮播图', '127.0.0.1', 'title=123', '2017-05-23 18:12:39');
INSERT INTO `t_log` VALUES ('639', 'admin', '删除轮播图', '127.0.0.1', 'id=10007', '2017-05-23 18:13:23');
INSERT INTO `t_log` VALUES ('640', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-24 20:16:28');
INSERT INTO `t_log` VALUES ('641', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-24 20:17:45');
INSERT INTO `t_log` VALUES ('642', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-24 21:17:14');
INSERT INTO `t_log` VALUES ('643', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-24 23:09:26');
INSERT INTO `t_log` VALUES ('644', 'admin', '新增商家', '127.0.0.1', 'vendorName=合肥诚创汽车服务有限公司', '2017-05-24 23:11:05');
INSERT INTO `t_log` VALUES ('645', 'admin', '商品上/下架', '127.0.0.1', 'productId=12', '2017-05-24 23:11:17');
INSERT INTO `t_log` VALUES ('646', 'admin', '商品上/下架', '127.0.0.1', 'productId=13', '2017-05-24 23:11:23');
INSERT INTO `t_log` VALUES ('647', 'admin', '商品上/下架', '127.0.0.1', 'productId=14', '2017-05-24 23:11:28');
INSERT INTO `t_log` VALUES ('648', 'admin', '商品上/下架', '127.0.0.1', 'productId=15', '2017-05-24 23:11:32');
INSERT INTO `t_log` VALUES ('649', 'admin', '新增商品', '127.0.0.1', 'productName=空调清洗', '2017-05-24 23:18:02');
INSERT INTO `t_log` VALUES ('650', 'admin', '更新商品', '127.0.0.1', 'productName=空调清洗', '2017-05-24 23:23:49');
INSERT INTO `t_log` VALUES ('651', 'admin', '新增商品', '127.0.0.1', 'productName=100元会员卡代金券（仅适用于600元档会员卡）', '2017-05-24 23:31:19');
INSERT INTO `t_log` VALUES ('652', 'admin', '新增商品', '127.0.0.1', 'productName=150元会员卡代金券（仅适用于1100元档会员卡）', '2017-05-24 23:33:40');
INSERT INTO `t_log` VALUES ('653', 'admin', '新增商品', '127.0.0.1', 'productName=200元会员卡代金券（仅适用于2200元档会员卡）', '2017-05-24 23:36:17');
INSERT INTO `t_log` VALUES ('654', 'admin', '新增商品', '127.0.0.1', 'productName=300元会员卡代金券（仅适用于5300元档会员卡）', '2017-05-24 23:38:17');
INSERT INTO `t_log` VALUES ('655', 'admin', '新增商家', '127.0.0.1', 'vendorName=好亮杰汽车服务有限公司', '2017-05-24 23:41:06');
INSERT INTO `t_log` VALUES ('656', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-24 23:45:05');
INSERT INTO `t_log` VALUES ('657', 'admin', '新增商品', '127.0.0.1', 'productName=汽车精洗', '2017-05-24 23:51:50');
INSERT INTO `t_log` VALUES ('658', 'admin', '新增商品', '127.0.0.1', 'productName=汽车打蜡', '2017-05-24 23:54:36');
INSERT INTO `t_log` VALUES ('659', 'admin', '新增商品', '127.0.0.1', 'productName=单次镀晶', '2017-05-25 00:01:04');
INSERT INTO `t_log` VALUES ('660', 'admin', '新增商品', '127.0.0.1', 'productName=全年镀晶', '2017-05-25 00:05:03');
INSERT INTO `t_log` VALUES ('661', 'admin', '新增商家', '127.0.0.1', 'vendorName=合肥聚鑫欣汽车服务有限公司（一）', '2017-05-25 00:12:44');
INSERT INTO `t_log` VALUES ('662', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 00:14:16');
INSERT INTO `t_log` VALUES ('663', 'admin', '新增商品', '127.0.0.1', 'productName=汽车精洗', '2017-05-25 00:18:49');
INSERT INTO `t_log` VALUES ('664', 'admin', '新增商品', '127.0.0.1', 'productName=汽车打蜡', '2017-05-25 00:19:59');
INSERT INTO `t_log` VALUES ('665', 'admin', '新增商品', '127.0.0.1', 'productName=单次镀晶', '2017-05-25 00:21:20');
INSERT INTO `t_log` VALUES ('666', 'admin', '新增商家', '127.0.0.1', 'vendorName=合肥聚鑫欣汽车服务有限公司（二）', '2017-05-25 00:22:30');
INSERT INTO `t_log` VALUES ('667', 'admin', '新增商品', '127.0.0.1', 'productName=单次镀晶', '2017-05-25 00:23:58');
INSERT INTO `t_log` VALUES ('668', 'admin', '新增商家', '127.0.0.1', 'vendorName=合肥聚鑫欣汽车服务有限公司（三）', '2017-05-25 00:26:23');
INSERT INTO `t_log` VALUES ('669', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 00:28:27');
INSERT INTO `t_log` VALUES ('670', 'admin', '新增商品', '127.0.0.1', 'productName=汽车精洗', '2017-05-25 00:29:29');
INSERT INTO `t_log` VALUES ('671', 'admin', '新增商品', '127.0.0.1', 'productName=汽车打蜡', '2017-05-25 00:30:38');
INSERT INTO `t_log` VALUES ('672', 'admin', '新增商品', '127.0.0.1', 'productName=单次镀晶', '2017-05-25 00:31:41');
INSERT INTO `t_log` VALUES ('673', 'admin', '新增商品', '127.0.0.1', 'productName=全年镀晶', '2017-05-25 00:32:34');
INSERT INTO `t_log` VALUES ('674', 'admin', '新增商家', '127.0.0.1', 'vendorName=德国马牌休宁路店', '2017-05-25 00:39:57');
INSERT INTO `t_log` VALUES ('675', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 00:41:22');
INSERT INTO `t_log` VALUES ('676', 'admin', '新增商品', '127.0.0.1', 'productName=汽车精洗', '2017-05-25 00:42:57');
INSERT INTO `t_log` VALUES ('677', 'admin', '新增商品', '127.0.0.1', 'productName=汽车打蜡', '2017-05-25 00:44:27');
INSERT INTO `t_log` VALUES ('678', 'admin', '新增商家', '127.0.0.1', 'vendorName=百世德笔架山路旗舰店', '2017-05-25 00:45:19');
INSERT INTO `t_log` VALUES ('679', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 00:46:55');
INSERT INTO `t_log` VALUES ('680', 'admin', '新增商品', '127.0.0.1', 'productName=汽车精洗', '2017-05-25 00:48:08');
INSERT INTO `t_log` VALUES ('681', 'admin', '新增商品', '127.0.0.1', 'productName=汽车打蜡', '2017-05-25 00:49:15');
INSERT INTO `t_log` VALUES ('682', 'admin', '新增商品', '127.0.0.1', 'productName=单次镀晶', '2017-05-25 00:50:21');
INSERT INTO `t_log` VALUES ('683', 'admin', '新增商家', '127.0.0.1', 'vendorName=百世德石笋路旗舰店', '2017-05-25 00:52:08');
INSERT INTO `t_log` VALUES ('684', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 00:53:15');
INSERT INTO `t_log` VALUES ('685', 'admin', '新增商品', '127.0.0.1', 'productName=汽车精洗', '2017-05-25 00:54:39');
INSERT INTO `t_log` VALUES ('686', 'admin', '新增商品', '127.0.0.1', 'productName=汽车打蜡', '2017-05-25 00:55:45');
INSERT INTO `t_log` VALUES ('687', 'admin', '新增商品', '127.0.0.1', 'productName=单次镀晶', '2017-05-25 00:57:30');
INSERT INTO `t_log` VALUES ('688', 'admin', '新增商品', '127.0.0.1', 'productName=全年镀晶', '2017-05-25 00:58:30');
INSERT INTO `t_log` VALUES ('689', 'admin', '新增商家', '127.0.0.1', 'vendorName=德国马牌宝塔路聚茂店', '2017-05-25 00:59:15');
INSERT INTO `t_log` VALUES ('690', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 01:00:32');
INSERT INTO `t_log` VALUES ('691', 'admin', '新增商品', '127.0.0.1', 'productName=汽车精洗', '2017-05-25 01:01:18');
INSERT INTO `t_log` VALUES ('692', 'admin', '新增商品', '127.0.0.1', 'productName=汽车打蜡', '2017-05-25 01:02:10');
INSERT INTO `t_log` VALUES ('693', 'admin', '新增商家', '127.0.0.1', 'vendorName=速途驰加（宋都店）', '2017-05-25 01:08:00');
INSERT INTO `t_log` VALUES ('694', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 01:09:49');
INSERT INTO `t_log` VALUES ('695', 'admin', '新增商品', '127.0.0.1', 'productName=四轮充氮', '2017-05-25 01:11:41');
INSERT INTO `t_log` VALUES ('696', 'admin', '新增商品', '127.0.0.1', 'productName=四轮定位', '2017-05-25 01:12:51');
INSERT INTO `t_log` VALUES ('697', 'admin', '新增商品', '127.0.0.1', 'productName=刹车系统养护', '2017-05-25 01:14:21');
INSERT INTO `t_log` VALUES ('698', 'admin', '新增商家', '127.0.0.1', 'vendorName=速途驰加（万达店）', '2017-05-25 01:16:06');
INSERT INTO `t_log` VALUES ('699', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 01:17:21');
INSERT INTO `t_log` VALUES ('700', 'admin', '新增商品', '127.0.0.1', 'productName=四轮充氮', '2017-05-25 01:18:52');
INSERT INTO `t_log` VALUES ('701', 'admin', '新增商品', '127.0.0.1', 'productName=四轮定位', '2017-05-25 01:20:20');
INSERT INTO `t_log` VALUES ('702', 'admin', '新增商品', '127.0.0.1', 'productName=刹车系统养护', '2017-05-25 01:21:23');
INSERT INTO `t_log` VALUES ('703', 'admin', '新增商家', '127.0.0.1', 'vendorName=速途驰加（夏园路店）', '2017-05-25 01:27:29');
INSERT INTO `t_log` VALUES ('704', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 01:28:31');
INSERT INTO `t_log` VALUES ('705', 'admin', '新增商品', '127.0.0.1', 'productName=四轮充氮', '2017-05-25 01:29:43');
INSERT INTO `t_log` VALUES ('706', 'admin', '新增商品', '127.0.0.1', 'productName=四轮定位', '2017-05-25 01:30:44');
INSERT INTO `t_log` VALUES ('707', 'admin', '新增商品', '127.0.0.1', 'productName=刹车', '2017-05-25 01:31:49');
INSERT INTO `t_log` VALUES ('708', 'admin', '更新商品', '127.0.0.1', 'productName=刹车系统养护', '2017-05-25 01:32:05');
INSERT INTO `t_log` VALUES ('709', 'admin', '新增商家', '127.0.0.1', 'vendorName=速途驰加（中铁店）', '2017-05-25 01:32:47');
INSERT INTO `t_log` VALUES ('710', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 01:46:54');
INSERT INTO `t_log` VALUES ('711', 'admin', '新增商品', '127.0.0.1', 'productName=四轮充氮', '2017-05-25 01:48:07');
INSERT INTO `t_log` VALUES ('712', 'admin', '新增商品', '127.0.0.1', 'productName=四轮定位', '2017-05-25 01:49:08');
INSERT INTO `t_log` VALUES ('713', 'admin', '新增商品', '127.0.0.1', 'productName=刹车系统养护', '2017-05-25 01:50:09');
INSERT INTO `t_log` VALUES ('714', 'admin', '新增商品', '127.0.0.1', 'productName=汽车镀膜', '2017-05-25 01:51:25');
INSERT INTO `t_log` VALUES ('715', 'admin', '新增商家', '127.0.0.1', 'vendorName=速途驰加（海棠路店）', '2017-05-25 01:52:03');
INSERT INTO `t_log` VALUES ('716', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 01:53:15');
INSERT INTO `t_log` VALUES ('717', 'admin', '新增商品', '127.0.0.1', 'productName=四轮充氮', '2017-05-25 01:54:09');
INSERT INTO `t_log` VALUES ('718', 'admin', '新增商品', '127.0.0.1', 'productName=四轮定位', '2017-05-25 01:55:11');
INSERT INTO `t_log` VALUES ('719', 'admin', '新增商品', '127.0.0.1', 'productName=刹车系统养护', '2017-05-25 01:56:06');
INSERT INTO `t_log` VALUES ('720', 'admin', '新增商家', '127.0.0.1', 'vendorName=速途驰加（万科城店）', '2017-05-25 01:57:19');
INSERT INTO `t_log` VALUES ('721', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 01:58:38');
INSERT INTO `t_log` VALUES ('722', 'admin', '新增商品', '127.0.0.1', 'productName=四轮充氮', '2017-05-25 01:59:44');
INSERT INTO `t_log` VALUES ('723', 'admin', '新增商品', '127.0.0.1', 'productName=四轮定位', '2017-05-25 02:00:51');
INSERT INTO `t_log` VALUES ('724', 'admin', '新增商家', '127.0.0.1', 'vendorName=速途驰加（皖江路店）', '2017-05-25 02:01:38');
INSERT INTO `t_log` VALUES ('725', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 02:02:33');
INSERT INTO `t_log` VALUES ('726', 'admin', '新增商品', '127.0.0.1', 'productName=四轮充氮', '2017-05-25 02:03:21');
INSERT INTO `t_log` VALUES ('727', 'admin', '新增商品', '127.0.0.1', 'productName=四轮定位', '2017-05-25 02:04:55');
INSERT INTO `t_log` VALUES ('728', 'admin', '更新商品', '127.0.0.1', 'productName=四轮定位', '2017-05-25 02:06:00');
INSERT INTO `t_log` VALUES ('729', 'admin', '更新商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 02:06:13');
INSERT INTO `t_log` VALUES ('730', 'admin', '更新商品', '127.0.0.1', 'productName=刹车系统养护', '2017-05-25 02:06:23');
INSERT INTO `t_log` VALUES ('731', 'admin', '更新商品', '127.0.0.1', 'productName=四轮定位', '2017-05-25 02:06:30');
INSERT INTO `t_log` VALUES ('732', 'admin', '更新商品', '127.0.0.1', 'productName=四轮充氮', '2017-05-25 02:06:36');
INSERT INTO `t_log` VALUES ('733', 'admin', '更新商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 02:06:49');
INSERT INTO `t_log` VALUES ('734', 'admin', '更新商品', '127.0.0.1', 'productName=刹车系统养护', '2017-05-25 02:06:56');
INSERT INTO `t_log` VALUES ('735', 'admin', '更新商品', '127.0.0.1', 'productName=四轮充氮', '2017-05-25 02:07:04');
INSERT INTO `t_log` VALUES ('736', 'admin', '更新商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 02:07:10');
INSERT INTO `t_log` VALUES ('737', 'admin', '更新商品', '127.0.0.1', 'productName=汽车打蜡', '2017-05-25 02:07:20');
INSERT INTO `t_log` VALUES ('738', 'admin', '更新商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 02:07:26');
INSERT INTO `t_log` VALUES ('739', 'admin', '更新商品', '127.0.0.1', 'productName=全年镀晶', '2017-05-25 02:07:35');
INSERT INTO `t_log` VALUES ('740', 'admin', '更新商品', '127.0.0.1', 'productName=单次镀晶', '2017-05-25 02:07:43');
INSERT INTO `t_log` VALUES ('741', 'admin', '更新商品', '127.0.0.1', 'productName=汽车打蜡', '2017-05-25 02:07:49');
INSERT INTO `t_log` VALUES ('742', 'admin', '更新商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 02:07:57');
INSERT INTO `t_log` VALUES ('743', 'admin', '更新商品', '127.0.0.1', 'productName=单次镀晶', '2017-05-25 02:08:03');
INSERT INTO `t_log` VALUES ('744', 'admin', '更新商品', '127.0.0.1', 'productName=汽车打蜡', '2017-05-25 02:08:10');
INSERT INTO `t_log` VALUES ('745', 'admin', '更新商品', '127.0.0.1', 'productName=汽车精洗', '2017-05-25 02:08:17');
INSERT INTO `t_log` VALUES ('746', 'admin', '更新商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 02:08:27');
INSERT INTO `t_log` VALUES ('747', 'admin', '更新商品', '127.0.0.1', 'productName=汽车打蜡', '2017-05-25 02:08:34');
INSERT INTO `t_log` VALUES ('748', 'admin', '更新商品', '127.0.0.1', 'productName=汽车精洗', '2017-05-25 02:08:43');
INSERT INTO `t_log` VALUES ('749', 'admin', '更新商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 02:08:49');
INSERT INTO `t_log` VALUES ('750', 'admin', '更新商品', '127.0.0.1', 'productName=全年镀晶', '2017-05-25 02:08:56');
INSERT INTO `t_log` VALUES ('751', 'admin', '更新商品', '127.0.0.1', 'productName=单次镀晶', '2017-05-25 02:09:03');
INSERT INTO `t_log` VALUES ('752', 'admin', '更新商品', '127.0.0.1', 'productName=汽车精洗', '2017-05-25 02:09:10');
INSERT INTO `t_log` VALUES ('753', 'admin', '更新商品', '127.0.0.1', 'productName=单次镀晶', '2017-05-25 02:09:20');
INSERT INTO `t_log` VALUES ('754', 'admin', '更新商品', '127.0.0.1', 'productName=单次镀晶', '2017-05-25 02:09:26');
INSERT INTO `t_log` VALUES ('755', 'admin', '更新商品', '127.0.0.1', 'productName=汽车打蜡', '2017-05-25 02:09:31');
INSERT INTO `t_log` VALUES ('756', 'admin', '更新商品', '127.0.0.1', 'productName=汽车精洗', '2017-05-25 02:09:41');
INSERT INTO `t_log` VALUES ('757', 'admin', '更新商品', '127.0.0.1', 'productName=汽车普洗', '2017-05-25 02:09:47');
INSERT INTO `t_log` VALUES ('758', 'admin', '更新商品', '127.0.0.1', 'productName=全年镀晶', '2017-05-25 02:09:54');
INSERT INTO `t_log` VALUES ('759', 'admin', '更新商品', '127.0.0.1', 'productName=单次镀晶', '2017-05-25 02:10:00');
INSERT INTO `t_log` VALUES ('760', 'admin', '更新商品', '127.0.0.1', 'productName=汽车打蜡', '2017-05-25 02:10:06');
INSERT INTO `t_log` VALUES ('761', 'admin', '更新商品', '127.0.0.1', 'productName=汽车精洗', '2017-05-25 02:10:15');
INSERT INTO `t_log` VALUES ('762', 'admin', '更新商品', '127.0.0.1', 'productName=300元会员卡代金券（仅适用于5300元档会员卡）', '2017-05-25 02:10:21');
INSERT INTO `t_log` VALUES ('763', 'admin', '更新商品', '127.0.0.1', 'productName=200元会员卡代金券（仅适用于2200元档会员卡）', '2017-05-25 02:10:26');
INSERT INTO `t_log` VALUES ('764', 'admin', '更新商品', '127.0.0.1', 'productName=150元会员卡代金券（仅适用于1100元档会员卡）', '2017-05-25 02:10:33');
INSERT INTO `t_log` VALUES ('765', 'admin', '更新商品', '127.0.0.1', 'productName=100元会员卡代金券（仅适用于600元档会员卡）', '2017-05-25 02:10:43');
INSERT INTO `t_log` VALUES ('766', 'admin', '更新商品', '127.0.0.1', 'productName=空调清洗', '2017-05-25 02:10:50');
INSERT INTO `t_log` VALUES ('767', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-25 08:55:33');
INSERT INTO `t_log` VALUES ('768', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-25 09:59:51');
INSERT INTO `t_log` VALUES ('769', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-25 10:00:08');
INSERT INTO `t_log` VALUES ('770', 'admin', '新增商品', '127.0.0.1', 'productName=宝马一号', '2017-05-25 10:01:38');
INSERT INTO `t_log` VALUES ('771', 'admin', '商品上/下架', '127.0.0.1', 'productId=78', '2017-05-25 10:03:06');
INSERT INTO `t_log` VALUES ('772', 'admin', '新增商品', '127.0.0.1', 'productName=测试商品111111', '2017-05-25 10:04:39');
INSERT INTO `t_log` VALUES ('773', 'admin', '商品上/下架', '127.0.0.1', 'productId=79', '2017-05-25 10:05:08');
INSERT INTO `t_log` VALUES ('774', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-25 14:01:47');
INSERT INTO `t_log` VALUES ('775', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-25 14:03:12');
INSERT INTO `t_log` VALUES ('776', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-25 15:32:17');
INSERT INTO `t_log` VALUES ('777', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-25 16:41:45');
INSERT INTO `t_log` VALUES ('778', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-31 10:22:41');
INSERT INTO `t_log` VALUES ('779', 'admin', '更新商家', '127.0.0.1', 'vendorName=测试地址', '2017-05-31 10:30:07');
INSERT INTO `t_log` VALUES ('780', 'admin', '新增商家', '127.0.0.1', 'vendorName=合肥新起点汽车服务连锁（文忠路店）', '2017-05-31 10:32:02');
INSERT INTO `t_log` VALUES ('781', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-31 11:03:44');
INSERT INTO `t_log` VALUES ('782', 'admin', '新增商品', '127.0.0.1', 'productName=免擦拭无划痕洗车', '2017-05-31 11:05:23');
INSERT INTO `t_log` VALUES ('783', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-31 11:27:21');
INSERT INTO `t_log` VALUES ('784', 'admin', '新增商品', '127.0.0.1', 'productName=套餐A（精致内饰清洗、漆面去渍增光养护、发动机精洗镀膜、车内香薰、轮毂清洗除锈）', '2017-05-31 11:29:02');
INSERT INTO `t_log` VALUES ('785', 'admin', '新增商品', '127.0.0.1', 'productName=套餐B（发动机进气系统清洗、发动机燃烧室清洗、发动机喷油嘴清洗、发动机三元催化清洗。', '2017-05-31 11:35:58');
INSERT INTO `t_log` VALUES ('786', 'admin', '新增商家', '127.0.0.1', 'vendorName=合肥新起点汽车服务连锁（南翔路店）', '2017-05-31 11:37:48');
INSERT INTO `t_log` VALUES ('787', 'admin', '新增商品', '127.0.0.1', 'productName=免擦拭无划痕洗车', '2017-05-31 11:40:49');
INSERT INTO `t_log` VALUES ('788', 'admin', '新增商品', '127.0.0.1', 'productName=套餐A（精致内饰清洗、漆面去渍增光养护、发动机精洗镀膜、车内香薰、轮毂清洗除锈）', '2017-05-31 11:43:29');
INSERT INTO `t_log` VALUES ('789', 'admin', '新增商品', '127.0.0.1', 'productName=套餐B（发动机进气系统清洗、发动机燃烧室清洗、发动机喷油嘴清洗、发动机三元催化清洗。', '2017-05-31 11:52:43');
INSERT INTO `t_log` VALUES ('790', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-31 13:32:49');
INSERT INTO `t_log` VALUES ('791', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-05-31 14:08:24');
INSERT INTO `t_log` VALUES ('792', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥诚创汽车服务有限公司', '2017-05-31 14:08:54');
INSERT INTO `t_log` VALUES ('793', 'admin', '更新商家', '127.0.0.1', 'vendorName=好亮杰汽车服务有限公司', '2017-05-31 14:09:44');
INSERT INTO `t_log` VALUES ('794', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥聚鑫欣汽车服务有限公司（一）', '2017-05-31 14:10:10');
INSERT INTO `t_log` VALUES ('795', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥聚鑫欣汽车服务有限公司（二）', '2017-05-31 14:10:19');
INSERT INTO `t_log` VALUES ('796', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥聚鑫欣汽车服务有限公司（三）', '2017-05-31 14:10:27');
INSERT INTO `t_log` VALUES ('797', 'admin', '更新商家', '127.0.0.1', 'vendorName=德国马牌休宁路店', '2017-05-31 14:11:09');
INSERT INTO `t_log` VALUES ('798', 'admin', '更新商家', '127.0.0.1', 'vendorName=百世德笔架山路旗舰店', '2017-05-31 14:11:26');
INSERT INTO `t_log` VALUES ('799', 'admin', '更新商家', '127.0.0.1', 'vendorName=百世德石笋路旗舰店', '2017-05-31 14:11:34');
INSERT INTO `t_log` VALUES ('800', 'admin', '更新商家', '127.0.0.1', 'vendorName=德国马牌宝塔路聚茂店', '2017-05-31 14:11:57');
INSERT INTO `t_log` VALUES ('801', 'admin', '更新商家', '127.0.0.1', 'vendorName=速途驰加（宋都店）', '2017-05-31 14:12:22');
INSERT INTO `t_log` VALUES ('802', 'admin', '更新商家', '127.0.0.1', 'vendorName=速途驰加（万达店）', '2017-05-31 14:12:32');
INSERT INTO `t_log` VALUES ('803', 'admin', '更新商家', '127.0.0.1', 'vendorName=速途驰加（夏园路店）', '2017-05-31 14:12:39');
INSERT INTO `t_log` VALUES ('804', 'admin', '更新商家', '127.0.0.1', 'vendorName=速途驰加（中铁店）', '2017-05-31 14:12:48');
INSERT INTO `t_log` VALUES ('805', 'admin', '更新商家', '127.0.0.1', 'vendorName=速途驰加（海棠路店）', '2017-05-31 14:12:55');
INSERT INTO `t_log` VALUES ('806', 'admin', '更新商家', '127.0.0.1', 'vendorName=速途驰加（万科城店）', '2017-05-31 14:13:04');
INSERT INTO `t_log` VALUES ('807', 'admin', '更新商家', '127.0.0.1', 'vendorName=速途驰加（皖江路店）', '2017-05-31 14:13:12');
INSERT INTO `t_log` VALUES ('808', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥新起点汽车服务连锁（文忠路店）', '2017-05-31 14:13:34');
INSERT INTO `t_log` VALUES ('809', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥新起点汽车服务连锁（南翔路店）', '2017-05-31 14:13:42');
INSERT INTO `t_log` VALUES ('810', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥新起点汽车服务连锁（南翔路店）', '2017-05-31 14:17:25');
INSERT INTO `t_log` VALUES ('811', 'admin', '更新商家', '127.0.0.1', 'vendorName=速途驰加（万科城店）', '2017-05-31 14:18:21');
INSERT INTO `t_log` VALUES ('812', 'admin', '更新商家', '127.0.0.1', 'vendorName=速途驰加（宋都店）', '2017-05-31 14:23:34');
INSERT INTO `t_log` VALUES ('813', 'admin', '更新商家', '127.0.0.1', 'vendorName=德国马牌休宁路店', '2017-05-31 14:24:50');
INSERT INTO `t_log` VALUES ('814', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥诚创汽车服务有限公司', '2017-05-31 14:26:13');
INSERT INTO `t_log` VALUES ('815', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-01 15:40:03');
INSERT INTO `t_log` VALUES ('816', 'admin', '新增商品', '127.0.0.1', 'productName=test01', '2017-06-01 15:42:18');
INSERT INTO `t_log` VALUES ('817', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-01 15:56:20');
INSERT INTO `t_log` VALUES ('818', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-01 16:02:45');
INSERT INTO `t_log` VALUES ('819', 'admin', '新增商品', '127.0.0.1', 'productName=test02', '2017-06-01 16:04:13');
INSERT INTO `t_log` VALUES ('820', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-01 16:23:47');
INSERT INTO `t_log` VALUES ('821', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-01 16:23:50');
INSERT INTO `t_log` VALUES ('822', 'admin', '新增商品', '127.0.0.1', 'productName=test02', '2017-06-01 16:28:48');
INSERT INTO `t_log` VALUES ('823', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-01 16:41:28');
INSERT INTO `t_log` VALUES ('824', 'admin', '编辑用户', '127.0.0.1', 'username=123', '2017-06-01 16:49:20');
INSERT INTO `t_log` VALUES ('825', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-01 17:00:01');
INSERT INTO `t_log` VALUES ('826', 'admin', '删除轮播图', '127.0.0.1', 'id=10005', '2017-06-01 17:05:51');
INSERT INTO `t_log` VALUES ('827', 'admin', '新增轮播图', '127.0.0.1', 'title=banner2', '2017-06-01 17:06:42');
INSERT INTO `t_log` VALUES ('828', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-01 17:09:18');
INSERT INTO `t_log` VALUES ('829', 'admin', '商品上/下架', '127.0.0.1', 'productId=87', '2017-06-01 17:10:01');
INSERT INTO `t_log` VALUES ('830', 'admin', '新增商品', '127.0.0.1', 'productName=test03', '2017-06-01 17:11:10');
INSERT INTO `t_log` VALUES ('831', 'admin', '更新商品', '127.0.0.1', 'productName=test03', '2017-06-01 17:23:04');
INSERT INTO `t_log` VALUES ('832', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-01 17:30:52');
INSERT INTO `t_log` VALUES ('833', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-01 17:39:39');
INSERT INTO `t_log` VALUES ('834', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-01 19:59:45');
INSERT INTO `t_log` VALUES ('835', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 09:39:52');
INSERT INTO `t_log` VALUES ('836', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 09:40:09');
INSERT INTO `t_log` VALUES ('837', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 10:13:06');
INSERT INTO `t_log` VALUES ('838', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 10:34:18');
INSERT INTO `t_log` VALUES ('839', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 10:37:27');
INSERT INTO `t_log` VALUES ('840', 'admin', '更新会员等级信息', '127.0.0.1', 'name=注册会员', '2017-06-02 10:38:25');
INSERT INTO `t_log` VALUES ('841', 'admin', '更新会员等级信息', '127.0.0.1', 'name=铜牌会员', '2017-06-02 10:39:06');
INSERT INTO `t_log` VALUES ('842', 'admin', '更新会员等级信息', '127.0.0.1', 'name=白银会员', '2017-06-02 10:40:17');
INSERT INTO `t_log` VALUES ('843', 'admin', '更新会员等级信息', '127.0.0.1', 'name=青铜会员', '2017-06-02 10:40:30');
INSERT INTO `t_log` VALUES ('844', 'admin', '更新会员等级信息', '127.0.0.1', 'name=黄金会员', '2017-06-02 10:41:20');
INSERT INTO `t_log` VALUES ('845', 'admin', '更新会员等级信息', '127.0.0.1', 'name=白银会员', '2017-06-02 10:41:27');
INSERT INTO `t_log` VALUES ('846', 'admin', '更新会员等级信息', '127.0.0.1', 'name=钻石会员', '2017-06-02 10:41:40');
INSERT INTO `t_log` VALUES ('847', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 10:49:22');
INSERT INTO `t_log` VALUES ('848', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 11:36:02');
INSERT INTO `t_log` VALUES ('849', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 11:38:29');
INSERT INTO `t_log` VALUES ('850', 'admin', '实名认证审核', '127.0.0.1', 'id=10030,state=2', '2017-06-02 11:39:19');
INSERT INTO `t_log` VALUES ('851', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 13:03:08');
INSERT INTO `t_log` VALUES ('852', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥诚创汽车服务有限公司', '2017-06-02 13:09:51');
INSERT INTO `t_log` VALUES ('853', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 13:14:20');
INSERT INTO `t_log` VALUES ('854', 'admin', '编辑用户', '127.0.0.1', 'username=12', '2017-06-02 13:14:58');
INSERT INTO `t_log` VALUES ('855', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 13:44:46');
INSERT INTO `t_log` VALUES ('856', 'admin', '更新商家', '127.0.0.1', 'vendorName=好亮杰汽车服务有限公司', '2017-06-02 13:45:03');
INSERT INTO `t_log` VALUES ('857', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥聚鑫欣汽车服务有限公司（一）', '2017-06-02 13:45:42');
INSERT INTO `t_log` VALUES ('858', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥聚鑫欣汽车服务有限公司（二）', '2017-06-02 13:46:26');
INSERT INTO `t_log` VALUES ('859', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 13:47:05');
INSERT INTO `t_log` VALUES ('860', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥聚鑫欣汽车服务有限公司（三）', '2017-06-02 13:47:05');
INSERT INTO `t_log` VALUES ('861', 'admin', '更新商家', '127.0.0.1', 'vendorName=德国马牌休宁路店', '2017-06-02 13:47:42');
INSERT INTO `t_log` VALUES ('862', 'admin', '编辑用户', '127.0.0.1', 'username=qweqweq', '2017-06-02 13:47:59');
INSERT INTO `t_log` VALUES ('863', 'admin', '更新商家', '127.0.0.1', 'vendorName=百世德笔架山路旗舰店', '2017-06-02 13:52:57');
INSERT INTO `t_log` VALUES ('864', 'admin', '更新商家', '127.0.0.1', 'vendorName=百世德石笋路旗舰店', '2017-06-02 13:53:39');
INSERT INTO `t_log` VALUES ('865', 'admin', '更新商家', '127.0.0.1', 'vendorName=德国马牌宝塔路聚茂店', '2017-06-02 13:54:19');
INSERT INTO `t_log` VALUES ('866', 'admin', '更新商家', '127.0.0.1', 'vendorName=速途驰加（宋都店）', '2017-06-02 13:54:53');
INSERT INTO `t_log` VALUES ('867', 'admin', '更新商家', '127.0.0.1', 'vendorName=速途驰加（万达店）', '2017-06-02 13:55:18');
INSERT INTO `t_log` VALUES ('868', 'admin', '更新商家', '127.0.0.1', 'vendorName=速途驰加（夏园路店）', '2017-06-02 13:55:37');
INSERT INTO `t_log` VALUES ('869', 'admin', '更新商家', '127.0.0.1', 'vendorName=速途驰加（中铁店）', '2017-06-02 13:56:04');
INSERT INTO `t_log` VALUES ('870', 'admin', '更新商家', '127.0.0.1', 'vendorName=速途驰加（海棠路店）', '2017-06-02 13:56:42');
INSERT INTO `t_log` VALUES ('871', 'admin', '更新商家', '127.0.0.1', 'vendorName=速途驰加（万科城店）', '2017-06-02 13:57:05');
INSERT INTO `t_log` VALUES ('872', 'admin', '更新商家', '127.0.0.1', 'vendorName=速途驰加（皖江路店）', '2017-06-02 13:57:38');
INSERT INTO `t_log` VALUES ('873', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥新起点汽车服务连锁（文忠路店）', '2017-06-02 13:58:15');
INSERT INTO `t_log` VALUES ('874', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥新起点汽车服务连锁（南翔路店）', '2017-06-02 13:58:41');
INSERT INTO `t_log` VALUES ('875', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 14:34:31');
INSERT INTO `t_log` VALUES ('876', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥诚创汽车服务有限公司', '2017-06-02 14:35:10');
INSERT INTO `t_log` VALUES ('877', 'admin', '更新商家', '127.0.0.1', 'vendorName=测试地址', '2017-06-02 14:35:39');
INSERT INTO `t_log` VALUES ('878', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥诚创汽车服务有限公司', '2017-06-02 14:36:00');
INSERT INTO `t_log` VALUES ('879', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 14:56:55');
INSERT INTO `t_log` VALUES ('880', 'admin', '新增商家', '127.0.0.1', 'vendorName=安徽省去扑网络科技有限公司', '2017-06-02 15:00:41');
INSERT INTO `t_log` VALUES ('881', 'admin', '新增商品', '127.0.0.1', 'productName=大牌爆款眼镜太阳镜', '2017-06-02 15:04:39');
INSERT INTO `t_log` VALUES ('882', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 16:03:08');
INSERT INTO `t_log` VALUES ('883', 'admin', '实名认证审核', '127.0.0.1', 'id=10055,state=1', '2017-06-02 16:03:26');
INSERT INTO `t_log` VALUES ('884', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 16:15:19');
INSERT INTO `t_log` VALUES ('885', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 16:16:46');
INSERT INTO `t_log` VALUES ('886', 'admin', '更新商品', '127.0.0.1', 'productName=汽车精洗', '2017-06-02 16:19:21');
INSERT INTO `t_log` VALUES ('887', 'admin', '更新商品', '127.0.0.1', 'productName=汽车精洗', '2017-06-02 16:21:14');
INSERT INTO `t_log` VALUES ('888', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥聚鑫欣汽车服务有限公司（三）', '2017-06-02 16:23:47');
INSERT INTO `t_log` VALUES ('889', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥聚鑫欣汽车服务有限公司（二）', '2017-06-02 16:24:26');
INSERT INTO `t_log` VALUES ('890', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥聚鑫欣汽车服务有限公司（二）', '2017-06-02 16:26:18');
INSERT INTO `t_log` VALUES ('891', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥聚鑫欣汽车服务有限公司（三）', '2017-06-02 16:26:29');
INSERT INTO `t_log` VALUES ('892', 'admin', '新增商品', '127.0.0.1', 'productName=test04', '2017-06-02 16:33:22');
INSERT INTO `t_log` VALUES ('893', 'admin', '更新商家', '127.0.0.1', 'vendorName=测试地址', '2017-06-02 16:35:44');
INSERT INTO `t_log` VALUES ('894', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 16:57:54');
INSERT INTO `t_log` VALUES ('895', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 17:18:44');
INSERT INTO `t_log` VALUES ('896', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 17:39:45');
INSERT INTO `t_log` VALUES ('897', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-02 17:58:18');
INSERT INTO `t_log` VALUES ('898', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-03 10:26:37');
INSERT INTO `t_log` VALUES ('899', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-03 11:02:11');
INSERT INTO `t_log` VALUES ('900', 'admin', '新增商品', '127.0.0.1', 'productName=test-01', '2017-06-03 11:03:13');
INSERT INTO `t_log` VALUES ('901', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-03 11:07:06');
INSERT INTO `t_log` VALUES ('902', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-03 11:23:25');
INSERT INTO `t_log` VALUES ('903', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-03 11:35:19');
INSERT INTO `t_log` VALUES ('904', 'admin', '新增商品', '127.0.0.1', 'productName=test03', '2017-06-03 11:36:41');
INSERT INTO `t_log` VALUES ('905', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-03 11:43:04');
INSERT INTO `t_log` VALUES ('906', 'admin', '新增商品', '127.0.0.1', 'productName=空调清洗', '2017-06-03 11:45:54');
INSERT INTO `t_log` VALUES ('907', 'admin', '新增商品', '127.0.0.1', 'productName=100元会员卡代金券（仅适用于600元档会员卡）', '2017-06-03 11:49:53');
INSERT INTO `t_log` VALUES ('908', 'admin', '新增商品', '127.0.0.1', 'productName=150元会员卡代金券（仅适用于1100元档会员卡）', '2017-06-03 11:51:26');
INSERT INTO `t_log` VALUES ('909', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-03 13:09:20');
INSERT INTO `t_log` VALUES ('910', 'admin', '新增商品', '127.0.0.1', 'productName=200元会员卡代金券（仅适用于2200元档会员卡）', '2017-06-03 13:10:42');
INSERT INTO `t_log` VALUES ('911', 'admin', '新增商品', '127.0.0.1', 'productName=300元会员卡代金券（仅适用于5300元档会员卡）', '2017-06-03 13:11:59');
INSERT INTO `t_log` VALUES ('912', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-03 13:14:20');
INSERT INTO `t_log` VALUES ('913', 'admin', '新增商品', '127.0.0.1', 'productName=汽车精洗', '2017-06-03 13:15:32');
INSERT INTO `t_log` VALUES ('914', 'admin', '新增商品', '127.0.0.1', 'productName=汽车打蜡', '2017-06-03 13:17:06');
INSERT INTO `t_log` VALUES ('915', 'admin', '新增商品', '127.0.0.1', 'productName=单次镀晶', '2017-06-03 13:18:46');
INSERT INTO `t_log` VALUES ('916', 'admin', '新增商品', '127.0.0.1', 'productName=全年镀晶', '2017-06-03 13:19:45');
INSERT INTO `t_log` VALUES ('917', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-03 13:21:36');
INSERT INTO `t_log` VALUES ('918', 'admin', '新增商品', '127.0.0.1', 'productName=汽车精洗', '2017-06-03 13:22:46');
INSERT INTO `t_log` VALUES ('919', 'admin', '新增商品', '127.0.0.1', 'productName=汽车打蜡', '2017-06-03 13:23:48');
INSERT INTO `t_log` VALUES ('920', 'admin', '新增商品', '127.0.0.1', 'productName=单次镀晶', '2017-06-03 13:24:56');
INSERT INTO `t_log` VALUES ('921', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥聚鑫欣汽车服务有限公司（二）', '2017-06-03 13:25:58');
INSERT INTO `t_log` VALUES ('922', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥聚鑫欣汽车服务有限公司（三）', '2017-06-03 13:26:13');
INSERT INTO `t_log` VALUES ('923', 'admin', '新增商品', '127.0.0.1', 'productName=单次镀晶', '2017-06-03 13:29:23');
INSERT INTO `t_log` VALUES ('924', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-03 13:30:13');
INSERT INTO `t_log` VALUES ('925', 'admin', '新增商品', '127.0.0.1', 'productName=汽车精洗', '2017-06-03 13:31:26');
INSERT INTO `t_log` VALUES ('926', 'admin', '新增商品', '127.0.0.1', 'productName=汽车打蜡', '2017-06-03 13:33:36');
INSERT INTO `t_log` VALUES ('927', 'admin', '新增商品', '127.0.0.1', 'productName=单次镀晶', '2017-06-03 13:35:54');
INSERT INTO `t_log` VALUES ('928', 'admin', '新增商品', '127.0.0.1', 'productName=全年镀晶', '2017-06-03 13:38:00');
INSERT INTO `t_log` VALUES ('929', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-03 13:45:38');
INSERT INTO `t_log` VALUES ('930', 'admin', '新增商品', '127.0.0.1', 'productName=汽车精洗', '2017-06-03 13:46:28');
INSERT INTO `t_log` VALUES ('931', 'admin', '新增商品', '127.0.0.1', 'productName=汽车打蜡', '2017-06-03 13:47:24');
INSERT INTO `t_log` VALUES ('932', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-03 13:48:34');
INSERT INTO `t_log` VALUES ('933', 'admin', '新增商品', '127.0.0.1', 'productName=汽车精洗', '2017-06-03 13:49:25');
INSERT INTO `t_log` VALUES ('934', 'admin', '新增商品', '127.0.0.1', 'productName=汽车打蜡', '2017-06-03 13:50:24');
INSERT INTO `t_log` VALUES ('935', 'admin', '新增商品', '127.0.0.1', 'productName=单次镀晶', '2017-06-03 13:51:12');
INSERT INTO `t_log` VALUES ('936', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-03 13:52:18');
INSERT INTO `t_log` VALUES ('937', 'admin', '新增商品', '127.0.0.1', 'productName=汽车精洗', '2017-06-03 13:58:40');
INSERT INTO `t_log` VALUES ('938', 'admin', '新增商品', '127.0.0.1', 'productName=汽车打蜡', '2017-06-03 14:00:11');
INSERT INTO `t_log` VALUES ('939', 'admin', '新增商品', '127.0.0.1', 'productName=单次镀晶', '2017-06-03 14:00:59');
INSERT INTO `t_log` VALUES ('940', 'admin', '新增商品', '127.0.0.1', 'productName=全年镀晶', '2017-06-03 14:02:09');
INSERT INTO `t_log` VALUES ('941', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-03 14:03:01');
INSERT INTO `t_log` VALUES ('942', 'admin', '新增商品', '127.0.0.1', 'productName=汽车精洗', '2017-06-03 14:03:41');
INSERT INTO `t_log` VALUES ('943', 'admin', '新增商品', '127.0.0.1', 'productName=汽车打蜡', '2017-06-03 14:04:28');
INSERT INTO `t_log` VALUES ('944', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-03 14:27:11');
INSERT INTO `t_log` VALUES ('945', 'admin', '新增商品', '127.0.0.1', 'productName=四轮充氮', '2017-06-03 14:28:10');
INSERT INTO `t_log` VALUES ('946', 'admin', '新增商品', '127.0.0.1', 'productName=四轮定位', '2017-06-03 14:28:56');
INSERT INTO `t_log` VALUES ('947', 'admin', '新增商品', '127.0.0.1', 'productName=刹车系统养护', '2017-06-03 14:29:49');
INSERT INTO `t_log` VALUES ('948', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-03 14:30:48');
INSERT INTO `t_log` VALUES ('949', 'admin', '新增商品', '127.0.0.1', 'productName=四轮充氮', '2017-06-03 14:31:47');
INSERT INTO `t_log` VALUES ('950', 'admin', '新增商品', '127.0.0.1', 'productName=四轮定位', '2017-06-03 14:33:00');
INSERT INTO `t_log` VALUES ('951', 'admin', '新增商品', '127.0.0.1', 'productName=刹车系统养护', '2017-06-03 14:33:46');
INSERT INTO `t_log` VALUES ('952', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-03 14:36:05');
INSERT INTO `t_log` VALUES ('953', 'admin', '更新商品', '127.0.0.1', 'productName=test03', '2017-06-03 14:36:21');
INSERT INTO `t_log` VALUES ('954', 'admin', '新增商品', '127.0.0.1', 'productName=test02', '2017-06-03 14:37:35');
INSERT INTO `t_log` VALUES ('955', 'admin', '更新商品', '127.0.0.1', 'productName=test02', '2017-06-03 14:42:50');
INSERT INTO `t_log` VALUES ('956', 'admin', '更新商品', '127.0.0.1', 'productName=test02', '2017-06-03 14:43:27');
INSERT INTO `t_log` VALUES ('957', 'admin', '商品上/下架', '127.0.0.1', 'productId=137', '2017-06-03 14:44:04');
INSERT INTO `t_log` VALUES ('958', 'admin', '商品上/下架', '127.0.0.1', 'productId=137', '2017-06-03 14:44:08');
INSERT INTO `t_log` VALUES ('959', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-03 15:20:24');
INSERT INTO `t_log` VALUES ('960', 'admin', '新增商品', '127.0.0.1', 'productName=test04', '2017-06-03 15:22:00');
INSERT INTO `t_log` VALUES ('961', 'admin', '新增商品', '127.0.0.1', 'productName=test05', '2017-06-03 15:36:25');
INSERT INTO `t_log` VALUES ('962', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-03 15:44:33');
INSERT INTO `t_log` VALUES ('963', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-03 15:45:28');
INSERT INTO `t_log` VALUES ('964', 'admin', '新增商品', '127.0.0.1', 'productName=四轮充氮', '2017-06-03 15:46:17');
INSERT INTO `t_log` VALUES ('965', 'admin', '新增商品', '127.0.0.1', 'productName=四轮定位', '2017-06-03 15:47:08');
INSERT INTO `t_log` VALUES ('966', 'admin', '新增商品', '127.0.0.1', 'productName=刹车系统养护', '2017-06-03 15:59:51');
INSERT INTO `t_log` VALUES ('967', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-03 16:00:43');
INSERT INTO `t_log` VALUES ('968', 'admin', '新增商品', '127.0.0.1', 'productName=四轮充氮', '2017-06-03 16:02:14');
INSERT INTO `t_log` VALUES ('969', 'admin', '新增商品', '127.0.0.1', 'productName=四轮定位', '2017-06-03 16:03:11');
INSERT INTO `t_log` VALUES ('970', 'admin', '新增商品', '127.0.0.1', 'productName=刹车系统养护', '2017-06-03 16:03:59');
INSERT INTO `t_log` VALUES ('971', 'admin', '新增商品', '127.0.0.1', 'productName=汽车镀膜', '2017-06-03 16:06:59');
INSERT INTO `t_log` VALUES ('972', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-03 16:08:26');
INSERT INTO `t_log` VALUES ('973', 'admin', '新增商品', '127.0.0.1', 'productName=四轮充氮', '2017-06-03 16:09:18');
INSERT INTO `t_log` VALUES ('974', 'admin', '新增商品', '127.0.0.1', 'productName=四轮定位', '2017-06-03 16:10:04');
INSERT INTO `t_log` VALUES ('975', 'admin', '新增商品', '127.0.0.1', 'productName=刹车系统养护', '2017-06-03 16:10:41');
INSERT INTO `t_log` VALUES ('976', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-03 16:11:28');
INSERT INTO `t_log` VALUES ('977', 'admin', '新增商品', '127.0.0.1', 'productName=四轮充氮', '2017-06-03 16:12:19');
INSERT INTO `t_log` VALUES ('978', 'admin', '新增商品', '127.0.0.1', 'productName=四轮定位', '2017-06-03 16:13:11');
INSERT INTO `t_log` VALUES ('979', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-03 16:14:06');
INSERT INTO `t_log` VALUES ('980', 'admin', '新增商品', '127.0.0.1', 'productName=四轮充氮', '2017-06-03 16:14:59');
INSERT INTO `t_log` VALUES ('981', 'admin', '新增商品', '127.0.0.1', 'productName=四轮定位', '2017-06-03 16:15:38');
INSERT INTO `t_log` VALUES ('982', 'admin', '新增商品', '127.0.0.1', 'productName=免擦拭无划痕洗车', '2017-06-03 16:17:31');
INSERT INTO `t_log` VALUES ('983', 'admin', '新增商品', '127.0.0.1', 'productName=套餐A（精致内饰清洗、漆面去渍增光养护、发动机精洗镀膜、车内香薰、轮毂清洗除锈）', '2017-06-03 16:19:05');
INSERT INTO `t_log` VALUES ('984', 'admin', '新增商品', '127.0.0.1', 'productName=套餐B（发动机进气系统清洗、发动机燃烧室清洗、发动机喷油嘴清洗、发动机三元催化清洗。', '2017-06-03 16:20:33');
INSERT INTO `t_log` VALUES ('985', 'admin', '新增商品', '127.0.0.1', 'productName=免擦拭无划痕洗车', '2017-06-03 16:21:44');
INSERT INTO `t_log` VALUES ('986', 'admin', '新增商品', '127.0.0.1', 'productName=套餐A（精致内饰清洗、漆面去渍增光养护、发动机精洗镀膜、车内香薰、轮毂清洗除锈）', '2017-06-03 16:22:42');
INSERT INTO `t_log` VALUES ('987', 'admin', '新增商品', '127.0.0.1', 'productName=498元套餐（发动机进气系统清洗、发动机燃烧室清洗、发动机喷油嘴清洗、发动机三元催化清洗。', '2017-06-03 16:23:35');
INSERT INTO `t_log` VALUES ('988', 'admin', '更新商品', '127.0.0.1', 'productName=套餐B（发动机进气系统清洗、发动机燃烧室清洗、发动机喷油嘴清洗、发动机三元催化清洗。', '2017-06-03 16:23:52');
INSERT INTO `t_log` VALUES ('989', 'admin', '更新商品', '127.0.0.1', 'productName=套餐B（发动机进气系统清洗、发动机燃烧室清洗、发动机喷油嘴清洗、发动机三元催化清洗）', '2017-06-03 16:24:07');
INSERT INTO `t_log` VALUES ('990', 'admin', '新增商品', '127.0.0.1', 'productName=爆款眼镜', '2017-06-03 16:25:49');
INSERT INTO `t_log` VALUES ('991', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-04 10:35:33');
INSERT INTO `t_log` VALUES ('992', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-05 15:25:07');
INSERT INTO `t_log` VALUES ('993', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-06 09:10:12');
INSERT INTO `t_log` VALUES ('994', 'admin', '商品上/下架', '127.0.0.1', 'productId=139', '2017-06-06 09:10:26');
INSERT INTO `t_log` VALUES ('995', 'admin', '商品上/下架', '127.0.0.1', 'productId=138', '2017-06-06 09:10:30');
INSERT INTO `t_log` VALUES ('996', 'admin', '商品上/下架', '127.0.0.1', 'productId=137', '2017-06-06 09:10:34');
INSERT INTO `t_log` VALUES ('997', 'admin', '商品上/下架', '127.0.0.1', 'productId=93', '2017-06-06 09:10:55');
INSERT INTO `t_log` VALUES ('998', 'admin', '商品上/下架', '127.0.0.1', 'productId=92', '2017-06-06 09:10:59');
INSERT INTO `t_log` VALUES ('999', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-06 09:40:51');
INSERT INTO `t_log` VALUES ('1000', 'admin', '新增商品', '127.0.0.1', 'productName=test06', '2017-06-06 09:42:04');
INSERT INTO `t_log` VALUES ('1001', 'admin', '商品上/下架', '127.0.0.1', 'productId=166', '2017-06-06 09:46:42');
INSERT INTO `t_log` VALUES ('1002', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-06 09:57:34');
INSERT INTO `t_log` VALUES ('1003', 'superadmin', '管理员登录', '127.0.0.1', 'username=superadmin', '2017-06-06 10:06:01');
INSERT INTO `t_log` VALUES ('1004', 'admin', '更新管理员', '127.0.0.1', 'username=gaomin', '2017-06-06 10:09:41');
INSERT INTO `t_log` VALUES ('1005', 'gaomin', '管理员登录', '127.0.0.1', 'username=gaomin', '2017-06-06 10:09:55');
INSERT INTO `t_log` VALUES ('1006', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-06 10:10:09');
INSERT INTO `t_log` VALUES ('1007', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-06 10:12:48');
INSERT INTO `t_log` VALUES ('1008', 'superadmin', '管理员登录', '127.0.0.1', 'username=superadmin', '2017-06-06 10:59:22');
INSERT INTO `t_log` VALUES ('1009', 'superadmin', '管理员登录', '127.0.0.1', 'username=superadmin', '2017-06-06 11:12:00');
INSERT INTO `t_log` VALUES ('1010', 'superadmin', '管理员登录', '127.0.0.1', 'username=superadmin', '2017-06-06 11:13:27');
INSERT INTO `t_log` VALUES ('1011', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-06 11:27:58');
INSERT INTO `t_log` VALUES ('1012', 'superadmin', '管理员登录', '127.0.0.1', 'username=superadmin', '2017-06-06 11:29:19');
INSERT INTO `t_log` VALUES ('1013', 'admin', '新增商家', '127.0.0.1', 'vendorName=大拇指汽车养护', '2017-06-06 11:33:27');
INSERT INTO `t_log` VALUES ('1014', 'superadmin', '更新管理员', '127.0.0.1', 'username=gaomin', '2017-06-06 11:35:30');
INSERT INTO `t_log` VALUES ('1015', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-06 11:37:13');
INSERT INTO `t_log` VALUES ('1016', 'admin', '更新商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-06 11:38:00');
INSERT INTO `t_log` VALUES ('1017', 'admin', '更新商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-06 11:38:15');
INSERT INTO `t_log` VALUES ('1018', 'admin', '更新商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-06 11:38:30');
INSERT INTO `t_log` VALUES ('1019', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-06 11:38:57');
INSERT INTO `t_log` VALUES ('1020', 'admin', '更新商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-06 11:39:00');
INSERT INTO `t_log` VALUES ('1021', 'admin', '更新商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-06 11:39:09');
INSERT INTO `t_log` VALUES ('1022', 'admin', '更新商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-06 11:39:32');
INSERT INTO `t_log` VALUES ('1023', 'admin', '更新商品', '127.0.0.1', 'productName=test06', '2017-06-06 11:39:54');
INSERT INTO `t_log` VALUES ('1024', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-06 12:13:00');
INSERT INTO `t_log` VALUES ('1025', 'admin', '更新商品', '127.0.0.1', 'productName=test06', '2017-06-06 12:13:38');
INSERT INTO `t_log` VALUES ('1026', 'admin', '更新商品', '127.0.0.1', 'productName=test06', '2017-06-06 12:22:13');
INSERT INTO `t_log` VALUES ('1027', 'superadmin', '管理员登录', '127.0.0.1', 'username=superadmin', '2017-06-06 14:31:15');
INSERT INTO `t_log` VALUES ('1028', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-06 14:36:49');
INSERT INTO `t_log` VALUES ('1029', 'admin', '更新商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-06 14:37:11');
INSERT INTO `t_log` VALUES ('1030', 'admin', '更新商家', '127.0.0.1', 'vendorName=大拇指汽车养护', '2017-06-06 14:38:33');
INSERT INTO `t_log` VALUES ('1031', 'admin', '新增商品', '127.0.0.1', 'productName=汽车打蜡', '2017-06-06 14:41:04');
INSERT INTO `t_log` VALUES ('1032', 'admin', '新增商品', '127.0.0.1', 'productName=汽车镀膜', '2017-06-06 14:57:16');
INSERT INTO `t_log` VALUES ('1033', 'admin', '新增商品', '127.0.0.1', 'productName=单次镀晶', '2017-06-06 14:59:40');
INSERT INTO `t_log` VALUES ('1034', 'admin', '新增商品', '127.0.0.1', 'productName=四轮定位', '2017-06-06 15:02:18');
INSERT INTO `t_log` VALUES ('1035', 'admin', '新增商品', '127.0.0.1', 'productName=抛光打蜡', '2017-06-06 15:03:43');
INSERT INTO `t_log` VALUES ('1036', 'admin', '新增商品', '127.0.0.1', 'productName=单面做漆', '2017-06-06 15:05:02');
INSERT INTO `t_log` VALUES ('1037', 'admin', '新增商家', '127.0.0.1', 'vendorName=合肥焕然一新汽车服务有限公司（一）', '2017-06-06 15:11:29');
INSERT INTO `t_log` VALUES ('1038', 'admin', '新增商家', '127.0.0.1', 'vendorName=合肥焕然一新汽车服务有限公司（二）', '2017-06-06 15:15:15');
INSERT INTO `t_log` VALUES ('1039', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥焕然一新汽车服务有限公司（一）', '2017-06-06 15:22:38');
INSERT INTO `t_log` VALUES ('1040', 'admin', '更新商家', '127.0.0.1', 'vendorName=合肥焕然一新汽车服务有限公司（二）', '2017-06-06 15:22:45');
INSERT INTO `t_log` VALUES ('1041', 'superadmin', '管理员登录', '127.0.0.1', 'username=superadmin', '2017-06-06 16:18:47');
INSERT INTO `t_log` VALUES ('1042', 'superadmin', '授权组', '127.0.0.1', 'roleId=10002', '2017-06-06 16:21:21');
INSERT INTO `t_log` VALUES ('1043', 'gaomin', '管理员登录', '127.0.0.1', 'username=gaomin', '2017-06-06 16:21:57');
INSERT INTO `t_log` VALUES ('1044', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-06 16:31:16');
INSERT INTO `t_log` VALUES ('1045', 'superadmin', '管理员登录', '127.0.0.1', 'username=superadmin', '2017-06-06 16:52:02');
INSERT INTO `t_log` VALUES ('1046', 'superadmin', '授权组', '127.0.0.1', 'roleId=10003', '2017-06-06 16:55:07');
INSERT INTO `t_log` VALUES ('1047', 'superadmin', '编辑组', '127.0.0.1', 'roleName=姚飞飞', '2017-06-06 16:55:28');
INSERT INTO `t_log` VALUES ('1048', 'superadmin', '编辑组', '127.0.0.1', 'roleName=高敏', '2017-06-06 16:55:42');
INSERT INTO `t_log` VALUES ('1049', 'superadmin', '编辑组', '127.0.0.1', 'roleName=姚飞飞', '2017-06-06 16:55:52');
INSERT INTO `t_log` VALUES ('1050', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-06-07 09:18:20');
INSERT INTO `t_log` VALUES ('1051', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-07 09:30:38');
INSERT INTO `t_log` VALUES ('1052', 'admin', '新增商品', '127.0.0.1', 'productName=汽车精洗', '2017-06-07 09:31:36');
INSERT INTO `t_log` VALUES ('1053', 'admin', '新增商品', '127.0.0.1', 'productName=汽车打蜡', '2017-06-07 09:32:30');
INSERT INTO `t_log` VALUES ('1054', 'admin', '新增商品', '127.0.0.1', 'productName=单次镀晶', '2017-06-07 09:34:22');
INSERT INTO `t_log` VALUES ('1055', 'admin', '新增商品', '127.0.0.1', 'productName=四轮定位', '2017-06-07 09:36:02');
INSERT INTO `t_log` VALUES ('1056', 'admin', '新增商品', '127.0.0.1', 'productName=汽车普洗', '2017-06-07 09:43:13');
INSERT INTO `t_log` VALUES ('1057', 'admin', '新增商品', '127.0.0.1', 'productName=汽车精洗', '2017-06-07 09:53:59');
INSERT INTO `t_log` VALUES ('1058', 'admin', '新增商品', '127.0.0.1', 'productName=汽车打蜡', '2017-06-07 09:56:09');
INSERT INTO `t_log` VALUES ('1059', 'admin', '新增商品', '127.0.0.1', 'productName=单次镀晶', '2017-06-07 09:57:49');
INSERT INTO `t_log` VALUES ('1060', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-06-29 14:14:03');
INSERT INTO `t_log` VALUES ('1061', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-06-30 09:13:05');
INSERT INTO `t_log` VALUES ('1062', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-06-30 10:24:28');
INSERT INTO `t_log` VALUES ('1063', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-06-30 11:00:45');
INSERT INTO `t_log` VALUES ('1064', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-03 09:08:14');
INSERT INTO `t_log` VALUES ('1065', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-03 09:08:36');
INSERT INTO `t_log` VALUES ('1066', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-03 15:27:26');
INSERT INTO `t_log` VALUES ('1067', 'admin', '管理员登录', '192.168.0.149', 'username=admin', '2017-07-03 15:32:18');
INSERT INTO `t_log` VALUES ('1068', 'admin', '编辑用户', '192.168.0.149', 'username=1231231231', '2017-07-03 15:32:49');
INSERT INTO `t_log` VALUES ('1069', 'admin', '管理员登录', '192.168.0.149', 'username=admin', '2017-07-03 15:49:47');
INSERT INTO `t_log` VALUES ('1070', 'admin', '编辑用户', '192.168.0.149', 'username=56ijhgftyu', '2017-07-03 15:50:11');
INSERT INTO `t_log` VALUES ('1071', 'admin', '编辑用户', '192.168.0.149', 'username=bqvb', '2017-07-03 15:51:32');
INSERT INTO `t_log` VALUES ('1072', 'admin', '编辑用户', '192.168.0.149', 'username=fghjk', '2017-07-03 15:53:44');
INSERT INTO `t_log` VALUES ('1073', 'admin', '管理员登录', '192.168.0.149', 'username=admin', '2017-07-03 16:02:10');
INSERT INTO `t_log` VALUES ('1074', 'admin', '编辑用户', '192.168.0.149', 'username=4rtghj', '2017-07-03 16:02:32');
INSERT INTO `t_log` VALUES ('1075', 'admin', '管理员登录', '192.168.0.149', 'username=admin', '2017-07-03 17:07:31');
INSERT INTO `t_log` VALUES ('1076', 'admin', '实名认证审核', '192.168.0.149', 'id=10072,state=1', '2017-07-03 17:08:01');
INSERT INTO `t_log` VALUES ('1077', 'admin', '管理员登录', '192.168.0.149', 'username=admin', '2017-07-03 17:26:24');
INSERT INTO `t_log` VALUES ('1078', 'admin', '管理员登录', '192.168.0.149', 'username=admin', '2017-07-03 17:29:17');
INSERT INTO `t_log` VALUES ('1079', 'admin', '编辑用户', '192.168.0.149', 'username=4rtyhjk', '2017-07-03 17:29:36');
INSERT INTO `t_log` VALUES ('1080', 'admin', '实名认证审核', '192.168.0.149', 'id=10074,state=1', '2017-07-03 17:31:33');
INSERT INTO `t_log` VALUES ('1081', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-03 18:22:56');
INSERT INTO `t_log` VALUES ('1082', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=单次镀晶', '2017-07-03 18:24:08');
INSERT INTO `t_log` VALUES ('1083', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=汽车打蜡', '2017-07-03 18:25:16');
INSERT INTO `t_log` VALUES ('1084', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=汽车打蜡', '2017-07-03 18:25:33');
INSERT INTO `t_log` VALUES ('1085', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 08:56:18');
INSERT INTO `t_log` VALUES ('1086', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 13:37:37');
INSERT INTO `t_log` VALUES ('1087', 'admin', '商品上/下架', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-04 13:46:26');
INSERT INTO `t_log` VALUES ('1088', 'admin', '商品上/下架', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-04 13:51:18');
INSERT INTO `t_log` VALUES ('1089', 'admin', '商品上/下架', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-04 14:06:39');
INSERT INTO `t_log` VALUES ('1090', 'admin', '商品上/下架', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-04 14:07:46');
INSERT INTO `t_log` VALUES ('1091', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 14:12:05');
INSERT INTO `t_log` VALUES ('1092', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 14:46:16');
INSERT INTO `t_log` VALUES ('1093', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 15:12:04');
INSERT INTO `t_log` VALUES ('1094', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 15:16:15');
INSERT INTO `t_log` VALUES ('1095', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 15:29:08');
INSERT INTO `t_log` VALUES ('1096', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 15:54:33');
INSERT INTO `t_log` VALUES ('1097', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 15:56:24');
INSERT INTO `t_log` VALUES ('1098', 'admin', '商品上/下架', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-04 15:57:07');
INSERT INTO `t_log` VALUES ('1099', 'admin', '商品上/下架', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-04 15:59:43');
INSERT INTO `t_log` VALUES ('1100', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 16:00:10');
INSERT INTO `t_log` VALUES ('1101', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 16:09:03');
INSERT INTO `t_log` VALUES ('1102', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 16:30:34');
INSERT INTO `t_log` VALUES ('1103', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 16:31:24');
INSERT INTO `t_log` VALUES ('1104', 'admin', '商品上/下架', '0:0:0:0:0:0:0:1', 'productId=181', '2017-07-04 16:31:59');
INSERT INTO `t_log` VALUES ('1105', 'admin', '商品上/下架', '0:0:0:0:0:0:0:1', 'productId=181', '2017-07-04 16:35:00');
INSERT INTO `t_log` VALUES ('1106', 'admin', '商品上/下架', '0:0:0:0:0:0:0:1', 'productId=181', '2017-07-04 16:39:26');
INSERT INTO `t_log` VALUES ('1107', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 16:43:01');
INSERT INTO `t_log` VALUES ('1108', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 16:45:22');
INSERT INTO `t_log` VALUES ('1109', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 16:51:48');
INSERT INTO `t_log` VALUES ('1110', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 16:52:29');
INSERT INTO `t_log` VALUES ('1111', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 16:55:24');
INSERT INTO `t_log` VALUES ('1112', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 16:55:52');
INSERT INTO `t_log` VALUES ('1113', 'admin', '授权组', '0:0:0:0:0:0:0:1', 'roleId=10000', '2017-07-04 16:57:21');
INSERT INTO `t_log` VALUES ('1114', 'admin', '授权组', '0:0:0:0:0:0:0:1', 'roleId=10001', '2017-07-04 16:57:32');
INSERT INTO `t_log` VALUES ('1115', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-04 16:57:43');
INSERT INTO `t_log` VALUES ('1116', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=181', '2017-07-04 16:57:50');
INSERT INTO `t_log` VALUES ('1117', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-04 16:58:52');
INSERT INTO `t_log` VALUES ('1118', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 16:59:40');
INSERT INTO `t_log` VALUES ('1119', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-04 16:59:50');
INSERT INTO `t_log` VALUES ('1120', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-04 16:59:57');
INSERT INTO `t_log` VALUES ('1121', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 17:01:50');
INSERT INTO `t_log` VALUES ('1122', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-04 17:02:04');
INSERT INTO `t_log` VALUES ('1123', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-04 17:02:15');
INSERT INTO `t_log` VALUES ('1124', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 17:03:53');
INSERT INTO `t_log` VALUES ('1125', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-04 17:04:03');
INSERT INTO `t_log` VALUES ('1126', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 17:05:01');
INSERT INTO `t_log` VALUES ('1127', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-04 17:05:10');
INSERT INTO `t_log` VALUES ('1128', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=180', '2017-07-04 17:05:15');
INSERT INTO `t_log` VALUES ('1129', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=137', '2017-07-04 17:05:25');
INSERT INTO `t_log` VALUES ('1130', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 17:19:41');
INSERT INTO `t_log` VALUES ('1131', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=165', '2017-07-04 17:19:57');
INSERT INTO `t_log` VALUES ('1132', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=168', '2017-07-04 17:20:25');
INSERT INTO `t_log` VALUES ('1133', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=165', '2017-07-04 17:20:40');
INSERT INTO `t_log` VALUES ('1134', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-04 17:48:05');
INSERT INTO `t_log` VALUES ('1135', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-04 17:50:13');
INSERT INTO `t_log` VALUES ('1136', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-04 17:50:19');
INSERT INTO `t_log` VALUES ('1137', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=178', '2017-07-04 17:50:32');
INSERT INTO `t_log` VALUES ('1138', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 08:30:15');
INSERT INTO `t_log` VALUES ('1139', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 08:40:08');
INSERT INTO `t_log` VALUES ('1140', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-05 08:40:16');
INSERT INTO `t_log` VALUES ('1141', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-05 08:40:20');
INSERT INTO `t_log` VALUES ('1142', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 10:21:16');
INSERT INTO `t_log` VALUES ('1143', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 13:30:31');
INSERT INTO `t_log` VALUES ('1144', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 13:32:50');
INSERT INTO `t_log` VALUES ('1145', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 13:39:07');
INSERT INTO `t_log` VALUES ('1146', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 13:44:42');
INSERT INTO `t_log` VALUES ('1147', 'admin', '实名认证审核', '0:0:0:0:0:0:0:1', 'id=10056,state=1', '2017-07-05 13:47:27');
INSERT INTO `t_log` VALUES ('1148', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 13:48:01');
INSERT INTO `t_log` VALUES ('1149', 'admin', '实名认证审核', '0:0:0:0:0:0:0:1', 'id=10074,state=1', '2017-07-05 13:50:35');
INSERT INTO `t_log` VALUES ('1150', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 13:51:31');
INSERT INTO `t_log` VALUES ('1151', 'admin', '实名认证审核', '0:0:0:0:0:0:0:1', 'id=10072,state=1', '2017-07-05 13:51:54');
INSERT INTO `t_log` VALUES ('1152', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 13:54:02');
INSERT INTO `t_log` VALUES ('1153', 'admin', '实名认证审核', '0:0:0:0:0:0:0:1', 'id=10055,state=1', '2017-07-05 13:54:18');
INSERT INTO `t_log` VALUES ('1154', 'admin', '实名认证审核', '0:0:0:0:0:0:0:1', 'id=10056,state=1', '2017-07-05 13:55:40');
INSERT INTO `t_log` VALUES ('1155', 'admin', '实名认证审核', '0:0:0:0:0:0:0:1', 'id=10074,state=1', '2017-07-05 13:57:09');
INSERT INTO `t_log` VALUES ('1156', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 14:20:57');
INSERT INTO `t_log` VALUES ('1157', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 14:24:08');
INSERT INTO `t_log` VALUES ('1158', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 14:25:22');
INSERT INTO `t_log` VALUES ('1159', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 14:27:06');
INSERT INTO `t_log` VALUES ('1160', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 14:41:59');
INSERT INTO `t_log` VALUES ('1161', 'admin', '实名认证审核', '0:0:0:0:0:0:0:1', 'id=10072,state=1', '2017-07-05 14:42:25');
INSERT INTO `t_log` VALUES ('1162', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 14:48:30');
INSERT INTO `t_log` VALUES ('1163', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 15:30:45');
INSERT INTO `t_log` VALUES ('1164', 'admin', '实名认证审核', '0:0:0:0:0:0:0:1', 'id=10075,state=1', '2017-07-05 15:31:06');
INSERT INTO `t_log` VALUES ('1165', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 16:54:01');
INSERT INTO `t_log` VALUES ('1166', 'admin', '实名认证审核', '0:0:0:0:0:0:0:1', 'id=10058,state=1', '2017-07-05 16:54:20');
INSERT INTO `t_log` VALUES ('1167', 'admin', '实名认证审核', '0:0:0:0:0:0:0:1', 'id=10058,state=2', '2017-07-05 16:57:16');
INSERT INTO `t_log` VALUES ('1168', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 17:25:22');
INSERT INTO `t_log` VALUES ('1169', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 17:30:04');
INSERT INTO `t_log` VALUES ('1170', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 17:32:28');
INSERT INTO `t_log` VALUES ('1171', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-05 17:35:27');
INSERT INTO `t_log` VALUES ('1172', 'admin', '实名认证审核', '0:0:0:0:0:0:0:1', 'id=10054,state=null', '2017-07-05 17:36:03');
INSERT INTO `t_log` VALUES ('1173', 'admin', '管理员登录', '192.168.0.149', 'username=admin', '2017-07-05 17:40:24');
INSERT INTO `t_log` VALUES ('1174', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-06 08:27:49');
INSERT INTO `t_log` VALUES ('1175', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-06 08:38:25');
INSERT INTO `t_log` VALUES ('1176', 'admin', '实名认证审核', '0:0:0:0:0:0:0:1', 'id=10055,state=1', '2017-07-06 08:38:40');
INSERT INTO `t_log` VALUES ('1177', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-06 08:46:48');
INSERT INTO `t_log` VALUES ('1178', 'admin', '管理员登录', '127.0.0.1', 'username=admin', '2017-07-06 11:08:18');
INSERT INTO `t_log` VALUES ('1179', 'admin', '授权组', '0:0:0:0:0:0:0:1', 'roleId=10001', '2017-07-06 11:12:39');
INSERT INTO `t_log` VALUES ('1180', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-06 13:46:33');
INSERT INTO `t_log` VALUES ('1181', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-06 15:22:36');
INSERT INTO `t_log` VALUES ('1182', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-11 09:08:34');
INSERT INTO `t_log` VALUES ('1183', 'admin', '新增轮播图', '0:0:0:0:0:0:0:1', 'title=1asdfasddf', '2017-07-11 09:10:58');
INSERT INTO `t_log` VALUES ('1184', 'admin', '新增轮播图', '0:0:0:0:0:0:0:1', 'title=rtw', '2017-07-11 09:11:43');
INSERT INTO `t_log` VALUES ('1185', 'admin', '删除轮播图', '0:0:0:0:0:0:0:1', 'id=10010', '2017-07-11 09:11:50');
INSERT INTO `t_log` VALUES ('1186', 'admin', '删除轮播图', '0:0:0:0:0:0:0:1', 'id=10009', '2017-07-11 09:11:55');
INSERT INTO `t_log` VALUES ('1187', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-11 14:10:43');
INSERT INTO `t_log` VALUES ('1188', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-11 14:15:51');
INSERT INTO `t_log` VALUES ('1189', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-11 14:15:56');
INSERT INTO `t_log` VALUES ('1190', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-11 14:16:02');
INSERT INTO `t_log` VALUES ('1191', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=163', '2017-07-11 14:16:20');
INSERT INTO `t_log` VALUES ('1192', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-11 14:17:47');
INSERT INTO `t_log` VALUES ('1193', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-11 14:17:54');
INSERT INTO `t_log` VALUES ('1194', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-11 14:19:53');
INSERT INTO `t_log` VALUES ('1195', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-11 14:19:58');
INSERT INTO `t_log` VALUES ('1196', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-11 14:21:10');
INSERT INTO `t_log` VALUES ('1197', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-11 14:21:15');
INSERT INTO `t_log` VALUES ('1198', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-11 15:24:17');
INSERT INTO `t_log` VALUES ('1199', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-11 15:24:25');
INSERT INTO `t_log` VALUES ('1200', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-11 15:44:18');
INSERT INTO `t_log` VALUES ('1201', 'admin', '管理员登录', '192.168.0.149', 'username=admin', '2017-07-11 17:27:12');
INSERT INTO `t_log` VALUES ('1202', 'admin', '管理员登录', '192.168.0.149', 'username=admin', '2017-07-11 17:35:41');
INSERT INTO `t_log` VALUES ('1203', 'admin', '实名认证审核', '192.168.0.149', 'id=10080,state=2', '2017-07-11 17:36:10');
INSERT INTO `t_log` VALUES ('1204', 'admin', '管理员登录', '192.168.0.149', 'username=admin', '2017-07-11 18:22:33');
INSERT INTO `t_log` VALUES ('1205', 'admin', '管理员登录', '192.168.0.149', 'username=admin', '2017-07-11 18:31:45');
INSERT INTO `t_log` VALUES ('1206', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-11 18:33:48');
INSERT INTO `t_log` VALUES ('1207', 'admin', '实名认证审核', '0:0:0:0:0:0:0:1', 'id=10080,state=null', '2017-07-11 18:34:48');
INSERT INTO `t_log` VALUES ('1208', 'admin', '实名认证审核', '192.168.0.149', 'id=10080,state=2', '2017-07-11 18:35:47');
INSERT INTO `t_log` VALUES ('1209', 'admin', '实名认证审核', '192.168.0.149', 'id=10080,state=2', '2017-07-11 18:36:42');
INSERT INTO `t_log` VALUES ('1210', 'admin', '实名认证审核', '192.168.0.149', 'id=10080,state=2', '2017-07-11 18:38:56');
INSERT INTO `t_log` VALUES ('1211', 'admin', '实名认证审核', '192.168.0.149', 'id=10080,state=2', '2017-07-11 18:39:24');
INSERT INTO `t_log` VALUES ('1212', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-11 18:43:40');
INSERT INTO `t_log` VALUES ('1213', 'admin', '管理员登录', '192.168.0.149', 'username=admin', '2017-07-11 18:45:18');
INSERT INTO `t_log` VALUES ('1214', 'admin', '管理员登录', '192.168.0.149', 'username=admin', '2017-07-11 18:51:08');
INSERT INTO `t_log` VALUES ('1215', 'admin', '实名认证审核', '192.168.0.149', 'id=10081,state=2', '2017-07-11 18:51:21');
INSERT INTO `t_log` VALUES ('1216', 'admin', '管理员登录', '192.168.0.149', 'username=admin', '2017-07-11 18:55:21');
INSERT INTO `t_log` VALUES ('1217', 'admin', '实名认证审核', '192.168.0.149', 'id=10082,state=2', '2017-07-11 18:55:28');
INSERT INTO `t_log` VALUES ('1218', 'admin', '实名认证审核', '192.168.0.149', 'id=10082,state=2', '2017-07-11 18:55:55');
INSERT INTO `t_log` VALUES ('1219', 'admin', '实名认证审核', '192.168.0.149', 'id=10082,state=1', '2017-07-11 18:56:28');
INSERT INTO `t_log` VALUES ('1227', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-13 11:31:08');
INSERT INTO `t_log` VALUES ('1228', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-13 12:59:42');
INSERT INTO `t_log` VALUES ('1229', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-13 13:02:23');
INSERT INTO `t_log` VALUES ('1230', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-13 13:07:10');
INSERT INTO `t_log` VALUES ('1231', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-13 13:08:06');
INSERT INTO `t_log` VALUES ('1232', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-13 15:04:08');
INSERT INTO `t_log` VALUES ('1233', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-13 15:44:50');
INSERT INTO `t_log` VALUES ('1234', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-14 13:22:58');
INSERT INTO `t_log` VALUES ('1235', 'admin', '实名认证审核', '0:0:0:0:0:0:0:1', 'id=10146,state=2', '2017-07-14 13:23:19');
INSERT INTO `t_log` VALUES ('1236', 'admin', '实名认证审核', '0:0:0:0:0:0:0:1', 'id=10146,state=2', '2017-07-14 13:23:35');
INSERT INTO `t_log` VALUES ('1237', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-14 14:05:20');
INSERT INTO `t_log` VALUES ('1238', 'admin', '实名认证审核', '0:0:0:0:0:0:0:1', 'id=10147,state=2', '2017-07-14 14:05:29');
INSERT INTO `t_log` VALUES ('1239', 'admin', '实名认证审核', '0:0:0:0:0:0:0:1', 'id=10147,state=2', '2017-07-14 14:05:34');
INSERT INTO `t_log` VALUES ('1240', 'admin', '实名认证审核', '0:0:0:0:0:0:0:1', 'id=10147,state=1', '2017-07-14 14:06:09');
INSERT INTO `t_log` VALUES ('1241', 'admin', '实名认证审核', '0:0:0:0:0:0:0:1', 'id=10147,state=1', '2017-07-14 14:06:57');
INSERT INTO `t_log` VALUES ('1242', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-14 15:52:55');
INSERT INTO `t_log` VALUES ('1243', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-14 15:53:35');
INSERT INTO `t_log` VALUES ('1244', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-14 16:00:53');
INSERT INTO `t_log` VALUES ('1245', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-14 16:02:11');
INSERT INTO `t_log` VALUES ('1246', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-14 16:09:13');
INSERT INTO `t_log` VALUES ('1247', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=单次镀晶', '2017-07-14 16:09:37');
INSERT INTO `t_log` VALUES ('1248', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=单次镀晶', '2017-07-14 16:13:29');
INSERT INTO `t_log` VALUES ('1249', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-14 16:13:53');
INSERT INTO `t_log` VALUES ('1250', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=单次镀晶', '2017-07-14 16:15:02');
INSERT INTO `t_log` VALUES ('1251', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-14 16:15:27');
INSERT INTO `t_log` VALUES ('1252', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-14 16:17:02');
INSERT INTO `t_log` VALUES ('1253', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=单次镀晶', '2017-07-14 16:17:25');
INSERT INTO `t_log` VALUES ('1254', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-14 17:14:16');
INSERT INTO `t_log` VALUES ('1255', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-14 17:21:08');
INSERT INTO `t_log` VALUES ('1256', 'admin', '新增商品', '0:0:0:0:0:0:0:1', 'productName=test', '2017-07-14 17:22:18');
INSERT INTO `t_log` VALUES ('1257', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-14 18:18:25');
INSERT INTO `t_log` VALUES ('1258', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-15 15:26:23');
INSERT INTO `t_log` VALUES ('1259', 'admin', '商品上/下架', '0:0:0:0:0:0:0:1', 'productId=183', '2017-07-15 15:26:39');
INSERT INTO `t_log` VALUES ('1260', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-15 15:26:45');
INSERT INTO `t_log` VALUES ('1261', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=单次镀晶', '2017-07-15 15:27:05');
INSERT INTO `t_log` VALUES ('1262', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=单次镀晶', '2017-07-15 15:32:56');
INSERT INTO `t_log` VALUES ('1263', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-17 08:46:38');
INSERT INTO `t_log` VALUES ('1264', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-17 08:57:53');
INSERT INTO `t_log` VALUES ('1265', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-17 09:04:12');
INSERT INTO `t_log` VALUES ('1266', 'admin', '新增商品', '0:0:0:0:0:0:0:1', 'productName=xddtest（请不用这条测试）', '2017-07-17 09:22:53');
INSERT INTO `t_log` VALUES ('1267', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=xddtest（请不用这条测试）', '2017-07-17 09:23:22');
INSERT INTO `t_log` VALUES ('1268', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-17 10:37:23');
INSERT INTO `t_log` VALUES ('1269', 'admin', '新增商品', '0:0:0:0:0:0:0:1', 'productName=wqr', '2017-07-17 10:38:25');
INSERT INTO `t_log` VALUES ('1270', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=wqr', '2017-07-17 10:40:27');
INSERT INTO `t_log` VALUES ('1271', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-17 10:44:29');
INSERT INTO `t_log` VALUES ('1272', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-17 10:46:11');
INSERT INTO `t_log` VALUES ('1273', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=wqr', '2017-07-17 10:46:41');
INSERT INTO `t_log` VALUES ('1274', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=wqr', '2017-07-17 10:49:54');
INSERT INTO `t_log` VALUES ('1275', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-17 16:26:17');
INSERT INTO `t_log` VALUES ('1276', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-17 16:57:27');
INSERT INTO `t_log` VALUES ('1277', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=185', '2017-07-17 16:57:41');
INSERT INTO `t_log` VALUES ('1278', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=185', '2017-07-17 16:57:49');
INSERT INTO `t_log` VALUES ('1279', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-18 13:35:17');
INSERT INTO `t_log` VALUES ('1280', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-18 14:09:41');
INSERT INTO `t_log` VALUES ('1281', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=wqr', '2017-07-18 14:10:12');
INSERT INTO `t_log` VALUES ('1282', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=wqr', '2017-07-18 14:12:28');
INSERT INTO `t_log` VALUES ('1283', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=wqr', '2017-07-18 14:14:42');
INSERT INTO `t_log` VALUES ('1284', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=wqr', '2017-07-18 14:18:49');
INSERT INTO `t_log` VALUES ('1285', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-18 14:34:19');
INSERT INTO `t_log` VALUES ('1286', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-18 14:35:30');
INSERT INTO `t_log` VALUES ('1287', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-18 15:39:31');
INSERT INTO `t_log` VALUES ('1288', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-18 15:43:07');
INSERT INTO `t_log` VALUES ('1289', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-18 16:56:38');
INSERT INTO `t_log` VALUES ('1290', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-18 17:41:30');
INSERT INTO `t_log` VALUES ('1291', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-19 08:27:52');
INSERT INTO `t_log` VALUES ('1292', 'admin', '车主认证审核', '0:0:0:0:0:0:0:1', 'id=10153,state=2', '2017-07-19 08:42:36');
INSERT INTO `t_log` VALUES ('1293', 'admin', '车主认证审核', '0:0:0:0:0:0:0:1', 'id=10153,state=2', '2017-07-19 08:48:03');
INSERT INTO `t_log` VALUES ('1294', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-20 12:10:56');
INSERT INTO `t_log` VALUES ('1295', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=wqr', '2017-07-20 12:11:27');
INSERT INTO `t_log` VALUES ('1296', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=185', '2017-07-20 12:11:53');
INSERT INTO `t_log` VALUES ('1297', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=184', '2017-07-20 12:11:58');
INSERT INTO `t_log` VALUES ('1298', 'admin', '置顶/取消置顶', '0:0:0:0:0:0:0:1', 'productId=182', '2017-07-20 12:12:19');
INSERT INTO `t_log` VALUES ('1299', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-25 14:12:17');
INSERT INTO `t_log` VALUES ('1300', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-25 15:34:03');
INSERT INTO `t_log` VALUES ('1301', 'admin', '管理员登录', '192.168.0.111', 'username=admin', '2017-07-26 10:21:26');
INSERT INTO `t_log` VALUES ('1302', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-26 15:49:44');
INSERT INTO `t_log` VALUES ('1303', 'admin', '管理员登录', '192.168.0.111', 'username=admin', '2017-07-26 17:36:44');
INSERT INTO `t_log` VALUES ('1304', 'admin', '编辑用户', '192.168.0.111', 'username=1231231231', '2017-07-26 17:37:05');
INSERT INTO `t_log` VALUES ('1305', 'admin', '管理员登录', '192.168.0.111', 'username=admin', '2017-07-27 09:21:05');
INSERT INTO `t_log` VALUES ('1306', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-27 09:24:36');
INSERT INTO `t_log` VALUES ('1307', 'admin', '管理员登录', '192.168.0.111', 'username=admin', '2017-07-27 10:29:59');
INSERT INTO `t_log` VALUES ('1308', 'admin', '管理员登录', '192.168.0.111', 'username=admin', '2017-07-27 10:52:53');
INSERT INTO `t_log` VALUES ('1309', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-27 15:49:32');
INSERT INTO `t_log` VALUES ('1310', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-27 16:04:09');
INSERT INTO `t_log` VALUES ('1311', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-27 16:05:42');
INSERT INTO `t_log` VALUES ('1312', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-27 17:35:35');
INSERT INTO `t_log` VALUES ('1313', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-27 17:45:24');
INSERT INTO `t_log` VALUES ('1314', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-27 17:56:22');
INSERT INTO `t_log` VALUES ('1315', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 11:23:58');
INSERT INTO `t_log` VALUES ('1316', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 11:25:32');
INSERT INTO `t_log` VALUES ('1317', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 11:28:23');
INSERT INTO `t_log` VALUES ('1318', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 11:31:11');
INSERT INTO `t_log` VALUES ('1319', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 11:32:15');
INSERT INTO `t_log` VALUES ('1320', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 11:36:09');
INSERT INTO `t_log` VALUES ('1321', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 13:12:38');
INSERT INTO `t_log` VALUES ('1322', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 13:15:07');
INSERT INTO `t_log` VALUES ('1323', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 13:20:58');
INSERT INTO `t_log` VALUES ('1324', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 13:23:58');
INSERT INTO `t_log` VALUES ('1325', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 13:30:14');
INSERT INTO `t_log` VALUES ('1326', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 13:32:21');
INSERT INTO `t_log` VALUES ('1327', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 13:34:43');
INSERT INTO `t_log` VALUES ('1328', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 13:37:34');
INSERT INTO `t_log` VALUES ('1329', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 13:38:46');
INSERT INTO `t_log` VALUES ('1330', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 13:42:15');
INSERT INTO `t_log` VALUES ('1331', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 13:44:08');
INSERT INTO `t_log` VALUES ('1332', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 13:46:05');
INSERT INTO `t_log` VALUES ('1333', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 13:59:37');
INSERT INTO `t_log` VALUES ('1334', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 14:02:25');
INSERT INTO `t_log` VALUES ('1335', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 14:11:06');
INSERT INTO `t_log` VALUES ('1336', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 14:14:52');
INSERT INTO `t_log` VALUES ('1337', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 14:17:09');
INSERT INTO `t_log` VALUES ('1338', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 14:18:54');
INSERT INTO `t_log` VALUES ('1339', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 14:20:33');
INSERT INTO `t_log` VALUES ('1340', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 14:25:45');
INSERT INTO `t_log` VALUES ('1341', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 14:27:50');
INSERT INTO `t_log` VALUES ('1342', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 14:30:02');
INSERT INTO `t_log` VALUES ('1343', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 14:35:50');
INSERT INTO `t_log` VALUES ('1344', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 14:36:55');
INSERT INTO `t_log` VALUES ('1345', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 14:41:32');
INSERT INTO `t_log` VALUES ('1346', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 14:44:13');
INSERT INTO `t_log` VALUES ('1347', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 14:47:49');
INSERT INTO `t_log` VALUES ('1348', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 14:49:35');
INSERT INTO `t_log` VALUES ('1349', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 14:52:05');
INSERT INTO `t_log` VALUES ('1350', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 15:00:05');
INSERT INTO `t_log` VALUES ('1351', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 15:01:59');
INSERT INTO `t_log` VALUES ('1352', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 15:06:54');
INSERT INTO `t_log` VALUES ('1353', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 15:09:06');
INSERT INTO `t_log` VALUES ('1354', 'admin', '管理员登录', '192.168.0.111', 'username=admin', '2017-07-28 15:30:26');
INSERT INTO `t_log` VALUES ('1355', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-28 16:14:56');
INSERT INTO `t_log` VALUES ('1356', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-30 10:07:55');
INSERT INTO `t_log` VALUES ('1357', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-30 10:30:50');
INSERT INTO `t_log` VALUES ('1358', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-30 10:38:21');
INSERT INTO `t_log` VALUES ('1359', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-30 10:40:12');
INSERT INTO `t_log` VALUES ('1360', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-30 11:04:28');
INSERT INTO `t_log` VALUES ('1361', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-30 12:35:17');
INSERT INTO `t_log` VALUES ('1362', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 09:33:54');
INSERT INTO `t_log` VALUES ('1363', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 09:51:16');
INSERT INTO `t_log` VALUES ('1364', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 10:16:03');
INSERT INTO `t_log` VALUES ('1365', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 10:19:41');
INSERT INTO `t_log` VALUES ('1366', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 10:20:56');
INSERT INTO `t_log` VALUES ('1367', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-07-31 10:26:48');
INSERT INTO `t_log` VALUES ('1368', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 10:30:02');
INSERT INTO `t_log` VALUES ('1369', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-07-31 10:30:54');
INSERT INTO `t_log` VALUES ('1370', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 10:39:22');
INSERT INTO `t_log` VALUES ('1371', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 10:42:30');
INSERT INTO `t_log` VALUES ('1372', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 10:51:40');
INSERT INTO `t_log` VALUES ('1373', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 10:56:00');
INSERT INTO `t_log` VALUES ('1374', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 11:00:23');
INSERT INTO `t_log` VALUES ('1375', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 11:09:15');
INSERT INTO `t_log` VALUES ('1376', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 11:15:47');
INSERT INTO `t_log` VALUES ('1377', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 13:05:02');
INSERT INTO `t_log` VALUES ('1378', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 13:35:50');
INSERT INTO `t_log` VALUES ('1379', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 13:40:22');
INSERT INTO `t_log` VALUES ('1380', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 14:02:18');
INSERT INTO `t_log` VALUES ('1381', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 14:12:21');
INSERT INTO `t_log` VALUES ('1382', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 14:14:28');
INSERT INTO `t_log` VALUES ('1383', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 14:15:28');
INSERT INTO `t_log` VALUES ('1384', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 14:17:26');
INSERT INTO `t_log` VALUES ('1385', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 14:19:14');
INSERT INTO `t_log` VALUES ('1386', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 14:21:24');
INSERT INTO `t_log` VALUES ('1387', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 14:22:17');
INSERT INTO `t_log` VALUES ('1388', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 15:15:15');
INSERT INTO `t_log` VALUES ('1389', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 15:16:09');
INSERT INTO `t_log` VALUES ('1390', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 15:37:25');
INSERT INTO `t_log` VALUES ('1391', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 15:50:47');
INSERT INTO `t_log` VALUES ('1392', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 15:59:54');
INSERT INTO `t_log` VALUES ('1393', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 16:12:25');
INSERT INTO `t_log` VALUES ('1394', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 16:19:48');
INSERT INTO `t_log` VALUES ('1395', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 16:23:43');
INSERT INTO `t_log` VALUES ('1396', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 16:25:01');
INSERT INTO `t_log` VALUES ('1397', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 16:26:22');
INSERT INTO `t_log` VALUES ('1398', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 16:27:39');
INSERT INTO `t_log` VALUES ('1399', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 17:01:47');
INSERT INTO `t_log` VALUES ('1400', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 17:07:55');
INSERT INTO `t_log` VALUES ('1401', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 17:10:16');
INSERT INTO `t_log` VALUES ('1402', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 17:12:16');
INSERT INTO `t_log` VALUES ('1403', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 17:13:17');
INSERT INTO `t_log` VALUES ('1404', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 17:19:34');
INSERT INTO `t_log` VALUES ('1405', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 17:21:09');
INSERT INTO `t_log` VALUES ('1406', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 17:25:02');
INSERT INTO `t_log` VALUES ('1407', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 17:27:18');
INSERT INTO `t_log` VALUES ('1408', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 17:28:49');
INSERT INTO `t_log` VALUES ('1409', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 17:29:56');
INSERT INTO `t_log` VALUES ('1410', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 17:31:59');
INSERT INTO `t_log` VALUES ('1411', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 17:37:58');
INSERT INTO `t_log` VALUES ('1412', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 17:42:22');
INSERT INTO `t_log` VALUES ('1413', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 17:53:49');
INSERT INTO `t_log` VALUES ('1414', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 18:13:57');
INSERT INTO `t_log` VALUES ('1415', 'admin', '授权组', '0:0:0:0:0:0:0:1', 'roleId=10001', '2017-07-31 18:18:04');
INSERT INTO `t_log` VALUES ('1416', 'admin', '授权组', '0:0:0:0:0:0:0:1', 'roleId=10000', '2017-07-31 18:18:51');
INSERT INTO `t_log` VALUES ('1417', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 18:22:22');
INSERT INTO `t_log` VALUES ('1418', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 18:24:29');
INSERT INTO `t_log` VALUES ('1419', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 18:26:05');
INSERT INTO `t_log` VALUES ('1420', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 18:36:30');
INSERT INTO `t_log` VALUES ('1421', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 19:02:05');
INSERT INTO `t_log` VALUES ('1422', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-07-31 19:16:51');
INSERT INTO `t_log` VALUES ('1423', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 08:30:38');
INSERT INTO `t_log` VALUES ('1424', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 09:47:14');
INSERT INTO `t_log` VALUES ('1425', 'admin', '商品上/下架', '0:0:0:0:0:0:0:1', 'productId=184', '2017-08-01 10:01:54');
INSERT INTO `t_log` VALUES ('1426', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=单次镀晶', '2017-08-01 10:14:50');
INSERT INTO `t_log` VALUES ('1427', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=空调清洗', '2017-08-01 10:16:08');
INSERT INTO `t_log` VALUES ('1428', 'admin', '更新商品', '0:0:0:0:0:0:0:1', 'productName=空调清洗', '2017-08-01 10:16:28');
INSERT INTO `t_log` VALUES ('1429', 'admin', '商品上/下架', '0:0:0:0:0:0:0:1', 'productId=94', '2017-08-01 10:16:36');
INSERT INTO `t_log` VALUES ('1430', 'admin', '商品上/下架', '0:0:0:0:0:0:0:1', 'productId=94', '2017-08-01 10:16:41');
INSERT INTO `t_log` VALUES ('1431', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 10:37:50');
INSERT INTO `t_log` VALUES ('1432', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 10:40:11');
INSERT INTO `t_log` VALUES ('1433', 'admin', '管理员登录', '192.168.0.107', 'username=admin', '2017-08-01 10:44:12');
INSERT INTO `t_log` VALUES ('1434', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 11:16:12');
INSERT INTO `t_log` VALUES ('1435', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 11:22:05');
INSERT INTO `t_log` VALUES ('1436', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 11:24:06');
INSERT INTO `t_log` VALUES ('1437', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 11:27:19');
INSERT INTO `t_log` VALUES ('1438', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 11:29:05');
INSERT INTO `t_log` VALUES ('1439', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 11:30:30');
INSERT INTO `t_log` VALUES ('1440', 'admin', '授权组', '0:0:0:0:0:0:0:1', 'roleId=10000', '2017-08-01 11:32:00');
INSERT INTO `t_log` VALUES ('1441', 'admin', '授权组', '0:0:0:0:0:0:0:1', 'roleId=10001', '2017-08-01 11:32:08');
INSERT INTO `t_log` VALUES ('1442', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 11:42:54');
INSERT INTO `t_log` VALUES ('1443', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 14:14:28');
INSERT INTO `t_log` VALUES ('1444', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-01 14:16:19');
INSERT INTO `t_log` VALUES ('1445', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-01 14:53:29');
INSERT INTO `t_log` VALUES ('1446', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 14:59:15');
INSERT INTO `t_log` VALUES ('1447', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 15:00:23');
INSERT INTO `t_log` VALUES ('1448', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-01 15:06:38');
INSERT INTO `t_log` VALUES ('1449', 'admin', '管理员登录', '192.168.0.107', 'username=admin', '2017-08-01 15:33:04');
INSERT INTO `t_log` VALUES ('1450', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 15:58:15');
INSERT INTO `t_log` VALUES ('1451', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-08-01 15:58:31');
INSERT INTO `t_log` VALUES ('1452', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-01 16:02:44');
INSERT INTO `t_log` VALUES ('1453', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 16:06:04');
INSERT INTO `t_log` VALUES ('1454', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-01 16:08:07');
INSERT INTO `t_log` VALUES ('1455', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 16:12:43');
INSERT INTO `t_log` VALUES ('1456', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 16:14:39');
INSERT INTO `t_log` VALUES ('1457', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-01 16:17:07');
INSERT INTO `t_log` VALUES ('1458', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-08-01 16:20:30');
INSERT INTO `t_log` VALUES ('1459', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 16:56:56');
INSERT INTO `t_log` VALUES ('1460', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-08-01 16:57:05');
INSERT INTO `t_log` VALUES ('1461', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 17:03:19');
INSERT INTO `t_log` VALUES ('1462', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-08-01 17:06:26');
INSERT INTO `t_log` VALUES ('1463', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-01 17:12:09');
INSERT INTO `t_log` VALUES ('1464', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-08-01 17:13:54');
INSERT INTO `t_log` VALUES ('1465', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-08-01 17:14:29');
INSERT INTO `t_log` VALUES ('1466', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 17:15:00');
INSERT INTO `t_log` VALUES ('1467', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-01 17:28:23');
INSERT INTO `t_log` VALUES ('1468', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-08-01 17:30:23');
INSERT INTO `t_log` VALUES ('1469', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 17:53:22');
INSERT INTO `t_log` VALUES ('1470', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-01 18:26:38');
INSERT INTO `t_log` VALUES ('1471', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 18:30:52');
INSERT INTO `t_log` VALUES ('1472', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 18:38:01');
INSERT INTO `t_log` VALUES ('1473', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 18:39:57');
INSERT INTO `t_log` VALUES ('1474', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-01 18:50:03');
INSERT INTO `t_log` VALUES ('1475', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-08-02 08:42:33');
INSERT INTO `t_log` VALUES ('1476', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-02 08:46:26');
INSERT INTO `t_log` VALUES ('1477', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-02 08:47:06');
INSERT INTO `t_log` VALUES ('1478', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-02 08:55:40');
INSERT INTO `t_log` VALUES ('1479', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-02 08:59:42');
INSERT INTO `t_log` VALUES ('1480', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-08-02 09:05:45');
INSERT INTO `t_log` VALUES ('1481', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-02 09:28:00');
INSERT INTO `t_log` VALUES ('1482', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-02 09:41:26');
INSERT INTO `t_log` VALUES ('1483', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-02 09:44:18');
INSERT INTO `t_log` VALUES ('1484', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-02 09:46:58');
INSERT INTO `t_log` VALUES ('1485', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-02 09:51:37');
INSERT INTO `t_log` VALUES ('1486', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-08-03 09:21:13');
INSERT INTO `t_log` VALUES ('1487', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-03 09:27:36');
INSERT INTO `t_log` VALUES ('1488', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-03 09:32:19');
INSERT INTO `t_log` VALUES ('1489', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-03 10:28:27');
INSERT INTO `t_log` VALUES ('1490', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-03 10:51:15');
INSERT INTO `t_log` VALUES ('1491', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-03 10:54:17');
INSERT INTO `t_log` VALUES ('1492', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-03 11:07:10');
INSERT INTO `t_log` VALUES ('1493', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-03 11:09:39');
INSERT INTO `t_log` VALUES ('1494', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-03 11:13:33');
INSERT INTO `t_log` VALUES ('1495', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-03 11:16:20');
INSERT INTO `t_log` VALUES ('1496', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-03 11:19:18');
INSERT INTO `t_log` VALUES ('1497', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-03 11:22:43');
INSERT INTO `t_log` VALUES ('1498', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-03 11:29:09');
INSERT INTO `t_log` VALUES ('1499', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-03 13:28:40');
INSERT INTO `t_log` VALUES ('1500', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-03 13:34:26');
INSERT INTO `t_log` VALUES ('1501', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-03 13:47:10');
INSERT INTO `t_log` VALUES ('1502', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-08-03 14:31:39');
INSERT INTO `t_log` VALUES ('1503', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-03 14:32:56');
INSERT INTO `t_log` VALUES ('1504', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-03 14:35:00');
INSERT INTO `t_log` VALUES ('1505', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-03 14:50:29');
INSERT INTO `t_log` VALUES ('1506', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-08-03 14:54:08');
INSERT INTO `t_log` VALUES ('1507', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-03 15:00:51');
INSERT INTO `t_log` VALUES ('1508', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-03 15:06:43');
INSERT INTO `t_log` VALUES ('1509', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-03 15:10:58');
INSERT INTO `t_log` VALUES ('1510', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-08-03 15:27:15');
INSERT INTO `t_log` VALUES ('1511', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-03 15:28:09');
INSERT INTO `t_log` VALUES ('1512', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-03 15:35:09');
INSERT INTO `t_log` VALUES ('1513', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-08-03 16:20:53');
INSERT INTO `t_log` VALUES ('1514', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-03 16:27:25');
INSERT INTO `t_log` VALUES ('1515', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-03 16:31:51');
INSERT INTO `t_log` VALUES ('1516', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-08-03 16:50:03');
INSERT INTO `t_log` VALUES ('1517', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-04 08:59:56');
INSERT INTO `t_log` VALUES ('1518', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-04 09:00:14');
INSERT INTO `t_log` VALUES ('1519', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-04 09:03:54');
INSERT INTO `t_log` VALUES ('1520', 'admin', '管理员登录', '192.168.0.129', 'username=admin', '2017-08-04 09:34:49');
INSERT INTO `t_log` VALUES ('1521', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-08-04 13:10:55');
INSERT INTO `t_log` VALUES ('1522', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-08-04 13:11:33');
INSERT INTO `t_log` VALUES ('1523', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-04 13:20:54');
INSERT INTO `t_log` VALUES ('1524', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-04 13:24:03');
INSERT INTO `t_log` VALUES ('1525', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-04 13:26:16');
INSERT INTO `t_log` VALUES ('1526', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-04 13:27:51');
INSERT INTO `t_log` VALUES ('1527', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-04 13:31:36');
INSERT INTO `t_log` VALUES ('1528', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-04 14:42:17');
INSERT INTO `t_log` VALUES ('1529', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-07 09:01:05');
INSERT INTO `t_log` VALUES ('1530', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-08-10 09:51:52');
INSERT INTO `t_log` VALUES ('1531', 'admin', '更新商家', '192.168.0.127', 'vendorName=测试地址', '2017-08-10 09:52:22');
INSERT INTO `t_log` VALUES ('1532', 'admin', '新增商品', '192.168.0.127', 'productName=测试0.01', '2017-08-10 09:54:09');
INSERT INTO `t_log` VALUES ('1533', 'admin', '新增商品', '192.168.0.127', 'productName=银联测试', '2017-08-10 09:55:26');
INSERT INTO `t_log` VALUES ('1534', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-08-10 10:57:23');
INSERT INTO `t_log` VALUES ('1535', 'admin', '管理员登录', '192.168.0.127', 'username=admin', '2017-08-10 10:57:55');
INSERT INTO `t_log` VALUES ('1536', 'admin', '管理员登录', '192.168.0.137', 'username=admin', '2017-08-24 18:01:23');
INSERT INTO `t_log` VALUES ('1537', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-24 18:02:22');
INSERT INTO `t_log` VALUES ('1538', 'admin', '管理员登录', '192.168.0.137', 'username=admin', '2017-08-25 08:17:18');
INSERT INTO `t_log` VALUES ('1539', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-25 08:28:39');
INSERT INTO `t_log` VALUES ('1540', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-25 08:31:12');
INSERT INTO `t_log` VALUES ('1541', 'admin', '管理员登录', '192.168.0.137', 'username=admin', '2017-08-25 08:37:22');
INSERT INTO `t_log` VALUES ('1542', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-28 14:07:34');
INSERT INTO `t_log` VALUES ('1543', 'admin', '新增商家', '0:0:0:0:0:0:0:1', 'vendorName=123', '2017-08-31 10:17:06');
INSERT INTO `t_log` VALUES ('1544', 'admin', '删除/恢复文章', '0:0:0:0:0:0:0:1', 'id=10001', '2017-08-31 15:41:10');
INSERT INTO `t_log` VALUES ('1545', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-08-31 16:05:05');
INSERT INTO `t_log` VALUES ('1546', 'admin', '管理员登录', '0:0:0:0:0:0:0:1', 'username=admin', '2017-09-01 01:25:47');

-- ----------------------------
-- Table structure for `t_module`
-- ----------------------------
DROP TABLE IF EXISTS `t_module`;
CREATE TABLE `t_module` (
  `id` int(11) NOT NULL COMMENT 'id',
  `parent_id` int(11) DEFAULT NULL COMMENT '父模块id 0表示一级分类',
  `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名',
  `mod_path` varchar(128) DEFAULT NULL COMMENT '访问action',
  `mod_param` varchar(128) DEFAULT NULL COMMENT '参数',
  `mod_icon` varchar(128) DEFAULT NULL COMMENT '模块图标',
  `mod_flag` tinyint(2) DEFAULT NULL COMMENT '1,2表示层级 | 3表示功能',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台模块';

-- ----------------------------
-- Records of t_module
-- ----------------------------
INSERT INTO `t_module` VALUES ('1', '0', '会员管理', null, null, 'fa fa-user', '1');
INSERT INTO `t_module` VALUES ('2', '0', '审核管理', null, null, 'fa fa-gavel', '1');
INSERT INTO `t_module` VALUES ('3', '0', '贷款管理', null, null, 'fa fa-gavel', '1');
INSERT INTO `t_module` VALUES ('4', '0', '商品管理', null, null, 'fa fa-cubes', '1');
INSERT INTO `t_module` VALUES ('5', '0', '订单管理', null, null, 'fa fa-th-list', '1');
INSERT INTO `t_module` VALUES ('6', '0', '网站管理', null, null, 'fa fa-play-circle', '1');
INSERT INTO `t_module` VALUES ('7', '0', '统计管理', null, null, 'fa fa-bar-chart-o', '1');
INSERT INTO `t_module` VALUES ('10', '0', '系统管理', null, null, 'fa fa-gear', '1');
INSERT INTO `t_module` VALUES ('11', '1', '会员列表', 'admin/user/userList.do', null, 'fa fa-group', '2');
INSERT INTO `t_module` VALUES ('12', '1', '会员资料', 'admin/user/userInfoList.do', null, 'fa fa-info-circle', '2');
INSERT INTO `t_module` VALUES ('13', '1', '会员等级', 'admin/user/gradeList.do', null, 'fa fa-diamond', '2');
INSERT INTO `t_module` VALUES ('21', '2', '实名认证', 'admin/user/approvalList.do', null, 'fa fa-gavel', '2');
INSERT INTO `t_module` VALUES ('22', '2', '个人贷款', 'admin/loan/loanList.do', '?type=1', 'fa fa-gavel', '2');
INSERT INTO `t_module` VALUES ('23', '2', '个人二手车贷款', 'admin/loan/loanList.do', '?type=2', 'fa fa-gavel', '2');
INSERT INTO `t_module` VALUES ('24', '2', '车商贷款', 'admin/loan/loanList.do', '?type=3', 'fa fa-gavel', '2');
INSERT INTO `t_module` VALUES ('25', '2', '车商二手车贷款', 'admin/loan/loanList.do', '?type=4', 'fa fa-gavel', '2');
INSERT INTO `t_module` VALUES ('26', '2', '车抵贷', 'admin/loan/loanList.do', '?type=5', 'fa fa-gavel', '2');
INSERT INTO `t_module` VALUES ('27', '2', '车险管理', 'admin/loan/insuranceList.do', null, 'fa fa-gavel', '2');
INSERT INTO `t_module` VALUES ('28', '2', '分类管理', 'admin/loan/loanType.do', null, 'fa fa-bars', '2');
INSERT INTO `t_module` VALUES ('31', '3', '待批复', 'admin/loan/loanReAudit.do', '?loanState=3', 'fa fa-gavel', '2');
INSERT INTO `t_module` VALUES ('32', '3', '已贷款', 'admin/loan/loanReAudit.do', '?loanState=5', 'fa fa-gavel', '2');
INSERT INTO `t_module` VALUES ('41', '4', '商品列表', 'admin/product/productList.do', null, 'fa fa-list', '2');
INSERT INTO `t_module` VALUES ('42', '4', '砍价管理', 'admin/product/kanList.do', null, 'fa fa-sort-amount-desc', '2');
INSERT INTO `t_module` VALUES ('43', '4', '评价管理', 'admin/product/reviewList.do', null, 'fa fa-comments', '2');
INSERT INTO `t_module` VALUES ('44', '4', '商家管理', 'admin/product/vendorList.do', null, 'fa fa-shopping-basket', '2');
INSERT INTO `t_module` VALUES ('51', '5', '订单管理', 'admin/order/orderList.do', null, 'fa fa-list', '2');
INSERT INTO `t_module` VALUES ('53', '5', '资金记录', 'admin/order/fundList.do', null, 'fa fa-calculator', '2');
INSERT INTO `t_module` VALUES ('61', '6', '文章管理', 'admin/web/articleList.do', null, 'fa fa-file-text', '2');
INSERT INTO `t_module` VALUES ('62', '6', '轮播图管理', 'admin/web/bannerList.do', null, 'fa fa-file-image-o', '2');
INSERT INTO `t_module` VALUES ('63', '6', '参数设置', 'admin/web/config.do', null, 'fa fa-cog', '2');
INSERT INTO `t_module` VALUES ('64', '6', '用户反馈', 'admin/web/feedbackList.do', null, 'fa fa-list', '2');
INSERT INTO `t_module` VALUES ('67', '6', '活动管理', 'admin/activity/activitylist.do', null, 'fa fa-file-image-o', '2');
INSERT INTO `t_module` VALUES ('68', '6', '车型管理', '/admin/vehicle/vehiclelist.do', null, 'fa fa-file-image-o', '2');
INSERT INTO `t_module` VALUES ('69', '5', '团购管理', '/admin/product/groupbuylist.do', null, 'fa fa-file-image-o', '2');
INSERT INTO `t_module` VALUES ('70', '5', '优惠券', 'admin/order/coupontypelist.do', null, 'fa fa-file-image-o', '2');
INSERT INTO `t_module` VALUES ('71', '7', '用户统计', 'admin/statis/user.do', null, 'fa fa-bar-chart-o', '2');
INSERT INTO `t_module` VALUES ('72', '7', '贷款统计', 'admin/statis/loan.do', null, 'fa fa-bar-chart-o', '2');
INSERT INTO `t_module` VALUES ('73', '7', '订单统计', 'admin/statis/order.do', null, 'fa fa-bar-chart-o', '2');
INSERT INTO `t_module` VALUES ('101', '10', '管理员列表', 'admin/system/adminList.do', null, 'fa fa-user', '2');
INSERT INTO `t_module` VALUES ('102', '10', '权限管理', 'admin/system/rights.do', null, 'fa fa-delicious', '2');
INSERT INTO `t_module` VALUES ('103', '10', '日志管理', 'admin/system/logList.do', null, 'fa fa-laptop', '2');
INSERT INTO `t_module` VALUES ('104', '10', '文件管理', 'admin/system/file.do', null, 'fa fa-archive', '2');
INSERT INTO `t_module` VALUES ('105', '10', '系统工具', 'admin/system/tools.do', null, 'fa fa-crop', '2');
INSERT INTO `t_module` VALUES ('111', '11', '用户编辑', 'admin/user/userEdit.do', null, null, '3');
INSERT INTO `t_module` VALUES ('112', '11', '用户禁用/解封', 'admin/user/userEnable.do', null, null, '3');
INSERT INTO `t_module` VALUES ('113', '11', '用户详情', 'admin/user/userDetail.do', null, null, '3');
INSERT INTO `t_module` VALUES ('131', '13', '等级编辑', 'admin/user/gradeEdit.do', null, null, '3');
INSERT INTO `t_module` VALUES ('211', '21', '认证审核', 'admin/user/auditApproval.do', null, null, '3');
INSERT INTO `t_module` VALUES ('221', '22', '贷款详细', 'admin/loan/loanDetail.do', null, null, '3');
INSERT INTO `t_module` VALUES ('222', '22', '贷款审核', 'admin/loan/loanAppr.do', null, null, '3');
INSERT INTO `t_module` VALUES ('223', '22', '提交资料', 'admin/loan/updateMet.do', null, null, '3');
INSERT INTO `t_module` VALUES ('271', '27', '保险审核', 'admin/loan/insAppr.do', null, null, '3');
INSERT INTO `t_module` VALUES ('281', '28', '编辑分类', 'admin/loan/LoanTypeEdit.do', null, null, '3');
INSERT INTO `t_module` VALUES ('311', '31', '批复操作', 'admin/loan/loanReAppr.do', null, null, '3');
INSERT INTO `t_module` VALUES ('411', '41', '商品详情', 'admin/product/productDetail.do', null, null, '3');
INSERT INTO `t_module` VALUES ('412', '41', '商品编辑', 'admin/product/productEdit.do', null, null, '3');
INSERT INTO `t_module` VALUES ('413', '41', '商品上/下架', 'admin/product/productEnable.do', null, null, '3');
INSERT INTO `t_module` VALUES ('421', '42', '砍价详细', 'admin/product/kanDetail.do', null, null, '3');
INSERT INTO `t_module` VALUES ('431', '43', '删除评论', 'admin/product/reviewDelete.do', null, null, '3');
INSERT INTO `t_module` VALUES ('441', '44', '商家编辑', 'admin/product/vendorEdit.do', null, null, '3');
INSERT INTO `t_module` VALUES ('442', '44', '启用/关闭商家', 'admin/product/vendorEnable.do', null, null, '3');
INSERT INTO `t_module` VALUES ('611', '61', '文章编辑', 'admin/web/articleEdit.do', null, null, '3');
INSERT INTO `t_module` VALUES ('612', '61', '文章删除', 'admin/web/articleEnable.do', null, null, '3');
INSERT INTO `t_module` VALUES ('621', '62', '轮播图编辑', 'admin/web/bannerEdit.do', null, null, '3');
INSERT INTO `t_module` VALUES ('622', '62', '轮播图删除', 'admin/web/bannerEnable.do', null, null, '3');
INSERT INTO `t_module` VALUES ('631', '63', '更新配置', 'admin/web/configEdit.do', null, null, '3');
INSERT INTO `t_module` VALUES ('711', '71', '数据展示', 'admin/statis/userStatData.do', null, null, '3');
INSERT INTO `t_module` VALUES ('712', '71', '图表展示', 'admin/statis/userStatChart.do', null, null, '3');
INSERT INTO `t_module` VALUES ('721', '72', '数据展示', 'admin/statis/loanStatData.do', null, null, '3');
INSERT INTO `t_module` VALUES ('722', '72', '图表展示', 'admin/statis/loanStatChart.do', null, null, '3');
INSERT INTO `t_module` VALUES ('731', '73', '数据展示', 'admin/statis/orderStatData.do', null, null, '3');
INSERT INTO `t_module` VALUES ('732', '73', '图表展示', 'admin/statis/orderStatChart.do', null, null, '3');
INSERT INTO `t_module` VALUES ('1011', '101', '管理员编辑', 'admin/system/adminEdit.do', null, null, '3');
INSERT INTO `t_module` VALUES ('1012', '101', '管理员冻结', 'admin/system/adminEnable.do', null, null, '3');
INSERT INTO `t_module` VALUES ('1021', '102', '编辑组', 'admin/system/roleEdit.do', null, null, '3');
INSERT INTO `t_module` VALUES ('1022', '102', '禁用/启用组', 'admin/system/roleEnable.do', null, null, '3');
INSERT INTO `t_module` VALUES ('1023', '102', '查看权限', 'admin/system/rolePerm.do', null, null, '3');
INSERT INTO `t_module` VALUES ('1024', '102', '授权组', 'admin/system/permit.do', null, null, '3');
INSERT INTO `t_module` VALUES ('1031', '103', '日志备份', 'admin/system/backupLog.do', null, null, '3');
INSERT INTO `t_module` VALUES ('1041', '104', '获取目录', 'admin/system/getDirectory.do', null, null, '3');
INSERT INTO `t_module` VALUES ('1051', '105', 'SQL编辑', 'admin/system/executeUpdate.do', null, null, '3');
INSERT INTO `t_module` VALUES ('1052', '105', 'SQL查询', 'admin/system/executeQuery.do', null, null, '3');
INSERT INTO `t_module` VALUES ('1053', '41', '置顶功能', 'admin/product/ding.do', null, null, '3');
INSERT INTO `t_module` VALUES ('1054', '41', 'image', 'admin/order/image.do', null, null, '3');
INSERT INTO `t_module` VALUES ('1055', '27', '保险审核', 'admin/loan/insApprFee.do', '', '', '3');
INSERT INTO `t_module` VALUES ('1056', '27', '保险审核', 'admin/loan/insApprStateIn.do', '', '', '3');

-- ----------------------------
-- Table structure for `t_msg`
-- ----------------------------
DROP TABLE IF EXISTS `t_msg`;
CREATE TABLE `t_msg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `msg_title` varchar(255) DEFAULT NULL COMMENT '消息标题',
  `msg_content` varchar(255) DEFAULT NULL COMMENT '消息内容',
  `msg_create_time` datetime DEFAULT NULL COMMENT '消息发送时间',
  `msg_state` bit(1) DEFAULT b'0' COMMENT '消息状态 1-已读 0-未读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='消息';

-- ----------------------------
-- Records of t_msg
-- ----------------------------
INSERT INTO `t_msg` VALUES ('239', '10155', '绑定手机号', '绑定手机号', '2017-08-01 17:27:04', '');
INSERT INTO `t_msg` VALUES ('240', '10155', '绑定手机号现金', '绑定手机号现金', '2017-08-01 17:27:04', '');
INSERT INTO `t_msg` VALUES ('241', '10156', '绑定手机号', '绑定手机号', '2017-08-01 17:28:40', '');
INSERT INTO `t_msg` VALUES ('242', '10156', '绑定手机号现金', '绑定手机号现金', '2017-08-01 17:28:40', '');
INSERT INTO `t_msg` VALUES ('243', '10157', '绑定手机号', '绑定手机号', '2017-08-01 17:35:29', '');
INSERT INTO `t_msg` VALUES ('244', '10157', '绑定手机号现金', '绑定手机号现金', '2017-08-01 17:35:29', '');
INSERT INTO `t_msg` VALUES ('245', '10155', '保险投保成功', '您申请的保险已投保成功', '2017-08-02 08:51:18', '');
INSERT INTO `t_msg` VALUES ('246', '10155', '保险投保成功', '您申请的保险已投保成功', '2017-08-02 08:51:18', '');
INSERT INTO `t_msg` VALUES ('247', '10156', '保险投保成功', '您申请的保险已投保成功', '2017-08-03 13:29:34', '');
INSERT INTO `t_msg` VALUES ('248', '10157', '保险投保成功', '您申请的保险已投保成功', '2017-08-03 13:49:44', '');
INSERT INTO `t_msg` VALUES ('249', '10155', '保险投保成功', '您申请的保险已投保成功', '2017-08-03 14:33:28', '');
INSERT INTO `t_msg` VALUES ('250', '10157', '保险投保成功', '您申请的保险已投保成功', '2017-08-03 14:35:19', '');
INSERT INTO `t_msg` VALUES ('251', '10155', '保险投保成功', '您申请的保险已投保成功', '2017-08-03 14:39:16', '');
INSERT INTO `t_msg` VALUES ('252', '10157', '保险投保成功', '您申请的保险已投保成功', '2017-08-03 16:44:41', '');
INSERT INTO `t_msg` VALUES ('253', '10158', '绑定手机号', '绑定手机号', '2017-08-10 10:00:33', '');
INSERT INTO `t_msg` VALUES ('254', '10158', '绑定手机号现金', '绑定手机号现金', '2017-08-10 10:00:33', '');
INSERT INTO `t_msg` VALUES ('255', '10159', '欢迎注册去扑购', '欢迎注册去扑购', '2017-08-18 09:38:03', '');
INSERT INTO `t_msg` VALUES ('256', '10160', '绑定手机号', '绑定手机号', '2017-09-08 10:01:38', '');
INSERT INTO `t_msg` VALUES ('257', '10160', '绑定手机号现金', '绑定手机号现金', '2017-09-08 10:01:38', '');
INSERT INTO `t_msg` VALUES ('258', '10161', '绑定手机号', '绑定手机号', '2017-09-08 10:08:06', '');
INSERT INTO `t_msg` VALUES ('259', '10161', '绑定手机号现金', '绑定手机号现金', '2017-09-08 10:08:06', '');

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `product_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `order_num` varchar(32) DEFAULT NULL COMMENT '订单编号',
  `order_money` decimal(15,2) DEFAULT NULL COMMENT '订单金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `payway` tinyint(4) DEFAULT NULL COMMENT '支付方式 1-支付宝 2-微信 3-余额',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型 1-充值 2-购物',
  `state` tinyint(4) DEFAULT '0' COMMENT '订单状态 0-未付款 1-已付款 2-已兑换 3-已评价',
  `ex_time` datetime DEFAULT NULL COMMENT '兑换时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=592 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单表';

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('491', '10155', '0', '0801172742749127', '13.00', '2017-08-01 17:51:33', null, '2', '3', '0', null);
INSERT INTO `t_order` VALUES ('492', '10155', '0', '0801172742749127', '13.00', '2017-08-01 17:51:33', null, '2', '3', '0', null);
INSERT INTO `t_order` VALUES ('493', '10155', '0', '0801172742749127', '13.00', '2017-08-01 17:51:33', null, '1', '3', '0', null);
INSERT INTO `t_order` VALUES ('494', '10155', '0', '0801172742749127', '13.00', '2017-08-01 17:51:33', null, '1', '3', '0', null);
INSERT INTO `t_order` VALUES ('495', '10156', '0', '080117291722961', '169.00', '2017-08-02 08:57:33', null, '1', '3', '0', null);
INSERT INTO `t_order` VALUES ('496', '10156', '0', '0802090029429713', '1608.00', '2017-08-02 15:41:13', null, '1', '3', '0', null);
INSERT INTO `t_order` VALUES ('497', '10156', '0', '0803092029695246', '143.00', '2017-08-03 09:25:08', null, '1', '3', '0', null);
INSERT INTO `t_order` VALUES ('498', '10156', '0', '0803143050161365', '123246.00', '2017-08-03 14:33:47', null, '1', '3', '0', null);
INSERT INTO `t_order` VALUES ('499', '10156', '94', '0803170033159206', '132.00', '2017-08-03 17:00:33', null, '1', '2', '0', null);
INSERT INTO `t_order` VALUES ('500', '10156', '94', '0803170037688686', '132.00', '2017-08-03 17:00:38', null, '2', '2', '0', null);
INSERT INTO `t_order` VALUES ('501', '10156', '0', '0803143050161365', '123246.00', '2017-08-09 14:50:24', null, '1', '3', '0', null);
INSERT INTO `t_order` VALUES ('502', '10156', '0', '0803143050161365', '123246.00', '2017-08-09 14:51:00', null, '1', '3', '0', null);
INSERT INTO `t_order` VALUES ('503', '10156', '0', '0803143050161365', '123246.00', '2017-08-09 17:24:56', null, '2', '3', '0', null);
INSERT INTO `t_order` VALUES ('504', '10155', '0', '0804090534879771', '0.00', '2017-08-10 08:49:01', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('505', '10156', '0', '0803143050161365', '123246.00', '2017-08-10 08:51:11', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('506', '10156', '94', '0810085538605656', '130.00', '2017-08-10 08:55:39', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('507', '10156', '94', '0810085645281157', '130.00', '2017-08-10 08:56:45', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('508', '10156', '94', '0810090018526926', '130.00', '2017-08-10 09:00:19', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('509', '10156', '94', '0810090022582257', '130.00', '2017-08-10 09:00:23', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('510', '10156', '94', '0810090026325198', '130.00', '2017-08-10 09:00:26', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('511', '10156', '94', '0810090036416355', '130.00', '2017-08-10 09:00:36', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('512', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:00:47', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('513', '10156', '0', '0803143050161365', '123246.00', '2017-08-10 09:00:47', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('514', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:00:53', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('515', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:00:57', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('516', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:01:14', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('517', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:01:24', null, '2', '3', '0', null);
INSERT INTO `t_order` VALUES ('518', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:01:26', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('519', '10156', '94', '0810090624351671', '130.00', '2017-08-10 09:06:24', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('520', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:07:19', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('521', '10156', '94', '0810090733333541', '130.00', '2017-08-10 09:07:33', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('522', '10156', '94', '0810090951849740', '130.00', '2017-08-10 09:09:52', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('523', '10156', '94', '0810091359916363', '130.00', '2017-08-10 09:14:00', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('524', '10156', '94', '0810091506388601', '130.00', '2017-08-10 09:15:06', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('525', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:22:13', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('526', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:22:15', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('527', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:22:16', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('528', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:22:16', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('529', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:22:16', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('530', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:22:16', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('531', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:23:44', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('532', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:23:45', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('533', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:23:45', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('534', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:23:45', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('535', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:23:45', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('536', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:23:45', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('537', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:23:45', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('538', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:23:46', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('539', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:23:46', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('540', '10156', '94', '0810092614450484', '130.00', '2017-08-10 09:26:14', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('541', '10156', '94', '0810092617570196', '130.00', '2017-08-10 09:26:18', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('542', '10156', '94', '0810092619933966', '130.00', '2017-08-10 09:26:20', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('543', '10156', '94', '0810092731284609', '130.00', '2017-08-10 09:27:31', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('544', '10156', '94', '0810092736642295', '130.00', '2017-08-10 09:27:37', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('545', '10156', '94', '0810092746211235', '130.00', '2017-08-10 09:27:46', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('546', '10156', '94', '0810092815371711', '130.00', '2017-08-10 09:28:15', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('547', '10156', '94', '0810093045123243', '130.00', '2017-08-10 09:30:45', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('548', '10156', '94', '0810093706907990', '130.00', '2017-08-10 09:37:07', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('549', '10156', '94', '0810093813744903', '130.00', '2017-08-10 09:38:14', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('550', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:38:20', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('551', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:38:45', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('552', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:38:46', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('553', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:38:46', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('554', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:38:46', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('555', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:38:46', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('556', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:38:54', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('557', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:38:54', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('558', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:38:54', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('559', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:38:54', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('560', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:38:55', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('561', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:38:55', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('562', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:38:55', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('563', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:38:55', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('564', '10156', '0', '0803143050161365', '123246.00', '2017-08-10 09:40:12', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('565', '10156', '0', '0810094038647602', '50.00', '2017-08-10 09:40:39', null, '4', '1', '0', null);
INSERT INTO `t_order` VALUES ('566', '10156', '94', '0810094756648322', '130.00', '2017-08-10 09:47:57', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('567', '10156', '94', '0810094830122464', '130.00', '2017-08-10 09:48:30', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('568', '10155', '0', '0804090534879771', '0.00', '2017-08-10 09:55:11', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('569', '10156', '187', '0810095541479630', '1.00', '2017-08-10 09:55:41', null, '1', '2', '0', null);
INSERT INTO `t_order` VALUES ('570', '10156', '187', '0810095543730264', '1.00', '2017-08-10 09:55:44', null, '1', '2', '0', null);
INSERT INTO `t_order` VALUES ('571', '10156', '187', '0810095548476210', '1.00', '2017-08-10 09:55:48', null, '2', '2', '0', null);
INSERT INTO `t_order` VALUES ('572', '10156', '0', '0810095842811520', '0.01', '2017-08-10 09:58:43', null, '2', '1', '0', null);
INSERT INTO `t_order` VALUES ('573', '10158', '0', '0810100042435134', '0.01', '2017-08-10 10:00:42', null, '1', '1', '0', null);
INSERT INTO `t_order` VALUES ('574', '10158', '0', '0810100045548493', '0.01', '2017-08-10 10:00:46', null, '1', '1', '0', null);
INSERT INTO `t_order` VALUES ('575', '10158', '0', '0810100048672654', '0.01', '2017-08-10 10:00:49', null, '1', '1', '0', null);
INSERT INTO `t_order` VALUES ('576', '10158', '0', '0810100110237176', '0.01', '2017-08-10 10:01:10', null, '2', '1', '0', null);
INSERT INTO `t_order` VALUES ('577', '10158', '0', '0810100306934293', '0.01', '2017-08-10 10:03:07', null, '2', '1', '0', null);
INSERT INTO `t_order` VALUES ('578', '10155', '0', '0804090534879771', '0.00', '2017-08-10 10:13:30', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('579', '10155', '0', '0810102259165553', '0.01', '2017-08-10 10:22:59', null, '4', '1', '0', null);
INSERT INTO `t_order` VALUES ('580', '10155', '0', '0810102317744828', '0.01', '2017-08-10 10:23:18', null, '4', '1', '0', null);
INSERT INTO `t_order` VALUES ('581', '10155', '0', '0810102318553424', '0.01', '2017-08-10 10:23:19', null, '4', '1', '0', null);
INSERT INTO `t_order` VALUES ('582', '10156', '187', '081010503978398', '1.00', '2017-08-10 10:50:39', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('583', '10155', '0', '0804090534879771', '0.00', '2017-08-10 10:52:55', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('584', '10155', '0', '0810105634166574', '1599.00', '2017-08-10 10:59:13', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('585', '10155', '0', '0810105634166574', '1599.00', '2017-08-10 11:00:47', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('586', '10157', '187', '0810111553817504', '1.00', '2017-08-10 11:15:54', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('587', '10155', '187', '0810164651961283', '1.00', '2017-08-10 16:46:52', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('588', '10157', '187', '0811105014258551', '1.00', '2017-08-11 10:50:14', null, '4', '2', '0', null);
INSERT INTO `t_order` VALUES ('589', '10155', '0', '0810105634166574', '1599.00', '2017-08-11 13:56:02', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('590', '10156', '0', '0803143050161365', '123246.00', '2017-08-15 13:54:57', null, '4', '3', '0', null);
INSERT INTO `t_order` VALUES ('591', '10156', '0', '0803143050161365', '123246.00', '2017-08-18 15:07:01', null, '4', '3', '0', null);

-- ----------------------------
-- Table structure for `t_phone_inivte`
-- ----------------------------
DROP TABLE IF EXISTS `t_phone_inivte`;
CREATE TABLE `t_phone_inivte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` bigint(11) DEFAULT NULL COMMENT '电话',
  `create_user` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_user` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `inviterId` int(11) DEFAULT NULL COMMENT '被邀请人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_phone_inivte
-- ----------------------------

-- ----------------------------
-- Table structure for `t_prduct_group`
-- ----------------------------
DROP TABLE IF EXISTS `t_prduct_group`;
CREATE TABLE `t_prduct_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `t_sys_model_library_id` bigint(20) DEFAULT NULL,
  `fours_price` decimal(10,0) DEFAULT '0' COMMENT '4s店价格（当地价）',
  `groupbuying_price` decimal(10,0) DEFAULT '0' COMMENT '团购价',
  `guidance_price` decimal(10,0) DEFAULT '0' COMMENT '市场指导价',
  `stock` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `is_full` tinyint(4) DEFAULT NULL COMMENT '是否满团',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `order_price` decimal(9,2) DEFAULT NULL,
  `stage` int(6) DEFAULT NULL,
  `shengxiao_time` datetime DEFAULT NULL,
  `shixiao_time` datetime DEFAULT NULL,
  `groupNum` int(6) DEFAULT NULL,
  `baoming_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_prduct_group
-- ----------------------------
INSERT INTO `t_prduct_group` VALUES ('2', '1', '1', '2', '3', '100', '2017-08-30 14:38:00', '10001', '2017-09-01 17:20:53', '10001', '1', '0', '4.00', '5', '2017-12-12 12:12:12', '2017-12-12 12:12:12', '99', null);
INSERT INTO `t_prduct_group` VALUES ('3', '1', '100000', '100000', '100000', '100', '2017-08-30 14:41:37', '10001', '2017-09-01 18:03:05', '10001', '0', '0', '10000.00', '100', '2017-01-01 12:12:12', '2018-01-01 12:12:12', '100', null);
INSERT INTO `t_prduct_group` VALUES ('4', null, '11', '12', '13', '10', '2017-08-30 16:13:32', '10001', '2017-08-30 16:32:18', null, '0', '2', '14.00', '15', '2017-12-12 12:12:12', '2017-12-12 12:12:12', null, null);
INSERT INTO `t_prduct_group` VALUES ('5', '1', '1', '2', '5', '100', '2017-08-30 16:14:07', '10001', '2017-09-01 18:03:18', '10001', '0', '0', '45.00', '1', '2017-12-12 12:12:12', '2017-12-12 12:12:12', '100', null);
INSERT INTO `t_prduct_group` VALUES ('6', '5', '12445', '123123', '23123', '21312', '2017-08-30 17:11:09', '10001', '2017-08-30 18:02:44', '10001', '0', '2', '213123.00', '2312', '2017-12-12 12:12:12', '2017-12-12 12:12:12', null, null);
INSERT INTO `t_prduct_group` VALUES ('7', '1', '53453', '543453', '453453', '3453', '2017-08-30 17:31:39', '10001', '2017-09-01 15:29:16', '10001', '0', '0', '453453.00', '54345', '2017-12-12 12:12:12', '2017-12-12 12:12:12', '100', null);
INSERT INTO `t_prduct_group` VALUES ('8', '1', '5555', '5555', '15424', '555', '2017-08-31 09:11:45', '10001', '2017-09-01 01:36:28', '10001', '1', '0', '555.00', '121', '2017-12-12 12:12:12', '2017-12-12 12:12:12', '1000', null);
INSERT INTO `t_prduct_group` VALUES ('9', '7', '100000', '100000', '100000', '100', '2017-08-31 10:12:55', '10001', '2017-08-31 11:09:56', '10001', '0', '2', '10000.00', '51', '2017-08-11 10:08:12', '2017-08-19 10:08:12', null, null);
INSERT INTO `t_prduct_group` VALUES ('10', '1', '657', '567', '567', '675', '2017-08-31 11:39:03', '10001', '2017-08-31 15:27:09', '10001', '0', '0', '567.00', '2', '2017-12-12 12:12:12', '2017-12-12 12:12:12', '100', null);
INSERT INTO `t_prduct_group` VALUES ('11', '1', '435', '53', '345', '54', '2017-08-31 13:31:10', '10001', null, null, '0', '2', '543.00', '4', '2017-12-12 12:12:12', '2017-12-12 12:12:12', null, null);
INSERT INTO `t_prduct_group` VALUES ('12', '7', '100000', '21000', '100000', '100', '2017-08-31 15:28:58', '10001', '2017-08-31 15:57:25', '10001', '1', '2', '10000.00', '2', '2017-12-12 12:12:12', '2017-12-12 12:12:12', '100', null);
INSERT INTO `t_prduct_group` VALUES ('13', '1', '1012', '4545', '4545', '454', '2017-08-31 16:05:56', '10001', '2017-08-31 19:46:45', '10001', '0', '0', '454.00', '1', '2017-10-10 12:12:12', '2017-10-10 12:12:12', '454', null);
INSERT INTO `t_prduct_group` VALUES ('14', '1', '1212', '1212', '2121', '212', '2017-09-01 01:36:48', '10001', null, null, '0', '0', '212.00', '1', '2017-12-12 12:12:12', '2017-12-12 12:12:12', '12', null);
INSERT INTO `t_prduct_group` VALUES ('15', '1', '543', '453', '53', '435', '2017-09-01 17:14:21', '10001', '2017-09-01 17:41:05', '10001', '0', '0', '345.00', '2', '2017-12-12 12:12:12', '2017-12-12 12:12:12', '345', null);
INSERT INTO `t_prduct_group` VALUES ('16', '3', '453', '54354', '34545', '43545', '2017-09-01 17:20:08', '10001', null, null, '0', '0', '345345.00', '5', '2017-12-12 12:12:12', '2017-12-12 12:12:12', '3534', null);
INSERT INTO `t_prduct_group` VALUES ('17', '3', '5435', '4534', '53453', '3454', '2017-09-01 17:20:32', '10001', '2017-09-01 17:40:46', '10001', '1', '0', '354345.00', '53', '2017-12-12 12:12:12', '2017-12-12 12:12:12', '34534', null);
INSERT INTO `t_prduct_group` VALUES ('18', '1', '1245', '453245', '45345', '3453', '2017-09-01 17:21:25', '10001', '2017-09-01 17:40:59', '10001', '0', '0', '3453.00', '1', '2017-12-12 12:12:12', '2017-12-12 12:12:12', '4353', null);
INSERT INTO `t_prduct_group` VALUES ('19', '8', '1000', '1000', '100', '10', '2017-09-01 17:51:08', '10001', null, null, '0', '0', '100.00', '3', '2017-12-12 12:12:12', '2017-12-12 12:12:12', '100', null);
INSERT INTO `t_prduct_group` VALUES ('20', '7', '121212', '121', '1212', '12', '2017-09-01 18:02:00', '10001', '2017-09-04 10:39:30', '10001', '0', '0', '2112.00', '12', '2017-12-12 12:12:12', '2017-12-12 12:12:12', '212', null);

-- ----------------------------
-- Table structure for `t_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL COMMENT '商品名',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `product_img` varchar(255) DEFAULT NULL COMMENT '图片-单张',
  `product_imgs` varchar(512) DEFAULT NULL COMMENT '图片-多图',
  `normal_price` decimal(15,2) DEFAULT NULL COMMENT '原价',
  `cur_price` decimal(15,2) DEFAULT NULL COMMENT '当前价',
  `min_price` decimal(15,2) DEFAULT NULL COMMENT '砍价最低',
  `kan_min` decimal(10,3) DEFAULT NULL,
  `kan_max` decimal(10,3) DEFAULT NULL,
  `product_remain` int(11) DEFAULT NULL COMMENT '库存',
  `product_limit` int(11) DEFAULT NULL COMMENT '每日限额',
  `product_limit_now` int(11) DEFAULT NULL COMMENT '当日仅剩',
  `product_remark` varchar(255) DEFAULT NULL COMMENT '商品备注',
  `hits_count` int(11) DEFAULT '0' COMMENT '查看数量',
  `forward_count` int(11) DEFAULT '0' COMMENT '转发数量',
  `kan_count` int(11) DEFAULT '0' COMMENT '参与砍价人数',
  `product_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `product_start_time` datetime DEFAULT NULL COMMENT '起始时间',
  `product_end_time` datetime DEFAULT NULL COMMENT '截止时间',
  `is_order` bit(1) DEFAULT NULL COMMENT '是否需要预约 1-是 0-否',
  `is_delete` bit(1) DEFAULT b'0' COMMENT '是否删除 1-是 0-否',
  `is_ding` bit(1) DEFAULT b'1' COMMENT '置顶标记字段',
  `label` varchar(255) DEFAULT NULL COMMENT '本商品的标签',
  `tackStatus` tinyint(2) DEFAULT '0' COMMENT '0.不可以使用优惠券 1.可以使用优惠券',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品表';

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('92', 'test-01', '1', 'http://116.62.144.206/static/upload/images/201706/149645895918932046.png', 'http://116.62.144.206/static/upload/images/201706/149645896521093903.png,http://116.62.144.206/static/upload/images/201706/149645896544879445.png', '1.00', '0.01', '0.01', '1.000', '1.000', '0', '5', '5', '', '2', '0', '1', '2017-06-03 11:03:13', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('93', 'test03', '1', 'http://116.62.144.206/static/upload/images/201706/149646094575111294.png', 'http://116.62.144.206/static/upload/images/201706/149646094970556541.png', '0.01', '1.00', '1.00', '0.000', '1.000', '5', '1', '1', '123', '20', '0', '2', '2017-06-03 11:36:41', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('94', '空调清洗', '2', 'http://116.62.144.206/static/upload/images/201706/149646145656512656.jpg', 'http://116.62.144.206/static/upload/images/201706/149646146352940153.jpg', '150.00', '130.00', '1.00', '1.000', '8.000', '10', '1', '1', '', '64', '0', '7', '2017-06-03 11:45:54', '2017-08-01 00:00:00', '2017-08-02 00:00:00', '', '', '', '', '0');
INSERT INTO `t_product` VALUES ('95', '100元会员卡代金券（仅适用于600元档会员卡）', '2', 'http://116.62.144.206/static/upload/images/201706/149646164324654996.jpg', 'http://116.62.144.206/static/upload/images/201706/149646164940347152.jpg', '100.00', '97.00', '1.00', '1.000', '5.000', '10', '1', '1', '', '0', '0', '1', '2017-06-03 11:49:53', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('96', '150元会员卡代金券（仅适用于1100元档会员卡）', '2', 'http://116.62.144.206/static/upload/images/201706/149646184340932774.jpg', 'http://116.62.144.206/static/upload/images/201706/149646186031473832.jpg', '150.00', '146.00', '1.00', '1.000', '7.000', '10', '1', '1', '', '1', '0', '1', '2017-06-03 11:51:26', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('97', '200元会员卡代金券（仅适用于2200元档会员卡）', '2', 'http://116.62.144.206/static/upload/images/201706/149646659180215215.jpg', 'http://116.62.144.206/static/upload/images/201706/149646660824712097.jpg', '200.00', '200.00', '1.00', '1.000', '10.000', '10', '1', '1', '', '1', '0', '0', '2017-06-03 13:10:42', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('98', '300元会员卡代金券（仅适用于5300元档会员卡）', '2', 'http://116.62.144.206/static/upload/images/201706/149646669135379515.jpg', 'http://116.62.144.206/static/upload/images/201706/149646669654685749.jpg', '300.00', '300.00', '1.00', '1.000', '10.000', '10', '1', '1', '', '0', '0', '0', '2017-06-03 13:11:59', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('99', '汽车普洗', '3', 'http://116.62.144.206/static/upload/images/201706/149646680161762942.jpg', 'http://116.62.144.206/static/upload/images/201706/149646681284758631.jpg,http://116.62.144.206/static/upload/images/201706/149646681315091297.jpg', '25.00', '12.00', '1.00', '1.000', '3.000', '30', '1', '1', '', '12', '0', '10', '2017-06-03 13:14:20', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', '', '0');
INSERT INTO `t_product` VALUES ('100', '汽车精洗', '3', 'http://116.62.144.206/static/upload/images/201706/149646689821650071.jpg', 'http://116.62.144.206/static/upload/images/201706/149646690642735439.jpg,http://116.62.144.206/static/upload/images/201706/149646690642831081.jpg', '58.00', '41.04', '1.00', '1.000', '3.000', '15', '1', '1', '', '4', '0', '10', '2017-06-03 13:15:32', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('101', '汽车打蜡', '3', 'http://116.62.144.206/static/upload/images/201706/149646696897936690.jpg', 'http://116.62.144.206/static/upload/images/201706/149646697531789471.jpg,http://116.62.144.206/static/upload/images/201706/149646699816548467.jpg,http://116.62.144.206/static/upload/images/201706/149646700237848302.jpg', '100.00', '67.00', '1.00', '1.000', '5.000', '10', '1', '1', '', '17', '0', '14', '2017-06-03 13:17:06', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('102', '单次镀晶', '3', 'http://116.62.144.206/static/upload/images/201706/149646710432620464.jpg', 'http://116.62.144.206/static/upload/images/201706/149646709255041451.jpg,http://116.62.144.206/static/upload/images/201706/149646709647854092.jpg', '1580.00', '843.00', '1.00', '5.000', '20.000', '3', '1', '1', '', '10', '0', '14', '2017-06-03 13:18:46', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('103', '全年镀晶', '3', 'http://116.62.144.206/static/upload/images/201706/149646714765759099.jpg', 'http://116.62.144.206/static/upload/images/201706/149646715273299215.jpg,http://116.62.144.206/static/upload/images/201706/149646715692868119.jpg,http://116.62.144.206/static/upload/images/201706/149646715696174762.jpg', '2680.00', '976.00', '1.00', '5.000', '30.000', '1', '1', '1', '', '20', '0', '11', '2017-06-03 13:19:45', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('104', '汽车普洗', '4', 'http://116.62.144.206/static/upload/images/201706/149646725887479387.jpg', 'http://116.62.144.206/static/upload/images/201706/149646726732816029.jpg', '48.00', '46.08', '1.00', '1.000', '3.000', '5', '1', '1', '', '2', '0', '1', '2017-06-03 13:21:36', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('105', '汽车精洗', '4', 'http://116.62.144.206/static/upload/images/201706/149646733762087430.jpg', 'http://116.62.144.206/static/upload/images/201706/149646734539193841.jpg,http://116.62.144.206/static/upload/images/201706/149646734597120946.jpg,http://116.62.144.206/static/upload/images/201706/149646734632470009.jpg', '98.00', '97.00', '1.00', '1.000', '3.000', '5', '1', '1', '', '3', '0', '1', '2017-06-03 13:22:46', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('106', '汽车打蜡', '4', 'http://116.62.144.206/static/upload/images/201706/149646739511347090.jpg', 'http://116.62.144.206/static/upload/images/201706/149646740050115439.jpg,http://116.62.144.206/static/upload/images/201706/149646740059726958.jpg,http://116.62.144.206/static/upload/images/201706/149646740097246861.jpg', '80.00', '78.00', '1.00', '1.000', '3.000', '3', '1', '1', '', '1', '0', '1', '2017-06-03 13:23:48', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('107', '单次镀晶', '4', 'http://116.62.144.206/static/upload/images/201706/149646746368283511.jpg', 'http://116.62.144.206/static/upload/images/201706/149646746915974119.jpg,http://116.62.144.206/static/upload/images/201706/149646746922757442.jpg', '1580.00', '1538.00', '1.00', '1.000', '20.000', '1', '1', '1', '', '2', '0', '3', '2017-06-03 13:24:56', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('108', '单次镀晶', '5', 'http://116.62.144.206/static/upload/images/201706/149646772875548639.jpg', 'http://116.62.144.206/static/upload/images/201706/149646773679358627.jpg,http://116.62.144.206/static/upload/images/201706/149646774076973924.jpg', '1580.00', '1573.00', '1.00', '1.000', '20.000', '1', '1', '1', '', '2', '0', '2', '2017-06-03 13:29:23', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('109', '汽车普洗', '10', 'http://116.62.144.206/static/upload/images/201706/149646779200858044.jpg', 'http://116.62.144.206/static/upload/images/201706/149646779648729236.jpg,http://116.62.144.206/static/upload/images/201706/149646779650362341.jpg', '48.00', '44.08', '1.00', '1.000', '3.000', '15', '1', '1', '', '1', '0', '3', '2017-06-03 13:30:13', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('110', '汽车精洗', '10', 'http://116.62.144.206/static/upload/images/201706/149646785324363018.jpg', 'http://116.62.144.206/static/upload/images/201706/149646786030746361.jpg,http://116.62.144.206/static/upload/images/201706/149646786047611176.jpg,http://116.62.144.206/static/upload/images/201706/149646786064080965.jpg', '98.00', '90.00', '1.00', '1.000', '3.000', '10', '1', '1', '', '3', '0', '4', '2017-06-03 13:31:26', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('111', '汽车打蜡', '10', 'http://116.62.144.206/static/upload/images/201706/149646792229698314.jpg', 'http://116.62.144.206/static/upload/images/201706/149646792825519738.jpg,http://116.62.144.206/static/upload/images/201706/149646792848577795.jpg,http://116.62.144.206/static/upload/images/201706/149646792865719292.jpg', '80.00', '72.00', '1.00', '1.000', '4.000', '7', '1', '1', '', '2', '0', '2', '2017-06-03 13:33:36', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('112', '单次镀晶', '10', 'http://116.62.144.206/static/upload/images/201706/149646812512640585.jpg', 'http://116.62.144.206/static/upload/images/201706/149646812992732289.jpg,http://116.62.144.206/static/upload/images/201706/149646812996288874.jpg', '1580.00', '1580.00', '1.00', '1.000', '20.000', '1', '1', '1', '', '0', '0', '0', '2017-06-03 13:35:54', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('113', '全年镀晶', '10', 'http://116.62.144.206/static/upload/images/201706/149646824167478230.jpg', 'http://116.62.144.206/static/upload/images/201706/149646824802140428.jpg,http://116.62.144.206/static/upload/images/201706/149646824823045856.jpg,http://116.62.144.206/static/upload/images/201706/149646824872634285.jpg', '2680.00', '2627.40', '1.00', '1.000', '30.000', '1', '1', '1', '', '0', '0', '1', '2017-06-03 13:38:00', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('114', '汽车普洗', '11', 'http://116.62.144.206/static/upload/images/201706/149646868543788700.jpg', 'http://116.62.144.206/static/upload/images/201706/149646869193610168.jpg,http://116.62.144.206/static/upload/images/201706/149646869226166035.jpg', '48.00', '44.08', '1.00', '1.000', '3.000', '3', '1', '1', '', '1', '0', '3', '2017-06-03 13:45:38', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('115', '汽车精洗', '11', 'http://116.62.144.206/static/upload/images/201706/149646876290789063.jpg', 'http://116.62.144.206/static/upload/images/201706/149646876664021955.jpg,http://116.62.144.206/static/upload/images/201706/149646876710393639.jpg', '98.00', '90.08', '1.00', '1.000', '3.000', '3', '1', '1', '', '3', '0', '3', '2017-06-03 13:46:28', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('116', '汽车打蜡', '11', 'http://116.62.144.206/static/upload/images/201706/149646881780936072.jpg', 'http://116.62.144.206/static/upload/images/201706/149646882283067728.jpg,http://116.62.144.206/static/upload/images/201706/149646882284087622.jpg,http://116.62.144.206/static/upload/images/201706/149646882312063985.jpg', '80.00', '66.80', '1.00', '1.000', '3.000', '1', '1', '1', '', '1', '0', '6', '2017-06-03 13:47:24', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('117', '汽车普洗', '12', 'http://116.62.144.206/static/upload/images/201706/149646888541231665.jpg', 'http://116.62.144.206/static/upload/images/201706/149646889196851259.jpg,http://116.62.144.206/static/upload/images/201706/149646889203890785.jpg', '48.00', '46.00', '1.00', '1.000', '2.000', '5', '1', '1', '', '0', '0', '1', '2017-06-03 13:48:34', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('118', '汽车精洗', '12', 'http://116.62.144.206/static/upload/images/201706/149646894367316581.jpg', 'http://116.62.144.206/static/upload/images/201706/149646894869364665.jpg,http://116.62.144.206/static/upload/images/201706/149646894878842899.jpg', '98.00', '93.08', '1.00', '1.000', '3.000', '4', '1', '1', '', '1', '0', '2', '2017-06-03 13:49:25', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('119', '汽车打蜡', '12', 'http://116.62.144.206/static/upload/images/201706/149646900162546036.jpg', 'http://116.62.144.206/static/upload/images/201706/149646900671724756.jpg,http://116.62.144.206/static/upload/images/201706/149646900688720861.jpg,http://116.62.144.206/static/upload/images/201706/149646900708349360.jpg', '80.00', '77.00', '1.00', '1.000', '3.000', '3', '1', '1', '', '0', '0', '1', '2017-06-03 13:50:24', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('120', '单次镀晶', '12', 'http://116.62.144.206/static/upload/images/201706/149646905094297096.jpg', 'http://116.62.144.206/static/upload/images/201706/149646905525717316.jpg,http://116.62.144.206/static/upload/images/201706/149646905529430189.jpg', '1580.00', '1570.00', '1.00', '1.000', '30.000', '1', '1', '1', '', '0', '0', '1', '2017-06-03 13:51:12', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('121', '汽车普洗', '13', 'http://116.62.144.206/static/upload/images/201706/149646910938577987.jpg', 'http://116.62.144.206/static/upload/images/201706/149646911397835207.jpg,http://116.62.144.206/static/upload/images/201706/149646911433462267.jpg', '48.00', '45.00', '1.00', '1.000', '3.000', '10', '1', '1', '', '0', '0', '1', '2017-06-03 13:52:18', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('122', '汽车精洗', '13', 'http://116.62.144.206/static/upload/images/201706/149646949451012112.jpg', 'http://116.62.144.206/static/upload/images/201706/149646949823465754.jpg', '98.00', '95.00', '1.00', '1.000', '5.000', '6', '1', '1', '', '1', '0', '1', '2017-06-03 13:58:40', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('123', '汽车打蜡', '13', 'http://116.62.144.206/static/upload/images/201706/149646958665543081.jpg', 'http://116.62.144.206/static/upload/images/201706/149646959154457186.jpg,http://116.62.144.206/static/upload/images/201706/149646959162138795.jpg,http://116.62.144.206/static/upload/images/201706/149646959162194855.jpg', '80.00', '74.80', '1.00', '1.000', '3.000', '5', '1', '1', '', '1', '0', '2', '2017-06-03 14:00:11', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('124', '单次镀晶', '13', 'http://116.62.144.206/static/upload/images/201706/149646963025059871.jpg', 'http://116.62.144.206/static/upload/images/201706/149646963415795124.jpg,http://116.62.144.206/static/upload/images/201706/149646963418134350.jpg', '1580.00', '1508.40', '1.00', '1.000', '20.000', '2', '1', '1', '', '2', '0', '5', '2017-06-03 14:00:59', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('125', '全年镀晶', '13', 'http://116.62.144.206/static/upload/images/201706/149646969457496493.jpg', 'http://116.62.144.206/static/upload/images/201706/149646969920457508.jpg,http://116.62.144.206/static/upload/images/201706/149646969931283585.jpg,http://116.62.144.206/static/upload/images/201706/149646969976325499.jpg', '2680.00', '2576.00', '1.00', '1.000', '30.000', '1', '1', '1', '', '1', '0', '4', '2017-06-03 14:02:09', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('126', '汽车普洗', '14', 'http://116.62.144.206/static/upload/images/201706/149646975766515970.jpg', 'http://116.62.144.206/static/upload/images/201706/149646976197172630.jpg,http://116.62.144.206/static/upload/images/201706/149646976205346996.jpg', '48.00', '47.00', '1.00', '1.000', '3.000', '2', '1', '1', '', '0', '0', '1', '2017-06-03 14:03:01', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('127', '汽车精洗', '14', 'http://116.62.144.206/static/upload/images/201706/149646980002362878.jpg', 'http://116.62.144.206/static/upload/images/201706/149646980402335721.jpg', '98.00', '96.00', '1.00', '1.000', '3.000', '2', '1', '1', '', '2', '0', '1', '2017-06-03 14:03:41', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('128', '汽车打蜡', '14', 'http://116.62.144.206/static/upload/images/201706/149646983894833472.jpg', 'http://116.62.144.206/static/upload/images/201706/149646984451011817.jpg,http://116.62.144.206/static/upload/images/201706/149646984456727032.jpg,http://116.62.144.206/static/upload/images/201706/149646984496879727.jpg', '80.00', '78.00', '1.00', '1.000', '3.000', '1', '1', '1', '', '1', '0', '1', '2017-06-03 14:04:28', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('129', '汽车普洗', '15', 'http://116.62.144.206/static/upload/images/201706/149647121025964580.jpg', 'http://116.62.144.206/static/upload/images/201706/149647121479512887.jpg,http://116.62.144.206/static/upload/images/201706/149647121480858073.jpg', '40.00', '37.00', '1.00', '1.000', '3.000', '14', '1', '1', '', '0', '0', '2', '2017-06-03 14:27:11', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('130', '四轮充氮', '15', 'http://116.62.144.206/static/upload/images/201706/149647125619364835.jpg', 'http://116.62.144.206/static/upload/images/201706/149647126092048897.jpg,http://116.62.144.206/static/upload/images/201706/149647126135894849.jpg', '80.00', '72.00', '1.00', '1.000', '3.000', '1', '1', '1', '', '0', '0', '3', '2017-06-03 14:28:10', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('131', '四轮定位', '15', 'http://116.62.144.206/static/upload/images/201706/149647130661046567.jpg', 'http://116.62.144.206/static/upload/images/201706/149647131245856047.jpg,http://116.62.144.206/static/upload/images/201706/149647131247819737.jpg', '120.00', '120.00', '1.00', '1.000', '4.000', '1', '1', '1', '', '1', '0', '0', '2017-06-03 14:28:56', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('132', '刹车系统养护', '15', 'http://116.62.144.206/static/upload/images/201706/149647136219864776.jpg', 'http://116.62.144.206/static/upload/images/201706/149647136925620677.jpg,http://116.62.144.206/static/upload/images/201706/149647136927381348.jpg', '298.00', '290.00', '1.00', '1.000', '10.000', '1', '1', '1', '', '4', '0', '2', '2017-06-03 14:29:49', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('133', '汽车普洗', '16', 'http://116.62.144.206/static/upload/images/201706/149647141451737184.jpg', 'http://116.62.144.206/static/upload/images/201706/149647142040518971.jpg,http://116.62.144.206/static/upload/images/201706/149647142040848130.jpg', '40.00', '40.00', '1.00', '1.000', '2.000', '14', '1', '1', '', '0', '0', '0', '2017-06-03 14:30:48', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('134', '四轮充氮', '16', 'http://116.62.144.206/static/upload/images/201706/149647148379743677.jpg', 'http://116.62.144.206/static/upload/images/201706/149647148878362564.jpg,http://116.62.144.206/static/upload/images/201706/149647148893181935.jpg', '80.00', '80.00', '1.00', '1.000', '3.000', '2', '1', '1', '', '0', '0', '0', '2017-06-03 14:31:47', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('135', '四轮定位', '16', 'http://116.62.144.206/static/upload/images/201706/149647152512383790.jpg', 'http://116.62.144.206/static/upload/images/201706/149647152953965145.jpg,http://116.62.144.206/static/upload/images/201706/149647152993293034.jpg', '120.00', '120.00', '1.00', '1.000', '5.000', '1', '1', '1', '', '0', '0', '0', '2017-06-03 14:33:00', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('136', '刹车系统养护', '16', 'http://116.62.144.206/static/upload/images/201706/149647159840427430.jpg', 'http://116.62.144.206/static/upload/images/201706/149647160264560223.jpg,http://116.62.144.206/static/upload/images/201706/149647160269861581.jpg', '298.00', '298.00', '298.00', '1.000', '10.000', '1', '1', '1', '', '0', '0', '0', '2017-06-03 14:33:46', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('137', 'test02', '1', 'http://116.62.144.206/static/upload/images/201706/149647182006114941.jpg', 'http://116.62.144.206/static/upload/images/201706/149647182370423872.jpg', '0.01', '0.01', '0.01', '0.000', '1.000', '0', '100', '100', '', '6', '0', '0', '2017-06-03 14:37:35', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('138', 'test04', '1', 'http://116.62.144.206/static/upload/images/201706/149647451349226744.png', 'http://116.62.144.206/static/upload/images/201706/149647451721961017.png', '0.01', '0.01', '1.00', '0.000', '1.000', '0', '100', '100', '1', '11', '0', '0', '2017-06-03 15:22:00', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('139', 'test05', '1', 'http://116.62.144.206/static/upload/images/201706/149647535520089457.png', 'http://116.62.144.206/static/upload/images/201706/149647535892833929.png', '0.01', '0.01', '0.01', '0.000', '1.000', '0', '1', '1', '', '6', '0', '0', '2017-06-03 15:36:25', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('140', '汽车普洗', '17', 'http://116.62.144.206/static/upload/images/201706/149647590201240018.jpg', 'http://116.62.144.206/static/upload/images/201706/149647590614175514.jpg,http://116.62.144.206/static/upload/images/201706/149647590616436420.jpg', '40.00', '40.00', '1.00', '1.000', '2.000', '14', '1', '1', '', '0', '0', '0', '2017-06-03 15:45:28', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('141', '四轮充氮', '17', 'http://116.62.144.206/static/upload/images/201706/149647595456098485.jpg', 'http://116.62.144.206/static/upload/images/201706/149647595900043355.jpg,http://116.62.144.206/static/upload/images/201706/149647595945777382.jpg', '80.00', '80.00', '1.00', '1.000', '3.000', '1', '1', '1', '', '0', '0', '0', '2017-06-03 15:46:17', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('142', '四轮定位', '17', 'http://116.62.144.206/static/upload/images/201706/149647599676348216.jpg', 'http://116.62.144.206/static/upload/images/201706/149647600079019992.jpg,http://116.62.144.206/static/upload/images/201706/149647600779717537.jpg', '120.00', '120.00', '1.00', '1.000', '3.000', '1', '1', '1', '', '1', '0', '0', '2017-06-03 15:47:08', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('143', '刹车系统养护', '17', 'http://116.62.144.206/static/upload/images/201706/149647676740183302.jpg', 'http://116.62.144.206/static/upload/images/201706/149647677259667402.jpg,http://116.62.144.206/static/upload/images/201706/149647677261740027.jpg', '298.00', '284.00', '1.00', '1.000', '20.000', '1', '1', '1', '', '0', '0', '1', '2017-06-03 15:59:51', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('144', '汽车普洗', '18', 'http://116.62.144.206/static/upload/images/201706/149647681848324107.jpg', 'http://116.62.144.206/static/upload/images/201706/149647682246877516.jpg,http://116.62.144.206/static/upload/images/201706/149647682250798926.jpg', '40.00', '34.40', '1.00', '1.000', '3.000', '15', '1', '1', '', '0', '0', '3', '2017-06-03 16:00:43', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('145', '四轮充氮', '18', 'http://116.62.144.206/static/upload/images/201706/149647691524776878.jpg', 'http://116.62.144.206/static/upload/images/201706/149647691934099905.jpg,http://116.62.144.206/static/upload/images/201706/149647691969182967.jpg', '80.00', '72.00', '1.00', '1.000', '3.000', '2', '1', '1', '', '1', '0', '3', '2017-06-03 16:02:14', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('146', '四轮定位', '18', 'http://116.62.144.206/static/upload/images/201706/149647696380073716.jpg', 'http://116.62.144.206/static/upload/images/201706/149647696783551754.jpg,http://116.62.144.206/static/upload/images/201706/149647696816085171.jpg', '120.00', '113.00', '1.00', '1.000', '4.000', '1', '1', '1', '', '1', '0', '2', '2017-06-03 16:03:11', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('147', '刹车系统养护', '18', 'http://116.62.144.206/static/upload/images/201706/149647701779263747.jpg', 'http://116.62.144.206/static/upload/images/201706/149647702180883067.jpg,http://116.62.144.206/static/upload/images/201706/149647702181636059.jpg', '298.00', '283.00', '1.00', '1.000', '20.000', '1', '1', '1', '', '2', '0', '1', '2017-06-03 16:03:59', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('148', '汽车镀膜', '18', 'http://116.62.144.206/static/upload/images/201706/149647719696566573.jpg', 'http://116.62.144.206/static/upload/images/201706/149647720111820939.jpg,http://116.62.144.206/static/upload/images/201706/149647720157231197.jpg', '980.00', '944.00', '1.00', '1.000', '20.000', '1', '1', '1', '', '0', '0', '3', '2017-06-03 16:06:59', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('149', '汽车普洗', '19', 'http://116.62.144.206/static/upload/images/201706/149647728325861627.jpg', 'http://116.62.144.206/static/upload/images/201706/149647728684479465.jpg,http://116.62.144.206/static/upload/images/201706/149647728688530362.jpg', '40.00', '36.00', '1.00', '1.000', '2.000', '15', '1', '1', '', '1', '0', '3', '2017-06-03 16:08:26', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('150', '四轮充氮', '19', 'http://116.62.144.206/static/upload/images/201706/149647733209818320.jpg', 'http://116.62.144.206/static/upload/images/201706/149647733714564881.jpg,http://116.62.144.206/static/upload/images/201706/149647733719122528.jpg', '80.00', '76.00', '1.00', '1.000', '3.000', '2', '1', '1', '', '4', '0', '2', '2017-06-03 16:09:18', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('151', '四轮定位', '19', 'http://116.62.144.206/static/upload/images/201706/149647737340952178.jpg', 'http://116.62.144.206/static/upload/images/201706/149647737762063577.jpg,http://116.62.144.206/static/upload/images/201706/149647737767453640.jpg', '120.00', '117.60', '1.00', '1.000', '3.000', '1', '1', '1', '', '0', '0', '2', '2017-06-03 16:10:04', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('152', '刹车系统养护', '19', 'http://116.62.144.206/static/upload/images/201706/149647742306533999.jpg', 'http://116.62.144.206/static/upload/images/201706/149647742675977521.jpg,http://116.62.144.206/static/upload/images/201706/149647742693173052.jpg', '298.00', '275.00', '1.00', '1.000', '20.000', '1', '1', '1', '', '3', '0', '3', '2017-06-03 16:10:41', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('153', '汽车普洗', '20', 'http://116.62.144.206/static/upload/images/201706/149647746380640508.jpg', 'http://116.62.144.206/static/upload/images/201706/149647746805556467.jpg,http://116.62.144.206/static/upload/images/201706/149647746807763656.jpg', '40.00', '36.00', '1.00', '1.000', '2.000', '14', '1', '1', '', '0', '0', '2', '2017-06-03 16:11:28', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('154', '四轮充氮', '20', 'http://116.62.144.206/static/upload/images/201706/149647751437978604.jpg', 'http://116.62.144.206/static/upload/images/201706/149647751935441994.jpg,http://116.62.144.206/static/upload/images/201706/149647751947672864.jpg', '80.00', '79.00', '1.00', '1.000', '3.000', '1', '1', '1', '', '0', '0', '1', '2017-06-03 16:12:19', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('155', '四轮定位', '20', 'http://116.62.144.206/static/upload/images/201706/149647756632845818.jpg', 'http://116.62.144.206/static/upload/images/201706/149647757013276482.jpg,http://116.62.144.206/static/upload/images/201706/149647757016653079.jpg', '120.00', '114.00', '1.00', '1.000', '3.000', '1', '1', '1', '', '1', '0', '2', '2017-06-03 16:13:11', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('156', '汽车普洗', '21', 'http://116.62.144.206/static/upload/images/201706/149647761916879740.jpg', 'http://116.62.144.206/static/upload/images/201706/149647762260020827.jpg,http://116.62.144.206/static/upload/images/201706/149647762290480869.jpg', '40.00', '40.00', '1.00', '1.000', '2.000', '14', '1', '1', '', '0', '0', '0', '2017-06-03 16:14:06', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('157', '四轮充氮', '21', 'http://116.62.144.206/static/upload/images/201706/149647766948395142.jpg', 'http://116.62.144.206/static/upload/images/201706/149647767903194889.jpg,http://116.62.144.206/static/upload/images/201706/149647767913146340.jpg', '80.00', '80.00', '1.00', '1.000', '3.000', '1', '1', '1', '', '0', '0', '0', '2017-06-03 16:14:59', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('158', '四轮定位', '21', 'http://116.62.144.206/static/upload/images/201706/149647771582187810.jpg', 'http://116.62.144.206/static/upload/images/201706/149647772513067525.jpg,http://116.62.144.206/static/upload/images/201706/149647772555015544.jpg', '120.00', '120.00', '1.00', '1.000', '3.000', '1', '1', '1', '', '1', '0', '0', '2017-06-03 16:15:38', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('159', '免擦拭无划痕洗车', '22', 'http://116.62.144.206/static/upload/images/201706/149647779699065005.jpg', 'http://116.62.144.206/static/upload/images/201706/149647780222046558.jpg,http://116.62.144.206/static/upload/images/201706/149647780233068973.jpg', '1066.00', '1066.00', '1.00', '1.000', '20.000', '20', '1', '1', '', '0', '0', '0', '2017-06-03 16:17:31', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('160', '套餐A（精致内饰清洗、漆面去渍增光养护、发动机精洗镀膜、车内香薰、轮毂清洗除锈）', '22', 'http://116.62.144.206/static/upload/images/201706/149647789476245644.jpg', 'http://116.62.144.206/static/upload/images/201706/149647790373618629.jpg,http://116.62.144.206/static/upload/images/201706/149647790387410724.jpg,http://116.62.144.206/static/upload/images/201706/149647790402535451.jpg,http://116.62.144.206/static/upload/images/201706/149647790404463355.jpg,http://116.62.144.206/static/upload/images/201706/149647791782231426.jpg', '1066.00', '1066.00', '1.00', '1.000', '30.000', '2', '1', '1', '', '1', '0', '0', '2017-06-03 16:19:05', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('161', '套餐B（发动机进气系统清洗、发动机燃烧室清洗、发动机喷油嘴清洗、发动机三元催化清洗。', '22', 'http://116.62.144.206/static/upload/images/201706/149647798119381513.jpg', 'http://116.62.144.206/static/upload/images/201706/149647800498537458.jpg,http://116.62.144.206/static/upload/images/201706/149647800533234859.jpg', '1240.00', '1240.00', '1.00', '1.000', '30.000', '1', '1', '1', '', '4', '0', '0', '2017-06-03 16:20:33', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('162', '免擦拭无划痕洗车', '23', 'http://116.62.144.206/static/upload/images/201706/149647806055856302.jpg', 'http://116.62.144.206/static/upload/images/201706/149647806504937404.jpg,http://116.62.144.206/static/upload/images/201706/149647807532844720.jpg', '1066.00', '1066.00', '15.00', '1.000', '30.000', '15', '1', '1', '', '1', '0', '0', '2017-06-03 16:21:44', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('163', '套餐A（精致内饰清洗、漆面去渍增光养护、发动机精洗镀膜、车内香薰、轮毂清洗除锈）', '23', 'http://116.62.144.206/static/upload/images/201706/149647813058171530.jpg', 'http://116.62.144.206/static/upload/images/201706/149647813765527007.jpg,http://116.62.144.206/static/upload/images/201706/149647814114334071.jpg,http://116.62.144.206/static/upload/images/201706/149647814127684580.jpg,http://116.62.144.206/static/upload/images/201706/149647814142642333.jpg,http://116.62.144.206/static/upload/images/201706/149647814158382211.jpg', '1066.00', '1066.00', '1.00', '1.000', '30.000', '1', '1', '1', '', '2', '0', '0', '2017-06-03 16:22:42', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('164', '套餐B（发动机进气系统清洗、发动机燃烧室清洗、发动机喷油嘴清洗、发动机三元催化清洗）', '23', 'http://116.62.144.206/static/upload/images/201706/149647818265129935.jpg', 'http://116.62.144.206/static/upload/images/201706/149647818757664893.jpg,http://116.62.144.206/static/upload/images/201706/149647819328897707.jpg', '1240.00', '1240.00', '1.00', '1.000', '30.000', '1', '1', '1', '', '4', '0', '0', '2017-06-03 16:23:35', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('165', '爆款眼镜', '24', 'http://116.62.144.206/static/upload/images/201706/149647830507954512.jpg', 'http://116.62.144.206/static/upload/images/201706/149647831008793590.jpg,http://116.62.144.206/static/upload/images/201706/149647831013690773.jpg,http://116.62.144.206/static/upload/images/201706/149647831028624940.jpg,http://116.62.144.206/static/upload/images/201706/149647831042772326.jpg,http://116.62.144.206/static/upload/images/201706/149647831070949304.jpg', '100.00', '66.00', '1.00', '1.000', '2.000', '100', '3', '3', '款式多多，时尚的选择', '43', '0', '26', '2017-06-03 16:25:49', '2017-06-03 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('166', 'test06', '1', 'http://116.62.144.206/static/upload/images/201706/149671328391958061.png', 'http://116.62.144.206/static/upload/images/201706/149671328834419260.png', '0.01', '0.01', '0.01', '0.000', '1.000', '0', '50', '50', '', '3', '0', '0', '2017-06-06 09:42:04', '2017-06-06 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('167', '汽车普洗', '25', 'http://116.62.144.206/static/upload/images/201706/149672017396397871.jpg', 'http://116.62.144.206/static/upload/images/201706/149672018740475768.jpg,http://116.62.144.206/static/upload/images/201706/149672019737820384.jpg', '25.00', '25.00', '1.00', '1.000', '2.000', '30', '1', '1', '', '0', '0', '0', '2017-06-06 11:37:13', '2017-06-06 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('168', '汽车打蜡', '25', 'http://116.62.144.206/static/upload/images/201706/149673122160238359.jpg', 'http://116.62.144.206/static/upload/images/201706/149673123412233189.jpg,http://116.62.144.206/static/upload/images/201706/149673123446748032.jpg,http://116.62.144.206/static/upload/images/201706/149673123519970975.jpg', '58.00', '55.00', '1.00', '1.000', '3.000', '15', '1', '1', '', '0', '0', '2', '2017-06-06 14:41:04', '2017-06-06 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('169', '汽车镀膜', '25', 'http://116.62.144.206/static/upload/images/201706/149673134101669095.jpg', 'http://116.62.144.206/static/upload/images/201706/149673134763574642.jpg,http://116.62.144.206/static/upload/images/201706/149673134779075480.jpg', '980.00', '950.00', '3.00', '1.000', '30.000', '3', '1', '1', '', '2', '0', '1', '2017-06-06 14:57:16', '2017-06-06 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('170', '单次镀晶', '25', 'http://116.62.144.206/static/upload/images/201706/149673233719561948.jpg', 'http://116.62.144.206/static/upload/images/201706/149673234295698032.jpg,http://116.62.144.206/static/upload/images/201706/149673234341011880.jpg,http://116.62.144.206/static/upload/images/201706/149673234377018342.jpg', '1580.00', '1507.00', '1.00', '1.000', '50.000', '1', '1', '1', '', '1', '0', '3', '2017-06-06 14:59:40', '2017-06-06 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('171', '四轮定位', '25', 'http://116.62.144.206/static/upload/images/201706/149673242644630432.jpg', 'http://116.62.144.206/static/upload/images/201706/149673243580319740.jpg,http://116.62.144.206/static/upload/images/201706/149673244301595807.jpg', '150.00', '141.00', '1.00', '1.000', '10.000', '10', '1', '1', '', '1', '0', '2', '2017-06-06 15:02:18', '2017-06-06 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('172', '抛光打蜡', '25', 'http://116.62.144.206/static/upload/images/201706/149673257480310539.jpg', 'http://116.62.144.206/static/upload/images/201706/149673257900857834.jpg,http://116.62.144.206/static/upload/images/201706/149673257967441640.jpg', '350.00', '323.00', '1.00', '1.000', '20.000', '2', '1', '1', '', '0', '0', '3', '2017-06-06 15:03:43', '2017-06-06 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('173', '单面做漆', '25', 'http://116.62.144.206/static/upload/images/201706/149673266601193255.jpg', 'http://116.62.144.206/static/upload/images/201706/149673267072918980.jpg', '350.00', '348.00', '1.00', '1.000', '20.000', '5', '1', '1', '', '0', '0', '1', '2017-06-06 15:05:02', '2017-06-06 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('174', '汽车普洗', '26', 'http://116.62.144.206/static/upload/images/201706/149679900119136321.jpg', 'http://116.62.144.206/static/upload/images/201706/149679900781830488.jpg,http://116.62.144.206/static/upload/images/201706/149679900948387514.jpg', '35.00', '35.00', '1.00', '1.000', '3.000', '50', '2', '2', '', '0', '0', '0', '2017-06-07 09:30:38', '2017-06-07 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('175', '汽车精洗', '26', 'http://116.62.144.206/static/upload/images/201706/149679905879259265.jpg', 'http://116.62.144.206/static/upload/images/201706/149679906803570515.jpg,http://116.62.144.206/static/upload/images/201706/149679906858090545.jpg', '68.00', '68.00', '1.00', '1.000', '3.000', '20', '1', '1', '', '0', '0', '0', '2017-06-07 09:31:36', '2017-06-07 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('176', '汽车打蜡', '26', 'http://116.62.144.206/static/upload/images/201706/149679911738127566.jpg', 'http://116.62.144.206/static/upload/images/201706/149679912315887102.jpg,http://116.62.144.206/static/upload/images/201706/149679912327281036.jpg,http://116.62.144.206/static/upload/images/201706/149679912364124658.jpg', '200.00', '200.00', '1.00', '1.000', '20.000', '5', '1', '1', '', '0', '0', '0', '2017-06-07 09:32:30', '2017-06-07 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('177', '单次镀晶', '26', 'http://116.62.144.206/static/upload/images/201706/149679917881622111.jpg', 'http://116.62.144.206/static/upload/images/201706/149679919002358006.jpg,http://116.62.144.206/static/upload/images/201706/149679919047810478.jpg', '3980.00', '3980.00', '2.00', '1.000', '50.000', '2', '1', '1', '', '0', '0', '0', '2017-06-07 09:34:22', '2017-06-07 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('178', '四轮定位', '26', 'http://116.62.144.206/static/upload/images/201706/149679931270560176.jpg', 'http://116.62.144.206/static/upload/images/201706/149679932338969803.jpg,http://116.62.144.206/static/upload/images/201706/149679932352948488.jpg', '150.00', '135.00', '1.00', '1.000', '15.000', '5', '1', '1', '', '3', '0', '2', '2017-06-07 09:36:02', '2017-06-07 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('179', '汽车普洗', '27', 'http://116.62.144.206/static/upload/images/201706/149679975966672380.jpg', 'http://116.62.144.206/static/upload/images/201706/149679976481073799.jpg,http://116.62.144.206/static/upload/images/201706/149679976493336574.jpg', '35.00', '48.60', '1.00', '1.000', '3.000', '50', '2', '2', '', '1', '0', '1', '2017-06-07 09:43:13', '2017-06-07 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('180', '汽车精洗', '27', 'http://116.62.144.206/static/upload/images/201706/149680040570126171.jpg', 'http://116.62.144.206/static/upload/images/201706/149680041409013788.jpg,http://116.62.144.206/static/upload/images/201706/149680041454296564.jpg', '68.00', '63.92', '1.00', '1.000', '5.000', '20', '1', '1', '', '0', '0', '1', '2017-06-07 09:53:59', '2017-06-07 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('181', '汽车打蜡', '27', 'http://116.62.144.206/static/upload/images/201706/149680054248264481.jpg', 'http://116.62.144.206/static/upload/images/201706/149680054870062078.jpg,http://116.62.144.206/static/upload/images/201706/149680054893050588.jpg,http://116.62.144.206/static/upload/images/201706/149680054929453086.jpg,http://localhost:8080/static/upload/images/201707/149907751091361446.jpg,http://localhost:8080/static/upload/images/201707/149907752805388054.jpg', '200.00', '200.00', '1.00', '1.000', '10.000', '5', '1', '1', '', '0', '0', '0', '2017-06-07 09:56:09', '2017-06-07 00:00:00', '2017-07-31 00:00:00', '', '', '', null, '0');
INSERT INTO `t_product` VALUES ('182', '单次镀晶', '27', 'http://116.62.144.206/static/upload/images/201706/149680063861378097.jpg', 'http://116.62.144.206/static/upload/images/201706/149680064409420850.jpg,http://116.62.144.206/static/upload/images/201706/149680064457194279.jpg,http://116.62.144.206/static/upload/images/201706/149680064517816552.jpg,http://localhost:8080/static/upload/images/201707/149907744289887092.jpg', '3980.00', '1790.00', '1790.00', '1.000', '1.000', '2', '1', '1', '', '8', '0', '4', '2017-06-07 09:57:49', '2017-08-01 00:00:00', '2017-08-02 00:00:00', '', '', '', '其他', '0');
INSERT INTO `t_product` VALUES ('183', 'test', '27', 'http://localhost:8080/static/upload/images/201707/150002409280771267.jpg', 'http://localhost:8080/static/upload/images/201707/150002409924741785.jpg,http://localhost:8080/static/upload/images/201707/150002409925083224.jpg,http://localhost:8080/static/upload/images/201707/150002409926195377.jpg,http://localhost:8080/static/upload/images/201707/150002409926777471.jpg,http://localhost:8080/static/upload/images/201707/150002409927843130.jpg', '2.00', '2.94', '1.00', '1.000', '2.000', '12', '3', '3', '', '1', '0', '1', '2017-07-14 17:22:18', '2017-07-14 00:00:00', '2017-07-31 00:00:00', '', '', '', '其他', '0');
INSERT INTO `t_product` VALUES ('184', 'xddtest（请不用这条测试）', '27', 'http://localhost:8080/static/upload/images/201707/150025454508833659.jpg', 'http://localhost:8080/static/upload/images/201707/150025455396778061.jpg,http://localhost:8080/static/upload/images/201707/150025455396757685.jpg,http://localhost:8080/static/upload/images/201707/150025455398969541.jpg,http://localhost:8080/static/upload/images/201707/150025455512590992.jpg,http://localhost:8080/static/upload/images/201707/150025455512510040.jpg', '2.00', '2.00', '1.00', '0.000', '0.000', '1', '1', '1', '', '3', '0', '3', '2017-07-17 09:22:53', null, '2017-07-31 00:00:00', '', '', '', '', '0');
INSERT INTO `t_product` VALUES ('185', 'wqr', '27', 'http://localhost:8080/static/upload/images/201707/150025958693240799.jpg', 'http://localhost:8080/static/upload/images/201707/150025959274529327.jpg', '0.01', '1.00', '1.00', '0.010', '0.020', '10', '2', '2', '', '5', '0', '1', '2017-07-17 10:38:25', '2017-07-03 00:00:00', '2017-07-31 00:00:00', '', '', '', '1', '0');
INSERT INTO `t_product` VALUES ('186', '测试0.01', '27', 'http://localhost:8080/static/upload/images/201708/150233000911038366.png', 'http://localhost:8080/static/upload/images/201708/150233001738025314.png', '1.00', '0.01', '0.01', '10.000', '100.000', '1000', '1000', '1000', '', '2', '0', '0', '2017-08-10 09:54:09', '2017-08-10 00:00:00', '2017-08-31 00:00:00', '', '', null, '法国红酒可乐', '0');
INSERT INTO `t_product` VALUES ('187', '银联测试', '27', 'http://localhost:8080/static/upload/images/201708/150233009694288306.png', 'http://localhost:8080/static/upload/images/201708/150233010237835526.png', '10.00', '1.00', '1.00', '100.000', '100.000', '10000', '10000', '10000', '', '18', '0', '1', '2017-08-10 09:55:26', '2017-08-10 00:00:00', '2017-08-31 00:00:00', '', '', null, '法国红酒', '0');

-- ----------------------------
-- Table structure for `t_product_gl`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_gl`;
CREATE TABLE `t_product_gl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `coupon_type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8;

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
INSERT INTO `t_product_gl` VALUES ('161', '133', '12');
INSERT INTO `t_product_gl` VALUES ('162', '134', '12');
INSERT INTO `t_product_gl` VALUES ('163', '135', '12');
INSERT INTO `t_product_gl` VALUES ('164', '136', '12');
INSERT INTO `t_product_gl` VALUES ('165', '114', '12');
INSERT INTO `t_product_gl` VALUES ('166', '115', '12');
INSERT INTO `t_product_gl` VALUES ('167', '116', '12');
INSERT INTO `t_product_gl` VALUES ('168', '121', '12');
INSERT INTO `t_product_gl` VALUES ('169', '122', '12');
INSERT INTO `t_product_gl` VALUES ('170', '123', '12');
INSERT INTO `t_product_gl` VALUES ('171', '124', '12');
INSERT INTO `t_product_gl` VALUES ('172', '125', '12');
INSERT INTO `t_product_gl` VALUES ('173', '121', '48');
INSERT INTO `t_product_gl` VALUES ('174', '122', '48');
INSERT INTO `t_product_gl` VALUES ('175', '123', '48');
INSERT INTO `t_product_gl` VALUES ('176', '124', '48');
INSERT INTO `t_product_gl` VALUES ('177', '125', '48');
INSERT INTO `t_product_gl` VALUES ('178', '144', '48');
INSERT INTO `t_product_gl` VALUES ('179', '145', '48');
INSERT INTO `t_product_gl` VALUES ('180', '146', '48');
INSERT INTO `t_product_gl` VALUES ('181', '147', '48');
INSERT INTO `t_product_gl` VALUES ('182', '148', '48');
INSERT INTO `t_product_gl` VALUES ('199', '153', '11');
INSERT INTO `t_product_gl` VALUES ('200', '154', '11');
INSERT INTO `t_product_gl` VALUES ('201', '155', '11');
INSERT INTO `t_product_gl` VALUES ('202', '92', '11');
INSERT INTO `t_product_gl` VALUES ('203', '93', '11');
INSERT INTO `t_product_gl` VALUES ('204', '137', '11');
INSERT INTO `t_product_gl` VALUES ('205', '138', '11');
INSERT INTO `t_product_gl` VALUES ('206', '139', '11');
INSERT INTO `t_product_gl` VALUES ('207', '166', '11');
INSERT INTO `t_product_gl` VALUES ('208', '104', '11');
INSERT INTO `t_product_gl` VALUES ('209', '105', '11');
INSERT INTO `t_product_gl` VALUES ('210', '106', '11');
INSERT INTO `t_product_gl` VALUES ('211', '107', '11');
INSERT INTO `t_product_gl` VALUES ('212', '94', '11');
INSERT INTO `t_product_gl` VALUES ('213', '95', '11');
INSERT INTO `t_product_gl` VALUES ('214', '96', '11');
INSERT INTO `t_product_gl` VALUES ('215', '97', '11');
INSERT INTO `t_product_gl` VALUES ('216', '98', '11');
INSERT INTO `t_product_gl` VALUES ('217', '99', '11');
INSERT INTO `t_product_gl` VALUES ('218', '100', '11');
INSERT INTO `t_product_gl` VALUES ('219', '101', '11');
INSERT INTO `t_product_gl` VALUES ('220', '102', '11');
INSERT INTO `t_product_gl` VALUES ('221', '103', '11');
INSERT INTO `t_product_gl` VALUES ('222', '129', '1');
INSERT INTO `t_product_gl` VALUES ('223', '130', '1');
INSERT INTO `t_product_gl` VALUES ('224', '131', '1');
INSERT INTO `t_product_gl` VALUES ('225', '132', '1');
INSERT INTO `t_product_gl` VALUES ('226', '153', '1');
INSERT INTO `t_product_gl` VALUES ('227', '154', '1');
INSERT INTO `t_product_gl` VALUES ('228', '155', '1');
INSERT INTO `t_product_gl` VALUES ('229', '159', '1');
INSERT INTO `t_product_gl` VALUES ('230', '160', '1');
INSERT INTO `t_product_gl` VALUES ('231', '161', '1');
INSERT INTO `t_product_gl` VALUES ('232', '162', '1');
INSERT INTO `t_product_gl` VALUES ('233', '163', '1');
INSERT INTO `t_product_gl` VALUES ('234', '164', '1');
INSERT INTO `t_product_gl` VALUES ('235', '153', '37');
INSERT INTO `t_product_gl` VALUES ('236', '154', '37');
INSERT INTO `t_product_gl` VALUES ('237', '155', '37');
INSERT INTO `t_product_gl` VALUES ('238', '149', '37');
INSERT INTO `t_product_gl` VALUES ('239', '150', '37');
INSERT INTO `t_product_gl` VALUES ('240', '151', '37');
INSERT INTO `t_product_gl` VALUES ('241', '152', '37');
INSERT INTO `t_product_gl` VALUES ('242', '133', '37');
INSERT INTO `t_product_gl` VALUES ('243', '134', '37');
INSERT INTO `t_product_gl` VALUES ('244', '135', '37');
INSERT INTO `t_product_gl` VALUES ('245', '136', '37');
INSERT INTO `t_product_gl` VALUES ('246', '129', '37');
INSERT INTO `t_product_gl` VALUES ('247', '130', '37');
INSERT INTO `t_product_gl` VALUES ('248', '131', '37');
INSERT INTO `t_product_gl` VALUES ('249', '132', '37');
INSERT INTO `t_product_gl` VALUES ('250', '144', '37');
INSERT INTO `t_product_gl` VALUES ('251', '145', '37');
INSERT INTO `t_product_gl` VALUES ('252', '146', '37');
INSERT INTO `t_product_gl` VALUES ('253', '147', '37');
INSERT INTO `t_product_gl` VALUES ('254', '148', '37');
INSERT INTO `t_product_gl` VALUES ('265', '121', '13');
INSERT INTO `t_product_gl` VALUES ('266', '122', '13');
INSERT INTO `t_product_gl` VALUES ('267', '123', '13');
INSERT INTO `t_product_gl` VALUES ('268', '124', '13');
INSERT INTO `t_product_gl` VALUES ('269', '125', '13');
INSERT INTO `t_product_gl` VALUES ('270', '151', '13');
INSERT INTO `t_product_gl` VALUES ('271', '152', '13');
INSERT INTO `t_product_gl` VALUES ('272', '159', '13');
INSERT INTO `t_product_gl` VALUES ('273', '160', '13');
INSERT INTO `t_product_gl` VALUES ('274', '161', '13');
INSERT INTO `t_product_gl` VALUES ('275', '140', '13');
INSERT INTO `t_product_gl` VALUES ('276', '141', '13');
INSERT INTO `t_product_gl` VALUES ('277', '142', '13');
INSERT INTO `t_product_gl` VALUES ('278', '143', '13');

-- ----------------------------
-- Table structure for `t_review`
-- ----------------------------
DROP TABLE IF EXISTS `t_review`;
CREATE TABLE `t_review` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `review_star` tinyint(2) DEFAULT NULL COMMENT '星级',
  `review_content` varchar(255) DEFAULT NULL COMMENT '内容',
  `review_images` varchar(1024) DEFAULT NULL COMMENT '图片',
  `review_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `review_zan` int(11) DEFAULT '0' COMMENT '被赞次数',
  `is_delete` bit(1) DEFAULT b'0' COMMENT '状态 1-正常 0-删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品评论';

-- ----------------------------
-- Records of t_review
-- ----------------------------

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(16) DEFAULT NULL COMMENT '用户组名称',
  `role_rights` varchar(1024) DEFAULT NULL COMMENT '权限',
  `role_flag` tinyint(2) DEFAULT '1' COMMENT '是否可编辑 1-可编辑 0-不可编辑',
  `is_delete` bit(1) DEFAULT b'0' COMMENT '是否删除 1-是 0-否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台用户组';

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('10000', '超级管理组', '1,11,111,112,113,12,13,131,2,21,211,22,221,222,223,23,24,25,26,27,271,1055,1056,28,281,3,31,311,32,4,41,411,412,413,1053,42,421,43,431,44,441,442,5,51,53,6,61,611,612,62,621,622,63,631,64,7,71,711,712,72,721,722,73,731,732,10,101,1011,1012,102,1021,1022,1023,1024,103,1031,104,1041,105,1051,1052,67', '0', '');
INSERT INTO `t_role` VALUES ('10001', '技术管理组', '1,11,111,112,113,12,13,131,2,21,211,22,221,222,223,23,24,25,26,27,271,1055,1056,28,281,3,31,311,32,4,41,411,412,413,1053,1054,42,421,43,431,44,441,442,5,51,53,6,61,611,612,62,621,622,63,631,64,7,71,711,712,72,721,722,73,731,732,10,101,1011,1012,102,1021,1022,1023,1024,103,1031,104,1041,105,1051,1052,67,68,69,70', '0', '');
INSERT INTO `t_role` VALUES ('10002', '高敏', '1,11,113,12,13,4,41,42,421,43,5,51,53,7,71,711,712,72,721,722,73,731,732', '1', '');
INSERT INTO `t_role` VALUES ('10003', '姚飞飞', '1,11,113,2,21,211,22,221,222,223,23,24,25,26,27,271,4,41,411,412,413,42,421,43,431,44,441,442,5,51,53,6,61,611,612,62,621,622,7,71,711,712,72,721,722,73,731,732,10,103,1031,104,1041,105,1051,1052', '1', '');
INSERT INTO `t_role` VALUES ('10004', '测试组', null, '1', '');

-- ----------------------------
-- Table structure for `t_sys_model_library`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_model_library`;
CREATE TABLE `t_sys_model_library` (
  `SYS_MODEL_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '车型数据库ID',
  `IMG_URL` varchar(2000) DEFAULT NULL,
  `MODE_ID` varchar(30) DEFAULT NULL COMMENT '车型ID',
  `CJ_NAME` varchar(70) DEFAULT NULL COMMENT '厂家名称',
  `BRAND` varchar(70) DEFAULT NULL COMMENT '品牌',
  `CHEXI` varchar(70) DEFAULT NULL COMMENT '车系',
  `CAR_MODEL` varchar(70) DEFAULT NULL COMMENT '车型',
  `SELL_NAME` varchar(200) DEFAULT NULL COMMENT '销售名称',
  `SELL_EDITION` varchar(70) DEFAULT NULL COMMENT '销售版本',
  `CAR_YEAR` varchar(10) DEFAULT NULL COMMENT '年款',
  `HB_STANDARD` varchar(10) DEFAULT NULL COMMENT '环保标准',
  `CAR_TYPE` varchar(50) DEFAULT NULL COMMENT '车辆类型',
  `CAR_LEVEL` varchar(20) DEFAULT NULL COMMENT '级别',
  `GUIDE_PRICE` varchar(20) DEFAULT NULL COMMENT '指导价格',
  `IPO_YEAR` varchar(10) DEFAULT NULL COMMENT '上市年份',
  `IPO_MONTH` varchar(10) DEFAULT NULL COMMENT '上市月份',
  `PRODUCE_YEAR` varchar(10) DEFAULT '' COMMENT '生产年份',
  `NOPRODUCE_YEAR` varchar(10) DEFAULT NULL COMMENT '停产年份',
  `PRODUCE_STATUS` varchar(10) DEFAULT NULL COMMENT '生产状态',
  `SELL_STATUS` varchar(10) DEFAULT NULL COMMENT '销售状态',
  `COUNTRY` varchar(10) DEFAULT NULL COMMENT '国别',
  `GC_JOINT` varchar(10) DEFAULT NULL COMMENT '国产合资进口',
  `MODEL_CODE` varchar(100) DEFAULT NULL COMMENT '车型代码',
  `ENGINE_MODEL` varchar(50) DEFAULT NULL COMMENT '发动机型号',
  `DISPLACEMENT` varchar(50) DEFAULT NULL COMMENT '气缸容积',
  `DISCHARGE` varchar(50) DEFAULT NULL COMMENT '排量升',
  `JINQI_TYPE` varchar(10) DEFAULT NULL COMMENT '进气形式',
  `FUEL_TYPE` varchar(50) DEFAULT NULL COMMENT '燃油类型',
  `FUEL_NO` varchar(10) DEFAULT NULL COMMENT '燃油标号',
  `MAX_HORSEPOWER` varchar(50) DEFAULT NULL COMMENT '最大马力Ps',
  `MAX_POWER` varchar(50) DEFAULT NULL COMMENT '最大功率值',
  `MAX_POWER_SPEED` varchar(50) DEFAULT NULL COMMENT '最大功率转速',
  `MAX_TORQUE` varchar(20) DEFAULT NULL COMMENT '最大扭矩值',
  `MAX_TORQUE_SPEED` varchar(20) DEFAULT NULL COMMENT '最大扭矩转速',
  `DISPLACEMENT_TYPE` varchar(20) DEFAULT NULL COMMENT '气缸排列形式',
  `DISPLACEMENT_NUMBER` varchar(10) DEFAULT NULL COMMENT '气缸数',
  `MGQM_NUMBER` varchar(10) DEFAULT NULL COMMENT '每缸气门数',
  `SQUEEZING_RATIO` varchar(10) DEFAULT NULL COMMENT '压缩比',
  `SUPPLY_MODE` varchar(30) DEFAULT NULL COMMENT '供油方式',
  `OVERALL_FUEL_CONSUMPTION` varchar(50) DEFAULT NULL COMMENT '综合工况油耗',
  `CITY_FUEL_CONSUMPTION` varchar(50) DEFAULT NULL COMMENT '市区工况油耗',
  `SUBURBS_FUEL_CONSUMPTION` varchar(50) DEFAULT NULL COMMENT '市郊工况油耗',
  `ACCELERATION_TIME` varchar(10) DEFAULT NULL COMMENT '加速时间',
  `MAX_SPEED` varchar(50) DEFAULT NULL COMMENT '最高车速',
  `GEARBOX_TYPE` varchar(70) DEFAULT NULL COMMENT '变速箱类型',
  `GEARBOX_DESCRIBE` varchar(100) DEFAULT NULL COMMENT '变速箱描述',
  `GEAR_NUMBER` varchar(70) DEFAULT NULL COMMENT '档位数',
  `FRONT_BRAKE_TYPE` varchar(70) DEFAULT NULL COMMENT '前制动器类型',
  `BEHIND_BRAKE_TYPE` varchar(70) DEFAULT NULL COMMENT '后制动器类型',
  `FRONT_SUSPENSION_TYPE` varchar(150) DEFAULT NULL COMMENT '前悬挂类型',
  `BEHIND_SUSPENSION_TYPE` varchar(150) DEFAULT NULL COMMENT '后悬挂类型',
  `STEER_MACHINE_TYPE` varchar(70) DEFAULT NULL COMMENT '转向机形式',
  `ASSISTANCE_TYPE` varchar(70) DEFAULT NULL COMMENT '助力类型',
  `MIN_GROUND_CLEARANCE` varchar(70) DEFAULT NULL COMMENT '最小离地间隙',
  `MIN_TURNING_RADIUS` varchar(70) DEFAULT NULL COMMENT '最小转弯半径',
  `ENGINE_POSITION` varchar(70) DEFAULT NULL COMMENT '发动机位置',
  `DRIVING_MEANS` varchar(70) DEFAULT NULL COMMENT '驱动方式',
  `DRIVING_STYLE` varchar(70) DEFAULT NULL COMMENT '驱动形式',
  `BODY_STYLE` varchar(70) DEFAULT NULL COMMENT '车身型式',
  `CAR_LENGTH` varchar(100) DEFAULT NULL COMMENT '高',
  `CAR_WIDTH` varchar(10) DEFAULT NULL COMMENT '宽',
  `CAR_HEIGHT` varchar(10) DEFAULT NULL COMMENT '高',
  `WHEELBASE` varchar(10) DEFAULT NULL COMMENT '轴距',
  `TRACK_FRONT` varchar(10) DEFAULT NULL COMMENT '前轮距',
  `TRACK_REAR` varchar(10) DEFAULT NULL COMMENT '后轮距',
  `LOAD_WEIGHT` varchar(50) DEFAULT NULL COMMENT '整备质量',
  `FULL_LOAD_WEIGHT` varchar(50) DEFAULT NULL COMMENT '满载质量',
  `FLUID_TANK_VOLUME` varchar(50) DEFAULT NULL COMMENT '邮箱容积',
  `LUGGAGE_VOLUME` varchar(100) DEFAULT NULL COMMENT '行李箱容积',
  `DOOR_NUMBER` varchar(10) DEFAULT NULL COMMENT '车门数',
  `SEAT_NUMBER` varchar(100) DEFAULT NULL COMMENT '座位数',
  `FRONT_TIRE_SIZE` varchar(70) DEFAULT NULL COMMENT '前轮胎规格',
  `REAR_TIRE_SIZE` varchar(70) DEFAULT NULL COMMENT '后轮胎规格',
  `FRONT_HUB_SIZE` varchar(70) DEFAULT NULL COMMENT '前轮毂规格',
  `REAR_HUB_SIZE` varchar(70) DEFAULT NULL COMMENT '后轮毂规格',
  `HUB_MATERIAL` varchar(70) DEFAULT NULL COMMENT '轮毂材料',
  `SPARE_TIRE_SIZE` varchar(70) DEFAULT NULL COMMENT '备胎规格',
  `IS_DRIVE_AIRBAG` varchar(10) DEFAULT NULL COMMENT '驾驶座安全气囊',
  `IS_COPILOT_AIRBAG` varchar(10) DEFAULT NULL COMMENT '副驾驶安全气囊',
  `IS_FRONT_SIDEBAG` varchar(10) DEFAULT NULL COMMENT '前排侧气囊',
  `IS_REAR_SIDEBAG` varchar(10) DEFAULT NULL COMMENT '后排侧气囊',
  `IS_FRONT_HEAD_GASBAG` varchar(10) DEFAULT NULL COMMENT '前排头部气囊(气帘)',
  `IS_REAR_HEAD_GASBAG` varchar(10) DEFAULT NULL COMMENT '后排头部气囊(气帘)',
  `IS_KNEE_GASBAG` varchar(10) DEFAULT NULL COMMENT '膝部气囊',
  `IS_TPMS_MACHINE` varchar(10) DEFAULT NULL COMMENT '胎压监测装置',
  `IS_DRIVE_NOTIRE_PRESSURE` varchar(10) DEFAULT NULL COMMENT '零胎压继续行驶',
  `IS_SEAT_BELT_REMIND` varchar(10) DEFAULT NULL COMMENT '安全带未系提示',
  `IS_ISOFIX_CHILDSEAT_JOINT` varchar(10) DEFAULT NULL COMMENT 'ISO FIX儿童座椅接口',
  `IS_LATCH_SEAT_JOINT` varchar(10) DEFAULT NULL COMMENT 'LATCH座椅接口',
  `IS_ENGINE_EAS` varchar(10) DEFAULT NULL COMMENT '发动机电子防盗',
  `IS_CENTRAL_CONTROLLED_LOCK` varchar(10) DEFAULT NULL COMMENT '中控锁',
  `IS_TELECONTROL_KEY` varchar(10) DEFAULT NULL COMMENT '遥控钥匙',
  `IS_NOKEY_START_SYSTEM` varchar(10) DEFAULT NULL COMMENT '无钥匙启动系统',
  `IS_ABS_ANTILOCK` varchar(10) DEFAULT NULL COMMENT 'ABS防抱死',
  `IS_BRAKE_FORCE_DISTRIBUTION` varchar(10) DEFAULT NULL COMMENT '制动力分配(EBD/CBC等)',
  `IS_AUXILIARY_BRAKE` varchar(10) DEFAULT NULL COMMENT '刹车辅助(EBA/BAS/BA等)',
  `IS_TRACTION_CONTROL` varchar(10) DEFAULT NULL COMMENT '牵引力控制(ASR/TCS/TRC等)',
  `IS_VEHICLE_STABILITY_CONTROL` varchar(10) DEFAULT NULL COMMENT '车身稳定控制(ESP/DSC/VSC等)',
  `IS_AUTO_PARK_BRAKE` varchar(10) DEFAULT NULL COMMENT '自动驻车;上坡辅助',
  `IS_BLUFF_DESCENDING` varchar(10) DEFAULT NULL COMMENT '陡坡缓降',
  `IS_VARIABLE_SUSPENSION` varchar(10) DEFAULT NULL COMMENT '可变悬挂',
  `IS_AIR_SUSPENSION` varchar(10) DEFAULT NULL COMMENT '空气悬挂',
  `IS_VARIBALE_STEER_RATIO` varchar(10) DEFAULT NULL COMMENT '可变转向比',
  `IS_PARALLEL_AUXILIARY` varchar(10) DEFAULT NULL COMMENT '并线辅助',
  `IS_ACTIVE_BRAKING` varchar(10) DEFAULT NULL COMMENT '主动刹车',
  `IS_ACTIVE_STEER_SYSTEM` varchar(10) DEFAULT NULL COMMENT '主动转向系统',
  `IS_DERMIS_STEERING_WHEEL` varchar(10) DEFAULT NULL COMMENT '真皮方向盘',
  `IS_WHEEL_UPDOWN_CONTROL` varchar(10) DEFAULT NULL COMMENT '方向盘上下调节',
  `IS_WHEEL_BEHINDAFTER_CONTROL` varchar(10) DEFAULT NULL COMMENT '方向盘前后调节',
  `IS_WHEEL_AUTO_CONTROL` varchar(10) DEFAULT NULL COMMENT '方向盘电动调节',
  `IS_NULTI_FUNCTION_WHEEL` varchar(10) DEFAULT NULL COMMENT '多功能方向盘',
  `IS_WHEEL_SHIFT` varchar(10) DEFAULT NULL COMMENT '方向盘换挡',
  `IS_DERMIS_SEAT` varchar(10) DEFAULT NULL COMMENT '真皮座椅',
  `IS_EXERCISE_SEAT` varchar(10) DEFAULT NULL COMMENT '运动座椅',
  `IS_SEAT_CONTROL_HEIGHT` varchar(10) DEFAULT NULL COMMENT '座椅高低调节',
  `IS_WAIST_SUPPORT_CONTROL` varchar(10) DEFAULT NULL COMMENT '腰部支撑调节',
  `IS_SHOULDER_SUPPORT_CONTROL` varchar(10) DEFAULT NULL COMMENT '肩部支撑调节',
  `IS_DRIVE_SEAT_ECONTROL` varchar(10) DEFAULT NULL COMMENT '驾驶座座椅电动调节',
  `IS_COSEAT_ECONTROL` varchar(10) DEFAULT NULL COMMENT '副驾驶座座椅电动调节',
  `IS_SECONE_SEAT_ANGLE_ADJUST` varchar(10) DEFAULT NULL COMMENT '第二排靠背角度调节',
  `IS_SECONE_SEAT_MOVEMENT` varchar(10) DEFAULT NULL COMMENT '第二排座椅移动',
  `IS_REAR_SEAT_ECONTROL` varchar(10) DEFAULT NULL COMMENT '后排座椅电动调节',
  `IS_ESEAT_MEMORY` varchar(10) DEFAULT NULL COMMENT '电动座椅记忆',
  `IS_FRONT_SEAT_HEATING` varchar(10) DEFAULT NULL COMMENT '前排座椅加热',
  `IS_REAR_SEAT_HEATING` varchar(10) DEFAULT NULL COMMENT '后排座椅加热',
  `IS_SEAT_VENTILATION` varchar(10) DEFAULT NULL COMMENT '座椅通风',
  `IS_SEAT_MASSAGE` varchar(10) DEFAULT NULL COMMENT '座椅按摩',
  `IS_REAR_SEAT_ALL_DROP` varchar(10) DEFAULT NULL COMMENT '后排座椅整体放倒',
  `IS_REAR_SEAT_RATIO_DROP` varchar(10) DEFAULT NULL COMMENT '后排座椅比例放倒',
  `IS_THIRD_SEAT` varchar(10) DEFAULT NULL COMMENT '第三排座椅',
  `IS_FRONT_SEAT_ARMREST` varchar(10) DEFAULT NULL COMMENT '前座中央扶手',
  `IS_REAR_SEAT_ARMREST` varchar(10) DEFAULT NULL COMMENT '后座中央扶手',
  `IS_BACK_CUP_STAND` varchar(10) DEFAULT NULL COMMENT '后排杯架',
  `IS_INSIDE_ATMOSPHERE_LIGHT` varchar(10) DEFAULT NULL COMMENT '车内氛围灯',
  `IS_BACK_SUN_BLIND` varchar(10) DEFAULT NULL COMMENT '后风挡遮阳帘',
  `IS_REAR_SIDE_SUN_BLIND` varchar(10) DEFAULT NULL COMMENT '后排侧遮阳帘',
  `IS_AWNIND_MIRROR` varchar(10) DEFAULT NULL COMMENT '遮阳板化妆镜',
  `IS_POWER_BACK_BOX` varchar(10) DEFAULT NULL COMMENT '电动后备箱',
  `IS_EXERCISE_OUT_SUITE` varchar(10) DEFAULT NULL COMMENT '运动外观套件',
  `IS_ELECTRIC_DOOR` varchar(10) DEFAULT NULL COMMENT '电动吸合门',
  `IS_ELECTRIC_WINDOW` varchar(10) DEFAULT NULL COMMENT '电动天窗',
  `IS_FULL_WINDOW` varchar(10) DEFAULT NULL COMMENT '全景天窗',
  `IS_XENON_LIGHT` varchar(10) DEFAULT NULL COMMENT '氙气大灯',
  `IS_LED_LIGHT` varchar(10) DEFAULT NULL COMMENT 'LED大灯',
  `IS_DAYLIGHT_DRIVE_LIGHT` varchar(10) DEFAULT NULL COMMENT '日间行车灯',
  `IS_AUTO_HEAD_LIGHT` varchar(10) DEFAULT NULL COMMENT '自动头灯',
  `IS_STEER_HEAD_LIGHT` varchar(10) DEFAULT NULL COMMENT '转向头灯',
  `IS_FOG_LAMP` varchar(10) DEFAULT NULL COMMENT '前雾灯',
  `IS_LIGHT_HEIGHT_ADJUST` varchar(10) DEFAULT NULL COMMENT '大灯高度可调',
  `IS_LIGHT_CLEAN_MACHINE` varchar(10) DEFAULT NULL COMMENT '大灯清洗装置',
  `IS_FRONT_ELECTRIC_WINDOW` varchar(10) DEFAULT NULL COMMENT '前电动车窗',
  `IS_REAR_ELECTRIC_WINDOW` varchar(10) DEFAULT NULL COMMENT '后电动车窗',
  `IS_WINDOW_CLAMP_PROOF` varchar(10) DEFAULT NULL COMMENT '车窗防夹手功能',
  `IS_HEAT_INSULATING_GLASS` varchar(10) DEFAULT NULL COMMENT '隔热玻璃',
  `IS_REARVIEW_MIRROR_ADJUST` varchar(10) DEFAULT NULL COMMENT '后视镜电动调节',
  `IS_REARVIEW_MIRROR_HEAT` varchar(10) DEFAULT NULL COMMENT '后视镜加热',
  `IS_REARVIEW_MIRROR_ANTIDAZZLE` varchar(10) DEFAULT NULL COMMENT '后视镜自动防眩目',
  `IS_REARVIEW_MIRROR_EFOLD` varchar(10) DEFAULT NULL COMMENT '后视镜电动折叠',
  `IS_REARVIEW_MIRROR_MEMORY` varchar(10) DEFAULT NULL COMMENT '后视镜记忆',
  `IS_REAR_WIPER` varchar(10) DEFAULT NULL COMMENT '后雨刷',
  `IS_INDUCTION_WIPER` varchar(10) DEFAULT NULL COMMENT '感应雨刷',
  `IS_CRUISE_SPEED` varchar(10) DEFAULT NULL COMMENT '定速巡航',
  `IS_AUXILIARY_PARKING` varchar(10) DEFAULT NULL COMMENT '泊车辅助',
  `IS_REVERSE_VIDEO` varchar(10) DEFAULT NULL COMMENT '倒车视频影像',
  `IS_DRIVE_COMPUTER_DISPLAY` varchar(10) DEFAULT NULL COMMENT '行车电脑显示屏',
  `IS_HUD_NUMBER_DISPLAY` varchar(10) DEFAULT NULL COMMENT 'HUD抬头数字显示',
  `IS_GPS_NAVIGATION` varchar(10) DEFAULT NULL COMMENT 'GPS导航',
  `IS_LOCATE_INTERACTIVE_SERVICE` varchar(10) DEFAULT NULL COMMENT '定位互动服务',
  `IS_CENTRAL_CONTROL_SCREEN` varchar(10) DEFAULT NULL COMMENT '中控台彩色大屏',
  `IS_HUMAN_COMPUTER_SYSTEM` varchar(10) DEFAULT NULL COMMENT '人机交互系统',
  `IS_INSIDE_HARDDISC` varchar(10) DEFAULT NULL COMMENT '内置硬盘',
  `IS_BLUETOOTH_CARPHONE` varchar(10) DEFAULT NULL COMMENT '蓝牙;车载电话',
  `IS_CAR_TV` varchar(10) DEFAULT NULL COMMENT '车载电视',
  `IS_REAR_SCREEN` varchar(10) DEFAULT NULL COMMENT '后排液晶屏',
  `IS_OUT_SOUND_INTERFACE` varchar(10) DEFAULT NULL COMMENT '外接音源接口(AUX/USB/iPod等)',
  `IS_AUDIO_SUPPORT_MP3` varchar(10) DEFAULT NULL COMMENT '音频支持MP3',
  `IS_SINGLE_PLATE_CD` varchar(10) DEFAULT NULL COMMENT '单碟CD',
  `IS_MANY_PLATE_CD` varchar(10) DEFAULT NULL COMMENT '多碟CD',
  `IS_VIRTUAL_MANY_PLATE_CD` varchar(10) DEFAULT NULL COMMENT '虚拟多碟CD',
  `IS_SINGLE_PLATE_DVD` varchar(10) DEFAULT NULL COMMENT '单碟DVD',
  `IS_MANY_PLATE_DVD` varchar(10) DEFAULT NULL COMMENT '多碟DVD',
  `IS_LOUDSPEAKER_NUMBER` varchar(10) DEFAULT NULL COMMENT '扬声器数量',
  `IS_AIR_AONDITIONER` varchar(10) DEFAULT NULL COMMENT '空调',
  `IS_AUTO_AIR_AONDITIONER` varchar(10) DEFAULT NULL COMMENT '自动空调',
  `IS_BACK_AIR_AONDITIONER` varchar(10) DEFAULT NULL COMMENT '后排独立空调',
  `IS_REAR_SEAT_OUTLET` varchar(10) DEFAULT NULL COMMENT '后座出风口',
  `IS_TEMP_DISTRUB_CONTROL` varchar(10) DEFAULT NULL COMMENT '温度分区控制',
  `IS_AIR_CONDICTIONING` varchar(10) DEFAULT NULL COMMENT '空气调节/花粉过滤',
  `IS_CAR_REFRIGERATOR` varchar(10) DEFAULT NULL COMMENT '车载冰箱',
  `IS_AUTOMATIC_PARKING` varchar(10) DEFAULT NULL COMMENT '自动泊车入位',
  `IS_NIGHT_VISION_SYSTEM` varchar(10) DEFAULT NULL COMMENT '夜视系统',
  `IS_CENTRAL_SCREEN_DIVDISPLAY` varchar(10) DEFAULT NULL COMMENT '中控液晶屏分屏显示',
  `IS_ADAPTIVE_CRUISE_CONTROL` varchar(10) DEFAULT NULL COMMENT '自适应巡航',
  `IS_ALLSIDE_CAMERA` varchar(10) DEFAULT NULL COMMENT '全景摄像头',
  `IS_REVERSE_RADAR` varchar(10) DEFAULT NULL COMMENT '倒车雷达',
  `IS_TELEMATICS` varchar(10) DEFAULT NULL COMMENT '车载信息服务',
  `CAR_IDENTIFY_NUMBER` varchar(70) DEFAULT NULL COMMENT '车辆识别码',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '备注',
  `IS_ENABLE` tinyint(4) DEFAULT '1' COMMENT 'ISENABLE',
  `MODIFY_USER` bigint(20) DEFAULT NULL COMMENT 'MODIFYUSER',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT 'CREATEDATE',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT 'CREATEUSER',
  `MODIFY_DATE` datetime DEFAULT NULL COMMENT 'MODIFYDATE',
  `BRAND_CODE` varchar(50) DEFAULT NULL COMMENT '品牌码',
  `FAMILY_CODE` varchar(50) DEFAULT NULL COMMENT '车系码',
  `PRODUCEPTN_CODE` tinyint(1) DEFAULT '0' COMMENT '0:合资,1:国产,2:进口',
  `GEARBOX_TYPE_CODE` tinyint(1) DEFAULT '0' COMMENT '0:未指定,1:手动,2:自动,3:手自一体',
  `FAMILY_CAR` varchar(50) DEFAULT NULL COMMENT '唯一车系码',
  `colour` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`SYS_MODEL_ID`),
  KEY `MODE_ID` (`MODE_ID`) USING BTREE,
  KEY `brand_family` (`BRAND_CODE`,`FAMILY_CODE`) USING BTREE,
  KEY `idx_tsml_chexi` (`CHEXI`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='车型数据库';

-- ----------------------------
-- Records of t_sys_model_library
-- ----------------------------
INSERT INTO `t_sys_model_library` VALUES ('1', 'http://localhost:8080/static/upload/images/201709/150425089559711844.jpg,http://localhost:8080/static/upload/images/201709/150483894720648514.gif,http://localhost:8080/static/upload/images/201709/150483894721462310.jpg,http://localhost:8080/static/upload/images/201709/150483894951856864.gif,http://localhost:8080/static/upload/images/201709/150483894954453862.jpg,http://localhost:8080/static/upload/images/201709/150483895181859194.gif,http://localhost:8080/static/upload/images/201709/150483895182372202.jpg', '10101110101011099', '奇瑞', '奇瑞', 'QQ', '小型车', '奇瑞QQ', '尊享版', '2017', '1', '1', '1', '20000', '2017', '8', '2017', '2019', '未停产   ', '在售', '中国', '国产', '1201201201522151', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'a', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '10001', '2017-08-09 14:45:22', '1', '2017-09-08 10:53:55', '1', '1', '1', '1', '1', '白');
INSERT INTO `t_sys_model_library` VALUES ('3', 'http://localhost:8080/static/upload/images/201709/150483958060520762.jpg', '1010101010101', '五菱宏光', '五菱宏光', '中型车', '面包车', '五菱宏光', '至尊版', '2017', '1', '1', '1', '20000', '2017', '8', '2017', '2019', '未停产', '在售', '中国', '国产', '101012101010', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '11', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '11', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '11', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '10001', '2017-08-08 15:01:58', '10001', '2017-09-08 10:59:46', '1', '1', '1', '1', '1', '至尊灰');
INSERT INTO `t_sys_model_library` VALUES ('4', 'http://localhost:8080/static/upload/images/201708/150399199526773760.jpg', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '11', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '11', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '11', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '10001', '2017-08-08 15:01:58', null, '2017-08-30 17:43:49', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_sys_model_library` VALUES ('5', 'http://localhost:8080/static/upload/images/201709/150484008437124337.jpg,http://localhost:8080/static/upload/images/201709/150484009044793751.jpg', '2151451452658778569', '1', '似的发射点', '似的发射点', '范德萨发生', '电风扇电风扇', '大师傅似的', '2018', '1', '1', '1', '1000', '2017', '6', '2017', '122', '似的发射点', '似的发射点', '士大夫', '1', '似的发射点', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '11', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '11', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '11', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '10001', '2017-08-29 15:27:11', '10001', '2017-09-08 11:08:17', '1', '1', '1', '1', '1', '似的发射点');
INSERT INTO `t_sys_model_library` VALUES ('7', 'http://localhost:8080/static/upload/images/201708/150414465345516182.jpg', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '22', '2', '2', '22', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '22', '2', '2', '2', '2', '2', '22', '2', '22', '2', '2', '2', '2', '2', '2', '2', '2', null, '222', '2', null, '2', '2', '2', '22', '2', '2', '2', '2', '2', '2', '2', '2', '22', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '22', '2', '22', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '22', '2', '2', '2', '2', '2', '2', '2', '22', '2', '2', '2', '2', '22', '2', '2', '2', '2', '2', '2', '22', '2', '2', '2', '2', '2', '2', '2', '2', '22', '2', '22', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '22', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '22', '2', '2', '2', '2', '2', '22', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', null, '2017-08-31 09:59:16', '10001', null, '2', '2', '2', '2', '2', '2');
INSERT INTO `t_sys_model_library` VALUES ('8', 'http://localhost:8080/static/upload/images/201709/150425931105654842.jpg', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '11', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '11', '1', '1', '1', '11', '1', '1', '1', '1', '1', '1', '1', '11', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '11', '1', '1', '1', '1', '1', '1', '11', '1', '1', '1', '1', '11', '1', '1', '1', '1', '1', '1', '11', '1', '1', '1', '1', '11', '1', '1', '1', '1', '11', '1', '1', '1', '11', '1', '1', '1', '1', '11', '1', '1', '1', '1', '1', '1', '11', '1', '1', '1', '11', '1', '1', '1', '1', '11', '1', '1', '1', '1', '11', '1', '1', '1', '1', '11', '1', '1', '11', '1', '1', '1', '11', '1', '1', '1', '11', '1', '1', '1', '1', '11', '1', '1', '1', '1', '11', '1', '1', '1', '11', '1', '1', '1', '1', '11', '1', '1', '1', '1', '11', '1', '1', '11', '1', '1', '1', '1', '11', '1', '1', '1', '11', '1', '1', '1', '11', '1', '1', '1', '1', '1', '11', '1', '1', '1', '1', '1', '1', '1', '1', '11', '1', '1', '11', '1', '1', null, '2017-09-01 17:50:39', '10001', null, '1', '11', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(32) DEFAULT NULL COMMENT '用户名',
  `user_phone` varchar(16) DEFAULT NULL COMMENT '手机号',
  `account_money` decimal(15,2) DEFAULT '0.00' COMMENT '账户金额',
  `score` int(11) DEFAULT '0' COMMENT '成长值',
  `grade` tinyint(4) DEFAULT '1' COMMENT '用户等级 1-注册会员 2-铜牌 3-银牌 4-金牌 5-钻石',
  `user_password` varchar(32) DEFAULT NULL COMMENT '密码',
  `pay_password` varchar(32) DEFAULT NULL COMMENT '支付密码',
  `user_avatar` varchar(128) DEFAULT NULL COMMENT '头像',
  `user_create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `user_login_time` datetime DEFAULT NULL COMMENT '最近登陆时间',
  `is_delete` bit(1) DEFAULT b'0' COMMENT '是否删除 1-是 0-否(默认)',
  `reg_id` varchar(64) DEFAULT NULL,
  `qq_id` varchar(64) DEFAULT NULL,
  `wx_id` varchar(64) DEFAULT NULL,
  `sina_id` varchar(64) DEFAULT NULL,
  `inviterNum` int(5) DEFAULT '0' COMMENT '邀请数量',
  `inviterId` int(20) DEFAULT NULL COMMENT '邀请人ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_user_phone` (`user_phone`),
  UNIQUE KEY `t_user_reg_id` (`reg_id`),
  UNIQUE KEY `t_user_qq_id` (`qq_id`),
  UNIQUE KEY `t_user_wx_id` (`wx_id`),
  UNIQUE KEY `t_user_sina_id` (`sina_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10165 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('10155', null, '18519202023', '5.00', '25', '1', null, null, null, '2017-08-01 17:27:03', '2017-08-10 14:30:00', '', null, null, null, null, '0', '0');
INSERT INTO `t_user` VALUES ('10156', null, '13665552312', '5.00', '40', '1', '868b62e9a12f273b732cef772f447010', null, null, '2017-08-01 17:28:40', '2017-08-18 14:04:57', '', null, null, null, null, '0', '0');
INSERT INTO `t_user` VALUES ('10157', null, '15901646896', '5.00', '50', '1', null, null, null, '2017-08-01 17:35:29', '2017-08-10 11:15:38', '', null, null, null, null, '0', '0');
INSERT INTO `t_user` VALUES ('10158', null, '18519205023', '5.00', '15', '1', null, null, null, '2017-08-10 10:00:33', null, '', null, null, null, null, '0', '0');
INSERT INTO `t_user` VALUES ('10159', '允默', null, '0.00', '0', '1', null, null, null, '2017-08-18 09:38:03', null, '', null, '04E907472D67F1D6335B4F693F25E8BF', null, null, '0', '0');
INSERT INTO `t_user` VALUES ('10161', null, '18158861317', '5.00', '15', '1', null, null, null, '2017-09-08 10:08:06', null, '', null, null, null, null, '0', '0');
INSERT INTO `t_user` VALUES ('10164', null, '1234567852', '0.00', '0', '1', null, null, null, null, null, '', null, null, null, null, '0', '0');

-- ----------------------------
-- Table structure for `t_user_approval`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_approval`;
CREATE TABLE `t_user_approval` (
  `id` bigint(20) NOT NULL COMMENT '用户id',
  `appr_realname` varchar(64) DEFAULT NULL COMMENT '真实姓名',
  `appr_idcard` varchar(32) DEFAULT NULL COMMENT '身份证号码',
  `appr_front` varchar(255) DEFAULT NULL COMMENT '身份证正面',
  `appr_back` varchar(255) DEFAULT NULL COMMENT '身份证背面',
  `appr_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `appr_update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `appr_handler` varchar(64) DEFAULT NULL COMMENT '处理人',
  `appr_handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `appr_remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `appr_state` tinyint(4) DEFAULT '0' COMMENT '状态 0-申请中 1-申请成功 2-失败',
  `appr_DriverLicense` varchar(255) DEFAULT NULL COMMENT '驾驶证',
  `appr_xingLicense` varchar(255) DEFAULT NULL COMMENT '行驶证',
  `appr_DriverLicense_id` varchar(32) DEFAULT NULL COMMENT '驾驶证',
  `appr_xingLicense_id` varchar(32) DEFAULT NULL COMMENT '行驶证',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='实名认证';

-- ----------------------------
-- Records of t_user_approval
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_info`;
CREATE TABLE `t_user_info` (
  `id` bigint(20) NOT NULL COMMENT '用户id',
  `gender` bit(1) DEFAULT NULL COMMENT '性别 0-男 1-女',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `birth` datetime DEFAULT NULL COMMENT '出生日期',
  `marry` bit(1) DEFAULT NULL COMMENT '是否已婚 0-未婚 1-已婚',
  `profession` varchar(255) DEFAULT NULL COMMENT '职业',
  `hobby` varchar(255) DEFAULT NULL COMMENT '心仪车型',
  `education` tinyint(4) DEFAULT NULL COMMENT '教育状况 1-高中 2-专科 3-本科 4-本科以上',
  `house` tinyint(4) DEFAULT NULL COMMENT '房产 1-无房 2-有房全款 3-有房按揭 4-租房',
  `creadit` tinyint(4) DEFAULT NULL COMMENT '1-信用良好 2-少数逾期 3-多次逾期 4-无信用记录',
  `social` bit(1) DEFAULT NULL COMMENT '是否有社保',
  `fund` bit(1) DEFAULT NULL COMMENT '是否有公积金',
  `income` tinyint(4) DEFAULT NULL COMMENT '收入 1-20000以上  2-12000-20000元  3-8000-12000元 4-5000-8000元 5-3000-5000元  6-3000元以下',
  `user_addr` varchar(255) DEFAULT NULL COMMENT '地址 省-市-区',
  `has_full` bit(1) DEFAULT b'0' COMMENT '补全资质',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户资料';

-- ----------------------------
-- Records of t_user_info
-- ----------------------------
INSERT INTO `t_user_info` VALUES ('10155', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `t_user_info` VALUES ('10156', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `t_user_info` VALUES ('10157', null, null, null, null, '企业主', null, null, '2', '1', '', '', '1', null, '');
INSERT INTO `t_user_info` VALUES ('10158', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `t_user_info` VALUES ('10159', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `t_user_info` VALUES ('10160', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `t_user_info` VALUES ('10161', null, null, null, null, null, null, null, null, null, null, null, null, null, '');

-- ----------------------------
-- Table structure for `t_vendor`
-- ----------------------------
DROP TABLE IF EXISTS `t_vendor`;
CREATE TABLE `t_vendor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '商家名',
  `vendor_phone` varchar(16) DEFAULT NULL COMMENT '商家电话',
  `vendor_addr` varchar(255) DEFAULT NULL COMMENT '省市区',
  `vendor_addr_detail` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `vendor_lon` varchar(255) DEFAULT NULL COMMENT '经度',
  `vendor_lat` varchar(255) DEFAULT NULL COMMENT '维度',
  `vendor_time` varchar(64) DEFAULT NULL COMMENT '营业时间',
  `vendor_remark` varchar(255) DEFAULT NULL COMMENT '商家介绍',
  `vendor_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `is_delete` bit(1) DEFAULT b'0',
  `number` char(6) DEFAULT NULL COMMENT '商家标识码',
  `activity` tinyint(2) DEFAULT '0' COMMENT '是否参与活动',
  `tackStuts` tinyint(2) DEFAULT '0' COMMENT '0.不可以使用优惠券 1.可以使用优惠券',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商家';

-- ----------------------------
-- Records of t_vendor
-- ----------------------------
INSERT INTO `t_vendor` VALUES ('1', '测试地址', '18519023562', '安徽省/合肥市/蜀山区', '政务区南二环与潜山路交叉口新城国际C座605室', '117.240213', '31.821117', '9：00-18：00', '哈哈哈', '2017-05-17 18:29:54', '', '000001', '0', '0');
INSERT INTO `t_vendor` VALUES ('2', '合肥诚创汽车服务有限公司', '0551-62387488', '安徽省/合肥市/包河区', '包河区徽州大道与南二环交叉口1278号皖宝床垫内100米', '117.292863', '31.820462', '09：00~18：00', '', '2017-05-24 23:11:05', '', '000002', '0', '0');
INSERT INTO `t_vendor` VALUES ('3', '好亮杰汽车服务有限公司', '0551-65231958', '安徽省/合肥市/蜀山区', '合肥市蜀山区望江西路与东至路交口往南100米', '117.241315', '31.827494', '09：00~18：00', '', '2017-05-24 23:41:06', '', '000003', '0', '0');
INSERT INTO `t_vendor` VALUES ('4', '合肥聚鑫欣汽车服务有限公司（一）', '0551-65560818', '安徽省/合肥市/蜀山区', '合肥市太湖路与金寨路交口向东300米车之翼', '117.246397', '31.805624', '09：00~18：00', '', '2017-05-25 00:12:44', '', '000004', '0', '0');
INSERT INTO `t_vendor` VALUES ('5', '合肥聚鑫欣汽车服务有限公司（二）', '0551-65558819', '安徽省/合肥市/蜀山区', '合肥市金寨路与习友路交口向北300米车之翼', '117.246397', '31.805624', '09：00~18：00', '', '2017-05-25 00:22:30', '', '000005', '0', '0');
INSERT INTO `t_vendor` VALUES ('10', '合肥聚鑫欣汽车服务有限公司（三）', '0551-65560177', '安徽省/合肥市/蜀山区', '合肥市黄山路与怀宁路交口向北200米车之翼', '117.246397', '31.805624', '09：00~18：00', '', '2017-05-25 00:26:23', '', '000006', '0', '0');
INSERT INTO `t_vendor` VALUES ('11', '德国马牌休宁路店', '0551-63506190', '安徽省/合肥市/蜀山区', '合肥市政务区休宁路绿怡居西区小高层门面', '117.245882', '31.829687', '09：00~18：00', '', '2017-05-25 00:39:57', '', '000007', '0', '0');
INSERT INTO `t_vendor` VALUES ('12', '百世德笔架山路旗舰店', '0551-63518259', '安徽省/合肥市/蜀山区', '合肥市政务区习友路与笔架山路交口向北200米', '117.215708', '31.796637', '09：00~18：00', '', '2017-05-25 00:45:19', '', '000008', '0', '0');
INSERT INTO `t_vendor` VALUES ('13', '百世德石笋路旗舰店', '0551-65150560', '安徽省/合肥市/蜀山区', '合肥市经开区石笋路与金炉路交口和谐家园1号楼门面', '117.210432', '31.802833', '09：00~18：00', '', '2017-05-25 00:52:08', '', '000009', '0', '0');
INSERT INTO `t_vendor` VALUES ('14', '德国马牌宝塔路聚茂店', '0551-65550000', '安徽省/合肥市/蜀山区', '合肥市经开区芙蓉路与宝塔路交口向北100米', '117.21871', '31.781503', '09：00~18：00', '', '2017-05-25 00:59:15', '', '000010', '0', '0');
INSERT INTO `t_vendor` VALUES ('15', '速途驰加（宋都店）', '0551-63361299', '安徽省/合肥市/蜀山区', '政务区怀宁路与习友路交叉口宋都西湖花苑东门南100米', '117.229377', '31.801433', '09：00~18：00', '', '2017-05-25 01:08:00', '', '000011', '0', '0');
INSERT INTO `t_vendor` VALUES ('16', '速途驰加（万达店）', '0551-65885881', '安徽省/合肥市/包河区', '滨湖新区衡山路与云谷路交口万达新城17幢101-106', '117.321663', '31.716888', '09：00~18：00', '', '2017-05-25 01:16:06', '', '000012', '0', '0');
INSERT INTO `t_vendor` VALUES ('17', '速途驰加（夏园路店）', '0551-65562577', '安徽省/合肥市/瑶海区', '瑶海区北一环与夏园路交口北100米红璞公寓旁', '117.308565', '31.887511', '09：00~18：00', '', '2017-05-25 01:27:29', '', '000013', '0', '0');
INSERT INTO `t_vendor` VALUES ('18', '速途驰加（中铁店）', '0551-66011516', '安徽省/合肥市/庐阳区', '庐阳区清源路88号中铁广园20幢101商铺', '117.250586', '31.909587', '09：00~18：00', '', '2017-05-25 01:32:47', '', '000014', '0', '0');
INSERT INTO `t_vendor` VALUES ('19', '速途驰加（海棠路店）', '0551-65882636', '安徽省/合肥市/蜀山区', '蜀山区海棠路与集贤路交口尚成花园', '117.210854', '31.820372', '09：00~18：00', '', '2017-05-25 01:52:03', '', '000015', '0', '0');
INSERT INTO `t_vendor` VALUES ('20', '速途驰加（万科城店）', '0551-65885887', '安徽省/合肥市/蜀山区', '滨湖新区四川路与云谷路交口万科城5栋101-106', '117.279864', '31.719486', '09：00~18：00', '', '2017-05-25 01:57:19', '', '000016', '0', '0');
INSERT INTO `t_vendor` VALUES ('21', '速途驰加（皖江路店）', '0551-63429499', '安徽省/合肥市/包河区', '包河区皖江路与当涂支路交口金悦领地花园1幢106', '117.314585', '31.828236', '09：00~18：00', '', '2017-05-25 02:01:38', '', '000017', '0', '0');
INSERT INTO `t_vendor` VALUES ('22', '合肥新起点汽车服务连锁（文忠路店）', '0551-67396777', '安徽省/合肥市/瑶海区', '新站区文忠路园上园小区东门5号商铺', '117.365069', '31.892916', '09：00~18：00', '', '2017-05-31 10:32:02', '', '000018', '0', '0');
INSERT INTO `t_vendor` VALUES ('23', '合肥新起点汽车服务连锁（南翔路店）', '0551-67396777', '安徽省/合肥市/包河区', '繁华大道南翔汽车城西四门9栋128号', '117.367494', '31.794509', '09：00~18：00', '', '2017-05-31 11:37:48', '', '000019', '0', '0');
INSERT INTO `t_vendor` VALUES ('24', '安徽省去扑网络科技有限公司', '0551-65307150', '安徽省/合肥市/蜀山区', '政务区南二环与潜山路交叉口新城国际C座605室', '117.240213', '31.821117', '09：00~18：00', '公司（周末不营业）', '2017-06-02 15:00:41', '', '999999', '0', '0');
INSERT INTO `t_vendor` VALUES ('25', '大拇指汽车养护', '0551-65390025', '安徽省/合肥市/蜀山区', '合肥市经开区书箱路65-67号报业园北门', '117.214536', '31.803986', '09：00~18：00', '', '2017-06-06 11:33:27', '', '000020', '0', '0');
INSERT INTO `t_vendor` VALUES ('26', '合肥焕然一新汽车服务有限公司（一）', '0551-65772271', '安徽省/合肥市/包河区', '合肥市包河区皖江东路与当涂支路交口金悦领地花园3栋101-103', '117.315586', '31.827832', '09：00~18：00', '', '2017-06-06 15:11:29', '', '000021', '0', '0');
INSERT INTO `t_vendor` VALUES ('27', '合肥焕然一新汽车服务有限公司（二）', '0551-65772271', '安徽省/合肥市/蜀山区', '合肥市蜀山区长江西路与振兴路交口向北100米', '117.156718', '31.863611', '09：00~18：00', '', '2017-06-06 15:15:15', '', '000022', '0', '0');
INSERT INTO `t_vendor` VALUES ('28', '123', '123123453', '安徽省/芜湖市/弋江区', '2312312', '11', '11', '232', '23123', '2017-08-31 10:17:06', '', '123123', '0', '0');

-- ----------------------------
-- Table structure for `t_vendor_gl`
-- ----------------------------
DROP TABLE IF EXISTS `t_vendor_gl`;
CREATE TABLE `t_vendor_gl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint(20) NOT NULL,
  `coupon_type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

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
INSERT INTO `t_vendor_gl` VALUES ('44', '16', '12');
INSERT INTO `t_vendor_gl` VALUES ('45', '11', '12');
INSERT INTO `t_vendor_gl` VALUES ('46', '13', '12');
INSERT INTO `t_vendor_gl` VALUES ('47', '13', '48');
INSERT INTO `t_vendor_gl` VALUES ('48', '18', '48');
INSERT INTO `t_vendor_gl` VALUES ('53', '20', '11');
INSERT INTO `t_vendor_gl` VALUES ('54', '1', '11');
INSERT INTO `t_vendor_gl` VALUES ('55', '4', '11');
INSERT INTO `t_vendor_gl` VALUES ('56', '2', '11');
INSERT INTO `t_vendor_gl` VALUES ('57', '3', '11');
INSERT INTO `t_vendor_gl` VALUES ('58', '15', '1');
INSERT INTO `t_vendor_gl` VALUES ('59', '20', '1');
INSERT INTO `t_vendor_gl` VALUES ('60', '22', '1');
INSERT INTO `t_vendor_gl` VALUES ('61', '23', '1');
INSERT INTO `t_vendor_gl` VALUES ('62', '20', '37');
INSERT INTO `t_vendor_gl` VALUES ('63', '19', '37');
INSERT INTO `t_vendor_gl` VALUES ('64', '16', '37');
INSERT INTO `t_vendor_gl` VALUES ('65', '15', '37');
INSERT INTO `t_vendor_gl` VALUES ('66', '18', '37');
INSERT INTO `t_vendor_gl` VALUES ('70', '13', '13');
INSERT INTO `t_vendor_gl` VALUES ('71', '19', '13');
INSERT INTO `t_vendor_gl` VALUES ('72', '22', '13');
INSERT INTO `t_vendor_gl` VALUES ('73', '17', '13');

-- ----------------------------
-- Procedure structure for `p_repack`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_repack`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_repack`()
BEGIN
	DECLARE pid BIGINT;
	DECLARE flag INT DEFAULT 0;
	DECLARE rs CURSOR FOR SELECT id FROM t_product WHERE product_remain > 0 AND product_limit > product_limit_now;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET flag = 1;
	OPEN rs;
		FETCH rs INTO pid;
			WHILE flag <> 1 DO
				SELECT product_remain,product_limit INTO @a,@b FROM t_product WHERE id = pid;
				IF(@a < @b) THEN
					UPDATE t_product SET product_remain = 0,
					product_limit_now = 0 WHERE id = pid;
				ELSE
					UPDATE t_product SET product_remain = product_remain - product_limit,
					product_limit_now = product_limit WHERE id = pid;
				END IF;
				FETCH rs INTO pid;
			END WHILE;
	CLOSE rs;
END
;;
DELIMITER ;
