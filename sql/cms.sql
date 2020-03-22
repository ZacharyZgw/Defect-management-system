/*
Navicat MySQL Data Transfer

Source Server         : mycart
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-01-12 17:24:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bug
-- ----------------------------
DROP TABLE IF EXISTS `bug`;
CREATE TABLE `bug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(10) DEFAULT NULL,
  `level` varchar(2) DEFAULT NULL,
  `worktime` int(11) DEFAULT NULL,
  `taskName` varchar(50) DEFAULT NULL,
  `testDate` datetime DEFAULT NULL,
  `deadDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bug
-- ----------------------------
INSERT INTO `bug` VALUES ('13', '不合格', '低', '2', '缺陷1', '2017-01-08 16:53:19', '2017-01-08 16:53:21');
INSERT INTO `bug` VALUES ('14', '不合格', '高', '2', '缺陷2', '2017-01-08 16:53:39', '2017-01-08 16:53:41');
INSERT INTO `bug` VALUES ('15', '不合格', '高', '2', '缺陷3', '2017-01-08 16:53:50', '2017-01-08 16:53:52');
INSERT INTO `bug` VALUES ('16', '不合格', '低', '2', '缺陷4', '2017-01-08 16:54:00', '2017-01-08 16:54:02');
INSERT INTO `bug` VALUES ('17', '不合格', '低', '2', '缺陷5', '2017-01-08 16:54:12', '2017-01-08 16:54:14');
INSERT INTO `bug` VALUES ('18', '不合格', '高', '2', '缺陷6', '2017-01-08 16:54:24', '2017-01-08 16:54:25');
INSERT INTO `bug` VALUES ('19', '已验收', '低', '2', '缺陷修复', '2017-01-08 16:55:30', '2017-01-08 16:55:32');
INSERT INTO `bug` VALUES ('21', '不合格', '高', '2', '缺陷未修复', '2017-01-09 22:51:26', '2017-01-09 22:51:28');
INSERT INTO `bug` VALUES ('22', '不合格', '高', '2', '缺陷已修复', '2017-01-09 22:51:42', '2017-01-09 22:51:44');
INSERT INTO `bug` VALUES ('23', '不合格', '低', '2', '缺陷未提交', '2017-01-10 10:00:33', '2017-01-10 10:00:35');
INSERT INTO `bug` VALUES ('24', '不合格', '低', '2', '缺陷7', '2017-01-10 10:00:48', '2017-01-10 10:00:50');
INSERT INTO `bug` VALUES ('25', '待修改', '低', '2', '缺陷8', '2017-01-10 10:01:01', '2017-01-10 10:01:03');
INSERT INTO `bug` VALUES ('26', '已验收', '低', '2', '缺陷9', '2017-01-10 10:01:15', '2017-01-10 10:01:17');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `headerPic` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `isDelete` int(1) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', null, null, '0', '2016-12-02 00:00:00', null, null, '保密', '18255137142');
INSERT INTO `user` VALUES ('2', 'test', 'test', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('3', 'test2', 'test2', null, null, null, null, null, null, null, null);
