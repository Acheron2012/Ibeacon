/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50541
Source Host           : localhost:3306
Source Database       : ibeacon

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2017-08-17 13:40:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `adminer`
-- ----------------------------
DROP TABLE IF EXISTS `adminer`;
CREATE TABLE `adminer` (
  `adminer_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `adminer_name` varchar(50) NOT NULL,
  `adminer_password` varchar(20) NOT NULL,
  `role_id` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`adminer_id`,`adminer_name`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `adminer_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role_authority` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminer
-- ----------------------------
INSERT INTO `adminer` VALUES ('1', 'yangyanan', '123456', '1');

-- ----------------------------
-- Table structure for `client`
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `client_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `client_name` varchar(50) NOT NULL,
  `client_password` varchar(50) NOT NULL,
  `role_id` tinyint(2) unsigned NOT NULL,
  `client_phone` varchar(20) DEFAULT NULL,
  `operator_id` int(11) unsigned NOT NULL,
  `client_email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`client_id`,`client_name`),
  KEY `role_id` (`role_id`),
  KEY `operator_id` (`operator_id`) USING BTREE,
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`operator_id`) REFERENCES `operator` (`operator_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `client_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role_authority` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', 'a', '123456', '3', '18712760371', '1', '123415@qq.com');
INSERT INTO `client` VALUES ('2', 'b', '123456', '3', '18712760371', '1', '233@qq.com');
INSERT INTO `client` VALUES ('3', 'c', '123456', '3', '18712733333', '2', '223@qq.com');
INSERT INTO `client` VALUES ('16', 'd', '123456', '3', '18712733333', '2', '2@qq.com');
INSERT INTO `client` VALUES ('17', 'e', '123456', '3', '', '1', '');

-- ----------------------------
-- Table structure for `device`
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `device_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) unsigned NOT NULL,
  `device_name` varchar(100) NOT NULL,
  `uuid` char(36) NOT NULL,
  `major` int(11) NOT NULL,
  `minor` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `update_time` datetime DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `device_info` text,
  PRIMARY KEY (`device_id`),
  KEY `uuid` (`uuid`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `device_ibfk_2` FOREIGN KEY (`uuid`) REFERENCES `operator` (`operator_uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `device_ibfk_3` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES ('1', '1', '用户1的设备1', 'FDA50693-A4E2-4FB1-AFCF-C6EB07647825', '19991', '10001', '示例文章1的标题', 'iBeacon是苹果公司2013年9月发布的移动设备用OS(iOS7)上配备的新功能。其工作方式是，配备有 低功耗蓝牙(BLE)通信功能的设备使用BLE技术向周围发送自己特有的ID，接收到该ID的应用软件会根据该ID采取一些行动。比如，在店铺里设置iBeacon通信模块的话，便可让iPhone和iPad上运行一资讯告知服务器，或者由服务器向顾客发送折扣券及进店积分。此外，还可以在家电发生故障或停止工作时使用iBeacon向应用软件发送资讯。', '2017-08-15 18:07:12', 'userFiles/client_1/20170815060712728.mp4', 'userFiles/client_1/20170815060712728.jpg', '2323');
INSERT INTO `device` VALUES ('2', '1', '运营商1用户1设备2', 'FDA50693-A4E2-4FB1-AFCF-C6EB07647825', '19991', '10002', '示例文章2的标题', 'iBeacon是苹果公司2013年9月发布的移动设备用OS(iOS7)上配备的新功能。其工作方式是，配备有 低功耗蓝牙(BLE)通信功能的设备使用BLE技术向周围发送自己特有的ID，接收到该ID的应用软件会根据该ID采取一些行动。比如，在店铺里设置iBeacon通信模块的话，便可让iPhone和iPad上运行一资讯告知服务器，或者由服务器向顾客发送折扣券及进店积分。此外，还可以在家电发生故障或停止工作时使用iBeacon向应用软件发送资讯。', '2017-08-15 18:08:26', 'userFiles/client_1/20170815060826027.mp4', 'userFiles/client_1/20170815060826027.jpg', '啊啊');
INSERT INTO `device` VALUES ('3', '2', '运营商1用户2设备1', 'FDA50693-A4E2-4FB1-AFCF-C6EB07647825', '19991', '20001', '苹果公司首次展示Ibeancon', 'iBeacon是苹果公司2013年9月发布的移动设备用OS(iOS7)上配备的新功能。其工作方式是，配备有 低功耗蓝牙(BLE)通信功能的设备使用BLE技术向周围发送自己特有的ID，接收到该ID的应用软件会根据该ID采取一些行动。比如，在店铺里设置iBeacon通信模块的话，便可让iPhone和iPad上运行一资讯告知服务器，或者由服务器向顾客发送折扣券及进店积分。此外，还可以在家电发生故障或停止工作时使用iBeacon向应用软件发送资讯。', '2017-08-15 18:09:05', 'userFiles/client_2/20170815060905752.mp4', 'userFiles/client_2/20170815060905752.jpg', '啊啊啊');

-- ----------------------------
-- Table structure for `operator`
-- ----------------------------
DROP TABLE IF EXISTS `operator`;
CREATE TABLE `operator` (
  `operator_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '运营商id',
  `operator_uuid` char(36) NOT NULL COMMENT '运营商提供的设备UUID',
  `operator_major` int(11) NOT NULL,
  `operator_address` varchar(50) DEFAULT NULL COMMENT '运营商密码',
  `operator_name` varchar(50) NOT NULL DEFAULT '' COMMENT '运营商名称',
  `operator_password` varchar(20) NOT NULL COMMENT '运营商登录密码',
  `operator_phone` varchar(20) DEFAULT NULL COMMENT '运营商电话',
  `role_id` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`operator_id`,`operator_name`),
  KEY `role_id` (`role_id`),
  KEY `operator_uuid` (`operator_uuid`),
  CONSTRAINT `operator_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role_authority` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operator
-- ----------------------------
INSERT INTO `operator` VALUES ('1', 'FDA50693-A4E2-4FB1-AFCF-C6EB07647825', '19991', '北京市海淀区4号', '腾讯科技', '123456', '0377-68584', '2');
INSERT INTO `operator` VALUES ('2', 'FDA50693-A4E2-4FB1-AFCF-C6EB07647825', '19992', '深圳市', '小米科技', '123456', '0377-68584', '2');

-- ----------------------------
-- Table structure for `role_authority`
-- ----------------------------
DROP TABLE IF EXISTS `role_authority`;
CREATE TABLE `role_authority` (
  `role_id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `authority` varchar(255) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_authority
-- ----------------------------
INSERT INTO `role_authority` VALUES ('1', '1,2,3', '超级管理员');
INSERT INTO `role_authority` VALUES ('2', '1,2', '运营商管理员');
INSERT INTO `role_authority` VALUES ('3', '1', '终端用户');
