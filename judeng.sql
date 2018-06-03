/*
Navicat MySQL Data Transfer

Source Server         : 泰坤堂测试数据库
Source Server Version : 50714
Source Host           : 39.105.19.169:3306
Source Database       : judeng

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-06-03 16:41:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jd_ad
-- ----------------------------
DROP TABLE IF EXISTS `jd_ad`;
CREATE TABLE `jd_ad` (
  `ad_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ad_title` varchar(50) NOT NULL DEFAULT '',
  `ad_img` varchar(255) NOT NULL DEFAULT '',
  `ad_url` varchar(100) NOT NULL DEFAULT '',
  `is_display` tinyint(1) NOT NULL DEFAULT '1',
  `ad_sort` smallint(5) unsigned NOT NULL DEFAULT '0',
  `master_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `aid` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员添加时间',
  PRIMARY KEY (`ad_id`),
  KEY `type_id` (`type_id`),
  KEY `ad_sort` (`ad_sort`),
  KEY `master_id` (`master_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_ad
-- ----------------------------
INSERT INTO `jd_ad` VALUES ('1', '0', '0', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/images/1527728122_615.jpg', '2222222', '1', '2', '0', '0', '1', '1527728124');
INSERT INTO `jd_ad` VALUES ('2', '0', '图片名', '', '', '1', '0', '0', '0', '0', '0');
INSERT INTO `jd_ad` VALUES ('3', '0', '图片名', '', '', '1', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for jd_admin
-- ----------------------------
DROP TABLE IF EXISTS `jd_admin`;
CREATE TABLE `jd_admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL COMMENT '登录账号',
  `password` char(32) DEFAULT NULL COMMENT '登录密码',
  `status` int(11) DEFAULT '1' COMMENT '账号状态',
  `role_id` int(11) DEFAULT '1' COMMENT '用户组',
  `remark` varchar(255) DEFAULT '' COMMENT '备注信息',
  `salt` char(10) DEFAULT NULL COMMENT '盐',
  `time` int(10) DEFAULT NULL COMMENT '开通时间',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='网站后台管理员表';

-- ----------------------------
-- Records of jd_admin
-- ----------------------------
INSERT INTO `jd_admin` VALUES ('1', '超级管理员', 'admin', 'beff5ecd15479943deaa4faed1c00e68', '1', '1', '我是超级管理员', 'DoV5Md', '1523339559');
INSERT INTO `jd_admin` VALUES ('2', '超级管理员', 'admin', 'beff5ecd15479943deaa4faed1c00e68', '1', '1', '我是超级管理员', 'DoV5Md', '1523339559');

-- ----------------------------
-- Table structure for jd_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `jd_admin_log`;
CREATE TABLE `jd_admin_log` (
  `log_id` bigint(16) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `aname` varchar(30) DEFAULT NULL COMMENT '管理员',
  `log_info` varchar(255) DEFAULT NULL COMMENT '日志描述',
  `log_ip` varchar(30) DEFAULT NULL COMMENT 'ip地址',
  `log_time` int(10) DEFAULT NULL COMMENT '日志时间',
  `aid` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员最后一次操作时间',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=176 DEFAULT CHARSET=utf8 COMMENT='操作登录日志';

-- ----------------------------
-- Records of jd_admin_log
-- ----------------------------
INSERT INTO `jd_admin_log` VALUES ('1', 'admin', '后台登录', '117.36.117.228', '1523339612', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('2', 'admin', '后台登录', '27.115.75.166', '1523340001', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('3', 'admin', '后台登录', '0.0.0.0', '1523412091', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('4', 'admin', '后台登录', '0.0.0.0', '1523423654', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('5', 'admin', '后台登录', '0.0.0.0', '1523426914', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('6', 'admin', '后台登录', '0.0.0.0', '1523428371', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('7', 'admin', '后台登录', '0.0.0.0', '1523432739', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('8', 'admin', '后台登录', '0.0.0.0', '1523438907', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('9', 'admin', '后台登录', '0.0.0.0', '1523495642', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('10', 'admin', '后台登录', '0.0.0.0', '1523496867', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('11', 'admin', '后台登录', '0.0.0.0', '1523503275', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('12', 'admin', '后台登录', '0.0.0.0', '1523512500', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('13', 'admin', '后台登录', '0.0.0.0', '1523521486', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('14', 'admin', '后台登录', '0.0.0.0', '1523521486', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('15', 'admin', '后台登录', '0.0.0.0', '1523530703', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('16', 'admin', '后台登录', '0.0.0.0', '1523580611', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('17', 'admin', '后台登录', '0.0.0.0', '1523581864', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('18', 'admin', '后台登录', '0.0.0.0', '1523588271', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('19', 'admin', '后台登录', '0.0.0.0', '1523589986', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('20', 'admin', '后台登录', '0.0.0.0', '1523597897', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('21', 'admin', '后台登录', '0.0.0.0', '1523598403', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('22', 'admin', '后台登录', '0.0.0.0', '1523840989', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('23', 'admin', '后台登录', '0.0.0.0', '1523841680', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('24', 'admin', '后台登录', '0.0.0.0', '1523859510', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('25', 'admin', '后台登录', '0.0.0.0', '1523926122', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('26', 'admin', '后台登录', '0.0.0.0', '1523945318', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('27', 'admin', '后台登录', '0.0.0.0', '1523945320', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('28', 'admin', '后台登录', '0.0.0.0', '1523961439', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('29', 'admin', '后台登录', '0.0.0.0', '1524016352', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('30', 'admin', '后台登录', '0.0.0.0', '1524106472', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('31', 'admin', '后台登录', '0.0.0.0', '1524291906', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('32', 'admin', '后台登录', '0.0.0.0', '1524292637', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('33', 'admin', '后台登录', '0.0.0.0', '1524297185', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('34', 'admin', '后台登录', '0.0.0.0', '1524447911', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('35', 'admin', '后台登录', '113.132.8.71', '1524447994', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('36', null, '安全退出', '0.0.0.0', '1524451953', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('37', 'admin', '后台登录', '0.0.0.0', '1524451968', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('38', 'admin', '后台登录', '0.0.0.0', '1524462659', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('39', 'admin', '后台登录', '0.0.0.0', '1524466575', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('40', 'admin', '后台登录', '0.0.0.0', '1524473600', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('41', 'admin', '后台登录', '0.0.0.0', '1524531618', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('42', 'admin', '后台登录', '0.0.0.0', '1524533101', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('43', 'admin', '后台登录', '0.0.0.0', '1524536208', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('44', 'admin', '后台登录', '113.132.11.113', '1524539132', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('45', 'admin', '后台登录', '0.0.0.0', '1524541233', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('46', 'admin', '后台登录', '113.132.11.113', '1524548224', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('47', 'admin', '后台登录', '0.0.0.0', '1524548472', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('48', 'admin', '后台登录', '0.0.0.0', '1524549522', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('49', 'admin', '后台登录', '0.0.0.0', '1524562017', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('50', 'admin', '后台登录', '0.0.0.0', '1524619114', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('51', 'admin', '后台登录', '0.0.0.0', '1524619658', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('52', 'admin', '后台登录', '0.0.0.0', '1524635754', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('53', 'admin', '后台登录', '0.0.0.0', '1524640437', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('54', 'admin', '后台登录', '0.0.0.0', '1524645556', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('55', 'admin', '后台登录', '202.100.35.178', '1524651360', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('56', 'admin', '后台登录', '0.0.0.0', '1524706948', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('57', 'admin', '后台登录', '0.0.0.0', '1524710794', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('58', 'admin', '后台登录', '0.0.0.0', '1524713729', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('59', 'admin', '后台登录', '0.0.0.0', '1524714256', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('60', 'admin', '后台登录', '0.0.0.0', '1524721597', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('61', 'admin', '后台登录', '0.0.0.0', '1524724236', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('62', 'admin', '后台登录', '0.0.0.0', '1524731165', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('63', 'admin', '后台登录', '0.0.0.0', '1524731369', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('64', 'admin', '安全退出', '0.0.0.0', '1524731434', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('65', 'admin', '后台登录', '0.0.0.0', '1524731756', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('66', 'admin', '后台登录', '0.0.0.0', '1524732879', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('67', 'admin', '安全退出', '0.0.0.0', '1524732909', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('68', 'admin', '后台登录', '0.0.0.0', '1524732912', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('69', 'admin', '后台登录', '0.0.0.0', '1524732913', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('70', 'admin', '后台登录', '0.0.0.0', '1524742500', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('71', 'admin', '后台登录', '0.0.0.0', '1524790743', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('72', 'admin', '后台登录', '0.0.0.0', '1524792610', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('73', 'admin', '后台登录', '202.100.51.111', '1524793483', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('74', 'admin', '后台登录', '0.0.0.0', '1524820273', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('75', 'admin', '后台登录', '0.0.0.0', '1524878752', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('76', 'admin', '后台登录', '0.0.0.0', '1524879400', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('77', 'admin', '后台登录', '0.0.0.0', '1524883907', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('78', 'admin', '后台登录', '0.0.0.0', '1524896977', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('79', 'admin', '后台登录', '127.0.0.1', '1524929232', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('80', 'admin', '后台登录', '0.0.0.0', '1525223478', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('81', 'admin', '后台登录', '0.0.0.0', '1525226839', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('82', 'admin', '后台登录', '0.0.0.0', '1525230560', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('83', 'admin', '后台登录', '0.0.0.0', '1525230561', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('84', null, '安全退出', '0.0.0.0', '1525232206', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('85', 'admin', '后台登录', '0.0.0.0', '1525232219', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('86', 'admin', '后台登录', '0.0.0.0', '1525240344', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('87', 'admin', '后台登录', '0.0.0.0', '1525240578', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('88', 'admin', '后台登录', '0.0.0.0', '1525309650', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('89', 'admin', '后台登录', '0.0.0.0', '1525313214', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('90', 'admin', '后台登录', '0.0.0.0', '1525327746', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('91', 'admin', '后台登录', '0.0.0.0', '1525329390', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('92', 'admin', '后台登录', '0.0.0.0', '1525337866', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('93', 'admin', '后台登录', '0.0.0.0', '1525399346', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('94', 'admin', '后台登录', '0.0.0.0', '1525399346', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('95', 'admin', '后台登录', '0.0.0.0', '1525417530', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('96', 'admin', '后台登录', '0.0.0.0', '1525417530', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('97', 'admin', '后台登录', '0.0.0.0', '1525419225', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('98', 'admin', '后台登录', '0.0.0.0', '1525424893', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('99', 'admin', '后台登录', '0.0.0.0', '1525600062', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('100', 'admin', '后台登录', '0.0.0.0', '1525654850', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('101', 'admin', '后台登录', '202.100.50.191', '1525676606', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('102', 'admin', '后台登录', '117.36.118.76', '1525685932', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('103', 'admin', '后台登录', '0.0.0.0', '1525742664', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('104', 'admin', '后台登录', '27.115.75.166', '1525743391', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('105', 'admin', '后台登录', '0.0.0.0', '1525854827', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('106', 'admin', '后台登录', '125.76.213.251', '1526008125', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('107', 'admin', '后台登录', '27.115.75.166', '1526008193', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('108', 'admin', '后台登录', '27.115.75.166', '1526010013', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('109', 'admin', '后台登录', '125.76.213.251', '1526015618', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('110', 'admin', '后台登录', '27.115.75.166', '1526023207', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('111', 'admin', '后台登录', '101.93.127.39', '1526230058', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('112', 'admin', '后台登录', '101.93.127.39', '1526230151', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('113', 'admin', '安全退出', '101.93.127.39', '1526230163', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('114', null, '安全退出', '106.14.190.222', '1526237740', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('115', 'admin', '后台登录', '0.0.0.0', '1526370943', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('116', 'admin', '后台登录', '0.0.0.0', '1526451761', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('117', 'admin', '后台登录', '0.0.0.0', '1526539927', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('118', 'admin', '后台登录', '117.36.118.25', '1526553214', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('119', 'admin', '后台登录', '202.100.34.126', '1526967624', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('120', 'admin', '后台登录', '0.0.0.0', '1527041100', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('121', 'admin', '后台登录', '27.115.75.166', '1527041363', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('122', 'admin', '后台登录', '0.0.0.0', '1527055973', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('123', 'admin', '后台登录', '0.0.0.0', '1527130250', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('124', 'admin', '后台登录', '0.0.0.0', '1527211037', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('125', 'admin', '后台登录', '0.0.0.0', '1527228550', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('126', 'admin', '后台登录', '0.0.0.0', '1527247856', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('127', 'admin', '后台登录', '0.0.0.0', '1527305124', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('128', 'admin', '后台登录', '115.173.195.128', '1527433149', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('129', 'admin', '后台登录', '0.0.0.0', '1527433305', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('130', 'admin', '后台登录', '0.0.0.0', '1527471847', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('131', 'admin', '后台登录', '0.0.0.0', '1527487568', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('132', 'admin', '后台登录', '0.0.0.0', '1527491202', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('133', 'admin', '后台登录', '0.0.0.0', '1527492234', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('134', 'admin', '后台登录', '0.0.0.0', '1527521448', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('135', 'admin', '后台登录', '0.0.0.0', '1527557396', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('136', 'admin', '后台登录', '0.0.0.0', '1527573231', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('137', 'admin', '后台登录', '0.0.0.0', '1527573947', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('138', 'admin', '后台登录', '0.0.0.0', '1527578022', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('139', 'admin', '后台登录', '0.0.0.0', '1527591795', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('140', 'admin', '后台登录', '0.0.0.0', '1527642431', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('141', 'admin', '后台登录', '0.0.0.0', '1527642927', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('142', 'admin', '后台登录', '127.0.0.1', '1527649713', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('143', 'admin', '后台登录', '0.0.0.0', '1527659039', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('144', 'admin', '后台登录', '0.0.0.0', '1527659253', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('145', 'admin', '后台登录', '127.0.0.1', '1527662291', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('146', 'admin', '后台登录', '127.0.0.1', '1527662916', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('147', 'admin', '后台登录', '127.0.0.1', '1527668530', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('148', 'admin', '后台登录', '0.0.0.0', '1527681278', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('149', 'admin', '后台登录', '127.0.0.1', '1527681459', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('150', 'admin', '后台登录', '0.0.0.0', '1527681855', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('151', 'admin', '后台登录', '0.0.0.0', '1527687707', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('152', 'admin', '后台登录', '0.0.0.0', '1527694051', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('153', 'admin', '后台登录', '0.0.0.0', '1527725290', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('154', 'admin', '后台登录', '0.0.0.0', '1527733986', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('155', 'admin', '后台登录', '0.0.0.0', '1527737637', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('156', 'admin', '后台登录', '127.0.0.1', '1527739459', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('157', 'admin', '后台登录', '0.0.0.0', '1527747713', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('158', 'admin', '后台登录', '127.0.0.1', '1527748873', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('159', 'admin', '后台登录', '127.0.0.1', '1527751793', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('160', 'admin', '后台登录', '0.0.0.0', '1527771211', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('161', 'admin', '后台登录', '127.0.0.1', '1527816397', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('162', 'admin', '后台登录', '0.0.0.0', '1527816552', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('163', 'admin', '后台登录', '127.0.0.1', '1527818316', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('164', 'admin', '后台登录', '127.0.0.1', '1527818524', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('165', 'admin', '后台登录', '0.0.0.0', '1527824174', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('166', 'admin', '后台登录', '0.0.0.0', '1527834307', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('167', 'admin', '后台登录', '219.144.136.8', '1527837707', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('168', 'admin', '后台登录', '27.115.75.166', '1527847314', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('169', 'admin', '后台登录', '27.115.75.166', '1527847820', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('170', 'admin', '后台登录', '219.144.136.8', '1527847957', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('171', 'admin', '安全退出', '27.115.75.166', '1527850032', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('172', 'admin', '后台登录', '27.115.75.166', '1527850044', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('173', 'admin', '后台登录', '0.0.0.0', '1527850432', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('174', 'admin', '后台登录', '115.173.195.128', '1527931265', '0', '0');
INSERT INTO `jd_admin_log` VALUES ('175', 'admin', '后台登录', '27.115.75.166', '1527994872', '0', '0');

-- ----------------------------
-- Table structure for jd_ad_cate
-- ----------------------------
DROP TABLE IF EXISTS `jd_ad_cate`;
CREATE TABLE `jd_ad_cate` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '广告位名称',
  `status` tinyint(2) DEFAULT '0',
  `width` char(20) NOT NULL DEFAULT '',
  `height` char(20) NOT NULL DEFAULT '',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `aid` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员最后一次操作时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告位表';

-- ----------------------------
-- Records of jd_ad_cate
-- ----------------------------

-- ----------------------------
-- Table structure for jd_ad_list
-- ----------------------------
DROP TABLE IF EXISTS `jd_ad_list`;
CREATE TABLE `jd_ad_list` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ad_name` varchar(60) NOT NULL DEFAULT '',
  `ad_link` varchar(255) NOT NULL DEFAULT '',
  `ad_img` varchar(255) NOT NULL,
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `aid` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员最后一次操作时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of jd_ad_list
-- ----------------------------

-- ----------------------------
-- Table structure for jd_area
-- ----------------------------
DROP TABLE IF EXISTS `jd_area`;
CREATE TABLE `jd_area` (
  `area_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 不显示 1显示',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '地区',
  `sort` tinyint(1) NOT NULL DEFAULT '0' COMMENT '权重',
  `aid` int(8) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='地区表';

-- ----------------------------
-- Records of jd_area
-- ----------------------------
INSERT INTO `jd_area` VALUES ('1', '1', '北京', '1', '1', '1525608095', '1525608095');
INSERT INTO `jd_area` VALUES ('2', '1', '上海', '2', '1', '1525608095', '1525608095');
INSERT INTO `jd_area` VALUES ('3', '1', '天津', '3', '1', '1525608095', '1525608095');
INSERT INTO `jd_area` VALUES ('4', '1', '重庆', '4', '1', '1525608095', '1525608095');
INSERT INTO `jd_area` VALUES ('5', '1', '湖北', '5', '1', '1525608095', '1525608095');

-- ----------------------------
-- Table structure for jd_article
-- ----------------------------
DROP TABLE IF EXISTS `jd_article`;
CREATE TABLE `jd_article` (
  `article_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `inherit_id` int(8) NOT NULL DEFAULT '0' COMMENT '所属传承',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '传承文章标题',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `list_pic` varchar(355) NOT NULL DEFAULT '' COMMENT '列表图片',
  `intro` varchar(355) NOT NULL DEFAULT '' COMMENT '简介',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1显示 0不显示',
  `sort` int(8) NOT NULL DEFAULT '0' COMMENT '权重',
  `release_date` int(10) NOT NULL,
  `substance` text NOT NULL COMMENT '详情',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='传承文章表';

-- ----------------------------
-- Records of jd_article
-- ----------------------------
INSERT INTO `jd_article` VALUES ('1', '2', '朱氏妇科历百年传承', '1525750555', '/Uploads/image/images/20180310/20180310095758_58424.jpg', '为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,', '1', '1', '1525750555', '这里是详情页面');
INSERT INTO `jd_article` VALUES ('2', '2', '朱氏妇科历百年传承', '1525750555', '/Uploads/image/images/20180310/20180310095758_58424.jpg', '为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,', '1', '2', '1525750555', '这里是详情页面');
INSERT INTO `jd_article` VALUES ('3', '2', '朱氏妇科历百年传承', '1525750555', '/Uploads/image/images/20180310/20180310095758_58424.jpg', '为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,', '1', '3', '1525750555', '这里是详情页面');
INSERT INTO `jd_article` VALUES ('5', '3', '朱氏妇科历百年传承1', '1525750500', '/Uploads/image/images/20180310/20180310095758_58424.jpg', '为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,', '1', '5', '1527583692', '&lt;p&gt;\n	这里是详情页面&lt;strong&gt;请问额外企鹅&lt;/strong&gt; \n&lt;/p&gt;\n&lt;p&gt;\n	&lt;strong&gt;发顺丰的双丰收&lt;/strong&gt; \n&lt;/p&gt;\n&lt;p&gt;\n	&lt;strong&gt;撒飞洒的&lt;/strong&gt; \n&lt;/p&gt;');

-- ----------------------------
-- Table structure for jd_bank
-- ----------------------------
DROP TABLE IF EXISTS `jd_bank`;
CREATE TABLE `jd_bank` (
  `bank_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bank_name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0不显示 1显示',
  `sort` int(5) NOT NULL DEFAULT '0' COMMENT '权重',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `aid` int(8) NOT NULL DEFAULT '0' COMMENT '管理员',
  `operate_id` int(8) NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='银行表';

-- ----------------------------
-- Records of jd_bank
-- ----------------------------
INSERT INTO `jd_bank` VALUES ('1', '工商银行', '1', '1', '1525750555', '1', '1525750555');
INSERT INTO `jd_bank` VALUES ('2', '招商银行', '1', '2', '1525750555', '1', '1525750555');
INSERT INTO `jd_bank` VALUES ('3', '建设银行', '0', '3', '1525750555', '1', '1525750555');
INSERT INTO `jd_bank` VALUES ('4', '交通银行', '1', '4', '1525750555', '1', '1525750555');
INSERT INTO `jd_bank` VALUES ('5', '浦发银行', '1', '5', '1525750555', '1', '1525750555');

-- ----------------------------
-- Table structure for jd_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `jd_blacklist`;
CREATE TABLE `jd_blacklist` (
  `blacklist_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `doctor_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生id',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '患者id',
  `is_show` int(3) NOT NULL DEFAULT '0' COMMENT '是否取消黑名单 1 取消',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `release_date` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`blacklist_id`),
  KEY `member_id` (`member_id`),
  KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='黑名单表';

-- ----------------------------
-- Records of jd_blacklist
-- ----------------------------

-- ----------------------------
-- Table structure for jd_category
-- ----------------------------
DROP TABLE IF EXISTS `jd_category`;
CREATE TABLE `jd_category` (
  `cid` int(5) NOT NULL AUTO_INCREMENT,
  `pid` int(5) DEFAULT NULL COMMENT '上级分类',
  `name` varchar(20) DEFAULT NULL COMMENT '分类名称',
  `type` char(2) NOT NULL DEFAULT 'n',
  `aid` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员最后一次操作时间',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分类表';

-- ----------------------------
-- Records of jd_category
-- ----------------------------
INSERT INTO `jd_category` VALUES ('1', '0', '33333', 'n', '0', '0');
INSERT INTO `jd_category` VALUES ('2', '1', '急急急', 'n', '0', '0');
INSERT INTO `jd_category` VALUES ('3', '2', '999', 'n', '0', '0');
INSERT INTO `jd_category` VALUES ('4', '0', '2', 'n', '0', '0');

-- ----------------------------
-- Table structure for jd_chat_log
-- ----------------------------
DROP TABLE IF EXISTS `jd_chat_log`;
CREATE TABLE `jd_chat_log` (
  `add_data` int(10) NOT NULL,
  `is_success` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 失败 1成功 2无数据',
  `file_url` varchar(355) NOT NULL DEFAULT '' COMMENT '聊天文件的本地路径'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='聊天记录日志表';

-- ----------------------------
-- Records of jd_chat_log
-- ----------------------------
INSERT INTO `jd_chat_log` VALUES ('2018052015', '1', '/resource/chatFile/20180520150');

-- ----------------------------
-- Table structure for jd_comment
-- ----------------------------
DROP TABLE IF EXISTS `jd_comment`;
CREATE TABLE `jd_comment` (
  `comment_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` text NOT NULL COMMENT '评论内容',
  `shorttag` varchar(255) NOT NULL DEFAULT '',
  `malady` text NOT NULL COMMENT '病症',
  `add_date` int(8) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `type` int(5) NOT NULL DEFAULT '0' COMMENT '5 很满意 3 满意  还可以',
  `aid` int(8) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `is_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未审核 1已审核',
  `member_id` int(8) NOT NULL DEFAULT '0' COMMENT '患者id',
  `doctor_id` int(8) NOT NULL DEFAULT '0' COMMENT '医生id',
  `order_id` int(8) NOT NULL DEFAULT '0' COMMENT '订单id',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='患者评论表';

-- ----------------------------
-- Records of jd_comment
-- ----------------------------
INSERT INTO `jd_comment` VALUES ('3', '还是很不错', '回答很专业    响应速度很快    ', '肚子疼', '1525492067', '5', '0', '0', '1', '1', '2', '81');
INSERT INTO `jd_comment` VALUES ('4', '刚回家就加班v', '响应速度很快    回答很专业    意见很有帮助    ', '发挥你你你吧v', '1526364031', '5', '0', '0', '0', '1', '2', '86');

-- ----------------------------
-- Table structure for jd_consult_log
-- ----------------------------
DROP TABLE IF EXISTS `jd_consult_log`;
CREATE TABLE `jd_consult_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '患者ID',
  `doctor_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生ID',
  `type` tinyint(10) NOT NULL DEFAULT '0' COMMENT '1爱心问诊次数 2 在线问诊次数 3 名医复诊次数',
  `starttime` int(11) NOT NULL DEFAULT '0' COMMENT '咨询开始时间',
  `endtime` int(11) NOT NULL DEFAULT '0' COMMENT '咨询结束时间',
  `is_done` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 问诊没有结束 1 问诊结束',
  `order_id` int(8) NOT NULL DEFAULT '0' COMMENT '订单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='咨询日志表';

-- ----------------------------
-- Records of jd_consult_log
-- ----------------------------

-- ----------------------------
-- Table structure for jd_department
-- ----------------------------
DROP TABLE IF EXISTS `jd_department`;
CREATE TABLE `jd_department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `department_name` varchar(255) NOT NULL DEFAULT '' COMMENT '科室名',
  `intro` text COMMENT '简介',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序 从大到小',
  `is_show` int(3) NOT NULL DEFAULT '1' COMMENT '是否显示 1 显示',
  `aid` int(8) NOT NULL DEFAULT '0' COMMENT '最后一次操作者id',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员最后一次操作时间',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='科室表';

-- ----------------------------
-- Records of jd_department
-- ----------------------------
INSERT INTO `jd_department` VALUES ('1', '肛肠科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('2', '乳腺科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('3', '肝科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('4', '骨伤科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('5', '妇科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('6', '针灸科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('7', '脾胃病科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('8', '心病科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('9', '儿科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('10', '肺病科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('11', '脑病科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('12', '普外科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('13', '血液科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('14', '内分泌科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('15', '耳鼻喉科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('16', '老年科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('17', '推拿科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('18', '中西医结合泌...', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('19', '肾内科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('20', '风湿科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('21', '肿瘤科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('22', '皮肤科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('23', '眼科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('24', '中医外科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('25', '内科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('26', '康复医学科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('27', '营养科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('28', '急救医学科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('29', '超声科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('30', '检验科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('31', '放射科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('32', '胸外科', '', '1', '1', '1', '1524721715', '1523598975');
INSERT INTO `jd_department` VALUES ('33', '口腔科', '', '1', '1', '1', '1524721715', '1523598975');

-- ----------------------------
-- Table structure for jd_deposit
-- ----------------------------
DROP TABLE IF EXISTS `jd_deposit`;
CREATE TABLE `jd_deposit` (
  `deposit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '储蓄卡ID',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生id',
  `bank_id` int(10) NOT NULL DEFAULT '0' COMMENT '银行id',
  `deposit_name` varchar(50) NOT NULL DEFAULT '' COMMENT '银行卡姓名',
  `deposit_number` varchar(50) NOT NULL DEFAULT '' COMMENT '银行卡卡号',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '银行预留手机号',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`deposit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='银行储蓄卡ID';

-- ----------------------------
-- Records of jd_deposit
-- ----------------------------
INSERT INTO `jd_deposit` VALUES ('10', '2', '4', '涂革', '777888999', '15021039435', '1526709863');
INSERT INTO `jd_deposit` VALUES ('11', '17', '4', '涂革', '777888999', '15021039435', '1526711542');
INSERT INTO `jd_deposit` VALUES ('13', '15', '5', 'dd', 'dd', 'ddd', '1526713223');
INSERT INTO `jd_deposit` VALUES ('14', '37', '5', 'www', '1', '1', '1527844063');
INSERT INTO `jd_deposit` VALUES ('16', '36', '5', '刘', '546', '13262215137', '1527869628');
INSERT INTO `jd_deposit` VALUES ('17', '38', '5', '抱着姐姐', '766494515316', '879464', '1527928235');

-- ----------------------------
-- Table structure for jd_diagnosis_list
-- ----------------------------
DROP TABLE IF EXISTS `jd_diagnosis_list`;
CREATE TABLE `jd_diagnosis_list` (
  `diagnosis_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '坐诊信息设置列表',
  `member_id` int(8) NOT NULL DEFAULT '0' COMMENT '医生id',
  `hospital_repart_id` int(8) NOT NULL COMMENT '科室id',
  `start_time` int(10) NOT NULL DEFAULT '0' COMMENT '看诊的起始时间',
  `end_time` int(10) NOT NULL DEFAULT '0' COMMENT '看诊的结束时间',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `release_date` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`diagnosis_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='医生坐诊信息排班列表';

-- ----------------------------
-- Records of jd_diagnosis_list
-- ----------------------------
INSERT INTO `jd_diagnosis_list` VALUES ('7', '2', '58', '1533233400', '1533261900', '1528001347', '1528001347');
INSERT INTO `jd_diagnosis_list` VALUES ('8', '2', '58', '1529942400', '1529978400', '1528001735', '1528001735');
INSERT INTO `jd_diagnosis_list` VALUES ('9', '26', '3', '1528007400', '1528009200', '1528006438', '1528006438');

-- ----------------------------
-- Table structure for jd_diagnosis_set
-- ----------------------------
DROP TABLE IF EXISTS `jd_diagnosis_set`;
CREATE TABLE `jd_diagnosis_set` (
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生id',
  `all_open` tinyint(1) NOT NULL DEFAULT '1' COMMENT '在线问诊服务说明(全部开启) 0全部关闭 1开启',
  `open_image` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启图文问诊 0关闭 1开启( 作废，用 graphic_speech 字段)',
  `love_num` int(8) NOT NULL DEFAULT '0' COMMENT '爱心问诊数量',
  `graphic_speech` int(3) NOT NULL DEFAULT '0' COMMENT '图文语音沟通 0 关闭 1 开启',
  `image_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '图文初诊的价格',
  `reimage_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '图文复诊的价格',
  `image_num` int(5) NOT NULL DEFAULT '0' COMMENT '图文问诊每日接单上限',
  `aid` int(8) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员操作时间',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `release_date` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `revisit` int(10) NOT NULL DEFAULT '0' COMMENT '名医复诊次数',
  `inquisition` int(10) NOT NULL DEFAULT '0' COMMENT '在线问诊次数',
  KEY `member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生设置在线问诊列表';

-- ----------------------------
-- Records of jd_diagnosis_set
-- ----------------------------
INSERT INTO `jd_diagnosis_set` VALUES ('1', '1', '0', '10', '1', '10.00', '10.00', '10', '0', '0', '0', '1527747756', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('2', '1', '0', '99', '1', '2000.00', '2000.00', '99', '0', '0', '0', '1527931325', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('3', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('4', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('5', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('6', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('7', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('8', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('9', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('10', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '1527852997', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('11', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('12', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('13', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('14', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('15', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('16', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('14', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('18', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('19', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('20', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('21', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('22', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('23', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('24', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('25', '1', '0', '35', '0', '20.00', '60.00', '5', '0', '0', '0', '1527997468', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('26', '1', '0', '0', '0', '60.00', '60.00', '2', '0', '0', '0', '1528011101', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('27', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('28', '1', '0', '9', '1', '9.00', '9.00', '9', '0', '0', '0', '1527825158', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('29', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('30', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('31', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('32', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('33', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('34', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('35', '1', '0', '0', '0', '60.00', '60.00', '5', '0', '0', '0', '0', '1', '1');
INSERT INTO `jd_diagnosis_set` VALUES ('36', '1', '0', '0', '0', '0.00', '0.00', '0', '0', '1527836833', '1527836833', '1527836833', '0', '0');
INSERT INTO `jd_diagnosis_set` VALUES ('37', '1', '0', '0', '0', '0.00', '0.00', '0', '0', '1527836989', '1527836989', '1527836989', '0', '0');
INSERT INTO `jd_diagnosis_set` VALUES ('38', '1', '0', '0', '0', '0.00', '0.00', '0', '0', '1527927996', '1527927996', '1527927996', '0', '0');
INSERT INTO `jd_diagnosis_set` VALUES ('39', '1', '0', '0', '0', '0.00', '0.00', '0', '0', '1527996433', '1527996433', '1527996433', '0', '0');
INSERT INTO `jd_diagnosis_set` VALUES ('40', '1', '0', '0', '0', '0.00', '0.00', '0', '0', '1527996521', '1527996521', '1527996521', '0', '0');
INSERT INTO `jd_diagnosis_set` VALUES ('41', '1', '0', '0', '0', '0.00', '0.00', '0', '0', '1527996622', '1527996622', '1527996622', '0', '0');
INSERT INTO `jd_diagnosis_set` VALUES ('42', '1', '0', '0', '0', '0.00', '0.00', '0', '0', '1527996748', '1527996748', '1527996748', '0', '0');
INSERT INTO `jd_diagnosis_set` VALUES ('43', '1', '0', '0', '0', '0.00', '0.00', '0', '0', '1528010068', '1528010068', '1528010068', '0', '0');

-- ----------------------------
-- Table structure for jd_doctor
-- ----------------------------
DROP TABLE IF EXISTS `jd_doctor`;
CREATE TABLE `jd_doctor` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_sn` varchar(30) NOT NULL DEFAULT '' COMMENT '医生编号',
  `member_name` varchar(100) NOT NULL DEFAULT '' COMMENT '医生称谓',
  `idcode` varchar(30) NOT NULL DEFAULT '' COMMENT '身份证',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `invite` int(8) NOT NULL DEFAULT '0' COMMENT '邀请码',
  `portrait` varchar(200) NOT NULL DEFAULT '' COMMENT '用户头像',
  `face_photo` varchar(200) NOT NULL DEFAULT '' COMMENT '正面照片',
  `birthday` int(10) NOT NULL DEFAULT '0' COMMENT '用户生日',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0男1女',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `nick_name` varchar(100) NOT NULL DEFAULT '' COMMENT '昵称',
  `true_name` varchar(100) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `area_id` varchar(100) NOT NULL DEFAULT '' COMMENT '所属城市',
  `hospital_id` varchar(100) NOT NULL DEFAULT '' COMMENT '注册时所选的医院id',
  `title_id` varchar(255) NOT NULL DEFAULT '' COMMENT '职称ID 半角逗号拼接',
  `hospital_repart_str` varchar(255) NOT NULL DEFAULT '' COMMENT '医院科室表id 以 半角逗号拼接',
  `goodat_id` varchar(200) NOT NULL DEFAULT '' COMMENT '擅长ID字符串 (以半角逗号拼接)',
  `introduction` varchar(500) NOT NULL DEFAULT '' COMMENT '基本信息',
  `worktime` char(20) NOT NULL DEFAULT '' COMMENT '工作时间',
  `phone` varchar(30) NOT NULL DEFAULT '' COMMENT '电话',
  `payment_number` int(11) NOT NULL DEFAULT '0' COMMENT '付款人数',
  `good_number` int(11) NOT NULL DEFAULT '0' COMMENT '好评人数',
  `star` int(11) NOT NULL DEFAULT '0' COMMENT '星级',
  `recom` int(3) NOT NULL DEFAULT '0' COMMENT '是否推荐 1 推荐',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 未完善 1完善',
  `is_clinic` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0关闭义诊 1开启义诊',
  `is_status` int(3) NOT NULL DEFAULT '0' COMMENT '是否被冻结 1 冻结',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '积分',
  `wallet` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '可提现金额,每月10号,财务更新',
  `account` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '待到账金额(去除平台抽成和上级抽成之后的金额)',
  `total_account` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '历史营收(扣除抽成之后的)',
  `online_inquiry_per` int(10) NOT NULL DEFAULT '0' COMMENT '线上问诊品台抽成比例 0-100',
  `online_review_per` int(10) NOT NULL DEFAULT '0' COMMENT '线上复诊平台抽成比例 0-100',
  `online_ask_per` int(10) NOT NULL DEFAULT '0' COMMENT '咨询平抽成 0-100',
  `online_fang_per` int(10) NOT NULL DEFAULT '0' COMMENT '处方订单平台抽成 0-100',
  `online_self_per` int(10) NOT NULL DEFAULT '0' COMMENT '自建产品品台 抽成 0-100',
  `online_inquiry` int(3) NOT NULL DEFAULT '0' COMMENT '默认在线问诊变量 0 关闭 1 开启',
  `love_inquiry` int(10) NOT NULL DEFAULT '0' COMMENT '爱心问诊默认数量为0',
  `graphic_speech` int(3) NOT NULL DEFAULT '0' COMMENT '图文语音沟通 0 关闭 1 开启',
  `first_price` int(10) NOT NULL DEFAULT '0' COMMENT '初诊价格默认为 0',
  `consultation_price` int(10) NOT NULL DEFAULT '0' COMMENT '复诊价格默认 0',
  `receipt` int(10) NOT NULL DEFAULT '0' COMMENT '接单上限默认 0',
  `open_pharmacy` int(10) NOT NULL DEFAULT '0' COMMENT '已开药房默认 0 不限次数',
  `platform_default` int(3) NOT NULL DEFAULT '1' COMMENT '平台默认搜不到我 0 关闭 1 开启',
  `inherit` int(3) NOT NULL DEFAULT '0' COMMENT '显示传承流派 0 关闭 1 开启',
  `inherit_feature` int(3) NOT NULL DEFAULT '0' COMMENT '显示传承流派特色方剂 0 关闭 1 开启',
  `concealment_number` int(3) NOT NULL DEFAULT '0' COMMENT '隐藏好评人数和付款人数 0 关闭 1 开启',
  `questions_number` int(10) NOT NULL DEFAULT '0' COMMENT '赠送患者扫码提问次数 0',
  `to_doctor_url` varchar(355) NOT NULL DEFAULT '' COMMENT '医生邀请医生的H5页面二维码',
  `is_certified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未认证 1审核中 2认证通过 3认证失败',
  `school_str` varchar(255) NOT NULL DEFAULT '' COMMENT '流派id字符串 半角逗号拼接',
  `title_str` varchar(255) NOT NULL DEFAULT '' COMMENT '职称字符串, 半角逗号拼接',
  `disturb_start` int(10) NOT NULL DEFAULT '0' COMMENT '免打扰每天开始时间，距离凌晨的秒数，如凌晨1点对应的就是3600秒',
  `disturb_end` int(10) NOT NULL DEFAULT '0' COMMENT '免打扰每天结束时间，距离凌晨的秒数，如凌晨1点对应的就是3600秒',
  `only_token` varchar(255) NOT NULL DEFAULT '' COMMENT '单设备token',
  `guid` varchar(100) NOT NULL DEFAULT '' COMMENT '随机数',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `login_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '登录状态 0注销 1登录',
  `is_system` int(3) NOT NULL DEFAULT '0' COMMENT '是什么系统 1 是ISO 0是安卓',
  `device_tokens` varchar(255) NOT NULL DEFAULT '' COMMENT '设备唯一表示',
  `reg_date` int(10) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '登录ip',
  `reg_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册IP地址',
  `login_time` int(10) NOT NULL DEFAULT '0' COMMENT '登录时间',
  `release_date` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `aid` int(8) NOT NULL DEFAULT '0' COMMENT '最后一次操作的管理员id',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员最后一次操作的时间',
  PRIMARY KEY (`member_id`),
  KEY `invite` (`invite`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='医生表';

-- ----------------------------
-- Records of jd_doctor
-- ----------------------------
INSERT INTO `jd_doctor` VALUES ('2', 'tkt9527', '王硕医生', '421124199209286019', '15021049435', '1000', '', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526709853_227.jpg', '0', '1', '', '小王', '涂革', '2', '6', '15', '58', '25,26,27,83,84', '14dsadasddsdasds', '上午 11:30', '', '0', '0', '2', '0', '1', '0', '0', '0', '0.00', '0.00', '0.00', '5', '5', '5', '5', '5', '1', '99', '1', '2000', '2000', '99', '1', '1', '1', '1', '1', '1', '/uploads/code/1525689720code.png', '2', '1,2', '中级职称, 高级职称', '0', '3600', '1527997597iJ~tvM', 'b370bbe5-e62b-e8d3-3ace-238fc545bd5d', '50ea065f45dd2de3341b12256df9b3ef', '1', '1', '1DAE8E70-B0EE-44C7-922B-620E38E63E5F', '1523862010', '27.115.75.166', '2130706433', '1527997597', '1528000309', '1', '1527931325');
INSERT INTO `jd_doctor` VALUES ('3', 'tkt5aec9367d45bf', '帅兵医生', '421124199209286019', '15021130232', '1001', '', '/uploads/paper/20180509\\bd6dd507a29fe1c748e42781939af2d1.jpg', '1523516340', '0', '455224159@qq.com', '小刘', '小刘', '2', '6', '15,16', '6,7,2', '25,26,27', '这是一位医生', '上午 11:30', '', '0', '0', '0', '0', '1', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '', '2', '1,2', '中级职称, 高级职称', '0', '0', '', 'zoeutfjk', 'd85caa5c1afe4e0fd53a6d7dca7b14b7', '0', '1', '', '1525453671', '0.0.0.0', '0.0.0.0', '1525454794', '1526350268', '0', '0');
INSERT INTO `jd_doctor` VALUES ('4', 'tkt5aef0c5d93812', '王硕医生', '421124199209286019', '15021039438', '1002', '/uploads/image/images/20180416/20180416145952_86852.jpg', '/uploads/paper/20180509\\bd6dd507a29fe1c748e42781939af2d1.jpg', '1523516340', '0', '455224159@qq.com', '小小王', '王硕', '2', '6', '15,16', '6,7', '25,26,27', '这是一位医生', '上午 11:30', '', '0', '0', '0', '0', '1', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', '2', '1,2', '中级职称, 高级职称', '0', '0', '1527519196TXbTx$', 'vubbonaf', '80b6c316c17966e727660c425a506904', '1', '1', '1231231', '1525615709', '0.0.0.0', '0.0.0.0', '1527519196', '0', '0', '0');
INSERT INTO `jd_doctor` VALUES ('7', 'tkt5af02d78c3382', '涂革医生', '421124199209286019', '15021039436', '1003', '/uploads/image/images/20180416/20180416145952_86852.jpg', '/uploads/paper/20180509\\bd6dd507a29fe1c748e42781939af2d1.jpg', '1523516340', '0', '455224159@qq.com', '小图', '王硕', '2', '6', '15,16', '6,7', '25,26,27', '这是一位医生', '上午 11:30', '', '0', '0', '0', '0', '1', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '/uploads/code/1525689720code.png', '2', '1,2', '中级职称, 高级职称', '0', '0', '1527044157QpdNJM', 'kimormxc', '6561b636da9f0636a034b73a4cd03138', '1', '1', '63098CFE-B12F-4938-B699-82A65A53BC10', '1525689720', '27.115.75.166', '0.0.0.0', '1527044157', '0', '0', '0');
INSERT INTO `jd_doctor` VALUES ('8', 'tkt5af1b51289f9b', '王硕医生测试 1', '', '15021039435', '1004', '', '/uploads/paper/20180509\\bd6dd507a29fe1c748e42781939af2d1.jpg', '0', '0', '', '', '王硕', '2', '4', '15,16', '6,7', '', '', '上午 11:30', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '/uploads/code/1525789970code.png', '2', '1,2', '中级职称, 高级职称', '0', '0', '1528010845Pv9%pG', 'cowzzrep', '9825a6e8e0b2997a71130b4ac1cb2a81', '1', '1', '1DAE8E70-B0EE-44C7-922B-620E38E63E5F', '1525789970', '27.115.75.166', '0.0.0.0', '1528010845', '0', '0', '0');
INSERT INTO `jd_doctor` VALUES ('10', 'tkt5afa3b8991f09', '王硕', '', '17316392477', '1005', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/images/1527852951_175.png', '/uploads/paper/20180509\\bd6dd507a29fe1c748e42781939af2d1.jpg', '0', '0', '', '', '王小硕', '2', '0', '15,16', '', '', '', '上午 11:30', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '1', '0', '0', '60', '60', '5', '0', '1', '0', '0', '0', '0', '/uploads/code/1526348681code.png', '2', '1,2', '中级职称, 高级职称', '0', '0', '1527844733tSlUW}', 'yboftkcr', 'c75f0f87748588a8f0464e6451b60810', '1', '1', 'C82B67B7-9402-4B85-A23B-8F2215A0BADD', '1526348681', '27.115.75.166', '0.0.0.0', '1527844733', '1527852996', '1', '1527852996');
INSERT INTO `jd_doctor` VALUES ('11', 'tkt5afa8208f1275', '王硕医生测试 13', '', '15021039411', '1006', '', '/uploads/paper/20180509\\bd6dd507a29fe1c748e42781939af2d1.jpg', '0', '0', '', '', '涂革', '5', '17', '15,16', '', '', '', '上午 11:30', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '/uploads/code/1526366729code.png', '2', '1,2', '中级职称, 高级职称', '0', '0', '', 'lfrjsufp', '895e58abad9e336d820af97d379b0758', '0', '0', '', '1526366728', '', '0.0.0.0', '0', '0', '0', '0');
INSERT INTO `jd_doctor` VALUES ('12', 'tkt5afa82cf7d925', '王硕医生测试 14', '', '15032326969', '1007', '', '/uploads/paper/20180509\\bd6dd507a29fe1c748e42781939af2d1.jpg', '0', '0', '', '', '涂革', '5', '16', '15,16', '', '', '', '上午 11:30', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '/uploads/code/1526366927code.png', '2', '1,2', '', '0', '0', '', 'vutznqlb', '62df0f2fc9c50d68f3ca532a5378d725', '0', '0', '', '1526366927', '', '0.0.0.0', '0', '0', '0', '0');
INSERT INTO `jd_doctor` VALUES ('16', 'tkt5afecca94c83b', '王硕医生测试 16', '', '15818540817', '1011', '', '', '0', '0', '', '', 'buster', '2', '12', '', '', '25,26,27', '', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '/uploads/code/1526647977code.png', '2', '1,2', '', '0', '0', '1526920274#BNPd~', 'chjzsewp', '8900cb5c17b3d3f19082f41d245cb1c7', '1', '1', '2747A1DF-1EC4-4A32-9FBC-E726C69225AA', '1526647977', '183.17.59.149', '219.133.177.150', '1526920274', '0', '0', '0');
INSERT INTO `jd_doctor` VALUES ('17', 'tkt5affb3850009d', '王硕医生测试 17', '421124199209286019', '15196459798', '1012', '', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526711532_631.jpg', '0', '1', '', '', '涂革', '2', '6', '15', '12', '25,26,27', '你好, 我叫涂革', '0', '', '0', '0', '0', '0', '1', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '1', '0', '1', '100', '50', '0', '0', '1', '0', '0', '0', '0', '/uploads/code/1526707077code.png', '2', '1,2', '', '51300', '54840', '1527953309V{UfHp', 'srtmshlh', 'b2a5f78b5639043b17ccf701795f54d5', '1', '0', 'e605576c8d785b044c8a9ea2b0736745', '1526707076', '116.7.66.17', '116.7.66.23', '1527953309', '1527563032', '0', '0');
INSERT INTO `jd_doctor` VALUES ('19', 'tkt5b03a3a1984bc', '王硕医生测试 18', '', '18357202574', '1014', '', '', '0', '0', '', '', 'the', '2', '6', '', '18,6', '25,26,27', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '/uploads/code/1526965153code.png', '2', '1,2', '', '0', '0', '1527502892z4&RKv', 'zduovnww', 'c972e52d02db5f966742eee79bc873e3', '1', '1', '93DE2E23-2666-40AC-8724-C19FB4B54D88', '1526965153', '27.115.75.166', '27.115.75.166', '1527502892', '0', '0', '0');
INSERT INTO `jd_doctor` VALUES ('20', 'tkt5b03ba539b279', '王硕医生测试 19', '', '13918982886', '1015', '', '', '0', '0', '', '', '白旻', '0', '12', '0', '18,6', '25,26,27', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '/uploads/code/1526970963code.png', '2', '1,2', '', '0', '0', '1526970972TATD2V', '97c16446-cf64-844a-69f0-f61e3dfa6c60', '7c42b79c5a554e66f8663f25b435d22c', '1', '0', 'd239e2cb9ad69ec62fecd63f462c2667', '1526970963', '101.90.253.142', '101.90.253.142', '1526970972', '1527662404', '1', '1527662404');
INSERT INTO `jd_doctor` VALUES ('21', 'tkt5b03c031902eb', '王硕医生测试 10', '', '18008080402', '1016', '', '', '0', '0', '', '', '徐华', '1', '16', '', '18,6', '25,26,27', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '/uploads/code/1526972465code.png', '2', '1,2', '', '0', '0', '1526972477WZG0vJ', 'kfftfeak', '6159c1cd4b10491df6b1d8d3435b2ac4', '1', '0', 'cc9994d9ed8969d7cf71beaba7955706', '1526972465', '171.209.87.133', '171.209.87.133', '1526972477', '0', '0', '0');
INSERT INTO `jd_doctor` VALUES ('23', 'tkt5b0546c8044b2', '王硕医生测试 21', '', '18616349964', '1018', '', '', '0', '0', '', '', '麻辣香锅', '2', '12', '', '18,6', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '/uploads/code/1527072456code.png', '2', '1,2', '', '0', '0', '1527072487Hz@dZr', 'zlahilhq', 'add5eb7c233c4b076fe87bda27815145', '1', '1', '63098CFE-B12F-4938-B699-82A65A53BC10', '1527072456', '27.115.75.166', '27.115.75.166', '1527072487', '1527073292', '0', '0');
INSERT INTO `jd_doctor` VALUES ('24', 'tkt5b0656c76818c', '王硕医生测试 22', '', '18017240285', '1019', '', '', '0', '0', '', '', 'A', '2', '9', '', '18,6', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '/uploads/code/1527142087code.png', '2', '1,2', '', '0', '0', '1527142429&Bv3hP', 'hqktptyy', '549e38e37f8ac5b8dd37a76b03bd7ed7', '1', '0', 'd239e2cb9ad69ec62fecd63f462c2667', '1527142087', '101.90.253.142', '101.90.253.142', '1527142429', '0', '0', '0');
INSERT INTO `jd_doctor` VALUES ('25', 'tkt5b07b77e606b7', '刘帅兵', '1', '13262215137', '1020', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/images/1527822606_387.jpg', '/uploads/image/images/20180530/20180530204304_31025.png', '0', '1', '', '帅帅', '刘', '2', '18', '19', '6,18,5', '30,29,83', '大概不想健康状况看看手机dddd', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '1', '0', '0', '60', '60', '5', '0', '1', '0', '0', '0', '5', '/uploads/code/1527232382code.png', '2', '1,2', '', '7800', '33300', '1527996721Je[qdi', 'cf259213-8a02-2026-0998-94800900008a', '8f388bf85a553ac038201ac4f9cc3cdf', '1', '1', 'A17FC783-E9B9-4398-B082-9AAC7AF85309', '1527232382', '27.115.75.166', '27.115.75.166', '1527996721', '1527997547', '1', '1527853189');
INSERT INTO `jd_doctor` VALUES ('26', 'tkt5b07c03f2e244', '医生名称', '', '13310028293', '1021', '/Uploads/image/images/20180313/20180313031144_32708.jpg', '/Uploads/image/images/20180316/20180316044434_25520.jpg', '631238400', '1', '', '昵称', '真实姓名姓名', '1', '12', '14', '3,4,6,7,18,58', '85,83,82,80,78,75,73,63,59,56,55,49,20,19,18', '好我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍我的介绍', '', '', '0', '0', '4', '0', '1', '1', '0', '0', '0.00', '0.00', '0.00', '100', '100', '100', '100', '100', '1', '0', '0', '60', '60', '0', '1', '0', '0', '0', '0', '100', '/uploads/code/1527234623code.png', '2', '1,2', '', '14400', '25200', '1528013774$3~c*o', '979f7d9b-3c8a-7657-9727-20c40d145980', 'bff3b88560acf1e6d0b7c452d193996d', '1', '0', '089bd564b4a0a438202c0be3bfdcfd37', '1527234623', '101.90.126.91', '27.115.75.166', '1528013774', '1528011296', '1', '1527853233');
INSERT INTO `jd_doctor` VALUES ('27', '', '医生名称测试', '', '17316392471', '0', '/Uploads/image/images/20180313/20180313031144_32708.jpg', '', '1525779600', '1', '', '昵称', '真实姓名', '0', '12', '14', '18,6', '18,19,20', '个人介绍', '', '', '0', '0', '0', '0', '1', '1', '0', '0', '0.00', '0.00', '0.00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '11', '1', '1', '1', '1', '1', '1', '', '2', '1,2', '', '3600', '3600', '', 'e76315ce-f7c3-3380-e2ab-33b73847f3c2', '001b31e7d5ffba24ba8424437a37f216', '0', '0', '', '1527594119', '0.0.0.127', '0.0.0.127', '1527594119', '1527594164', '1', '1527594164');
INSERT INTO `jd_doctor` VALUES ('28', 'tkt5b0dd0d7262b0', '医生名称', '', '18717880292', '1022', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/images/1527727906_532.jpg', '', '0', '0', '', '', 'yy', '2', '12', '14,15', '1,2,3,4,5,6,18', '', '', '', '', '0', '0', '2', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '1', '1', '1', '1', '1', '1', '9', '1', '9', '9', '9', '0', '1', '0', '0', '0', '0', '/uploads/code/1527632087code.png', '2', '1,2', '', '0', '0', '1528012148{{Zh{m', 'mrntftsi', '289cad0d0b76c8a2156e423b2db34412', '1', '0', '29db6315f2a96f883fab514daf179573', '1527632087', '118.205.81.66', '124.14.41.210', '1528012148', '1527825158', '1', '1527825158');
INSERT INTO `jd_doctor` VALUES ('29', '', '潘芳', '', '12345123456', '0', '', '', '0', '1', '', '', '潘芳', '0', '18', '15', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '', '', '28800', '28800', '', 'eec8637e-1cda-24b5-4b40-99cc502d259e', '30486063942a7a829eb1a12b76d5a5be', '0', '0', '', '1527668475', '0.0.0.127', '0.0.0.127', '1527668475', '1527677025', '1', '1527677025');
INSERT INTO `jd_doctor` VALUES ('30', '', '毛秋芝', '', '12345123456', '0', '', '', '0', '1', '', '', '毛秋芝', '0', '', '17', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '', '', '28800', '28800', '', '34241517-3474-3bd1-404f-4c9cec204700', 'c396cdf9eedff38fdbbe095197de3936', '0', '0', '', '1527676765', '0.0.0.127', '0.0.0.127', '1527676765', '1527677061', '1', '1527677061');
INSERT INTO `jd_doctor` VALUES ('31', '', '杨优洲', '', '12345123456', '0', '', '', '0', '1', '', '', '杨优洲', '0', '', '0', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '', '', '28800', '28800', '', '5fd94620-48c8-bc4a-712d-1d30be5f34ca', 'aa098c9b3f025fa2390c2436d8cc5615', '0', '0', '', '1527676910', '0.0.0.127', '0.0.0.127', '1527676910', '1527677036', '1', '1527677036');
INSERT INTO `jd_doctor` VALUES ('32', '', '唐明华', '', '12345123456', '0', '', '', '0', '1', '', '', '唐明华', '0', '', '16', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '', '', '28800', '28800', '', '4cf94399-5c68-3bd4-b9f6-c2cce94d24d9', 'e77a3f5afe61d7a6cf7b95f514e97761', '0', '0', '', '1527676979', '0.0.0.127', '0.0.0.127', '1527676979', '1527677008', '1', '1527677008');
INSERT INTO `jd_doctor` VALUES ('33', '', '魏美娟', '', '12345123456', '0', '', '', '0', '1', '', '', '魏美娟', '0', '', '17', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '', '', '28800', '28800', '', '9524ea21-2277-9b8b-2028-57abf7e91aa1', '9146f075fac9087fb37b769966312611', '0', '0', '', '1527677340', '0.0.0.127', '0.0.0.127', '1527677340', '1527677349', '1', '1527677349');
INSERT INTO `jd_doctor` VALUES ('34', '', '孟炜', '', '12345123456', '0', '', '', '0', '1', '', '', '孟炜', '0', '0', '17', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '', '', '28800', '28800', '', 'ef3c2f0c-b0f0-d2b8-60e2-da33ecbfc50a', '0c6816a5ca1f108cebcce4c91f5cec4f', '0', '0', '', '1527677377', '0.0.0.127', '0.0.0.127', '1527677377', '1527681478', '1', '1527681478');
INSERT INTO `jd_doctor` VALUES ('35', '', '俞瑾', '', '12345123456', '0', '', '', '0', '1', '', '', '俞瑾', '0', '0', '19', '', '29,30,31,32,33,34,35', '复旦大学附属妇产科医院和澳大利亚南威尔士大学教授、博士生导师，首批上海市名中医，兼任中国中西结合学会妇产科专业委员会名誉主任委员、上海泰坤堂中医医院名誉院长等。从事生殖内分泌学、中西医结合妇产科学的医教研工作60年，对妇女从幼年期到青春期、生育期、围绝经期和老年期的妇科病进行中西医结合的临床和试验研究，疗效显著，观点创新，研究项目共获上海市及部级科技奖17次。在国内外核心期刊及重要杂志发表论文200余篇余篇，获论文奖9篇，在中国大陆及台湾、美国、法国、德国等出版专著26部。俞瑾教授一直致力于中西医结合女性健康事业的推广，学生遍及世界各大州。30余次受邀赴美、日、德、意、瑞士、韩、保等国进行学术交流，并于1997年在美国国立卫生研究院（NIH）针刺听证会上进行“针刺促排卵”演讲，受到世界性重视。被推崇为“中西医结合妇产科学的鼻祖”。俞瑾治愈的不孕患者遍布全球，因此被称为“世界外婆”', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '', '', '28800', '28800', '', 'e0784b6f-2c4a-8b38-3c3b-e6d43f1f37ae', '5062b931807f6ce8c967064fff921c85', '0', '0', '', '1527677425', '0.0.0.127', '0.0.0.127', '1527677425', '1527681528', '1', '1527681528');
INSERT INTO `jd_doctor` VALUES ('36', 'tkt5b10f0a0befa2', '', '430524199606223663', '15618720097', '1023', '', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1527869627_751.jpg', '1527868800', '1', '', '', '刘帅兵', '2', '18', '19', '67', '78', '无', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '/uploads/code/1527836832code.png', '1', '', '主任医师', '0', '0', '1527927913HlU4**', 'kaphsqsz', '730c2832e77885b4563c6e4d1276747c', '1', '1', '43444641-49A2-4469-A0B1-68FCF1490B37', '1527836832', '101.245.94.198', '27.115.75.166', '1527927913', '1527869628', '0', '0');
INSERT INTO `jd_doctor` VALUES ('37', 'tkt5b10f13d07ce7', '', '440222199208210018', '13077847205', '1024', '', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1527844061_769.jpg', '1527782400', '0', '', '', 'did', '2', '12', '19', '18', '84,83', '2222', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '/uploads/code/1527836989code.png', '1', '', '主任医师', '0', '0', '1527862007#mN*6R', 'fgocvoml', '4d4244ad8690bb997c7b4b2c7ff35fd3', '1', '1', '20EBDABC-26B9-4CC4-B786-0DB680972785', '1527836989', '27.38.32.37', '27.38.32.20', '1527862007', '1527844063', '0', '0');
INSERT INTO `jd_doctor` VALUES ('38', 'tkt5b1254bb8d3eb', '', '430524199606223663', '18225610097', '1025', '', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1527928233_929.jpg', '1527868800', '0', '', '', '就看看', '2', '18', '19', '58', '71,65,60,82', '无', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '/uploads/code/1527927995code.png', '1', '', '主任医师', '0', '0', '1527928145paoVF@', 'slfhcnkf', '7892ec751f8b0d1ff7fb665fa08ac567', '1', '1', '43444641-49A2-4469-A0B1-68FCF1490B37', '1527927995', '101.245.94.198', '101.245.94.198', '1527928145', '1527928308', '0', '0');
INSERT INTO `jd_doctor` VALUES ('43', 'tkt5b139553b35b7', '', '', '15021039455', '1026', '', '', '0', '0', '', '', '测试数据', '2', '18', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '/uploads/code/1528010067code.png', '2', '', '', '0', '0', '1528010417zBKr{0', 'qspwamnx', 'aca9a03939de315c558945784704a8e7', '1', '1', '1DAE8E70-B0EE-44C7-922B-620E38E63E5F', '1528010067', '27.115.75.166', '27.115.75.166', '1528010417', '0', '0', '0');

-- ----------------------------
-- Table structure for jd_doctor_count
-- ----------------------------
DROP TABLE IF EXISTS `jd_doctor_count`;
CREATE TABLE `jd_doctor_count` (
  `doctor_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生ID',
  `day_date` int(10) NOT NULL DEFAULT '0' COMMENT '每日日期时间戳',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '每日接单次数',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  KEY `doctor_id` (`doctor_id`),
  KEY `day_date` (`day_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生每日接单次数';

-- ----------------------------
-- Records of jd_doctor_count
-- ----------------------------
INSERT INTO `jd_doctor_count` VALUES ('2', '1526572800', '8', '1526630419');

-- ----------------------------
-- Table structure for jd_doctor_daycount
-- ----------------------------
DROP TABLE IF EXISTS `jd_doctor_daycount`;
CREATE TABLE `jd_doctor_daycount` (
  `doctor_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生ID',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `day_count` int(11) NOT NULL DEFAULT '0' COMMENT '群发次数',
  `day_date` int(11) NOT NULL DEFAULT '0' COMMENT '月份日期',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生每月群发次数表';

-- ----------------------------
-- Records of jd_doctor_daycount
-- ----------------------------

-- ----------------------------
-- Table structure for jd_doctor_disturbcount
-- ----------------------------
DROP TABLE IF EXISTS `jd_doctor_disturbcount`;
CREATE TABLE `jd_doctor_disturbcount` (
  `doctor_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生ID',
  `disturb_count` int(11) NOT NULL DEFAULT '0' COMMENT '群发次数',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关闭免打扰后执行的友盟操作';

-- ----------------------------
-- Records of jd_doctor_disturbcount
-- ----------------------------

-- ----------------------------
-- Table structure for jd_doctor_haircount
-- ----------------------------
DROP TABLE IF EXISTS `jd_doctor_haircount`;
CREATE TABLE `jd_doctor_haircount` (
  `doctor_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生ID',
  `hair_count` int(11) NOT NULL DEFAULT '0' COMMENT '群发次数',
  `message_count` int(11) NOT NULL DEFAULT '0' COMMENT '短信次数',
  `moon_date` int(11) NOT NULL DEFAULT '0' COMMENT '月份日期',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生每月群发次数表';

-- ----------------------------
-- Records of jd_doctor_haircount
-- ----------------------------

-- ----------------------------
-- Table structure for jd_doctor_info
-- ----------------------------
DROP TABLE IF EXISTS `jd_doctor_info`;
CREATE TABLE `jd_doctor_info` (
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生id',
  `job_pic1` varchar(255) NOT NULL DEFAULT '' COMMENT '职业证书1',
  `job_pic2` varchar(255) NOT NULL DEFAULT '' COMMENT '职业证书2',
  `quali_pic1` varchar(255) NOT NULL DEFAULT '' COMMENT '资格证书1',
  `quali_pic2` varchar(255) NOT NULL DEFAULT '' COMMENT '资格证书2',
  `tech_pic1` varchar(255) NOT NULL DEFAULT '' COMMENT '专业技术资格证书',
  `tech_pic2` varchar(255) NOT NULL DEFAULT '' COMMENT '专业技术资格证书2',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `release_date` int(8) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `aid` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员最后一次操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生证书列表';

-- ----------------------------
-- Records of jd_doctor_info
-- ----------------------------
INSERT INTO `jd_doctor_info` VALUES ('2', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526709854_900.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526709854_489.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526709860_746.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526709862_868.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526709856_623.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526709858_347.jpg', '1525847332', '1526709863', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('17', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526711532_671.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526711532_812.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526711538_546.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526711541_125.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526711535_314.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526711537_237.jpg', '1526711542', '1526711542', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('15', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526713220_510.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526713220_596.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526713221_319.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526713222_120.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526713223_215.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526713223_401.jpg', '1526712963', '1526713223', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('26', '/Uploads/image/images/20180313/20180313031144_32708.jpg', '', '', '', '', '', '0', '0', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('27', '', '', '', '', '', '', '0', '0', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('28', '', '', '', '', '', '', '0', '0', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('20', '', '', '', '', '', '', '0', '0', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('29', '', '', '', '', '', '', '0', '0', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('30', '', '', '', '', '', '', '0', '0', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('31', '', '', '', '', '', '', '0', '0', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('29', '', '', '', '', '', '', '0', '0', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('30', '', '', '', '', '', '', '0', '0', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('31', '', '', '', '', '', '', '0', '0', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('32', '', '', '', '', '', '', '0', '0', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('33', '', '', '', '', '', '', '0', '0', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('34', '', '', '', '', '', '', '0', '0', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('35', '', '', '', '', '', '', '0', '0', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('25', '', '', '', '', '', '', '0', '0', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('10', '', '', '', '', '', '', '0', '0', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('37', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1527844061_716.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1527844061_108.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1527844061_471.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1527844062_538.jpg', '', '', '1527844063', '1527844063', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('36', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1527869627_137.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1527869627_191.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1527869628_648.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1527869628_298.jpg', '', '', '1527869628', '1527869628', '0', '0');
INSERT INTO `jd_doctor_info` VALUES ('38', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1527928234_792.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1527928234_304.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1527928234_336.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1527928235_153.jpg', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1527928235_490.jpg', '', '1527928235', '1527928235', '0', '0');

-- ----------------------------
-- Table structure for jd_doctor_member
-- ----------------------------
DROP TABLE IF EXISTS `jd_doctor_member`;
CREATE TABLE `jd_doctor_member` (
  `dcmember_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '患者ID',
  `doctor_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生ID',
  `inquisition_name` varchar(20) NOT NULL DEFAULT '' COMMENT '问诊/复诊/扫码',
  `inquisition` int(10) NOT NULL DEFAULT '0' COMMENT '问诊/复诊时间',
  `grouping` text NOT NULL COMMENT '分组',
  `end_date` int(10) NOT NULL DEFAULT '0' COMMENT '最后一次回答时间',
  `synopsis` varchar(30) NOT NULL DEFAULT '' COMMENT '咨询患者列表显示的',
  `is_show` int(3) NOT NULL DEFAULT '1' COMMENT '是否显示 0 不显示 1 显示',
  `is_chat` int(3) NOT NULL DEFAULT '0' COMMENT '是否在聊天界面中 1 是',
  `is_status` int(3) NOT NULL DEFAULT '1' COMMENT '是否已读 1 未读 0 已读 ',
  `counsell_number` int(11) NOT NULL DEFAULT '0' COMMENT '咨询数量',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `release_date` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`dcmember_id`),
  KEY `member_id` (`member_id`),
  KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='医生下面的患者表';

-- ----------------------------
-- Records of jd_doctor_member
-- ----------------------------

-- ----------------------------
-- Table structure for jd_doctor_service
-- ----------------------------
DROP TABLE IF EXISTS `jd_doctor_service`;
CREATE TABLE `jd_doctor_service` (
  `member_id` int(8) NOT NULL DEFAULT '0' COMMENT '医生表主键 id',
  `buy_once` tinyint(1) NOT NULL DEFAULT '0' COMMENT '已开药方是否只允许患者购买一次 0否1是',
  `choose_hospital` tinyint(1) NOT NULL DEFAULT '0' COMMENT '患者须按照我选药方购药 0否1是',
  `cannot_select` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否让平台搜不到该医生 0否1是',
  `hide_count` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏服务人数和复诊率 0否1是',
  `question_count` int(5) NOT NULL DEFAULT '0' COMMENT '患者首次扫码后赠送的免费提问次数',
  `aid` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员最后一次操作时间',
  KEY `member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生药方及服务设置列表(此表补充医生表的数据)';

-- ----------------------------
-- Records of jd_doctor_service
-- ----------------------------

-- ----------------------------
-- Table structure for jd_drug
-- ----------------------------
DROP TABLE IF EXISTS `jd_drug`;
CREATE TABLE `jd_drug` (
  `drug_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `prescription_id` int(8) NOT NULL DEFAULT '0' COMMENT '所属药房id',
  `drug_name` varchar(255) NOT NULL DEFAULT '' COMMENT '药品名',
  `his_drug_id` int(8) NOT NULL DEFAULT '0' COMMENT 'his中的药品id',
  `pos_code` varchar(255) NOT NULL DEFAULT '' COMMENT '药品类别',
  `manufacturer` varchar(355) NOT NULL DEFAULT '' COMMENT '生产厂家',
  `goods_code` varchar(255) NOT NULL DEFAULT '' COMMENT '药品编码',
  `k_name` varchar(255) NOT NULL DEFAULT '' COMMENT '药库名',
  `Drug_spec` varchar(255) NOT NULL DEFAULT '' COMMENT '标准包装',
  `Drug_unit` varchar(255) NOT NULL DEFAULT '' COMMENT '单位',
  `Is_user` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0不使用 1使用',
  `price` decimal(8,4) NOT NULL DEFAULT '0.0000' COMMENT '价格',
  `num` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '库存数量',
  `money` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '库存总价',
  `sort` int(5) NOT NULL DEFAULT '0' COMMENT '权重 倒序',
  `aid` int(8) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `date` varchar(255) NOT NULL DEFAULT '' COMMENT 'his里的更新时间',
  `release_date` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `other_name` varchar(255) NOT NULL DEFAULT '' COMMENT '配伍禁忌的名字   用于配伍禁忌查询',
  `nick_name` varchar(255) NOT NULL DEFAULT '' COMMENT '别名',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '简拼 以半角逗号拼接  用于模糊搜索',
  PRIMARY KEY (`drug_id`),
  KEY `his_drug_id` (`his_drug_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=761 DEFAULT CHARSET=utf8 COMMENT='药品表';

-- ----------------------------
-- Records of jd_drug
-- ----------------------------
INSERT INTO `jd_drug` VALUES ('1', '1', '白薇', '223', '中药', '', '01-028-01', '中药库', 'g', 'g', '0', '0.1375', '926.0000', '127.3200', '0', '1', '1527667731', '2018/5/9 1:00:00', '1525864231', '1525863853', '', '白薇', 'BW');
INSERT INTO `jd_drug` VALUES ('2', '1', '白及', '229', '中药', '', '01-031-01', '中药库', 'g', 'g', '1', '2.0625', '1698.0000', '3592.8750', '0', '0', '0', '2018/5/9 1:00:00', '1527930617', '1525863853', '', '白及', 'BJ');
INSERT INTO `jd_drug` VALUES ('3', '1', '延胡索(元胡,玄胡)', '231', '中药', '', '01-032-01', '中药库', 'g', 'g', '0', '0.1625', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864231', '1525863853', '', '延胡索', 'YHS,YH,XH');
INSERT INTO `jd_drug` VALUES ('4', '1', '川牛膝', '233', '中药', '', '01-033-01', '中药库', 'g', 'g', '1', '0.0700', '11350.0000', '794.6400', '0', '0', '0', '2018/5/9 1:00:00', '1528013442', '1525863853', '', '川牛膝', 'CNX');
INSERT INTO `jd_drug` VALUES ('5', '1', '牛膝(牛膝)', '235', '中药', '', '01-033-03', '中药库', 'g', 'g', '1', '0.0630', '2771.0000', '174.5900', '0', '0', '0', '2018/5/9 1:00:00', '1525864231', '1525863853', '', '牛膝', 'NX');
INSERT INTO `jd_drug` VALUES ('6', '1', '蜜麸炒木香(木香（麸炒）)', '260', '中药', '', '01-040-02', '中药库', 'g', 'g', '1', '0.0450', '24764.0000', '1114.6900', '0', '0', '0', '2018/5/9 1:00:00', '1528013442', '1525863854', '', '蜜麸炒木香', 'MFCMX,MX,FC');
INSERT INTO `jd_drug` VALUES ('7', '1', '郁金(广)', '266', '中药', '', '01-041-02', '中药库', 'g', 'g', '1', '0.0750', '14247.0000', '1068.4050', '0', '0', '0', '2018/5/9 1:00:00', '1525864232', '1525863854', '郁金', '郁金', 'YJ,G');
INSERT INTO `jd_drug` VALUES ('8', '1', '制半夏', '268', '中药', '', '01-042-01', '中药库', 'g', 'g', '1', '0.3680', '16027.0000', '5898.3460', '0', '0', '0', '2018/5/9 1:00:00', '1527866521', '1525863854', '半夏', '制半夏', 'ZBX,BX');
INSERT INTO `jd_drug` VALUES ('9', '1', '玉竹', '299', '中药', '', '01-050-01', '中药库', 'g', 'g', '1', '0.0925', '3020.0000', '279.0950', '0', '0', '0', '2018/5/9 1:00:00', '1525864232', '1525863854', '', '玉竹', 'YZ');
INSERT INTO `jd_drug` VALUES ('10', '1', '蜜紫菀', '302', '中药', '', '01-051-01', '中药库', 'g', 'g', '1', '0.0688', '5402.0000', '371.6748', '0', '0', '0', '2018/5/9 1:00:00', '1525864232', '1525863854', '', '蜜紫菀', 'MZW');
INSERT INTO `jd_drug` VALUES ('11', '1', '羌活', '304', '中药', '', '01-052-01', '中药库', 'g', 'g', '1', '0.4350', '37891.0000', '16482.5950', '0', '0', '0', '2018/5/9 1:00:00', '1525864232', '1525863855', '', '羌活', 'QH');
INSERT INTO `jd_drug` VALUES ('12', '1', '独活', '306', '中药', '', '01-053-01', '中药库', 'g', 'g', '1', '0.0575', '35072.0000', '2020.7325', '0', '0', '0', '2018/5/9 1:00:00', '1527930881', '1525863855', '', '独活', 'DH');
INSERT INTO `jd_drug` VALUES ('13', '1', '防风', '308', '中药', '', '01-054-01', '中药库', 'g', 'g', '1', '0.0988', '40796.0000', '4026.6675', '0', '1', '1527667304', '2018/5/9 1:00:00', '1527874765', '1525863855', '', '防风', 'FF');
INSERT INTO `jd_drug` VALUES ('14', '1', '防己', '311', '中药', '', '01-055-02', '中药库', 'g', 'g', '1', '0.2063', '760.0000', '156.7500', '0', '0', '0', '2018/5/9 1:00:00', '1525864233', '1525863855', '', '防己', 'FJ');
INSERT INTO `jd_drug` VALUES ('15', '1', '胡黄连', '313', '中药', '', '01-056-01', '中药库', 'g', 'g', '1', '0.3450', '575.0000', '198.3750', '0', '0', '0', '2018/5/9 1:00:00', '1525864233', '1525863855', '', '胡黄连', 'HHL');
INSERT INTO `jd_drug` VALUES ('16', '1', '制何首乌(首乌)', '337', '中药', '', '01-066-02', '中药库', 'g', 'g', '1', '0.0700', '10463.0000', '732.4100', '0', '0', '0', '2018/5/9 1:00:00', '1525864233', '1525863855', '', '制何首乌', 'ZHSW,SW');
INSERT INTO `jd_drug` VALUES ('17', '1', '制川乌', '339', '中药', '', '01-067-02', '中药库', 'g', 'g', '1', '0.1050', '39067.0000', '4102.7750', '0', '0', '0', '2018/5/9 1:00:00', '1528004314', '1525863855', '川乌', '制川乌', 'ZCW');
INSERT INTO `jd_drug` VALUES ('18', '1', '制草乌', '341', '中药', '', '01-068-02', '中药库', 'g', 'g', '1', '0.1563', '800.0000', '125.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864233', '1525863855', '草乌', '制草乌', 'ZCW');
INSERT INTO `jd_drug` VALUES ('19', '1', '石菖蒲', '383', '中药', '', '01-087-01', '中药库', 'g', 'g', '1', '0.1450', '9425.0000', '1366.6450', '0', '0', '0', '2018/5/9 1:00:00', '1525864233', '1525863856', '', '石菖蒲', 'SCP');
INSERT INTO `jd_drug` VALUES ('20', '1', '茜草', '385', '中药', '', '01-089-01', '中药库', 'g', 'g', '1', '0.3350', '15075.0000', '5050.0900', '0', '0', '0', '2018/5/9 1:00:00', '1525864233', '1525863856', '', '茜草', 'QC');
INSERT INTO `jd_drug` VALUES ('21', '1', '茜草炭', '386', '中药', '', '01-089-02', '中药库', 'g', 'g', '1', '0.3750', '6508.0000', '2440.4950', '0', '0', '0', '2018/5/9 1:00:00', '1525864233', '1525863856', '', '茜草炭', 'QCT');
INSERT INTO `jd_drug` VALUES ('22', '1', '百部', '387', '中药', '', '01-090-01', '中药库', 'g', 'g', '1', '0.0800', '4882.0000', '390.5600', '0', '0', '0', '2018/5/9 1:00:00', '1525864234', '1525863856', '', '百部', 'BB');
INSERT INTO `jd_drug` VALUES ('23', '1', '白茅根', '409', '中药', '', '01-101-04', '中药库', 'g', 'g', '1', '0.0650', '3120.0000', '202.8000', '0', '0', '0', '2018/5/9 1:00:00', '1525864234', '1525863856', '', '白茅根', 'BMG');
INSERT INTO `jd_drug` VALUES ('24', '1', '山豆根', '412', '中药', '', '01-102-01', '中药库', 'g', 'g', '1', '0.5150', '2656.0000', '1368.8700', '0', '0', '0', '2018/5/9 1:00:00', '1527923442', '1525863856', '', '山豆根', 'SDG');
INSERT INTO `jd_drug` VALUES ('25', '1', '苎麻根', '414', '中药', '', '01-104-01', '中药库', 'g', 'g', '1', '0.0290', '6013.0000', '174.3500', '0', '0', '0', '2018/5/9 1:00:00', '1525864234', '1525863856', '', '苎麻根', 'ZMG');
INSERT INTO `jd_drug` VALUES ('26', '1', '麻黄根', '417', '中药', '', '01-106-01', '中药库', 'g', 'g', '1', '0.0488', '1143.0000', '55.7213', '0', '0', '0', '2018/5/9 1:00:00', '1525864234', '1525863856', '', '麻黄根', 'MHG');
INSERT INTO `jd_drug` VALUES ('27', '1', '糯稻根', '418', '中药', '', '01-107-01', '中药库', 'g', 'g', '1', '0.0438', '1655.0000', '72.3625', '0', '0', '0', '2018/5/9 1:00:00', '1525864234', '1525863857', '', '糯稻根', 'NDG');
INSERT INTO `jd_drug` VALUES ('28', '1', '猫爪草', '419', '中药', '', '01-108-01', '中药库', 'g', 'g', '1', '0.2250', '183.0000', '41.1750', '0', '0', '0', '2018/5/9 1:00:00', '1525864234', '1525863857', '', '猫爪草', 'MZC');
INSERT INTO `jd_drug` VALUES ('29', '1', '天葵子', '447', '中药', '', '01-129-01', '中药库', 'g', 'g', '1', '0.1288', '683.0000', '88.5800', '0', '0', '0', '2018/5/9 1:00:00', '1527955961', '1525863857', '', '天葵子', 'TKZ');
INSERT INTO `jd_drug` VALUES ('30', '1', '金荞麦(金荞麦根，野荞麦根)', '455', '中药', '', '01-138-01', '中药库', 'g', 'g', '1', '0.0525', '1736.8000', '91.1820', '0', '0', '0', '2018/5/9 1:00:00', '1525864235', '1525863857', '', '金荞麦', 'JQM,JQMG,YQMG');
INSERT INTO `jd_drug` VALUES ('31', '1', '虎杖', '457', '中药', '', '01-141-01', '中药库', 'g', 'g', '1', '0.0350', '8347.0000', '292.1050', '0', '0', '0', '2018/5/9 1:00:00', '1525864235', '1525863857', '', '虎杖', 'HZ');
INSERT INTO `jd_drug` VALUES ('32', '1', '羊乳根(山海螺、天海螺、四叶参、羊乳)', '492', '中药', '', '01-179-01', '中药库', 'g', 'g', '1', '0.1150', '1305.0000', '150.0750', '0', '0', '0', '2018/5/9 1:00:00', '1525864235', '1525863857', '', '羊乳根', 'YRG,SHL,THL,SYS,YR');
INSERT INTO `jd_drug` VALUES ('33', '1', '菝葜(金刚藤，金刚刺)', '493', '中药', '', '01-182-01', '中药库', 'g', 'g', '1', '0.0300', '5069.0000', '152.0700', '0', '0', '0', '2018/5/9 1:00:00', '1525864235', '1525863857', '', '菝葜', 'BQ,JGT,JGC');
INSERT INTO `jd_drug` VALUES ('34', '1', '七叶一枝花(重楼)(重楼)', '495', '中药', '', '01-184-01', '中药库', 'g', 'g', '1', '2.0800', '5145.0000', '10701.6000', '0', '0', '0', '2018/5/9 1:00:00', '1525864235', '1525863857', '', '七叶一枝花', 'QYYZH,CL');
INSERT INTO `jd_drug` VALUES ('35', '1', '蛇六谷', '496', '中药', '', '01-185-01', '中药库', 'g', 'g', '1', '0.0960', '2760.0000', '264.9600', '0', '0', '0', '2018/5/9 1:00:00', '1525864235', '1525863858', '', '蛇六谷', 'SLG');
INSERT INTO `jd_drug` VALUES ('36', '1', '枸杞子', '525', '中药', '', '02-001-01', '中药库', 'g', 'g', '1', '0.1030', '8251.0000', '850.3090', '0', '0', '0', '2018/5/9 1:00:00', '1525864235', '1525863858', '', '枸杞子', 'JQZ');
INSERT INTO `jd_drug` VALUES ('37', '1', '砂仁(绿壳砂)(西砂仁)', '526', '中药', '', '02-002-01', '中药库', 'g', 'g', '0', '1.4250', '595.0000', '847.6050', '0', '0', '0', '2018/5/9 1:00:00', '1525864236', '1525863858', '', '砂仁', 'SR,LKS,XSR');
INSERT INTO `jd_drug` VALUES ('38', '1', '制五味子', '532', '中药', '', '02-005-02', '中药库', 'g', 'g', '0', '0.4000', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864236', '1525863858', '', '制五味子', 'ZWWZ');
INSERT INTO `jd_drug` VALUES ('39', '1', '生栀子(生山栀 生栀子)', '535', '中药', '', '02-006-01', '中药库', 'g', '克', '1', '0.0900', '12380.0000', '1114.2000', '0', '0', '0', '2018/5/9 1:00:00', '1525864236', '1525863858', '', '生栀子', 'SZZ,SSZ,SZZ');
INSERT INTO `jd_drug` VALUES ('40', '1', '焦栀子(栀子炭 焦山栀)', '536', '中药', '', '02-006-02', '中药库', 'g', '克', '1', '0.1200', '4107.0000', '492.8400', '0', '0', '0', '2018/5/9 1:00:00', '1525864236', '1525863858', '', '焦栀子', 'JZZ,ZZT,JSZ');
INSERT INTO `jd_drug` VALUES ('41', '1', '牛蒡子(大力子)', '540', '中药', '', '02-007-01', '中药库', 'g', 'g', '0', '0.0800', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864236', '1525863858', '', '牛蒡子', 'NBZ,DLZ');
INSERT INTO `jd_drug` VALUES ('42', '1', '菟丝子(吐丝子)', '561', '中药', '', '02-016-01', '中药库', 'g', 'g', '1', '0.1200', '18669.0000', '2240.2800', '0', '0', '0', '2018/5/9 1:00:00', '1525864236', '1525863859', '', '菟丝子', 'TSZ,TSZ');
INSERT INTO `jd_drug` VALUES ('43', '1', '南葶苈子', '565', '中药', '', '02-017-02', '中药库', 'g', 'g', '1', '0.0370', '1230.0000', '45.5150', '0', '0', '0', '2018/5/9 1:00:00', '1525864236', '1525863859', '', '南葶苈子', 'NTLZ');
INSERT INTO `jd_drug` VALUES ('44', '1', '梅花(绿萼梅)', '3096', '中药', '', 'ZZMH02', '中药库', 'g', 'g', '1', '0.6500', '2842.0000', '1847.3000', '0', '0', '0', '2018/5/9 1:00:00', '1525864236', '1525863859', '', '梅花', 'MH,LEM');
INSERT INTO `jd_drug` VALUES ('45', '1', '热敷', '129', '中药', '', '301*', '中药库', '袋', '袋', '0', '25.3000', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864237', '1525863859', '', '热敷', 'RF');
INSERT INTO `jd_drug` VALUES ('46', '1', '西洋参', '1667', '贵细', '', 'ZZ-XYS', '中药库', 'g', 'g', '1', '3.5000', '953.0000', '3335.5000', '0', '0', '0', '2018/5/9 1:00:00', '1525864237', '1525863859', '', '西洋参', 'XYC');
INSERT INTO `jd_drug` VALUES ('47', '1', '地黄', '183', '中药', '', '01-018-01', '中药库', 'g', 'g', '1', '0.0400', '37035.0000', '1481.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864237', '1525863859', '', '地黄', 'DH');
INSERT INTO `jd_drug` VALUES ('48', '1', '白芍', '1826', '颗粒', '广东一方制药有限公司', '14170', '中药库', '10克/袋', '袋', '1', '2.4600', '154.0000', '378.8400', '0', '0', '0', '2018/5/9 1:00:00', '1525864237', '1525863859', '白芍', '白芍', 'BS');
INSERT INTO `jd_drug` VALUES ('49', '1', '白术', '1827', '颗粒', '广东一方制药有限公司', '14171', '中药库', '10克/袋', '袋', '1', '2.3900', '212.0000', '506.6800', '0', '0', '0', '2018/5/9 1:00:00', '1525864237', '1525863859', '', '白术', 'BS');
INSERT INTO `jd_drug` VALUES ('50', '1', '白茅根', '1832', '颗粒', '广东一方制药有限公司', '14176', '中药库', '15克/袋', '袋', '1', '0.9800', '201.0000', '196.9800', '0', '0', '0', '2018/5/9 1:00:00', '1525864237', '1525863860', '', '白茅根', 'BMG');
INSERT INTO `jd_drug` VALUES ('51', '1', '百合', '1835', '颗粒', '广东一方制药有限公司', '14178', '中药库', '10克/袋', '袋', '1', '2.0200', '134.0000', '270.6800', '0', '0', '0', '2018/5/9 1:00:00', '1525864237', '1525863860', '', '百合', 'BH');
INSERT INTO `jd_drug` VALUES ('52', '1', '补骨脂', '1847', '颗粒', '广东一方制药有限公司', '14190', '中药库', '10克/袋', '袋', '1', '1.0000', '235.0000', '235.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864237', '1525863860', '', '补骨脂', 'BGZ');
INSERT INTO `jd_drug` VALUES ('53', '1', '苍术', '1849', '颗粒', '广东一方制药有限公司', '14192', '中药库', '10克/袋', '袋', '1', '3.2800', '290.0000', '951.2000', '0', '0', '0', '2018/5/9 1:00:00', '1525864238', '1525863860', '', '苍术', 'CS');
INSERT INTO `jd_drug` VALUES ('54', '1', '柴胡', '1853', '颗粒', '广东一方制药有限公司', '14196', '中药库', '6克/袋', '袋', '1', '3.3600', '529.0000', '1777.4400', '0', '0', '0', '2018/5/9 1:00:00', '1525864238', '1525863860', '', '柴胡', 'CH');
INSERT INTO `jd_drug` VALUES ('55', '1', '炒白芍', '1856', '颗粒', '广东一方制药有限公司', '14199', '中药库', '10克/袋', '袋', '1', '2.6000', '275.0000', '715.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864238', '1525863860', '白芍', '炒白芍', 'CBS');
INSERT INTO `jd_drug` VALUES ('56', '1', '炒麦芽', '1870', '颗粒', '广东一方制药有限公司', '14213', '中药库', '15克/袋', '袋', '1', '1.2000', '248.0000', '297.6000', '0', '0', '0', '2018/5/9 1:00:00', '1525864238', '1525863860', '', '炒麦芽', 'CMY');
INSERT INTO `jd_drug` VALUES ('57', '1', '车前子', '1882', '颗粒', '广东一方制药有限公司', '14225', '中药库', '10克/袋', '袋', '1', '1.4900', '829.0000', '1235.2100', '0', '0', '0', '2018/5/9 1:00:00', '1525864238', '1525863861', '', '车前子', 'CQZ');
INSERT INTO `jd_drug` VALUES ('58', '1', '陈皮', '1884', '颗粒', '广东一方制药有限公司', '14227', '中药库', '6克/袋', '袋', '1', '0.6800', '365.0000', '248.2000', '0', '0', '0', '2018/5/9 1:00:00', '1525864238', '1525863861', '', '陈皮', 'CP');
INSERT INTO `jd_drug` VALUES ('59', '1', '川木通', '1891', '颗粒', '广东一方制药有限公司', '14233', '中药库', '6克/袋', '袋', '0', '0.6500', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864238', '1525863861', '', '川木通', 'CMT');
INSERT INTO `jd_drug` VALUES ('60', '1', '川牛膝', '1892', '颗粒', '广东一方制药有限公司', '14234', '中药库', '10克/袋', '袋', '1', '1.6900', '11350.0000', '277.1600', '0', '0', '0', '2018/5/9 1:00:00', '1528013442', '1525863861', '', '川牛膝', 'CNX');
INSERT INTO `jd_drug` VALUES ('61', '1', '川芎', '1893', '颗粒', '广东一方制药有限公司', '14235', '中药库', '6克/袋', '袋', '1', '1.7500', '110.0000', '192.5000', '0', '0', '0', '2018/5/9 1:00:00', '1525864239', '1525863861', '', '川芎', 'CX');
INSERT INTO `jd_drug` VALUES ('62', '1', '穿心莲', '1896', '颗粒', '广东一方制药有限公司', '14238', '中药库', '10克/袋', '袋', '1', '1.0300', '16.0000', '16.4800', '0', '0', '0', '2018/5/9 1:00:00', '1525864239', '1525863861', '', '穿心莲', 'CXL');
INSERT INTO `jd_drug` VALUES ('63', '1', '醋鳖甲', '1902', '颗粒', '广东一方制药有限公司', '14244', '中药库', '10克/袋', '袋', '1', '9.9500', '113.0000', '1124.3500', '0', '0', '0', '2018/5/9 1:00:00', '1525864239', '1525863862', '', '醋鳖甲', 'CBJ');
INSERT INTO `jd_drug` VALUES ('64', '1', '醋龟甲', '1905', '颗粒', '广东一方制药有限公司', '14247', '中药库', '10克/袋', '袋', '1', '12.0600', '240.0000', '2894.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864239', '1525863862', '', '醋龟甲', 'CGJ');
INSERT INTO `jd_drug` VALUES ('65', '1', '椿皮', '2354', '颗粒', '广东一方制药有限公司', '14667', '中药库', '6克/袋', '袋', '1', '0.4300', '95.0000', '40.8500', '0', '0', '0', '2018/5/9 1:00:00', '1525864239', '1525863862', '', '椿皮', 'CP');
INSERT INTO `jd_drug` VALUES ('66', '1', '干蟾(蟾衣)', '2355', '颗粒', '广东一方制药有限公司', '14668', '中药库', '3克/袋', '袋', '0', '1.4500', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864239', '1525863862', '', '干蟾', 'GC,CY');
INSERT INTO `jd_drug` VALUES ('67', '1', '侧柏叶', '2350', '颗粒', '广东一方制药有限公司', '14666', '中药库', '10克/袋', '袋', '0', '0.7800', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864239', '1525863862', '', '侧柏叶', 'CBY');
INSERT INTO `jd_drug` VALUES ('68', '1', '墨旱莲', '2975', '颗粒', '广东一方制药有限公司', '14673', '中药库', '10克/袋', '袋', '1', '0.9000', '236.0000', '212.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864239', '1525863862', '', '墨旱莲', 'MHL');
INSERT INTO `jd_drug` VALUES ('69', '1', '木通', '3023', '颗粒', '江阴天江药业有限公司', 'MT001', '中药库', '3g/袋', '袋', '0', '0.3100', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864240', '1525863862', '', '木通', 'MT');
INSERT INTO `jd_drug` VALUES ('70', '1', '天浆壳', '3025', '颗粒', '江阴天江药业有限公司', 'TJK001', '中药库', '6g/袋', '袋', '1', '1.0200', '105.0000', '107.1000', '0', '0', '0', '2018/5/9 1:00:00', '1525864240', '1525863862', '', '天浆壳', 'TJK');
INSERT INTO `jd_drug` VALUES ('71', '1', '生姜', '3026', '颗粒', '广东一方制药有限公司', 'SJ001', '中药库', '3g/袋', '袋', '1', '0.6000', '156.0000', '93.6000', '0', '0', '0', '2018/5/9 1:00:00', '1525864240', '1525863863', '', '生姜', 'SJ');
INSERT INTO `jd_drug` VALUES ('72', '1', '青皮', '3040', '颗粒', '广东一方制药有限公司', 'ZZQP91', '中药库', '6g/袋', '袋', '1', '0.7400', '196.0000', '145.0400', '0', '0', '0', '2018/5/9 1:00:00', '1525864240', '1525863863', '', '青皮', 'QP');
INSERT INTO `jd_drug` VALUES ('73', '1', '紫石英', '3043', '颗粒', '广东一方制药有限公司', 'ZSY', '中药库', '10g/袋', '袋', '1', '0.7100', '69.0000', '48.9900', '0', '0', '0', '2018/5/9 1:00:00', '1525864240', '1525863863', '', '紫石英', 'ZSY');
INSERT INTO `jd_drug` VALUES ('74', '1', '雪莲', '3062', '贵细', '', 'ZZXL01', '中药库', '朵', '朵', '1', '18.0000', '2.0000', '36.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864240', '1525863863', '', '雪莲', 'XL');
INSERT INTO `jd_drug` VALUES ('75', '1', '猴头菇', '3063', '贵细', '', 'ZZHTG0', '中药库', 'g', 'g', '1', '0.3000', '527.6000', '158.2800', '0', '0', '0', '2018/5/9 1:00:00', '1525864240', '1525863863', '', '猴头菇', 'HTG');
INSERT INTO `jd_drug` VALUES ('76', '1', '不老草', '3064', '贵细', '', 'ZZBLC0', '中药库', '根', '根', '1', '10.0000', '372.7000', '3727.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864240', '1525863863', '', '不老草', 'BLC');
INSERT INTO `jd_drug` VALUES ('77', '1', '蛤蟆油', '3065', '贵细', '', 'ZZHMY0', '中药库', 'g', 'g', '0', '15.0000', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864241', '1525863863', '', '蛤蟆油', 'GMY');
INSERT INTO `jd_drug` VALUES ('78', '1', '蛤壳', '1984', '颗粒', '广东一方制药有限公司', '14319', '中药库', '10克/袋', '袋', '0', '1.0900', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864241', '1525863863', '', '蛤壳', 'GK');
INSERT INTO `jd_drug` VALUES ('79', '1', '茺蔚子', '2969', '颗粒', '广东一方制药有限公司', '14672', '中药库', '5克/袋', '袋', '1', '1.2800', '72.0000', '92.1600', '0', '0', '0', '2018/5/9 1:00:00', '1525864241', '1525863864', '', '茺蔚子', 'CWZ');
INSERT INTO `jd_drug` VALUES ('80', '1', '月季花', '2316', '颗粒', '广东一方制药有限公司', '14635', '中药库', '6克/袋', '袋', '1', '1.4600', '33.0000', '48.1800', '0', '0', '0', '2018/5/9 1:00:00', '1525864241', '1525863864', '', '月季花', 'YJH');
INSERT INTO `jd_drug` VALUES ('81', '1', '皂角刺', '2317', '颗粒', '广东一方制药有限公司', '14636', '中药库', '10克/袋', '袋', '1', '2.9200', '432.0000', '1261.4400', '0', '0', '0', '2018/5/9 1:00:00', '1525864241', '1525863864', '', '皂角刺', 'ZJC');
INSERT INTO `jd_drug` VALUES ('82', '1', '泽泻', '2319', '颗粒', '广东一方制药有限公司', '14638', '中药库', '10克/袋', '袋', '1', '1.9000', '143.0000', '271.7000', '0', '0', '0', '2018/5/9 1:00:00', '1525864241', '1525863864', '', '泽泻', 'ZX');
INSERT INTO `jd_drug` VALUES ('83', '1', '浙贝母', '2321', '颗粒', '广东一方制药有限公司', '14640', '中药库', '10克/袋', '袋', '1', '5.0000', '83.0000', '415.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864241', '1525863864', '浙贝母', '浙贝母', 'ZBM');
INSERT INTO `jd_drug` VALUES ('84', '1', '栀子', '2324', '颗粒', '广东一方制药有限公司', '14642', '中药库', '10克/袋', '袋', '1', '1.7400', '97.0000', '168.7800', '0', '0', '0', '2018/5/9 1:00:00', '1525864241', '1525863864', '', '栀子', 'ZZ');
INSERT INTO `jd_drug` VALUES ('85', '1', '枳实', '2326', '颗粒', '广东一方制药有限公司', '14644', '中药库', '6克/袋', '袋', '1', '0.8500', '179.0000', '152.1500', '0', '0', '0', '2018/5/9 1:00:00', '1525864242', '1525863864', '', '枳实', 'ZS');
INSERT INTO `jd_drug` VALUES ('86', '1', '蛤蚧', '1674', '贵细', '', 'ZZHJ01', '中药库', '对', '对', '1', '36.0000', '5.0000', '180.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864242', '1525863865', '', '蛤蚧', 'GJ');
INSERT INTO `jd_drug` VALUES ('87', '1', '饴糖', '1676', '辅料', '', 'ZZ-YT1', '中药库', 'g', 'g', '1', '0.0300', '-365.0000', '-10.9500', '0', '0', '0', '2018/5/9 1:00:00', '1525864242', '1525863865', '', '饴糖', 'YT');
INSERT INTO `jd_drug` VALUES ('88', '1', '黑芝麻', '1677', '辅料', '', 'ZZ-HZM', '中药库', 'g', 'g', '1', '0.0500', '980.7000', '49.0350', '0', '0', '0', '2018/5/9 1:00:00', '1525864242', '1525863865', '', '黑芝麻', 'HZM');
INSERT INTO `jd_drug` VALUES ('89', '1', '核桃仁(胡桃肉)', '1679', '辅料', '', 'ZZ-HTR', '中药库', 'g', 'g', '1', '0.1200', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864242', '1525863865', '', '核桃仁', 'HTR,HTR');
INSERT INTO `jd_drug` VALUES ('90', '1', '牛鞭', '1680', '贵细', '', 'ZZ-NBZ', '中药库', '条', '条', '1', '120.0000', '6.0000', '720.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864242', '1525863865', '', '牛鞭', 'NB');
INSERT INTO `jd_drug` VALUES ('91', '1', '黑枣', '1681', '辅料', '', 'ZZHZ01', '中药库', 'g', 'g', '1', '0.0550', '769.1000', '42.3005', '0', '0', '0', '2018/5/9 1:00:00', '1525864242', '1525863865', '', '黑枣', 'HZ');
INSERT INTO `jd_drug` VALUES ('92', '1', '新疆紫草', '421', '中药', '', '01-110-01', '中药库', 'g', 'g', '1', '0.4600', '4983.0000', '2292.1800', '0', '0', '0', '2018/5/9 1:00:00', '1525864243', '1525863865', '', '新疆紫草', 'XJZC');
INSERT INTO `jd_drug` VALUES ('93', '1', '生地榆', '423', '中药', '', '01-112-01', '中药库', 'g', 'g', '1', '0.0338', '9594.0000', '323.2063', '0', '0', '0', '2018/5/9 1:00:00', '1525864243', '1525863865', '', '生地榆', 'SDY');
INSERT INTO `jd_drug` VALUES ('94', '1', '地榆炭', '424', '中药', '', '01-112-02', '中药库', 'g', 'g', '1', '0.0500', '1825.0000', '91.2500', '0', '0', '0', '2018/5/9 1:00:00', '1525864243', '1525863866', '', '地榆炭', 'DYT');
INSERT INTO `jd_drug` VALUES ('95', '1', '紫皮枫斗', '3213', '贵细', '', 'ZZZPFD', '中药库', 'g', 'g', '1', '5.8000', '807.4000', '4682.9200', '0', '0', '0', '2018/5/9 1:00:00', '1525864243', '1525863866', '', '紫皮枫斗', 'ZPFD');
INSERT INTO `jd_drug` VALUES ('96', '1', '黄芩', '1787', '颗粒', '广东一方制药有限公司', '14132', '中药库', '10克/袋', '袋', '1', '1.8500', '630.0000', '1165.5000', '0', '0', '0', '2018/5/9 1:00:00', '1525864243', '1525863866', '', '黄芩', 'HQ');
INSERT INTO `jd_drug` VALUES ('97', '1', '苏败酱(败酱草)', '1788', '颗粒', '广东一方制药有限公司', '14133', '中药库', '15克/袋', '袋', '1', '1.1200', '523.0000', '585.7600', '0', '0', '0', '2018/5/9 1:00:00', '1525864243', '1525863866', '', '苏败酱', 'SBJ,BJC');
INSERT INTO `jd_drug` VALUES ('98', '1', '大血藤', '1789', '颗粒', '广东一方制药有限公司', '14134', '中药库', '15克/袋', '袋', '1', '0.9700', '92.0000', '89.2400', '0', '0', '0', '2018/5/9 1:00:00', '1525864243', '1525863866', '', '大血藤', 'DXT');
INSERT INTO `jd_drug` VALUES ('99', '1', '蒲公英', '1790', '颗粒', '广东一方制药有限公司', '14135', '中药库', '10克/袋', '袋', '1', '1.2100', '77.0000', '93.1700', '0', '0', '0', '2018/5/9 1:00:00', '1525864243', '1525863866', '', '蒲公英', 'PGY');
INSERT INTO `jd_drug` VALUES ('100', '1', '紫花地丁', '1791', '颗粒', '广东一方制药有限公司', '14136', '中药库', '10克/袋', '袋', '1', '0.9000', '136.0000', '122.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864244', '1525863867', '', '紫花地丁', 'ZHDD');
INSERT INTO `jd_drug` VALUES ('101', '1', '野菊花', '1792', '颗粒', '广东一方制药有限公司', '14137', '中药库', '10克/袋', '袋', '1', '1.2400', '144.0000', '178.5600', '0', '0', '0', '2018/5/9 1:00:00', '1525864244', '1525863867', '', '野菊花', 'YJH');
INSERT INTO `jd_drug` VALUES ('102', '1', '虎杖', '1793', '颗粒', '广东一方制药有限公司', '14138', '中药库', '15克/袋', '袋', '1', '1.0800', '111.0000', '119.8800', '0', '0', '0', '2018/5/9 1:00:00', '1525864244', '1525863867', '', '虎杖', 'HZ');
INSERT INTO `jd_drug` VALUES ('103', '1', '葛根', '1794', '颗粒', '广东一方制药有限公司', '14139', '中药库', '15克/袋', '袋', '1', '1.6200', '70.0000', '113.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864244', '1525863867', '', '葛根', 'GG');
INSERT INTO `jd_drug` VALUES ('104', '1', '赤芍', '1795', '颗粒', '广东一方制药有限公司', '14140', '中药库', '10克/袋', '袋', '1', '2.5700', '354.0000', '909.7800', '0', '0', '0', '2018/5/9 1:00:00', '1525864244', '1525863868', '赤芍', '赤芍', 'CS');
INSERT INTO `jd_drug` VALUES ('105', '1', '七叶一枝花(重楼)', '1796', '颗粒', '广东一方制药有限公司', '14141', '中药库', '9克/袋', '袋', '1', '26.6400', '47.0000', '1252.0800', '0', '0', '0', '2018/5/9 1:00:00', '1525864244', '1525863868', '', '七叶一枝花', 'QYYZH,CL');
INSERT INTO `jd_drug` VALUES ('106', '1', '白花蛇舌草', '1797', '颗粒', '广东一方制药有限公司', '14142', '中药库', '15克/袋', '袋', '1', '2.5000', '182.0000', '455.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864244', '1525863868', '', '白花蛇舌草', 'BHSSC');
INSERT INTO `jd_drug` VALUES ('107', '1', '鹿衔草', '1798', '颗粒', '广东一方制药有限公司', '14143', '中药库', '10克/袋', '袋', '1', '1.2000', '82.0000', '98.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864245', '1525863868', '', '鹿衔草', 'LXC');
INSERT INTO `jd_drug` VALUES ('108', '1', '紫草', '1799', '颗粒', '广东一方制药有限公司', '14144', '中药库', '6克/袋', '袋', '1', '5.2000', '317.0000', '1648.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864245', '1525863868', '', '紫草', 'ZC');
INSERT INTO `jd_drug` VALUES ('109', '1', '茜草', '1800', '颗粒', '广东一方制药有限公司', '14145', '中药库', '10克/袋', '袋', '1', '1.3500', '126.0000', '170.1000', '0', '0', '0', '2018/5/9 1:00:00', '1525864245', '1525863868', '', '茜草', 'QC');
INSERT INTO `jd_drug` VALUES ('110', '1', '仙鹤草', '1801', '颗粒', '广东一方制药有限公司', '14146', '中药库', '15克/袋', '袋', '1', '0.9600', '308.0000', '295.6800', '0', '0', '0', '2018/5/9 1:00:00', '1525864245', '1525863868', '', '仙鹤草', 'XHC');
INSERT INTO `jd_drug` VALUES ('111', '1', '地榆', '1802', '颗粒', '广东一方制药有限公司', '14147', '中药库', '10克/袋', '袋', '1', '1.1000', '86.0000', '94.6000', '0', '0', '0', '2018/5/9 1:00:00', '1525864245', '1525863869', '', '地榆', 'DY');
INSERT INTO `jd_drug` VALUES ('112', '1', '山楂', '1803', '颗粒', '广东一方制药有限公司', '14148', '中药库', '10克/袋', '袋', '1', '1.0000', '246.0000', '246.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864245', '1525863869', '', '山楂', 'SZ');
INSERT INTO `jd_drug` VALUES ('113', '1', '枇杷叶', '1804', '颗粒', '广东一方制药有限公司', '14149', '中药库', '10克/袋', '袋', '1', '0.6900', '73.0000', '50.3700', '0', '0', '0', '2018/5/9 1:00:00', '1525864245', '1525863869', '', '枇杷叶', 'PPY');
INSERT INTO `jd_drug` VALUES ('114', '1', '百部', '1805', '颗粒', '广东一方制药有限公司', '14150', '中药库', '10克/袋', '袋', '1', '1.9600', '281.0000', '550.7600', '0', '0', '0', '2018/5/9 1:00:00', '1525864245', '1525863869', '', '百部', 'BB');
INSERT INTO `jd_drug` VALUES ('115', '1', '地骨皮', '1806', '颗粒', '广东一方制药有限公司', '14151', '中药库', '10克/袋', '袋', '1', '2.5200', '52.0000', '131.0400', '0', '0', '0', '2018/5/9 1:00:00', '1525864245', '1525863869', '', '地骨皮', 'DGP');
INSERT INTO `jd_drug` VALUES ('116', '1', '知母', '1808', '颗粒', '广东一方制药有限公司', '14153', '中药库', '10克/袋', '袋', '1', '1.3000', '123.0000', '159.9000', '0', '0', '0', '2018/5/9 1:00:00', '1525864246', '1525863870', '', '知母', 'ZM');
INSERT INTO `jd_drug` VALUES ('117', '1', '三棱', '1809', '颗粒', '广东一方制药有限公司', '14154', '中药库', '10克/袋', '袋', '1', '1.5300', '171.0000', '261.6300', '0', '0', '0', '2018/5/9 1:00:00', '1525864246', '1525863870', '三棱', '三棱', 'SL');
INSERT INTO `jd_drug` VALUES ('118', '1', '土茯苓', '1814', '颗粒', '广东一方制药有限公司', '14159', '中药库', '15克/袋', '袋', '1', '2.2100', '275.0000', '612.1700', '0', '0', '0', '2018/5/9 1:00:00', '1528004314', '1525863870', '', '土茯苓', 'TFL');
INSERT INTO `jd_drug` VALUES ('119', '1', '黄柏', '1815', '颗粒', '广东一方制药有限公司', '14160', '中药库', '6克/袋', '袋', '1', '1.3100', '604.0000', '791.2400', '0', '0', '0', '2018/5/9 1:00:00', '1525864246', '1525863870', '', '黄柏', 'HB');
INSERT INTO `jd_drug` VALUES ('120', '1', '柏子仁', '1836', '颗粒', '广东一方制药有限公司', '14179', '中药库', '10克/袋', '袋', '1', '4.5800', '101.0000', '462.5800', '0', '0', '0', '2018/5/9 1:00:00', '1525864246', '1525863870', '', '柏子仁', 'BZR');
INSERT INTO `jd_drug` VALUES ('121', '1', '板蓝根', '1837', '颗粒', '广东一方制药有限公司', '14180', '中药库', '15克/袋', '袋', '1', '1.3100', '70.0000', '91.7000', '0', '0', '0', '2018/5/9 1:00:00', '1525864246', '1525863871', '', '板蓝根', 'BLG');
INSERT INTO `jd_drug` VALUES ('122', '1', '半边莲', '1838', '颗粒', '广东一方制药有限公司', '14181', '中药库', '15克/袋', '袋', '0', '2.0500', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864246', '1525863871', '', '半边莲', 'BBL');
INSERT INTO `jd_drug` VALUES ('123', '1', '半枝莲', '1839', '颗粒', '广东一方制药有限公司', '14182', '中药库', '15克/袋', '袋', '1', '1.7800', '100.0000', '178.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864246', '1525863871', '', '半枝莲', 'BZL');
INSERT INTO `jd_drug` VALUES ('124', '1', '北沙参', '1840', '颗粒', '广东一方制药有限公司', '14183', '中药库', '10克/袋', '袋', '1', '1.6200', '312.0000', '505.4400', '0', '0', '0', '2018/5/9 1:00:00', '1525864247', '1525863871', '北沙参', '北沙参', 'BSC');
INSERT INTO `jd_drug` VALUES ('125', '1', '郁金', '1816', '颗粒', '广东一方制药有限公司', '14161', '中药库', '10克/袋', '袋', '1', '1.9800', '248.0000', '491.0400', '0', '0', '0', '2018/5/9 1:00:00', '1525864247', '1525863871', '郁金', '郁金', 'YJ');
INSERT INTO `jd_drug` VALUES ('126', '1', '阿胶', '1817', '颗粒', '广东一方制药有限公司', '14162', '中药库', '3克/袋', '袋', '0', '11.0300', '-19.0000', '-209.5700', '0', '0', '0', '2018/5/9 1:00:00', '1525864247', '1525863871', '', '阿胶', 'AJ');
INSERT INTO `jd_drug` VALUES ('127', '1', '矮地茶', '1818', '颗粒', '广东一方制药有限公司', '14163', '中药库', '10克/袋', '袋', '1', '0.8000', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864247', '1525863872', '', '矮地茶', 'ADC');
INSERT INTO `jd_drug` VALUES ('128', '1', '艾叶', '1819', '颗粒', '广东一方制药有限公司', '14164', '中药库', '6克/袋', '袋', '1', '0.5500', '100.0000', '55.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864247', '1525863872', '', '艾叶', 'AY');
INSERT INTO `jd_drug` VALUES ('129', '1', '乌药', '342', '中药', '', '01-069-01', '中药库', 'g', 'g', '1', '0.0550', '10856.0000', '597.0700', '0', '0', '0', '2018/5/9 1:00:00', '1525864247', '1525863872', '', '乌药', 'WY');
INSERT INTO `jd_drug` VALUES ('130', '1', '藁本', '346', '中药', '', '01-070-01', '中药库', 'g', 'g', '1', '0.0860', '680.0000', '58.4800', '0', '0', '0', '2018/5/9 1:00:00', '1525864247', '1525863872', '', '藁本', 'GB');
INSERT INTO `jd_drug` VALUES ('131', '1', '葛根', '347', '中药', '', '01-071-01', '中药库', 'g', '克', '1', '0.0388', '6538.0000', '253.5340', '0', '0', '0', '2018/5/9 1:00:00', '1525864247', '1525863872', '', '葛根', 'GG');
INSERT INTO `jd_drug` VALUES ('132', '1', '莪术', '351', '中药', '', '01-072-01', '中药库', 'g', 'g', '1', '0.0838', '4660.0000', '388.6463', '0', '0', '0', '2018/5/9 1:00:00', '1525864248', '1525863873', '', '莪术', 'ES');
INSERT INTO `jd_drug` VALUES ('133', '1', '绵萆薢(绵萆,川萆,棉萆)', '376', '中药', '', '01-082-02', '中药库', 'g', 'g', '1', '0.0420', '1504.0000', '63.1680', '0', '0', '0', '2018/5/9 1:00:00', '1525864248', '1525863873', '', '绵萆薢', 'MBX,MB,CB');
INSERT INTO `jd_drug` VALUES ('134', '1', '土茯苓', '377', '中药', '', '01-083-01', '中药库', 'g', 'g', '1', '0.0638', '275.0000', '1304.7104', '0', '0', '0', '2018/5/9 1:00:00', '1528004314', '1525863873', '', '土茯苓', 'TFL');
INSERT INTO `jd_drug` VALUES ('135', '1', '狗脊(制狗脊)', '379', '中药', '', '01-084-02', '中药库', 'g', 'g', '0', '0.0400', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864248', '1525863873', '', '狗脊', 'GJ,ZGJ');
INSERT INTO `jd_drug` VALUES ('136', '1', '干骨碎补(申姜、毛姜)', '381', '中药', '', '01-086-01', '中药库', 'g', 'g', '1', '0.0763', '1250.0000', '95.1800', '0', '0', '0', '2018/5/9 1:00:00', '1525864248', '1525863873', '', '干骨碎补', 'GGSB,SJ,MJ');
INSERT INTO `jd_drug` VALUES ('137', '1', '郁李仁', '666', '中药', '', '02-095-01', '中药库', 'g', 'g', '1', '0.1320', '1717.0000', '226.6400', '0', '0', '0', '2018/5/9 1:00:00', '1525864248', '1525863874', '', '郁李仁', 'YLR');
INSERT INTO `jd_drug` VALUES ('138', '1', '火麻仁', '669', '中药', '', '02-097-01', '中药库', 'g', 'g', '1', '0.0413', '19032.0000', '780.9675', '0', '0', '0', '2018/5/9 1:00:00', '1525864248', '1525863874', '', '火麻仁', 'HMR');
INSERT INTO `jd_drug` VALUES ('139', '1', '制吴茱萸(吴萸,吴茱萸制)', '672', '中药', '', '02-100-01', '中药库', 'g', 'g', '1', '0.6800', '1939.0000', '1318.5200', '0', '0', '0', '2018/5/9 1:00:00', '1525864249', '1525863874', '', '制吴茱萸', 'ZWZY,WY,WZYZ');
INSERT INTO `jd_drug` VALUES ('140', '1', '制山茱萸(山芋肉 枣皮)', '673', '中药', '', '02-101-01', '中药库', 'g', 'g', '1', '0.1200', '13397.0000', '1607.6400', '0', '0', '0', '2018/5/9 1:00:00', '1525864249', '1525863874', '', '制山茱萸', 'ZSZY,SZR,ZP');
INSERT INTO `jd_drug` VALUES ('141', '1', '天花粉', '317', '中药', '', '01-058-01', '中药库', 'g', 'g', '1', '0.0713', '12622.0000', '898.7075', '0', '0', '0', '2018/5/9 1:00:00', '1525864249', '1525863874', '天花粉', '天花粉', 'THF');
INSERT INTO `jd_drug` VALUES ('142', '1', '巴戟天', '318', '中药', '', '01-059-01', '中药库', 'g', 'g', '1', '0.2600', '9915.0000', '2577.9000', '0', '0', '0', '2018/5/9 1:00:00', '1525864249', '1525863874', '', '巴戟天', 'BJT');
INSERT INTO `jd_drug` VALUES ('143', '1', '蜜麸炒苍术', '323', '中药', '', '01-060-05', '中药库', 'g', 'g', '1', '0.2000', '17758.0000', '3551.6000', '0', '0', '0', '2018/5/9 1:00:00', '1525864249', '1525863874', '', '蜜麸炒苍术', 'MFCCS');
INSERT INTO `jd_drug` VALUES ('144', '1', '知母', '324', '中药', '', '01-061-01', '中药库', 'g', 'g', '1', '0.0700', '4718.0000', '330.2600', '0', '0', '0', '2018/5/9 1:00:00', '1525864249', '1525863874', '', '知母', 'ZM');
INSERT INTO `jd_drug` VALUES ('145', '1', '制黄精(制黄精)', '327', '中药', '', '01-062-02', '中药库', 'g', 'g', '1', '0.1538', '8369.0000', '1285.6150', '0', '0', '0', '2018/5/9 1:00:00', '1525864249', '1525863875', '', '制黄精', 'ZHJ');
INSERT INTO `jd_drug` VALUES ('146', '1', '续断(川断)', '328', '中药', '', '01-063-01', '中药库', 'g', 'g', '1', '0.0775', '5192.0000', '402.5350', '0', '0', '0', '2018/5/9 1:00:00', '1525864249', '1525863875', '', '续断', 'XD,CD');
INSERT INTO `jd_drug` VALUES ('147', '1', '秦艽', '331', '中药', '', '01-064-01', '中药库', 'g', 'g', '1', '0.1538', '2180.0000', '335.1750', '0', '0', '0', '2018/5/9 1:00:00', '1525864249', '1525863875', '', '秦艽', 'QQ');
INSERT INTO `jd_drug` VALUES ('148', '1', '升麻', '332', '中药', '', '01-065-01', '中药库', 'g', 'g', '1', '0.1038', '5267.0000', '546.5914', '0', '0', '0', '2018/5/9 1:00:00', '1525864250', '1525863875', '', '升麻', 'SM');
INSERT INTO `jd_drug` VALUES ('149', '1', '白果仁(白果肉)', '694', '中药', '', '02-112-02', '中药库', 'g', 'g', '1', '0.0390', '1961.0000', '76.4790', '0', '0', '0', '2018/5/9 1:00:00', '1525864250', '1525863875', '', '白果仁', 'BGR,BGR');
INSERT INTO `jd_drug` VALUES ('150', '1', '大枣(大枣)', '696', '中药', '', '02-113-01', '中药库', 'g', 'g', '1', '0.0290', '25041.0000', '726.1080', '0', '0', '0', '2018/5/9 1:00:00', '1525864250', '1525863875', '', '大枣', 'DZ');
INSERT INTO `jd_drug` VALUES ('151', '1', '西青果(藏青果)', '703', '中药', '', '02-116-01', '中药库', 'g', 'g', '1', '0.0575', '482.0000', '27.7100', '0', '0', '0', '2018/5/9 1:00:00', '1525864250', '1525863876', '', '西青果', 'XQG,ZQG');
INSERT INTO `jd_drug` VALUES ('152', '1', '炒薏苡仁(炒米仁)', '706', '中药', '', '02-119-01', '中药库', 'g', 'g', '1', '0.0510', '5885.0000', '300.1130', '0', '0', '0', '2018/5/9 1:00:00', '1525864250', '1525863876', '', '炒薏苡仁', 'CYYR,CMR');
INSERT INTO `jd_drug` VALUES ('153', '1', '薏苡仁(米仁)', '707', '中药', '', '02-119-03', '中药库', 'g', 'g', '1', '0.0500', '5854.0000', '292.7000', '0', '0', '0', '2018/5/9 1:00:00', '1525864250', '1525863876', '', '薏苡仁', 'YYR,MR');
INSERT INTO `jd_drug` VALUES ('154', '1', '制南星(天南星)', '355', '中药', '', '01-073-02', '中药库', 'g', 'g', '1', '0.1050', '4677.0000', '491.0850', '0', '0', '0', '2018/5/9 1:00:00', '1525864250', '1525863876', '', '制南星', 'ZNX,TNX');
INSERT INTO `jd_drug` VALUES ('155', '1', '制胆星', '356', '中药', '', '01-073-03', '中药库', 'g', 'g', '1', '0.1900', '2915.0000', '553.8500', '0', '0', '0', '2018/5/9 1:00:00', '1525864251', '1525863876', '', '制胆星', 'ZDX');
INSERT INTO `jd_drug` VALUES ('156', '1', '板蓝根', '358', '中药', '', '01-075-01', '中药库', 'g', '克', '1', '0.0550', '9015.0000', '495.8050', '0', '0', '0', '2018/5/9 1:00:00', '1525864251', '1525863876', '', '板蓝根', 'BLG');
INSERT INTO `jd_drug` VALUES ('157', '1', '三棱', '359', '中药', '', '01-076-01', '中药库', 'g', 'g', '1', '0.0550', '15420.0000', '848.0400', '0', '0', '0', '2018/5/9 1:00:00', '1525864251', '1525863876', '三棱', '三棱', 'SL');
INSERT INTO `jd_drug` VALUES ('158', '1', '射干', '363', '中药', '', '01-078-01', '中药库', 'g', 'g', '1', '0.1480', '8996.0000', '1331.4400', '0', '0', '0', '2018/5/9 1:00:00', '1525864251', '1525863877', '', '射干', 'SG');
INSERT INTO `jd_drug` VALUES ('159', '1', '高良姜(良姜)', '366', '中药', '', '01-079-01', '中药库', 'g', 'g', '1', '0.0300', '1027.0000', '30.8100', '0', '0', '0', '2018/5/9 1:00:00', '1525864251', '1525863877', '', '高良姜', 'GLJ,LJ');
INSERT INTO `jd_drug` VALUES ('160', '1', '干姜(均姜)', '367', '中药', '', '01-080-01', '中药库', 'g', 'g', '1', '0.0610', '14366.0000', '876.8080', '0', '0', '0', '2018/5/9 1:00:00', '1525864251', '1525863877', '', '干姜', 'GJ,JJ');
INSERT INTO `jd_drug` VALUES ('161', '1', '炮姜炭', '368', '中药', '', '01-080-02', '中药库', 'g', 'g', '1', '0.0770', '1791.0000', '137.9040', '0', '0', '0', '2018/5/9 1:00:00', '1525864251', '1525863877', '', '炮姜炭', 'PJT');
INSERT INTO `jd_drug` VALUES ('162', '1', '地耳草(地耳草)', '1039', '中药', '', '03-198-01', '中药库', 'g', 'g', '1', '0.0650', '370.0000', '24.0500', '0', '0', '0', '2018/5/9 1:00:00', '1525864252', '1525863877', '', '地耳草', 'DEC,DEC');
INSERT INTO `jd_drug` VALUES ('163', '1', '石上柏', '1041', '中药', '', '03-201-01', '中药库', '克', '克', '1', '0.0550', '5674.0000', '312.0300', '0', '0', '0', '2018/5/9 1:00:00', '1525864252', '1525863877', '', '石上柏', 'SSB');
INSERT INTO `jd_drug` VALUES ('164', '1', '紫苏梗(片)', '1048', '中药', '', '03-214-01', '中药库', 'g', 'g', '1', '0.0350', '7623.0000', '266.7800', '0', '0', '0', '2018/5/9 1:00:00', '1525864252', '1525863877', '', '紫苏梗', 'ZSG,P');
INSERT INTO `jd_drug` VALUES ('165', '1', '紫苏叶(统)', '1050', '中药', '', '03-214-03', '中药库', 'g', 'g', '1', '0.0380', '5850.0000', '222.3000', '0', '0', '0', '2018/5/9 1:00:00', '1525864252', '1525863877', '', '紫苏叶', 'ZSY,T');
INSERT INTO `jd_drug` VALUES ('166', '1', '百合', '391', '中药', '', '01-091-01', '中药库', 'g', 'g', '1', '0.0875', '3576.0000', '312.8325', '0', '0', '0', '2018/5/9 1:00:00', '1525864252', '1525863878', '', '百合', 'BH');
INSERT INTO `jd_drug` VALUES ('167', '1', '威灵仙', '393', '中药', '', '01-092-01', '中药库', 'g', 'g', '1', '0.1188', '34335.0000', '4079.4880', '0', '0', '0', '2018/5/9 1:00:00', '1525864252', '1525863878', '', '威灵仙', 'WLX');
INSERT INTO `jd_drug` VALUES ('168', '1', '片姜黄', '398', '中药', '', '01-095-01', '中药库', 'g', 'g', '0', '0.0738', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864252', '1525863878', '', '片姜黄', 'PJH');
INSERT INTO `jd_drug` VALUES ('169', '1', '拳参(拳参)', '401', '中药', '', '01-098-01', '中药库', 'g', 'g', '1', '0.0838', '3630.0000', '304.0125', '0', '0', '0', '2018/5/9 1:00:00', '1525864252', '1525863878', '', '拳参', 'QC');
INSERT INTO `jd_drug` VALUES ('170', '1', '甘松', '402', '中药', '', '01-099-01', '中药库', 'g', 'g', '1', '0.2350', '2473.0000', '581.1600', '0', '0', '0', '2018/5/9 1:00:00', '1525864253', '1525863878', '', '甘松', 'GS');
INSERT INTO `jd_drug` VALUES ('171', '1', '干芦根', '403', '中药', '', '01-100-01', '中药库', 'g', 'g', '1', '0.0538', '14394.0000', '774.3420', '0', '0', '0', '2018/5/9 1:00:00', '1525864253', '1525863878', '', '干芦根', 'GLG');
INSERT INTO `jd_drug` VALUES ('172', '1', '盐橘核(桔核)', '733', '中药', '', '02-132-01', '中药库', 'g', 'g', '1', '0.0813', '2136.0000', '173.4575', '0', '0', '0', '2018/5/9 1:00:00', '1525864253', '1525863878', '', '盐橘核', 'YJH');
INSERT INTO `jd_drug` VALUES ('173', '1', '陈皮(橘皮 桔皮)', '736', '中药', '', '02-133-03', '中药库', 'g', 'g', '1', '0.0400', '19511.0000', '780.4400', '0', '0', '0', '2018/5/9 1:00:00', '1525864253', '1525863878', '', '陈皮', 'CP,JP');
INSERT INTO `jd_drug` VALUES ('174', '1', '橘络', '737', '中药', '', '02-134-01', '中药库', 'g', 'g', '1', '0.6000', '1733.0000', '1039.8000', '0', '0', '0', '2018/5/9 1:00:00', '1525864253', '1525863879', '', '橘络', 'JL');
INSERT INTO `jd_drug` VALUES ('175', '1', '生枳壳', '739', '中药', '', '02-136-03', '中药库', 'g', 'g', '0', '0.1063', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864253', '1525863879', '', '生枳壳', 'SZK');
INSERT INTO `jd_drug` VALUES ('176', '1', '蜜麸炒枳壳', '741', '中药', '', '02-136-05', '中药库', 'g', 'g', '1', '0.1225', '7656.0000', '937.8175', '0', '0', '0', '2018/5/9 1:00:00', '1525864253', '1525863879', '', '蜜麸炒枳壳', 'MFCZK');
INSERT INTO `jd_drug` VALUES ('177', '1', '蜜麸炒枳实', '743', '中药', '', '02-137-03', '中药库', 'g', 'g', '1', '0.1825', '17710.0000', '3232.3825', '0', '0', '0', '2018/5/9 1:00:00', '1525864253', '1525863879', '', '蜜麸炒枳实', 'MFCZS');
INSERT INTO `jd_drug` VALUES ('178', '1', '桑椹', '747', '中药', '', '02-140-01', '中药库', 'g', 'g', '1', '0.1050', '1360.0000', '142.7900', '0', '0', '0', '2018/5/9 1:00:00', '1525864254', '1525863879', '', '桑椹', 'SZ');
INSERT INTO `jd_drug` VALUES ('179', '1', '藕节炭', '431', '中药', '', '01-116-03', '中药库', 'g', 'g', '1', '0.0688', '1539.0000', '105.7963', '0', '0', '0', '2018/5/9 1:00:00', '1525864254', '1525863880', '', '藕节炭', 'OJT');
INSERT INTO `jd_drug` VALUES ('180', '1', '生贯众', '435', '中药', '', '01-120-01', '中药库', 'g', 'g', '1', '0.0300', '955.0000', '28.6500', '0', '0', '0', '2018/5/9 1:00:00', '1525864254', '1525863880', '', '生贯众', 'SGZ');
INSERT INTO `jd_drug` VALUES ('181', '1', '贯众炭', '436', '中药', '', '01-120-02', '中药库', 'g', 'g', '1', '0.0350', '1645.0000', '57.5750', '0', '0', '0', '2018/5/9 1:00:00', '1525864254', '1525863880', '', '贯众炭', 'GZT');
INSERT INTO `jd_drug` VALUES ('182', '1', '仙茅', '438', '中药', '', '01-121-01', '中药库', 'g', 'g', '1', '0.3500', '8183.0000', '2864.0500', '0', '0', '0', '2018/5/9 1:00:00', '1525864254', '1525863880', '', '仙茅', 'XM');
INSERT INTO `jd_drug` VALUES ('183', '1', '薤白(野白头)', '440', '中药', '', '01-122-01', '中药库', 'g', 'g', '1', '0.0900', '748.0000', '67.3200', '0', '0', '0', '2018/5/9 1:00:00', '1525864254', '1525863880', '', '薤白', 'XB,YBT');
INSERT INTO `jd_drug` VALUES ('184', '1', '山慈菇', '442', '中药', '', '01-123-01', '中药库', 'g', 'g', '1', '1.1000', '6130.0000', '6743.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864254', '1525863880', '', '山慈菇', 'SCG');
INSERT INTO `jd_drug` VALUES ('185', '1', '全蝎', '2185', '颗粒', '广东一方制药有限公司', '14512', '中药库', '3克/袋', '袋', '1', '18.0800', '172.0000', '3109.7600', '0', '0', '0', '2018/5/9 1:00:00', '1525864254', '1525863880', '', '全蝎', 'QX');
INSERT INTO `jd_drug` VALUES ('186', '1', '忍冬藤', '2187', '颗粒', '广东一方制药有限公司', '14514', '中药库', '15克/袋', '袋', '1', '1.2100', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864255', '1525863880', '', '忍冬藤', 'RDT');
INSERT INTO `jd_drug` VALUES ('187', '1', '桑白皮', '2195', '颗粒', '广东一方制药有限公司', '14521', '中药库', '10克/袋', '袋', '1', '1.2000', '295.0000', '354.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864255', '1525863881', '', '桑白皮', 'SBP');
INSERT INTO `jd_drug` VALUES ('188', '1', '桑叶', '2197', '颗粒', '广东一方制药有限公司', '14523', '中药库', '10克/袋', '袋', '1', '0.8300', '26.0000', '21.5800', '0', '0', '0', '2018/5/9 1:00:00', '1525864255', '1525863881', '', '桑叶', 'SY');
INSERT INTO `jd_drug` VALUES ('189', '1', '砂仁', '2200', '颗粒', '广东一方制药有限公司', '14526', '中药库', '3克/袋', '袋', '1', '6.2300', '192.0000', '1196.1600', '0', '0', '0', '2018/5/9 1:00:00', '1525864255', '1525863881', '', '砂仁', 'SR');
INSERT INTO `jd_drug` VALUES ('190', '1', '沙苑子', '2201', '颗粒', '广东一方制药有限公司', '14527', '中药库', '10克/袋', '袋', '1', '1.2500', '213.0000', '266.2500', '0', '0', '0', '2018/5/9 1:00:00', '1525864255', '1525863881', '', '沙苑子', 'SYZ');
INSERT INTO `jd_drug` VALUES ('191', '1', '山慈菇', '2202', '颗粒', '广东一方制药有限公司', '14528', '中药库', '6克/袋', '袋', '1', '7.6700', '80.0000', '613.6000', '0', '0', '0', '2018/5/9 1:00:00', '1525864255', '1525863881', '', '山慈菇', 'SCG');
INSERT INTO `jd_drug` VALUES ('192', '1', '山药', '2204', '颗粒', '广东一方制药有限公司', '14530', '中药库', '10克/袋', '袋', '1', '1.8500', '154.0000', '284.9000', '0', '0', '0', '2018/5/9 1:00:00', '1525864255', '1525863881', '', '山药', 'SY');
INSERT INTO `jd_drug` VALUES ('193', '1', '山茱萸', '2206', '颗粒', '广东一方制药有限公司', '14531', '中药库', '10克/袋', '袋', '1', '3.3800', '163.0000', '550.9400', '0', '0', '0', '2018/5/9 1:00:00', '1525864255', '1525863881', '', '山茱萸', 'SZY');
INSERT INTO `jd_drug` VALUES ('194', '1', '升麻', '2213', '颗粒', '广东一方制药有限公司', '14538', '中药库', '6克/袋', '袋', '1', '1.0000', '178.0000', '178.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864256', '1525863881', '', '升麻', 'SM');
INSERT INTO `jd_drug` VALUES ('195', '1', '石菖蒲', '2215', '颗粒', '广东一方制药有限公司', '14540', '中药库', '6克/袋', '袋', '1', '0.9200', '285.0000', '262.2000', '0', '0', '0', '2018/5/9 1:00:00', '1525864256', '1525863882', '', '石菖蒲', 'SCP');
INSERT INTO `jd_drug` VALUES ('196', '1', '石见穿', '2217', '颗粒', '广东一方制药有限公司', '14541', '中药库', '15克/袋', '袋', '1', '1.3300', '95.0000', '126.3500', '0', '0', '0', '2018/5/9 1:00:00', '1525864256', '1525863882', '', '石见穿', 'SJC');
INSERT INTO `jd_drug` VALUES ('197', '1', '石决明', '2218', '颗粒', '广东一方制药有限公司', '14542', '中药库', '20克/袋', '袋', '0', '1.8100', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864256', '1525863882', '', '石决明', 'SJM');
INSERT INTO `jd_drug` VALUES ('198', '1', '石榴皮', '2219', '颗粒', '广东一方制药有限公司', '14543', '中药库', '10克/袋', '袋', '1', '0.7800', '2.0000', '1.5600', '0', '0', '0', '2018/5/9 1:00:00', '1525864256', '1525863882', '', '石榴皮', 'SLP');
INSERT INTO `jd_drug` VALUES ('199', '1', '干石斛（石斛）', '2223', '颗粒', '广东一方制药有限公司', '14547', '中药库', '10克/袋', '袋', '1', '2.2000', '76.0000', '167.2000', '0', '0', '0', '2018/5/9 1:00:00', '1525864256', '1525863882', '', '', 'GSH,SH');
INSERT INTO `jd_drug` VALUES ('200', '1', '首乌藤', '2225', '颗粒', '广东一方制药有限公司', '14549', '中药库', '15克/袋', '袋', '1', '0.9900', '222.0000', '219.7800', '0', '0', '0', '2018/5/9 1:00:00', '1525864256', '1525863882', '', '首乌藤', 'SWT');
INSERT INTO `jd_drug` VALUES ('201', '1', '熟地黄', '2226', '颗粒', '广东一方制药有限公司', '14550', '中药库', '10克/袋', '袋', '1', '1.6500', '395.0000', '651.7500', '0', '0', '0', '2018/5/9 1:00:00', '1525864256', '1525863882', '', '熟地黄', 'SDH');
INSERT INTO `jd_drug` VALUES ('202', '1', '水牛角', '2229', '颗粒', '广东一方制药有限公司', '14553', '中药库', '10克/袋', '袋', '0', '1.5500', '1.0000', '1.5500', '0', '0', '0', '2018/5/9 1:00:00', '1525864257', '1525863883', '', '水牛角', 'SNJ');
INSERT INTO `jd_drug` VALUES ('203', '1', '酸枣仁', '2235', '颗粒', '广东一方制药有限公司', '14557', '中药库', '10克/袋', '袋', '1', '6.8800', '110.0000', '756.8000', '0', '0', '0', '2018/5/9 1:00:00', '1525864257', '1525863883', '', '酸枣仁', 'SZR');
INSERT INTO `jd_drug` VALUES ('204', '1', '桃仁', '2240', '颗粒', '广东一方制药有限公司', '14562', '中药库', '10克/袋', '袋', '1', '2.7400', '192.0000', '526.0800', '0', '0', '0', '2018/5/9 1:00:00', '1525864257', '1525863883', '', '桃仁', 'TR');
INSERT INTO `jd_drug` VALUES ('205', '1', '天冬', '2243', '颗粒', '广东一方制药有限公司', '14565', '中药库', '10克/袋', '袋', '1', '1.6200', '281.0000', '455.2200', '0', '0', '0', '2018/5/9 1:00:00', '1525864257', '1525863883', '', '天冬', 'TD');
INSERT INTO `jd_drug` VALUES ('206', '1', '天麻', '2247', '颗粒', '广东一方制药有限公司', '14569', '中药库', '10克/袋', '袋', '1', '7.2000', '77.0000', '554.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864257', '1525863883', '', '天麻', 'TM');
INSERT INTO `jd_drug` VALUES ('207', '1', '天竺黄', '2248', '颗粒', '广东一方制药有限公司', '14570', '中药库', '3克/袋', '袋', '1', '1.5000', '383.0000', '574.5000', '0', '0', '0', '2018/5/9 1:00:00', '1525864257', '1525863883', '', '天竺黄', 'TZH');
INSERT INTO `jd_drug` VALUES ('208', '1', '通草', '2250', '颗粒', '广东一方制药有限公司', '14572', '中药库', '6克/袋', '袋', '0', '8.5300', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864257', '1525863883', '', '通草', 'TC');
INSERT INTO `jd_drug` VALUES ('209', '1', '土鳖虫', '2252', '颗粒', '广东一方制药有限公司', '14574', '中药库', '6克/袋', '袋', '1', '2.5000', '164.0000', '410.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864257', '1525863883', '', '土鳖虫', 'TBC');
INSERT INTO `jd_drug` VALUES ('210', '1', '菟丝子', '2256', '颗粒', '广东一方制药有限公司', '14577', '中药库', '10克/袋', '袋', '1', '1.6100', '70.0000', '112.7000', '0', '0', '0', '2018/5/9 1:00:00', '1525864258', '1525863884', '', '菟丝子', 'TSZ');
INSERT INTO `jd_drug` VALUES ('211', '1', '威灵仙', '2258', '颗粒', '广东一方制药有限公司', '14579', '中药库', '10克/袋', '袋', '1', '1.1900', '183.0000', '217.7700', '0', '0', '0', '2018/5/9 1:00:00', '1525864258', '1525863884', '', '威灵仙', 'WLX');
INSERT INTO `jd_drug` VALUES ('212', '1', '乌梅', '2259', '颗粒', '广东一方制药有限公司', '14580', '中药库', '10克/袋', '袋', '1', '1.4300', '210.0000', '300.3000', '0', '0', '0', '2018/5/9 1:00:00', '1525864258', '1525863884', '', '乌梅', 'WM');
INSERT INTO `jd_drug` VALUES ('213', '1', '乌药', '2261', '颗粒', '广东一方制药有限公司', '14582', '中药库', '10克/袋', '袋', '0', '1.3300', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864258', '1525863884', '', '乌药', 'WY');
INSERT INTO `jd_drug` VALUES ('214', '1', '吴茱萸', '2263', '颗粒', '广东一方制药有限公司', '14584', '中药库', '3克/袋', '袋', '1', '3.7100', '290.0000', '1075.9000', '0', '0', '0', '2018/5/9 1:00:00', '1525864258', '1525863884', '', '吴茱萸', 'WZY');
INSERT INTO `jd_drug` VALUES ('215', '1', '五灵脂', '2266', '颗粒', '广东一方制药有限公司', '14587', '中药库', '10克/袋', '袋', '1', '1.1400', '156.0000', '177.8400', '0', '0', '0', '2018/5/9 1:00:00', '1525864258', '1525863885', '五灵脂', '五灵脂', 'WLZ');
INSERT INTO `jd_drug` VALUES ('216', '1', '五味子', '2267', '颗粒', '广东一方制药有限公司', '14588', '中药库', '6克/袋', '袋', '1', '3.6700', '258.0000', '946.8600', '0', '0', '0', '2018/5/9 1:00:00', '1525864258', '1525863885', '', '五味子', 'WWZ');
INSERT INTO `jd_drug` VALUES ('217', '1', '夏枯草', '2272', '颗粒', '广东一方制药有限公司', '14593', '中药库', '10克/袋', '袋', '1', '2.2200', '199.0000', '441.7800', '0', '0', '0', '2018/5/9 1:00:00', '1525864259', '1525863885', '', '夏枯草', 'XKC');
INSERT INTO `jd_drug` VALUES ('218', '1', '香豆豉(淡豆豉)', '2275', '颗粒', '广东一方制药有限公司', '14595', '中药库', '10克/袋', '袋', '1', '1.0500', '131.0000', '137.5500', '0', '0', '0', '2018/5/9 1:00:00', '1525864259', '1525863885', '', '香豆豉', 'XDC,DDG');
INSERT INTO `jd_drug` VALUES ('219', '1', '香附', '2276', '颗粒', '广东一方制药有限公司', '14596', '中药库', '10克/袋', '袋', '1', '1.4400', '258.0000', '371.5200', '0', '0', '0', '2018/5/9 1:00:00', '1525864259', '1525863885', '', '香附', 'XF');
INSERT INTO `jd_drug` VALUES ('220', '1', '小茴香', '2279', '颗粒', '广东一方制药有限公司', '14599', '中药库', '6克/袋', '袋', '1', '0.9900', '328.0000', '324.7200', '0', '0', '0', '2018/5/9 1:00:00', '1525864259', '1525863885', '', '小茴香', 'XHX');
INSERT INTO `jd_drug` VALUES ('221', '1', '益母草', '2301', '颗粒', '广东一方制药有限公司', '14620', '中药库', '15克/袋', '袋', '1', '1.1300', '423.0000', '477.9900', '0', '0', '0', '2018/5/9 1:00:00', '1525864259', '1525863885', '', '益母草', 'YMC');
INSERT INTO `jd_drug` VALUES ('222', '1', '薏苡仁', '2303', '颗粒', '广东一方制药有限公司', '14622', '中药库', '15克/袋', '袋', '1', '1.4000', '161.0000', '225.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864259', '1525863885', '', '薏苡仁', 'YYR');
INSERT INTO `jd_drug` VALUES ('223', '1', '茵陈', '2304', '颗粒', '广东一方制药有限公司', '14623', '中药库', '15克/袋', '袋', '1', '1.1900', '36.0000', '42.8400', '0', '0', '0', '2018/5/9 1:00:00', '1525864259', '1525863886', '', '茵陈', 'YC');
INSERT INTO `jd_drug` VALUES ('224', '1', '淫羊藿', '2305', '颗粒', '广东一方制药有限公司', '14624', '中药库', '10克/袋', '袋', '1', '1.5500', '243.0000', '376.6500', '0', '0', '0', '2018/5/9 1:00:00', '1525864259', '1525863886', '', '淫羊藿', 'YYH');
INSERT INTO `jd_drug` VALUES ('225', '1', '玉竹', '2312', '颗粒', '广东一方制药有限公司', '14631', '中药库', '10克/袋', '袋', '1', '2.1200', '204.0000', '432.4800', '0', '0', '0', '2018/5/9 1:00:00', '1525864259', '1525863886', '', '玉竹', 'YZ');
INSERT INTO `jd_drug` VALUES ('226', '1', '远志', '2315', '颗粒', '广东一方制药有限公司', '14634', '中药库', '6克/袋', '袋', '1', '2.3400', '165.0000', '386.1000', '0', '0', '0', '2018/5/9 1:00:00', '1525864260', '1525863886', '', '远志', 'YZ');
INSERT INTO `jd_drug` VALUES ('227', '1', '枳壳', '2328', '颗粒', '广东一方制药有限公司', '14646', '中药库', '6克/袋', '袋', '1', '1.3000', '83.0000', '107.9000', '0', '0', '0', '2018/5/9 1:00:00', '1525864260', '1525863886', '', '枳壳', 'ZK');
INSERT INTO `jd_drug` VALUES ('228', '1', '炙甘草', '2333', '颗粒', '广东一方制药有限公司', '14651', '中药库', '3克/袋', '袋', '1', '0.6000', '209.0000', '125.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864260', '1525863886', '甘草', '炙甘草', 'ZGC');
INSERT INTO `jd_drug` VALUES ('229', '1', '炙黄芪', '2334', '颗粒', '广东一方制药有限公司', '14652', '中药库', '10克/袋', '袋', '1', '1.6300', '271.0000', '441.7300', '0', '0', '0', '2018/5/9 1:00:00', '1525864260', '1525863886', '', '炙黄芪', 'ZHQ');
INSERT INTO `jd_drug` VALUES ('230', '1', '苎麻根', '2340', '颗粒', '广东一方制药有限公司', '14658', '中药库', '15克/袋', '袋', '0', '0.7500', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864260', '1525863886', '', '苎麻根', 'ZMG');
INSERT INTO `jd_drug` VALUES ('231', '1', '紫苏叶', '2344', '颗粒', '广东一方制药有限公司', '14660', '中药库', '10克/袋', '袋', '1', '0.8000', '162.0000', '129.6000', '0', '0', '0', '2018/5/9 1:00:00', '1525864260', '1525863887', '', '紫苏叶', 'ZSY');
INSERT INTO `jd_drug` VALUES ('232', '1', '人参(生晒参)', '1669', '贵细', '', 'ZZ-SSS', '中药库', 'g', 'g', '1', '3.2000', '26396.8000', '84469.7600', '0', '0', '0', '2018/5/9 1:00:00', '1525864260', '1525863887', '人参', '人参', 'RC,SSS');
INSERT INTO `jd_drug` VALUES ('233', '1', '鹿角胶', '1672', '贵细', '', 'ZZ-LJJ', '中药库', 'g', 'g', '1', '6.5000', '56150.0000', '364975.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864260', '1525863887', '', '鹿角胶', 'LJJ');
INSERT INTO `jd_drug` VALUES ('234', '1', '阿胶(阿胶(福))', '1673', '贵细', '', 'ZZ-LPJ', '中药库', 'g', 'g', '1', '3.9600', '937.5000', '3712.5000', '0', '0', '0', '2018/5/9 1:00:00', '1525864261', '1525863887', '', '阿胶', 'AJ,EJ,F');
INSERT INTO `jd_drug` VALUES ('235', '1', '香豆豉(豆豉)', '855', '中药', '', '02-259-01', '中药库', 'g', 'g', '1', '0.0375', '17977.0000', '673.8575', '0', '0', '0', '2018/5/9 1:00:00', '1525864261', '1525863887', '', '香豆豉', 'XDC,DS');
INSERT INTO `jd_drug` VALUES ('236', '1', '藿香', '864', '中药', '', '03-001-04', '中药库', 'g', 'g', '1', '0.0350', '5359.0000', '187.5500', '0', '0', '0', '2018/5/9 1:00:00', '1525864261', '1525863887', '', '藿香', 'HX');
INSERT INTO `jd_drug` VALUES ('237', '1', '鬼箭羽', '1266', '中药', '', '06-027-01', '中药库', 'g', 'g', '1', '0.2750', '1651.0000', '454.0250', '0', '0', '0', '2018/5/9 1:00:00', '1525864261', '1525863887', '', '鬼箭羽', 'GJY');
INSERT INTO `jd_drug` VALUES ('238', '1', '皂角刺', '1267', '中药', '', '06-028-01', '中药库', 'g', 'g', '1', '0.2100', '7553.0000', '1586.1300', '0', '0', '0', '2018/5/9 1:00:00', '1525864261', '1525863888', '', '皂角刺', 'ZJC');
INSERT INTO `jd_drug` VALUES ('239', '1', '钩藤', '1268', '中药', '', '06-031-01', '中药库', 'g', 'g', '1', '0.1838', '10629.0000', '1952.8925', '0', '0', '0', '2018/5/9 1:00:00', '1525864262', '1525863888', '', '钩藤', 'GT');
INSERT INTO `jd_drug` VALUES ('240', '1', '忍冬藤', '1269', '中药', '', '06-032-01', '中药库', 'g', '克', '1', '0.0288', '6999.0000', '200.4163', '0', '0', '0', '2018/5/9 1:00:00', '1525864262', '1525863888', '', '忍冬藤', 'RDT');
INSERT INTO `jd_drug` VALUES ('241', '1', '鸡血藤', '1271', '中药', '', '06-033-01', '中药库', 'g', 'g', '1', '0.0230', '38160.0000', '877.7750', '0', '0', '0', '2018/5/9 1:00:00', '1525864262', '1525863888', '', '鸡血藤', 'JXT');
INSERT INTO `jd_drug` VALUES ('242', '1', '首乌藤(首乌藤)', '1273', '中药', '', '06-034-01', '中药库', 'g', 'g', '1', '0.0413', '6339.0000', '260.1750', '0', '0', '0', '2018/5/9 1:00:00', '1525864262', '1525863888', '', '首乌藤', 'SWT');
INSERT INTO `jd_drug` VALUES ('243', '1', '海风藤', '1275', '中药', '', '06-035-01', '中药库', 'g', 'g', '0', '0.0390', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864262', '1525863888', '', '海风藤', 'HFT');
INSERT INTO `jd_drug` VALUES ('244', '1', '青风藤', '1276', '中药', '', '06-036-01', '中药库', 'g', 'g', '1', '0.0338', '4540.0000', '153.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864262', '1525863888', '', '青风藤', 'QFT');
INSERT INTO `jd_drug` VALUES ('245', '1', '络石藤', '1278', '中药', '', '06-038-01', '中药库', 'g', 'g', '1', '0.0363', '3720.0000', '134.7950', '0', '0', '0', '2018/5/9 1:00:00', '1525864262', '1525863889', '', '络石藤', 'LST');
INSERT INTO `jd_drug` VALUES ('246', '1', '大血藤(大血藤、活血藤)', '1280', '中药', '', '06-041-01', '中药库', 'g', 'g', '1', '0.0300', '2358.0000', '70.7400', '0', '0', '0', '2018/5/9 1:00:00', '1525864262', '1525863889', '', '大血藤', 'DXT,HXT');
INSERT INTO `jd_drug` VALUES ('247', '1', '淡竹叶', '890', '中药', '', '03-014-01', '中药库', 'g', 'g', '1', '0.0525', '1276.0000', '67.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864263', '1525863890', '', '淡竹叶', 'DZY');
INSERT INTO `jd_drug` VALUES ('248', '1', '泽兰', '891', '中药', '', '03-015-01', '中药库', 'g', 'g', '1', '0.0210', '4462.0000', '93.6620', '0', '0', '0', '2018/5/9 1:00:00', '1525864263', '1525863890', '', '泽兰', 'ZL');
INSERT INTO `jd_drug` VALUES ('249', '1', '干佩兰', '893', '中药', '', '03-016-01', '中药库', 'g', 'g', '1', '0.0400', '3104.0000', '124.1600', '0', '0', '0', '2018/5/9 1:00:00', '1525864263', '1525863890', '', '干佩兰', 'GPL');
INSERT INTO `jd_drug` VALUES ('250', '1', '益母草', '895', '中药', '', '03-017-01', '中药库', 'g', 'g', '1', '0.0313', '10594.0000', '326.2663', '0', '0', '0', '2018/5/9 1:00:00', '1525864263', '1525863890', '', '益母草', 'YMC');
INSERT INTO `jd_drug` VALUES ('251', '1', '石斛(川石斛)', '898', '中药', '', '03-018-08', '中药库', 'g', 'g', '1', '0.1300', '10698.0000', '1390.7400', '0', '0', '0', '2018/5/9 1:00:00', '1525864263', '1525863890', '', '石斛', 'SH,CSH');
INSERT INTO `jd_drug` VALUES ('252', '1', '牡蛎', '2144', '颗粒', '广东一方制药有限公司', '14475', '中药库', '20克/袋', '袋', '1', '0.8000', '231.0000', '184.8000', '0', '0', '0', '2018/5/9 1:00:00', '1525864263', '1525863890', '', '牡蛎', 'ML');
INSERT INTO `jd_drug` VALUES ('253', '1', '木香', '2147', '颗粒', '广东一方制药有限公司', '14478', '中药库', '6克/袋', '袋', '1', '1.0900', '190.0000', '207.1000', '0', '0', '0', '2018/5/9 1:00:00', '1525864263', '1525863890', '', '木香', 'MX');
INSERT INTO `jd_drug` VALUES ('254', '1', '南沙参', '2150', '颗粒', '广东一方制药有限公司', '14481', '中药库', '10克/袋', '袋', '1', '1.3800', '278.0000', '383.6400', '0', '0', '0', '2018/5/9 1:00:00', '1525864263', '1525863891', '南沙参', '南沙参', 'NSC');
INSERT INTO `jd_drug` VALUES ('255', '1', '牛膝', '2152', '颗粒', '广东一方制药有限公司', '14483', '中药库', '10克/袋', '袋', '1', '2.0100', '120.0000', '241.2000', '0', '0', '0', '2018/5/9 1:00:00', '1525864264', '1525863891', '', '牛膝', 'NX');
INSERT INTO `jd_drug` VALUES ('256', '1', '女贞子', '2154', '颗粒', '广东一方制药有限公司', '14485', '中药库', '10克/袋', '袋', '1', '1.2400', '333.0000', '412.9200', '0', '0', '0', '2018/5/9 1:00:00', '1525864264', '1525863891', '', '女贞子', 'NZZ');
INSERT INTO `jd_drug` VALUES ('257', '1', '薏苡根', '472', '中药', '', '01-157-01', '中药库', 'g', 'g', '1', '0.0290', '923.0000', '26.7670', '0', '0', '0', '2018/5/9 1:00:00', '1525864264', '1525863891', '', '薏苡根', 'YYG');
INSERT INTO `jd_drug` VALUES ('258', '1', '茶树根', '478', '中药', '', '01-165-01', '中药库', 'g', 'g', '1', '0.0388', '2834.0000', '109.9592', '0', '0', '0', '2018/5/9 1:00:00', '1525864264', '1525863891', '', '茶树根', 'CSG');
INSERT INTO `jd_drug` VALUES ('259', '1', '藤梨根', '484', '中药', '', '01-171-01', '中药库', 'g', 'g', '1', '0.0325', '1399.0000', '45.4400', '0', '0', '0', '2018/5/9 1:00:00', '1525864264', '1525863891', '', '藤梨根', 'TLG');
INSERT INTO `jd_drug` VALUES ('260', '1', '浮萍', '923', '中药', '', '03-040-01', '中药库', 'g', 'g', '1', '0.0240', '2195.0000', '52.6800', '0', '0', '0', '2018/5/9 1:00:00', '1525864264', '1525863891', '', '浮萍', 'FP');
INSERT INTO `jd_drug` VALUES ('261', '1', '伸筋草', '924', '中药', '', '03-042-01', '中药库', 'g', 'g', '1', '0.0375', '4074.0000', '152.7500', '0', '0', '0', '2018/5/9 1:00:00', '1525864264', '1525863892', '', '伸筋草', 'SJC');
INSERT INTO `jd_drug` VALUES ('262', '1', '鱼腥草', '925', '中药', '', '03-046-01', '中药库', 'g', '克', '1', '0.0340', '11812.0000', '401.6100', '0', '0', '0', '2018/5/9 1:00:00', '1525864264', '1525863892', '', '鱼腥草', 'YXC');
INSERT INTO `jd_drug` VALUES ('263', '1', '白花蛇舌草', '926', '中药', '', '03-049-01', '中药库', 'g', 'g', '1', '0.0600', '12435.0000', '746.1000', '0', '0', '0', '2018/5/9 1:00:00', '1525864264', '1525863892', '', '白花蛇舌草', 'BHSSC');
INSERT INTO `jd_drug` VALUES ('264', '1', '灯心草', '927', '中药', '', '03-050-01', '中药库', 'g', 'g', '1', '0.5200', '1087.0000', '565.2400', '0', '0', '0', '2018/5/9 1:00:00', '1525864265', '1525863892', '', '灯心草', 'DXC');
INSERT INTO `jd_drug` VALUES ('265', '1', '豨莶草', '931', '中药', '', '03-051-01', '中药库', 'g', 'g', '1', '0.0150', '2120.0000', '31.8000', '0', '0', '0', '2018/5/9 1:00:00', '1525864265', '1525863892', '', '豨莶草', 'XXC');
INSERT INTO `jd_drug` VALUES ('266', '1', '香薷(香茹)', '935', '中药', '', '03-054-01', '中药库', 'g', 'g', '1', '0.0363', '870.0000', '31.5810', '0', '0', '0', '2018/5/9 1:00:00', '1525864265', '1525863892', '', '香薷', 'XR,XR');
INSERT INTO `jd_drug` VALUES ('267', '1', '石韦', '936', '中药', '', '03-055-01', '中药库', 'g', 'g', '1', '0.0625', '1586.0000', '99.1250', '0', '0', '0', '2018/5/9 1:00:00', '1525864265', '1525863892', '', '石韦', 'SW');
INSERT INTO `jd_drug` VALUES ('268', '1', '石见穿', '937', '中药', '', '03-056-01', '中药库', 'g', 'g', '1', '0.0570', '8631.0000', '491.9160', '0', '0', '0', '2018/5/9 1:00:00', '1525864265', '1525863892', '', '石见穿', 'SJC');
INSERT INTO `jd_drug` VALUES ('269', '1', '紫花地丁(地丁草)', '938', '中药', '', '03-057-01', '中药库', 'g', 'g', '1', '0.0575', '10851.0000', '623.5300', '0', '0', '0', '2018/5/9 1:00:00', '1525864265', '1525863893', '', '紫花地丁', 'ZHDD,DDC');
INSERT INTO `jd_drug` VALUES ('270', '1', '冰球子', '508', '中药', '', '01-201-01', '中药库', 'g', 'g', '1', '1.0250', '1428.0000', '1463.7000', '0', '0', '0', '2018/5/9 1:00:00', '1525864265', '1525863893', '', '冰球子', 'BQZ');
INSERT INTO `jd_drug` VALUES ('271', '1', '徐长卿', '516', '中药', '', '01-209-01', '中药库', 'g', 'g', '1', '0.1263', '14844.0000', '1873.3513', '0', '0', '0', '2018/5/9 1:00:00', '1525864265', '1525863893', '', '徐长卿', 'XCQ');
INSERT INTO `jd_drug` VALUES ('272', '1', '红景天', '520', '中药', '', '01-213-01', '中药库', 'g', 'g', '1', '0.1120', '16587.0000', '1857.7440', '0', '0', '0', '2018/5/9 1:00:00', '1525864266', '1525863893', '', '红景天', 'HJT');
INSERT INTO `jd_drug` VALUES ('273', '1', '六月雪', '1310', '中药', '', '06-079-01', '中药库', 'g', 'g', '1', '0.0288', '1335.0000', '38.3675', '0', '0', '0', '2018/5/9 1:00:00', '1525864266', '1525863893', '', '六月雪', 'LYX');
INSERT INTO `jd_drug` VALUES ('274', '1', '白茯苓(茯苓)', '1314', '中药', '', '07-001-03', '中药库', 'g', 'g', '1', '0.0740', '26753.0000', '1980.0580', '0', '0', '0', '2018/5/9 1:00:00', '1525864266', '1525863893', '', '白茯苓', 'BFL,FL');
INSERT INTO `jd_drug` VALUES ('275', '1', '朱砂拌白茯苓', '1315', '中药', '', '07-001-04', '中药库', 'g', 'g', '1', '0.0830', '1080.0000', '89.6400', '0', '0', '0', '2018/5/9 1:00:00', '1525864266', '1525863893', '', '朱砂拌白茯苓', 'ZSBBFL');
INSERT INTO `jd_drug` VALUES ('276', '1', '茯神', '1318', '中药', '', '07-001-07', '中药库', 'g', 'g', '1', '0.1250', '11853.0000', '1481.3700', '0', '0', '0', '2018/5/9 1:00:00', '1525864266', '1525863893', '', '茯神', 'FS');
INSERT INTO `jd_drug` VALUES ('277', '1', '生紫苏子(苏子)', '547', '中药', '', '02-010-03', '中药库', 'g', 'g', '1', '0.0500', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864266', '1525863894', '', '生紫苏子', 'SZSZ,SZ');
INSERT INTO `jd_drug` VALUES ('278', '1', '沙苑子(沙苑子)', '553', '中药', '', '02-013-01', '中药库', 'g', 'g', '0', '0.0750', '1351.0000', '101.3150', '0', '0', '0', '2018/5/9 1:00:00', '1525864266', '1525863894', '', '沙苑子', 'SYZ,SYZ');
INSERT INTO `jd_drug` VALUES ('279', '1', '补骨脂', '556', '中药', '', '02-014-01', '中药库', 'g', 'g', '0', '0.0490', '979.0000', '47.9710', '0', '0', '0', '2018/5/9 1:00:00', '1525864266', '1525863894', '', '补骨脂', 'BGZ');
INSERT INTO `jd_drug` VALUES ('280', '1', '车前子', '558', '中药', '', '02-015-01', '中药库', 'g', 'g', '0', '0.0750', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864267', '1525863894', '', '车前子', 'CQZ');
INSERT INTO `jd_drug` VALUES ('281', '1', '茺蔚子(小胡麻)', '580', '中药', '', '02-026-01', '中药库', 'g', 'g', '1', '0.0963', '8070.0000', '776.0900', '0', '0', '0', '2018/5/9 1:00:00', '1525864267', '1525863894', '', '茺蔚子', 'CWZ,XHM');
INSERT INTO `jd_drug` VALUES ('282', '1', '莱菔子', '583', '中药', '', '02-029-01', '中药库', '克', '克', '0', '0.0300', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864267', '1525863894', '', '莱菔子', 'LFZ');
INSERT INTO `jd_drug` VALUES ('283', '1', '生芥子', '585', '中药', '', '02-030-01', '中药库', 'g', 'g', '0', '0.0350', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864267', '1525863894', '', '生芥子', 'SJZ');
INSERT INTO `jd_drug` VALUES ('284', '1', '煨诃子(柯子)', '587', '中药', '', '02-031-02', '中药库', 'g', 'g', '1', '0.0550', '801.0000', '44.0550', '0', '0', '0', '2018/5/9 1:00:00', '1525864267', '1525863894', '', '煨诃子', 'WHZ,KZ');
INSERT INTO `jd_drug` VALUES ('285', '1', '蔓荆子', '593', '中药', '', '02-033-02', '中药库', 'g', 'g', '0', '0.3113', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864267', '1525863895', '', '蔓荆子', 'WJZ');
INSERT INTO `jd_drug` VALUES ('286', '1', '炒川楝子', '594', '中药', '', '02-034-01', '中药库', 'g', 'g', '1', '0.0210', '17140.0000', '359.9200', '0', '0', '0', '2018/5/9 1:00:00', '1525864267', '1525863895', '', '炒川楝子', 'CCLZ');
INSERT INTO `jd_drug` VALUES ('287', '1', '胡芦巴(葫芦巴)', '598', '中药', '', '02-036-01', '中药库', 'g', 'g', '1', '0.0300', '2080.0000', '62.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864267', '1525863895', '', '胡芦巴', 'HLB');
INSERT INTO `jd_drug` VALUES ('288', '1', '蛇床子', '618', '中药', '', '02-059-01', '中药库', 'g', 'g', '1', '0.1150', '1397.0000', '160.6500', '0', '0', '0', '2018/5/9 1:00:00', '1525864268', '1525863895', '', '蛇床子', 'SCZ');
INSERT INTO `jd_drug` VALUES ('289', '1', '地肤子', '619', '中药', '', '02-060-01', '中药库', 'g', 'g', '1', '0.0700', '2888.0000', '202.1600', '0', '0', '0', '2018/5/9 1:00:00', '1525864268', '1525863895', '', '地肤子', 'DFZ');
INSERT INTO `jd_drug` VALUES ('290', '1', '娑罗子(开心果)', '623', '中药', '', '02-064-02', '中药库', 'g', 'g', '1', '0.1200', '1336.0000', '160.3200', '0', '0', '0', '2018/5/9 1:00:00', '1525864268', '1525863895', '', '娑罗子', 'SLZ,KXG');
INSERT INTO `jd_drug` VALUES ('291', '1', '预知子(八月扎)', '627', '中药', '', '02-068-01', '中药库', 'g', 'g', '1', '0.0580', '4034.0000', '233.9800', '0', '0', '0', '2018/5/9 1:00:00', '1525864268', '1525863895', '', '预知子', 'YZZ,BYZ');
INSERT INTO `jd_drug` VALUES ('292', '1', '莲子心', '629', '中药', '', '02-072-01', '中药库', 'g', 'g', '1', '0.1850', '1117.0000', '206.6450', '0', '0', '0', '2018/5/9 1:00:00', '1525864268', '1525863896', '', '莲子心', 'LZX');
INSERT INTO `jd_drug` VALUES ('293', '1', '丝瓜络', '636', '中药', '', '02-077-01', '中药库', 'g', 'g', '1', '0.1338', '2480.0000', '331.6700', '0', '0', '0', '2018/5/9 1:00:00', '1525864268', '1525863896', '', '丝瓜络', 'SGL');
INSERT INTO `jd_drug` VALUES ('294', '1', '炒黄芩', '200', '中药', '', '01-021-02', '中药库', 'g', 'g', '1', '0.0720', '5121.0000', '368.7040', '0', '0', '0', '2018/5/9 1:00:00', '1525864269', '1525863896', '', '炒黄芩', 'CHQ');
INSERT INTO `jd_drug` VALUES ('295', '1', '麦冬', '202', '中药', '', '01-022-01', '中药库', 'g', 'g', '1', '0.1950', '19059.0000', '3716.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864269', '1525863896', '', '麦冬', 'MD');
INSERT INTO `jd_drug` VALUES ('296', '1', '川贝母(川贝)', '206', '中药', '', '01-023-01', '中药库', 'g', 'g', '1', '5.1250', '24.1000', '123.5125', '0', '0', '0', '2018/5/9 1:00:00', '1525864269', '1525863896', '川贝母', '川贝母', 'CBM,CB');
INSERT INTO `jd_drug` VALUES ('297', '1', '浙贝母(象贝  大贝)', '208', '中药', '', '01-023-03', '中药库', 'g', 'g', '1', '0.2750', '6668.0000', '1833.6300', '0', '0', '0', '2018/5/9 1:00:00', '1525864269', '1525863896', '浙贝母', '浙贝母', 'ZBM,XB,DB');
INSERT INTO `jd_drug` VALUES ('298', '1', '生白术', '209', '中药', '', '01-024-02', '中药库', 'g', 'g', '1', '0.0810', '13854.0000', '1122.0900', '0', '0', '0', '2018/5/9 1:00:00', '1525864269', '1525863897', '', '生白术', 'SBS');
INSERT INTO `jd_drug` VALUES ('299', '1', '蜜麸炒白术', '210', '中药', '', '01-024-03', '中药库', 'g', 'g', '1', '0.0810', '28070.0000', '2273.0280', '0', '0', '0', '2018/5/9 1:00:00', '1525864269', '1525863897', '', '蜜麸炒白术', 'MFCBS');
INSERT INTO `jd_drug` VALUES ('300', '1', '生白芍', '215', '中药', '', '01-025-03', '中药库', 'g', 'g', '1', '0.0730', '12937.0000', '944.4700', '0', '0', '0', '2018/5/9 1:00:00', '1525864269', '1525863897', '白芍', '生白芍', 'SBS');
INSERT INTO `jd_drug` VALUES ('301', '1', '蜜麸炒白芍', '216', '中药', '', '01-025-04', '中药库', 'g', 'g', '1', '0.0730', '21224.0000', '1549.6700', '0', '0', '0', '2018/5/9 1:00:00', '1525864269', '1525863897', '白芍', '蜜麸炒白芍', 'MFCBS');
INSERT INTO `jd_drug` VALUES ('302', '1', '白芷(香白芷)', '218', '中药', '', '01-026-01', '中药库', 'g', 'g', '1', '0.0400', '37090.0000', '1483.6000', '0', '0', '0', '2018/5/9 1:00:00', '1525864270', '1525863897', '', '白芷', 'BZ,XBZ');
INSERT INTO `jd_drug` VALUES ('303', '1', '三七', '162', '中药', '', '01-014-12', '中药库', 'g', '克', '1', '0.7200', '18475.0000', '13302.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864270', '1525863897', '', '三七', 'SQ');
INSERT INTO `jd_drug` VALUES ('304', '1', '甘草(果老)', '166', '中药', '', '01-015-01', '中药库', 'g', 'g', '1', '0.0650', '17754.5000', '1154.0900', '0', '0', '0', '2018/5/9 1:00:00', '1525864270', '1525863897', '甘草', '甘草', 'GC,GL');
INSERT INTO `jd_drug` VALUES ('305', '1', '蜜炙甘草', '167', '中药', '', '01-015-02', '中药库', 'g', 'g', '1', '0.0700', '16114.0000', '1127.9800', '0', '0', '0', '2018/5/9 1:00:00', '1525864270', '1525863898', '甘草', '蜜炙甘草', 'MZGC');
INSERT INTO `jd_drug` VALUES ('306', '1', '当归', '171', '中药', '', '01-016-01', '中药库', 'g', 'g', '1', '0.1300', '32200.0000', '4186.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864270', '1525863898', '', '当归', 'DG');
INSERT INTO `jd_drug` VALUES ('307', '1', '川芎', '180', '中药', '', '01-017-01', '中药库', 'g', 'g', '1', '0.0688', '50538.0000', '3477.6160', '0', '0', '0', '2018/5/9 1:00:00', '1525864270', '1525863898', '', '川芎', 'CX');
INSERT INTO `jd_drug` VALUES ('308', '1', '龙葵', '1006', '中药', '', '03-145-01', '中药库', 'g', '克', '1', '0.0280', '5274.0000', '147.6720', '0', '0', '0', '2018/5/9 1:00:00', '1525864270', '1525863898', '', '龙葵', 'LK');
INSERT INTO `jd_drug` VALUES ('309', '1', '生山药', '239', '中药', '', '01-034-01', '中药库', 'g', 'g', '1', '0.0675', '25442.0000', '1716.7600', '0', '0', '0', '2018/5/9 1:00:00', '1525864270', '1525863898', '', '生山药', 'SSY');
INSERT INTO `jd_drug` VALUES ('310', '1', '泽泻', '241', '中药', '', '01-035-01', '中药库', 'g', 'g', '1', '0.0488', '7837.0000', '381.5600', '0', '0', '0', '2018/5/9 1:00:00', '1525864271', '1525863898', '', '泽泻', 'ZX');
INSERT INTO `jd_drug` VALUES ('311', '1', '天麻', '243', '中药', '', '01-036-01', '中药库', 'g', 'g', '1', '0.3000', '16698.0000', '5009.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864271', '1525863898', '', '天麻', 'TM');
INSERT INTO `jd_drug` VALUES ('312', '1', '天冬', '246', '中药', '', '01-037-01', '中药库', 'g', 'g', '1', '0.2638', '3354.0000', '883.7475', '0', '0', '0', '2018/5/9 1:00:00', '1525864271', '1525863899', '', '天冬', 'TD');
INSERT INTO `jd_drug` VALUES ('313', '1', '生大黄', '248', '中药', '', '01-038-01', '中药库', 'g', 'g', '1', '0.0700', '2725.0000', '190.7500', '0', '0', '0', '2018/5/9 1:00:00', '1525864271', '1525863899', '', '生大黄', 'SDH');
INSERT INTO `jd_drug` VALUES ('314', '1', '酒制大黄(制大黄)', '251', '中药', '', '01-038-05', '中药库', 'g', 'g', '1', '0.0738', '8104.0000', '598.0470', '0', '0', '0', '2018/5/9 1:00:00', '1525864271', '1525863899', '', '酒制大黄', 'JZDH,ZDH');
INSERT INTO `jd_drug` VALUES ('315', '1', '熟附片(制附子 附片 黑附子)', '255', '中药', '', '01-039-02', '中药库', 'g', 'g', '1', '0.1813', '5492.0000', '1000.3100', '0', '0', '0', '2018/5/9 1:00:00', '1528004314', '1525863899', '附子', '熟附片', 'SFP,ZFZ,FP,HFZ');
INSERT INTO `jd_drug` VALUES ('316', '1', '炒酸枣仁(枣仁)', '657', '中药', '', '02-090-02', '中药库', 'g', 'g', '1', '0.4300', '22119.0000', '9511.1700', '0', '0', '0', '2018/5/9 1:00:00', '1525864272', '1525863899', '', '炒酸枣仁', 'CSZR,ZR');
INSERT INTO `jd_drug` VALUES ('317', '1', '柏子仁', '658', '中药', '', '02-091-01', '中药库', 'g', 'g', '1', '0.2700', '5520.0000', '1490.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864272', '1525863899', '', '柏子仁', 'BZR');
INSERT INTO `jd_drug` VALUES ('318', '1', '光杏仁((燀苦杏仁))', '661', '中药', '', '02-092-02', '中药库', 'g', 'g', '1', '0.0670', '6627.0000', '444.0080', '0', '0', '0', '2018/5/9 1:00:00', '1525864272', '1525863899', '', '光杏仁', 'GXR,CKXR');
INSERT INTO `jd_drug` VALUES ('319', '1', '光桃仁(燀桃仁)(光桃仁)', '664', '中药', '', '02-094-02', '中药库', 'g', 'g', '1', '0.1750', '14721.0000', '2576.1850', '0', '0', '0', '2018/5/9 1:00:00', '1525864272', '1525863899', '', '光桃仁', 'GTR,CTR,GTR');
INSERT INTO `jd_drug` VALUES ('320', '1', '盐益智仁', '674', '中药', '', '02-102-01', '中药库', 'g', 'g', '1', '0.3075', '2119.0000', '651.5825', '0', '0', '0', '2018/5/9 1:00:00', '1525864272', '1525863900', '', '盐益智仁', 'YYZR');
INSERT INTO `jd_drug` VALUES ('321', '1', '桔梗', '276', '中药', '', '01-043-02', '中药库', 'g', 'g', '1', '0.0850', '7124.0000', '605.5200', '0', '0', '0', '2018/5/9 1:00:00', '1525864272', '1525863900', '', '桔梗', 'JG');
INSERT INTO `jd_drug` VALUES ('322', '1', '前胡', '278', '中药', '', '01-044-01', '中药库', 'g', 'g', '1', '0.2100', '1890.0000', '396.9000', '0', '0', '0', '2018/5/9 1:00:00', '1525864273', '1525863900', '', '前胡', 'QH');
INSERT INTO `jd_drug` VALUES ('323', '1', '柴胡(北柴胡)', '281', '中药', '', '01-045-01', '中药库', 'g', 'g', '1', '0.2250', '19753.0000', '4444.2700', '0', '0', '0', '2018/5/9 1:00:00', '1525864273', '1525863900', '', '柴胡', 'CH');
INSERT INTO `jd_drug` VALUES ('324', '1', '银柴胡', '287', '中药', '', '01-046-01', '中药库', 'g', 'g', '1', '0.1810', '3530.0000', '638.9390', '0', '0', '0', '2018/5/9 1:00:00', '1525864273', '1525863900', '', '银柴胡', 'YCH');
INSERT INTO `jd_drug` VALUES ('325', '1', '制香附(制香附)', '288', '中药', '', '01-047-01', '中药库', 'g', 'g', '1', '0.0650', '7747.0000', '503.5300', '0', '0', '0', '2018/5/9 1:00:00', '1525864273', '1525863900', '', '制香附', 'ZXF');
INSERT INTO `jd_drug` VALUES ('326', '1', '龙胆', '293', '中药', '', '01-048-01', '中药库', 'g', 'g', '1', '0.1610', '3914.0000', '630.1500', '0', '0', '0', '2018/5/9 1:00:00', '1525864273', '1525863900', '', '龙胆', 'LD');
INSERT INTO `jd_drug` VALUES ('327', '1', '制远志(制远志)', '294', '中药', '', '01-049-01', '中药库', 'g', 'g', '1', '0.2875', '5002.0000', '1438.1475', '0', '0', '0', '2018/5/9 1:00:00', '1525864274', '1525863900', '', '制远志', 'ZYZ');
INSERT INTO `jd_drug` VALUES ('328', '1', '鹿角', '1341', '中药', '', '08-006-02', '中药库', 'g', 'g', '1', '0.5875', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864274', '1525863901', '', '鹿角', 'LJ');
INSERT INTO `jd_drug` VALUES ('329', '1', '鹿角胶霜', '1342', '中药', '', '08-006-03', '中药库', 'g', 'g', '1', '0.8500', '3471.0000', '2950.3500', '0', '0', '0', '2018/5/9 1:00:00', '1525864274', '1525863901', '', '鹿角胶霜', 'LJJS');
INSERT INTO `jd_drug` VALUES ('330', '1', '赤芍', '314', '中药', '', '01-057-01', '中药库', 'g', 'g', '1', '0.0850', '18853.0000', '1602.3700', '0', '0', '0', '2018/5/9 1:00:00', '1525864274', '1525863901', '赤芍', '赤芍', 'CS');
INSERT INTO `jd_drug` VALUES ('331', '1', '黄芪', '2033', '颗粒', '广东一方制药有限公司', '14366', '中药库', '10克/袋', '袋', '1', '2.0600', '486.0000', '1001.1600', '0', '0', '0', '2018/5/9 1:00:00', '1525864274', '1525863901', '', '黄芪', 'HQ');
INSERT INTO `jd_drug` VALUES ('332', '1', '鸡内金', '2039', '颗粒', '广东一方制药有限公司', '14371', '中药库', '10克/袋', '袋', '1', '1.4400', '572.0000', '823.6800', '0', '0', '0', '2018/5/9 1:00:00', '1525864274', '1525863901', '', '鸡内金', 'JNJ');
INSERT INTO `jd_drug` VALUES ('333', '1', '鸡血藤', '2041', '颗粒', '广东一方制药有限公司', '14373', '中药库', '15克/袋', '袋', '1', '1.3700', '137.0000', '187.6900', '0', '0', '0', '2018/5/9 1:00:00', '1525864274', '1525863901', '', '鸡血藤', 'JXT');
INSERT INTO `jd_drug` VALUES ('334', '1', '姜半夏', '2045', '颗粒', '广东一方制药有限公司', '14377', '中药库', '9克/袋', '袋', '1', '5.2200', '364.0000', '1900.0800', '0', '0', '0', '2018/5/9 1:00:00', '1525864274', '1525863902', '半夏', '姜半夏', 'JBX');
INSERT INTO `jd_drug` VALUES ('335', '1', '僵蚕', '2048', '颗粒', '广东一方制药有限公司', '14380', '中药库', '10克/袋', '袋', '1', '5.1700', '83.0000', '429.1100', '0', '0', '0', '2018/5/9 1:00:00', '1525864274', '1525863902', '', '僵蚕', 'JC');
INSERT INTO `jd_drug` VALUES ('336', '1', '连翘', '2088', '颗粒', '广东一方制药有限公司', '14420', '中药库', '袋', '袋', '1', '1.5700', '287.0000', '450.5900', '0', '0', '0', '2018/5/9 1:00:00', '1525864275', '1525863902', '', '连翘', 'LQ');
INSERT INTO `jd_drug` VALUES ('337', '1', '连钱草(金钱草)', '2093', '颗粒', '广东一方制药有限公司', '14425', '中药库', '15克/袋', '袋', '1', '1.3400', '521.0000', '698.1400', '0', '0', '0', '2018/5/9 1:00:00', '1525864275', '1525863902', '', '连钱草', 'LQC,JQC');
INSERT INTO `jd_drug` VALUES ('338', '1', '蜜麻黄', '2134', '颗粒', '广东一方制药有限公司', '14465', '中药库', '5克/袋', '袋', '1', '0.6000', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864275', '1525863902', '', '蜜麻黄', 'MMH');
INSERT INTO `jd_drug` VALUES ('339', '1', '绵萆薢', '2141', '颗粒', '广东一方制药有限公司', '14472', '中药库', '10克/袋', '袋', '1', '0.7500', '107.0000', '80.2500', '0', '0', '0', '2018/5/9 1:00:00', '1525864275', '1525863902', '', '绵萆薢', 'MBX');
INSERT INTO `jd_drug` VALUES ('340', '1', '牡丹皮', '2142', '颗粒', '广东一方制药有限公司', '14473', '中药库', '10克/袋', '袋', '1', '2.8800', '202.0000', '581.7600', '0', '0', '0', '2018/5/9 1:00:00', '1525864275', '1525863902', '', '牡丹皮', 'MDP');
INSERT INTO `jd_drug` VALUES ('341', '1', '蒲黄', '2163', '颗粒', '广东一方制药有限公司', '14492', '中药库', '6克/袋', '袋', '1', '1.5100', '65.0000', '98.1500', '0', '0', '0', '2018/5/9 1:00:00', '1525864275', '1525863903', '', '蒲黄', 'PH');
INSERT INTO `jd_drug` VALUES ('342', '1', '蒲黄炭', '2164', '颗粒', '广东一方制药有限公司', '14493', '中药库', '6克/袋', '袋', '0', '1.4000', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864275', '1525863903', '', '蒲黄炭', 'PHT');
INSERT INTO `jd_drug` VALUES ('343', '1', '西青果(青果)', '2174', '颗粒', '广东一方制药有限公司', '14501', '中药库', '6克/袋', '袋', '1', '0.7300', '120.0000', '87.6000', '0', '0', '0', '2018/5/9 1:00:00', '1525864275', '1525863903', '', '西青果', 'XQG,QG');
INSERT INTO `jd_drug` VALUES ('344', '1', '牡蒿(青蒿)', '2180', '颗粒', '广东一方制药有限公司', '14507', '中药库', '10克/袋', '袋', '0', '0.9000', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864276', '1525863903', '', '牡蒿', 'MH,QH');
INSERT INTO `jd_drug` VALUES ('345', '1', '青礞石', '2181', '颗粒', '广东一方制药有限公司', '14508', '中药库', '10克/袋', '袋', '0', '0.6500', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864276', '1525863904', '', '青礞石', 'QMS');
INSERT INTO `jd_drug` VALUES ('346', '1', '辛夷', '2283', '颗粒', '广东一方制药有限公司', '14603', '中药库', '6克/袋', '袋', '1', '1.8000', '18.0000', '32.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864276', '1525863904', '', '辛夷', 'XY');
INSERT INTO `jd_drug` VALUES ('347', '1', '徐长卿', '2284', '颗粒', '广东一方制药有限公司', '14604', '中药库', '10克/袋', '袋', '1', '2.1700', '206.0000', '447.0200', '0', '0', '0', '2018/5/9 1:00:00', '1525864276', '1525863904', '', '徐长卿', 'XCQ');
INSERT INTO `jd_drug` VALUES ('348', '1', '续断', '2285', '颗粒', '广东一方制药有限公司', '14605', '中药库', '10克/袋', '袋', '1', '1.4200', '103.0000', '146.2600', '0', '0', '0', '2018/5/9 1:00:00', '1525864276', '1525863904', '', '续断', 'XD');
INSERT INTO `jd_drug` VALUES ('349', '1', '玄参', '2286', '颗粒', '广东一方制药有限公司', '14606', '中药库', '10克/袋', '袋', '1', '1.3800', '129.0000', '178.0200', '0', '0', '0', '2018/5/9 1:00:00', '1525864276', '1525863904', '玄参', '玄参', 'XC');
INSERT INTO `jd_drug` VALUES ('350', '1', '血竭', '2288', '颗粒', '广东一方制药有限公司', '14608', '中药库', '1克/袋', '袋', '1', '17.6900', '85.0000', '1503.6500', '0', '0', '0', '2018/5/9 1:00:00', '1525864276', '1525863904', '', '血竭', 'XJ');
INSERT INTO `jd_drug` VALUES ('351', '1', '延胡索', '2291', '颗粒', '广东一方制药有限公司', '14611', '中药库', '10克/袋', '袋', '1', '3.0200', '178.0000', '537.5600', '0', '0', '0', '2018/5/9 1:00:00', '1525864276', '1525863904', '', '延胡索', 'YHS');
INSERT INTO `jd_drug` VALUES ('352', '1', '党参', '139', '中药', '', '01-004-01', '中药库', 'g', 'g', '1', '0.1425', '45390.0000', '6469.0175', '0', '0', '0', '2018/5/9 1:00:00', '1525864277', '1525863904', '党参', '党参', 'DC');
INSERT INTO `jd_drug` VALUES ('353', '1', '北沙参', '142', '中药', '', '01-005-01', '中药库', 'g', 'g', '1', '0.1225', '10316.0000', '1263.7600', '0', '0', '0', '2018/5/9 1:00:00', '1525864277', '1525863905', '北沙参', '北沙参', 'BSC');
INSERT INTO `jd_drug` VALUES ('354', '1', '玄参', '143', '中药', '', '01-006-01', '中药库', 'g', 'g', '1', '0.0475', '10866.0000', '516.1450', '0', '0', '0', '2018/5/9 1:00:00', '1525864277', '1525863905', '玄参', '玄参', 'XC');
INSERT INTO `jd_drug` VALUES ('355', '1', '太子参(孩儿参)', '146', '中药', '', '01-007-01', '中药库', 'g', 'g', '1', '0.2913', '10369.0000', '3019.0125', '0', '0', '0', '2018/5/9 1:00:00', '1525864277', '1525863905', '', '太子参', 'TZC,HRS');
INSERT INTO `jd_drug` VALUES ('356', '1', '生丹参', '149', '中药', '', '01-009-01', '中药库', 'g', 'g', '1', '0.0620', '34411.0000', '2133.4380', '0', '0', '0', '2018/5/9 1:00:00', '1525864277', '1525863905', '丹参', '生丹参', 'SDC');
INSERT INTO `jd_drug` VALUES ('357', '1', '南沙参', '152', '中药', '', '01-010-01', '中药库', 'g', 'g', '1', '0.1100', '9494.0000', '1044.3400', '0', '0', '0', '2018/5/9 1:00:00', '1525864278', '1525863905', '南沙参', '南沙参', 'NSC');
INSERT INTO `jd_drug` VALUES ('358', '1', '苦参', '155', '中药', '', '01-011-01', '中药库', 'g', 'g', '1', '0.0470', '3814.0000', '179.2800', '0', '0', '0', '2018/5/9 1:00:00', '1525864278', '1525863905', '苦参', '苦参', 'KC');
INSERT INTO `jd_drug` VALUES ('359', '1', '水蛭(沙塔干)', '1383', '中药', '', '08-044-01', '中药库', 'g', 'g', '1', '2.1250', '4949.0000', '10516.6200', '0', '0', '0', '2018/5/9 1:00:00', '1525864278', '1525863905', '', '水蛭', 'SZ,STG');
INSERT INTO `jd_drug` VALUES ('360', '1', '石决明', '1387', '中药', '', '08-046-01', '中药库', 'g', 'g', '1', '0.0488', '6850.0000', '333.7625', '0', '0', '0', '2018/5/9 1:00:00', '1525864278', '1525863905', '', '石决明', 'SJM');
INSERT INTO `jd_drug` VALUES ('361', '1', '炒海螵蛸', '1390', '中药', '', '08-049-04', '中药库', 'g', 'g', '1', '0.0800', '2604.0000', '208.3200', '0', '0', '0', '2018/5/9 1:00:00', '1525864278', '1525863906', '', '炒海螵蛸', 'CHPX');
INSERT INTO `jd_drug` VALUES ('362', '1', '煅瓦楞子', '1394', '中药', '', '08-052-02', '中药库', 'g', 'g', '1', '0.0275', '11289.0000', '310.2675', '0', '0', '0', '2018/5/9 1:00:00', '1525864278', '1525863906', '', '煅瓦楞子', 'DWLZ');
INSERT INTO `jd_drug` VALUES ('363', '1', '全蝎(全虫)', '1428', '中药', '', '08-074-01', '中药库', 'g', 'g', '1', '5.2900', '750.0000', '3967.5000', '0', '0', '0', '2018/5/9 1:00:00', '1525864278', '1525863906', '', '全蝎', 'QX');
INSERT INTO `jd_drug` VALUES ('364', '1', '炒土鳖虫(土鳖虫、土元、地乌龟、蟅虫)', '1431', '中药', '', '08-075-02', '中药库', 'g', 'g', '1', '0.1125', '5176.0000', '582.2525', '0', '0', '0', '2018/5/9 1:00:00', '1525864278', '1525863906', '', '炒土鳖虫', 'CTBC,TBC,TY,DWG,ZC');
INSERT INTO `jd_drug` VALUES ('365', '1', '蜈蚣', '1458', '中药', '', '08-098-02', '中药库', '条', '条', '1', '3.9750', '171.0000', '679.7250', '0', '0', '0', '2018/5/9 1:00:00', '1525864278', '1525863906', '', '蜈蚣', 'WG');
INSERT INTO `jd_drug` VALUES ('366', '1', '天龙(壁虎/守宫)', '1468', '中药', '', '08-107-01', '中药库', 'g', 'g', '1', '0.8513', '403.0000', '343.0488', '0', '0', '0', '2018/5/9 1:00:00', '1525864279', '1525863907', '', '天龙', 'TL,SG');
INSERT INTO `jd_drug` VALUES ('367', '1', '炒桑螵蛸(桑螵蛸)', '1470', '中药', '', '08-108-01', '中药库', 'g', 'g', '1', '1.3000', '1058.0000', '1375.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864279', '1525863907', '', '炒桑螵蛸', 'CSPX,SPX');
INSERT INTO `jd_drug` VALUES ('368', '1', '石膏', '1493', '中药', '', '09-003-01', '中药库', 'g', 'g', '1', '0.0225', '18240.0000', '410.4550', '0', '0', '0', '2018/5/9 1:00:00', '1525864279', '1525863907', '', '石膏', 'SG');
INSERT INTO `jd_drug` VALUES ('369', '1', '龙骨(化龙骨，青龙骨)', '1497', '中药', '', '09-004-01', '中药库', 'g', 'g', '1', '0.1920', '24044.0000', '4616.4480', '0', '0', '0', '2018/5/9 1:00:00', '1525864279', '1525863907', '', '龙骨', 'LG,HLG,QLG');
INSERT INTO `jd_drug` VALUES ('370', '1', '煅龙骨(化龙骨，青龙骨)', '1498', '中药', '', '09-004-02', '中药库', 'g', 'g', '1', '0.2110', '18335.0000', '3868.6850', '0', '0', '0', '2018/5/9 1:00:00', '1525864279', '1525863907', '', '煅龙骨', 'DLG,HLG,QLG');
INSERT INTO `jd_drug` VALUES ('371', '1', '软滑石', '1505', '中药', '', '09-007-01', '中药库', 'g', 'g', '1', '0.0263', '1730.0000', '45.5000', '0', '0', '0', '2018/5/9 1:00:00', '1525864279', '1525863907', '', '软滑石', 'RHS');
INSERT INTO `jd_drug` VALUES ('372', '1', '金银花', '2059', '颗粒', '广东一方制药有限公司', '14391', '中药库', '10克/袋', '袋', '1', '6.9700', '195.0000', '1359.1500', '0', '0', '0', '2018/5/9 1:00:00', '1525864279', '1525863907', '', '金银花', 'JYH');
INSERT INTO `jd_drug` VALUES ('373', '1', '金樱子', '2061', '颗粒', '广东一方制药有限公司', '14393', '中药库', '10克/袋', '袋', '1', '1.9300', '39.0000', '75.2700', '0', '0', '0', '2018/5/9 1:00:00', '1525864279', '1525863907', '', '金樱子', 'JYZ');
INSERT INTO `jd_drug` VALUES ('374', '1', '野菊花', '1074', '中药', '', '04-002-08', '中药库', 'g', 'g', '1', '0.1300', '7931.0000', '1031.0300', '0', '0', '0', '2018/5/9 1:00:00', '1525864280', '1525863908', '', '野菊花', 'YJH');
INSERT INTO `jd_drug` VALUES ('375', '1', '红花', '1076', '中药', '', '04-003-01', '中药库', 'g', 'g', '1', '0.2500', '34551.0000', '8637.7500', '0', '0', '0', '2018/5/9 1:00:00', '1525864280', '1525863908', '', '红花', 'HH');
INSERT INTO `jd_drug` VALUES ('376', '1', '蜜炙款冬花', '1079', '中药', '', '04-005-01', '中药库', 'g', 'g', '1', '0.2625', '4300.0000', '1128.7300', '0', '0', '0', '2018/5/9 1:00:00', '1525864280', '1525863908', '', '蜜炙款冬花', 'MZKDH');
INSERT INTO `jd_drug` VALUES ('377', '1', '旋覆花', '1084', '中药', '', '04-008-02', '中药库', 'g', 'g', '1', '0.0750', '785.0000', '58.8750', '0', '0', '0', '2018/5/9 1:00:00', '1525864280', '1525863908', '', '旋覆花', 'XFH');
INSERT INTO `jd_drug` VALUES ('378', '1', '玫瑰花', '1087', '中药', '', '04-011-01', '中药库', 'g', 'g', '1', '0.1525', '6000.0000', '915.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864280', '1525863908', '', '玫瑰花', 'MGH');
INSERT INTO `jd_drug` VALUES ('379', '1', '辛夷(望春花)', '1089', '中药', '', '04-012-01', '中药库', 'g', 'g', '1', '0.0850', '6906.0000', '586.9950', '0', '0', '0', '2018/5/9 1:00:00', '1525864280', '1525863908', '', '辛夷', 'XY,WCH');
INSERT INTO `jd_drug` VALUES ('380', '1', '密蒙花', '1091', '中药', '', '04-014-01', '中药库', 'g', 'g', '1', '0.0550', '1009.0000', '55.4950', '0', '0', '0', '2018/5/9 1:00:00', '1525864280', '1525863908', '', '密蒙花', 'MMH');
INSERT INTO `jd_drug` VALUES ('381', '1', '鸡冠花', '1092', '中药', '', '04-015-01', '中药库', 'g', 'g', '1', '0.0480', '1495.0000', '71.7600', '0', '0', '0', '2018/5/9 1:00:00', '1525864280', '1525863909', '', '鸡冠花', 'JGH');
INSERT INTO `jd_drug` VALUES ('382', '1', '煅制阳起石', '1531', '中药', '', '09-023-01', '中药库', 'g', 'g', '1', '0.0288', '3044.0000', '87.4950', '0', '0', '0', '2018/5/9 1:00:00', '1525864281', '1525863909', '', '煅制阳起石', 'DZYQS');
INSERT INTO `jd_drug` VALUES ('383', '1', '芒硝', '1540', '中药', '', '09-029-03', '中药库', 'g', 'g', '1', '0.0263', '15982.0000', '420.3266', '0', '0', '0', '2018/5/9 1:00:00', '1525864281', '1525863909', '芒硝', '芒硝', 'MX');
INSERT INTO `jd_drug` VALUES ('384', '1', '紫石英', '1545', '中药', '', '09-031-03', '中药库', 'g', 'g', '1', '0.0263', '9425.0000', '247.1613', '0', '0', '0', '2018/5/9 1:00:00', '1525864281', '1525863909', '', '紫石英', 'ZSY');
INSERT INTO `jd_drug` VALUES ('385', '1', '夏枯草(夏枯球)', '1113', '中药', '', '04-041-01', '中药库', 'g', 'g', '1', '0.0720', '12658.0000', '911.3100', '0', '0', '0', '2018/5/9 1:00:00', '1525864281', '1525863909', '', '夏枯草', 'XKC,XKQ');
INSERT INTO `jd_drug` VALUES ('386', '1', '生蒲黄', '1117', '中药', '', '04-044-01', '中药库', 'g', 'g', '1', '0.2200', '3657.0000', '804.5400', '0', '0', '0', '2018/5/9 1:00:00', '1525864281', '1525863909', '', '生蒲黄', 'SPH');
INSERT INTO `jd_drug` VALUES ('387', '1', '草蒲黄炭', '1118', '中药', '', '04-044-02', '中药库', 'g', 'g', '1', '0.1960', '5582.0000', '1094.0720', '0', '0', '0', '2018/5/9 1:00:00', '1525864281', '1525863909', '', '草蒲黄炭', 'CPHT');
INSERT INTO `jd_drug` VALUES ('388', '1', '桑叶', '1122', '中药', '', '04-050-01', '中药库', 'g', 'g', '1', '0.0275', '2096.0000', '57.6050', '0', '0', '0', '2018/5/9 1:00:00', '1525864281', '1525863909', '', '桑叶', 'SY');
INSERT INTO `jd_drug` VALUES ('389', '1', '枇杷叶', '1125', '中药', '', '04-052-01', '中药库', 'g', 'g', '1', '0.0300', '12720.0000', '381.6000', '0', '0', '0', '2018/5/9 1:00:00', '1525864281', '1525863910', '', '枇杷叶', 'PPY');
INSERT INTO `jd_drug` VALUES ('390', '1', '大青叶', '1128', '中药', '', '04-053-01', '中药库', 'g', 'g', '1', '0.0350', '4348.0000', '152.1500', '0', '0', '0', '2018/5/9 1:00:00', '1525864282', '1525863910', '', '大青叶', 'DQY');
INSERT INTO `jd_drug` VALUES ('391', '1', '生侧柏叶', '1130', '中药', '', '04-056-01', '中药库', 'g', 'g', '1', '0.0250', '6387.0000', '159.6650', '0', '0', '0', '2018/5/9 1:00:00', '1525864282', '1525863910', '', '生侧柏叶', 'SCBY');
INSERT INTO `jd_drug` VALUES ('392', '1', '桔梗', '2072', '颗粒', '广东一方制药有限公司', '14404', '中药库', '10克/袋', '袋', '1', '1.8400', '172.0000', '316.4800', '0', '0', '0', '2018/5/9 1:00:00', '1525864282', '1525863910', '', '桔梗', 'JG');
INSERT INTO `jd_drug` VALUES ('393', '1', '菊花', '2073', '颗粒', '广东一方制药有限公司', '14405', '中药库', '10克/袋', '袋', '0', '1.6300', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864282', '1525863910', '', '菊花', 'JH');
INSERT INTO `jd_drug` VALUES ('394', '1', '决明子', '2077', '颗粒', '广东一方制药有限公司', '14409', '中药库', '10克/袋', '袋', '1', '0.8200', '21.0000', '17.2200', '0', '0', '0', '2018/5/9 1:00:00', '1525864282', '1525863910', '', '决明子', 'JMZ');
INSERT INTO `jd_drug` VALUES ('395', '1', '苦参', '2079', '颗粒', '广东一方制药有限公司', '14411', '中药库', '6克/袋', '袋', '1', '0.8000', '395.0000', '316.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864282', '1525863910', '苦参', '苦参', 'KC');
INSERT INTO `jd_drug` VALUES ('396', '1', '苦杏仁', '2082', '颗粒', '广东一方制药有限公司', '14414', '中药库', '10克/袋', '袋', '1', '1.4800', '55.0000', '81.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864282', '1525863910', '', '苦杏仁', 'KXR');
INSERT INTO `jd_drug` VALUES ('397', '1', '槐米炭(槐花)', '1189', '中药', '', '04-144-03', '中药库', 'g', 'g', '1', '0.1100', '590.0000', '64.9000', '0', '0', '0', '2018/5/9 1:00:00', '1525864282', '1525863911', '', '槐米炭', 'HMT,HH');
INSERT INTO `jd_drug` VALUES ('398', '1', '生厚朴', '1196', '中药', '', '05-001-01', '中药库', 'g', 'g', '0', '0.0440', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864283', '1525863911', '', '生厚朴', 'SHP');
INSERT INTO `jd_drug` VALUES ('399', '1', '盐杜仲(盐杜仲)', '1199', '中药', '', '05-002-03', '中药库', 'g', '克', '1', '0.0470', '31601.0000', '1485.1790', '0', '0', '0', '2018/5/9 1:00:00', '1525864283', '1525863911', '', '盐杜仲', 'YDZ');
INSERT INTO `jd_drug` VALUES ('400', '1', '黄柏', '1201', '中药', '', '05-003-01', '中药库', 'g', 'g', '1', '0.0640', '7802.0000', '499.2260', '0', '0', '0', '2018/5/9 1:00:00', '1525864283', '1525863911', '', '黄柏', 'HB');
INSERT INTO `jd_drug` VALUES ('401', '1', '牡丹皮(丹皮)', '1206', '中药', '', '05-004-01', '中药库', 'g', 'g', '1', '0.0750', '13428.0000', '1007.1100', '0', '0', '0', '2018/5/9 1:00:00', '1525864283', '1525863911', '', '牡丹皮', 'MDP,DP');
INSERT INTO `jd_drug` VALUES ('402', '1', '路路通', '2110', '颗粒', '广东一方制药有限公司', '14441', '中药库', '10克/袋', '袋', '1', '0.7800', '145.0000', '113.1000', '0', '0', '0', '2018/5/9 1:00:00', '1525864283', '1525863911', '', '路路通', 'LLT');
INSERT INTO `jd_drug` VALUES ('403', '1', '麦冬', '2120', '颗粒', '广东一方制药有限公司', '14451', '中药库', '10克/袋', '袋', '1', '2.4900', '164.0000', '408.3600', '0', '0', '0', '2018/5/9 1:00:00', '1525864283', '1525863911', '', '麦冬', 'MD');
INSERT INTO `jd_drug` VALUES ('404', '1', '麦芽', '2121', '颗粒', '广东一方制药有限公司', '14452', '中药库', '15克/袋', '袋', '1', '1.2000', '76.0000', '91.2000', '0', '0', '0', '2018/5/9 1:00:00', '1525864283', '1525863912', '', '麦芽', 'MY');
INSERT INTO `jd_drug` VALUES ('405', '1', '石榴皮', '771', '中药', '', '02-156-01', '中药库', 'g', 'g', '1', '0.0270', '5655.0000', '152.6850', '0', '0', '0', '2018/5/9 1:00:00', '1525864283', '1525863912', '', '石榴皮', 'SLP');
INSERT INTO `jd_drug` VALUES ('406', '1', '炒路路通', '774', '中药', '', '02-157-01', '中药库', 'g', 'g', '1', '0.0338', '3088.0000', '103.9188', '0', '0', '0', '2018/5/9 1:00:00', '1525864284', '1525863912', '', '炒路路通', 'CLLT');
INSERT INTO `jd_drug` VALUES ('407', '1', '炒蒺藜(蒺藜)', '777', '中药', '', '02-158-01', '中药库', 'g', 'g', '1', '0.0688', '4996.0000', '343.4250', '0', '0', '0', '2018/5/9 1:00:00', '1525864284', '1525863912', '', '炒蒺藜', 'CJL,JL');
INSERT INTO `jd_drug` VALUES ('408', '1', '木蝴蝶', '781', '中药', '', '02-161-01', '中药库', 'g', 'g', '1', '0.0838', '155.0000', '12.9900', '0', '0', '0', '2018/5/9 1:00:00', '1525864284', '1525863912', '', '木蝴蝶', 'MHD');
INSERT INTO `jd_drug` VALUES ('409', '1', '秫米(秫米)', '785', '中药', '', '02-163-01', '中药库', 'g', 'g', '1', '0.0400', '3270.0000', '130.8000', '0', '0', '0', '2018/5/9 1:00:00', '1525864284', '1525863912', '', '秫米', 'SM');
INSERT INTO `jd_drug` VALUES ('410', '1', '木瓜', '786', '中药', '', '02-164-01', '中药库', 'g', 'g', '1', '0.0625', '7613.0000', '475.7550', '0', '0', '0', '2018/5/9 1:00:00', '1525864284', '1525863912', '', '木瓜', 'MG');
INSERT INTO `jd_drug` VALUES ('411', '1', '生青皮', '788', '中药', '', '02-165-02', '中药库', '克', '克', '1', '0.0220', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864284', '1525863912', '', '生青皮', 'SQP');
INSERT INTO `jd_drug` VALUES ('412', '1', '肉桂', '1227', '中药', '', '05-023-01', '中药库', 'g', 'g', '1', '0.0488', '1796.0000', '87.5550', '0', '0', '0', '2018/5/9 1:00:00', '1525864285', '1525863913', '', '肉桂', 'RG');
INSERT INTO `jd_drug` VALUES ('413', '1', '土荆皮', '1232', '中药', '', '05-026-01', '中药库', 'g', 'g', '1', '0.0900', '2380.0000', '214.2000', '0', '0', '0', '2018/5/9 1:00:00', '1525864285', '1525863913', '', '土荆皮', 'TJP');
INSERT INTO `jd_drug` VALUES ('414', '1', '降香', '1240', '中药', '', '06-003-01', '中药库', 'g', 'g', '1', '0.4858', '1679.0000', '815.5165', '0', '0', '0', '2018/5/9 1:00:00', '1525864285', '1525863913', '', '降香', 'JX');
INSERT INTO `jd_drug` VALUES ('415', '1', '炒决明子', '810', '中药', '', '02-186-02', '中药库', 'g', 'g', '1', '0.0300', '6273.0000', '188.1900', '0', '0', '0', '2018/5/9 1:00:00', '1525864285', '1525863913', '', '炒决明子', 'CJMZ');
INSERT INTO `jd_drug` VALUES ('416', '1', '黑大豆(黑豆)', '817', '中药', '', '02-200-01', '中药库', 'g', 'g', '1', '0.0300', '551.0000', '16.5300', '0', '0', '0', '2018/5/9 1:00:00', '1525864285', '1525863913', '', '黑大豆', 'HDD,HD');
INSERT INTO `jd_drug` VALUES ('417', '1', '制穭豆衣(黑豆衣，稆豆衣净)', '818', '中药', '', '02-201-01', '中药库', 'g', 'g', '1', '0.0490', '2840.0000', '139.1600', '0', '0', '0', '2018/5/9 1:00:00', '1525864285', '1525863913', '', '制穭豆衣', 'ZLDY,HDY,LDYJ');
INSERT INTO `jd_drug` VALUES ('418', '1', '淮小麦', '825', '中药', '', '02-214-01', '中药库', 'g', 'g', '1', '0.0170', '6025.0000', '102.4250', '0', '0', '0', '2018/5/9 1:00:00', '1525864285', '1525863913', '', '淮小麦', 'HXM');
INSERT INTO `jd_drug` VALUES ('419', '1', '浮小麦', '826', '中药', '', '02-215-01', '中药库', 'g', 'g', '1', '0.0170', '1648.0000', '28.0160', '0', '0', '0', '2018/5/9 1:00:00', '1525864285', '1525863914', '', '浮小麦', 'FXM');
INSERT INTO `jd_drug` VALUES ('420', '1', '六神曲炭(六曲)', '1606', '中药', '', '10-069-01', '中药库', 'g', 'g', '1', '0.0500', '16406.0000', '820.3000', '0', '0', '0', '2018/5/9 1:00:00', '1525864286', '1525863914', '', '六神曲炭', 'LSQT,LQ');
INSERT INTO `jd_drug` VALUES ('421', '1', '陈棕炭', '1611', '中药', '', '10-099-01', '中药库', 'g', 'g', '1', '0.0980', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864286', '1525863914', '', '陈棕炭', 'CZT');
INSERT INTO `jd_drug` VALUES ('422', '1', '南瓜蒂', '847', '中药', '', '02-251-01', '中药库', 'g', 'g', '1', '0.1150', '15219.0000', '1750.1700', '0', '0', '0', '2018/5/9 1:00:00', '1525864286', '1525863914', '', '南瓜蒂', 'NGD');
INSERT INTO `jd_drug` VALUES ('423', '1', '蒲公英', '884', '中药', '', '03-010-01', '中药库', 'g', 'g', '1', '0.0450', '9486.0000', '426.8800', '0', '0', '0', '2018/5/9 1:00:00', '1525864286', '1525863914', '', '蒲公英', 'PGY');
INSERT INTO `jd_drug` VALUES ('424', '1', '荆芥', '885', '中药', '', '03-011-01', '中药库', 'g', 'g', '1', '0.0463', '4785.0000', '221.2538', '0', '0', '0', '2018/5/9 1:00:00', '1525864286', '1525863914', '', '荆芥', 'JJ');
INSERT INTO `jd_drug` VALUES ('425', '1', '瞿麦', '888', '中药', '', '03-013-01', '中药库', 'g', 'g', '1', '0.0288', '1203.0000', '34.6444', '0', '0', '0', '2018/5/9 1:00:00', '1525864286', '1525863914', '', '瞿麦', 'QM');
INSERT INTO `jd_drug` VALUES ('426', '1', '炒椿皮(椿皮)', '1215', '中药', '', '05-008-01', '中药库', 'g', 'g', '1', '0.0450', '3339.0000', '150.2550', '0', '0', '0', '2018/5/9 1:00:00', '1525864286', '1525863914', '', '炒椿皮', 'CCP,CP');
INSERT INTO `jd_drug` VALUES ('427', '1', '白鲜皮(白藓皮)', '1219', '中药', '', '05-012-01', '中药库', 'g', 'g', '1', '0.2438', '5511.0000', '1343.2413', '0', '0', '0', '2018/5/9 1:00:00', '1525864286', '1525863915', '', '白鲜皮', 'BXP');
INSERT INTO `jd_drug` VALUES ('428', '1', '合欢皮', '1220', '中药', '', '05-013-01', '中药库', 'g', 'g', '1', '0.0270', '9542.0000', '257.6750', '0', '0', '0', '2018/5/9 1:00:00', '1525864287', '1525863915', '', '合欢皮', 'HHP');
INSERT INTO `jd_drug` VALUES ('429', '1', '制乳香', '1246', '中药', '', '06-009-01', '中药库', 'g', 'g', '1', '0.1763', '1484.0000', '261.5250', '0', '0', '0', '2018/5/9 1:00:00', '1525864287', '1525863915', '', '制乳香', 'ZRX');
INSERT INTO `jd_drug` VALUES ('430', '1', '制没药', '1247', '中药', '', '06-010-01', '中药库', 'g', 'g', '1', '0.2500', '1378.0000', '344.5000', '0', '0', '0', '2018/5/9 1:00:00', '1525864287', '1525863915', '', '制没药', 'ZMY');
INSERT INTO `jd_drug` VALUES ('431', '1', '苏木', '1250', '中药', '', '06-018-01', '中药库', 'g', 'g', '1', '0.0280', '3477.0000', '97.3560', '0', '0', '0', '2018/5/9 1:00:00', '1525864287', '1525863915', '', '苏木', 'SM');
INSERT INTO `jd_drug` VALUES ('432', '1', '猪苓', '1324', '中药', '', '07-004-01', '中药库', 'g', 'g', '1', '0.3500', '3220.0000', '1127.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864287', '1525863915', '', '猪苓', 'ZL');
INSERT INTO `jd_drug` VALUES ('433', '1', '海藻', '1325', '中药', '', '07-006-01', '中药库', 'g', '克', '1', '0.0560', '2265.0000', '126.8240', '0', '0', '0', '2018/5/9 1:00:00', '1525864287', '1525863916', '海藻', '海藻', 'HZ');
INSERT INTO `jd_drug` VALUES ('434', '1', '马勃', '1327', '中药', '', '07-011-01', '中药库', 'g', 'g', '1', '0.5500', '745.0000', '409.7500', '0', '0', '0', '2018/5/9 1:00:00', '1525864287', '1525863916', '', '马勃', 'MB');
INSERT INTO `jd_drug` VALUES ('435', '1', '昆布(昆布)', '1328', '中药', '', '07-020-01', '中药库', 'g', '克', '1', '0.0575', '3066.0000', '176.2800', '0', '0', '0', '2018/5/9 1:00:00', '1525864287', '1525863916', '', '昆布', 'KB');
INSERT INTO `jd_drug` VALUES ('436', '1', '灵芝', '1333', '中药', '', '07-026-01', '中药库', 'g', 'g', '1', '0.1030', '6715.0000', '691.6600', '0', '0', '0', '2018/5/9 1:00:00', '1525864287', '1525863916', '', '灵芝', 'LZ');
INSERT INTO `jd_drug` VALUES ('437', '1', '醋龟甲(龟甲 醋龟板)', '1366', '中药', '', '08-032-02', '中药库', 'g', 'g', '1', '0.8250', '17975.0000', '14829.2800', '0', '0', '0', '2018/5/9 1:00:00', '1525864288', '1525863916', '', '醋龟甲', 'CGJ,GJ,CGB');
INSERT INTO `jd_drug` VALUES ('438', '1', '龟甲胶(龟板胶)', '1367', '贵细', '', '08-032-03', '中药库', 'g', 'g', '1', '5.9000', '42535.5000', '250959.4500', '0', '0', '0', '2018/5/9 1:00:00', '1525864288', '1525863916', '', '龟甲胶', 'GJJ,GBJ');
INSERT INTO `jd_drug` VALUES ('439', '1', '醋鳖甲(上甲)', '1369', '中药', '', '08-034-02', '中药库', 'g', 'g', '1', '0.3750', '14650.0000', '5493.7300', '0', '0', '0', '2018/5/9 1:00:00', '1525864288', '1525863916', '', '醋鳖甲', 'CBJ,SJ');
INSERT INTO `jd_drug` VALUES ('440', '1', '鳖甲胶', '1370', '贵细', '', '08-034-03', '中药库', 'g', 'g', '1', '6.6000', '42514.0000', '280592.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864288', '1525863917', '', '鳖甲胶', 'BJJ');
INSERT INTO `jd_drug` VALUES ('441', '1', '珍珠母', '1371', '中药', '', '08-036-01', '中药库', 'g', 'g', '1', '0.0140', '14539.0000', '203.5460', '0', '0', '0', '2018/5/9 1:00:00', '1525864288', '1525863917', '', '珍珠母', 'ZZM');
INSERT INTO `jd_drug` VALUES ('442', '1', '牡蛎', '1373', '中药', '', '08-037-01', '中药库', 'g', 'g', '1', '0.0288', '22466.0000', '645.0525', '0', '0', '0', '2018/5/9 1:00:00', '1525864289', '1525863917', '', '牡蛎', 'ML');
INSERT INTO `jd_drug` VALUES ('443', '1', '煅牡蛎', '1374', '中药', '', '08-037-02', '中药库', 'g', 'g', '1', '0.0375', '7503.0000', '281.3325', '0', '0', '0', '2018/5/9 1:00:00', '1525864289', '1525863917', '', '煅牡蛎', 'DML');
INSERT INTO `jd_drug` VALUES ('444', '1', '砂炙鸡内金', '1399', '中药', '', '08-058-02', '中药库', 'g', 'g', '1', '0.0350', '13738.0000', '480.7600', '0', '0', '0', '2018/5/9 1:00:00', '1525864289', '1525863917', '', '砂炙鸡内金', 'SZJNJ');
INSERT INTO `jd_drug` VALUES ('445', '1', '砂炒(砂炙)干蟾', '1404', '中药', '', '08-060-01', '中药库', 'g', 'g', '1', '0.1300', '654.0000', '85.0200', '0', '0', '0', '2018/5/9 1:00:00', '1525864289', '1525863917', '', '砂炒', 'SC,SJ,GC');
INSERT INTO `jd_drug` VALUES ('446', '1', '蜜麸炒僵蚕', '1406', '中药', '', '08-062-01', '中药库', 'g', 'g', '1', '0.3500', '6876.0000', '2406.6000', '0', '0', '0', '2018/5/9 1:00:00', '1525864289', '1525863917', '', '蜜麸炒僵蚕', 'MFCJC');
INSERT INTO `jd_drug` VALUES ('447', '1', '蝉蜕(蝉衣)', '1409', '中药', '', '08-063-01', '中药库', 'g', 'g', '1', '0.9050', '1566.0000', '1417.2700', '0', '0', '0', '2018/5/9 1:00:00', '1525864289', '1525863917', '', '蝉蜕', 'CT,CY');
INSERT INTO `jd_drug` VALUES ('448', '1', '蚕砂', '1412', '中药', '', '08-064-01', '中药库', 'g', 'g', '1', '0.0160', '813.0000', '13.0080', '0', '0', '0', '2018/5/9 1:00:00', '1525864290', '1525863918', '', '蚕砂', 'CS');
INSERT INTO `jd_drug` VALUES ('449', '1', '地龙(蚯蚓)', '1438', '中药', '', '08-081-01', '中药库', 'g', 'g', '1', '0.5850', '10159.0000', '5943.0750', '0', '0', '0', '2018/5/9 1:00:00', '1525864290', '1525863918', '', '地龙', 'DL,QY');
INSERT INTO `jd_drug` VALUES ('450', '1', '炒五灵脂', '1442', '中药', '', '08-087-01', '中药库', 'g', 'g', '1', '0.1613', '4499.0000', '725.3213', '0', '0', '0', '2018/5/9 1:00:00', '1525864290', '1525863918', '五灵脂', '炒五灵脂', 'CWLZ');
INSERT INTO `jd_drug` VALUES ('451', '1', '炒九香虫', '1449', '中药', '', '08-094-01', '中药库', 'g', 'g', '0', '1.8200', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864290', '1525863918', '', '炒九香虫', 'CJXC');
INSERT INTO `jd_drug` VALUES ('452', '1', '水牛角', '1480', '中药', '', '08-114-01', '中药库', 'g', 'g', '0', '0.0470', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864290', '1525863918', '', '水牛角', 'SNJ');
INSERT INTO `jd_drug` VALUES ('453', '1', '赭石', '1513', '中药', '', '09-012-01', '中药库', 'g', 'g', '1', '0.0225', '3521.0000', '79.2225', '0', '0', '0', '2018/5/9 1:00:00', '1525864290', '1525863918', '', '赭石', 'ZS');
INSERT INTO `jd_drug` VALUES ('454', '1', '煅赭石', '1514', '中药', '', '09-012-02', '中药库', 'g', 'g', '1', '0.0275', '2636.0000', '72.4850', '0', '0', '0', '2018/5/9 1:00:00', '1525864291', '1525863918', '', '煅赭石', 'DZS');
INSERT INTO `jd_drug` VALUES ('455', '1', '煅磁石', '1516', '中药', '', '09-013-02', '中药库', 'g', 'g', '1', '0.0288', '5308.0000', '152.8664', '0', '0', '0', '2018/5/9 1:00:00', '1525864291', '1525863919', '', '煅磁石', 'DCS');
INSERT INTO `jd_drug` VALUES ('456', '1', '海浮石(海浮石、浮石)', '1517', '中药', '', '09-014-01', '中药库', 'g', 'g', '1', '0.1400', '1390.0000', '194.6000', '0', '0', '0', '2018/5/9 1:00:00', '1525864291', '1525863919', '', '海浮石', 'HFS,FS');
INSERT INTO `jd_drug` VALUES ('457', '1', '生花蕊石', '1521', '中药', '', '09-017-01', '中药库', 'g', 'g', '1', '0.0150', '660.0000', '9.9000', '0', '0', '0', '2018/5/9 1:00:00', '1525864291', '1525863919', '', '生花蕊石', 'SHRS');
INSERT INTO `jd_drug` VALUES ('458', '1', '煅青礞石', '1527', '中药', '', '09-020-03', '中药库', 'g', 'g', '1', '0.0163', '2175.0000', '35.4355', '0', '0', '0', '2018/5/9 1:00:00', '1525864291', '1525863919', '', '煅青礞石', 'DQMS');
INSERT INTO `jd_drug` VALUES ('459', '1', '枯矾粉', '1552', '中药', '', '09-035-01', '中药库', 'g', 'g', '0', '0.0180', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864291', '1525863919', '', '枯矾粉', 'KFF');
INSERT INTO `jd_drug` VALUES ('460', '1', '海金沙', '1591', '中药', '', '10-020-01', '中药库', 'g', 'g', '1', '0.2913', '5202.0000', '1515.0750', '0', '0', '0', '2018/5/9 1:00:00', '1525864292', '1525863920', '', '海金沙', 'HJS');
INSERT INTO `jd_drug` VALUES ('461', '1', '冰糖', '1683', '辅料', '', 'ZZBT01', '中药库', 'g', 'g', '1', '0.0300', '8430.0000', '252.9000', '0', '0', '0', '2018/5/9 1:00:00', '1525864292', '1525863920', '', '冰糖', 'BT');
INSERT INTO `jd_drug` VALUES ('462', '1', '珍珠粉', '1684', '贵细', '', 'ZZ-ZZF', '中药库', 'g', 'g', '1', '2.0000', '75.6000', '151.2000', '0', '0', '0', '2018/5/9 1:00:00', '1525864292', '1525863920', '', '珍珠粉', 'ZZF');
INSERT INTO `jd_drug` VALUES ('463', '1', '龙眼肉(桂圆肉)', '1687', '辅料', '', 'ZZ-GYR', '中药库', 'g', 'g', '1', '0.1700', '4028.0000', '684.7600', '0', '0', '0', '2018/5/9 1:00:00', '1525864292', '1525863920', '', '龙眼肉', 'LYR,GYR');
INSERT INTO `jd_drug` VALUES ('464', '1', '甲级枫斗', '1688', '贵细', '', 'ZZJJFD', '中药库', 'g', 'g', '1', '1.6000', '5000.0000', '8000.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864292', '1525863920', '', '甲级枫斗', 'JJFD');
INSERT INTO `jd_drug` VALUES ('465', '1', '元贞糖', '1690', '辅料', '', 'ZZ-YZT', '中药库', 'g', 'g', '1', '0.1300', '2860.0000', '371.8000', '0', '0', '0', '2018/5/9 1:00:00', '1525864292', '1525863920', '', '元贞糖', 'YZT');
INSERT INTO `jd_drug` VALUES ('466', '1', '木糖醇', '1691', '辅料', '', 'ZZ-MTC', '中药库', 'g', 'g', '1', '0.1200', '2500.0000', '300.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864292', '1525863920', '', '木糖醇', 'MTC');
INSERT INTO `jd_drug` VALUES ('467', '1', '西红花', '1692', '贵细', '', 'ZZ-XHH', '中药库', 'g', 'g', '1', '60.0000', '49.0000', '2940.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864293', '1525863920', '', '西红花', 'XHH');
INSERT INTO `jd_drug` VALUES ('468', '1', '红参片', '1693', '贵细', '', 'ZZHS01', '中药库', 'g', 'g', '1', '2.5000', '928.4000', '2321.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864293', '1525863921', '', '红参片', 'HCP');
INSERT INTO `jd_drug` VALUES ('469', '1', '黄酒', '1694', '辅料', '', 'ZZHJ02', '中药库', 'g', 'g', '1', '0.0125', '32150.0000', '401.8750', '0', '0', '0', '2018/5/9 1:00:00', '1525864293', '1525863921', '', '黄酒', 'HJ');
INSERT INTO `jd_drug` VALUES ('470', '1', '紫河车', '1695', '贵细', '广东一方制药有限公司', 'ZZ-ZHC', '中药库', 'g', 'g', '0', '2.4200', '10.7000', '25.8940', '0', '0', '0', '2018/5/9 1:00:00', '1525864293', '1525863921', '', '紫河车', 'ZHC');
INSERT INTO `jd_drug` VALUES ('471', '1', '孢子粉', '1696', '贵细', '', 'ZZ-BZF', '中药库', 'g', 'g', '1', '8.0000', '207.0000', '1656.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864293', '1525863921', '', '孢子粉', 'BZF');
INSERT INTO `jd_drug` VALUES ('472', '1', '北虫草', '1732', '贵细', '', 'ZZ-BCC', '中药库', 'g', 'g', '1', '1.5000', '1553.0000', '2329.5000', '0', '0', '0', '2018/5/9 1:00:00', '1525864293', '1525863921', '', '北虫草', 'BCC');
INSERT INTO `jd_drug` VALUES ('473', '1', '大青叶', '1919', '颗粒', '广东一方制药有限公司', '14260', '中药库', '15克/袋', '袋', '1', '1.2500', '109.0000', '136.2500', '0', '0', '0', '2018/5/9 1:00:00', '1525864293', '1525863921', '', '大青叶', 'DQY');
INSERT INTO `jd_drug` VALUES ('474', '1', '大枣', '1921', '颗粒', '广东一方制药有限公司', '14261', '中药库', '10克/袋', '袋', '1', '0.8300', '131.0000', '108.7300', '0', '0', '0', '2018/5/9 1:00:00', '1525864293', '1525863921', '', '大枣', 'DZ');
INSERT INTO `jd_drug` VALUES ('475', '1', '胆南星', '1923', '颗粒', '广东一方制药有限公司', '14262', '中药库', '3克/袋', '袋', '1', '1.2300', '164.0000', '201.7200', '0', '0', '0', '2018/5/9 1:00:00', '1525864294', '1525863922', '', '胆南星', 'DNX');
INSERT INTO `jd_drug` VALUES ('476', '1', '当归', '1926', '颗粒', '广东一方制药有限公司', '14265', '中药库', '10克/袋', '袋', '1', '2.6100', '51.0000', '133.1100', '0', '0', '0', '2018/5/9 1:00:00', '1525864294', '1525863922', '', '当归', 'DG');
INSERT INTO `jd_drug` VALUES ('477', '1', '党参', '1929', '颗粒', '广东一方制药有限公司', '14268', '中药库', '10克/袋', '袋', '1', '2.4100', '266.0000', '641.0600', '0', '0', '0', '2018/5/9 1:00:00', '1525864294', '1525863922', '党参', '党参', 'DC');
INSERT INTO `jd_drug` VALUES ('478', '1', '稻芽(谷芽)', '1930', '颗粒', '广东一方制药有限公司', '14269', '中药库', '15克/袋', '袋', '0', '1.0800', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864294', '1525863922', '', '稻芽', 'DY,GY');
INSERT INTO `jd_drug` VALUES ('479', '1', '地黄', '1935', '颗粒', '广东一方制药有限公司', '14273', '中药库', '10克/袋', '袋', '1', '1.6900', '13.0000', '21.9700', '0', '0', '0', '2018/5/9 1:00:00', '1525864294', '1525863922', '', '地黄', 'DH');
INSERT INTO `jd_drug` VALUES ('480', '1', '地龙', '1937', '颗粒', '广东一方制药有限公司', '14275', '中药库', '10克/袋', '袋', '1', '5.5100', '204.0000', '1124.0400', '0', '0', '0', '2018/5/9 1:00:00', '1525864294', '1525863922', '', '地龙', 'DL');
INSERT INTO `jd_drug` VALUES ('481', '1', '豆蔻', '1944', '颗粒', '广东一方制药有限公司', '14281', '中药库', '6克/袋', '袋', '1', '2.5500', '67.0000', '170.8500', '0', '0', '0', '2018/5/9 1:00:00', '1525864294', '1525863922', '', '豆蔻', 'DK');
INSERT INTO `jd_drug` VALUES ('482', '1', '杜仲', '1946', '颗粒', '广东一方制药有限公司', '14283', '中药库', '10克/袋', '袋', '1', '2.5000', '51.0000', '127.5000', '0', '0', '0', '2018/5/9 1:00:00', '1525864294', '1525863922', '', '杜仲', 'DZ');
INSERT INTO `jd_drug` VALUES ('483', '1', '煅龙骨', '1947', '颗粒', '广东一方制药有限公司', '14284', '中药库', '20克/袋', '袋', '0', '2.4400', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864294', '1525863923', '', '煅龙骨', 'DLG');
INSERT INTO `jd_drug` VALUES ('484', '1', '煅牡蛎', '1948', '颗粒', '广东一方制药有限公司', '14285', '中药库', '20克/袋', '袋', '1', '0.9700', '168.0000', '162.9600', '0', '0', '0', '2018/5/9 1:00:00', '1525864295', '1525863923', '', '煅牡蛎', 'DML');
INSERT INTO `jd_drug` VALUES ('485', '1', '法半夏', '1954', '颗粒', '广东一方制药有限公司', '14290', '中药库', '9克/袋', '袋', '1', '5.2200', '193.0000', '490.6800', '0', '0', '0', '2018/5/9 1:00:00', '1527687124', '1525863923', '半夏', '法半夏', 'FBX');
INSERT INTO `jd_drug` VALUES ('486', '1', '防风', '1956', '颗粒', '广东一方制药有限公司', '14292', '中药库', '10克/袋', '袋', '1', '2.6500', '40796.0000', '516.7500', '0', '0', '0', '2018/5/9 1:00:00', '1527874765', '1525863923', '', '防风', 'FF');
INSERT INTO `jd_drug` VALUES ('487', '1', '蜂房', '1959', '颗粒', '广东一方制药有限公司', '14295', '中药库', '5克/袋', '袋', '1', '8.1900', '378.0000', '3095.8200', '0', '0', '0', '2018/5/9 1:00:00', '1525864295', '1525863923', '', '蜂房', 'FF');
INSERT INTO `jd_drug` VALUES ('488', '1', '茯苓', '1968', '颗粒', '广东一方制药有限公司', '14304', '中药库', '10克/袋', '袋', '1', '1.8400', '347.0000', '638.4800', '0', '0', '0', '2018/5/9 1:00:00', '1525864295', '1525863924', '', '茯苓', 'FL');
INSERT INTO `jd_drug` VALUES ('489', '1', '茯神', '1970', '颗粒', '广东一方制药有限公司', '14306', '中药库', '10克/袋', '袋', '1', '1.4200', '226.0000', '320.9200', '0', '0', '0', '2018/5/9 1:00:00', '1525864295', '1525863924', '', '茯神', 'FS');
INSERT INTO `jd_drug` VALUES ('490', '1', '覆盆子', '1974', '颗粒', '广东一方制药有限公司', '14310', '中药库', '10克/袋', '袋', '1', '6.8400', '45.0000', '307.8000', '0', '0', '0', '2018/5/9 1:00:00', '1525864295', '1525863924', '', '覆盆子', 'FPZ');
INSERT INTO `jd_drug` VALUES ('491', '1', '干姜', '1975', '颗粒', '广东一方制药有限公司', '14311', '中药库', '3克/袋', '袋', '1', '0.5500', '361.0000', '198.5500', '0', '0', '0', '2018/5/9 1:00:00', '1525864296', '1525863924', '', '干姜', 'GJ');
INSERT INTO `jd_drug` VALUES ('492', '1', '甘草', '1976', '颗粒', '广东一方制药有限公司', '14312', '中药库', '3克/袋', '袋', '1', '0.6000', '278.0000', '166.8000', '0', '0', '0', '2018/5/9 1:00:00', '1525864296', '1525863924', '甘草', '甘草', 'GC');
INSERT INTO `jd_drug` VALUES ('493', '1', '钩藤', '1986', '颗粒', '广东一方制药有限公司', '14321', '中药库', '10克/袋', '袋', '1', '1.4600', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864296', '1525863924', '', '钩藤', 'GT');
INSERT INTO `jd_drug` VALUES ('494', '1', '狗脊', '1987', '颗粒', '广东一方制药有限公司', '14322', '中药库', '10克/袋', '袋', '1', '0.8100', '35.0000', '28.3500', '0', '0', '0', '2018/5/9 1:00:00', '1525864296', '1525863924', '', '狗脊', 'GJ');
INSERT INTO `jd_drug` VALUES ('495', '1', '枸杞子', '1988', '颗粒', '广东一方制药有限公司', '14323', '中药库', '10克/袋', '袋', '1', '1.8500', '161.0000', '297.8500', '0', '0', '0', '2018/5/9 1:00:00', '1525864296', '1525863924', '', '枸杞子', 'JQZ');
INSERT INTO `jd_drug` VALUES ('496', '1', '桂枝', '1995', '颗粒', '广东一方制药有限公司', '14330', '中药库', '6克/袋', '袋', '1', '0.5800', '482.0000', '279.5600', '0', '0', '0', '2018/5/9 1:00:00', '1525864296', '1525863925', '桂枝', '桂枝', 'GZ');
INSERT INTO `jd_drug` VALUES ('497', '1', '海螵蛸', '1998', '颗粒', '广东一方制药有限公司', '14333', '中药库', '10克/袋', '袋', '1', '1.6100', '236.0000', '379.9600', '0', '0', '0', '2018/5/9 1:00:00', '1525864296', '1525863925', '', '海螵蛸', 'HPX');
INSERT INTO `jd_drug` VALUES ('498', '1', '海藻', '2000', '颗粒', '广东一方制药有限公司', '14335', '中药库', '10克/袋', '袋', '0', '1.0000', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864296', '1525863925', '海藻', '海藻', 'HZ');
INSERT INTO `jd_drug` VALUES ('499', '1', '海带(昆布)', '2002', '颗粒', '广东一方制药有限公司', '14337', '中药库', '10克/袋', '袋', '0', '1.0400', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864296', '1525863925', '', '海带', 'HD,KB');
INSERT INTO `jd_drug` VALUES ('500', '1', '何首乌', '2007', '颗粒', '广东一方制药有限公司', '14342', '中药库', '6克/袋', '袋', '1', '1.2600', '134.0000', '168.8400', '0', '0', '0', '2018/5/9 1:00:00', '1525864297', '1525863925', '', '何首乌', 'HSW');
INSERT INTO `jd_drug` VALUES ('501', '1', '红花', '2013', '颗粒', '广东一方制药有限公司', '14348', '中药库', '5克/袋', '袋', '1', '1.7400', '282.0000', '490.6800', '0', '0', '0', '2018/5/9 1:00:00', '1525864297', '1525863925', '', '红花', 'HH');
INSERT INTO `jd_drug` VALUES ('502', '1', '厚朴', '2016', '颗粒', '广东一方制药有限公司', '14351', '中药库', '6克/袋', '袋', '1', '1.1200', '274.0000', '306.8800', '0', '0', '0', '2018/5/9 1:00:00', '1525864297', '1525863925', '', '厚朴', 'HP');
INSERT INTO `jd_drug` VALUES ('503', '1', '槲寄生(桑寄生)', '2020', '颗粒', '广东一方制药有限公司', '14355', '中药库', '15克/袋', '袋', '1', '1.4800', '268.0000', '396.6400', '0', '0', '0', '2018/5/9 1:00:00', '1525864297', '1525863926', '', '槲寄生', 'HJS,SJS');
INSERT INTO `jd_drug` VALUES ('504', '1', '淮小麦', '2027', '颗粒', '广东一方制药有限公司', '14361', '中药库', '30克/袋', '袋', '1', '1.7700', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864297', '1525863926', '', '淮小麦', 'HXM');
INSERT INTO `jd_drug` VALUES ('505', '1', '黄精', '2031', '颗粒', '广东一方制药有限公司', '14364', '中药库', '15克/袋', '袋', '1', '3.1700', '388.0000', '1229.9600', '0', '0', '0', '2018/5/9 1:00:00', '1525864298', '1525863926', '', '黄精', 'HJ');
INSERT INTO `jd_drug` VALUES ('506', '1', '黄连', '2032', '颗粒', '广东一方制药有限公司', '14365', '中药库', '3克/袋', '袋', '1', '2.0400', '209.0000', '426.3600', '0', '0', '0', '2018/5/9 1:00:00', '1525864298', '1525863926', '', '黄连', 'HL');
INSERT INTO `jd_drug` VALUES ('507', '1', '穿山甲(炮山甲)', '1704', '颗粒', '江阴天江药业有限公司', '14107', '中药库', '3克/袋', '袋', '1', '68.1900', '976.0000', '66553.4400', '0', '0', '0', '2018/5/9 1:00:00', '1525864298', '1525863926', '', '穿山甲', 'CSJ,PSJ');
INSERT INTO `jd_drug` VALUES ('508', '1', '紫河车', '1715', '颗粒', '广东一方制药有限公司', '14118', '中药库', '3克/袋', '袋', '1', '7.3800', '2772.0000', '20457.3600', '0', '0', '0', '2018/5/9 1:00:00', '1525864298', '1525863926', '', '紫河车', 'ZHC');
INSERT INTO `jd_drug` VALUES ('509', '1', '三七粉(参三七粉)', '1720', '颗粒', '江阴天江药业有限公司', '14123', '中药库', '3克/袋', '袋', '1', '6.4400', '565.0000', '3638.6000', '0', '0', '0', '2018/5/9 1:00:00', '1525864298', '1525863926', '', '三七粉', 'SQF,SSQF');
INSERT INTO `jd_drug` VALUES ('510', '1', '太子参', '1722', '颗粒', '广东一方制药有限公司', '14125', '中药库', '15克/袋', '袋', '1', '6.3800', '199.0000', '1269.6200', '0', '0', '0', '2018/5/9 1:00:00', '1525864298', '1525863926', '', '太子参', 'TZC');
INSERT INTO `jd_drug` VALUES ('511', '1', '六神曲', '2098', '颗粒', '广东一方制药有限公司', '14430', '中药库', '10克/袋', '袋', '1', '0.8300', '581.0000', '482.2300', '0', '0', '0', '2018/5/9 1:00:00', '1525864299', '1525863927', '', '六神曲', 'LSQ');
INSERT INTO `jd_drug` VALUES ('512', '1', '龙胆', '2100', '颗粒', '广东一方制药有限公司', '14432', '中药库', '6克/袋', '袋', '1', '1.4600', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864299', '1525863927', '', '龙胆', 'LD');
INSERT INTO `jd_drug` VALUES ('513', '1', '龙骨', '2101', '颗粒', '广东一方制药有限公司', '14433', '中药库', '20克/袋', '袋', '1', '2.0900', '172.0000', '359.4800', '0', '0', '0', '2018/5/9 1:00:00', '1525864299', '1525863927', '', '龙骨', 'LG');
INSERT INTO `jd_drug` VALUES ('514', '1', '龙齿', '2103', '颗粒', '广东一方制药有限公司', '14435', '中药库', '20克/袋', '袋', '0', '7.3400', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864299', '1525863927', '', '龙齿', 'LC');
INSERT INTO `jd_drug` VALUES ('515', '1', '龙葵', '2104', '颗粒', '广东一方制药有限公司', '14436', '中药库', '15克/袋', '袋', '1', '1.1000', '81.0000', '89.1000', '0', '0', '0', '2018/5/9 1:00:00', '1525864299', '1525863927', '', '龙葵', 'LK');
INSERT INTO `jd_drug` VALUES ('516', '1', '芦根(苇茎)', '2105', '颗粒', '广东一方制药有限公司', '14437', '中药库', '15克/袋', '袋', '1', '1.6500', '45.0000', '74.2500', '0', '0', '0', '2018/5/9 1:00:00', '1525864299', '1525863927', '', '芦根', 'LG,WJ');
INSERT INTO `jd_drug` VALUES ('517', '1', '没药', '2126', '颗粒', '广东一方制药有限公司', '14457', '中药库', '6克/袋', '袋', '1', '1.4000', '147.0000', '205.8000', '0', '0', '0', '2018/5/9 1:00:00', '1525864299', '1525863927', '', '没药', 'MY');
INSERT INTO `jd_drug` VALUES ('518', '1', '凤尾草', '921', '中药', '', '03-037-01', '中药库', 'g', 'g', '0', '0.0360', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864299', '1525863927', '', '凤尾草', 'FWC');
INSERT INTO `jd_drug` VALUES ('519', '1', '牡蒿', '941', '中药', '', '03-060-01', '中药库', 'g', 'g', '1', '0.0375', '4387.0000', '164.4750', '0', '0', '0', '2018/5/9 1:00:00', '1525864300', '1525863928', '', '牡蒿', 'MH');
INSERT INTO `jd_drug` VALUES ('520', '1', '刘寄奴', '945', '中药', '', '03-063-01', '中药库', 'g', 'g', '1', '0.0638', '3521.0000', '224.4238', '0', '0', '0', '2018/5/9 1:00:00', '1525864300', '1525863928', '', '刘寄奴', 'LJN');
INSERT INTO `jd_drug` VALUES ('521', '1', '马齿苋', '946', '中药', '', '03-064-01', '中药库', 'g', 'g', '1', '0.0350', '2262.0000', '79.1650', '0', '0', '0', '2018/5/9 1:00:00', '1525864300', '1525863928', '', '马齿苋', 'MCX');
INSERT INTO `jd_drug` VALUES ('522', '1', '半枝莲', '951', '中药', '', '03-069-01', '中药库', 'g', '克', '1', '0.0400', '8659.0000', '346.3600', '0', '0', '0', '2018/5/9 1:00:00', '1525864300', '1525863928', '', '半枝莲', 'BZL');
INSERT INTO `jd_drug` VALUES ('523', '1', '垂盆草', '952', '中药', '', '03-069-04', '中药库', 'g', 'g', '1', '0.0625', '4563.0000', '285.1825', '0', '0', '0', '2018/5/9 1:00:00', '1525864300', '1525863928', '', '垂盆草', 'CPC');
INSERT INTO `jd_drug` VALUES ('524', '1', '半边莲', '953', '中药', '', '03-070-01', '中药库', 'g', 'g', '1', '0.1150', '5575.0000', '641.1250', '0', '0', '0', '2018/5/9 1:00:00', '1525864300', '1525863928', '', '半边莲', 'BBL');
INSERT INTO `jd_drug` VALUES ('525', '1', '淫羊藿(仙灵脾)', '955', '中药', '', '03-072-01', '中药库', 'g', 'g', '1', '0.2625', '3674.0000', '964.2550', '0', '0', '0', '2018/5/9 1:00:00', '1525864300', '1525863928', '', '淫羊藿', 'YYH,XLP');
INSERT INTO `jd_drug` VALUES ('526', '1', '鸭跖草(鸭舌草)', '988', '中药', '', '03-119-01', '中药库', 'g', 'g', '1', '0.0300', '2886.0000', '86.5800', '0', '0', '0', '2018/5/9 1:00:00', '1525864300', '1525863929', '', '鸭跖草', 'YZC,YSC');
INSERT INTO `jd_drug` VALUES ('527', '1', '蜀羊泉(白英)', '1021', '中药', '', '03-170-01', '中药库', 'g', 'g', '1', '0.0300', '10630.0000', '318.9000', '0', '0', '0', '2018/5/9 1:00:00', '1525864301', '1525863929', '', '蜀羊泉', 'SYQ,BY');
INSERT INTO `jd_drug` VALUES ('528', '1', '景天三七', '1025', '中药', '', '03-175-01', '中药库', 'g', 'g', '1', '0.0840', '3720.0000', '312.4800', '0', '0', '0', '2018/5/9 1:00:00', '1525864301', '1525863929', '', '景天三七', 'JTSQ');
INSERT INTO `jd_drug` VALUES ('529', '1', '矮地茶(矮地茶/紫金牛)', '1027', '中药', '', '03-178-01', '中药库', 'g', 'g', '1', '0.0338', '5956.0000', '200.6525', '0', '0', '0', '2018/5/9 1:00:00', '1525864301', '1525863929', '', '矮地茶', 'ADC,ZJN');
INSERT INTO `jd_drug` VALUES ('530', '1', '金银花', '1065', '中药', '', '04-001-01', '中药库', 'g', 'g', '1', '0.2600', '8355.0000', '2172.3000', '0', '0', '0', '2018/5/9 1:00:00', '1525864301', '1525863929', '', '金银花', 'JYH');
INSERT INTO `jd_drug` VALUES ('531', '1', '白菊花(菊花)', '1068', '中药', '', '04-002-01', '中药库', 'g', 'g', '1', '0.1025', '1945.0000', '199.3975', '0', '0', '0', '2018/5/9 1:00:00', '1525864301', '1525863929', '', '白菊花', 'BJH,JH');
INSERT INTO `jd_drug` VALUES ('532', '1', '合欢米(合欢米)', '1094', '中药', '', '04-016-01', '中药库', 'g', 'g', '1', '0.3750', '305.0000', '114.3700', '0', '0', '0', '2018/5/9 1:00:00', '1525864301', '1525863929', '', '合欢米', 'HHM,HHM');
INSERT INTO `jd_drug` VALUES ('533', '1', '月季花', '1101', '中药', '', '04-024-01', '中药库', 'g', 'g', '1', '0.1675', '429.0000', '71.8475', '0', '0', '0', '2018/5/9 1:00:00', '1525864301', '1525863930', '', '月季花', 'YJH');
INSERT INTO `jd_drug` VALUES ('534', '1', '凌霄花', '1108', '中药', '', '04-034-01', '中药库', 'g', 'g', '1', '0.1825', '444.0000', '81.0300', '0', '0', '0', '2018/5/9 1:00:00', '1525864301', '1525863930', '', '凌霄花', 'LXH');
INSERT INTO `jd_drug` VALUES ('535', '1', '玉米须', '1110', '中药', '', '04-038-01', '中药库', 'g', 'g', '1', '0.0350', '1950.0000', '68.2500', '0', '0', '0', '2018/5/9 1:00:00', '1525864302', '1525863930', '', '玉米须', 'YMX');
INSERT INTO `jd_drug` VALUES ('536', '1', '丁香', '1111', '中药', '', '04-039-01', '中药库', 'g', 'g', '1', '0.2040', '1482.0000', '302.3260', '0', '0', '0', '2018/5/9 1:00:00', '1525864302', '1525863930', '丁香', '丁香', 'DX');
INSERT INTO `jd_drug` VALUES ('537', '1', '侧柏叶炭', '1131', '中药', '', '04-056-02', '中药库', 'g', 'g', '1', '0.0375', '1640.0000', '61.4850', '0', '0', '0', '2018/5/9 1:00:00', '1525864302', '1525863930', '', '侧柏叶炭', 'CBYT');
INSERT INTO `jd_drug` VALUES ('538', '1', '干荷叶', '1135', '中药', '', '04-060-01', '中药库', 'g', 'g', '1', '0.0413', '8619.0000', '355.4050', '0', '0', '0', '2018/5/9 1:00:00', '1525864302', '1525863930', '', '干荷叶', 'GHY');
INSERT INTO `jd_drug` VALUES ('539', '1', '干荷蒂', '1138', '中药', '', '04-060-05', '中药库', 'g', 'g', '1', '0.0350', '925.0000', '32.3750', '0', '0', '0', '2018/5/9 1:00:00', '1525864302', '1525863930', '', '干荷蒂', 'GHD');
INSERT INTO `jd_drug` VALUES ('540', '1', '橘叶', '1140', '中药', '', '04-061-01', '中药库', 'g', 'g', '1', '0.0180', '1152.0000', '20.7280', '0', '0', '0', '2018/5/9 1:00:00', '1525864302', '1525863930', '', '橘叶', 'JY');
INSERT INTO `jd_drug` VALUES ('541', '1', '石楠叶', '1141', '中药', '', '04-062-01', '中药库', 'g', 'g', '1', '0.0463', '3531.0000', '163.0550', '0', '0', '0', '2018/5/9 1:00:00', '1525864302', '1525863931', '', '石楠叶', 'SNY');
INSERT INTO `jd_drug` VALUES ('542', '1', '木芙蓉叶', '1142', '中药', '', '04-064-01', '中药库', 'g', 'g', '1', '0.0525', '1159.0000', '60.8475', '0', '0', '0', '2018/5/9 1:00:00', '1525864302', '1525863931', '', '木芙蓉叶', 'MFRY');
INSERT INTO `jd_drug` VALUES ('543', '1', '铁树叶', '1144', '中药', '', '04-066-01', '中药库', 'g', 'g', '1', '0.0300', '1000.0000', '30.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864303', '1525863931', '', '铁树叶', 'TSY');
INSERT INTO `jd_drug` VALUES ('544', '1', '艾叶', '1145', '中药', '', '04-068-01', '中药库', 'g', 'g', '1', '0.0350', '34215.0000', '1197.5150', '0', '0', '0', '2018/5/9 1:00:00', '1525864303', '1525863931', '', '艾叶', 'AY');
INSERT INTO `jd_drug` VALUES ('545', '1', '艾叶炭', '1146', '中药', '', '04-068-02', '中药库', 'g', 'g', '1', '0.0538', '1726.0000', '92.7725', '0', '0', '0', '2018/5/9 1:00:00', '1525864303', '1525863931', '', '艾叶炭', 'AYT');
INSERT INTO `jd_drug` VALUES ('546', '1', '桑白皮', '1209', '中药', '', '05-005-01', '中药库', 'g', 'g', '1', '0.0750', '4750.0000', '356.2150', '0', '0', '0', '2018/5/9 1:00:00', '1525864303', '1525863931', '', '桑白皮', 'SBP');
INSERT INTO `jd_drug` VALUES ('547', '1', '地骨皮', '1212', '中药', '', '05-006-01', '中药库', 'g', 'g', '1', '0.1338', '1416.0000', '188.9338', '0', '0', '0', '2018/5/9 1:00:00', '1525864303', '1525863931', '', '地骨皮', 'DGP');
INSERT INTO `jd_drug` VALUES ('548', '1', '香加皮(五加皮)', '1213', '中药', '', '05-007-01', '中药库', 'g', 'g', '1', '0.0488', '32000.0000', '1562.1460', '0', '0', '0', '2018/5/9 1:00:00', '1525864304', '1525863932', '', '香加皮', 'XJP,WJP');
INSERT INTO `jd_drug` VALUES ('549', '1', '槲寄生(槲寄生)', '1251', '中药', '', '06-019-01', '中药库', 'g', 'g', '1', '0.0675', '18240.0000', '1230.7550', '0', '0', '0', '2018/5/9 1:00:00', '1525864304', '1525863932', '', '槲寄生', 'HJS');
INSERT INTO `jd_drug` VALUES ('550', '1', '竹茹', '1253', '中药', '', '06-021-01', '中药库', 'g', 'g', '1', '0.0463', '6426.0000', '297.5600', '0', '0', '0', '2018/5/9 1:00:00', '1525864304', '1525863932', '', '竹茹', 'ZR');
INSERT INTO `jd_drug` VALUES ('551', '1', '桂枝', '1255', '中药', '', '06-022-01', '中药库', 'g', 'g', '1', '0.0350', '30442.0000', '1065.3200', '0', '0', '0', '2018/5/9 1:00:00', '1525864304', '1525863932', '桂枝', '桂枝', 'GZ');
INSERT INTO `jd_drug` VALUES ('552', '1', '桑枝', '1258', '中药', '', '06-023-03', '中药库', 'g', 'g', '1', '0.0263', '500.0000', '13.1250', '0', '0', '0', '2018/5/9 1:00:00', '1525864304', '1525863932', '', '桑枝', 'SZ');
INSERT INTO `jd_drug` VALUES ('553', '1', '油松节', '1260', '中药', '', '06-025-01', '中药库', 'g', 'g', '1', '0.0275', '1000.0000', '27.5000', '0', '0', '0', '2018/5/9 1:00:00', '1525864304', '1525863932', '', '油松节', 'YSJ');
INSERT INTO `jd_drug` VALUES ('554', '1', '通草', '1262', '中药', '', '06-026-04', '中药库', 'g', 'g', '1', '0.6500', '790.0000', '513.5000', '0', '0', '0', '2018/5/9 1:00:00', '1525864304', '1525863932', '', '通草', 'TC');
INSERT INTO `jd_drug` VALUES ('555', '1', '野葡萄藤', '1285', '中药', '', '06-049-01', '中药库', 'g', 'g', '1', '0.0210', '2120.0000', '44.5200', '0', '0', '0', '2018/5/9 1:00:00', '1525864304', '1525863932', '', '野葡萄藤', 'YPTT');
INSERT INTO `jd_drug` VALUES ('556', '1', '香樟木', '1289', '中药', '', '06-056-01', '中药库', 'g', 'g', '1', '0.0250', '675.0000', '16.8750', '0', '0', '0', '2018/5/9 1:00:00', '1525864305', '1525863933', '', '香樟木', 'XZM');
INSERT INTO `jd_drug` VALUES ('557', '1', '接骨木(扦扦活)', '1295', '中药', '', '06-066-01', '中药库', 'g', 'g', '1', '0.0263', '453.0000', '11.8913', '0', '0', '0', '2018/5/9 1:00:00', '1525864305', '1525863933', '', '接骨木', 'JGM,QQH');
INSERT INTO `jd_drug` VALUES ('558', '1', '鸟不宿', '1296', '中药', '', '06-067-01', '中药库', 'g', 'g', '1', '0.0170', '2559.0000', '43.5030', '0', '0', '0', '2018/5/9 1:00:00', '1525864305', '1525863933', '', '鸟不宿', 'NBS');
INSERT INTO `jd_drug` VALUES ('559', '1', '制乌梅', '729', '中药', '', '02-131-01', '中药库', 'g', 'g', '1', '0.0813', '7028.0000', '571.6215', '0', '0', '0', '2018/5/9 1:00:00', '1525864305', '1525863933', '', '制乌梅', 'ZWM');
INSERT INTO `jd_drug` VALUES ('560', '1', '荔枝核', '756', '中药', '', '02-147-01', '中药库', 'g', 'g', '1', '0.0425', '3383.0000', '143.7625', '0', '0', '0', '2018/5/9 1:00:00', '1525864305', '1525863933', '', '荔枝核', 'LZH');
INSERT INTO `jd_drug` VALUES ('561', '1', '芡实', '757', '中药', '', '02-149-01', '中药库', 'g', 'g', '1', '0.1150', '4327.0000', '497.6050', '0', '0', '0', '2018/5/9 1:00:00', '1525864305', '1525863933', '', '芡实', 'QS');
INSERT INTO `jd_drug` VALUES ('562', '1', '生白扁豆', '759', '中药', '', '02-150-01', '中药库', 'g', 'g', '1', '0.0320', '5608.0000', '179.4580', '0', '0', '0', '2018/5/9 1:00:00', '1525864305', '1525863933', '', '生白扁豆', 'SBBD');
INSERT INTO `jd_drug` VALUES ('563', '1', '炒麦芽', '764', '中药', '', '02-152-02', '中药库', 'g', 'g', '1', '0.0160', '15536.0000', '248.2880', '0', '0', '0', '2018/5/9 1:00:00', '1525864305', '1525863934', '', '炒麦芽', 'CMY');
INSERT INTO `jd_drug` VALUES ('564', '1', '生麦芽', '765', '中药', '', '02-152-03', '中药库', 'g', 'g', '1', '0.0160', '10118.0000', '161.6440', '0', '0', '0', '2018/5/9 1:00:00', '1525864306', '1525863934', '', '生麦芽', 'SMY');
INSERT INTO `jd_drug` VALUES ('565', '1', '生稻芽(稻芽)', '768', '中药', '', '02-154-03', '中药库', 'g', 'g', '1', '0.0170', '2372.0000', '40.3190', '0', '0', '0', '2018/5/9 1:00:00', '1525864306', '1525863934', '', '生稻芽', 'SDY,DY');
INSERT INTO `jd_drug` VALUES ('566', '1', '炒稻芽(稻芽)', '769', '中药', '', '02-154-04', '中药库', 'g', 'g', '1', '0.0170', '9213.0000', '156.6140', '0', '0', '0', '2018/5/9 1:00:00', '1525864306', '1525863934', '', '炒稻芽', 'CDY,DY');
INSERT INTO `jd_drug` VALUES ('567', '1', '瘪桃干', '836', '中药', '', '02-232-01', '中药库', 'g', 'g', '1', '0.0325', '3390.0000', '110.1700', '0', '0', '0', '2018/5/9 1:00:00', '1525864306', '1525863934', '', '瘪桃干', 'BTG');
INSERT INTO `jd_drug` VALUES ('568', '1', '枸橘梨', '843', '中药', '', '02-240-01', '中药库', 'g', 'g', '1', '0.0575', '896.0000', '51.5200', '0', '0', '0', '2018/5/9 1:00:00', '1525864306', '1525863934', '', '枸橘梨', 'JJL');
INSERT INTO `jd_drug` VALUES ('569', '1', '薜荔果(木馒头，木莲，鬼臼，鬼馒头，鬼球)', '844', '中药', '', '02-241-01', '中药库', 'g', 'g', '1', '0.0650', '1000.0000', '65.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864306', '1525863934', '', '薜荔果', 'BLG,MMT,ML,GY,GMT,GQ');
INSERT INTO `jd_drug` VALUES ('570', '1', '细辛', '868', '中药', '', '03-002-01', '中药库', 'g', 'g', '1', '0.2500', '3890.0000', '972.5000', '0', '0', '0', '2018/5/9 1:00:00', '1525864307', '1525863935', '细辛', '细辛', 'XX');
INSERT INTO `jd_drug` VALUES ('571', '1', '薄荷', '870', '中药', '', '03-003-01', '中药库', 'g', 'g', '1', '0.0500', '2644.0000', '132.2000', '0', '0', '0', '2018/5/9 1:00:00', '1525864307', '1525863935', '', '薄荷', 'BH');
INSERT INTO `jd_drug` VALUES ('572', '1', '肉苁蓉', '873', '中药', '', '03-004-01', '中药库', 'g', 'g', '1', '0.2940', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864307', '1525863935', '', '肉苁蓉', 'RCR');
INSERT INTO `jd_drug` VALUES ('573', '1', '锁阳', '874', '中药', '', '03-005-01', '中药库', 'g', 'g', '1', '0.0575', '8070.0000', '464.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864307', '1525863935', '', '锁阳', 'SY');
INSERT INTO `jd_drug` VALUES ('574', '1', '大蓟', '875', '中药', '', '03-006-01', '中药库', 'g', 'g', '1', '0.0450', '446.0000', '20.0700', '0', '0', '0', '2018/5/9 1:00:00', '1525864307', '1525863935', '', '大蓟', 'DJ');
INSERT INTO `jd_drug` VALUES ('575', '1', '小蓟', '877', '中药', '', '03-007-01', '中药库', 'g', 'g', '1', '0.0313', '4127.0000', '128.8363', '0', '0', '0', '2018/5/9 1:00:00', '1525864307', '1525863935', '', '小蓟', 'XJ');
INSERT INTO `jd_drug` VALUES ('576', '1', '蜜炙麻黄', '879', '中药', '', '03-008-01', '中药库', 'g', 'g', '1', '0.0713', '2340.0000', '166.8903', '0', '0', '0', '2018/5/9 1:00:00', '1525864307', '1525863935', '', '蜜炙麻黄', 'MZMH');
INSERT INTO `jd_drug` VALUES ('577', '1', '茵陈', '882', '中药', '', '03-009-01', '中药库', 'g', 'g', '1', '0.0575', '4360.0000', '250.6350', '0', '0', '0', '2018/5/9 1:00:00', '1525864307', '1525863935', '', '茵陈', 'YC');
INSERT INTO `jd_drug` VALUES ('578', '1', '苏败酱(菥蓂)(苏败酱)', '904', '中药', '', '03-019-01', '中药库', 'g', 'g', '1', '0.0375', '4802.0000', '179.9425', '0', '0', '0', '2018/5/9 1:00:00', '1525864308', '1525863936', '', '苏败酱', 'SBJ,XM,SBJ');
INSERT INTO `jd_drug` VALUES ('579', '1', '透骨草', '905', '中药', '', '03-020-01', '中药库', 'g', 'g', '1', '0.0400', '2540.0000', '101.6000', '0', '0', '0', '2018/5/9 1:00:00', '1525864308', '1525863936', '', '透骨草', 'TGC');
INSERT INTO `jd_drug` VALUES ('580', '1', '墨旱莲(旱莲草，金陵草)', '906', '中药', '', '03-021-01', '中药库', 'g', 'g', '1', '0.0280', '13197.0000', '369.5300', '0', '0', '0', '2018/5/9 1:00:00', '1525864308', '1525863936', '', '墨旱莲', 'MHL,HLC,JLC');
INSERT INTO `jd_drug` VALUES ('581', '1', '仙鹤草', '908', '中药', '', '03-022-01', '中药库', 'g', 'g', '1', '0.0350', '9795.0000', '342.7800', '0', '0', '0', '2018/5/9 1:00:00', '1525864308', '1525863936', '', '仙鹤草', 'XHC');
INSERT INTO `jd_drug` VALUES ('582', '1', '木贼', '909', '中药', '', '03-023-01', '中药库', 'g', 'g', '1', '0.0300', '285.0000', '8.5500', '0', '0', '0', '2018/5/9 1:00:00', '1525864308', '1525863936', '', '木贼', 'MZ');
INSERT INTO `jd_drug` VALUES ('583', '1', '连钱草(金钱草)', '912', '中药', '', '03-027-01', '中药库', 'g', 'g', '1', '0.0313', '8045.0000', '249.1450', '0', '0', '0', '2018/5/9 1:00:00', '1525864308', '1525863936', '', '连钱草', 'LQC,JQC');
INSERT INTO `jd_drug` VALUES ('584', '1', '萹蓄(萹蓄)', '914', '中药', '', '03-028-01', '中药库', 'g', 'g', '1', '0.0160', '3205.0000', '51.2800', '0', '0', '0', '2018/5/9 1:00:00', '1525864308', '1525863936', '', '萹蓄', 'BX');
INSERT INTO `jd_drug` VALUES ('585', '1', '车前草', '917', '中药', '', '03-031-01', '中药库', 'g', 'g', '1', '0.0338', '3397.0000', '114.8100', '0', '0', '0', '2018/5/9 1:00:00', '1525864308', '1525863936', '', '车前草', 'CQC');
INSERT INTO `jd_drug` VALUES ('586', '1', '马鞭草', '919', '中药', '', '03-033-01', '中药库', 'g', 'g', '1', '0.0363', '4645.0000', '168.2825', '0', '0', '0', '2018/5/9 1:00:00', '1525864309', '1525863937', '', '马鞭草', 'MBC');
INSERT INTO `jd_drug` VALUES ('587', '1', '鹿衔草(鹿含草)', '920', '中药', '', '03-035-01', '中药库', 'g', 'g', '1', '0.0740', '3300.0000', '244.2000', '0', '0', '0', '2018/5/9 1:00:00', '1525864309', '1525863937', '', '鹿衔草', 'LXC,LHC');
INSERT INTO `jd_drug` VALUES ('588', '1', '黄明胶', '3214', '贵细', '', 'ZZHMJ1', '中药库', 'g', 'g', '1', '1.4200', '8287.6500', '11768.4630', '0', '0', '0', '2018/5/9 1:00:00', '1525864309', '1525863937', '', '黄明胶', 'HMJ');
INSERT INTO `jd_drug` VALUES ('589', '1', '制女贞子', '569', '中药', '', '02-019-01', '中药库', 'g', '克', '1', '0.0230', '9220.0000', '211.8300', '0', '0', '0', '2018/5/9 1:00:00', '1525864309', '1525863937', '', '制女贞子', 'ZNZZ');
INSERT INTO `jd_drug` VALUES ('590', '1', '炒王不留行', '573', '中药', '', '02-021-03', '中药库', 'g', 'g', '1', '0.0310', '7954.0000', '246.5870', '0', '0', '0', '2018/5/9 1:00:00', '1525864309', '1525863937', '', '炒王不留行', 'CWBLX');
INSERT INTO `jd_drug` VALUES ('591', '1', '炒苍耳子', '575', '中药', '', '02-022-02', '中药库', 'g', 'g', '1', '0.0375', '2500.0000', '93.7450', '0', '0', '0', '2018/5/9 1:00:00', '1525864309', '1525863937', '', '炒苍耳子', 'CCEZ');
INSERT INTO `jd_drug` VALUES ('592', '1', '青葙子', '578', '中药', '', '02-024-01', '中药库', 'g', '克', '1', '0.0625', '706.0000', '44.1200', '0', '0', '0', '2018/5/9 1:00:00', '1525864309', '1525863938', '', '青葙子', 'QXZ');
INSERT INTO `jd_drug` VALUES ('593', '1', '水红花子(水红花子)', '606', '中药', '', '02-046-01', '中药库', 'g', 'g', '1', '0.0750', '478.0000', '35.8500', '0', '0', '0', '2018/5/9 1:00:00', '1525864309', '1525863938', '', '水红花子', 'SHHZ');
INSERT INTO `jd_drug` VALUES ('594', '1', '覆盆子', '610', '中药', '', '02-051-01', '中药库', 'g', 'g', '1', '0.5475', '1566.0000', '857.4175', '0', '0', '0', '2018/5/9 1:00:00', '1525864310', '1525863938', '', '覆盆子', 'FPZ');
INSERT INTO `jd_drug` VALUES ('595', '1', '金樱子', '614', '中药', '', '02-055-01', '中药库', 'g', 'g', '1', '0.0538', '2606.0000', '139.8625', '0', '0', '0', '2018/5/9 1:00:00', '1525864310', '1525863938', '', '金樱子', 'JYZ');
INSERT INTO `jd_drug` VALUES ('596', '1', '冬瓜子', '640', '中药', '', '02-082-01', '中药库', 'g', 'g', '1', '0.0550', '1335.0000', '73.4250', '0', '0', '0', '2018/5/9 1:00:00', '1525864310', '1525863938', '', '冬瓜子', 'DGZ');
INSERT INTO `jd_drug` VALUES ('597', '1', '冬瓜皮', '643', '中药', '', '02-083-01', '中药库', 'g', 'g', '1', '0.0438', '2710.0000', '118.5625', '0', '0', '0', '2018/5/9 1:00:00', '1525864310', '1525863938', '', '冬瓜皮', 'DGP');
INSERT INTO `jd_drug` VALUES ('598', '1', '胖大海', '644', '中药', '', '02-084-01', '中药库', 'g', 'g', '1', '0.2625', '640.0000', '168.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864310', '1525863938', '', '胖大海', 'PDH');
INSERT INTO `jd_drug` VALUES ('599', '1', '小茴香', '647', '中药', '', '02-086-01', '中药库', 'g', 'g', '1', '0.0310', '5174.0000', '160.5240', '0', '0', '0', '2018/5/9 1:00:00', '1525864310', '1525863938', '', '小茴香', 'XHX');
INSERT INTO `jd_drug` VALUES ('600', '1', '花椒', '654', '中药', '', '02-088-01', '中药库', 'g', 'g', '1', '0.1700', '4884.0000', '830.2800', '0', '0', '0', '2018/5/9 1:00:00', '1525864310', '1525863939', '', '花椒', 'HJ');
INSERT INTO `jd_drug` VALUES ('601', '1', '花椒目', '655', '中药', '', '02-089-01', '中药库', 'g', 'g', '1', '0.0200', '5353.0000', '107.0600', '0', '0', '0', '2018/5/9 1:00:00', '1525864310', '1525863939', '', '花椒目', 'HJM');
INSERT INTO `jd_drug` VALUES ('602', '1', '豆蔻', '681', '中药', '', '02-105-01', '中药库', 'g', 'g', '1', '0.1463', '3039.0000', '444.4363', '0', '0', '0', '2018/5/9 1:00:00', '1525864311', '1525863939', '', '豆蔻', 'DK');
INSERT INTO `jd_drug` VALUES ('603', '1', '麸煨肉豆蔻(肉果，玉果)', '684', '中药', '', '02-107-01', '中药库', 'g', 'g', '1', '0.2400', '2154.0000', '516.9600', '0', '0', '0', '2018/5/9 1:00:00', '1525864311', '1525863939', '', '麸煨肉豆蔻', 'FWRDK,RG,YG');
INSERT INTO `jd_drug` VALUES ('604', '1', '广佛手', '687', '中药', '', '02-109-01', '中药库', 'g', 'g', '1', '0.0900', '5492.0000', '494.2800', '0', '0', '0', '2018/5/9 1:00:00', '1525864311', '1525863939', '', '广佛手', 'GFS');
INSERT INTO `jd_drug` VALUES ('605', '1', '蜜麸炒香橼', '688', '中药', '', '02-110-02', '中药库', 'g', 'g', '1', '0.0825', '3552.0000', '293.0150', '0', '0', '0', '2018/5/9 1:00:00', '1525864311', '1525863939', '', '蜜麸炒香橼', 'MFCXY');
INSERT INTO `jd_drug` VALUES ('606', '1', '生山楂(生山楂)', '689', '中药', '', '02-111-01', '中药库', 'g', 'g', '1', '0.0240', '21538.0000', '517.0440', '0', '0', '0', '2018/5/9 1:00:00', '1525864311', '1525863939', '', '生山楂', 'SSZ');
INSERT INTO `jd_drug` VALUES ('607', '1', '山楂炭', '691', '中药', '', '02-111-03', '中药库', 'g', 'g', '1', '0.0290', '5747.0000', '166.3800', '0', '0', '0', '2018/5/9 1:00:00', '1525864311', '1525863939', '', '山楂炭', 'SZT');
INSERT INTO `jd_drug` VALUES ('608', '1', '大腹毛(大腹毛)', '715', '中药', '', '02-124-01', '中药库', 'g', 'g', '1', '0.0388', '1819.0000', '70.5732', '0', '0', '0', '2018/5/9 1:00:00', '1525864311', '1525863940', '', '大腹毛', 'DFM');
INSERT INTO `jd_drug` VALUES ('609', '1', '炒瓜蒌子(瓜蒌子)', '719', '中药', '', '02-127-04', '中药库', 'g', 'g', '1', '0.0810', '13648.0000', '1105.4840', '0', '0', '0', '2018/5/9 1:00:00', '1525864311', '1525863940', '', '炒瓜蒌子', 'CGLZ,GLZ');
INSERT INTO `jd_drug` VALUES ('610', '1', '炒瓜蒌皮(瓜蒌皮炒)', '721', '中药', '', '02-129-02', '中药库', 'g', 'g', '1', '0.0600', '3036.0000', '182.1600', '0', '0', '0', '2018/5/9 1:00:00', '1525864312', '1525863940', '瓜蒌皮', '炒瓜蒌皮', 'CGLP,GLPC');
INSERT INTO `jd_drug` VALUES ('611', '1', '连翘壳', '724', '中药', '', '02-130-03', '中药库', 'g', 'g', '1', '0.1470', '28061.0000', '4124.9900', '0', '0', '0', '2018/5/9 1:00:00', '1525864312', '1525863940', '', '连翘壳', 'LQK');
INSERT INTO `jd_drug` VALUES ('612', '1', '地黄炭(生地炭)', '184', '中药', '', '01-018-02', '中药库', 'g', 'g', '0', '0.0500', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864312', '1525863940', '', '地黄炭', 'DHT,SDT');
INSERT INTO `jd_drug` VALUES ('613', '1', '熟地黄', '187', '中药', '', '01-018-05', '中药库', 'g', '克', '1', '0.0480', '36618.0000', '1757.8800', '0', '0', '0', '2018/5/9 1:00:00', '1525864312', '1525863940', '', '熟地黄', 'SDH');
INSERT INTO `jd_drug` VALUES ('614', '1', '黄芪', '192', '中药', '', '01-019-01', '中药库', 'g', 'g', '1', '0.0820', '52370.0000', '4294.3260', '0', '0', '0', '2018/5/9 1:00:00', '1525864312', '1525863940', '', '黄芪', 'HQ');
INSERT INTO `jd_drug` VALUES ('615', '1', '蜜炙黄芪', '194', '中药', '', '01-019-03', '中药库', 'g', 'g', '1', '0.0820', '19666.0000', '1612.5500', '0', '0', '0', '2018/5/9 1:00:00', '1525864312', '1525863941', '', '蜜炙黄芪', 'MZHQ');
INSERT INTO `jd_drug` VALUES ('616', '1', '黄连', '196', '中药', '', '01-020-01', '中药库', 'g', 'g', '1', '0.2813', '9883.0000', '2779.3100', '0', '0', '0', '2018/5/9 1:00:00', '1525864312', '1525863941', '', '黄连', 'HL');
INSERT INTO `jd_drug` VALUES ('617', '1', '黄芩', '199', '中药', '', '01-021-01', '中药库', 'g', 'g', '1', '0.0720', '16652.0000', '1198.5780', '0', '0', '0', '2018/5/9 1:00:00', '1525864312', '1525863941', '', '黄芩', 'HQ');
INSERT INTO `jd_drug` VALUES ('618', '1', '白前', '220', '中药', '', '01-027-01', '中药库', 'g', 'g', '1', '0.1050', '1050.0000', '110.2500', '0', '0', '0', '2018/5/9 1:00:00', '1525864313', '1525863941', '', '白前', 'BQ');
INSERT INTO `jd_drug` VALUES ('619', '1', '东阿阿胶', '3053', '贵细', '山东东阿阿胶股份有限公司', 'ZZDAAJ', '中药库', 'g', 'g', '1', '4.2800', '215786.8000', '923567.5040', '0', '0', '0', '2018/5/9 1:00:00', '1525864313', '1525863941', '', '东阿阿胶', 'DAAJ');
INSERT INTO `jd_drug` VALUES ('620', '1', '山参(移山参)', '3054', '贵细', '', 'ZZSS06', '中药库', 'g', 'g', '1', '120.0000', '37.8000', '4536.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864313', '1525863941', '', '山参', 'SC,YSS');
INSERT INTO `jd_drug` VALUES ('621', '1', '高丽白参(白参)', '3055', '贵细', '', 'ZZGLBS', '中药库', 'g', 'g', '1', '4.5000', '301.5000', '1356.7500', '0', '0', '0', '2018/5/9 1:00:00', '1525864313', '1525863942', '', '高丽白参', 'GLBC,BS');
INSERT INTO `jd_drug` VALUES ('622', '1', '蜂蜜', '3056', '辅料', '', 'ZZFM01', '中药库', 'g', 'g', '1', '0.0300', '6480.0000', '194.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864313', '1525863942', '', '蜂蜜', 'FM');
INSERT INTO `jd_drug` VALUES ('623', '1', '鹿鞭', '3057', '贵细', '', 'ZZLB01', '中药库', '条', '条', '1', '800.0000', '64.0000', '51200.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864313', '1525863942', '', '鹿鞭', 'LB');
INSERT INTO `jd_drug` VALUES ('624', '1', '铁皮枫斗(石斛)', '3060', '贵细', '', 'ZZTPFD', '中药库', 'g', 'g', '1', '21.0000', '480.6000', '10092.6000', '0', '0', '0', '2018/5/9 1:00:00', '1525864313', '1525863942', '', '铁皮枫斗', 'TPFD,SH');
INSERT INTO `jd_drug` VALUES ('625', '1', '大黄炭', '3133', '中药', '', 'ZZD002', '中药库', 'g', 'g', '1', '0.0600', '3400.0000', '204.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864313', '1525863942', '', '大黄炭', 'DHT');
INSERT INTO `jd_drug` VALUES ('626', '1', '莲子', '3136', '中药', '', 'ZZLZ01', '中药库', 'g', 'g', '1', '0.0710', '2537.0000', '180.1270', '0', '0', '0', '2018/5/9 1:00:00', '1525864314', '1525863942', '', '莲子', 'LZ');
INSERT INTO `jd_drug` VALUES ('627', '1', '丹参', '3149', '颗粒', '江阴天江药业有限公司', 'DC002', '中药库', '10g/袋', '袋', '1', '1.4100', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864314', '1525863942', '丹参', '丹参', 'DC');
INSERT INTO `jd_drug` VALUES ('628', '1', '麻黄', '3148', '中药', '', 'ZZMHS0', '中药库', 'g', 'g', '1', '0.0675', '4475.0000', '302.0600', '0', '0', '0', '2018/5/9 1:00:00', '1525864314', '1525863942', '', '麻黄', 'MH');
INSERT INTO `jd_drug` VALUES ('629', '1', '鹿角', '3186', '颗粒', '江阴天江药业有限公司', 'LJTJ001', '中药库', '3g/袋', '袋', '1', '3.2600', '517.0000', '1685.4200', '0', '0', '0', '2018/5/9 1:00:00', '1525864314', '1525863943', '', '鹿角', 'LJ');
INSERT INTO `jd_drug` VALUES ('630', '1', '菝葜', '3180', '颗粒', '广东一方制药有限公司', 'BQ001', '中药库', '10g/袋', '袋', '1', '1.1100', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864314', '1525863943', '', '菝葜', 'BQ');
INSERT INTO `jd_drug` VALUES ('631', '1', '马鞭草', '3194', '颗粒', '江阴天江药业有限公司', 'MBC02', '中药库', '10g/袋', '袋', '1', '0.9800', '5.0000', '4.9000', '0', '0', '0', '2018/5/9 1:00:00', '1525864314', '1525863943', '', '马鞭草', 'MBC');
INSERT INTO `jd_drug` VALUES ('632', '1', '莪术', '1810', '颗粒', '广东一方制药有限公司', '14155', '中药库', '10克/袋', '袋', '1', '1.4000', '117.0000', '163.8000', '0', '0', '0', '2018/5/9 1:00:00', '1525864314', '1525863943', '', '莪术', 'ES');
INSERT INTO `jd_drug` VALUES ('633', '1', '水蛭', '1812', '颗粒', '广东一方制药有限公司', '14157', '中药库', '3克/袋', '袋', '1', '7.2600', '223.0000', '1618.9800', '0', '0', '0', '2018/5/9 1:00:00', '1525864314', '1525863943', '', '水蛭', 'SZ');
INSERT INTO `jd_drug` VALUES ('634', '1', '大黄', '1813', '颗粒', '广东一方制药有限公司', '14158', '中药库', '6克/袋', '袋', '1', '1.6100', '340.0000', '547.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864315', '1525863943', '', '大黄', 'DH');
INSERT INTO `jd_drug` VALUES ('635', '1', '巴戟天', '1820', '颗粒', '广东一方制药有限公司', '14165', '中药库', '10克/袋', '袋', '1', '2.8400', '104.0000', '295.3600', '0', '0', '0', '2018/5/9 1:00:00', '1525864315', '1525863943', '', '巴戟天', 'BJT');
INSERT INTO `jd_drug` VALUES ('636', '1', '制厚朴', '3225', '中药', '', 'ZZ-ZHP', '中药库', 'g', 'g', '1', '0.0550', '11492.0000', '632.0300', '0', '0', '0', '2018/5/9 1:00:00', '1525864315', '1525863943', '', '制厚朴', 'ZHP');
INSERT INTO `jd_drug` VALUES ('637', '1', '珍珠母', '3240', '颗粒', '广东一方制药有限公司', 'ZZ-ZZM', '中药库', '20g/袋', '袋', '1', '0.9200', '96.0000', '88.3200', '0', '0', '0', '2018/5/9 1:00:00', '1525864315', '1525863944', '', '珍珠母', 'ZZM');
INSERT INTO `jd_drug` VALUES ('638', '1', '羊蹄根', '3228', '中药', '', 'ZZ-YTG', '中药库', 'g', 'g', '1', '0.0450', '844.0000', '37.9800', '0', '0', '0', '2018/5/9 1:00:00', '1525864315', '1525863944', '', '羊蹄根', 'YTG');
INSERT INTO `jd_drug` VALUES ('639', '1', '盐附子(咸附子)', '3223', '中药', '', 'ZZ-YFP', '中药库', 'g', 'g', '0', '0.0440', '48.8000', '2.1472', '0', '0', '0', '2018/5/9 1:00:00', '1525864315', '1525863944', '附子', '盐附子', 'YFZ,XFZ');
INSERT INTO `jd_drug` VALUES ('640', '1', '蜀羊泉(白英)', '3237', '颗粒', '广东一方制药有限公司', 'ZZ-BY1', '中药库', '20g/袋', '袋', '1', '1.7600', '142.0000', '249.9200', '0', '0', '0', '2018/5/9 1:00:00', '1525864315', '1525863944', '', '蜀羊泉', 'SYQ,BY');
INSERT INTO `jd_drug` VALUES ('641', '1', '生槐米', '3227', '中药', '', 'ZZ-SHM', '中药库', 'g', 'g', '1', '0.0800', '1120.0000', '89.6000', '0', '0', '0', '2018/5/9 1:00:00', '1525864316', '1525863944', '', '生槐米', 'SHM');
INSERT INTO `jd_drug` VALUES ('642', '1', '茅莓根', '3231', '中药', '', 'ZZ-MMG', '中药库', 'g', 'g', '1', '0.0388', '1000.0000', '38.8000', '0', '0', '0', '2018/5/9 1:00:00', '1525864316', '1525863944', '', '茅莓根', 'MMG');
INSERT INTO `jd_drug` VALUES ('643', '1', '马齿苋', '3239', '颗粒', '广东一方制药有限公司', 'ZZ-MCX', '中药库', '15g/袋', '袋', '1', '1.0500', '38.0000', '39.9000', '0', '0', '0', '2018/5/9 1:00:00', '1525864316', '1525863944', '', '马齿苋', 'MCX');
INSERT INTO `jd_drug` VALUES ('644', '1', '绿豆衣', '3232', '中药', '', 'ZZ-LDY', '中药库', 'g', 'g', '1', '0.0370', '480.0000', '17.7620', '0', '0', '0', '2018/5/9 1:00:00', '1525864316', '1525863944', '', '绿豆衣', 'LDY');
INSERT INTO `jd_drug` VALUES ('645', '1', '羚羊角', '3241', '颗粒', '广东一方制药有限公司', 'ZZ-LYJ', '中药库', '0.3g/袋', '袋', '1', '14.3600', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864316', '1525863945', '', '羚羊角', 'LYJ');
INSERT INTO `jd_drug` VALUES ('646', '1', '荔枝核', '3234', '颗粒', '广东一方制药有限公司', 'ZZ-LZH', '中药库', '10g/袋', '袋', '1', '0.8300', '531.0000', '440.7300', '0', '0', '0', '2018/5/9 1:00:00', '1525864316', '1525863945', '', '荔枝核', 'LZH');
INSERT INTO `jd_drug` VALUES ('647', '1', '荆芥', '3236', '颗粒', '广东一方制药有限公司', 'ZZ-JJ1', '中药库', '10g/袋', '袋', '1', '1.0000', '52.0000', '52.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864317', '1525863945', '', '荆芥', 'JJ');
INSERT INTO `jd_drug` VALUES ('648', '1', '绞股蓝', '3230', '中药', '', 'ZZ-JGL', '中药库', 'g', 'g', '1', '0.0475', '3503.0000', '166.3900', '0', '0', '0', '2018/5/9 1:00:00', '1525864317', '1525863945', '', '绞股蓝', 'JGL');
INSERT INTO `jd_drug` VALUES ('649', '1', '地肤子', '3238', '颗粒', '广东一方制药有限公司', 'ZZ-DFZ', '中药库', '10g/袋', '袋', '1', '0.9500', '82.0000', '77.9000', '0', '0', '0', '2018/5/9 1:00:00', '1525864317', '1525863945', '', '地肤子', 'DFZ');
INSERT INTO `jd_drug` VALUES ('650', '1', '刺五加', '3229', '中药', '', 'ZZ-CWJ', '中药库', 'g', 'g', '1', '0.0400', '3219.0000', '128.7600', '0', '0', '0', '2018/5/9 1:00:00', '1525864317', '1525863946', '', '刺五加', 'CWJ');
INSERT INTO `jd_drug` VALUES ('651', '1', '炒芥子', '3224', '中药', '', 'ZZ-CJZ', '中药库', 'g', '克', '1', '0.0350', '2003.0000', '70.0950', '0', '0', '0', '2018/5/9 1:00:00', '1525864317', '1525863946', '', '炒芥子', 'CJZ');
INSERT INTO `jd_drug` VALUES ('652', '1', '白芷', '3235', '颗粒', '广东一方制药有限公司', 'ZZ-BZ1', '中药库', '6g/袋', '袋', '1', '1.0500', '74.0000', '77.7000', '0', '0', '0', '2018/5/9 1:00:00', '1525864317', '1525863946', '', '白芷', 'BZ');
INSERT INTO `jd_drug` VALUES ('653', '1', '海马', '3233', '贵细', '', 'ZZ-HM1', '中药库', 'g', 'g', '1', '15.0000', '286.0000', '4290.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864317', '1525863946', '', '海马', 'HM');
INSERT INTO `jd_drug` VALUES ('654', '1', '罗汉果', '3242', '贵细', '', 'ZZ-LHG', '中药库', '只', '只', '0', '3.0000', '35.0000', '105.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864317', '1525863946', '', '罗汉果', 'LHG');
INSERT INTO `jd_drug` VALUES ('655', '1', '冬凌草', '3243', '中药', '', 'ZZ-DLC', '中药库', '公斤', 'g', '0', '0.0413', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864318', '1525863946', '', '冬凌草', 'DLC');
INSERT INTO `jd_drug` VALUES ('656', '1', '蝉蜕', '3244', '颗粒', '广东一方制药有限公司', 'CTKL', '中药库', '6g/袋', '袋', '1', '6.0100', '84.0000', '504.8400', '0', '0', '0', '2018/5/9 1:00:00', '1525864318', '1525863946', '', '蝉蜕', 'CT');
INSERT INTO `jd_drug` VALUES ('657', '1', '牛蒡子', '3245', '颗粒', '广东一方制药有限公司', 'NBZKL', '中药库', '10g/袋', '袋', '1', '2.2800', '204.0000', '465.1200', '0', '0', '0', '2018/5/9 1:00:00', '1525864318', '1525863946', '', '牛蒡子', 'NBZ');
INSERT INTO `jd_drug` VALUES ('658', '1', '乳香', '3246', '颗粒', '广东一方制药有限公司', 'RXKL', '中药库', '6g/袋', '袋', '1', '1.4100', '36.0000', '50.7600', '0', '0', '0', '2018/5/9 1:00:00', '1525864318', '1525863947', '', '乳香', 'RX');
INSERT INTO `jd_drug` VALUES ('659', '1', '紫菀', '3247', '颗粒', '广东一方制药有限公司', 'ZWKL', '中药库', '10g/袋', '袋', '1', '1.2000', '23.0000', '27.6000', '0', '0', '0', '2018/5/9 1:00:00', '1525864318', '1525863947', '', '紫菀', 'ZW');
INSERT INTO `jd_drug` VALUES ('660', '1', '蒺藜', '3248', '颗粒', '广东一方制药有限公司', 'JLKL', '中药库', '10g/袋', '袋', '1', '0.9900', '72.0000', '71.2800', '0', '0', '0', '2018/5/9 1:00:00', '1525864318', '1525863947', '', '蒺藜', 'JL');
INSERT INTO `jd_drug` VALUES ('661', '1', '炒王不留行', '3249', '颗粒', '广东一方制药有限公司', 'CWBLXKL', '中药库', '10g/袋', '袋', '1', '1.3900', '100.0000', '139.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864318', '1525863947', '', '炒王不留行', 'CWBLX');
INSERT INTO `jd_drug` VALUES ('662', '1', '泽兰', '3250', '颗粒', '广东一方制药有限公司', 'ZLKL', '中药库', '10g/袋', '袋', '1', '0.7300', '135.0000', '98.5500', '0', '0', '0', '2018/5/9 1:00:00', '1525864318', '1525863947', '', '泽兰', 'ZL');
INSERT INTO `jd_drug` VALUES ('663', '1', '松花粉', '3260', '中药', '', 'ZZ-SHF', '中药库', 'g', 'g', '1', '0.1325', '1216.0000', '161.1100', '0', '0', '0', '2018/5/9 1:00:00', '1525864319', '1525863947', '', '松花粉', 'SHF');
INSERT INTO `jd_drug` VALUES ('664', '1', '青黛(靛花)', '3259', '中药', '', 'ZZ--QD', '中药库', 'g', 'g', '1', '0.1525', '584.0000', '89.0525', '0', '0', '0', '2018/5/9 1:00:00', '1525864319', '1525863947', '', '青黛', 'QD,DH');
INSERT INTO `jd_drug` VALUES ('665', '1', '白及', '3261', '颗粒', '广东一方制药有限公司', 'BJKL', '中药库', '10g/袋', '袋', '0', '7.5800', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864319', '1525863948', '', '白及', 'BJ');
INSERT INTO `jd_drug` VALUES ('666', '1', '六一散', '3268', '中药', '', 'ZZ-LYS', '中药库', 'g', 'g', '1', '0.0500', '786.0000', '39.3000', '0', '0', '0', '2018/5/9 1:00:00', '1525864319', '1525863948', '', '六一散', 'LYS');
INSERT INTO `jd_drug` VALUES ('667', '1', '白及', '3275', '颗粒', '江阴天江药业有限公司', 'BJF', '中药库', '3g/袋', '袋', '1', '7.5100', '1698.0000', '495.6600', '0', '0', '0', '2018/5/9 1:00:00', '1527930617', '1525863948', '', '白及', 'BJ');
INSERT INTO `jd_drug` VALUES ('668', '1', '石楠叶', '3276', '颗粒', '江阴天江药业有限公司', 'SNYKL', '中药库', '10克/袋', '袋', '1', '1.2100', '70.0000', '84.7000', '0', '0', '0', '2018/5/9 1:00:00', '1525864319', '1525863948', '', '石楠叶', 'SNY');
INSERT INTO `jd_drug` VALUES ('669', '1', '淡附片', '3278', '颗粒', '广东一方制药有限公司', 'DFPKL', '中药库', '6克/袋', '袋', '1', '1.3500', '158.0000', '213.3000', '0', '0', '0', '2018/5/9 1:00:00', '1525864319', '1525863948', '', '淡附片', 'DFP');
INSERT INTO `jd_drug` VALUES ('670', '1', '肉苁蓉', '3279', '颗粒', '广东一方制药有限公司', 'RCRKL', '中药库', '10克/袋', '袋', '1', '3.4200', '117.0000', '400.1400', '0', '0', '0', '2018/5/9 1:00:00', '1525864319', '1525863948', '', '肉苁蓉', 'RCR');
INSERT INTO `jd_drug` VALUES ('671', '1', '锁阳', '3280', '颗粒', '广东一方制药有限公司', 'SYKL', '中药库', '10克/袋', '袋', '1', '1.1800', '40.0000', '47.2000', '0', '0', '0', '2018/5/9 1:00:00', '1525864320', '1525863948', '', '锁阳', 'SY');
INSERT INTO `jd_drug` VALUES ('672', '1', '仙茅', '3281', '颗粒', '广东一方制药有限公司', 'XMKL', '中药库', '6克/袋', '袋', '1', '2.8600', '86.0000', '245.9600', '0', '0', '0', '2018/5/9 1:00:00', '1525864320', '1525863948', '', '仙茅', 'XM');
INSERT INTO `jd_drug` VALUES ('673', '1', '芥子', '3282', '颗粒', '广东一方制药有限公司', 'JZKL', '中药库', '10克/袋', '袋', '1', '0.8200', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864320', '1525863949', '', '芥子', 'JZ');
INSERT INTO `jd_drug` VALUES ('674', '1', '紫苏子', '3283', '颗粒', '广东一方制药有限公司', 'ZSZKL', '中药库', '10克/袋', '袋', '1', '1.0200', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864320', '1525863949', '', '紫苏子', 'ZSZ');
INSERT INTO `jd_drug` VALUES ('675', '1', '炒苍耳子', '3284', '颗粒', '广东一方制药有限公司', 'CCEZKL', '中药库', '9克/袋', '袋', '1', '0.7800', '182.0000', '141.9600', '0', '0', '0', '2018/5/9 1:00:00', '1525864320', '1525863949', '', '炒苍耳子', 'CCEZ');
INSERT INTO `jd_drug` VALUES ('676', '1', '白矾', '3286', '中药', '', 'ZZ-BFF', '中药库', 'g', 'g', '1', '0.0138', '2321.0000', '32.0308', '0', '0', '0', '2018/5/9 1:00:00', '1525864321', '1525863949', '', '白矾', 'BF');
INSERT INTO `jd_drug` VALUES ('677', '1', '檀香', '3285', '中药', '', 'ZZ-BTX', '中药库', 'g', 'g', '1', '2.2263', '6098.0000', '13576.1975', '0', '0', '0', '2018/5/9 1:00:00', '1525864321', '1525863949', '', '檀香', 'TX');
INSERT INTO `jd_drug` VALUES ('678', '1', '槟榔', '3287', '中药', '', 'ZZ-BLZ', '中药库', 'g', 'g', '1', '0.0625', '5965.0000', '372.5875', '0', '0', '0', '2018/5/9 1:00:00', '1525864321', '1525863949', '', '槟榔', 'BL');
INSERT INTO `jd_drug` VALUES ('679', '1', '寒水石', '3288', '中药', '', 'ZZ-HSS', '中药库', 'g', 'g', '1', '0.0150', '1160.0000', '17.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864321', '1525863949', '', '寒水石', 'HSS');
INSERT INTO `jd_drug` VALUES ('680', '1', '毛冬青', '3289', '中药', '', 'ZZ-MDQ', '中药库', 'g', 'g', '1', '0.0300', '2815.0000', '84.4500', '0', '0', '0', '2018/5/9 1:00:00', '1525864321', '1525863949', '', '毛冬青', 'MDQ');
INSERT INTO `jd_drug` VALUES ('681', '1', '天花粉', '3290', '颗粒', '广东一方制药有限公司', 'THFKL', '中药库', '10克/袋', '袋', '1', '0.9500', '86.0000', '81.7000', '0', '0', '0', '2018/5/9 1:00:00', '1525864321', '1525863950', '天花粉', '天花粉', 'THF');
INSERT INTO `jd_drug` VALUES ('682', '1', '川木通', '3291', '中药', '', 'ZZ-CMT', '中药库', 'g', 'g', '1', '0.0170', '1242.0000', '21.1140', '0', '0', '0', '2018/5/9 1:00:00', '1525864321', '1525863950', '', '川木通', 'CMT');
INSERT INTO `jd_drug` VALUES ('683', '1', '车前草', '3295', '颗粒', '广东一方制药有限公司', 'CQCKL', '中药库', '10克/袋', '袋', '1', '0.7200', '110.0000', '79.2000', '0', '0', '0', '2018/5/9 1:00:00', '1525864321', '1525863950', '', '车前草', 'CQC');
INSERT INTO `jd_drug` VALUES ('684', '1', '天葵子', '3296', '颗粒', '广东一方制药有限公司', 'TKZKL', '中药库', '15克/袋', '袋', '1', '3.5600', '683.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1527955961', '1525863950', '', '天葵子', 'TKZ');
INSERT INTO `jd_drug` VALUES ('685', '1', '东阿乌驴皮', '3301', '贵细', '山东东阿阿胶股份有限公司', 'ZZ-WLP', '中药库', '克', '克', '1', '7.1800', '39912.7000', '286573.1860', '0', '0', '0', '2018/5/9 1:00:00', '1525864322', '1525863950', '', '东阿乌驴皮', 'DAWLP');
INSERT INTO `jd_drug` VALUES ('686', '1', '红景天', '3302', '颗粒', '广东一方制药有限公司', 'HJTKL', '中药库', '6克/袋', '袋', '1', '2.0200', '281.0000', '567.6200', '0', '0', '0', '2018/5/9 1:00:00', '1525864322', '1525863950', '', '红景天', 'HJT');
INSERT INTO `jd_drug` VALUES ('687', '1', '制南五味子', '3309', '中药', '', 'ZZ-NWW', '中药库', 'g', 'g', '1', '0.0850', '13766.0000', '1170.0600', '0', '0', '0', '2018/5/9 1:00:00', '1525864322', '1525863950', '', '制南五味子', 'ZNWWZ');
INSERT INTO `jd_drug` VALUES ('688', '1', '芡实', '3310', '颗粒', '广东一方制药有限公司', 'QSKL', '中药库', '10克/袋', '袋', '1', '1.2600', '94.0000', '118.4400', '0', '0', '0', '2018/5/9 1:00:00', '1525864322', '1525863950', '', '芡实', 'QS');
INSERT INTO `jd_drug` VALUES ('689', '1', '佛手', '3312', '颗粒', '广东一方制药有限公司', 'FSKL', '中药库', '10克/袋', '袋', '1', '3.1500', '92.0000', '289.8000', '0', '0', '0', '2018/5/9 1:00:00', '1525864322', '1525863951', '', '佛手', 'FS');
INSERT INTO `jd_drug` VALUES ('690', '1', '甘松', '3313', '颗粒', '广东一方制药有限公司', 'GSKL', '中药库', '6克/袋', '袋', '1', '1.0700', '136.0000', '145.5200', '0', '0', '0', '2018/5/9 1:00:00', '1525864322', '1525863951', '', '甘松', 'GS');
INSERT INTO `jd_drug` VALUES ('691', '1', '炒莱菔子', '3314', '颗粒', '广东一方制药有限公司', 'CLFZKL', '中药库', '10克/袋', '袋', '1', '1.0400', '204.0000', '212.1600', '0', '0', '0', '2018/5/9 1:00:00', '1525864322', '1525863951', '', '炒莱菔子', 'CLFZ');
INSERT INTO `jd_drug` VALUES ('692', '1', '檀香', '3315', '颗粒', '广东一方制药有限公司', 'TXKL', '中药库', '3克/袋', '袋', '1', '5.5500', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864322', '1525863951', '', '檀香', 'TX');
INSERT INTO `jd_drug` VALUES ('693', '1', '焦山楂', '3316', '颗粒', '广东一方制药有限公司', 'JSZKL', '中药库', '10克/袋', '袋', '1', '1.3500', '204.0000', '275.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864323', '1525863951', '', '焦山楂', 'JSZ');
INSERT INTO `jd_drug` VALUES ('694', '1', '鲜石斛', '3322', '贵细', '', 'ZZ-XSH', '中药库', '克', '克', '1', '1.2000', '765.0000', '918.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864323', '1525863951', '', '鲜石斛', 'XSH');
INSERT INTO `jd_drug` VALUES ('695', '1', '炒莱菔子', '3326', '中药', '', 'ZZCLFZ', '中药库', '克', '克', '1', '0.0400', '4165.0000', '166.6000', '0', '0', '0', '2018/5/9 1:00:00', '1525864323', '1525863951', '', '炒莱菔子', 'CLFZ');
INSERT INTO `jd_drug` VALUES ('696', '1', '蜜麸炒青皮', '3327', '中药', '', 'ZZ-CQP', '中药库', '克', '克', '1', '0.0288', '9743.0000', '278.8188', '0', '0', '0', '2018/5/9 1:00:00', '1525864323', '1525863952', '', '蜜麸炒青皮', 'MFCQP');
INSERT INTO `jd_drug` VALUES ('697', '1', '炒紫苏子', '3328', '中药', '', 'ZZCZSZ', '中药库', '克', '克', '1', '0.0500', '2003.0000', '100.1500', '0', '0', '0', '2018/5/9 1:00:00', '1525864323', '1525863952', '', '炒紫苏子', 'CZSZ');
INSERT INTO `jd_drug` VALUES ('698', '1', '炒牡丹皮', '3329', '中药', '', 'ZZCMDP', '中药库', '克', '克', '1', '0.0750', '3872.0000', '290.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864323', '1525863952', '', '炒牡丹皮', 'CMDP');
INSERT INTO `jd_drug` VALUES ('699', '1', '积雪草（落得打）', '3335', '中药', '', 'ZZ-JXC', '中药库', '克', '克', '1', '0.0475', '1868.0000', '88.7300', '0', '0', '0', '2018/5/9 1:00:00', '1525864323', '1525863952', '', '', 'JXC,LDD');
INSERT INTO `jd_drug` VALUES ('700', '1', '炒蔓荆子', '3336', '中药', '', 'ZZCMJZ', '中药库', '克', '克', '1', '0.3113', '1120.0000', '348.5325', '0', '0', '0', '2018/5/9 1:00:00', '1525864323', '1525863952', '', '炒蔓荆子', 'CWJZ');
INSERT INTO `jd_drug` VALUES ('701', '1', '天浆壳', '3337', '中药', '', 'ZZ-TJK', '中药库', '克', '克', '1', '0.0550', '1954.0000', '107.4700', '0', '0', '0', '2018/5/9 1:00:00', '1525864324', '1525863952', '', '天浆壳', 'TJK');
INSERT INTO `jd_drug` VALUES ('702', '1', '人工天竺黄', '3338', '中药', '', 'ZZ-TZH', '中药库', '克', '克', '0', '0.0480', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864324', '1525863952', '', '人工天竺黄', 'RGTZH');
INSERT INTO `jd_drug` VALUES ('703', '1', '炒车前子', '3339', '中药', '', 'ZZCCQZ', '中药库', '克', '克', '1', '0.0750', '10219.0000', '766.3900', '0', '0', '0', '2018/5/9 1:00:00', '1525864324', '1525863952', '', '炒车前子', 'CCQZ');
INSERT INTO `jd_drug` VALUES ('704', '1', '炒牛蒡子', '3341', '中药', '', 'ZZCNBZ', '中药库', '克', '克', '1', '0.0800', '4474.0000', '357.9200', '0', '0', '0', '2018/5/9 1:00:00', '1525864324', '1525863953', '', '炒牛蒡子', 'CNBZ');
INSERT INTO `jd_drug` VALUES ('705', '1', '蛇莓(蛇果草)', '3266', '中药', '', 'ZZ-SMC', '中药库', '克', '克', '1', '0.0275', '3115.0000', '85.6425', '0', '0', '0', '2018/5/9 1:00:00', '1525864324', '1525863953', '', '蛇莓', 'SM,SGC');
INSERT INTO `jd_drug` VALUES ('706', '1', '地锦草', '3347', '中药', '', 'ZZ-DJC', '中药库', '克', '克', '1', '0.0370', '528.0000', '19.5400', '0', '0', '0', '2018/5/9 1:00:00', '1525864324', '1525863953', '', '地锦草', 'DJC');
INSERT INTO `jd_drug` VALUES ('707', '1', '南方红豆杉', '3348', '中药', '', 'ZZ-HDS', '中药库', '克', '克', '1', '2.4600', '819.0000', '2014.7400', '0', '0', '0', '2018/5/9 1:00:00', '1525864324', '1525863953', '', '南方红豆杉', 'NFHDS');
INSERT INTO `jd_drug` VALUES ('708', '1', '制狗脊', '3349', '中药', '', 'ZZ-ZGJ', '中药库', '克', '克', '1', '0.0400', '2862.0000', '114.4800', '0', '0', '0', '2018/5/9 1:00:00', '1525864324', '1525863953', '', '制狗脊', 'ZGJ');
INSERT INTO `jd_drug` VALUES ('709', '1', '皂荚', '3354', '中药', '', 'ZZ--ZJ', '中药库', '克', '克', '1', '0.0190', '1557.0000', '29.5830', '0', '0', '0', '2018/5/9 1:00:00', '1525864325', '1525863953', '', '皂荚', 'ZJ');
INSERT INTO `jd_drug` VALUES ('710', '1', '制甘遂', '3355', '中药', '', 'ZZ-ZGS', '中药库', '克', '克', '1', '0.4700', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864325', '1525863953', '甘遂', '制甘遂', 'ZGS');
INSERT INTO `jd_drug` VALUES ('711', '1', '蛇六谷', '3356', '颗粒', '广东一方制药有限公司', 'SLGKL', '中药库', '15克/袋', '袋', '1', '1.9200', '72.0000', '138.2400', '0', '0', '0', '2018/5/9 1:00:00', '1525864325', '1525863954', '', '蛇六谷', 'SLG');
INSERT INTO `jd_drug` VALUES ('712', '1', '石燕', '3358', '中药', '', 'ZZ--SY', '中药库', '克', '克', '1', '0.0620', '4950.0000', '306.9000', '0', '0', '0', '2018/5/9 1:00:00', '1525864325', '1525863954', '', '石燕', 'SY');
INSERT INTO `jd_drug` VALUES ('713', '1', '蜂房', '3359', '中药', '', 'ZZ--FF', '中药库', '克', '克', '1', '0.8650', '2077.0000', '1796.6050', '0', '0', '0', '2018/5/9 1:00:00', '1525864325', '1525863954', '', '蜂房', 'FF');
INSERT INTO `jd_drug` VALUES ('714', '1', '五谷虫', '3361', '中药', '', 'ZZ-WGC', '中药库', '克', '克', '1', '0.1280', '8702.0000', '1113.8500', '0', '0', '0', '2018/5/9 1:00:00', '1525864325', '1525863954', '', '五谷虫', 'WGC');
INSERT INTO `jd_drug` VALUES ('715', '1', '管花肉苁蓉', '3362', '中药', '', 'ZZGHCR', '中药库', '克', '克', '1', '0.1325', '1912.0000', '253.2525', '0', '0', '0', '2018/5/9 1:00:00', '1525864325', '1525863954', '', '管花肉苁蓉', 'GHRCR');
INSERT INTO `jd_drug` VALUES ('716', '1', '禹州漏芦', '3363', '中药', '', 'ZZYZLL', '中药库', '克', '克', '0', '0.1050', '303.0000', '31.8150', '0', '0', '0', '2018/5/9 1:00:00', '1525864326', '1525863954', '', '禹州漏芦', 'YZLL');
INSERT INTO `jd_drug` VALUES ('717', '1', '炒刺猬皮', '3364', '中药', '', 'ZZCCWP', '中药库', '克', '克', '1', '0.5625', '1036.0000', '582.7400', '0', '0', '0', '2018/5/9 1:00:00', '1525864326', '1525863954', '', '炒刺猬皮', 'CCWP');
INSERT INTO `jd_drug` VALUES ('718', '1', '鱼腥草', '3376', '颗粒', '广东一方制药有限公司', 'YXCKL', '中药库', '15克/袋', '袋', '1', '1.5500', '151.0000', '234.0500', '0', '0', '0', '2018/5/9 1:00:00', '1525864326', '1525863955', '', '鱼腥草', 'YXC');
INSERT INTO `jd_drug` VALUES ('719', '1', '丹参', '3380', '颗粒', '广东一方制药有限公司', 'DSKL', '中药库', '10克/袋', '袋', '1', '2.0000', '231.0000', '462.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864326', '1525863955', '丹参', '丹参', 'DC');
INSERT INTO `jd_drug` VALUES ('720', '1', '葫芦壳', '3381', '中药', '', 'ZZ-HLK', '中药库', '克', '克', '1', '0.0300', '2880.0000', '86.4000', '0', '0', '0', '2018/5/9 1:00:00', '1525864326', '1525863955', '', '葫芦壳', 'HLK');
INSERT INTO `jd_drug` VALUES ('721', '1', '莲房炭', '3384', '中药', '', 'ZZ-LFT', '中药库', '克', '克', '1', '0.0200', '2419.0000', '48.3800', '0', '0', '0', '2018/5/9 1:00:00', '1525864326', '1525863955', '', '莲房炭', 'LFT');
INSERT INTO `jd_drug` VALUES ('722', '1', '通天草', '3386', '中药', '', 'ZZ-TTC', '中药库', '克', '克', '1', '0.0350', '1000.0000', '35.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864327', '1525863955', '', '通天草', 'TTC');
INSERT INTO `jd_drug` VALUES ('723', '1', '血竭', '3387', '中药', '', 'ZZ--XJ', '中药库', '克', '克', '1', '4.2000', '0.0000', '0.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864327', '1525863955', '', '血竭', 'XJ');
INSERT INTO `jd_drug` VALUES ('724', '1', '地枯蒌', '3388', '中药', '', 'ZZ-DKL', '中药库', '克', '克', '1', '0.0863', '3599.0000', '310.3038', '0', '0', '0', '2018/5/9 1:00:00', '1525864327', '1525863955', '', '地枯蒌', 'DKL');
INSERT INTO `jd_drug` VALUES ('725', '1', '茯苓皮', '3389', '中药', '', 'ZZ-FLP', '中药库', '克', '克', '1', '0.0190', '3516.0000', '66.8140', '0', '0', '0', '2018/5/9 1:00:00', '1525864327', '1525863955', '', '茯苓皮', 'FLP');
INSERT INTO `jd_drug` VALUES ('726', '1', '川贝母', '3392', '颗粒', '广东一方制药有限公司', 'CBMKL', '中药库', '1克/袋', '袋', '1', '15.3400', '919.0000', '14097.4600', '0', '0', '0', '2018/5/9 1:00:00', '1525864327', '1525863956', '川贝母', '川贝母', 'CBM');
INSERT INTO `jd_drug` VALUES ('727', '1', '马鞭草', '3393', '颗粒', '广东一方制药有限公司', 'MBCKL', '中药库', '10克/袋', '袋', '1', '1.0700', '200.0000', '214.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864328', '1525863956', '', '马鞭草', 'MBC');
INSERT INTO `jd_drug` VALUES ('728', '1', '石膏', '3397', '颗粒', '广东一方制药有限公司', 'SGKL', '中药库', '15克/袋', '袋', '1', '1.1300', '260.0000', '293.8000', '0', '0', '0', '2018/5/9 1:00:00', '1525864328', '1525863956', '', '石膏', 'SG');
INSERT INTO `jd_drug` VALUES ('729', '1', '连翘心', '3398', '中药', '', 'ZZ-LQX', '中药库', '克', '克', '1', '0.0420', '500.0000', '21.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864328', '1525863956', '', '连翘心', 'LQX');
INSERT INTO `jd_drug` VALUES ('730', '1', '鸡矢藤', '3400', '中药', '', 'ZZ-JST', '中药库', '克', '克', '1', '0.0250', '1000.0000', '25.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864328', '1525863956', '', '鸡矢藤', 'JST');
INSERT INTO `jd_drug` VALUES ('731', '1', '醋延胡索', '3402', '中药', '', 'ZZ-YHS', '中药库', '克', '克', '1', '0.1625', '10577.0000', '1718.7100', '0', '0', '0', '2018/5/9 1:00:00', '1525864328', '1525863956', '', '醋延胡索', 'CYHS');
INSERT INTO `jd_drug` VALUES ('732', '1', '盐补骨脂', '3403', '中药', '', 'ZZ-BGZ', '中药库', '克', '克', '1', '0.0490', '2098.0000', '102.6100', '0', '0', '0', '2018/5/9 1:00:00', '1525864328', '1525863956', '', '盐补骨脂', 'YBGZ');
INSERT INTO `jd_drug` VALUES ('733', '1', '飞琥珀（一号粉）', '3405', '中药', '', 'ZZ-FHP', '中药库', '克', '克', '1', '0.2800', '500.0000', '140.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864328', '1525863957', '', '', 'FHP,YHF');
INSERT INTO `jd_drug` VALUES ('734', '1', '砂仁(阳春砂)', '3411', '中药', '', 'ZZ-YCS', '中药库', '克', '克', '1', '1.4250', '12052.0000', '17174.0100', '0', '0', '0', '2018/5/9 1:00:00', '1525864328', '1525863957', '', '砂仁', 'SR,YCS');
INSERT INTO `jd_drug` VALUES ('735', '1', '当归', '3412', '颗粒', '深圳华润三九医药贸易有限公司', 'DGKL', '中药库', '10克/袋', '袋', '0', '2.6100', '400.0000', '1044.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864329', '1525863957', '', '当归', 'DG');
INSERT INTO `jd_drug` VALUES ('736', '1', '地黄', '3413', '颗粒', ' 深圳华润三九医药贸易有限公司', 'DHKL', '中药库', '5克/袋', '袋', '0', '0.8500', '200.0000', '170.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864329', '1525863957', '', '地黄', 'DH');
INSERT INTO `jd_drug` VALUES ('737', '1', '白术', '3414', '颗粒', '深圳华润三九医药贸易有限公司', 'BZKL', '中药库', '6克/袋', '袋', '0', '1.4300', '400.0000', '572.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864329', '1525863957', '', '白术', 'BS');
INSERT INTO `jd_drug` VALUES ('738', '1', '白芍', '3415', '颗粒', '深圳华润三九医药贸易有限公司', 'BSKL', '中药库', '10克/袋', '袋', '0', '2.4600', '200.0000', '492.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864329', '1525863957', '白芍', '白芍', 'BS');
INSERT INTO `jd_drug` VALUES ('739', '1', '蒲公英', '3417', '颗粒', '深圳华润三九医药贸易有限公司', 'PGYKL', '中药库', '15克/袋', '袋', '0', '1.8200', '200.0000', '364.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864329', '1525863957', '', '蒲公英', 'PGY');
INSERT INTO `jd_drug` VALUES ('740', '1', '阿胶', '3418', '颗粒', '深圳华润三九医药贸易有限公司', 'AJKL', '中药库', '2克/袋', '袋', '1', '7.3500', '3368.0000', '24754.8000', '0', '0', '0', '2018/5/9 1:00:00', '1525864330', '1525863957', '', '阿胶', 'AJ');
INSERT INTO `jd_drug` VALUES ('741', '1', '川芎', '3416', '颗粒', '深圳华润三九医药贸易有限公司', 'CXKL', '中药库', '6克/袋', '袋', '0', '1.7500', '400.0000', '700.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864330', '1525863958', '', '川芎', 'CX');
INSERT INTO `jd_drug` VALUES ('742', '1', '醋鳖甲', '3419', '颗粒', '深圳华润三九医药贸易有限公司', 'CBJKL', '中药库', '10克/袋', '袋', '0', '9.9500', '600.0000', '5970.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864330', '1525863958', '', '醋鳖甲', 'CBJ');
INSERT INTO `jd_drug` VALUES ('743', '1', '狗脊', '3420', '颗粒', '深圳华润三九医药贸易有限公司', 'GJKL', '中药库', '10克/袋', '袋', '0', '0.8100', '200.0000', '162.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864330', '1525863958', '', '狗脊', 'GJ');
INSERT INTO `jd_drug` VALUES ('744', '1', '重楼', '3421', '颗粒', '深圳华润三九医药贸易有限公司', 'CLKL', '中药库', '5克/袋', '袋', '0', '14.8000', '200.0000', '2960.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864330', '1525863958', '', '重楼', 'ZL');
INSERT INTO `jd_drug` VALUES ('745', '1', '沙苑子', '3422', '颗粒', '深圳华润三九医药贸易有限公司', 'SYZKL', '中药库', '10克/袋', '袋', '0', '1.2500', '200.0000', '250.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864330', '1525863958', '', '沙苑子', 'SYZ');
INSERT INTO `jd_drug` VALUES ('746', '1', '茯苓', '3423', '颗粒', '深圳华润三九医药贸易有限公司', 'FLKL', '中药库', '10克/袋', '袋', '0', '1.8400', '200.0000', '368.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864330', '1525863958', '', '茯苓', 'FL');
INSERT INTO `jd_drug` VALUES ('747', '1', '熟地黄', '3424', '颗粒', '深圳华润三九医药贸易有限公司', 'SDHKL', '中药库', '10克/袋', '袋', '0', '1.6500', '200.0000', '330.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864330', '1525863958', '', '熟地黄', 'SDH');
INSERT INTO `jd_drug` VALUES ('748', '1', '黄连', '3425', '颗粒', '深圳华润三九医药贸易有限公司', 'HLKL', '中药库', '3克/袋', '袋', '0', '2.0400', '200.0000', '408.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864330', '1525863959', '', '黄连', 'HL');
INSERT INTO `jd_drug` VALUES ('749', '1', '郁金', '3426', '颗粒', '深圳华润三九医药贸易有限公司', 'YJKL', '中药库', '10克/袋', '袋', '0', '1.9800', '200.0000', '396.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864331', '1525863959', '郁金', '郁金', 'YJ');
INSERT INTO `jd_drug` VALUES ('750', '1', '地龙', '3427', '颗粒', '深圳华润三九医药贸易有限公司', 'DLKL', '中药库', '10克/袋', '袋', '0', '5.5100', '200.0000', '1102.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864331', '1525863959', '', '地龙', 'DL');
INSERT INTO `jd_drug` VALUES ('751', '1', '僵蚕', '3428', '颗粒', '深圳华润三九医药贸易有限公司', 'JCKL', '中药库', '10克/袋', '袋', '0', '5.1700', '200.0000', '1034.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864331', '1525863959', '', '僵蚕', 'JC');
INSERT INTO `jd_drug` VALUES ('752', '1', '威灵仙', '3429', '颗粒', '深圳华润三九医药贸易有限公司', 'WLXKL', '中药库', '10克/袋', '袋', '0', '1.1900', '200.0000', '238.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864331', '1525863960', '', '威灵仙', 'WLX');
INSERT INTO `jd_drug` VALUES ('753', '1', '醋龟甲', '3430', '颗粒', '深圳华润三九医药贸易有限公司', 'CGJKL', '中药库', '10克/袋', '袋', '0', '12.0600', '400.0000', '4824.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864331', '1525863960', '', '醋龟甲', 'CGJ');
INSERT INTO `jd_drug` VALUES ('754', '1', '小茴香', '3431', '颗粒', '深圳华润三九医药贸易有限公司', 'XHXKL', '中药库', '6克/袋', '袋', '0', '0.9900', '200.0000', '198.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864331', '1525863960', '', '小茴香', 'XHX');
INSERT INTO `jd_drug` VALUES ('755', '1', '蜂房', '3432', '颗粒', '深圳华润三九医药贸易有限公司', 'FFKL', '中药库', '5克/袋', '袋', '0', '8.1900', '200.0000', '1638.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864331', '1525863960', '', '蜂房', 'FF');
INSERT INTO `jd_drug` VALUES ('756', '1', '石见穿', '3433', '颗粒', '深圳华润三九医药贸易有限公司', 'SJCKL', '中药库', '15克/袋', '袋', '0', '1.3300', '200.0000', '266.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864332', '1525863960', '', '石见穿', 'SJC');
INSERT INTO `jd_drug` VALUES ('757', '1', '党参', '3434', '颗粒', '深圳华润三九医药贸易有限公司', 'DSKLJ', '中药库', '10克/袋', '袋', '0', '2.4100', '200.0000', '482.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864332', '1525863960', '党参', '党参', 'DC');
INSERT INTO `jd_drug` VALUES ('758', '1', '粉萆薢', '3436', '颗粒', '深圳华润三九医药贸易有限公司', 'FBXKL', '中药库', '10克/袋', '袋', '0', '0.8000', '200.0000', '160.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864332', '1525863960', '', '粉萆薢', 'FBX');
INSERT INTO `jd_drug` VALUES ('759', '1', '大血藤', '3437', '颗粒', '深圳华润三九医药贸易有限公司', 'DXTKL', '中药库', '15克/袋', '袋', '0', '0.6500', '200.0000', '130.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864332', '1525863960', '', '大血藤', 'DXT');
INSERT INTO `jd_drug` VALUES ('760', '1', '鹿角', '3438', '颗粒', '深圳华润三九医药贸易有限公司', 'LJKL', '中药库', '6克/袋', '袋', '0', '6.5200', '400.0000', '2608.0000', '0', '0', '0', '2018/5/9 1:00:00', '1525864332', '1525863961', '', '鹿角', 'LJ');

-- ----------------------------
-- Table structure for jd_drug_info
-- ----------------------------
DROP TABLE IF EXISTS `jd_drug_info`;
CREATE TABLE `jd_drug_info` (
  `info_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `info_sn` varchar(255) NOT NULL DEFAULT '' COMMENT '药方编号',
  `member_id` int(8) NOT NULL DEFAULT '0' COMMENT '医生id',
  `patient_name` varchar(255) NOT NULL DEFAULT '' COMMENT '患者姓名',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0男 1女',
  `age` int(3) NOT NULL DEFAULT '0' COMMENT '患者年龄',
  `disease` varchar(355) NOT NULL DEFAULT '' COMMENT '辩证/辨病',
  `relation_id` int(8) NOT NULL DEFAULT '0' COMMENT '药房药态关联表id',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '药方药价 (程序计算, 非填写)',
  `content` text NOT NULL COMMENT '药方组成 (药材和剂量的json字符串)',
  `drug_sum` int(4) NOT NULL DEFAULT '0' COMMENT '总剂量',
  `daily_num` int(4) NOT NULL DEFAULT '0' COMMENT '每日剂量',
  `average` int(3) NOT NULL DEFAULT '0' COMMENT '每剂药分几次服用',
  `service_price` decimal(8,2) DEFAULT '0.00' COMMENT '治疗服务费(选填)',
  `fee` decimal(8,2) DEFAULT '0.00' COMMENT '诊金 (选填)',
  `can_see` tinyint(1) DEFAULT '0' COMMENT '购药前是否可查看药方 0不可看 1可看',
  `taboo_str` varchar(255) DEFAULT '' COMMENT '用药禁忌 禁忌id以半角逗号拼接',
  `tips` varchar(355) DEFAULT '' COMMENT '补充说明',
  `is_keep` tinyint(1) DEFAULT '0' COMMENT '0不保存为模板 1存为模板',
  `is_agent` tinyint(1) DEFAULT '0' COMMENT '0不让患者选择代煎  1可以让患者选择代煎',
  `prescription_id` int(8) NOT NULL DEFAULT '0' COMMENT '审方的药方id',
  `is_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未审方 1审方通过 2审方不通过',
  `data` varchar(355) NOT NULL DEFAULT '' COMMENT '药方审方时的备注',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '药方提交时间',
  `aid` int(8) NOT NULL DEFAULT '0' COMMENT '审方管理员id',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生开方记录表';

-- ----------------------------
-- Records of jd_drug_info
-- ----------------------------

-- ----------------------------
-- Table structure for jd_drug_method
-- ----------------------------
DROP TABLE IF EXISTS `jd_drug_method`;
CREATE TABLE `jd_drug_method` (
  `method_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `method_name` varchar(255) NOT NULL DEFAULT '' COMMENT '方法名',
  `sort` int(5) NOT NULL DEFAULT '0' COMMENT '权重 倒序',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0不显示 1显示',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `aid` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员最后一次操作时间',
  PRIMARY KEY (`method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用药方法表';

-- ----------------------------
-- Records of jd_drug_method
-- ----------------------------
INSERT INTO `jd_drug_method` VALUES ('1', '先煎', '1', '1', '787872673', '0', '0');
INSERT INTO `jd_drug_method` VALUES ('2', '包煎', '2', '1', '888888', '0', '0');
INSERT INTO `jd_drug_method` VALUES ('3', '冲服', '3', '1', '999999', '0', '0');

-- ----------------------------
-- Table structure for jd_drug_record
-- ----------------------------
DROP TABLE IF EXISTS `jd_drug_record`;
CREATE TABLE `jd_drug_record` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `key` int(8) NOT NULL DEFAULT '0' COMMENT '属于什么分类',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) DEFAULT '0' COMMENT '状态 0 性冷 1 性热',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='完整配伍禁忌表';

-- ----------------------------
-- Records of jd_drug_record
-- ----------------------------
INSERT INTO `jd_drug_record` VALUES ('1', '1', '甘草', '1');
INSERT INTO `jd_drug_record` VALUES ('2', '1', '海藻', '0');
INSERT INTO `jd_drug_record` VALUES ('3', '1', '红大戟', '0');
INSERT INTO `jd_drug_record` VALUES ('4', '1', '甘遂', '0');
INSERT INTO `jd_drug_record` VALUES ('5', '1', '芫花', '0');
INSERT INTO `jd_drug_record` VALUES ('6', '2', '川乌', '1');
INSERT INTO `jd_drug_record` VALUES ('7', '2', '草乌', '1');
INSERT INTO `jd_drug_record` VALUES ('8', '2', '附子', '1');
INSERT INTO `jd_drug_record` VALUES ('9', '2', '半夏', '0');
INSERT INTO `jd_drug_record` VALUES ('10', '2', '瓜蒌皮', '0');
INSERT INTO `jd_drug_record` VALUES ('11', '2', '瓜蒌仁', '0');
INSERT INTO `jd_drug_record` VALUES ('12', '2', '天花粉', '0');
INSERT INTO `jd_drug_record` VALUES ('13', '2', '川贝母', '0');
INSERT INTO `jd_drug_record` VALUES ('14', '2', '浙贝母', '0');
INSERT INTO `jd_drug_record` VALUES ('15', '2', '白蔹', '0');
INSERT INTO `jd_drug_record` VALUES ('16', '2', '白芨', '0');
INSERT INTO `jd_drug_record` VALUES ('17', '3', '藜芦', '1');
INSERT INTO `jd_drug_record` VALUES ('18', '3', '人参', '0');
INSERT INTO `jd_drug_record` VALUES ('19', '3', '党参', '0');
INSERT INTO `jd_drug_record` VALUES ('20', '3', '丹参', '0');
INSERT INTO `jd_drug_record` VALUES ('21', '3', '南沙参', '0');
INSERT INTO `jd_drug_record` VALUES ('22', '3', '北沙参', '0');
INSERT INTO `jd_drug_record` VALUES ('23', '3', '苦参', '0');
INSERT INTO `jd_drug_record` VALUES ('24', '3', '玄参', '0');
INSERT INTO `jd_drug_record` VALUES ('25', '3', '细辛', '0');
INSERT INTO `jd_drug_record` VALUES ('26', '3', '白芍', '0');
INSERT INTO `jd_drug_record` VALUES ('27', '3', '赤芍', '0');
INSERT INTO `jd_drug_record` VALUES ('28', '4', '硫磺', '1');
INSERT INTO `jd_drug_record` VALUES ('29', '4', '芒硝', '0');
INSERT INTO `jd_drug_record` VALUES ('30', '4', '玄明粉', '0');
INSERT INTO `jd_drug_record` VALUES ('31', '5', '水银', '1');
INSERT INTO `jd_drug_record` VALUES ('32', '5', '砒霜', '0');
INSERT INTO `jd_drug_record` VALUES ('33', '6', '狼毒', '1');
INSERT INTO `jd_drug_record` VALUES ('34', '6', '密陀僧', '0');
INSERT INTO `jd_drug_record` VALUES ('35', '7', '巴豆', '1');
INSERT INTO `jd_drug_record` VALUES ('36', '7', '牵牛子', '0');
INSERT INTO `jd_drug_record` VALUES ('37', '8', '丁香', '1');
INSERT INTO `jd_drug_record` VALUES ('38', '8', '郁金', '0');
INSERT INTO `jd_drug_record` VALUES ('39', '9', '犀角', '1');
INSERT INTO `jd_drug_record` VALUES ('40', '9', '川乌', '0');
INSERT INTO `jd_drug_record` VALUES ('41', '9', '草乌', '0');
INSERT INTO `jd_drug_record` VALUES ('42', '9', '附子', '0');
INSERT INTO `jd_drug_record` VALUES ('43', '10', '人参', '1');
INSERT INTO `jd_drug_record` VALUES ('44', '10', '五灵脂', '0');
INSERT INTO `jd_drug_record` VALUES ('45', '11', '芒硝', '1');
INSERT INTO `jd_drug_record` VALUES ('46', '11', '三棱', '0');
INSERT INTO `jd_drug_record` VALUES ('47', '12', '赤石脂', '1');
INSERT INTO `jd_drug_record` VALUES ('48', '11', '桂枝', '0');
INSERT INTO `jd_drug_record` VALUES ('49', '12', '桂肉', '0');

-- ----------------------------
-- Table structure for jd_drug_record_type
-- ----------------------------
DROP TABLE IF EXISTS `jd_drug_record_type`;
CREATE TABLE `jd_drug_record_type` (
  `key` int(8) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type_name` varchar(255) NOT NULL,
  `add_date` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='流派表';

-- ----------------------------
-- Records of jd_drug_record_type
-- ----------------------------
INSERT INTO `jd_drug_record_type` VALUES ('1', '1', '32532525');
INSERT INTO `jd_drug_record_type` VALUES ('2', '2', '32532525');
INSERT INTO `jd_drug_record_type` VALUES ('3', '3', '32532525');
INSERT INTO `jd_drug_record_type` VALUES ('4', '火火流派', '32532525');
INSERT INTO `jd_drug_record_type` VALUES ('5', '禁忌分类名称5', '1527599489');
INSERT INTO `jd_drug_record_type` VALUES ('6', '禁忌分类名称6', '1527599497');
INSERT INTO `jd_drug_record_type` VALUES ('7', '禁忌分类名称7', '1527599497');
INSERT INTO `jd_drug_record_type` VALUES ('8', '禁忌分类名称8', '1527599497');
INSERT INTO `jd_drug_record_type` VALUES ('9', '禁忌分类名称9', '1527599497');
INSERT INTO `jd_drug_record_type` VALUES ('10', '禁忌分类名称10', '1527599497');
INSERT INTO `jd_drug_record_type` VALUES ('11', '禁忌分类名称11', '1527599497');
INSERT INTO `jd_drug_record_type` VALUES ('12', '禁忌分类名称12', '1527599497');

-- ----------------------------
-- Table structure for jd_drug_relation
-- ----------------------------
DROP TABLE IF EXISTS `jd_drug_relation`;
CREATE TABLE `jd_drug_relation` (
  `relation_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `prescription_id` int(8) NOT NULL DEFAULT '0' COMMENT '药房id',
  `state_id` int(8) NOT NULL DEFAULT '0' COMMENT '药态id',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '简短描述',
  `sort` int(5) NOT NULL DEFAULT '0' COMMENT '权重 倒序',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0不显示 1显示',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `aid` int(8) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='药房药态关联表';

-- ----------------------------
-- Records of jd_drug_relation
-- ----------------------------
INSERT INTO `jd_drug_relation` VALUES ('33', '2', '7', '全国免费包邮', '7', '1', '1524646951', '1', '1524646951');
INSERT INTO `jd_drug_relation` VALUES ('49', '1', '2', '江浙沪当日达', '0', '1', '1527651781', '1', '1527818653');
INSERT INTO `jd_drug_relation` VALUES ('50', '1', '3', '江浙沪当日达', '0', '1', '1527651781', '1', '1527818653');
INSERT INTO `jd_drug_relation` VALUES ('51', '1', '5', '江浙沪当日达', '0', '1', '1527651781', '1', '1527818653');
INSERT INTO `jd_drug_relation` VALUES ('52', '1', '6', '江浙沪当日达', '0', '1', '1527651781', '1', '1527818653');
INSERT INTO `jd_drug_relation` VALUES ('53', '1', '7', '江浙沪当日达', '0', '1', '1527651781', '1', '1527818653');
INSERT INTO `jd_drug_relation` VALUES ('54', '1', '8', '江浙沪当日达', '0', '1', '1527652770', '0', '1527818653');
INSERT INTO `jd_drug_relation` VALUES ('55', '4', '2', '', '0', '0', '1527653538', '0', '1527819520');
INSERT INTO `jd_drug_relation` VALUES ('56', '4', '3', '', '0', '0', '1527653538', '0', '1527819520');
INSERT INTO `jd_drug_relation` VALUES ('57', '4', '5', '', '0', '0', '1527653538', '0', '1527819521');
INSERT INTO `jd_drug_relation` VALUES ('58', '4', '6', '', '0', '0', '1527653538', '0', '1527819521');
INSERT INTO `jd_drug_relation` VALUES ('59', '4', '7', '', '0', '1', '1527653538', '0', '1527819521');
INSERT INTO `jd_drug_relation` VALUES ('60', '4', '8', '', '0', '0', '1527653538', '0', '1527819521');
INSERT INTO `jd_drug_relation` VALUES ('61', '5', '2', '', '0', '0', '1527653608', '0', '1527819532');
INSERT INTO `jd_drug_relation` VALUES ('62', '5', '3', '', '0', '0', '1527653608', '0', '1527819532');
INSERT INTO `jd_drug_relation` VALUES ('63', '5', '5', '', '0', '0', '1527653608', '0', '1527819532');
INSERT INTO `jd_drug_relation` VALUES ('64', '5', '6', '', '0', '0', '1527653608', '0', '1527819532');
INSERT INTO `jd_drug_relation` VALUES ('65', '5', '7', 'ccc', '0', '1', '1527653608', '0', '1527819533');
INSERT INTO `jd_drug_relation` VALUES ('66', '5', '8', '', '0', '0', '1527653608', '0', '1527819533');

-- ----------------------------
-- Table structure for jd_drug_state
-- ----------------------------
DROP TABLE IF EXISTS `jd_drug_state`;
CREATE TABLE `jd_drug_state` (
  `state_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `state_name` varchar(255) NOT NULL DEFAULT '' COMMENT '药态名称',
  `pic` varchar(355) NOT NULL DEFAULT '' COMMENT '药态列表图',
  `make` varchar(355) NOT NULL DEFAULT '' COMMENT '制作规范 ##之间的文字标红',
  `weight` varchar(255) NOT NULL DEFAULT '' COMMENT '预计重量 ##之间的文字标红',
  `taking` varchar(255) NOT NULL DEFAULT '' COMMENT '服用方法  ##之间的文字标红',
  `instructions` varchar(255) NOT NULL DEFAULT '' COMMENT '用药说明(该字段为输入框)',
  `sort` int(5) NOT NULL DEFAULT '0' COMMENT '权重',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `aid` int(8) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用 0不使用 1使用',
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='药态表';

-- ----------------------------
-- Records of jd_drug_state
-- ----------------------------
INSERT INTO `jd_drug_state` VALUES ('2', '膏方', '/uploads/code/1525687373code.png', '', '', '', '', '2', '1524537691', '1', '1524552617', '1');
INSERT INTO `jd_drug_state` VALUES ('3', '蜜丸', '/uploads/code/1525687373code.png', '', '', '', '', '3', '1524537833', '1', '1524552611', '1');
INSERT INTO `jd_drug_state` VALUES ('4', '水丸', '/uploads/code/1525687373code.png', '*水丸需整体制作，请按照总量选#克数#，#1000g#起做', '#0-0ｇ#，(制丸会减少药材总重10%-30%)', '共#7#剂，每日#1#剂，1剂分#1#次使用	', '煎服', '4', '1524538673', '1', '1525314596', '0');
INSERT INTO `jd_drug_state` VALUES ('5', '粉剂', '/uploads/code/1525687373code.png', '*水丸需整体制作，请按照总量选#克数#，#1000g#起做	', '#0-0ｇ#，(制丸会减少药材总重10%-30%)', '共#7#剂，每日#1#剂，1剂分#1#次使用', '煎服', '5', '1525314609', '1', '1525314735', '1');
INSERT INTO `jd_drug_state` VALUES ('6', '中成药', '/uploads/code/1525687373code.png', '*水丸需整体制作，请按照总量选#克数#，#1000g#起做	', '#0-0ｇ#，(制丸会减少药材总重10%-30%)', '共#7#剂，每日#1#剂，1剂分#1#次使用', '煎服', '6', '1525314609', '1', '1525314735', '1');
INSERT INTO `jd_drug_state` VALUES ('7', '外用中药', '/uploads/code/1525687373code.png', '*水丸需整体制作，请按照总量选#克数#，#1000g#起做', '#0-0ｇ#，(制丸会减少药材总重10%-30%)', '共#7#剂，每日#1#剂，1剂分#1#次使用', '煎服', '9', '1525314609', '1', '1527583901', '1');
INSERT INTO `jd_drug_state` VALUES ('8', '中药饮片', '/uploads/code/1525687373code.png', '*水丸需整体制作，请按照总量选#克数#，#1000g#起做	', '#0-0ｇ#，(制丸会减少药材总重10%-30%)', '共#7#剂，每日#1#剂，1剂分#1#次使用', '煎服', '8', '1525314609', '1', '1525314735', '1');

-- ----------------------------
-- Table structure for jd_drug_taboo
-- ----------------------------
DROP TABLE IF EXISTS `jd_drug_taboo`;
CREATE TABLE `jd_drug_taboo` (
  `taboo_id` int(8) NOT NULL DEFAULT '0' COMMENT '主键',
  `taboo_name` varchar(355) NOT NULL DEFAULT '' COMMENT '禁忌内容',
  `sort` int(5) NOT NULL DEFAULT '0' COMMENT '权重 倒序',
  `aid` int(8) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0不显示 1显示',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`taboo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用药禁忌表';

-- ----------------------------
-- Records of jd_drug_taboo
-- ----------------------------
INSERT INTO `jd_drug_taboo` VALUES ('1', '怀孕禁用', '1', '1', '1', '888', '888');
INSERT INTO `jd_drug_taboo` VALUES ('2', '油腻', '2', '1', '1', '999', '999');
INSERT INTO `jd_drug_taboo` VALUES ('3', '烟酒', '3', '1', '1', '666', '888');
INSERT INTO `jd_drug_taboo` VALUES ('4', '辛辣', '4', '1', '1', '8888', '999');

-- ----------------------------
-- Table structure for jd_follow
-- ----------------------------
DROP TABLE IF EXISTS `jd_follow`;
CREATE TABLE `jd_follow` (
  `follow_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '患者id',
  `doctor_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生id',
  `is_show` int(3) NOT NULL DEFAULT '0' COMMENT '是否取消关注 1 取消',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `release_date` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员最后操作时间',
  PRIMARY KEY (`follow_id`),
  KEY `member_id` (`member_id`),
  KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='用户关注医生表';

-- ----------------------------
-- Records of jd_follow
-- ----------------------------
INSERT INTO `jd_follow` VALUES ('1', '3', '2', '0', '0', '0', '0', '0');
INSERT INTO `jd_follow` VALUES ('2', '9', '2', '0', '1526722641', '0', '0', '0');
INSERT INTO `jd_follow` VALUES ('3', '4', '3', '0', '1526801015', '0', '0', '0');
INSERT INTO `jd_follow` VALUES ('4', '4', '4', '0', '1526801023', '0', '0', '0');
INSERT INTO `jd_follow` VALUES ('5', '4', '7', '0', '1526801031', '0', '0', '0');
INSERT INTO `jd_follow` VALUES ('6', '4', '2', '0', '1526801034', '0', '0', '0');
INSERT INTO `jd_follow` VALUES ('8', '50', '2', '1', '1527646184', '0', '0', '0');
INSERT INTO `jd_follow` VALUES ('9', '50', '4', '0', '1527646353', '0', '0', '0');
INSERT INTO `jd_follow` VALUES ('11', '1', '7', '0', '1527665794', '0', '0', '0');
INSERT INTO `jd_follow` VALUES ('12', '1', '4', '0', '1527676343', '0', '0', '0');
INSERT INTO `jd_follow` VALUES ('13', '1', '3', '0', '1527754112', '0', '0', '0');
INSERT INTO `jd_follow` VALUES ('14', '2', '4', '0', '1527754239', '0', '0', '0');
INSERT INTO `jd_follow` VALUES ('15', '2', '2', '0', '1527817425', '0', '0', '0');
INSERT INTO `jd_follow` VALUES ('16', '2', '25', '0', '1527875344', '0', '0', '0');
INSERT INTO `jd_follow` VALUES ('17', '2', '3', '0', '1527994583', '0', '0', '0');

-- ----------------------------
-- Table structure for jd_goodat
-- ----------------------------
DROP TABLE IF EXISTS `jd_goodat`;
CREATE TABLE `jd_goodat` (
  `goodat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '擅长ID',
  `goodat_name` varchar(255) NOT NULL DEFAULT '' COMMENT '擅长名称',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '级别深度',
  `id_tree` varchar(100) NOT NULL COMMENT 'id树',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父级',
  `root_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '根id',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序 从大到小',
  `is_show` int(3) NOT NULL DEFAULT '1' COMMENT '是否显示 1 显示',
  `aid` int(10) NOT NULL DEFAULT '0' COMMENT '管理员姓名',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员最后一次操作时间',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `goodat_img` varchar(200) NOT NULL DEFAULT '' COMMENT '图片',
  PRIMARY KEY (`goodat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='医生擅长表';

-- ----------------------------
-- Records of jd_goodat
-- ----------------------------
INSERT INTO `jd_goodat` VALUES ('1', '小儿感冒', '2', '.014.001.', '14', '14', '4', '1', '1', '1524903447', '1524734525', '');
INSERT INTO `jd_goodat` VALUES ('14', '儿科', '1', '.014.', '0', '0', '1', '1', '1', '1527669053', '1524734408', '');
INSERT INTO `jd_goodat` VALUES ('15', '耳鼻喉科', '1', '.015.', '0', '15', '2', '1', '1', '1524734480', '1524734480', '');
INSERT INTO `jd_goodat` VALUES ('16', '眼科', '1', '.016.', '0', '16', '3', '1', '1', '1524734502', '1524734502', '');
INSERT INTO `jd_goodat` VALUES ('18', '小儿咳喘', '2', '.014.018.', '14', '14', '5', '1', '1', '1524734545', '1524734545', '');
INSERT INTO `jd_goodat` VALUES ('19', '小儿厌食症', '2', '.014.019.', '14', '14', '6', '1', '1', '1524734572', '1524734572', '');
INSERT INTO `jd_goodat` VALUES ('20', '多动症', '2', '.014.020.', '14', '14', '7', '1', '1', '1524734590', '1524734590', '');
INSERT INTO `jd_goodat` VALUES ('21', '中耳炎', '2', '.015.021.', '15', '15', '8', '1', '1', '1524734617', '1524734617', '');
INSERT INTO `jd_goodat` VALUES ('22', '耳鸣', '2', '.015.022.', '15', '15', '9', '1', '1', '1524734645', '1524734645', '');
INSERT INTO `jd_goodat` VALUES ('23', '耳聋', '2', '.015.023.', '15', '15', '10', '1', '1', '1524734657', '1524734657', '');
INSERT INTO `jd_goodat` VALUES ('24', '鼻炎', '2', '.015.024.', '15', '15', '11', '1', '1', '1524734683', '1524734683', '');
INSERT INTO `jd_goodat` VALUES ('25', '青少年近视', '2', '.016.025.', '16', '16', '12', '1', '1', '1524734734', '1524734734', '');
INSERT INTO `jd_goodat` VALUES ('26', '红眼病', '2', '.016.026.', '16', '16', '13', '1', '1', '1524734768', '1524734768', '');
INSERT INTO `jd_goodat` VALUES ('27', '青光眼', '2', '.016.027.', '16', '16', '14', '1', '1', '1524734782', '1524734782', '');
INSERT INTO `jd_goodat` VALUES ('28', '妇科', '1', '.028.', '0', '28', '15', '1', '1', '1527669080', '1527669080', '');
INSERT INTO `jd_goodat` VALUES ('29', '月经不调', '2', '.028.029.', '28', '28', '16', '1', '1', '1527669097', '1527669097', '');
INSERT INTO `jd_goodat` VALUES ('30', '痛经', '2', '.028.030.', '28', '28', '17', '1', '1', '1527669108', '1527669108', '');
INSERT INTO `jd_goodat` VALUES ('31', '带下症', '2', '.028.031.', '28', '28', '18', '1', '1', '1527669129', '1527669129', '');
INSERT INTO `jd_goodat` VALUES ('32', '妇科炎症', '2', '.028.032.', '28', '28', '19', '1', '1', '1527669140', '1527669140', '');
INSERT INTO `jd_goodat` VALUES ('33', '卵巢囊肿', '2', '.028.033.', '28', '28', '20', '1', '1', '1527669182', '1527669182', '');
INSERT INTO `jd_goodat` VALUES ('34', '产后调理', '2', '.028.034.', '28', '28', '21', '1', '1', '1527669194', '1527669194', '');
INSERT INTO `jd_goodat` VALUES ('35', '不孕', '2', '.028.035.', '28', '28', '22', '1', '1', '1527669205', '1527669205', '');
INSERT INTO `jd_goodat` VALUES ('36', '皮肤科', '1', '.036.', '0', '36', '23', '1', '1', '1527669222', '1527669222', '');
INSERT INTO `jd_goodat` VALUES ('37', '痘痘痤疮', '2', '.036.037.', '36', '36', '24', '1', '1', '1527671930', '1527671930', '');
INSERT INTO `jd_goodat` VALUES ('38', '面部色斑', '2', '.036.038.', '36', '36', '25', '1', '1', '1527671944', '1527671944', '');
INSERT INTO `jd_goodat` VALUES ('39', '皮炎', '2', '.036.039.', '36', '36', '26', '1', '1', '1527673185', '1527673185', '');
INSERT INTO `jd_goodat` VALUES ('40', '湿疹', '2', '.036.040.', '36', '36', '27', '1', '1', '1527673198', '1527673198', '');
INSERT INTO `jd_goodat` VALUES ('41', '荨麻疹', '2', '.036.041.', '36', '36', '28', '1', '1', '1527673217', '1527673217', '');
INSERT INTO `jd_goodat` VALUES ('42', '脱发', '2', '.036.042.', '36', '36', '29', '1', '1', '1527673251', '1527673251', '');
INSERT INTO `jd_goodat` VALUES ('43', '脚气', '2', '.036.043.', '36', '36', '30', '1', '1', '1527673287', '1527673287', '');
INSERT INTO `jd_goodat` VALUES ('44', '疱疹', '2', '.036.044.', '36', '36', '31', '1', '1', '1527674126', '1527674126', '');
INSERT INTO `jd_goodat` VALUES ('45', '冻疮', '2', '.036.045.', '36', '36', '32', '1', '1', '1527674138', '1527674138', '');
INSERT INTO `jd_goodat` VALUES ('46', '银屑病', '2', '.036.046.', '36', '36', '33', '1', '1', '1527674148', '1527674148', '');
INSERT INTO `jd_goodat` VALUES ('47', '白癜风', '2', '.036.047.', '36', '36', '34', '1', '1', '1527674157', '1527674157', '');
INSERT INTO `jd_goodat` VALUES ('48', '甲沟炎', '2', '.036.048.', '36', '36', '35', '1', '1', '1527674166', '1527674166', '');
INSERT INTO `jd_goodat` VALUES ('49', '灰指甲', '2', '.036.049.', '36', '36', '36', '1', '1', '1527674178', '1527674178', '');
INSERT INTO `jd_goodat` VALUES ('50', '白发', '2', '.036.050.', '36', '36', '37', '1', '1', '1527674192', '1527674192', '');
INSERT INTO `jd_goodat` VALUES ('51', '尖锐湿疣', '2', '.036.051.', '36', '36', '38', '1', '1', '1527674201', '1527674201', '');
INSERT INTO `jd_goodat` VALUES ('52', '消化科', '1', '.052.', '0', '52', '39', '1', '1', '1527674221', '1527674221', '');
INSERT INTO `jd_goodat` VALUES ('53', '胃痛', '2', '.052.053.', '52', '52', '40', '1', '1', '1527674263', '1527674263', '');
INSERT INTO `jd_goodat` VALUES ('54', '胃炎', '2', '.052.054.', '52', '52', '41', '1', '1', '1527674273', '1527674273', '');
INSERT INTO `jd_goodat` VALUES ('55', '消化性溃疡', '2', '.052.055.', '52', '52', '42', '1', '1', '1527674287', '1527674287', '');
INSERT INTO `jd_goodat` VALUES ('56', '腹泻', '2', '.052.056.', '52', '52', '43', '1', '1', '1527674314', '1527674314', '');
INSERT INTO `jd_goodat` VALUES ('57', '便秘', '2', '.052.057.', '52', '52', '44', '1', '1', '1527674326', '1527674326', '');
INSERT INTO `jd_goodat` VALUES ('58', ' 便血', '2', '.052.058.', '52', '52', '45', '1', '1', '1527674336', '1527674336', '');
INSERT INTO `jd_goodat` VALUES ('59', '腹痛', '2', '.052.059.', '52', '52', '46', '1', '1', '1527674348', '1527674348', '');
INSERT INTO `jd_goodat` VALUES ('60', '腹胀', '2', '.052.060.', '52', '52', '47', '1', '1', '1527674358', '1527674358', '');
INSERT INTO `jd_goodat` VALUES ('61', '肝炎', '2', '.052.061.', '52', '52', '48', '1', '1', '1527674369', '1527674369', '');
INSERT INTO `jd_goodat` VALUES ('62', '呃逆', '2', '.052.062.', '52', '52', '49', '1', '1', '1527674381', '1527674381', '');
INSERT INTO `jd_goodat` VALUES ('63', '脂肪肝', '2', '.052.063.', '52', '52', '50', '1', '1', '1527674396', '1527674396', '');
INSERT INTO `jd_goodat` VALUES ('64', '肠炎', '2', '.052.064.', '52', '52', '51', '1', '1', '1527674408', '1527674408', '');
INSERT INTO `jd_goodat` VALUES ('65', '胆囊炎', '2', '.052.065.', '52', '52', '52', '1', '1', '1527674418', '1527674418', '');
INSERT INTO `jd_goodat` VALUES ('66', '胰腺炎', '2', '.052.066.', '52', '52', '53', '1', '1', '1527674428', '1527674428', '');
INSERT INTO `jd_goodat` VALUES ('67', '黄疸', '2', '.052.067.', '52', '52', '54', '1', '1', '1527674439', '1527674439', '');
INSERT INTO `jd_goodat` VALUES ('68', '十二指肠溃疡', '2', '.052.068.', '52', '52', '55', '1', '1', '1527674451', '1527674451', '');
INSERT INTO `jd_goodat` VALUES ('69', '呼吸科', '1', '.069.', '0', '69', '56', '1', '1', '1527674458', '1527674458', '');
INSERT INTO `jd_goodat` VALUES ('70', '感冒', '2', '.069.070.', '69', '69', '57', '1', '1', '1527674467', '1527674467', '');
INSERT INTO `jd_goodat` VALUES ('71', '咳嗽', '2', '.069.071.', '69', '69', '58', '1', '1', '1527674477', '1527674477', '');
INSERT INTO `jd_goodat` VALUES ('72', '哮喘', '2', '.069.072.', '69', '69', '59', '1', '1', '1527674486', '1527674486', '');
INSERT INTO `jd_goodat` VALUES ('73', '肺炎', '2', '.069.073.', '69', '69', '60', '1', '1', '1527674495', '1527674495', '');
INSERT INTO `jd_goodat` VALUES ('74', '胸膜炎', '2', '.069.074.', '69', '69', '61', '1', '1', '1527674511', '1527674511', '');
INSERT INTO `jd_goodat` VALUES ('75', ' 肺结核', '2', '.069.075.', '69', '69', '62', '1', '1', '1527674520', '1527674520', '');
INSERT INTO `jd_goodat` VALUES ('76', '男科', '1', '.076.', '0', '76', '63', '1', '1', '1527674530', '1527674530', '');
INSERT INTO `jd_goodat` VALUES ('77', '早泄', '2', '.076.077.', '76', '76', '64', '1', '1', '1527674606', '1527674606', '');
INSERT INTO `jd_goodat` VALUES ('78', '前列腺炎', '2', '.076.078.', '76', '76', '65', '1', '1', '1527674626', '1527674626', '');
INSERT INTO `jd_goodat` VALUES ('79', '阳痿', '2', '.076.079.', '76', '76', '66', '1', '1', '1527674637', '1527674637', '');
INSERT INTO `jd_goodat` VALUES ('80', '男性不育', '2', '.076.080.', '76', '76', '67', '1', '1', '1527674654', '1527674654', '');
INSERT INTO `jd_goodat` VALUES ('81', '心内科', '1', '.081.', '0', '81', '68', '1', '1', '1527674676', '1527674676', '');
INSERT INTO `jd_goodat` VALUES ('82', '高血压', '2', '.081.082.', '81', '81', '69', '1', '1', '1527674708', '1527674708', '');
INSERT INTO `jd_goodat` VALUES ('83', '高脂血症', '2', '.081.083.', '81', '81', '70', '1', '1', '1527674720', '1527674720', '');
INSERT INTO `jd_goodat` VALUES ('84', '心痛', '2', '.081.084.', '81', '81', '71', '1', '1', '1527674736', '1527674736', '');
INSERT INTO `jd_goodat` VALUES ('85', '心律失常', '2', '.081.085.', '81', '81', '72', '1', '1', '1527674748', '1527674748', '');

-- ----------------------------
-- Table structure for jd_group_patient
-- ----------------------------
DROP TABLE IF EXISTS `jd_group_patient`;
CREATE TABLE `jd_group_patient` (
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '患者ID',
  `doctor_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生ID',
  `is_show` int(3) NOT NULL DEFAULT '1' COMMENT '是否显示 0 不显示 1 显示',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `release_date` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  KEY `group_id` (`group_id`),
  KEY `member_id` (`member_id`),
  KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生患者分组下面患者表';

-- ----------------------------
-- Records of jd_group_patient
-- ----------------------------

-- ----------------------------
-- Table structure for jd_habit
-- ----------------------------
DROP TABLE IF EXISTS `jd_habit`;
CREATE TABLE `jd_habit` (
  `habit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '生活习惯ID',
  `habit_name` varchar(255) NOT NULL DEFAULT '' COMMENT '生活习惯名称',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序 从大到小',
  `is_show` int(10) NOT NULL DEFAULT '1' COMMENT '是否显示 1显示',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `aid` int(10) NOT NULL DEFAULT '0' COMMENT '管理员姓名',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员最后一次操作时间',
  PRIMARY KEY (`habit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='患者生活习惯列表';

-- ----------------------------
-- Records of jd_habit
-- ----------------------------
INSERT INTO `jd_habit` VALUES ('1', '暴饮暴食13', '3', '1', '1523520041', '1', '1527584189');
INSERT INTO `jd_habit` VALUES ('2', '暴饮暴食1', '3', '1', '1523520041', '0', '0');
INSERT INTO `jd_habit` VALUES ('3', '暴饮暴食1', '3', '1', '1523520041', '0', '0');

-- ----------------------------
-- Table structure for jd_hair
-- ----------------------------
DROP TABLE IF EXISTS `jd_hair`;
CREATE TABLE `jd_hair` (
  `hair_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `doctor_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生ID',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `content` text NOT NULL COMMENT '公告内容',
  `add_date` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `release_date` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`hair_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='群发表';

-- ----------------------------
-- Records of jd_hair
-- ----------------------------

-- ----------------------------
-- Table structure for jd_hair_attach
-- ----------------------------
DROP TABLE IF EXISTS `jd_hair_attach`;
CREATE TABLE `jd_hair_attach` (
  `hair_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生ID',
  `src` varchar(255) NOT NULL DEFAULT '' COMMENT '图片路径',
  KEY `notice_id` (`hair_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生公告图片表';

-- ----------------------------
-- Records of jd_hair_attach
-- ----------------------------
INSERT INTO `jd_hair_attach` VALUES ('2', '/uploads/notice/20180516/8b78964e69e80956a614981dee6973eb.png');
INSERT INTO `jd_hair_attach` VALUES ('2', '/uploads/notice/20180516/dae8a742db677912a87bdb11652daa2d.png');
INSERT INTO `jd_hair_attach` VALUES ('2', '/uploads/notice/20180516/d33b533617557ef5316fbb053fe2bb78.png');
INSERT INTO `jd_hair_attach` VALUES ('9', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526637185_299.jpeg');
INSERT INTO `jd_hair_attach` VALUES ('23', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526883793_189.jpg');
INSERT INTO `jd_hair_attach` VALUES ('23', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526883793_647.png');
INSERT INTO `jd_hair_attach` VALUES ('23', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526883793_978.png');
INSERT INTO `jd_hair_attach` VALUES ('33', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526884900_407.png');
INSERT INTO `jd_hair_attach` VALUES ('33', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526884900_466.png');
INSERT INTO `jd_hair_attach` VALUES ('34', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526919563_864.jpg');
INSERT INTO `jd_hair_attach` VALUES ('34', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526919564_117.jpg');
INSERT INTO `jd_hair_attach` VALUES ('34', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526919564_732.jpg');
INSERT INTO `jd_hair_attach` VALUES ('34', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526919565_932.jpg');
INSERT INTO `jd_hair_attach` VALUES ('34', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526919565_332.jpg');
INSERT INTO `jd_hair_attach` VALUES ('55', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527439289_956.png');
INSERT INTO `jd_hair_attach` VALUES ('56', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527439975_903.jpg');
INSERT INTO `jd_hair_attach` VALUES ('57', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527440257_275.png');
INSERT INTO `jd_hair_attach` VALUES ('57', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527440258_470.png');
INSERT INTO `jd_hair_attach` VALUES ('57', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527440258_601.jpg');
INSERT INTO `jd_hair_attach` VALUES ('57', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527440258_259.jpg');
INSERT INTO `jd_hair_attach` VALUES ('57', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527440258_717.jpg');
INSERT INTO `jd_hair_attach` VALUES ('59', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527472577_538.jpg');
INSERT INTO `jd_hair_attach` VALUES ('59', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527472577_676.jpg');
INSERT INTO `jd_hair_attach` VALUES ('60', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527652442_377.jpg');
INSERT INTO `jd_hair_attach` VALUES ('72', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527686003_995.png');
INSERT INTO `jd_hair_attach` VALUES ('72', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527686003_138.png');
INSERT INTO `jd_hair_attach` VALUES ('72', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527686003_749.png');
INSERT INTO `jd_hair_attach` VALUES ('74', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527715369_927.jpg');
INSERT INTO `jd_hair_attach` VALUES ('78', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527879123_180.jpg');
INSERT INTO `jd_hair_attach` VALUES ('78', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527879123_981.png');
INSERT INTO `jd_hair_attach` VALUES ('78', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527879123_562.png');
INSERT INTO `jd_hair_attach` VALUES ('78', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527879123_513.jpg');
INSERT INTO `jd_hair_attach` VALUES ('78', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527879123_871.jpg');
INSERT INTO `jd_hair_attach` VALUES ('78', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527879123_274.png');
INSERT INTO `jd_hair_attach` VALUES ('79', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528001206_393.jpg');
INSERT INTO `jd_hair_attach` VALUES ('79', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528001206_353.jpg');
INSERT INTO `jd_hair_attach` VALUES ('79', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528001207_909.jpg');
INSERT INTO `jd_hair_attach` VALUES ('79', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528001207_135.jpg');
INSERT INTO `jd_hair_attach` VALUES ('79', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528001208_259.jpg');
INSERT INTO `jd_hair_attach` VALUES ('79', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528001208_863.jpg');
INSERT INTO `jd_hair_attach` VALUES ('79', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528001209_268.jpg');

-- ----------------------------
-- Table structure for jd_hospital
-- ----------------------------
DROP TABLE IF EXISTS `jd_hospital`;
CREATE TABLE `jd_hospital` (
  `hospital_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '医疗机构ID',
  `hospital_name` varchar(355) NOT NULL DEFAULT '' COMMENT '医疗机构名称 ',
  `intro` text NOT NULL COMMENT '简介',
  `area_id` int(8) NOT NULL DEFAULT '0' COMMENT '地区id',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '地址',
  `picture` varchar(200) NOT NULL DEFAULT '' COMMENT '图片',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序 从大到小',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示 1 显示',
  `aid` int(8) NOT NULL DEFAULT '0' COMMENT '最后一次操作者id',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员最后一次操作时间',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`hospital_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='医院表';

-- ----------------------------
-- Records of jd_hospital
-- ----------------------------
INSERT INTO `jd_hospital` VALUES ('6', '瑞金医院', '', '2', '上海市某某街道1', '/public/static/Img/tx.png', '1', '1', '1', '1524714523', '1523598975');
INSERT INTO `jd_hospital` VALUES ('9', '仁济医院', '', '2', '上海市某某街道1', '/public/static/Img/tx.png', '2', '1', '1', '1524714538', '1523599694');
INSERT INTO `jd_hospital` VALUES ('12', '中山医院', '', '2', '上海市某某街道9', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/images/1527728507_364.jpg', '3', '1', '1', '1527728512', '1523601762');
INSERT INTO `jd_hospital` VALUES ('16', '华山医院', '22222', '1', '北京市某某街道4', '/Uploads/image/images/20180310/20180310100148_73663.jpg', '4', '1', '0', '0', '1524533285');
INSERT INTO `jd_hospital` VALUES ('17', '武大医院1111', '三甲医院1ccccccc', '1', '北京市某某街道52222', '/Uploads/image/images/20180417/20180417093955_30904.jpg', '1', '1', '1', '1527583046', '1524715977');
INSERT INTO `jd_hospital` VALUES ('18', '泰坤堂中医东馆', '秉承“名医好药治好病，特色服务为人民”的院训和“患者第一、疗效第一、诚信第一”的泰坤堂文化，泰坤堂汇聚了包括陈熠、胡国华等全国名老中医在内的沪浙苏川众多名老中医和朱氏妇科、蔡氏妇科、陈氏妇科、何氏世医、何氏女科等13家流传超过百年的著名中医流派，曾在全国首家开出了全部由中医博士生导师和主任医师联合会诊的“中医妇科博导门诊”，以传承辨证论治、仁心仁术、天人和谐、济世活人的中医文化，解除患者痛苦，弘扬国医精粹，志创“现代中医老字号”。', '2', '浦东新区浦东南路2162号(近微山路)', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/images/1527818663_679.jpg', '1', '1', '1', '1527836453', '1527583066');

-- ----------------------------
-- Table structure for jd_hospital_repart
-- ----------------------------
DROP TABLE IF EXISTS `jd_hospital_repart`;
CREATE TABLE `jd_hospital_repart` (
  `hospital_repart_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `hospital_id` int(8) NOT NULL DEFAULT '0' COMMENT '医院id',
  `department_id` int(8) NOT NULL DEFAULT '0' COMMENT '科室id',
  `sort` tinyint(10) NOT NULL DEFAULT '0' COMMENT '权重 倒序',
  `is_show` int(3) NOT NULL DEFAULT '0' COMMENT '是否选中 1 选中',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `aid` int(8) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`hospital_repart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COMMENT='医院科室关联表';

-- ----------------------------
-- Records of jd_hospital_repart
-- ----------------------------
INSERT INTO `jd_hospital_repart` VALUES ('2', '6', '15', '0', '1', '1524714523', '1', '1524714523');
INSERT INTO `jd_hospital_repart` VALUES ('3', '6', '12', '0', '1', '1524714523', '1', '1524714523');
INSERT INTO `jd_hospital_repart` VALUES ('4', '6', '9', '0', '1', '1524714523', '1', '1524714523');
INSERT INTO `jd_hospital_repart` VALUES ('5', '9', '15', '0', '1', '1524714538', '1', '1524714538');
INSERT INTO `jd_hospital_repart` VALUES ('6', '9', '14', '0', '1', '1524714538', '1', '1524714538');
INSERT INTO `jd_hospital_repart` VALUES ('7', '9', '13', '0', '1', '1524714538', '1', '1524714538');
INSERT INTO `jd_hospital_repart` VALUES ('18', '12', '15', '0', '1', '1525857145', '1', '1527728514');
INSERT INTO `jd_hospital_repart` VALUES ('19', '16', '15', '0', '1', '1525857145', '1', '1525857145');
INSERT INTO `jd_hospital_repart` VALUES ('53', '17', '14', '0', '0', '1527583046', '1', '1527583046');
INSERT INTO `jd_hospital_repart` VALUES ('54', '17', '13', '0', '1', '1527583046', '1', '1527583046');
INSERT INTO `jd_hospital_repart` VALUES ('55', '17', '12', '0', '1', '1527583046', '1', '1527583046');
INSERT INTO `jd_hospital_repart` VALUES ('56', '17', '9', '0', '1', '1527583046', '1', '1527583046');
INSERT INTO `jd_hospital_repart` VALUES ('57', '17', '6', '0', '1', '1527583046', '1', '1527583046');
INSERT INTO `jd_hospital_repart` VALUES ('58', '18', '14', '0', '1', '1527583082', '1', '1527836455');
INSERT INTO `jd_hospital_repart` VALUES ('59', '18', '13', '0', '1', '1527583082', '1', '1527836455');
INSERT INTO `jd_hospital_repart` VALUES ('60', '18', '12', '0', '1', '1527583082', '1', '1527836454');
INSERT INTO `jd_hospital_repart` VALUES ('67', '18', '6', '0', '1', '1527648322', '0', '1527836454');
INSERT INTO `jd_hospital_repart` VALUES ('69', '18', '9', '0', '1', '1527648430', '0', '1527836454');
INSERT INTO `jd_hospital_repart` VALUES ('70', '12', '1', '0', '0', '1527728509', '0', '1527728512');
INSERT INTO `jd_hospital_repart` VALUES ('71', '12', '2', '0', '0', '1527728509', '0', '1527728512');
INSERT INTO `jd_hospital_repart` VALUES ('72', '12', '3', '0', '0', '1527728509', '0', '1527728513');
INSERT INTO `jd_hospital_repart` VALUES ('73', '12', '4', '0', '0', '1527728509', '0', '1527728513');
INSERT INTO `jd_hospital_repart` VALUES ('74', '12', '5', '0', '0', '1527728509', '0', '1527728513');
INSERT INTO `jd_hospital_repart` VALUES ('75', '12', '6', '0', '0', '1527728509', '0', '1527728513');
INSERT INTO `jd_hospital_repart` VALUES ('76', '12', '7', '0', '0', '1527728509', '0', '1527728513');
INSERT INTO `jd_hospital_repart` VALUES ('77', '12', '8', '0', '0', '1527728509', '0', '1527728513');
INSERT INTO `jd_hospital_repart` VALUES ('78', '12', '9', '0', '0', '1527728509', '0', '1527728513');
INSERT INTO `jd_hospital_repart` VALUES ('79', '12', '10', '0', '0', '1527728509', '0', '1527728513');
INSERT INTO `jd_hospital_repart` VALUES ('80', '12', '11', '0', '0', '1527728510', '0', '1527728513');
INSERT INTO `jd_hospital_repart` VALUES ('81', '12', '12', '0', '0', '1527728510', '0', '1527728514');
INSERT INTO `jd_hospital_repart` VALUES ('82', '12', '13', '0', '0', '1527728510', '0', '1527728514');
INSERT INTO `jd_hospital_repart` VALUES ('83', '12', '14', '0', '0', '1527728510', '0', '1527728514');
INSERT INTO `jd_hospital_repart` VALUES ('84', '12', '16', '0', '0', '1527728510', '0', '1527728514');
INSERT INTO `jd_hospital_repart` VALUES ('85', '12', '17', '0', '0', '1527728510', '0', '1527728514');
INSERT INTO `jd_hospital_repart` VALUES ('86', '12', '18', '0', '0', '1527728510', '0', '1527728514');
INSERT INTO `jd_hospital_repart` VALUES ('87', '12', '19', '0', '0', '1527728510', '0', '1527728514');
INSERT INTO `jd_hospital_repart` VALUES ('88', '12', '20', '0', '0', '1527728511', '0', '1527728514');
INSERT INTO `jd_hospital_repart` VALUES ('89', '12', '21', '0', '0', '1527728511', '0', '1527728514');
INSERT INTO `jd_hospital_repart` VALUES ('90', '12', '22', '0', '0', '1527728511', '0', '1527728515');
INSERT INTO `jd_hospital_repart` VALUES ('91', '12', '23', '0', '0', '1527728511', '0', '1527728515');
INSERT INTO `jd_hospital_repart` VALUES ('92', '12', '24', '0', '0', '1527728511', '0', '1527728515');
INSERT INTO `jd_hospital_repart` VALUES ('93', '12', '25', '0', '0', '1527728511', '0', '1527728515');
INSERT INTO `jd_hospital_repart` VALUES ('94', '12', '26', '0', '0', '1527728511', '0', '1527728515');
INSERT INTO `jd_hospital_repart` VALUES ('95', '12', '27', '0', '0', '1527728511', '0', '1527728515');
INSERT INTO `jd_hospital_repart` VALUES ('96', '12', '28', '0', '0', '1527728511', '0', '1527728515');
INSERT INTO `jd_hospital_repart` VALUES ('97', '12', '29', '0', '0', '1527728511', '0', '1527728515');
INSERT INTO `jd_hospital_repart` VALUES ('98', '12', '30', '0', '0', '1527728512', '0', '1527728515');
INSERT INTO `jd_hospital_repart` VALUES ('99', '12', '31', '0', '0', '1527728512', '0', '1527728515');
INSERT INTO `jd_hospital_repart` VALUES ('100', '12', '32', '0', '0', '1527728512', '0', '1527728516');
INSERT INTO `jd_hospital_repart` VALUES ('101', '12', '33', '0', '0', '1527728512', '0', '1527728516');
INSERT INTO `jd_hospital_repart` VALUES ('102', '18', '1', '0', '1', '1527818715', '0', '1527836453');
INSERT INTO `jd_hospital_repart` VALUES ('103', '18', '2', '0', '1', '1527818715', '0', '1527836453');
INSERT INTO `jd_hospital_repart` VALUES ('104', '18', '3', '0', '1', '1527818715', '0', '1527836453');
INSERT INTO `jd_hospital_repart` VALUES ('105', '18', '4', '0', '1', '1527818715', '0', '1527836454');
INSERT INTO `jd_hospital_repart` VALUES ('106', '18', '5', '0', '1', '1527818716', '0', '1527836454');
INSERT INTO `jd_hospital_repart` VALUES ('107', '18', '7', '0', '1', '1527818716', '0', '1527836454');
INSERT INTO `jd_hospital_repart` VALUES ('108', '18', '8', '0', '1', '1527818716', '0', '1527836454');
INSERT INTO `jd_hospital_repart` VALUES ('109', '18', '10', '0', '1', '1527818716', '0', '1527836454');
INSERT INTO `jd_hospital_repart` VALUES ('110', '18', '11', '0', '1', '1527818716', '0', '1527836454');
INSERT INTO `jd_hospital_repart` VALUES ('111', '18', '15', '0', '1', '1527818717', '0', '1527836455');
INSERT INTO `jd_hospital_repart` VALUES ('112', '18', '16', '0', '1', '1527818717', '0', '1527836455');
INSERT INTO `jd_hospital_repart` VALUES ('113', '18', '17', '0', '0', '1527818717', '0', '1527836455');
INSERT INTO `jd_hospital_repart` VALUES ('114', '18', '18', '0', '0', '1527818717', '0', '1527836455');
INSERT INTO `jd_hospital_repart` VALUES ('115', '18', '19', '0', '0', '1527818717', '0', '1527836455');
INSERT INTO `jd_hospital_repart` VALUES ('116', '18', '20', '0', '0', '1527818717', '0', '1527836455');
INSERT INTO `jd_hospital_repart` VALUES ('117', '18', '21', '0', '0', '1527818717', '0', '1527836455');
INSERT INTO `jd_hospital_repart` VALUES ('118', '18', '22', '0', '0', '1527818717', '0', '1527836456');
INSERT INTO `jd_hospital_repart` VALUES ('119', '18', '23', '0', '0', '1527818717', '0', '1527836456');
INSERT INTO `jd_hospital_repart` VALUES ('120', '18', '24', '0', '0', '1527818718', '0', '1527836456');
INSERT INTO `jd_hospital_repart` VALUES ('121', '18', '25', '0', '0', '1527818718', '0', '1527836456');
INSERT INTO `jd_hospital_repart` VALUES ('122', '18', '26', '0', '0', '1527818718', '0', '1527836456');
INSERT INTO `jd_hospital_repart` VALUES ('123', '18', '27', '0', '0', '1527818718', '0', '1527836456');
INSERT INTO `jd_hospital_repart` VALUES ('124', '18', '28', '0', '0', '1527818718', '0', '1527836456');
INSERT INTO `jd_hospital_repart` VALUES ('125', '18', '29', '0', '0', '1527818718', '0', '1527836456');
INSERT INTO `jd_hospital_repart` VALUES ('126', '18', '30', '0', '0', '1527818718', '0', '1527836456');
INSERT INTO `jd_hospital_repart` VALUES ('127', '18', '31', '0', '0', '1527818718', '0', '1527836457');
INSERT INTO `jd_hospital_repart` VALUES ('128', '18', '32', '0', '0', '1527818718', '0', '1527836457');
INSERT INTO `jd_hospital_repart` VALUES ('129', '18', '33', '0', '0', '1527818718', '0', '1527836457');

-- ----------------------------
-- Table structure for jd_inherit
-- ----------------------------
DROP TABLE IF EXISTS `jd_inherit`;
CREATE TABLE `jd_inherit` (
  `inherit_id` int(8) NOT NULL AUTO_INCREMENT,
  `inherit_name` varchar(200) NOT NULL DEFAULT '' COMMENT '传承名称',
  `member_id` int(8) NOT NULL DEFAULT '0' COMMENT '医生id',
  `member_sn` varchar(255) NOT NULL DEFAULT '' COMMENT '医生编号',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '起始价格',
  `service_str` varchar(255) NOT NULL DEFAULT '' COMMENT '疾病字符串 半角逗号拼接',
  `banner` varchar(300) NOT NULL DEFAULT '' COMMENT '详情页banner',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `release_date` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `aid` int(8) NOT NULL DEFAULT '1' COMMENT '管理员的id',
  `sort` int(5) NOT NULL DEFAULT '1' COMMENT '权重  倒序',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1使用  0不使用',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 不推荐 1推荐',
  `intro` text NOT NULL COMMENT '传承概述',
  `culture` text NOT NULL COMMENT '传承简介',
  `part1` varchar(255) NOT NULL DEFAULT '' COMMENT '第一模块',
  `part2` varchar(255) NOT NULL DEFAULT '' COMMENT '第二模块',
  `part3` varchar(255) NOT NULL DEFAULT '' COMMENT '第三模块',
  `part4` varchar(255) NOT NULL DEFAULT '' COMMENT '第四模块',
  `word1` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `word2` varchar(255) NOT NULL DEFAULT '',
  `word3` varchar(255) NOT NULL DEFAULT '',
  `word4` varchar(255) NOT NULL DEFAULT '',
  `school_id` int(8) NOT NULL COMMENT '流派id',
  `studio_intro` varchar(355) NOT NULL DEFAULT '' COMMENT '工作室简介',
  `studio_address` varchar(355) NOT NULL DEFAULT '' COMMENT '工作室地址',
  `studio_tel` varchar(255) NOT NULL DEFAULT '' COMMENT '工作室联系电话',
  PRIMARY KEY (`inherit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='传承表';

-- ----------------------------
-- Records of jd_inherit
-- ----------------------------
INSERT INTO `jd_inherit` VALUES ('2', '朱氏妇科传承', '2', 'tkt9527', '2000.00', '儿科病1,妇科病4,妇科病2', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526611332_279.jpg', '1525338780', '1527579717', '1', '2', '1', '1', '这厮历史简介', '&lt;p&gt;\n	女人都是爱美的，在延缓衰老方面，俞教授有一个很好的解决方案-美娘子方子，点击视频听听什么是“美娘子方子”，永葆青春美丽。&lt;br /&gt;\n&lt;br /&gt;\n【医生简介】俞瑾，国家级名老中医，国际妇科学术权威，被誉为&quot;世界外婆&quot;。复旦大学附属妇产科医院教授、博士生导师。&lt;br /&gt;\n&lt;br /&gt;\n一直致力于中西医结合女性健康事业的推广，30余次受邀赴美、日、德、意、瑞士、韩、保等国进行学术交流，并于1997年在美国国立卫生研究院(NIH)针刺听证会上进行&quot;针刺促排卵&quot;演讲，受到世界性重视。曾二次受邀担任国际妇科内分泌学会和国际产科妊高症学会1999年、2001年国际学术会议主席\n&lt;/p&gt;', '文献', '视频', '方.技', '传承', '医学典籍, 传承后世', '名医诊疗, 专业详尽', '历时数年, 精心炮制', '博文强识, 桃李天下', '2', '这是工作室的简介,大家好,这里是简介', '上海市浦东新区浦东南路2621号上海泰坤堂1', '400-700-5120');
INSERT INTO `jd_inherit` VALUES ('3', '朱氏儿科传承', '3', 'tkt5aec9367d45bf', '2000.00', '妇科病1,妇科病2', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/paper/1526611332_279.jpg', '1525338780', '1525857013', '1', '2', '1', '1', '这厮历史简介', '<p>女人都是爱美的，在延缓衰老方面，俞教授有一个很好的解决方案-美娘子方子，点击视频听听什么是“美娘子方子”，永葆青春美丽。<br><br>【医生简介】俞瑾，国家级名老中医，国际妇科学术权威，被誉为\"世界外婆\"。复旦大学附属妇产科医院教授、博士生导师。<br><br>一直致力于中西医结合女性健康事业的推广，30余次受邀赴美、日、德、意、瑞士、韩、保等国进行学术交流，并于1997年在美国国立卫生研究院(NIH)针刺听证会上进行\"针刺促排卵\"演讲，受到世界性重视。曾二次受邀担任国际妇科内分泌学会和国际产科妊高症学会1999年、2001年国际学术会议主席</p>', '文献', '视频', '方.技', '传承', '医学典籍, 传承后世', '名医诊疗, 专业详尽', '历时数年, 精心炮制', '博文强识, 桃李天下', '3', '这是工作室的简介,大家好,这里是简介', '上海市浦东新区浦东南路2621号上海泰坤堂', '400-700-5120');
INSERT INTO `jd_inherit` VALUES ('4', '泰坤堂中医传承', '2', 'tkt9527', '1000.00', '21313,213213213', '/uploads/image/images/20180529/20180529165621_54093.jpg', '1527584040', '1527682142', '1', '3', '1', '1', '这里是传承简介', '&lt;p&gt;\n	&lt;strong&gt;驱蚊器二群翁&lt;/strong&gt; \n&lt;/p&gt;\n&lt;p&gt;\n	&lt;strong&gt;驱蚊器二群翁群翁&lt;/strong&gt; \n&lt;/p&gt;', '文章', '视频', '方剂', '传承', '111', '222', '333', '444', '0', '这里是工作室的简介', '上海浦东南路泰坤堂', '77233369');
INSERT INTO `jd_inherit` VALUES ('6', '123123', '2', 'tkt9527', '12313.00', '1231', '', '1527734640', '1527734727', '1', '4', '0', '0', '3', '321313', '13', '123', '123', '123', '123', '123', '123', '123', '1', '12312', '3213', '123');

-- ----------------------------
-- Table structure for jd_inherit_doctor
-- ----------------------------
DROP TABLE IF EXISTS `jd_inherit_doctor`;
CREATE TABLE `jd_inherit_doctor` (
  `inherit_doctor_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `inherit_id` int(8) NOT NULL DEFAULT '0' COMMENT '传承id',
  `member_id` int(8) NOT NULL DEFAULT '0' COMMENT '被邀请的医生id',
  `parent_id` int(8) NOT NULL DEFAULT '0' COMMENT '上一级的id',
  `is_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 未审核 1 审核通过 2 审核未通过',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `aid` int(8) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `commission` int(5) NOT NULL DEFAULT '0' COMMENT '上级提成百分比(0-100)',
  `base_commission` int(5) NOT NULL DEFAULT '0' COMMENT '品台抽成百分比(0-100)',
  `pay_num` int(8) NOT NULL DEFAULT '0' COMMENT '付款数量',
  `proud` varchar(255) NOT NULL DEFAULT '' COMMENT '好评数',
  `use_drug` varchar(255) NOT NULL DEFAULT '' COMMENT '使用过的方剂字符串, 半角逗号拼接',
  `level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '级别',
  `img_url` varchar(255) NOT NULL DEFAULT '' COMMENT '邀请加入传承二维码',
  `reason` text NOT NULL COMMENT '申请理由',
  PRIMARY KEY (`inherit_doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='传承医生表(销售)';

-- ----------------------------
-- Records of jd_inherit_doctor
-- ----------------------------
INSERT INTO `jd_inherit_doctor` VALUES ('1', '2', '3', '7', '2', '1526284740', '1', '1527824836', '20', '5', '30', '89%', '把制香附丸', '2', 'http://localhost:7034/uploads/code/1527734727code.png', '');
INSERT INTO `jd_inherit_doctor` VALUES ('2', '2', '4', '3', '1', '1526284740', '1', '1527665968', '20', '5', '90', '84%', '把制香附丸', '3', 'http://localhost:7034/uploads/code/1527734727code.png', '');
INSERT INTO `jd_inherit_doctor` VALUES ('3', '2', '7', '2', '1', '1526284794', '1', '1526284794', '20', '5', '30', '89%', '把制香附丸', '2', 'http://localhost:7034/uploads/code/1527734727code.png', '');
INSERT INTO `jd_inherit_doctor` VALUES ('4', '3', '3', '3', '1', '1526284794', '1', '1526284794', '0', '5', '30', '89%', '把制香附丸', '1', 'http://localhost:7034/uploads/code/1527734727code.png', '');
INSERT INTO `jd_inherit_doctor` VALUES ('5', '2', '2', '2', '1', '1526284794', '1', '1526284794', '0', '5', '30', '89%', '把制香附丸', '1', 'http://localhost:7034/uploads/code/1527734727code.png', '');
INSERT INTO `jd_inherit_doctor` VALUES ('6', '3', '2', '3', '1', '1526284794', '1', '1526284794', '20', '5', '30', '89%', '把制香附丸', '2', 'http://localhost:7034/uploads/code/1527734727code.png', '');
INSERT INTO `jd_inherit_doctor` VALUES ('9', '4', '2', '2', '1', '1527734727', '0', '0', '0', '0', '0', '', '', '1', 'http://localhost:7034/uploads/code/1527734727code.png', '');
INSERT INTO `jd_inherit_doctor` VALUES ('10', '4', '3', '2', '0', '1527832780', '0', '0', '0', '0', '0', '', '', '1', 'http://39.105.19.169:88/uploads/code/1527832780code.png', '这是我的申请理由');
INSERT INTO `jd_inherit_doctor` VALUES ('11', '4', '17', '2', '0', '1527839833', '0', '0', '0', '0', '0', '', '', '1', 'http://39.105.19.169:88/uploads/code/1527839833code.png', '');
INSERT INTO `jd_inherit_doctor` VALUES ('12', '2', '25', '2', '1', '1527876313', '0', '0', '10', '20', '0', '', '', '1', 'http://39.105.19.169:88/uploads/code/1527876313code.png', '车');
INSERT INTO `jd_inherit_doctor` VALUES ('13', '3', '25', '3', '0', '1527929131', '0', '0', '0', '0', '0', '', '', '1', 'http://39.105.19.169:88/uploads/code/1527929132code.png', '宝宝');

-- ----------------------------
-- Table structure for jd_inquisition
-- ----------------------------
DROP TABLE IF EXISTS `jd_inquisition`;
CREATE TABLE `jd_inquisition` (
  `inquisition_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `doctor_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生ID',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '问诊单类型ID',
  `inquisition_name` varchar(200) NOT NULL DEFAULT '' COMMENT '问诊单名称',
  `dialectical` varchar(200) NOT NULL DEFAULT '' COMMENT '辩证',
  `add_date` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `operate_date` int(11) NOT NULL DEFAULT '0' COMMENT '管理员最后修改时间',
  PRIMARY KEY (`inquisition_id`),
  KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问诊单表';

-- ----------------------------
-- Records of jd_inquisition
-- ----------------------------

-- ----------------------------
-- Table structure for jd_inquisition_question
-- ----------------------------
DROP TABLE IF EXISTS `jd_inquisition_question`;
CREATE TABLE `jd_inquisition_question` (
  `inquisition_id` int(11) NOT NULL COMMENT '问诊单ID',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '题目选项 0 问答题目 1 单选 2 多选 3 图片',
  `question_name` varchar(200) NOT NULL DEFAULT '' COMMENT '题目名称',
  `question_src` varchar(200) NOT NULL DEFAULT '' COMMENT '拍照图片',
  `answer_name` varchar(200) NOT NULL DEFAULT '' COMMENT '回答提示',
  `question_number` varchar(200) NOT NULL DEFAULT '' COMMENT '序号',
  `question_json` text NOT NULL COMMENT '选项 json 存储 [{"question_name":"怕冷"}]',
  `add_date` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  KEY `inquisition_id` (`inquisition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问诊单题目表';

-- ----------------------------
-- Records of jd_inquisition_question
-- ----------------------------
INSERT INTO `jd_inquisition_question` VALUES ('1', '0', '题目名称', '1111.jpg', '回答提示', '1', '[{\"question_name\":\"选项名称\"}]', '11');

-- ----------------------------
-- Table structure for jd_invite_record
-- ----------------------------
DROP TABLE IF EXISTS `jd_invite_record`;
CREATE TABLE `jd_invite_record` (
  `record_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(8) NOT NULL DEFAULT '0' COMMENT '被邀请的医生id',
  `invite` varchar(100) NOT NULL DEFAULT '' COMMENT '注册时填写的邀请码',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='医生的邀请记录表';

-- ----------------------------
-- Records of jd_invite_record
-- ----------------------------
INSERT INTO `jd_invite_record` VALUES ('1', '7', '1002', '1525689720');
INSERT INTO `jd_invite_record` VALUES ('2', '8', '1002', '1525789970');
INSERT INTO `jd_invite_record` VALUES ('3', '10', '1002', '1526348681');
INSERT INTO `jd_invite_record` VALUES ('4', '11', '1021', '1526366729');
INSERT INTO `jd_invite_record` VALUES ('5', '12', '1021', '1526366927');
INSERT INTO `jd_invite_record` VALUES ('6', '17', '1001', '1526707077');
INSERT INTO `jd_invite_record` VALUES ('7', '39', '1002', '1527996433');
INSERT INTO `jd_invite_record` VALUES ('8', '40', '1002', '1527996521');
INSERT INTO `jd_invite_record` VALUES ('9', '41', '1002', '1527996622');
INSERT INTO `jd_invite_record` VALUES ('10', '42', '1002', '1527996748');

-- ----------------------------
-- Table structure for jd_link
-- ----------------------------
DROP TABLE IF EXISTS `jd_link`;
CREATE TABLE `jd_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `status` int(1) NOT NULL,
  `link` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `target` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of jd_link
-- ----------------------------

-- ----------------------------
-- Table structure for jd_mail
-- ----------------------------
DROP TABLE IF EXISTS `jd_mail`;
CREATE TABLE `jd_mail` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `is_mail` int(3) NOT NULL DEFAULT '0' COMMENT '站内信类型 0 发送患者 1 发送医生',
  `mobile` text NOT NULL COMMENT '添加的用户/医生手机号码，中间用,隔开',
  `mail_name` varchar(100) NOT NULL DEFAULT '' COMMENT '站内信名称',
  `substance` text NOT NULL COMMENT '站内信内容',
  `is_show` int(3) NOT NULL DEFAULT '0' COMMENT '是否显示 1 显示',
  `is_status` int(3) NOT NULL DEFAULT '0' COMMENT '是否发送全部',
  `add_date` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员最后操作时间',
  PRIMARY KEY (`mail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='站内信表';

-- ----------------------------
-- Records of jd_mail
-- ----------------------------
INSERT INTO `jd_mail` VALUES ('1', '1', '123455667', 'cccc', '22222', '0', '1', '1524825347', '1', '1524825347');

-- ----------------------------
-- Table structure for jd_member
-- ----------------------------
DROP TABLE IF EXISTS `jd_member`;
CREATE TABLE `jd_member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(100) NOT NULL DEFAULT '' COMMENT '用户名',
  `openid` char(64) NOT NULL DEFAULT '',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `portrait` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `birthday` varchar(30) NOT NULL DEFAULT '' COMMENT '用户生日 格式:1990-05-12',
  `age` varchar(255) NOT NULL DEFAULT '' COMMENT '患者年龄',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0男1女',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `nick_name` varchar(100) NOT NULL DEFAULT '' COMMENT '昵称',
  `true_name` varchar(100) NOT NULL DEFAULT '' COMMENT '真实姓名姓名',
  `id_card` char(32) NOT NULL DEFAULT '' COMMENT '身份证',
  `card` varchar(50) NOT NULL DEFAULT '' COMMENT '卡号',
  `introduction` varchar(500) NOT NULL DEFAULT '' COMMENT '个人介绍',
  `phone` varchar(30) NOT NULL DEFAULT '' COMMENT '电话',
  `qq` int(15) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 未完善 1完善',
  `is_status` int(3) NOT NULL DEFAULT '0' COMMENT '是否被冻结 1 冻结',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '积分',
  `wallet` varchar(100) NOT NULL DEFAULT '' COMMENT '钱包',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `guid` varchar(100) NOT NULL DEFAULT '' COMMENT '随机数',
  `device_tokens` varchar(255) NOT NULL DEFAULT '' COMMENT '设备唯一表示',
  `is_system` int(3) NOT NULL DEFAULT '0' COMMENT '是什么系统 1 是ISO 0是安卓',
  `reg_date` int(10) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `release_date` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `reg_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '注册IP地址',
  `login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '登录ip',
  `login_time` int(10) NOT NULL DEFAULT '0' COMMENT '登录时间',
  `aid` int(8) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `im_user` varchar(32) DEFAULT '',
  `im_pwd` varchar(32) DEFAULT '',
  `is_type` int(3) NOT NULL DEFAULT '0' COMMENT '患者类型 0 公证号患者 1 手机号患者',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='患者表';

-- ----------------------------
-- Records of jd_member
-- ----------------------------

-- ----------------------------
-- Table structure for jd_member_address
-- ----------------------------
DROP TABLE IF EXISTS `jd_member_address`;
CREATE TABLE `jd_member_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '收货地址',
  `consignee` varchar(150) NOT NULL DEFAULT '' COMMENT '收货人',
  `contact_phone` varchar(30) NOT NULL DEFAULT '' COMMENT '收货人联系手机',
  `is_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是默认 1 默认',
  `province_name` varchar(50) NOT NULL DEFAULT '' COMMENT '省份名',
  `city_name` varchar(50) NOT NULL DEFAULT '' COMMENT '城市名',
  `area_name` varchar(50) NOT NULL DEFAULT '' COMMENT '地区名',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='患者地址表';

-- ----------------------------
-- Records of jd_member_address
-- ----------------------------

-- ----------------------------
-- Table structure for jd_member_info
-- ----------------------------
DROP TABLE IF EXISTS `jd_member_info`;
CREATE TABLE `jd_member_info` (
  `member_id` int(11) NOT NULL DEFAULT '0',
  `allergy` varchar(500) NOT NULL DEFAULT '' COMMENT '过敏史',
  `medical` varchar(500) NOT NULL DEFAULT '' COMMENT '既往病史',
  `habit` varchar(200) NOT NULL DEFAULT '' COMMENT '生活习惯字符串(以半角逗号拼接)',
  `other_habit` varchar(500) NOT NULL DEFAULT '' COMMENT '其他生活习惯'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='患者身体信息';

-- ----------------------------
-- Records of jd_member_info
-- ----------------------------

-- ----------------------------
-- Table structure for jd_member_inquisition
-- ----------------------------
DROP TABLE IF EXISTS `jd_member_inquisition`;
CREATE TABLE `jd_member_inquisition` (
  `inquisition_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '患者ID',
  `doctor_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生ID',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '问诊单类型ID',
  `inquisition_name` varchar(200) NOT NULL DEFAULT '' COMMENT '问诊单名称',
  `dialectical` varchar(200) NOT NULL DEFAULT '' COMMENT '辩证',
  `add_date` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `operate_date` int(11) NOT NULL DEFAULT '0' COMMENT '管理员最后修改时间',
  `addtime` int(2) NOT NULL DEFAULT '0' COMMENT '填写时间',
  `content` text NOT NULL COMMENT '默认回答结果',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 系统默认 1 自定义',
  `addr` varchar(200) NOT NULL DEFAULT '' COMMENT '地址',
  `mobile` int(11) NOT NULL,
  `is_done` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 问诊单填写 1 问诊单填写完成',
  PRIMARY KEY (`inquisition_id`),
  KEY `member_id` (`member_id`),
  KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='患者问诊单表';

-- ----------------------------
-- Records of jd_member_inquisition
-- ----------------------------

-- ----------------------------
-- Table structure for jd_member_inquisition_question
-- ----------------------------
DROP TABLE IF EXISTS `jd_member_inquisition_question`;
CREATE TABLE `jd_member_inquisition_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inquisition_id` int(11) NOT NULL COMMENT '问诊单ID',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '题目选项 0 问答题目 1 单选 2 多选 3 图片',
  `question_name` varchar(200) NOT NULL DEFAULT '' COMMENT '题目名称',
  `question_val` varchar(255) DEFAULT '' COMMENT '回答值',
  `answer_name` varchar(200) NOT NULL DEFAULT '' COMMENT '回答提示',
  `question_number` varchar(200) NOT NULL DEFAULT '' COMMENT '序号',
  `question_json` text NOT NULL COMMENT '选项 json 存储 [{"question_name":"怕冷","status":"1"}]  status 1 选择',
  `add_date` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `doctor_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生ID',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '患者ID',
  PRIMARY KEY (`id`),
  KEY `inquisition_id` (`inquisition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='患者问诊单题目表';

-- ----------------------------
-- Records of jd_member_inquisition_question
-- ----------------------------

-- ----------------------------
-- Table structure for jd_nav
-- ----------------------------
DROP TABLE IF EXISTS `jd_nav`;
CREATE TABLE `jd_nav` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `nav_name` varchar(255) NOT NULL,
  `pid` smallint(5) NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT NULL,
  `link` varchar(225) NOT NULL,
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  `target` char(20) NOT NULL DEFAULT '',
  `title` varchar(50) DEFAULT NULL COMMENT 'SEO标题',
  `keywords` varchar(150) DEFAULT NULL COMMENT 'SEO关键字',
  `description` varchar(200) DEFAULT NULL COMMENT 'SEO描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of jd_nav
-- ----------------------------
INSERT INTO `jd_nav` VALUES ('1', '一级栏目', '0', '1', '1111', '1', '1', '', '', '');
INSERT INTO `jd_nav` VALUES ('2', '一级栏目', '0', '1', '1111', '1', '1', 'ddd', '', '');
INSERT INTO `jd_nav` VALUES ('3', '二级栏目', '1', '0', '', '2', '1', '333', '2', '2');
INSERT INTO `jd_nav` VALUES ('4', '三级栏目', '3', '0', '', '255', '1', '22', '33', '3333');

-- ----------------------------
-- Table structure for jd_news
-- ----------------------------
DROP TABLE IF EXISTS `jd_news`;
CREATE TABLE `jd_news` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `cid` smallint(3) DEFAULT NULL COMMENT '所在分类',
  `title` varchar(200) DEFAULT NULL COMMENT '新闻标题',
  `keywords` varchar(50) DEFAULT NULL COMMENT '文章关键字',
  `description` mediumtext COMMENT '文章描述',
  `link` varchar(200) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL COMMENT '文章摘要',
  `addtime` datetime DEFAULT NULL,
  `content` text,
  `click` int(11) NOT NULL DEFAULT '0',
  `aid` smallint(3) DEFAULT NULL COMMENT '发布者UID',
  `is_recommend` int(1) NOT NULL DEFAULT '0',
  `titlepic` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='新闻表';

-- ----------------------------
-- Records of jd_news
-- ----------------------------
INSERT INTO `jd_news` VALUES ('2', null, '标题：', 'SEO关键字', 'SEO描述', ' ', '1', 'SEO描述', '2018-04-09 10:35:25', '', '0', '1', '2', '');
INSERT INTO `jd_news` VALUES ('3', '1', '111', '', '', '', '0', '', '2018-05-09 17:11:20', '', '0', '1', '10', '');

-- ----------------------------
-- Table structure for jd_node
-- ----------------------------
DROP TABLE IF EXISTS `jd_node`;
CREATE TABLE `jd_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '权限名字',
  `group` varchar(20) DEFAULT NULL COMMENT '所属分组',
  `right` text COMMENT '权限码(控制器+动作)',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '删除状态 1删除,0正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_node
-- ----------------------------
INSERT INTO `jd_node` VALUES ('1', '基本设置', 'system', 'System@index', '0');
INSERT INTO `jd_node` VALUES ('2', '清除缓存', 'system', 'System@cleancache', '0');
INSERT INTO `jd_node` VALUES ('3', '管理员列表', 'Site', 'System@admin,System@addAdmin,System@editAdmin', '0');
INSERT INTO `jd_node` VALUES ('4', '角色管理', 'system', 'System@role,System@addRole,System@editRole,System@delRole', '0');
INSERT INTO `jd_node` VALUES ('5', '权限列表', 'system', 'System@nodeList,System@addNode,System@editNode,System@delNode', '0');
INSERT INTO `jd_node` VALUES ('6', '操作日志', 'system', 'System@adminLog,System@delLog', '0');
INSERT INTO `jd_node` VALUES ('7', '数据备份', 'system', 'System@backup', '0');
INSERT INTO `jd_node` VALUES ('8', '文章列表', 'Site', 'Site@index,Site@addNews,Site@editNews,Site@delNews', '0');
INSERT INTO `jd_node` VALUES ('9', '文章分类', 'Site', 'Site@category', '0');
INSERT INTO `jd_node` VALUES ('10', '单页管理', 'Site', 'Site@page,Site@addPage,Site@editPage,Site@delPage', '0');
INSERT INTO `jd_node` VALUES ('11', '友情链接', 'Site', 'Site@linkList,Site@addLink,Site@editLink,Site@delLink', '0');
INSERT INTO `jd_node` VALUES ('12', '导航菜单', 'Site', 'Site@nav,Site@addNav,Site@editNav,Site@delNav', '0');
INSERT INTO `jd_node` VALUES ('13', '广告位', 'Site', 'Site@adCate,Site@addAdCate,Site@editAdCate,Site@delAdCate', '0');
INSERT INTO `jd_node` VALUES ('14', '广告列表', 'Site', 'Site@adList,Site@addAdList,Site@editAdList,Site@delAdList', '0');
INSERT INTO `jd_node` VALUES ('15', '会员列表', 'User', 'User@index', '0');
INSERT INTO `jd_node` VALUES ('16', '会员等级', 'User', 'User@level', '0');

-- ----------------------------
-- Table structure for jd_notice
-- ----------------------------
DROP TABLE IF EXISTS `jd_notice`;
CREATE TABLE `jd_notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `doctor_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生ID',
  `notice_name` varchar(250) NOT NULL DEFAULT '' COMMENT '公告名称',
  `content` text NOT NULL COMMENT '公告内容',
  `add_date` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `release_date` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='公告表';

-- ----------------------------
-- Records of jd_notice
-- ----------------------------
INSERT INTO `jd_notice` VALUES ('1', '2', '就诊当天请凭预约号在门诊大厅打印条码，完成预约确认及由护士分流交费，后到相应', '明天本人不上班啊 不上班', '1525943288', '1525943288');
INSERT INTO `jd_notice` VALUES ('2', '2', '王测试', '也是简介1', '1526376601', '1526450410');
INSERT INTO `jd_notice` VALUES ('5', '2', '公告名', '测试公告内容', '1526607732', '1526607732');
INSERT INTO `jd_notice` VALUES ('6', '2', '公告名', '测试公告内容', '1526608346', '1526608346');
INSERT INTO `jd_notice` VALUES ('9', '2', '测试公告名', '测试公告内容', '1526616215', '1526637185');
INSERT INTO `jd_notice` VALUES ('10', '2', 'dead as', 'Daddy’s', '1526734273', '1526734273');
INSERT INTO `jd_notice` VALUES ('14', '2', 'kkk', 'lol', '1526734448', '1526734448');
INSERT INTO `jd_notice` VALUES ('23', '2', '王测试', '也是简介', '1526883793', '1526883793');
INSERT INTO `jd_notice` VALUES ('32', '2', '王测试', '也是简介', '1526884776', '1526884776');
INSERT INTO `jd_notice` VALUES ('33', '2', '王测试', '也是简介', '1526884900', '1526884900');
INSERT INTO `jd_notice` VALUES ('34', '2', 'f王测试', 'Re', '1526919563', '1526919563');
INSERT INTO `jd_notice` VALUES ('39', '17', 'android公告测试', '123123123123123123123123', '1526920077', '1526920077');
INSERT INTO `jd_notice` VALUES ('43', '17', '1111111111111111', '111111111111111111', '1526922580', '1526922580');
INSERT INTO `jd_notice` VALUES ('45', '17', '222222222', '222222222222', '1526922690', '1526922690');
INSERT INTO `jd_notice` VALUES ('49', '25', '倒还好p', '小宝贝', '1527427135', '1527427135');
INSERT INTO `jd_notice` VALUES ('55', '17', 'android tup ces', '123123123122222222222222222222222222222222222222222222222222222222222222222222222222222222222222222', '1527439289', '1527439289');
INSERT INTO `jd_notice` VALUES ('56', '17', '22222222222222222', '1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', '1527439975', '1527439975');
INSERT INTO `jd_notice` VALUES ('57', '17', '123123123', '123123123123123333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333', '1527440257', '1527440257');
INSERT INTO `jd_notice` VALUES ('59', '10', '测试公告', '测试公告', '1527472577', '1527472577');
INSERT INTO `jd_notice` VALUES ('60', '25', '电话', '吃吧', '1527652442', '1527652442');
INSERT INTO `jd_notice` VALUES ('72', '2', '王测试', '也是简介', '1527686003', '1527686003');
INSERT INTO `jd_notice` VALUES ('74', '2', 'did', 'Ddd', '1527715369', '1527715369');
INSERT INTO `jd_notice` VALUES ('77', '36', '级', '即可', '1527844996', '1527844996');
INSERT INTO `jd_notice` VALUES ('78', '26', '1111111', '1111111111111', '1527879123', '1527879123');
INSERT INTO `jd_notice` VALUES ('79', '26', '包治百病', '厉害了', '1528001206', '1528001206');
INSERT INTO `jd_notice` VALUES ('80', '26', '厉害了', '可以', '1528012556', '1528012556');

-- ----------------------------
-- Table structure for jd_notice_attach
-- ----------------------------
DROP TABLE IF EXISTS `jd_notice_attach`;
CREATE TABLE `jd_notice_attach` (
  `notice_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生ID',
  `src` varchar(255) NOT NULL DEFAULT '' COMMENT '图片路径',
  `src_size` varchar(30) NOT NULL DEFAULT '0' COMMENT '图片大小',
  KEY `notice_id` (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生公告图片表';

-- ----------------------------
-- Records of jd_notice_attach
-- ----------------------------
INSERT INTO `jd_notice_attach` VALUES ('2', '/uploads/notice/20180516/8b78964e69e80956a614981dee6973eb.png', '4593');
INSERT INTO `jd_notice_attach` VALUES ('2', '/uploads/notice/20180516/dae8a742db677912a87bdb11652daa2d.png', '661');
INSERT INTO `jd_notice_attach` VALUES ('2', '/uploads/notice/20180516/d33b533617557ef5316fbb053fe2bb78.png', '867');
INSERT INTO `jd_notice_attach` VALUES ('9', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526637185_299.jpeg', '104671');
INSERT INTO `jd_notice_attach` VALUES ('23', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526883793_189.jpg', '9164');
INSERT INTO `jd_notice_attach` VALUES ('23', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526883793_647.png', '1462');
INSERT INTO `jd_notice_attach` VALUES ('23', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526883793_978.png', '867');
INSERT INTO `jd_notice_attach` VALUES ('33', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526884900_407.png', '661');
INSERT INTO `jd_notice_attach` VALUES ('33', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526884900_466.png', '1462');
INSERT INTO `jd_notice_attach` VALUES ('34', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526919563_864.jpg', '119323');
INSERT INTO `jd_notice_attach` VALUES ('34', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526919564_117.jpg', '190720');
INSERT INTO `jd_notice_attach` VALUES ('34', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526919564_732.jpg', '286831');
INSERT INTO `jd_notice_attach` VALUES ('34', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526919565_932.jpg', '137039');
INSERT INTO `jd_notice_attach` VALUES ('34', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1526919565_332.jpg', '112176');
INSERT INTO `jd_notice_attach` VALUES ('55', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527439289_956.png', '17770');
INSERT INTO `jd_notice_attach` VALUES ('56', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527439975_903.jpg', '38371');
INSERT INTO `jd_notice_attach` VALUES ('57', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527440257_275.png', '17770');
INSERT INTO `jd_notice_attach` VALUES ('57', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527440258_470.png', '28779');
INSERT INTO `jd_notice_attach` VALUES ('57', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527440258_601.jpg', '87459');
INSERT INTO `jd_notice_attach` VALUES ('57', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527440258_259.jpg', '5582');
INSERT INTO `jd_notice_attach` VALUES ('57', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527440258_717.jpg', '87459');
INSERT INTO `jd_notice_attach` VALUES ('59', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527472577_538.jpg', '97464');
INSERT INTO `jd_notice_attach` VALUES ('59', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527472577_676.jpg', '111158');
INSERT INTO `jd_notice_attach` VALUES ('60', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527652442_377.jpg', '172689');
INSERT INTO `jd_notice_attach` VALUES ('72', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527686003_995.png', '661');
INSERT INTO `jd_notice_attach` VALUES ('72', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527686003_138.png', '867');
INSERT INTO `jd_notice_attach` VALUES ('72', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527686003_749.png', '661');
INSERT INTO `jd_notice_attach` VALUES ('74', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527715369_927.jpg', '119323');
INSERT INTO `jd_notice_attach` VALUES ('78', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527879123_180.jpg', '69604');
INSERT INTO `jd_notice_attach` VALUES ('78', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527879123_981.png', '20892');
INSERT INTO `jd_notice_attach` VALUES ('78', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527879123_562.png', '30352');
INSERT INTO `jd_notice_attach` VALUES ('78', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527879123_513.jpg', '69562');
INSERT INTO `jd_notice_attach` VALUES ('78', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527879123_871.jpg', '69573');
INSERT INTO `jd_notice_attach` VALUES ('78', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1527879123_274.png', '318636');
INSERT INTO `jd_notice_attach` VALUES ('79', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528001206_393.jpg', '225361');
INSERT INTO `jd_notice_attach` VALUES ('79', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528001206_353.jpg', '126415');
INSERT INTO `jd_notice_attach` VALUES ('79', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528001207_909.jpg', '155441');
INSERT INTO `jd_notice_attach` VALUES ('79', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528001207_135.jpg', '133463');
INSERT INTO `jd_notice_attach` VALUES ('79', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528001208_259.jpg', '91305');
INSERT INTO `jd_notice_attach` VALUES ('79', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528001208_863.jpg', '161162');
INSERT INTO `jd_notice_attach` VALUES ('79', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528001209_268.jpg', '111181');
INSERT INTO `jd_notice_attach` VALUES ('80', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528012556_722.jpg', '155441');
INSERT INTO `jd_notice_attach` VALUES ('80', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528012556_646.jpg', '133463');
INSERT INTO `jd_notice_attach` VALUES ('80', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528012556_195.jpg', '91305');
INSERT INTO `jd_notice_attach` VALUES ('80', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528012557_474.jpg', '126415');
INSERT INTO `jd_notice_attach` VALUES ('80', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528012557_838.jpg', '225361');
INSERT INTO `jd_notice_attach` VALUES ('80', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528012558_286.jpg', '111181');
INSERT INTO `jd_notice_attach` VALUES ('80', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/notice/1528012558_834.jpg', '161162');

-- ----------------------------
-- Table structure for jd_order
-- ----------------------------
DROP TABLE IF EXISTS `jd_order`;
CREATE TABLE `jd_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '订单编号',
  `trade_no` varchar(50) NOT NULL DEFAULT '' COMMENT '第三方订单号',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态0未付款1已付款2待退款3已退款',
  `pay_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '支付方式 0 未选择 1微信 2支付宝',
  `order_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '订单类型 0问诊 1复诊 2诊后咨询 3 处方订单 4 自建产品 5从HIS同步的历史开方',
  `order_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '订单状态-1已取消0待付款1待发货2待收货3待评价4已完成5待退货6已退货7已过期8等待药房审核后生效',
  `doctor_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生表的member_id',
  `patient_id` int(11) NOT NULL DEFAULT '0' COMMENT '患者表的member_id',
  `product_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品单价',
  `product_number` int(10) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `pay_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `is_delete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '客户端是否删除 1 是 0 否',
  `is_admin_delete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '后台是否删除 1 是 0 否',
  `see_date` int(10) NOT NULL DEFAULT '0' COMMENT '看诊时间',
  `order_date` int(10) NOT NULL DEFAULT '0' COMMENT '下单时间',
  `pay_date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `cancel_date` int(10) NOT NULL DEFAULT '0' COMMENT '取消时间',
  `complete_date` int(10) NOT NULL DEFAULT '0' COMMENT '完成时间',
  `end_date` int(10) NOT NULL DEFAULT '0' COMMENT '到期时间(过期订单作废)',
  `release_date` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `aid` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员最后一次操作时间',
  `product_company` varchar(20) NOT NULL DEFAULT '' COMMENT '产品单位',
  `decoct` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '代煎费用',
  `freight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠费用',
  `pharmacy` varchar(255) NOT NULL DEFAULT '' COMMENT '药房地址',
  `pharmacy_id` int(11) NOT NULL DEFAULT '0' COMMENT '药房地址ID',
  `message` varchar(255) NOT NULL DEFAULT '' COMMENT '留言',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='订单主表';

-- ----------------------------
-- Records of jd_order
-- ----------------------------
INSERT INTO `jd_order` VALUES ('1', '20180601081605', '', '0', '0', '0', '0', '25', '2', '60.00', '1', '60.00', '0', '0', '0', '1527812165', '0', '0', '0', '0', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');
INSERT INTO `jd_order` VALUES ('2', '20180601124763', '', '0', '0', '3', '0', '25', '2', '1.06', '10', '20.64', '0', '0', '1527812499', '1527812499', '0', '0', '0', '1527898899', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');
INSERT INTO `jd_order` VALUES ('3', '20180601240830', '', '0', '0', '3', '0', '25', '52', '0.80', '1', '10.80', '0', '0', '1527816883', '1527816883', '0', '0', '0', '1527903283', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');
INSERT INTO `jd_order` VALUES ('6', '20180601113846', '', '0', '0', '0', '0', '4', '1', '60.00', '1', '60.00', '0', '0', '0', '1527824326', '0', '0', '0', '0', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');
INSERT INTO `jd_order` VALUES ('7', '20180601034203', '4200000111201806016530503919', '1', '1', '0', '1', '2', '2', '1.00', '1', '1.00', '0', '0', '0', '1527838923', '1527838935', '0', '0', '0', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');
INSERT INTO `jd_order` VALUES ('8', '20180601035904', '', '0', '0', '4', '0', '2', '2', '4980.39', '1', '4980.39', '0', '0', '0', '1527839944', '0', '0', '0', '0', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');
INSERT INTO `jd_order` VALUES ('24', '20180601420003', '', '0', '0', '3', '0', '2', '25', '1.27', '10', '22.65', '0', '0', '1527864163', '1527864163', '0', '0', '0', '1527950563', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');
INSERT INTO `jd_order` VALUES ('25', '20180601035948', '', '0', '0', '3', '0', '2', '25', '1.27', '10', '22.65', '0', '0', '1527864239', '1527864239', '0', '0', '0', '1527950639', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');
INSERT INTO `jd_order` VALUES ('28', '20180601985645', '', '0', '0', '3', '0', '2', '25', '1.27', '10', '22.65', '0', '0', '1527864451', '1527864451', '0', '0', '0', '1527950851', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');
INSERT INTO `jd_order` VALUES ('29', '20180601936795', '', '0', '0', '3', '0', '25', '2', '0.37', '1', '10.37', '0', '0', '1527866521', '1527866521', '0', '0', '0', '1527952921', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');
INSERT INTO `jd_order` VALUES ('30', '20180602939519', '', '0', '0', '3', '0', '26', '55', '0.21', '1', '0.21', '0', '0', '1527871235', '1527871235', '0', '0', '0', '1527957635', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');
INSERT INTO `jd_order` VALUES ('31', '20180602608526', '', '0', '0', '3', '0', '25', '2', '0.20', '1', '10.20', '0', '0', '1527874765', '1527874765', '0', '0', '0', '1527961165', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');
INSERT INTO `jd_order` VALUES ('32', '20180602513621', '', '0', '0', '3', '8', '25', '0', '0.00', '1', '0.00', '0', '0', '1527875322', '1527875322', '0', '0', '0', '1527961722', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');
INSERT INTO `jd_order` VALUES ('33', '20180602389236', '', '0', '0', '3', '0', '25', '52', '1.03', '1', '11.03', '0', '0', '1527923442', '1527923442', '0', '0', '0', '1528009842', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');
INSERT INTO `jd_order` VALUES ('34', '20180602311826', '', '0', '0', '3', '0', '25', '2', '177.38', '2', '364.75', '0', '0', '1527930617', '1527930617', '0', '0', '0', '1528017017', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');
INSERT INTO `jd_order` VALUES ('35', '20180602139828', '', '0', '0', '3', '0', '2', '2', '0.35', '1', '10.35', '0', '0', '1527930881', '1527930881', '0', '0', '0', '1528017281', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');
INSERT INTO `jd_order` VALUES ('36', '20180603890229', '', '0', '0', '3', '0', '25', '25', '0.64', '1', '10.64', '0', '0', '1527955961', '1527955961', '0', '0', '0', '1528042361', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');
INSERT INTO `jd_order` VALUES ('37', '20180603122021', '', '0', '0', '0', '0', '2', '2', '2000.00', '1', '2000.00', '0', '0', '0', '1527956421', '0', '0', '0', '0', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');
INSERT INTO `jd_order` VALUES ('38', '20180603079726', '', '0', '0', '3', '0', '26', '57', '4.90', '10', '64.01', '0', '0', '1528004314', '1528004314', '0', '0', '0', '1528090714', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');
INSERT INTO `jd_order` VALUES ('39', '20180603156164', '', '0', '0', '3', '8', '26', '0', '0.00', '1', '0.00', '0', '0', '1528013134', '1528013134', '0', '0', '0', '1528099534', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');
INSERT INTO `jd_order` VALUES ('40', '20180603980666', '', '0', '0', '3', '0', '26', '57', '0.16', '1', '10.16', '0', '0', '1528013442', '1528013442', '0', '0', '0', '1528099842', '0', '0', '0', '', '0.00', '0.00', '0.00', '', '0', '');

-- ----------------------------
-- Table structure for jd_order_address
-- ----------------------------
DROP TABLE IF EXISTS `jd_order_address`;
CREATE TABLE `jd_order_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int(10) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `consignee` varchar(100) NOT NULL DEFAULT '' COMMENT '收货人',
  `consignee_phone` varchar(30) NOT NULL DEFAULT '' COMMENT '收货人联系电话',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '收货地址',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `aid` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员操作时间',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单的收货地址表';

-- ----------------------------
-- Records of jd_order_address
-- ----------------------------

-- ----------------------------
-- Table structure for jd_order_express
-- ----------------------------
DROP TABLE IF EXISTS `jd_order_express`;
CREATE TABLE `jd_order_express` (
  `express_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int(10) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `company` varchar(200) NOT NULL DEFAULT '' COMMENT '快递公司',
  `number` varchar(100) NOT NULL DEFAULT '' COMMENT '快递单号',
  `service` varchar(100) NOT NULL DEFAULT '' COMMENT '快递客服',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `aid` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员操作时间',
  PRIMARY KEY (`express_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='订单的快递单号表';

-- ----------------------------
-- Records of jd_order_express
-- ----------------------------
INSERT INTO `jd_order_express` VALUES ('2', '8', '快递公司111', '快递单号11', '快递客服11', '1527843644', '0', '1527843661');

-- ----------------------------
-- Table structure for jd_order_prescription
-- ----------------------------
DROP TABLE IF EXISTS `jd_order_prescription`;
CREATE TABLE `jd_order_prescription` (
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `prescription_type` int(3) NOT NULL DEFAULT '0' COMMENT '开方类型 0 在线开方 1 拍照开方 2 HIS历史开方',
  `prescription_src` varchar(255) NOT NULL DEFAULT '' COMMENT '辩证图片',
  `doctor_name` varchar(255) NOT NULL DEFAULT '' COMMENT '(HIS历史方)开方医生姓名',
  `patient_mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '患者手机号',
  `patient_name` varchar(100) NOT NULL DEFAULT '' COMMENT '患者姓名',
  `patient_sex` int(3) NOT NULL DEFAULT '0' COMMENT '0男1女',
  `patient_age` varchar(255) NOT NULL DEFAULT '' COMMENT '年龄',
  `dialectical` varchar(250) NOT NULL DEFAULT '' COMMENT '主诉及辩证辨病',
  `prescription_status` int(3) NOT NULL DEFAULT '0' COMMENT '患者购药前是否可查看药方 0 不可看 1可查看',
  `drug_str` text NOT NULL COMMENT '药方组成',
  `dose` varchar(255) NOT NULL DEFAULT '' COMMENT '剂量',
  `state_id` int(8) NOT NULL DEFAULT '0' COMMENT '药态id',
  `relation_id` int(8) NOT NULL DEFAULT '0' COMMENT '药房药态id',
  `price` decimal(8,4) NOT NULL DEFAULT '0.0000' COMMENT '单剂的价格',
  `make` varchar(255) NOT NULL DEFAULT '' COMMENT '制作规范',
  `weight` varchar(255) NOT NULL DEFAULT '' COMMENT '预计重量',
  `taking` varchar(255) NOT NULL DEFAULT '' COMMENT '服用方法',
  `instructions` varchar(255) NOT NULL DEFAULT '' COMMENT '服药说明',
  `service_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '服务诊疗费',
  `see_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '诊金',
  `total_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '总价',
  `is_taboo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否存在配伍禁忌',
  `taboo_content` varchar(355) NOT NULL DEFAULT '' COMMENT '配伍禁忌内容',
  `add_date` int(11) NOT NULL DEFAULT '0' COMMENT '开方时间',
  `is_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未审核 1审核中 2审核成功 3审核失败 4待确认(需要电话确认)',
  `note` varchar(355) NOT NULL DEFAULT '' COMMENT '药房审核备注',
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `operate_date` int(11) NOT NULL DEFAULT '0' COMMENT '管理员最后修改时间',
  `revisittime` char(30) NOT NULL DEFAULT '' COMMENT '复诊时间',
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单开处方详情表';

-- ----------------------------
-- Records of jd_order_prescription
-- ----------------------------
INSERT INTO `jd_order_prescription` VALUES ('2', '0', '', '', '13262215137', '测试', '0', '51岁', '安南说', '0', '[[4,\"川牛膝\",6,\"g\"],[29,\"天葵子\",5,\"g\"]]', '10', '7', '65', '1.0640', '* 颗粒剂请按照饮片量开出，药房将自动转换', '', '次服用#10#剂,每日#2#剂,一剂分#5#次服用', '怎么服用', '5.00', '5.00', '20.64', '0', '', '1527812499', '1', '', '0', '0', '');
INSERT INTO `jd_order_prescription` VALUES ('1', '0', '', '', '18221471539', '周维', '0', '7月', '编辑', '0', '[[7,\"郁金\",5,\"g\"],[4,\"川牛膝\",6,\"g\"]]', '1', '7', '65', '0.7950', '* 颗粒剂请按照饮片量开出，药房将自动转换', '', '次服用#1#剂,每日#2#剂,一剂分#1#次服用', '大概', '5.00', '5.00', '10.80', '0', '', '1527816883', '1', '', '0', '0', '');
INSERT INTO `jd_order_prescription` VALUES ('25', '0', '', '', '13077847205', '222', '1', '8\\U5c81', 'Dsadas', '0', '[[12,\"独活\",22,\"g\"]]', '10', '8', '54', '1.2650', '22231313', '', '1232131313', 'Dsadas', '5.00', '5.00', '22.65', '0', '', '1527864239', '1', '', '0', '0', '');
INSERT INTO `jd_order_prescription` VALUES ('28', '0', '', '', '13077847205', '222', '1', '8\\U5c81', 'Dsadas', '0', '[[12,\"独活\",22,\"g\"]]', '10', '8', '54', '1.2650', '22231313', '', '1232131313', 'Dsadas', '5.00', '5.00', '22.65', '0', '', '1527864452', '1', '', '0', '0', '');
INSERT INTO `jd_order_prescription` VALUES ('29', '0', '', '', '13262215137', '刘帅兵', '1', '10月', '患者', '0', '[[8,\"制半夏\",1,\"g\"]]', '1', '0', '0', '0.3680', '', '', '共#1#剂,每日#2#剂,一剂分#3#次服用', '减', '5.00', '5.00', '10.37', '0', '', '1527866522', '1', '', '0', '0', '');
INSERT INTO `jd_order_prescription` VALUES ('30', '0', '', '', '11111111111', 'android测试开方', '0', '7岁', '1111111111111', '0', '[[6,\"蜜麸炒木香\",3,\"g\"],[4,\"川牛膝\",1,\"g\"]]', '1', '7', '65', '0.2050', '*水丸需整体制作，请按照总量选#克数#，#1000g#起做', '#0-0ｇ#，(制丸会减少药材总重10%-30%)', '共#1#剂，每日#1#剂，1剂分#1#次使用', '煎服', '0.00', '0.00', '0.21', '0', '', '1527871236', '1', '', '0', '0', '');
INSERT INTO `jd_order_prescription` VALUES ('31', '0', '', '', '13262215137', '刘帅兵', '0', '67岁', 'qqw', '0', '[[13,\"防风\",2,\"g\"]]', '1', '0', '0', '0.1976', '', '', '共#1#剂,每日#1#剂,一剂分#1#次服用', '肩负', '5.00', '5.00', '10.20', '0', '', '1527874766', '1', '', '0', '0', '');
INSERT INTO `jd_order_prescription` VALUES ('32', '1', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/prescription/1527875322_344.jpg', '', '', '', '0', '', '', '1', '', '0', '0', '0', '0.0000', '', '', '', '', '25.00', '5.00', '0.00', '0', '', '1527875322', '1', '', '0', '0', '');
INSERT INTO `jd_order_prescription` VALUES ('33', '0', '', '', '18221471539', '周维', '1', '12月', '打广告', '0', '[[24,\"山豆根\",2,\"g\"]]', '1', '0', '0', '1.0300', '', '', '共#1#剂,每日#1#剂,一剂分#1#次服用', '还', '5.00', '5.00', '11.03', '0', '', '1527923442', '1', '', '0', '0', '');
INSERT INTO `jd_order_prescription` VALUES ('34', '0', '', '', '13262215137', 'liushauo', '1', '1月', '把自己卡', '0', '[[2,\"白及\",86,\"g\"]]', '2', '0', '0', '177.3750', '', '', '共#2#剂,每日#2#剂,一剂分#5#次服用', '不上班', '5.00', '5.00', '364.75', '0', '', '1527930617', '1', '', '0', '0', '');
INSERT INTO `jd_order_prescription` VALUES ('35', '0', '', '', '13262215137', '刘', '1', '43岁', '测试', '0', '[[12,\"独活\",6,\"g\"]]', '1', '8', '54', '0.3450', '* 颗粒剂请按照饮片量开出，药房将自动转换', '', '次服用#1#剂,每日#1#剂,一剂分#2#次服用', '与', '5.00', '5.00', '10.35', '0', '', '1527930881', '1', '', '0', '0', '');
INSERT INTO `jd_order_prescription` VALUES ('36', '0', '', '', '13077847205', '222', '1', '8岁', 'vhh', '0', '[[29,\"天葵子\",5,\"g\"]]', '1', '0', '0', '0.6440', '', '', '共#1#剂,每日#2#剂,一剂分#3#次服用', 'hi', '5.00', '5.00', '10.64', '0', '', '1527955962', '1', '', '0', '0', '');
INSERT INTO `jd_order_prescription` VALUES ('38', '0', '', '', '18616349964', '高媛', '1', '28岁', '感冒', '0', '[[6,\"蜜麸炒木香\",2,\"g\"],[17,\"制川乌\",2,\"g\"],[118,\"土茯苓\",2,\"袋\"],[315,\"熟附片\",1,\"g\"]]', '10', '7', '65', '4.9013', '* 颗粒剂请按照饮片量开出，药房将自动转换', '', '次服用#10#剂,每日#1#剂,一剂分#3#次服用', '炒着吃', '10.00', '5.00', '64.01', '0', '', '1528004314', '1', '', '0', '0', '');
INSERT INTO `jd_order_prescription` VALUES ('39', '1', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/prescription/1528013133_851.jpg', '', '', '', '0', '', '', '1', '', '0', '7', '65', '0.0000', '', '', '', '', '5.00', '0.00', '0.00', '0', '', '1528013134', '1', '', '0', '0', '');
INSERT INTO `jd_order_prescription` VALUES ('40', '0', '', '', '18616349964', '可以', '1', '1月', '头疼', '0', '[[6,\"蜜麸炒木香\",2,\"g\"],[4,\"川牛膝\",1,\"g\"]]', '1', '7', '65', '0.1600', '* 颗粒剂请按照饮片量开出，药房将自动转换', '', '次服用#1#剂,每日#1#剂,一剂分#1#次服用', '炒着吃', '5.00', '5.00', '10.16', '0', '', '1528013443', '1', '', '0', '0', '');

-- ----------------------------
-- Table structure for jd_order_product
-- ----------------------------
DROP TABLE IF EXISTS `jd_order_product`;
CREATE TABLE `jd_order_product` (
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `self_goods_id` int(8) NOT NULL DEFAULT '0' COMMENT '服务包id',
  `special_id` int(8) NOT NULL DEFAULT '0' COMMENT '相关特色方剂id',
  `inherit_id` int(8) NOT NULL DEFAULT '0' COMMENT '相关传承的id',
  `commission` int(8) NOT NULL DEFAULT '0' COMMENT '上级抽成百分比(0-100)',
  `base_commission` int(8) NOT NULL DEFAULT '0' COMMENT '平台抽成百分比',
  `tui_amount` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '实际退款金额',
  `parent_id` int(8) NOT NULL DEFAULT '0' COMMENT '传承上级的医生id',
  `product_name` varchar(200) NOT NULL DEFAULT '' COMMENT '服务包名称',
  `product_advantage` varchar(255) NOT NULL DEFAULT '' COMMENT '优势',
  `treatment_id` varchar(255) NOT NULL DEFAULT '' COMMENT '治疗范围id拼接用,隔开',
  `treatment_name` varchar(255) NOT NULL DEFAULT '' COMMENT '治疗范围名称拼接用,隔开',
  `love` int(10) NOT NULL DEFAULT '0' COMMENT '爱心问诊次数',
  `left_love` int(10) NOT NULL DEFAULT '0' COMMENT '剩余爱心问诊次数',
  `inquisition` int(10) NOT NULL DEFAULT '0' COMMENT '在线问诊次数',
  `left_inquisition` int(10) NOT NULL DEFAULT '0' COMMENT '剩余在线问诊次数',
  `revisit` int(10) NOT NULL DEFAULT '0' COMMENT '名医复诊次数',
  `left_revisit` int(10) NOT NULL DEFAULT '0' COMMENT '剩余名医复诊次数',
  `product_status` int(3) NOT NULL DEFAULT '0' COMMENT '药方状态 0 直接查看 1 付费后查看',
  `drug_product` text NOT NULL COMMENT '药方 json 存储',
  `explain` varchar(255) NOT NULL DEFAULT '' COMMENT '药效说明',
  `careful` varchar(50) NOT NULL DEFAULT '' COMMENT '注意事项',
  `product_date` int(11) NOT NULL DEFAULT '0' COMMENT '购买时间',
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `operate_date` int(11) NOT NULL DEFAULT '0' COMMENT '管理员最后修改时间',
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单服务包详情表';

-- ----------------------------
-- Records of jd_order_product
-- ----------------------------
INSERT INTO `jd_order_product` VALUES ('6', '0', '0', '0', '0', '0', '0.00', '0', '图文咨询', '', '', '', '0', '0', '1', '1', '0', '0', '1', '', '', '', '1527824326', '0', '0');
INSERT INTO `jd_order_product` VALUES ('7', '0', '0', '0', '0', '0', '0.00', '0', '图文咨询', '', '', '', '1', '1', '1', '1', '0', '0', '1', '', '', '', '1527838923', '0', '0');
INSERT INTO `jd_order_product` VALUES ('8', '0', '0', '0', '2', '23', '0.00', '0', '感冒服务包3', '优势优势优势优势优势优势', '', '', '5', '5', '5', '5', '5', '0', '1', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '', '', '1527839944', '0', '1527843661');
INSERT INTO `jd_order_product` VALUES ('37', '0', '0', '0', '0', '0', '0.00', '0', '图文咨询', '', '', '', '99', '99', '1', '1', '0', '0', '1', '', '', '', '1527956421', '0', '0');

-- ----------------------------
-- Table structure for jd_page
-- ----------------------------
DROP TABLE IF EXISTS `jd_page`;
CREATE TABLE `jd_page` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL COMMENT '新闻标题',
  `unique_id` varchar(30) NOT NULL DEFAULT '',
  `keywords` varchar(50) DEFAULT NULL COMMENT '文章关键字',
  `description` mediumtext COMMENT '文章描述',
  `link` varchar(200) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL COMMENT '文章摘要',
  `addtime` datetime DEFAULT NULL,
  `content` text,
  `click` int(11) NOT NULL DEFAULT '0',
  `aid` smallint(3) DEFAULT NULL COMMENT '发布者UID',
  `is_recommend` int(1) NOT NULL DEFAULT '0',
  `titlepic` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='单页表';

-- ----------------------------
-- Records of jd_page
-- ----------------------------
INSERT INTO `jd_page` VALUES ('1', '1', 'iiiii', '12321321', '312321', null, '1', '312321321313', '2018-05-14 10:52:16', '32131313', '0', '1', '3', '');

-- ----------------------------
-- Table structure for jd_patient_group
-- ----------------------------
DROP TABLE IF EXISTS `jd_patient_group`;
CREATE TABLE `jd_patient_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `doctor_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生ID',
  `group_name` varchar(200) NOT NULL DEFAULT '' COMMENT '分组名称',
  `group_name_eng` varchar(200) NOT NULL DEFAULT '' COMMENT '分组英文名称',
  `group_member_id` text NOT NULL COMMENT '分组患者ID,隔开',
  `group_member_name` text NOT NULL,
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`group_id`),
  KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='医生患者分组表';

-- ----------------------------
-- Records of jd_patient_group
-- ----------------------------

-- ----------------------------
-- Table structure for jd_prescription
-- ----------------------------
DROP TABLE IF EXISTS `jd_prescription`;
CREATE TABLE `jd_prescription` (
  `prescription_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `prescription_name` varchar(355) NOT NULL DEFAULT '' COMMENT '药房名称',
  `linkman` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人',
  `mobile` int(11) NOT NULL DEFAULT '0' COMMENT '联系人电话',
  `domain` varchar(255) NOT NULL DEFAULT '' COMMENT 'his服务器ip+端口',
  `remarks` text NOT NULL COMMENT '药房简介',
  `aid` int(8) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `end_date` int(10) NOT NULL DEFAULT '0' COMMENT '截止日期',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `area_id` int(8) NOT NULL DEFAULT '0' COMMENT '地区id',
  `area_name` varchar(255) NOT NULL DEFAULT '' COMMENT '地区名',
  `sort` int(5) NOT NULL,
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0不显示 1显示',
  PRIMARY KEY (`prescription_id`),
  KEY `aid` (`aid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='药房表';

-- ----------------------------
-- Records of jd_prescription
-- ----------------------------
INSERT INTO `jd_prescription` VALUES ('1', '泰坤堂大药房', '涂革', '1502139435', '127.0.0.1:8080', '有着悠久历史传承的药房1112211', '1', '1521858420', '32323', '1527818652', '上海市浦东新区浦东南路2162号', '2', '上海', '5', '1');
INSERT INTO `jd_prescription` VALUES ('2', '同仁堂大药房', '涂革', '1502139435', '127.0.0.1:8080', '有着悠久历史传承的药房1112211', '1', '1521858420', '32323', '1524646951', '上海市浦东新区浦东南路2162号', '2', '上海', '5', '1');
INSERT INTO `jd_prescription` VALUES ('3', '隆安堂大药房', '涂革', '1502139435', '127.0.0.1:8080', '有着悠久历史传承的药房1112211', '1', '1521858420', '32323', '1524646951', '上海市浦东新区浦东南路2162号', '2', '成都', '5', '1');
INSERT INTO `jd_prescription` VALUES ('4', '测试药方数据', 'eee', '173', 'dddd', 'aaaa', '1', '1527048540', '1527653365', '1527819520', '', '1', '北京', '6', '1');
INSERT INTO `jd_prescription` VALUES ('5', '测试2', 'ccc', '1', 'cccc', 'cccc', '1', '1527653580', '1527653598', '1527819532', '', '1', '北京', '7', '1');

-- ----------------------------
-- Table structure for jd_question
-- ----------------------------
DROP TABLE IF EXISTS `jd_question`;
CREATE TABLE `jd_question` (
  `question_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ID',
  `question_title` varchar(200) NOT NULL DEFAULT '' COMMENT '问题的题干',
  `question_answer` text NOT NULL COMMENT '问题的回答',
  `sort` int(5) NOT NULL DEFAULT '0' COMMENT '权重 倒序',
  `is_display` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不显示 1显示',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `aid` int(8) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`question_id`),
  KEY `type_id` (`type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='常见问题表';

-- ----------------------------
-- Records of jd_question
-- ----------------------------
INSERT INTO `jd_question` VALUES ('1', '1', '如何给患者辩症开方？', '&amp;lt;img src=&amp;quot;images/1.jpg&amp;quot;&amp;gt;\n        &amp;lt;div class=&amp;quot;pad&amp;quot;&amp;gt;\n            当和患者充分沟通了解身体状况后，就可以给患者定制药方了。收到药方后患者即可在平台完成购药，根据您的建议调理身体。以下是开药方的具体流程和步骤，请认真阅览。\n        &amp;lt;/div&amp;gt;\n        &amp;lt;img src=&amp;quot;images/2.jpg&amp;quot; class=&amp;quot;bor&amp;quot;&amp;gt;\n        &amp;lt;div class=&amp;quot;pad&amp;quot;&amp;gt;\n            1.在和患者对话时，点击输入框上方的辩证开放图标打开选择开方界面；在选择开方界面顶部可选择在线开方或者拍照开方。\n        &amp;lt;/div&amp;gt;', '12', '1', '0', '1', '1527074715');
INSERT INTO `jd_question` VALUES ('2', '2', '2222222222a', '111111111', '2', '1', '0', '0', '0');
INSERT INTO `jd_question` VALUES ('3', '2', '333333333a', '111111111', '3', '1', '0', '0', '0');
INSERT INTO `jd_question` VALUES ('4', '2', '44444444a', '111111111', '4', '1', '0', '0', '0');
INSERT INTO `jd_question` VALUES ('5', '2', '55555555a', '111111111', '5', '1', '0', '1', '1527132412');
INSERT INTO `jd_question` VALUES ('6', '3', '666666666a', '111111111', '1', '1', '0', '0', '0');
INSERT INTO `jd_question` VALUES ('7', '3', '77777777a', '111111111', '1', '1', '0', '1', '1527131773');

-- ----------------------------
-- Table structure for jd_question_type
-- ----------------------------
DROP TABLE IF EXISTS `jd_question_type`;
CREATE TABLE `jd_question_type` (
  `type_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_name` varchar(200) NOT NULL DEFAULT '' COMMENT '问题的题干',
  `sort` int(5) NOT NULL DEFAULT '0' COMMENT '排序 从小到大',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='常见问题表';

-- ----------------------------
-- Records of jd_question_type
-- ----------------------------
INSERT INTO `jd_question_type` VALUES ('1', '常见问题', '1', '0');
INSERT INTO `jd_question_type` VALUES ('2', '邀请医生', '2', '0');
INSERT INTO `jd_question_type` VALUES ('3', '关于小橘灯', '3', '0');

-- ----------------------------
-- Table structure for jd_role
-- ----------------------------
DROP TABLE IF EXISTS `jd_role`;
CREATE TABLE `jd_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` int(4) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `remark` varchar(255) DEFAULT '0',
  `act_list` text COMMENT '权限列表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='权限角色表';

-- ----------------------------
-- Records of jd_role
-- ----------------------------
INSERT INTO `jd_role` VALUES ('1', '超级管理员', '0', '1', '系统内置超级管理员组，不受权限分配账号限制', 'all');

-- ----------------------------
-- Table structure for jd_routine
-- ----------------------------
DROP TABLE IF EXISTS `jd_routine`;
CREATE TABLE `jd_routine` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `doctor_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生ID',
  `address` varchar(100) NOT NULL DEFAULT '地址',
  `worktime` char(50) NOT NULL DEFAULT '0' COMMENT '工作时间',
  `is_show` int(3) NOT NULL DEFAULT '0' COMMENT '是否显示 1 显示',
  `add_date` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员最后操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='医生工作时间表';

-- ----------------------------
-- Records of jd_routine
-- ----------------------------
INSERT INTO `jd_routine` VALUES ('1', '2', '浦东新区高行社区卫生服务中心 (一级)', '2018年03月18日  10:00', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for jd_school
-- ----------------------------
DROP TABLE IF EXISTS `jd_school`;
CREATE TABLE `jd_school` (
  `school_id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `school_name` varchar(255) NOT NULL,
  `sort` tinyint(1) NOT NULL DEFAULT '0' COMMENT '权重',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0不显示 1显示',
  `add_date` int(10) NOT NULL DEFAULT '0',
  `release_date` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='流派表';

-- ----------------------------
-- Records of jd_school
-- ----------------------------
INSERT INTO `jd_school` VALUES ('1', '学术流派', '1', '1', '32532525', '1527670845');
INSERT INTO `jd_school` VALUES ('2', '传承流派', '2', '1', '32532525', '1527670853');

-- ----------------------------
-- Table structure for jd_self_goods
-- ----------------------------
DROP TABLE IF EXISTS `jd_self_goods`;
CREATE TABLE `jd_self_goods` (
  `self_goods_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `self_goods_sn` varchar(200) NOT NULL DEFAULT '' COMMENT '医生的自建产品编号',
  `self_goods_name` varchar(200) NOT NULL DEFAULT '',
  `special_id` int(8) NOT NULL DEFAULT '0' COMMENT '相关联的特色方剂id',
  `inherit_id` int(8) NOT NULL DEFAULT '0' COMMENT '所属传承id',
  `referral` int(5) NOT NULL DEFAULT '0' COMMENT '名医复诊次数',
  `on_line` int(5) NOT NULL DEFAULT '0' COMMENT '在线问诊次数',
  `content` text NOT NULL COMMENT '自定义药品组成(json字符串)',
  `member_id` int(8) NOT NULL DEFAULT '0' COMMENT '医生id',
  `one_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '单剂药方的价格',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '产品总价格',
  `is_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未审核 1审核中 2审核成功 3审核失败',
  `volume` int(8) NOT NULL DEFAULT '0' COMMENT '销量',
  `end_date` int(10) NOT NULL DEFAULT '0' COMMENT '使用时间段, 默认一年 患者购买后一年过期',
  `sort` int(8) NOT NULL DEFAULT '0' COMMENT '权重 倒序',
  `to_top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不推荐靠前  1推荐靠前',
  `scope` text NOT NULL COMMENT '治疗范围 疾病表疾病名称拼接的字符串',
  `advantage` varchar(255) NOT NULL DEFAULT '' COMMENT '优势',
  `description` text NOT NULL COMMENT '药效说明',
  `precautions` text NOT NULL COMMENT '注意事项',
  `service_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '诊疗服务费',
  `prescription_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '患者购药前是否可查看药方 0 不可看 1可查看',
  `dose` int(8) NOT NULL DEFAULT '1' COMMENT '剂量',
  `see_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `taking` varchar(255) NOT NULL DEFAULT '' COMMENT '服用方法',
  `inherit_drug` text NOT NULL COMMENT '传承药方',
  `is_taboo` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0无配伍禁忌 1有配伍禁忌',
  `taboo_content` text NOT NULL COMMENT '配伍禁忌内容',
  `aid` int(8) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `operate_date` int(10) NOT NULL DEFAULT '10' COMMENT '操作时间',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `release_date` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`self_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='自建产品表';

-- ----------------------------
-- Records of jd_self_goods
-- ----------------------------
INSERT INTO `jd_self_goods` VALUES ('6', '5b05507f04416', '感冒服务包2', '1', '2', '5', '5', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '3', '496.54', '4980.39', '2', '0', '1558610943', '0', '0', '妇科病4,妇科病3', '优势优势优势优势优势优势', '药效说明药效说明药效说明药效说明', '注意事项注意事项注意事项注意事项', '10.00', '1', '10', '5.00', '共#10#剂，每日#1#剂，1剂分#1#次使用  ', 'W1sxNywiXHU1MjM2XHU1ZGRkXHU0ZTRjIiw0LCJnIl0sWzMxNSwiXHU3MTlmXHU5NjQ0XHU3MjQ3IiwzMCwiZyJdLFs0ODUsIlx1NmNkNVx1NTM0YVx1NTkwZiIsOTQsImciXV0=', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '0', '10', '1527074943', '1527074943');
INSERT INTO `jd_self_goods` VALUES ('7', '20180523694347', '感冒服务包3', '3', '2', '5', '5', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '2', '496.54', '4980.39', '2', '0', '1558611369', '0', '0', '妇科病4,妇科病3', '优势优势优势优势优势优势', '药效说明药效说明药效说明药效说明', '注意事项注意事项注意事项注意事项', '10.00', '1', '10', '5.00', '共#10#剂，每日#1#剂，1剂分#1#次使用  ', 'W1sxNywiXHU1MjM2XHU1ZGRkXHU0ZTRjIiw0LCJnIl0sWzMxNSwiXHU3MTlmXHU5NjQ0XHU3MjQ3IiwzMCwiZyJdLFs0ODUsIlx1NmNkNVx1NTM0YVx1NTkwZiIsOTQsImciXV0=', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '0', '10', '1527075369', '1527075369');
INSERT INTO `jd_self_goods` VALUES ('8', '20180523537986', '感冒服务包4', '2', '2', '5', '5', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '2', '496.54', '4980.39', '2', '0', '1558611371', '0', '0', '妇科病4,妇科病3', '优势优势优势优势优势优势', '药效说明药效说明药效说明药效说明', '注意事项注意事项注意事项注意事项', '10.00', '1', '10', '5.00', '共#10#剂，每日#1#剂，1剂分#1#次使用  ', 'W1sxNywiXHU1MjM2XHU1ZGRkXHU0ZTRjIiw0LCJnIl0sWzMxNSwiXHU3MTlmXHU5NjQ0XHU3MjQ3IiwzMCwiZyJdLFs0ODUsIlx1NmNkNVx1NTM0YVx1NTkwZiIsOTQsImciXV0=', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '0', '10', '1527075371', '1527075371');
INSERT INTO `jd_self_goods` VALUES ('9', '20180523249940', '33感冒服务包2', '0', '0', '5', '5', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '2', '496.54', '4980.39', '1', '0', '1558612988', '0', '0', '妇科病4,妇科病3', '优势优势优势优势优势优势', '药效说明药效说明药效说明药效说明', '注意事项注意事项注意事项注意事项', '10.00', '1', '10', '5.00', '共#10#剂，每日#1#剂，1剂分#1#次使用  ', 'W1sxNywiXHU1MjM2XHU1ZGRkXHU0ZTRjIiw0LCJnIl0sWzMxNSwiXHU3MTlmXHU5NjQ0XHU3MjQ3IiwzMCwiZyJdLFs0ODUsIlx1NmNkNVx1NTM0YVx1NTkwZiIsOTQsImciXV0=', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '0', '10', '1527076988', '1527076988');
INSERT INTO `jd_self_goods` VALUES ('10', '20180523161729', '感冒服务包2', '1', '2', '5', '5', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '2', '496.54', '4980.39', '1', '0', '1558612026', '0', '0', '妇科病4,妇科病3', '优势优势优势优势优势优势', '药效说明药效说明药效说明药效说明', '注意事项注意事项注意事项注意事项', '10.00', '1', '10', '5.00', '共#10#剂，每日#1#剂，1剂分#1#次使用  ', 'W1sxNywiXHU1MjM2XHU1ZGRkXHU0ZTRjIiw0LCJnIl0sWzMxNSwiXHU3MTlmXHU5NjQ0XHU3MjQ3IiwzMCwiZyJdLFs0ODUsIlx1NmNkNVx1NTM0YVx1NTkwZiIsOTQsImciXV0=', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '0', '10', '1527076026', '1527076026');
INSERT INTO `jd_self_goods` VALUES ('11', '20180523692858', '感冒服务包2', '1', '2', '5', '5', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '2', '496.54', '4980.39', '1', '0', '1558612123', '0', '0', '妇科病4,妇科病3', '优势优势优势优势优势优势', '药效说明药效说明药效说明药效说明', '注意事项注意事项注意事项注意事项', '10.00', '1', '10', '5.00', '共#10#剂，每日#1#剂，1剂分#1#次使用  ', 'W1sxNywiXHU1MjM2XHU1ZGRkXHU0ZTRjIiw0LCJnIl0sWzMxNSwiXHU3MTlmXHU5NjQ0XHU3MjQ3IiwzMCwiZyJdLFs0ODUsIlx1NmNkNVx1NTM0YVx1NTkwZiIsOTQsImciXV0=', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '0', '10', '1527076123', '1527076123');
INSERT INTO `jd_self_goods` VALUES ('12', '20180524459099', '感冒服务包2', '1', '2', '5', '5', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '2', '496.54', '4980.39', '1', '0', '1558662622', '0', '0', '妇科病4,妇科病3', '优势优势优势优势优势优势', '药效说明药效说明药效说明药效说明', '注意事项注意事项注意事项注意事项', '10.00', '1', '10', '5.00', '共#10#剂，每日#1#剂，1剂分#1#次使用  ', 'W1sxNywiXHU1MjM2XHU1ZGRkXHU0ZTRjIiw0LCJnIl0sWzMxNSwiXHU3MTlmXHU5NjQ0XHU3MjQ3IiwzMCwiZyJdLFs0ODUsIlx1NmNkNVx1NTM0YVx1NTkwZiIsOTQsImciXV0=', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '0', '10', '1527126622', '1527126622');
INSERT INTO `jd_self_goods` VALUES ('13', '20180528448231', '感冒服务包223232', '1', '2', '5', '5', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '2', '496.54', '4980.39', '2', '0', '1559007270', '0', '1', '妇科病4,妇科病3', '优势优势优势优势优势优势', '药效说明药效说明药效说明药效说明', '注意事项注意事项注意事项注意事项', '10.00', '1', '10', '5.00', '共#10#剂，每日#1#剂，1剂分#1#次使用  ', 'W1sxNywiXHU1MjM2XHU1ZGRkXHU0ZTRjIiw0LCJnIl0sWzMxNSwiXHU3MTlmXHU5NjQ0XHU3MjQ3IiwzMCwiZyJdLFs0ODUsIlx1NmNkNVx1NTM0YVx1NTkwZiIsOTQsImciXV0=', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '0', '1527836808', '1527471270', '1527836808');
INSERT INTO `jd_self_goods` VALUES ('14', '20180529432585', 'android.support.v7.widget.AppCompatEditText{540e8 VFED..CL. ........ 644,45-945,94 #7f0803f4 app:id/tv_name}', '0', '0', '5', '5', '[[8,\"制半夏\",1,\"g\"]]', '2', '0.37', '7.00', '1', '0', '1559139025', '0', '0', '111111,22222222222,33333', 'android android', '1111111111111111111111111111', '22222222222222222222222222222', '7.00', '0', '0', '0.00', '0', 'W1sxNywiXHU1MjM2XHU1ZGRkXHU0ZTRjIiw0LCJnIl0sWzMxNSwiXHU3MTlmXHU5NjQ0XHU3MjQ3IiwzMCwiZyJdLFs0ODUsIlx1NmNkNVx1NTM0YVx1NTkwZiIsOTQsImciXV0=', '0', '', '0', '10', '1527603025', '1527603025');
INSERT INTO `jd_self_goods` VALUES ('15', '20180601412403', '感冒服务包2', '1', '2', '5', '5', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '2', '496.54', '4980.39', '1', '0', '1559376139', '0', '0', '妇科病4,妇科病3', '优势优势优势优势优势优势', '药效说明药效说明药效说明药效说明', '注意事项注意事项注意事项注意事项', '10.00', '1', '10', '5.00', '共#10#剂，每日#1#剂，1剂分#1#次使用  ', 'W1sxNywiXHU1MjM2XHU1ZGRkXHU0ZTRjIiw0LCJnIl0sWzMxNSwiXHU3MTlmXHU5NjQ0XHU3MjQ3IiwzMCwiZyJdLFs0ODUsIlx1NmNkNVx1NTM0YVx1NTkwZiIsOTQsImciXV0=', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '0', '10', '1527840139', '1527840139');
INSERT INTO `jd_self_goods` VALUES ('16', '20180601234766', 'wwww', '2', '2', '5', '5', '[[17,\"制川乌\",4,\"g\"],[315,\"熟附片\",30,\"g\"],[485,\"法半夏\",94,\"g\"]]', '2', '496.54', '9444.24', '1', '0', '1559377094', '0', '0', 'w', 'We', 'Did', 'Ddd', '5.00', '1', '19', '5.00', '\\U5171#10#\\U5242\\Uff0c\\U6bcf\\U65e5#1#\\U5242\\Uff0c1\\U5242\\U5206#1#\\U6b21\\U4f7f\\U7528', 'W1sxNywi5Yi25bed5LmMIiw0LCJnIl0sWzMxNSwi54af6ZmE54mHIiwzMCwiZyJdLFs0ODUsIuazleWNiuWkjyIsOTQsImciXV0=', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '0', '10', '1527841094', '1527841094');
INSERT INTO `jd_self_goods` VALUES ('17', '20180601792202', '2', '3', '2', '5', '5', '[[17,\"制川乌\",4,\"g\"],[315,\"熟附片\",30,\"g\"],[485,\"法半夏\",94,\"g\"],[10,\"蜜紫菀\",22,\"g\"]]', '2', '498.05', '508.05', '1', '0', '1559379141', '0', '0', '请填写治疗范围', '2', '2', '3', '5.00', '0', '1', '5.00', '共#10#剂，每日#1#剂，1剂分#1#次使用', 'W1sxNywi5Yi25bed5LmMIiw0LCJnIl0sWzMxNSwi54af6ZmE54mHIiwzMCwiZyJdLFs0ODUsIuazleWNiuWkjyIsOTQsImciXV0=', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '0', '10', '1527843141', '1527843141');
INSERT INTO `jd_self_goods` VALUES ('18', '20180602779912', '专治失眠', '3', '2', '5', '5', '[[17,\"制川乌\",4,\"g\"],[315,\"熟附片\",30,\"g\"],[485,\"法半夏\",94,\"g\"],[24,\"山豆根\",1,\"g\"]]', '25', '497.05', '507.05', '1', '0', '1559416068', '0', '0', '幸福感', '发广告', '史蒂夫', '大概半年', '5.00', '0', '1', '5.00', '共#10#剂，每日#1#剂，1剂分#1#次使用', 'W1sxNywi5Yi25bed5LmMIiw0LCJnIl0sWzMxNSwi54af6ZmE54mHIiwzMCwiZyJdLFs0ODUsIuazleWNiuWkjyIsOTQsImciXV0=', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '0', '10', '1527880068', '1527880068');
INSERT INTO `jd_self_goods` VALUES ('19', '20180602939980', 'did', '3', '2', '5', '5', '[[17,\"制川乌\",4,\"g\"],[315,\"熟附片\",30,\"g\"],[485,\"法半夏\",94,\"g\"],[10,\"蜜紫菀\",222,\"g\"]]', '2', '511.81', '521.81', '1', '0', '1559425276', '0', '0', '2', 'Ddd', '2', '2', '5.00', '0', '1', '5.00', '共#10#剂，每日#1#剂，1剂分#1#次使用', 'W1sxNywi5Yi25bed5LmMIiw0LCJnIl0sWzMxNSwi54af6ZmE54mHIiwzMCwiZyJdLFs0ODUsIuazleWNiuWkjyIsOTQsImciXV0=', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '0', '10', '1527889276', '1527889276');
INSERT INTO `jd_self_goods` VALUES ('20', '20180602861499', '2222222', '2', '2', '5', '5', '[[17,\"制川乌\",4,\"g\"],[315,\"熟附片\",30,\"g\"],[485,\"法半夏\",94,\"g\"]]', '2', '496.54', '1003.08', '1', '0', '1559425382', '0', '0', '2222', '2222', '2', '2', '5.00', '0', '2', '5.00', '共#10#剂，每日#1#剂，1剂分#1#次使用', 'W1sxNywi5Yi25bed5LmMIiw0LCJnIl0sWzMxNSwi54af6ZmE54mHIiwzMCwiZyJdLFs0ODUsIuazleWNiuWkjyIsOTQsImciXV0=', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '0', '10', '1527889382', '1527889382');
INSERT INTO `jd_self_goods` VALUES ('21', '20180602566140', '22', '2', '2', '5', '5', '[[17,\"制川乌\",4,\"g\"],[315,\"熟附片\",30,\"g\"],[485,\"法半夏\",94,\"g\"]]', '2', '496.54', '1003.08', '1', '0', '1559425484', '0', '0', '222', '222', '22', '222', '5.00', '0', '2', '5.00', '共#10#剂，每日#1#剂，1剂分#1#次使用', 'W1sxNywi5Yi25bed5LmMIiw0LCJnIl0sWzMxNSwi54af6ZmE54mHIiwzMCwiZyJdLFs0ODUsIuazleWNiuWkjyIsOTQsImciXV0=', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '0', '10', '1527889484', '1527889484');
INSERT INTO `jd_self_goods` VALUES ('22', '20180602877368', '文化建设', '3', '2', '5', '5', '[[17,\"制川乌\",4,\"g\"],[315,\"熟附片\",30,\"g\"],[485,\"法半夏\",94,\"g\"],[17,\"制川乌\",4,\"g\"],[315,\"熟附片\",30,\"g\"],[485,\"法半夏\",94,\"g\"]]', '25', '993.08', '1003.08', '1', '0', '1559466675', '0', '0', '今生今世', '三餐', 'vb', '女奴', '5.00', '0', '1', '5.00', '共#10#剂，每日#1#剂，1剂分#1#次使用', 'W1sxNywi5Yi25bed5LmMIiw0LCJnIl0sWzMxNSwi54af6ZmE54mHIiwzMCwiZyJdLFs0ODUsIuazleWNiuWkjyIsOTQsImciXSxbMTcsIuWItuW3neS5jCIsNCwiZyJdLFszMTUsIueGn+mZhOeJhyIsMzAsImciXSxbNDg1LCLms5XljYrlpI8iLDk0LCJnIl1d', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"],[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '0', '10', '1527930675', '1527930675');
INSERT INTO `jd_self_goods` VALUES ('23', '20180603801149', '包治百病', '0', '0', '5', '5', '[[6,\"蜜麸炒木香\",3,\"g\"],[4,\"川牛膝\",1,\"g\"]]', '26', '0.21', '10.21', '1', '0', '1559546052', '0', '0', '感冒,发烧,流鼻涕,头晕,没精神', '历经敏敏莫名名民工你敏肌 logo 红你明明功能敏你敏公民命名积极积极进攻你敏肌力咯公积金你你敏京民工你改密码', 'from', 'mason ', '5.00', '0', '1', '5.00', '共#10#剂，每日#1#剂，1剂分#1#次使用', '', '0', '', '0', '10', '1528010052', '1528010052');

-- ----------------------------
-- Table structure for jd_service_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `jd_service_evaluation`;
CREATE TABLE `jd_service_evaluation` (
  `evaluation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '患者id',
  `doctor_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生id',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `symptom` varchar(255) NOT NULL DEFAULT '' COMMENT '医生为你诊断的病症或不适症状',
  `evaluate` int(3) NOT NULL DEFAULT '0' COMMENT '评价级别 0 很满意 1 满意 2 还可以',
  `evaluate_name` varchar(255) NOT NULL DEFAULT '' COMMENT '评价内容 多个级别中间用#@#连接',
  `synopsis` varchar(255) NOT NULL DEFAULT '' COMMENT '填写评价',
  `is_show` int(3) NOT NULL DEFAULT '0' COMMENT '是否医生页面显示 1 显示',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '管理员最后操作时间',
  PRIMARY KEY (`evaluation_id`),
  KEY `member_id` (`member_id`),
  KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户服务评价表';

-- ----------------------------
-- Records of jd_service_evaluation
-- ----------------------------
INSERT INTO `jd_service_evaluation` VALUES ('1', '1', '2', '1', '', '0', 'c#@#2好33', '', '1', '1524901735', '0', '0');
INSERT INTO `jd_service_evaluation` VALUES ('2', '1', '2', '1', '', '0', '1#@#2#@#2', '', '1', '1524901735', '1', '1524901735');

-- ----------------------------
-- Table structure for jd_sheet
-- ----------------------------
DROP TABLE IF EXISTS `jd_sheet`;
CREATE TABLE `jd_sheet` (
  `sheet_id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type_id` int(8) NOT NULL COMMENT 'ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `member_id` int(9) NOT NULL DEFAULT '0' COMMENT '医生id',
  `list` text NOT NULL COMMENT '题目的json字符串',
  `sort` int(5) NOT NULL DEFAULT '0' COMMENT '权重 倒序',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 不显示1显示',
  `release_date` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `patient_id` int(11) NOT NULL DEFAULT '0' COMMENT '患者的member_id',
  PRIMARY KEY (`sheet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='问诊单表';

-- ----------------------------
-- Records of jd_sheet
-- ----------------------------
INSERT INTO `jd_sheet` VALUES ('28', '2', '这里是标题2', '2', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"dasda33s\",\"title\":\"dads\",\"type\":\"0\"},{\"answer\":\"\",\"answerStr\":\"1,2,3,4\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"dads\",\"type\":\"1\"},{\"answer\":\"\",\"answerStr\":\"a,v,c,d,e,f\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"333\",\"type\":\"2\"},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"22\",\"type\":\"3\"}]', '0', '1527845372', '1', '1527845556', '0');
INSERT INTO `jd_sheet` VALUES ('35', '4', '呵呵', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1}]', '0', '1527868223', '1', '1527868223', '0');
INSERT INTO `jd_sheet` VALUES ('36', '4', '呵呵', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1}]', '0', '1527868223', '1', '1527868223', '0');
INSERT INTO `jd_sheet` VALUES ('37', '4', '呵呵', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1}]', '0', '1527868225', '1', '1527868225', '0');
INSERT INTO `jd_sheet` VALUES ('38', '4', '呵呵', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1}]', '0', '1527868226', '1', '1527868226', '0');
INSERT INTO `jd_sheet` VALUES ('39', '4', '呵呵', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1}]', '0', '1527868227', '1', '1527868227', '0');
INSERT INTO `jd_sheet` VALUES ('40', '4', '呵呵', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1}]', '0', '1527868227', '1', '1527868227', '0');
INSERT INTO `jd_sheet` VALUES ('41', '4', '呵呵', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1}]', '0', '1527868227', '1', '1527868227', '0');
INSERT INTO `jd_sheet` VALUES ('42', '4', '呵呵', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1}]', '0', '1527868228', '1', '1527868228', '0');
INSERT INTO `jd_sheet` VALUES ('43', '4', '呵呵', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1}]', '0', '1527868228', '1', '1527868228', '0');
INSERT INTO `jd_sheet` VALUES ('44', '4', '呵呵', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1}]', '0', '1527868229', '1', '1527868229', '0');
INSERT INTO `jd_sheet` VALUES ('45', '4', '呵呵', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1}]', '0', '1527868229', '1', '1527868229', '0');
INSERT INTO `jd_sheet` VALUES ('46', '4', '呵呵', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1}]', '0', '1527868230', '1', '1527868230', '0');
INSERT INTO `jd_sheet` VALUES ('47', '4', '呵呵', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1}]', '0', '1527868230', '1', '1527868230', '0');
INSERT INTO `jd_sheet` VALUES ('48', '4', '呵呵', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1}]', '0', '1527868239', '1', '1527868239', '0');
INSERT INTO `jd_sheet` VALUES ('49', '4', '呵呵', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1}]', '0', '1527868240', '1', '1527868240', '0');
INSERT INTO `jd_sheet` VALUES ('50', '4', '呵呵', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1}]', '0', '1527868244', '1', '1527868244', '0');
INSERT INTO `jd_sheet` VALUES ('51', '4', '呵呵', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1}]', '0', '1527868246', '1', '1527868246', '0');
INSERT INTO `jd_sheet` VALUES ('52', '4', '呵呵', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1}]', '0', '1527868269', '1', '1527868269', '0');
INSERT INTO `jd_sheet` VALUES ('53', '4', '呵呵', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"可以\",\"title\":\"不错\",\"type\":0},{\"answer\":\"\",\"answerStr\":\"漂亮\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"厉害\",\"type\":1}]', '0', '1527868270', '1', '1527868270', '0');
INSERT INTO `jd_sheet` VALUES ('54', '4', '辣子', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3}]', '0', '1527868781', '1', '1527868781', '0');
INSERT INTO `jd_sheet` VALUES ('55', '4', '辣子', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3}]', '0', '1527868783', '1', '1527868783', '0');
INSERT INTO `jd_sheet` VALUES ('56', '4', '辣子', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3}]', '0', '1527868784', '1', '1527868784', '0');
INSERT INTO `jd_sheet` VALUES ('57', '4', '辣子', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3}]', '0', '1527868784', '1', '1527868784', '0');
INSERT INTO `jd_sheet` VALUES ('58', '4', '辣子', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3}]', '0', '1527868784', '1', '1527868784', '0');
INSERT INTO `jd_sheet` VALUES ('59', '4', '辣子', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3}]', '0', '1527868784', '1', '1527868784', '0');
INSERT INTO `jd_sheet` VALUES ('60', '4', '辣子', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3}]', '0', '1527868785', '1', '1527868785', '0');
INSERT INTO `jd_sheet` VALUES ('61', '4', '辣子', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3}]', '0', '1527868785', '1', '1527868785', '0');
INSERT INTO `jd_sheet` VALUES ('62', '4', '辣子', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"哈哈\",\"type\":3}]', '0', '1527868786', '1', '1527868786', '0');
INSERT INTO `jd_sheet` VALUES ('63', '4', 'gybbg', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}]', '0', '1527868845', '1', '1527868845', '0');
INSERT INTO `jd_sheet` VALUES ('64', '4', 'gybbg', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}]', '0', '1527868846', '1', '1527868846', '0');
INSERT INTO `jd_sheet` VALUES ('65', '4', 'gybbg', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}]', '0', '1527868847', '1', '1527868847', '0');
INSERT INTO `jd_sheet` VALUES ('66', '4', 'gybbg', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}]', '0', '1527868847', '1', '1527868847', '0');
INSERT INTO `jd_sheet` VALUES ('67', '4', 'gybbg', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}]', '0', '1527868847', '1', '1527868847', '0');
INSERT INTO `jd_sheet` VALUES ('68', '4', 'gybbg', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}]', '0', '1527868847', '1', '1527868847', '0');
INSERT INTO `jd_sheet` VALUES ('69', '4', 'gybbg', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}]', '0', '1527868848', '1', '1527868848', '0');
INSERT INTO `jd_sheet` VALUES ('70', '4', 'gybbg', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}]', '0', '1527868869', '1', '1527868869', '0');
INSERT INTO `jd_sheet` VALUES ('71', '4', 'gybbg', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}]', '0', '1527868870', '1', '1527868870', '0');
INSERT INTO `jd_sheet` VALUES ('72', '4', 'gybbg', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}]', '0', '1527868871', '1', '1527868871', '0');
INSERT INTO `jd_sheet` VALUES ('73', '4', 'gybbg', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}]', '0', '1527868871', '1', '1527868871', '0');
INSERT INTO `jd_sheet` VALUES ('74', '4', 'gybbg', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}]', '0', '1527868872', '1', '1527868872', '0');
INSERT INTO `jd_sheet` VALUES ('75', '4', 'gybbg', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}]', '0', '1527868872', '1', '1527868872', '0');
INSERT INTO `jd_sheet` VALUES ('76', '4', 'gybbg', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}]', '0', '1527868883', '1', '1527868883', '0');
INSERT INTO `jd_sheet` VALUES ('77', '4', 'gybbg', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}]', '0', '1527868883', '1', '1527868883', '0');
INSERT INTO `jd_sheet` VALUES ('78', '4', 'gybbg', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}]', '0', '1527868884', '1', '1527868884', '0');
INSERT INTO `jd_sheet` VALUES ('79', '4', 'gybbg', '26', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}]', '0', '1527868884', '1', '1527868884', '0');
INSERT INTO `jd_sheet` VALUES ('80', '4', '测试', '25', '[{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"赵贝贝\",\"title\":\"风格化\",\"type\":\"0\"},{\"answer\":\"\",\"answerStr\":\"中国绘画,房管局,带回家\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"想回家\",\"type\":\"1\"},{\"answer\":\"\",\"answerStr\":\"独孤九剑,消费环境,生产\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"徐锦江\",\"type\":\"2\"},{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"放寒假\",\"type\":\"3\"}]', '0', '1527877801', '1', '1527877801', '0');

-- ----------------------------
-- Table structure for jd_sheet_question
-- ----------------------------
DROP TABLE IF EXISTS `jd_sheet_question`;
CREATE TABLE `jd_sheet_question` (
  `question_id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sheet_id` int(8) NOT NULL COMMENT 'ID',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `release_date` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `question_json` text NOT NULL COMMENT '每道题目的json',
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=871 DEFAULT CHARSET=utf8 COMMENT='问诊单题目表';

-- ----------------------------
-- Records of jd_sheet_question
-- ----------------------------
INSERT INTO `jd_sheet_question` VALUES ('15', '28', '1527845556', '1527845556', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"dasda33s\",\"title\":\"dads\",\"type\":\"0\"}');
INSERT INTO `jd_sheet_question` VALUES ('16', '28', '1527845556', '1527845556', '{\"answer\":\"\",\"answerStr\":\"1,2,3,4\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"dads\",\"type\":\"1\"}');
INSERT INTO `jd_sheet_question` VALUES ('17', '28', '1527845556', '1527845556', '{\"answer\":\"\",\"answerStr\":\"a,v,c,d,e,f\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"333\",\"type\":\"2\"}');
INSERT INTO `jd_sheet_question` VALUES ('18', '28', '1527845556', '1527845556', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"22\",\"type\":\"3\"}');
INSERT INTO `jd_sheet_question` VALUES ('19', '29', '1527868219', '1527868219', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('20', '29', '1527868219', '1527868219', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('21', '30', '1527868220', '1527868220', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('22', '30', '1527868220', '1527868220', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('23', '30', '1527868220', '1527868220', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('24', '30', '1527868220', '1527868220', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('25', '31', '1527868221', '1527868221', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('26', '31', '1527868221', '1527868221', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('27', '31', '1527868221', '1527868221', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('28', '31', '1527868221', '1527868221', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('29', '31', '1527868221', '1527868221', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('30', '31', '1527868221', '1527868221', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('31', '32', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('32', '32', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('33', '32', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('34', '32', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('35', '32', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('36', '32', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('37', '32', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('38', '32', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('39', '33', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('40', '33', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('41', '33', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('42', '33', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('43', '33', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('44', '33', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('45', '33', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('46', '33', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('47', '33', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('48', '33', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('49', '34', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('50', '34', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('51', '34', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('52', '34', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('53', '34', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('54', '34', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('55', '34', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('56', '34', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('57', '34', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('58', '34', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('59', '34', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('60', '34', '1527868222', '1527868222', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('61', '35', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('62', '35', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('63', '35', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('64', '35', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('65', '35', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('66', '35', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('67', '35', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('68', '35', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('69', '35', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('70', '35', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('71', '35', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('72', '35', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('73', '35', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('74', '35', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('75', '36', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('76', '36', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('77', '36', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('78', '36', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('79', '36', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('80', '36', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('81', '36', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('82', '36', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('83', '36', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('84', '36', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('85', '36', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('86', '36', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('87', '36', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('88', '36', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('89', '36', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('90', '36', '1527868223', '1527868223', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('91', '37', '1527868225', '1527868225', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('92', '37', '1527868225', '1527868225', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('93', '37', '1527868225', '1527868225', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('94', '37', '1527868225', '1527868225', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('95', '37', '1527868225', '1527868225', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('96', '37', '1527868225', '1527868225', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('97', '37', '1527868225', '1527868225', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('98', '37', '1527868225', '1527868225', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('99', '37', '1527868225', '1527868225', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('100', '37', '1527868225', '1527868225', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('101', '37', '1527868225', '1527868225', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('102', '37', '1527868225', '1527868225', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('103', '37', '1527868225', '1527868225', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('104', '37', '1527868225', '1527868225', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('105', '37', '1527868225', '1527868225', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('106', '37', '1527868225', '1527868225', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('107', '37', '1527868225', '1527868225', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('108', '37', '1527868225', '1527868225', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('109', '38', '1527868226', '1527868226', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('110', '38', '1527868226', '1527868226', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('111', '38', '1527868226', '1527868226', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('112', '38', '1527868226', '1527868226', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('113', '38', '1527868226', '1527868226', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('114', '38', '1527868226', '1527868226', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('115', '38', '1527868226', '1527868226', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('116', '38', '1527868226', '1527868226', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('117', '38', '1527868226', '1527868226', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('118', '38', '1527868226', '1527868226', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('119', '38', '1527868226', '1527868226', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('120', '38', '1527868226', '1527868226', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('121', '38', '1527868226', '1527868226', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('122', '38', '1527868226', '1527868226', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('123', '38', '1527868226', '1527868226', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('124', '38', '1527868226', '1527868226', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('125', '38', '1527868226', '1527868226', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('126', '38', '1527868226', '1527868226', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('127', '38', '1527868226', '1527868226', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('128', '38', '1527868226', '1527868226', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('129', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('130', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('131', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('132', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('133', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('134', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('135', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('136', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('137', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('138', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('139', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('140', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('141', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('142', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('143', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('144', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('145', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('146', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('147', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('148', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('149', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('150', '39', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('151', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('152', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('153', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('154', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('155', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('156', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('157', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('158', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('159', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('160', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('161', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('162', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('163', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('164', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('165', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('166', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('167', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('168', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('169', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('170', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('171', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('172', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('173', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('174', '40', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('175', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('176', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('177', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('178', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('179', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('180', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('181', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('182', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('183', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('184', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('185', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('186', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('187', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('188', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('189', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('190', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('191', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('192', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('193', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('194', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('195', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('196', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('197', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('198', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('199', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('200', '41', '1527868227', '1527868227', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('201', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('202', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('203', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('204', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('205', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('206', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('207', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('208', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('209', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('210', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('211', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('212', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('213', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('214', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('215', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('216', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('217', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('218', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('219', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('220', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('221', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('222', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('223', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('224', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('225', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('226', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('227', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('228', '42', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('229', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('230', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('231', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('232', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('233', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('234', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('235', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('236', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('237', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('238', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('239', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('240', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('241', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('242', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('243', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('244', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('245', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('246', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('247', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('248', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('249', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('250', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('251', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('252', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('253', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('254', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('255', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('256', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('257', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('258', '43', '1527868228', '1527868228', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('259', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('260', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('261', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('262', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('263', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('264', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('265', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('266', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('267', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('268', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('269', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('270', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('271', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('272', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('273', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('274', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('275', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('276', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('277', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('278', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('279', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('280', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('281', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('282', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('283', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('284', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('285', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('286', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('287', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('288', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('289', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('290', '44', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('291', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('292', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('293', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('294', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('295', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('296', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('297', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('298', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('299', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('300', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('301', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('302', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('303', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('304', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('305', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('306', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('307', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('308', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('309', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('310', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('311', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('312', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('313', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('314', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('315', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('316', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('317', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('318', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('319', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('320', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('321', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('322', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('323', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('324', '45', '1527868229', '1527868229', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('325', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('326', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('327', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('328', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('329', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('330', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('331', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('332', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('333', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('334', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('335', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('336', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('337', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('338', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('339', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('340', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('341', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('342', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('343', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('344', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('345', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('346', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('347', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('348', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('349', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('350', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('351', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('352', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('353', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('354', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('355', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('356', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('357', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('358', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('359', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('360', '46', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('361', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('362', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('363', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('364', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('365', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('366', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('367', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('368', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('369', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('370', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('371', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('372', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('373', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('374', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('375', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('376', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('377', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('378', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('379', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('380', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('381', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('382', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('383', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('384', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('385', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('386', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('387', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('388', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('389', '47', '1527868230', '1527868230', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('390', '47', '1527868231', '1527868231', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('391', '47', '1527868231', '1527868231', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('392', '47', '1527868231', '1527868231', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('393', '47', '1527868231', '1527868231', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('394', '47', '1527868231', '1527868231', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('395', '47', '1527868231', '1527868231', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('396', '47', '1527868231', '1527868231', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('397', '47', '1527868231', '1527868231', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('398', '47', '1527868231', '1527868231', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('399', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('400', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('401', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('402', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('403', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('404', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('405', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('406', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('407', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('408', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('409', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('410', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('411', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('412', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('413', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('414', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('415', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('416', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('417', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('418', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('419', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('420', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('421', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('422', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('423', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('424', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('425', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('426', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('427', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('428', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('429', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('430', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('431', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('432', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('433', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('434', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('435', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('436', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('437', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('438', '48', '1527868239', '1527868239', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('439', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('440', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('441', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('442', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('443', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('444', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('445', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('446', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('447', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('448', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('449', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('450', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('451', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('452', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('453', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('454', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('455', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('456', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('457', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('458', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('459', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('460', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('461', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('462', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('463', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('464', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('465', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('466', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('467', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('468', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('469', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('470', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('471', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('472', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('473', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('474', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('475', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('476', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('477', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('478', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('479', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('480', '49', '1527868240', '1527868240', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('481', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('482', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('483', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('484', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('485', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('486', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('487', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('488', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('489', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('490', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('491', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('492', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('493', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('494', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('495', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('496', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('497', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('498', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('499', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('500', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('501', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('502', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('503', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('504', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('505', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('506', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('507', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('508', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('509', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('510', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('511', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('512', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('513', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('514', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('515', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('516', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('517', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('518', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('519', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('520', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('521', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('522', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('523', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('524', '50', '1527868244', '1527868244', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('525', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('526', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('527', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('528', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('529', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('530', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('531', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('532', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('533', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('534', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('535', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('536', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('537', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('538', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('539', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('540', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('541', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('542', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('543', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('544', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('545', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('546', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('547', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('548', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('549', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('550', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('551', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('552', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('553', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('554', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('555', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('556', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('557', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('558', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('559', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('560', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('561', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('562', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('563', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('564', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('565', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('566', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('567', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('568', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('569', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('570', '51', '1527868246', '1527868246', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('571', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('572', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('573', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('574', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('575', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('576', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('577', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('578', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('579', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('580', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('581', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('582', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('583', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('584', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('585', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('586', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('587', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('588', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('589', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('590', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('591', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('592', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('593', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('594', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('595', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('596', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('597', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('598', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('599', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('600', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('601', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('602', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('603', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('604', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('605', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('606', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('607', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('608', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('609', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('610', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('611', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('612', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('613', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('614', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('615', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('616', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('617', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('618', '52', '1527868269', '1527868269', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('619', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('620', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('621', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('622', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('623', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('624', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('625', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('626', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('627', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('628', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('629', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('630', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('631', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('632', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('633', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('634', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('635', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('636', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('637', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('638', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('639', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('640', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('641', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('642', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('643', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('644', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('645', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('646', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('647', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('648', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('649', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('650', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('651', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('652', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('653', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('654', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('655', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('656', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('657', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('658', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('659', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('660', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('661', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('662', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('663', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('664', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('665', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('666', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('667', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u53ef\\u4ee5\",\"title\":\"\\u4e0d\\u9519\",\"type\":0}');
INSERT INTO `jd_sheet_question` VALUES ('668', '53', '1527868270', '1527868270', '{\"answer\":\"\",\"answerStr\":\"\\u6f02\\u4eae\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5389\\u5bb3\",\"type\":1}');
INSERT INTO `jd_sheet_question` VALUES ('669', '54', '1527868781', '1527868781', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('670', '55', '1527868783', '1527868783', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('671', '55', '1527868783', '1527868783', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('672', '56', '1527868784', '1527868784', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('673', '56', '1527868784', '1527868784', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('674', '56', '1527868784', '1527868784', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('675', '57', '1527868784', '1527868784', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('676', '57', '1527868784', '1527868784', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('677', '57', '1527868784', '1527868784', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('678', '57', '1527868784', '1527868784', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('679', '58', '1527868784', '1527868784', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('680', '58', '1527868784', '1527868784', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('681', '58', '1527868784', '1527868784', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('682', '58', '1527868784', '1527868784', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('683', '58', '1527868784', '1527868784', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('684', '59', '1527868784', '1527868784', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('685', '59', '1527868784', '1527868784', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('686', '59', '1527868784', '1527868784', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('687', '59', '1527868784', '1527868784', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('688', '59', '1527868784', '1527868784', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('689', '59', '1527868784', '1527868784', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('690', '60', '1527868785', '1527868785', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('691', '60', '1527868785', '1527868785', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('692', '60', '1527868785', '1527868785', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('693', '60', '1527868785', '1527868785', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('694', '60', '1527868785', '1527868785', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('695', '60', '1527868785', '1527868785', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('696', '60', '1527868785', '1527868785', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('697', '61', '1527868785', '1527868785', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('698', '61', '1527868785', '1527868785', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('699', '61', '1527868785', '1527868785', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('700', '61', '1527868785', '1527868785', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('701', '61', '1527868785', '1527868785', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('702', '61', '1527868785', '1527868785', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('703', '61', '1527868785', '1527868785', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('704', '61', '1527868785', '1527868785', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('705', '62', '1527868786', '1527868786', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('706', '62', '1527868786', '1527868786', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('707', '62', '1527868786', '1527868786', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('708', '62', '1527868786', '1527868786', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('709', '62', '1527868786', '1527868786', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('710', '62', '1527868786', '1527868786', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('711', '62', '1527868786', '1527868786', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('712', '62', '1527868786', '1527868786', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('713', '62', '1527868786', '1527868786', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u54c8\\u54c8\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('714', '63', '1527868845', '1527868845', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('715', '64', '1527868846', '1527868846', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('716', '64', '1527868846', '1527868846', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('717', '65', '1527868847', '1527868847', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('718', '65', '1527868847', '1527868847', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('719', '65', '1527868847', '1527868847', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('720', '66', '1527868847', '1527868847', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('721', '66', '1527868847', '1527868847', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('722', '66', '1527868847', '1527868847', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('723', '66', '1527868847', '1527868847', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('724', '67', '1527868847', '1527868847', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('725', '67', '1527868847', '1527868847', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('726', '67', '1527868847', '1527868847', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('727', '67', '1527868847', '1527868847', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('728', '67', '1527868847', '1527868847', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('729', '68', '1527868847', '1527868847', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('730', '68', '1527868847', '1527868847', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('731', '68', '1527868847', '1527868847', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('732', '68', '1527868847', '1527868847', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('733', '68', '1527868847', '1527868847', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('734', '68', '1527868848', '1527868848', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('735', '69', '1527868848', '1527868848', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('736', '69', '1527868848', '1527868848', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('737', '69', '1527868848', '1527868848', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('738', '69', '1527868848', '1527868848', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('739', '69', '1527868848', '1527868848', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('740', '69', '1527868848', '1527868848', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('741', '69', '1527868848', '1527868848', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('742', '70', '1527868869', '1527868869', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('743', '70', '1527868869', '1527868869', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('744', '70', '1527868869', '1527868869', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('745', '70', '1527868869', '1527868869', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('746', '70', '1527868869', '1527868869', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('747', '70', '1527868869', '1527868869', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('748', '70', '1527868869', '1527868869', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('749', '70', '1527868869', '1527868869', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('750', '71', '1527868870', '1527868870', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('751', '71', '1527868870', '1527868870', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('752', '71', '1527868870', '1527868870', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('753', '71', '1527868870', '1527868870', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('754', '71', '1527868870', '1527868870', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('755', '71', '1527868870', '1527868870', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('756', '71', '1527868870', '1527868870', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('757', '71', '1527868870', '1527868870', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('758', '71', '1527868870', '1527868870', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('759', '72', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('760', '72', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('761', '72', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('762', '72', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('763', '72', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('764', '72', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('765', '72', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('766', '72', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('767', '72', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('768', '72', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('769', '73', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('770', '73', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('771', '73', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('772', '73', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('773', '73', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('774', '73', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('775', '73', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('776', '73', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('777', '73', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('778', '73', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('779', '73', '1527868871', '1527868871', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('780', '74', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('781', '74', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('782', '74', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('783', '74', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('784', '74', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('785', '74', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('786', '74', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('787', '74', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('788', '74', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('789', '74', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('790', '74', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('791', '74', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('792', '75', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('793', '75', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('794', '75', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('795', '75', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('796', '75', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('797', '75', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('798', '75', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('799', '75', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('800', '75', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('801', '75', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('802', '75', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('803', '75', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('804', '75', '1527868872', '1527868872', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('805', '76', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('806', '76', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('807', '76', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('808', '76', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('809', '76', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('810', '76', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('811', '76', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('812', '76', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('813', '76', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('814', '76', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('815', '76', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('816', '76', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('817', '76', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('818', '76', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('819', '77', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('820', '77', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('821', '77', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('822', '77', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('823', '77', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('824', '77', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('825', '77', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('826', '77', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('827', '77', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('828', '77', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('829', '77', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('830', '77', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('831', '77', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('832', '77', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('833', '77', '1527868883', '1527868883', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('834', '78', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('835', '78', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('836', '78', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('837', '78', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('838', '78', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('839', '78', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('840', '78', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('841', '78', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('842', '78', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('843', '78', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('844', '78', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('845', '78', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('846', '78', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('847', '78', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('848', '78', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('849', '78', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('850', '79', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('851', '79', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('852', '79', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('853', '79', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('854', '79', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('855', '79', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('856', '79', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('857', '79', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('858', '79', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('859', '79', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('860', '79', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('861', '79', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('862', '79', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('863', '79', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('864', '79', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('865', '79', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('866', '79', '1527868884', '1527868884', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"oo\",\"type\":3}');
INSERT INTO `jd_sheet_question` VALUES ('867', '80', '1527877801', '1527877801', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\\u8d75\\u8d1d\\u8d1d\",\"title\":\"\\u98ce\\u683c\\u5316\",\"type\":\"0\"}');
INSERT INTO `jd_sheet_question` VALUES ('868', '80', '1527877801', '1527877801', '{\"answer\":\"\",\"answerStr\":\"\\u4e2d\\u56fd\\u7ed8\\u753b,\\u623f\\u7ba1\\u5c40,\\u5e26\\u56de\\u5bb6\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u60f3\\u56de\\u5bb6\",\"type\":\"1\"}');
INSERT INTO `jd_sheet_question` VALUES ('869', '80', '1527877801', '1527877801', '{\"answer\":\"\",\"answerStr\":\"\\u72ec\\u5b64\\u4e5d\\u5251,\\u6d88\\u8d39\\u73af\\u5883,\\u751f\\u4ea7\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u5f90\\u9526\\u6c5f\",\"type\":\"2\"}');
INSERT INTO `jd_sheet_question` VALUES ('870', '80', '1527877801', '1527877801', '{\"answer\":\"\",\"answerStr\":\"\",\"selectStr\":\"\",\"srcs\":\"\",\"tip\":\"\",\"title\":\"\\u653e\\u5bd2\\u5047\",\"type\":\"3\"}');

-- ----------------------------
-- Table structure for jd_sheet_type
-- ----------------------------
DROP TABLE IF EXISTS `jd_sheet_type`;
CREATE TABLE `jd_sheet_type` (
  `type_id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '类型名称',
  `sort` int(5) NOT NULL DEFAULT '0' COMMENT '权重 倒序',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 不显示1显示',
  `release_date` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='问诊单类型表';

-- ----------------------------
-- Records of jd_sheet_type
-- ----------------------------
INSERT INTO `jd_sheet_type` VALUES ('1', '小孩问诊单', '1', '1558611371', '1', '1558611371');
INSERT INTO `jd_sheet_type` VALUES ('2', '青年人问诊单', '2', '1558611371', '1', '1558611371');
INSERT INTO `jd_sheet_type` VALUES ('3', '壮年人问诊单', '3', '1558611371', '1', '1558611371');
INSERT INTO `jd_sheet_type` VALUES ('4', '老年人问诊单', '4', '1558611371', '1', '1558611371');

-- ----------------------------
-- Table structure for jd_special
-- ----------------------------
DROP TABLE IF EXISTS `jd_special`;
CREATE TABLE `jd_special` (
  `special_id` int(8) NOT NULL AUTO_INCREMENT,
  `special_name` varchar(200) NOT NULL DEFAULT '' COMMENT '特色方剂名称',
  `inherit_id` varchar(8) NOT NULL DEFAULT '' COMMENT '所属传承id',
  `member_id` int(8) NOT NULL DEFAULT '0' COMMENT '医生id',
  `content` text NOT NULL COMMENT '特色方剂药品组成(json字符串)',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `service_str` varchar(255) NOT NULL DEFAULT '' COMMENT 'goodat表的疾病字符串 半角逗号拼接',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `release_date` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `aid` int(8) NOT NULL DEFAULT '1' COMMENT '管理员的id',
  `sort` int(5) NOT NULL DEFAULT '1' COMMENT '权重  倒序',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1使用  0不使用',
  `features` text NOT NULL COMMENT '特色简介',
  `taking` text NOT NULL COMMENT '服用说明',
  `effect` text NOT NULL COMMENT '方解(功效)',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`special_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='特色方剂表';

-- ----------------------------
-- Records of jd_special
-- ----------------------------
INSERT INTO `jd_special` VALUES ('1', '将军斩关汤1', '2', '2', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '2000.00', '痛经', '1525338780', '1525338902', '1', '1', '1', '补气血而驱余邪, 以通为主, 寓同为补', '红茶汁送服,日服一剂', '&lt;p&gt;\n	1213二人群q我去额q\n&lt;/p&gt;\n&lt;p&gt;\n	&amp;nbsp;我去额群恶趣味q\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;br /&gt;\n&lt;/p&gt;\n&lt;p&gt;\n	我去而我却二请问厄齐尔\n&lt;/p&gt;', '0');
INSERT INTO `jd_special` VALUES ('2', '将军斩关汤2', '2', '2', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '2000.00', '妇科病1,妇科病3', '1525338780', '1525338902', '1', '2', '1', '补气血而驱余邪, 以通为主, 寓同为补', '红茶汁送服,日服一剂', '&lt;p&gt;\n	1213二人群q我去额q\n&lt;/p&gt;\n&lt;p&gt;\n	&amp;nbsp;我去额群恶趣味q\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;br /&gt;\n&lt;/p&gt;\n&lt;p&gt;\n	我去而我却二请问厄齐尔\n&lt;/p&gt;', '0');
INSERT INTO `jd_special` VALUES ('3', '将军斩关汤3', '2', '2', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '2000.00', '妇科病1,妇科病4', '1525338780', '1525338902', '1', '3', '1', '补气血而驱余邪, 以通为主, 寓同为补', '红茶汁送服,日服一剂', '&lt;p&gt;\n	1213二人群q我去额q\n&lt;/p&gt;\n&lt;p&gt;\n	&amp;nbsp;我去额群恶趣味q\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;br /&gt;\n&lt;/p&gt;\n&lt;p&gt;\n	我去而我却二请问厄齐尔\n&lt;/p&gt;', '0');
INSERT INTO `jd_special` VALUES ('4', '将军斩关汤4', '3', '2', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '2000.00', '妇科病2,妇科病4', '1525338780', '1525338902', '1', '4', '1', '补气血而驱余邪, 以通为主, 寓同为补', '红茶汁送服,日服一剂', '&lt;p&gt;\n	1213二人群q我去额q\n&lt;/p&gt;\n&lt;p&gt;\n	&amp;nbsp;我去额群恶趣味q\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;br /&gt;\n&lt;/p&gt;\n&lt;p&gt;\n	我去而我却二请问厄齐尔\n&lt;/p&gt;', '0');

-- ----------------------------
-- Table structure for jd_sys_setting
-- ----------------------------
DROP TABLE IF EXISTS `jd_sys_setting`;
CREATE TABLE `jd_sys_setting` (
  `setting_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(20) NOT NULL,
  `field_desc` varchar(50) NOT NULL,
  `field_type` char(20) NOT NULL,
  `synopsis` varchar(1000) NOT NULL,
  PRIMARY KEY (`setting_id`),
  KEY `field_name` (`field_name`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_sys_setting
-- ----------------------------
INSERT INTO `jd_sys_setting` VALUES ('1', 'base_host', '站点根网址', 'text', 'http://39.105.19.169');
INSERT INTO `jd_sys_setting` VALUES ('2', 'site_name', '站点名称', 'text', '小橘灯');
INSERT INTO `jd_sys_setting` VALUES ('3', 'group_number', '每月群发数量', 'text', '901');
INSERT INTO `jd_sys_setting` VALUES ('4', 'message_number', '每月短信数量', 'text', '201');
INSERT INTO `jd_sys_setting` VALUES ('5', 'day_number', '每日购药提醒数量', 'text', '31');
INSERT INTO `jd_sys_setting` VALUES ('6', 'diagnosis_name', '初诊提示文字', 'text', '建议价格设置为1000元1');
INSERT INTO `jd_sys_setting` VALUES ('7', 'revisit_name', '复诊提示文字', 'text', '建议为老患者提供适当的优惠1');
INSERT INTO `jd_sys_setting` VALUES ('8', 'receipt_name', '接单提示文字', 'text', '每日接单次数99次1');
INSERT INTO `jd_sys_setting` VALUES ('9', 'diagnosis_number', '初诊价格上限', 'text', '100');
INSERT INTO `jd_sys_setting` VALUES ('10', 'revisit_number', '复诊价格上限', 'text', '111');
INSERT INTO `jd_sys_setting` VALUES ('11', 'receipt_number', '接单数量上限', 'text', '100');
INSERT INTO `jd_sys_setting` VALUES ('12', 'love_number', '爱心数量上限', 'text', '1001');
INSERT INTO `jd_sys_setting` VALUES ('13', 'diagnosis_price', '初诊初始价格', 'text', '100');
INSERT INTO `jd_sys_setting` VALUES ('14', 'revisit_price', '复诊初始价格', 'text', '111111');
INSERT INTO `jd_sys_setting` VALUES ('15', 'version_number', 'app版本号', 'text', '1.00.1.1');
INSERT INTO `jd_sys_setting` VALUES ('16', 'service_hot', '客服热线', 'text', '111112');
INSERT INTO `jd_sys_setting` VALUES ('17', 'lessCount', '药品库存预留量', 'text', '1');
INSERT INTO `jd_sys_setting` VALUES ('18', 'maxDepartNum', '医生的绑定的科室数量上限', 'text', '6');

-- ----------------------------
-- Table structure for jd_temp
-- ----------------------------
DROP TABLE IF EXISTS `jd_temp`;
CREATE TABLE `jd_temp` (
  `temp_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `temp_name` varchar(255) NOT NULL DEFAULT '' COMMENT '模板名(不可重复)',
  `member_id` int(8) NOT NULL DEFAULT '0' COMMENT '医生id',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0个人模板 1经典模板(管理员创建)',
  `sort` int(8) NOT NULL DEFAULT '0' COMMENT '权重',
  `state_id` int(8) NOT NULL DEFAULT '0' COMMENT '药态id',
  `relation_id` int(8) NOT NULL DEFAULT '0' COMMENT '药房药态id',
  `price` decimal(8,5) NOT NULL DEFAULT '0.00000' COMMENT '单剂的总价',
  `drug_str` text NOT NULL COMMENT '药方组成',
  `make` varchar(255) NOT NULL DEFAULT '' COMMENT '制作规范',
  `weight` varchar(255) NOT NULL DEFAULT '' COMMENT '预计重量',
  `taking` varchar(255) NOT NULL DEFAULT '' COMMENT '服用方法',
  `instructions` varchar(255) NOT NULL DEFAULT '' COMMENT '服药说明',
  `is_taboo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否存在配伍禁忌',
  `taboo_content` varchar(355) NOT NULL DEFAULT '' COMMENT '配伍禁忌内容',
  `dose` int(5) NOT NULL DEFAULT '1' COMMENT '剂量',
  `add_date` int(10) NOT NULL,
  `release_date` int(10) NOT NULL,
  `aid` int(8) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `operate_date` int(10) NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`temp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='药方模板表';

-- ----------------------------
-- Records of jd_temp
-- ----------------------------
INSERT INTO `jd_temp` VALUES ('4', '测试药方模板1', '2', '1', '0', '7', '32', '496.53900', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '*水丸需整体制作，请按照总量选#克数#，#1000g#起做', '#0-10ｇ#，(制丸会减少药材总重10%-30%)', '共#28#剂，每日#1#剂，1剂分#1#次使用	', '煎服, 饭后服用', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '1', '1526003847', '1526005538', '0', '0');
INSERT INTO `jd_temp` VALUES ('5', '测试药方模板2', '2', '1', '0', '7', '32', '496.53900', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '*水丸需整体制作，请按照总量选#克数#，#1000g#起做', '#0-10ｇ#，(制丸会减少药材总重10%-30%)', '共#28#剂，每日#1#剂，1剂分#1#次使用	', '煎服, 饭后服用', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '1', '1526003847', '1526003978', '0', '0');
INSERT INTO `jd_temp` VALUES ('8', '测试药方模板5', '2', '0', '0', '7', '32', '496.53900', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '*水丸需整体制作，请按照总量选#克数#，#1000g#起做', '#0-0ｇ#，(制丸会减少药材总重10%-30%)', '共#7#剂，每日#1#剂，1剂分#1#次使用	', '煎服, 饭后服用', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '20', '1526009783', '1526009783', '0', '0');
INSERT INTO `jd_temp` VALUES ('9', '开方药方模板1', '2', '0', '0', '7', '32', '496.53900', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '*水丸需整体制作，请按照总量选#克数#，#1000g#起做', '#0-0ｇ#，(制丸会减少药材总重10%-30%)', '共#7#剂，每日#1#剂，1剂分#1#次使用	', '煎服, 饭后服用', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '10', '1526205806', '1526205806', '0', '0');
INSERT INTO `jd_temp` VALUES ('10', '测试药方模板5.0', '2', '0', '0', '7', '32', '496.53900', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '*水丸需整体制作，请按照总量选#克数#，#1000g#起做', '#0-0ｇ#，(制丸会减少药材总重10%-30%)', '共#7#剂，每日#1#剂，1剂分#1#次使用  ', '煎服, 饭后服用', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '20', '1526270114', '1526270114', '0', '0');
INSERT INTO `jd_temp` VALUES ('11', '开2方药方模板1', '2', '0', '0', '7', '32', '496.53900', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '*水丸需整体制作，请按照总量选#克数#，#1000g#起做', '#0-0ｇ#，(制丸会减少药材总重10%-30%)', '共#7#剂，每日#1#剂，1剂分#1#次使用  ', '煎服, 饭后服用', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '10', '1526872540', '1526872540', '0', '0');
INSERT INTO `jd_temp` VALUES ('12', '开方药方模板11', '2', '0', '0', '7', '32', '496.53900', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '*水丸需整体制作，请按照总量选#克数#，#1000g#起做', '#0-0ｇ#，(制丸会减少药材总重10%-30%)', '共#7#剂，每日#1#剂，1剂分#1#次使用  ', '煎服, 饭后服用', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '10', '1526875692', '1526875692', '0', '0');
INSERT INTO `jd_temp` VALUES ('13', 'android测试', '17', '0', '0', '7', '33', '0.36800', '[[8,\"制半夏\",1,\"g\"]]', '*水丸需整体制作，请按照总量选#克数#，#1000g#起做	', '#0-0ｇ#，(制丸会减少药材总重10%-30%)', '共#7#剂，每日#1#剂，1剂分#1#次使用', '煎服', '0', '', '10', '1527156290', '1527156290', '0', '0');
INSERT INTO `jd_temp` VALUES ('14', 'android测试模板2', '17', '0', '0', '7', '33', '1.94500', '[[8,\"制半夏\",5,\"g\"],[17,\"制川乌\",1,\"g\"]]', '*水丸需整体制作，请按照总量选#克数#，#1000g#起做	', '#0-0ｇ#，(制丸会减少药材总重10%-30%)', '共#7#剂，每日#1#剂，1剂分#1#次使用', '煎服', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"]]', '10', '1527156652', '1527156652', '0', '0');
INSERT INTO `jd_temp` VALUES ('15', 'android测3', '17', '0', '0', '7', '33', '0.36800', '[[8,\"制半夏\",1,\"g\"]]', '*水丸需整体制作，请按照总量选#克数#，#1000g#起做	', '#0-0ｇ#，(制丸会减少药材总重10%-30%)', '共#6#剂，每日#1#剂，1剂分#1#次使用', '煎服', '0', '', '10', '1527160906', '1527160906', '0', '0');
INSERT INTO `jd_temp` VALUES ('16', '修改外用中药模板', '2', '0', '0', '0', '32', '496.53900', '[[17,\"\\u5236\\u5ddd\\u4e4c\",4,\"g\"],[315,\"\\u719f\\u9644\\u7247\",30,\"g\"],[485,\"\\u6cd5\\u534a\\u590f\",94,\"g\"]]', '* 颗粒剂请按照饮片量开出，药房将自动转换', '* 颗粒剂请按照饮片量开出，药房将自动转换', '共#7#剂,每日#1#剂,1剂分#1#次使用', '煎服, 饭后服用', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '10', '1527235482', '1527235482', '0', '0');
INSERT INTO `jd_temp` VALUES ('21', '222', '2', '0', '0', '7', '33', '496.53900', '[[17,\"制川乌\",4,\"g\"],[315,\"熟附片\",30,\"g\"],[485,\"法半夏\",94,\"g\"]]', '* 颗粒剂请按照饮片量开出，药房将自动转换', '', '共#10#剂，每日#10#剂，一剂分#10#次服用', '22', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '10', '1527343939', '1527343939', '0', '0');
INSERT INTO `jd_temp` VALUES ('22', '333', '2', '0', '0', '7', '33', '496.53900', '[[17,\"制川乌\",4,\"g\"],[315,\"熟附片\",30,\"g\"],[485,\"法半夏\",94,\"g\"]]', '* 颗粒剂请按照饮片量开出，药房将自动转换', '', '共#10#剂，每日#10#剂，一剂分#10#次服用', '222', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '10', '1527440660', '1527440660', '0', '0');
INSERT INTO `jd_temp` VALUES ('23', '33322', '2', '0', '0', '7', '33', '496.53900', '[[17,\"制川乌\",4,\"g\"],[315,\"熟附片\",30,\"g\"],[485,\"法半夏\",94,\"g\"]]', '* 颗粒剂请按照饮片量开出，药房将自动转换', '', '共#10#剂，每日#10#剂，一剂分#10#次服用', '222', '1', '[[\"\\u5ddd\\u4e4c\",\"\\u534a\\u590f\"],[\"\\u9644\\u5b50\",\"\\u534a\\u590f\"]]', '10', '1527440683', '1527440683', '0', '0');
INSERT INTO `jd_temp` VALUES ('24', '测试药房', '10', '0', '0', '7', '33', '0.13750', '[[1,\"白薇\",1,\"g\"]]', '* 颗粒剂请按照饮片量开出，药房将自动转换', '', '次服用#2#剂,每日#2#剂,一剂分#3#次服用', '仿佛更好', '0', '', '2', '1527473949', '1527473949', '0', '0');
INSERT INTO `jd_temp` VALUES ('25', '经济', '19', '0', '0', '7', '33', '19.12500', '[[7,\"郁金\",255,\"g\"]]', '* 颗粒剂请按照饮片量开出，药房将自动转换', '', '次服用#1#剂,每日#1#剂,一剂分#1#次服用', '呵呵', '0', '', '1', '1527503033', '1527503033', '0', '0');
INSERT INTO `jd_temp` VALUES ('29', '我', '25', '0', '0', '7', '33', '1.84000', '[[8,\"制半夏\",5,\"g\"]]', '* 颗粒剂请按照饮片量开出，药房将自动转换', '', '共#1#剂，每日#1#剂，一剂分#1#次服用', '说明\n', '0', '', '1', '1527518348', '1527518348', '0', '0');
INSERT INTO `jd_temp` VALUES ('30', '有', '25', '0', '0', '7', '33', '11.52030', '[[2,\"白及\",5,\"g\"],[12,\"独活\",6,\"g\"],[7,\"郁金\",6,\"g\"],[10,\"蜜紫菀\",6,\"g\"]]', '* 颗粒剂请按照饮片量开出，药房将自动转换', '', '共#1#剂，每日#1#剂，一剂分#1#次服用', '测试', '0', '', '1', '1527561203', '1527561203', '0', '0');
INSERT INTO `jd_temp` VALUES ('31', '男', '25', '0', '0', '7', '33', '13.36030', '[[8,\"制半夏\",5,\"g\"],[2,\"白及\",5,\"g\"],[12,\"独活\",6,\"g\"],[7,\"郁金\",6,\"g\"],[10,\"蜜紫菀\",6,\"g\"]]', '* 颗粒剂请按照饮片量开出，药房将自动转换', '', '共#1#剂，每日#22#剂，一剂分#1#次服用', '鸡尾酒', '0', '', '1', '1527563197', '1527563197', '0', '0');
INSERT INTO `jd_temp` VALUES ('32', 'dd', '15', '0', '0', '7', '53', '9.90000', '[[100,\"紫花地丁\",11,\"袋\"]]', '* 颗粒剂请按照饮片量开出，药房将自动转换', '', '共#1#剂，每日#1#剂，一剂分#1#次服用', '222', '0', '', '1', '1527721852', '1527721852', '0', '0');
INSERT INTO `jd_temp` VALUES ('35', 'v', '26', '0', '0', '7', '59', '0.20500', '[[6,\"蜜麸炒木香\",3,\"g\"],[4,\"川牛膝\",1,\"g\"]]', '*水丸需整体制作，请按照总量选#克数#，#1000g#起做', '#0-0ｇ#，(制丸会减少药材总重10%-30%)', '共#7#剂，每日#1#剂，1剂分#1#次使用', '煎服', '0', '', '10', '1527863681', '1527863681', '0', '0');
INSERT INTO `jd_temp` VALUES ('36', '测试', '25', '0', '0', '0', '0', '0.19760', '[[13,\"防风\",2,\"g\"]]', '', '', '共#1#剂,每日#1#剂,一剂分#1#次服用', '肩负', '0', '', '1', '1527874766', '1527874766', '0', '0');
INSERT INTO `jd_temp` VALUES ('37', '治疗头疼', '26', '0', '0', '7', '65', '4.90130', '[[6,\"蜜麸炒木香\",2,\"g\"],[17,\"制川乌\",2,\"g\"],[118,\"土茯苓\",2,\"袋\"],[315,\"熟附片\",1,\"g\"]]', '* 颗粒剂请按照饮片量开出，药房将自动转换', '', '次服用#10#剂,每日#1#剂,一剂分#3#次服用', '炒着吃', '0', '', '10', '1528004314', '1528004314', '0', '0');

-- ----------------------------
-- Table structure for jd_title
-- ----------------------------
DROP TABLE IF EXISTS `jd_title`;
CREATE TABLE `jd_title` (
  `title_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职称ID',
  `title_name` varchar(255) NOT NULL DEFAULT '' COMMENT '职称名称',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '级别深度',
  `id_tree` varchar(100) NOT NULL COMMENT 'id树',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父级',
  `root_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '根id',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序 从大到小',
  `is_show` int(3) NOT NULL DEFAULT '1' COMMENT '是否显示 1 显示',
  `aid` varchar(255) NOT NULL DEFAULT '' COMMENT '管理员id',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `operate_date` int(11) NOT NULL DEFAULT '0' COMMENT '管理员最后操作时间',
  PRIMARY KEY (`title_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='医生职称表';

-- ----------------------------
-- Records of jd_title
-- ----------------------------
INSERT INTO `jd_title` VALUES ('17', '副主任医师', '1', '.017.', '0', '0', '9', '1', '1', '1524725271', '1527668561');
INSERT INTO `jd_title` VALUES ('16', '主治医师', '1', '.016.', '0', '0', '8', '1', '1', '1524725256', '1527668552');
INSERT INTO `jd_title` VALUES ('15', '执业医师', '1', '.015.', '0', '0', '7', '1', '1', '1524725236', '1527668544');
INSERT INTO `jd_title` VALUES ('14', '助理医师', '1', '.014.', '0', '0', '6', '1', '1', '1524725204', '1527668534');
INSERT INTO `jd_title` VALUES ('19', '主任医师', '1', '.019.', '0', '19', '10', '1', '1', '1527668573', '1527668573');

-- ----------------------------
-- Table structure for jd_video
-- ----------------------------
DROP TABLE IF EXISTS `jd_video`;
CREATE TABLE `jd_video` (
  `video_id` int(8) NOT NULL AUTO_INCREMENT,
  `inherit_id` int(8) NOT NULL DEFAULT '0' COMMENT '所属传承',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '传承视频标题',
  `list_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '列表图片',
  `intro` varchar(355) NOT NULL DEFAULT '' COMMENT '视频简介',
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `release_date` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0不显示  1显示',
  `sort` int(8) NOT NULL DEFAULT '0' COMMENT '权重',
  `substance` text NOT NULL COMMENT '详情',
  `video_url` varchar(355) NOT NULL DEFAULT '' COMMENT '视频源',
  `video_cover` varchar(355) NOT NULL DEFAULT '' COMMENT '视频封面',
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='传承视频表';

-- ----------------------------
-- Records of jd_video
-- ----------------------------
INSERT INTO `jd_video` VALUES ('1', '2', '朱氏妇科历百年传承1', '/Uploads/image/images/20180310/20180310095758_58424.jpg', '为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,', '1525750555', '1525750555', '1', '1', '<p>女人都是爱美的，在延缓衰老方面，俞教授有一个很好的解决方案-美娘子方子，点击视频听听什么是“美娘子方子”，永葆青春美丽。<br><br>【医生简介】俞瑾，国家级名老中医，国际妇科学术权威，被誉为\"世界外婆\"。复旦大学附属妇产科医院教授、博士生导师。<br><br>一直致力于中西医结合女性健康事业的推广，30余次受邀赴美、日、德、意、瑞士、韩、保等国进行学术交流，并于1997年在美国国立卫生研究院(NIH)针刺听证会上进行\"针刺促排卵\"演讲，受到世界性重视。曾二次受邀担任国际妇科内分泌学会和国际产科妊高症学会1999年、2001年国际学术会议主席</p>', '/uploads/video/video.mp4', '/Uploads/image/images/20180310/20180310095758_58424.jpg');
INSERT INTO `jd_video` VALUES ('2', '2', '朱氏妇科历百年传承2', '/Uploads/image/images/20180310/20180310095758_58424.jpg', '为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,', '1525750555', '1525750555', '1', '2', '<p>女人都是爱美的，在延缓衰老方面，俞教授有一个很好的解决方案-美娘子方子，点击视频听听什么是“美娘子方子”，永葆青春美丽。<br><br>【医生简介】俞瑾，国家级名老中医，国际妇科学术权威，被誉为\"世界外婆\"。复旦大学附属妇产科医院教授、博士生导师。<br><br>一直致力于中西医结合女性健康事业的推广，30余次受邀赴美、日、德、意、瑞士、韩、保等国进行学术交流，并于1997年在美国国立卫生研究院(NIH)针刺听证会上进行\"针刺促排卵\"演讲，受到世界性重视。曾二次受邀担任国际妇科内分泌学会和国际产科妊高症学会1999年、2001年国际学术会议主席</p>', '/uploads/video/video.mp4', '/Uploads/image/images/20180310/20180310095758_58424.jpg');
INSERT INTO `jd_video` VALUES ('3', '2', '朱氏妇科历百年传承3', '/Uploads/image/images/20180310/20180310095758_58424.jpg', '为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,为朱氏妇科朱南山所创,', '1525750555', '1525750555', '1', '3', '<p>女人都是爱美的，在延缓衰老方面，俞教授有一个很好的解决方案-美娘子方子，点击视频听听什么是“美娘子方子”，永葆青春美丽。<br><br>【医生简介】俞瑾，国家级名老中医，国际妇科学术权威，被誉为\"世界外婆\"。复旦大学附属妇产科医院教授、博士生导师。<br><br>一直致力于中西医结合女性健康事业的推广，30余次受邀赴美、日、德、意、瑞士、韩、保等国进行学术交流，并于1997年在美国国立卫生研究院(NIH)针刺听证会上进行\"针刺促排卵\"演讲，受到世界性重视。曾二次受邀担任国际妇科内分泌学会和国际产科妊高症学会1999年、2001年国际学术会议主席</p>', '/uploads/video/video.mp4', '/Uploads/image/images/20180310/20180310095758_58424.jpg');

-- ----------------------------
-- Table structure for jd_wallet_log
-- ----------------------------
DROP TABLE IF EXISTS `jd_wallet_log`;
CREATE TABLE `jd_wallet_log` (
  `add_date` int(10) NOT NULL DEFAULT '0' COMMENT '时间',
  `member_id` int(8) NOT NULL DEFAULT '0' COMMENT '医生id',
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0转入 1转出',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '原因'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='零钱明细表';

-- ----------------------------
-- Records of jd_wallet_log
-- ----------------------------
INSERT INTO `jd_wallet_log` VALUES ('1526483910', '2', '900.00', '0', '');
INSERT INTO `jd_wallet_log` VALUES ('1526483911', '2', '700.00', '1', '');
INSERT INTO `jd_wallet_log` VALUES ('1526483913', '2', '300.00', '0', '');

-- ----------------------------
-- Table structure for jd_wx_menu
-- ----------------------------
DROP TABLE IF EXISTS `jd_wx_menu`;
CREATE TABLE `jd_wx_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) NOT NULL COMMENT 'name',
  `sort` int(5) DEFAULT '0' COMMENT '排序',
  `type` varchar(20) DEFAULT '' COMMENT '0 view 1 click',
  `value` varchar(255) DEFAULT NULL COMMENT 'value',
  `token` varchar(50) NOT NULL DEFAULT '' COMMENT 'token',
  `pid` int(11) DEFAULT '0' COMMENT '上级菜单',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of jd_wx_menu
-- ----------------------------
INSERT INTO `jd_wx_menu` VALUES ('1', '复诊咨询', '0', 'view', 'http://wechat.bohetanglao.com/home/advise/visit.html', '', '0');
INSERT INTO `jd_wx_menu` VALUES ('2', '配方取药', '0', 'view', 'http://wechat.bohetanglao.com/home/center/dx.html', '', '0');
INSERT INTO `jd_wx_menu` VALUES ('3', '更多', '0', 'click', '', '', '0');
INSERT INTO `jd_wx_menu` VALUES ('4', '找名医', '4', 'view', 'http://wechat.bohetanglao.com/home/doctor/index.html', '', '3');
INSERT INTO `jd_wx_menu` VALUES ('5', '学术传承', '3', 'view', 'http://wechat.bohetanglao.com/home/inherit/index.html', '', '3');
INSERT INTO `jd_wx_menu` VALUES ('6', '特色方剂', '2', 'view', 'http://wechat.bohetanglao.com/home/inherit/pres.html', '', '3');
INSERT INTO `jd_wx_menu` VALUES ('7', '小橘灯首页', '1', 'view', 'http://wechat.bohetanglao.com/', '', '3');

-- ----------------------------
-- Table structure for jd_wx_news
-- ----------------------------
DROP TABLE IF EXISTS `jd_wx_news`;
CREATE TABLE `jd_wx_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `doctor_id` int(11) NOT NULL DEFAULT '0' COMMENT '医生ID',
  `Title` char(255) NOT NULL COMMENT '标题',
  `Description` varchar(200) NOT NULL COMMENT '描述',
  `PicUrl` varchar(200) NOT NULL COMMENT '图片路径',
  `Url` varchar(200) NOT NULL COMMENT '链接地址',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='微信图文';

-- ----------------------------
-- Records of jd_wx_news
-- ----------------------------
INSERT INTO `jd_wx_news` VALUES ('1', '25', '王硕医生', '王硕医生', '/Uploads/image/images/20180310/20180310100148_73663.jpg', 'http://wechat.bohetanglao.com/home/advise/chat/memberid/25/type/0.html', '1', '1', '1526967715');
INSERT INTO `jd_wx_news` VALUES ('2', '25', '小橘灯的测试', '小橘灯的测试', '/uploads/image/images/20180601/20180601192757_12232.png', 'http://wechat.bohetanglao.com/home/advise/chat/memberid/25/type/0.html', '1', '2', '1526967831');
INSERT INTO `jd_wx_news` VALUES ('3', '10', '王硕医生: 点击这里与医生复诊', '在家随时找医生复诊调方', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/images/1527852881_881.png', 'http://wechat.bohetanglao.com/home/advise/chat/memberid/10/type/0.html', '1', '0', '1527852956');
INSERT INTO `jd_wx_news` VALUES ('4', '26', '医生名称医生: 点击这里与医生复诊', '在家随时找医生复诊调方', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/images/1527852881_881.png', 'http://wechat.bohetanglao.com/home/advise/chat/memberid/26/type/0.html', '0', '0', '1527853233');
INSERT INTO `jd_wx_news` VALUES ('5', '2', '王硕医生医生: 点击这里与医生复诊', '在家随时找医生复诊调方', 'http://xiaojd1.oss-cn-shanghai.aliyuncs.com/uploads/images/1527852881_881.png', 'http://wechat.bohetanglao.com/home/advise/chat/memberid/2/type/0.html', '1', '10', '1527931325');

-- ----------------------------
-- Table structure for jd_wx_text
-- ----------------------------
DROP TABLE IF EXISTS `jd_wx_text`;
CREATE TABLE `jd_wx_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `text` text NOT NULL COMMENT 'text',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` char(30) NOT NULL DEFAULT '' COMMENT 'token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文本回复表';

-- ----------------------------
-- Records of jd_wx_text
-- ----------------------------

-- ----------------------------
-- Table structure for jd_wx_user
-- ----------------------------
DROP TABLE IF EXISTS `jd_wx_user`;
CREATE TABLE `jd_wx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `wxname` varchar(60) NOT NULL COMMENT '公众号名称',
  `aeskey` varchar(256) NOT NULL DEFAULT '' COMMENT 'aeskey',
  `encode` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'encode',
  `appid` varchar(50) NOT NULL DEFAULT '' COMMENT 'appid',
  `appsecret` varchar(50) NOT NULL DEFAULT '' COMMENT 'appsecret',
  `wxid` varchar(64) NOT NULL COMMENT '公众号原始ID',
  `weixin` char(64) NOT NULL DEFAULT '' COMMENT '微信号',
  `token` char(255) NOT NULL DEFAULT '' COMMENT 'token',
  `w_token` varchar(150) NOT NULL DEFAULT '' COMMENT '微信对接token',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT 'create_time',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT 'updatetime',
  `access_token` varchar(200) NOT NULL DEFAULT '' COMMENT 'access_token',
  `refresh_token` varchar(200) NOT NULL DEFAULT '' COMMENT 'refresh_token',
  `expires` char(10) NOT NULL DEFAULT '' COMMENT 'authorizer_expires',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型',
  `qr` varchar(200) NOT NULL DEFAULT '' COMMENT 'qr',
  `menu_config` text COMMENT '菜单',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信公共帐号';

-- ----------------------------
-- Records of jd_wx_user
-- ----------------------------
INSERT INTO `jd_wx_user` VALUES ('1', '小橘灯中医 ', 'F7jlifYmAQsfMuOezF4SXSnoYGHCTrz3C9lXebVrpBn', '0', 'wx15fd1420bf788a27', '3438b06cb74c93ef6b2928c06401cef8', 'gh_b20d202cafc1', 'xjdzhongyi@sina.com', '', '710979423486a577cac5c6e940fc2524', '1524548261', '0', '10_IfcWlGh_zb3b57sEcGVxb7XcJr7UZm1Tx5aktPiuZSMqqCd_bz7FM9J9FZkneMA1e_ITWJvxlBTgbrQMujlCSyvPUrNDTiYF99XGBM3HkWKnPy3ajGxw3t8mHnGFI1yYhs-OkULMIzXiTtZ2HGNjAFAZYF', '', '1527962348', '0', '', null);
DROP TRIGGER IF EXISTS `tri_member`;
DELIMITER ;;
CREATE TRIGGER `tri_member` AFTER INSERT ON `jd_member` FOR EACH ROW BEGIN
insert into jd_member_info( member_id) VALUES(new.member_id);
END
;;
DELIMITER ;
