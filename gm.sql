/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : gm

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-07-30 10:17:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`p_name`),
  KEY `p_name` (`p_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('5', 'IT服务');
INSERT INTO `department` VALUES ('3', '东软熙康');
INSERT INTO `department` VALUES ('2', '东软遍在');
INSERT INTO `department` VALUES ('8', '其他');
INSERT INTO `department` VALUES ('1', '基础事业');
INSERT INTO `department` VALUES ('7', '汽车点子');
INSERT INTO `department` VALUES ('6', '网络安全');
INSERT INTO `department` VALUES ('4', '通企');

-- ----------------------------
-- Table structure for group_n
-- ----------------------------
DROP TABLE IF EXISTS `group_n`;
CREATE TABLE `group_n` (
  `t_name` varchar(255) NOT NULL,
  `group_s` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_name`),
  CONSTRAINT `group_n_ibfk_1` FOREIGN KEY (`t_name`) REFERENCES `team` (`t_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_n
-- ----------------------------
INSERT INTO `group_n` VALUES ('194123', '0');
INSERT INTO `group_n` VALUES ('19413', '3');
INSERT INTO `group_n` VALUES ('194213', '2');
INSERT INTO `group_n` VALUES ('aaa', '3');
INSERT INTO `group_n` VALUES ('admin', '1');
INSERT INTO `group_n` VALUES ('apm', '2');
INSERT INTO `group_n` VALUES ('apm123', '0');
INSERT INTO `group_n` VALUES ('c', '0');
INSERT INTO `group_n` VALUES ('cpu', '3');
INSERT INTO `group_n` VALUES ('java', '1');
INSERT INTO `group_n` VALUES ('nihao', '3');
INSERT INTO `group_n` VALUES ('ninininini', '0');
INSERT INTO `group_n` VALUES ('USB', '1');
INSERT INTO `group_n` VALUES ('一汽', '3');
INSERT INTO `group_n` VALUES ('中文', '1');
INSERT INTO `group_n` VALUES ('中文测试', '0');
INSERT INTO `group_n` VALUES ('丰田', '1');
INSERT INTO `group_n` VALUES ('主机', '0');
INSERT INTO `group_n` VALUES ('主线', '2');
INSERT INTO `group_n` VALUES ('人文', '2');
INSERT INTO `group_n` VALUES ('你好', '1');
INSERT INTO `group_n` VALUES ('你好1', '1');
INSERT INTO `group_n` VALUES ('你好12', '1');
INSERT INTO `group_n` VALUES ('你好2', '3');
INSERT INTO `group_n` VALUES ('你好3', '3');
INSERT INTO `group_n` VALUES ('你好4', '1');
INSERT INTO `group_n` VALUES ('你好5', '2');
INSERT INTO `group_n` VALUES ('光盘', '0');
INSERT INTO `group_n` VALUES ('内存', '3');
INSERT INTO `group_n` VALUES ('呵呵', '3');
INSERT INTO `group_n` VALUES ('呵呵2', '0');
INSERT INTO `group_n` VALUES ('呵呵3', '2');
INSERT INTO `group_n` VALUES ('呵呵4', '2');
INSERT INTO `group_n` VALUES ('呵呵5', '1');
INSERT INTO `group_n` VALUES ('呵呵6', '0');
INSERT INTO `group_n` VALUES ('大众', '3');
INSERT INTO `group_n` VALUES ('宝马', '3');
INSERT INTO `group_n` VALUES ('数据库', '2');
INSERT INTO `group_n` VALUES ('数据线', '1');
INSERT INTO `group_n` VALUES ('显卡', '2');
INSERT INTO `group_n` VALUES ('测试', '2');
INSERT INTO `group_n` VALUES ('测试1', '1');
INSERT INTO `group_n` VALUES ('测试10', '2');
INSERT INTO `group_n` VALUES ('测试2', '2');
INSERT INTO `group_n` VALUES ('测试3', '3');
INSERT INTO `group_n` VALUES ('测试4', '3');
INSERT INTO `group_n` VALUES ('测试8', '3');
INSERT INTO `group_n` VALUES ('测试注册跳转', '2');
INSERT INTO `group_n` VALUES ('硬盘', '0');
INSERT INTO `group_n` VALUES ('磁盘', '0');
INSERT INTO `group_n` VALUES ('网卡', '1');
INSERT INTO `group_n` VALUES ('网管', '0');
INSERT INTO `group_n` VALUES ('网管1', '3');
INSERT INTO `group_n` VALUES ('网管10', '0');
INSERT INTO `group_n` VALUES ('网管100', '0');
INSERT INTO `group_n` VALUES ('网管3', '2');
INSERT INTO `group_n` VALUES ('网管4', '3');
INSERT INTO `group_n` VALUES ('网管5', '3');
INSERT INTO `group_n` VALUES ('网管6', '2');
INSERT INTO `group_n` VALUES ('网管7', '1');
INSERT INTO `group_n` VALUES ('网管8', '0');
INSERT INTO `group_n` VALUES ('网管9', '1');
INSERT INTO `group_n` VALUES ('网线', '0');
INSERT INTO `group_n` VALUES ('跳转测试', '1');
INSERT INTO `group_n` VALUES ('逗你玩', '2');
INSERT INTO `group_n` VALUES ('逗你玩1', '2');
INSERT INTO `group_n` VALUES ('逗你玩13', '0');
INSERT INTO `group_n` VALUES ('逗你玩134', '1');
INSERT INTO `group_n` VALUES ('逗你玩3', '1');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `email` varchar(255) NOT NULL,
  `m_name` varchar(255) NOT NULL,
  `t_name` varchar(255) NOT NULL,
  `tel_phone` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `t_name` (`t_name`),
  KEY `department` (`department`),
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`t_name`) REFERENCES `team` (`t_name`),
  CONSTRAINT `member_ibfk_2` FOREIGN KEY (`department`) REFERENCES `team` (`department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1239474@163.com', '妮妮', 'apm', '13462858321', '其他');
INSERT INTO `member` VALUES ('dddd@qq.com', 'nihao', '194213', '13544441234', '东软遍在');
INSERT INTO `member` VALUES ('di1@dcom', 'NO. 1', '丰田', '13475860532', '汽车点子');
INSERT INTO `member` VALUES ('nihao@neusoft.com', '丰田1', '丰田', '18882739312', '汽车点子');
INSERT INTO `member` VALUES ('sass@163.com', '一汽大众', '你好', '18888888888', '其他');
INSERT INTO `member` VALUES ('sspa@foxmail.com', 'sb', '194213', '13444444444', '东软遍在');
INSERT INTO `member` VALUES ('sss@163.com', '逗你玩', '194213', '13544441234', '东软遍在');
INSERT INTO `member` VALUES ('ssss@qq.com', 'aaaa', 'apm123', '13522222222', '汽车点子');

-- ----------------------------
-- Table structure for refuse_date
-- ----------------------------
DROP TABLE IF EXISTS `refuse_date`;
CREATE TABLE `refuse_date` (
  `t_name` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_s` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `t_name` (`t_name`),
  CONSTRAINT `refuse_date_ibfk_1` FOREIGN KEY (`t_name`) REFERENCES `team` (`t_name`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of refuse_date
-- ----------------------------
INSERT INTO `refuse_date` VALUES ('194213', '4', '2017-10-05');
INSERT INTO `refuse_date` VALUES ('194213', '29', '2017-10-06');
INSERT INTO `refuse_date` VALUES ('194213', '51', '2017-09-14');
INSERT INTO `refuse_date` VALUES ('194213', '52', '2017-09-12');
INSERT INTO `refuse_date` VALUES ('194213', '53', '2017-09-12');
INSERT INTO `refuse_date` VALUES ('194213', '69', '2017-09-20');
INSERT INTO `refuse_date` VALUES ('194213', '72', '2017-09-21');
INSERT INTO `refuse_date` VALUES ('194213', '73', '2017-09-21');
INSERT INTO `refuse_date` VALUES ('194213', '74', '2017-09-22');
INSERT INTO `refuse_date` VALUES ('194213', '75', '2017-09-22');
INSERT INTO `refuse_date` VALUES ('194213', '78', '2017-09-30');
INSERT INTO `refuse_date` VALUES ('194213', '79', '2017-09-30');
INSERT INTO `refuse_date` VALUES ('194213', '83', '2017-10-03');
INSERT INTO `refuse_date` VALUES ('194213', '84', '2017-10-03');
INSERT INTO `refuse_date` VALUES ('194213', '85', '2017-10-04');
INSERT INTO `refuse_date` VALUES ('194213', '86', '2017-10-04');
INSERT INTO `refuse_date` VALUES ('194213', '87', '2017-10-12');
INSERT INTO `refuse_date` VALUES ('194213', '88', '2017-10-12');
INSERT INTO `refuse_date` VALUES ('中文测试', '90', '2017-09-12');
INSERT INTO `refuse_date` VALUES ('中文测试', '91', '2017-10-03');
INSERT INTO `refuse_date` VALUES ('中文测试', '92', '2017-09-26');
INSERT INTO `refuse_date` VALUES ('中文测试', '93', '2017-09-18');
INSERT INTO `refuse_date` VALUES ('中文测试', '94', '2017-09-22');
INSERT INTO `refuse_date` VALUES ('中文测试', '95', '2017-09-28');
INSERT INTO `refuse_date` VALUES ('中文测试', '96', '2017-10-05');
INSERT INTO `refuse_date` VALUES ('中文测试', '97', '2017-10-11');
INSERT INTO `refuse_date` VALUES ('中文测试', '98', '2017-09-14');
INSERT INTO `refuse_date` VALUES ('java', '99', '2017-09-19');
INSERT INTO `refuse_date` VALUES ('java', '100', '2017-09-26');
INSERT INTO `refuse_date` VALUES ('java', '101', '2017-09-25');
INSERT INTO `refuse_date` VALUES ('java', '102', '2017-10-03');
INSERT INTO `refuse_date` VALUES ('java', '103', '2017-10-04');
INSERT INTO `refuse_date` VALUES ('java', '104', '2017-09-28');
INSERT INTO `refuse_date` VALUES ('java', '105', '2017-10-01');
INSERT INTO `refuse_date` VALUES ('USB', '106', '2017-09-11');
INSERT INTO `refuse_date` VALUES ('USB', '107', '2017-09-19');
INSERT INTO `refuse_date` VALUES ('USB', '108', '2017-09-18');
INSERT INTO `refuse_date` VALUES ('USB', '109', '2017-09-12');
INSERT INTO `refuse_date` VALUES ('USB', '110', '2017-09-20');
INSERT INTO `refuse_date` VALUES ('USB', '111', '2017-09-13');
INSERT INTO `refuse_date` VALUES ('USB', '112', '2017-09-21');
INSERT INTO `refuse_date` VALUES ('USB', '113', '2017-09-22');
INSERT INTO `refuse_date` VALUES ('磁盘', '114', '2017-09-18');
INSERT INTO `refuse_date` VALUES ('磁盘', '115', '2017-09-25');
INSERT INTO `refuse_date` VALUES ('磁盘', '116', '2017-09-26');
INSERT INTO `refuse_date` VALUES ('磁盘', '117', '2017-09-20');
INSERT INTO `refuse_date` VALUES ('磁盘', '118', '2017-10-04');
INSERT INTO `refuse_date` VALUES ('磁盘', '119', '2017-10-03');
INSERT INTO `refuse_date` VALUES ('磁盘', '120', '2017-10-02');
INSERT INTO `refuse_date` VALUES ('磁盘', '121', '2017-09-29');
INSERT INTO `refuse_date` VALUES ('磁盘', '122', '2017-09-27');
INSERT INTO `refuse_date` VALUES ('磁盘', '123', '2017-10-10');
INSERT INTO `refuse_date` VALUES ('apm123', '124', '2017-09-20');
INSERT INTO `refuse_date` VALUES ('apm123', '125', '2017-10-04');
INSERT INTO `refuse_date` VALUES ('apm123', '126', '2017-10-11');
INSERT INTO `refuse_date` VALUES ('apm123', '127', '2017-10-05');
INSERT INTO `refuse_date` VALUES ('apm123', '128', '2017-09-29');
INSERT INTO `refuse_date` VALUES ('apm123', '129', '2017-09-26');
INSERT INTO `refuse_date` VALUES ('194213', '130', '2017-09-27');
INSERT INTO `refuse_date` VALUES ('194213', '131', '2017-10-18');
INSERT INTO `refuse_date` VALUES ('你好', '132', '2017-09-19');
INSERT INTO `refuse_date` VALUES ('你好', '133', '2017-09-27');
INSERT INTO `refuse_date` VALUES ('你好', '134', '2017-09-26');
INSERT INTO `refuse_date` VALUES ('你好', '135', '2017-09-18');
INSERT INTO `refuse_date` VALUES ('你好', '136', '2017-10-01');
INSERT INTO `refuse_date` VALUES ('你好', '137', '2017-09-24');
INSERT INTO `refuse_date` VALUES ('你好', '138', '2017-09-29');
INSERT INTO `refuse_date` VALUES ('你好', '139', '2017-10-05');
INSERT INTO `refuse_date` VALUES ('你好', '140', '2017-10-03');
INSERT INTO `refuse_date` VALUES ('你好', '141', '2017-09-28');
INSERT INTO `refuse_date` VALUES ('丰田', '142', '2017-09-27');
INSERT INTO `refuse_date` VALUES ('丰田', '143', '2017-09-26');
INSERT INTO `refuse_date` VALUES ('丰田', '144', '2017-10-04');
INSERT INTO `refuse_date` VALUES ('丰田', '145', '2017-10-05');
INSERT INTO `refuse_date` VALUES ('丰田', '146', '2017-09-29');
INSERT INTO `refuse_date` VALUES ('丰田', '147', '2017-09-28');
INSERT INTO `refuse_date` VALUES ('丰田', '148', '2017-10-03');
INSERT INTO `refuse_date` VALUES ('丰田', '149', '2017-10-02');
INSERT INTO `refuse_date` VALUES ('人文', '150', '2017-09-13');
INSERT INTO `refuse_date` VALUES ('人文', '151', '2017-09-27');
INSERT INTO `refuse_date` VALUES ('人文', '152', '2017-09-26');
INSERT INTO `refuse_date` VALUES ('人文', '153', '2017-09-25');
INSERT INTO `refuse_date` VALUES ('人文', '154', '2017-09-28');
INSERT INTO `refuse_date` VALUES ('人文', '155', '2017-10-06');
INSERT INTO `refuse_date` VALUES ('人文', '156', '2017-10-05');
INSERT INTO `refuse_date` VALUES ('人文', '157', '2017-10-04');
INSERT INTO `refuse_date` VALUES ('人文', '158', '2017-10-03');
INSERT INTO `refuse_date` VALUES ('人文', '159', '2017-10-02');
INSERT INTO `refuse_date` VALUES ('你好12', '160', '2017-09-19');
INSERT INTO `refuse_date` VALUES ('你好12', '161', '2017-09-26');
INSERT INTO `refuse_date` VALUES ('你好12', '162', '2017-09-27');
INSERT INTO `refuse_date` VALUES ('你好12', '163', '2017-09-28');
INSERT INTO `refuse_date` VALUES ('你好12', '164', '2017-09-29');
INSERT INTO `refuse_date` VALUES ('你好12', '165', '2017-10-05');
INSERT INTO `refuse_date` VALUES ('你好12', '166', '2017-10-04');
INSERT INTO `refuse_date` VALUES ('你好12', '167', '2017-10-03');
INSERT INTO `refuse_date` VALUES ('你好12', '168', '2017-10-02');
INSERT INTO `refuse_date` VALUES ('你好12', '169', '2017-09-25');

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `date_s` varchar(255) NOT NULL,
  `team_f` varchar(255) NOT NULL,
  `team_s` varchar(255) NOT NULL,
  `department_f` varchar(255) NOT NULL,
  `department_s` varchar(255) NOT NULL,
  `group_s` int(11) NOT NULL,
  PRIMARY KEY (`date_s`,`group_s`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('2017-09-01 11:00', '194123', '网管', '东软遍在', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-09-01 11:00', 'USB', '数据线', 'IT服务', 'IT服务', '1');
INSERT INTO `schedule` VALUES ('2017-09-01 11:00', '测试10', '网管3', '网络安全', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-09-01 11:00', '19413', '网管5', '东软遍在', '网络安全', '3');
INSERT INTO `schedule` VALUES ('2017-09-02 11:00', '网管8', '逗你玩13', '网络安全', '东软熙康', '0');
INSERT INTO `schedule` VALUES ('2017-09-02 11:00', '你好1', '逗你玩3', '其他', '基础事业', '1');
INSERT INTO `schedule` VALUES ('2017-09-02 11:00', '测试10', '测试注册跳转', '网络安全', '基础事业', '2');
INSERT INTO `schedule` VALUES ('2017-09-02 11:00', 'nihao', '内存', '汽车点子', 'IT服务', '3');
INSERT INTO `schedule` VALUES ('2017-09-03 11:00', 'ninininini', '中文测试', '基础事业', '东软遍在', '0');
INSERT INTO `schedule` VALUES ('2017-09-03 11:00', '你好12', '网管7', '其他', '网络安全', '1');
INSERT INTO `schedule` VALUES ('2017-09-03 11:00', '显卡', '测试2', 'IT服务', '基础事业', '2');
INSERT INTO `schedule` VALUES ('2017-09-03 11:00', 'nihao', '宝马', '汽车点子', '汽车点子', '3');
INSERT INTO `schedule` VALUES ('2017-09-04 11:00', 'ninininini', '呵呵2', '基础事业', '基础事业', '0');
INSERT INTO `schedule` VALUES ('2017-09-04 11:00', '你好', '网管9', '其他', '网络安全', '1');
INSERT INTO `schedule` VALUES ('2017-09-04 11:00', '测试注册跳转', '网管6', '基础事业', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-09-04 11:00', '宝马', '测试4', '汽车点子', '基础事业', '3');
INSERT INTO `schedule` VALUES ('2017-09-05 11:00', '网管10', '网线', '网络安全', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-09-05 11:00', '你好', '你好12', '其他', '其他', '1');
INSERT INTO `schedule` VALUES ('2017-09-05 11:00', '显卡', '测试10', 'IT服务', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-09-05 11:00', 'aaa', '测试8', '东软遍在', '基础事业', '3');
INSERT INTO `schedule` VALUES ('2017-09-06 11:00', '194123', '呵呵2', '东软遍在', '基础事业', '0');
INSERT INTO `schedule` VALUES ('2017-09-06 11:00', '你好', '测试1', '其他', '基础事业', '1');
INSERT INTO `schedule` VALUES ('2017-09-06 11:00', '你好5', '网管6', '东软熙康', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-09-06 11:00', 'aaa', '你好3', '东软遍在', '其他', '3');
INSERT INTO `schedule` VALUES ('2017-09-07 11:00', 'ninininini', '硬盘', '基础事业', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-09-07 11:00', '你好', '跳转测试', '其他', '东软遍在', '1');
INSERT INTO `schedule` VALUES ('2017-09-07 11:00', '呵呵3', '测试', '基础事业', '基础事业', '2');
INSERT INTO `schedule` VALUES ('2017-09-07 11:00', 'cpu', '大众', 'IT服务', '汽车点子', '3');
INSERT INTO `schedule` VALUES ('2017-09-08 11:00', '呵呵2', '网管100', '基础事业', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-09-08 11:00', '你好1', '你好4', '其他', '其他', '1');
INSERT INTO `schedule` VALUES ('2017-09-08 11:00', '194213', '测试注册跳转', '东软遍在', '基础事业', '2');
INSERT INTO `schedule` VALUES ('2017-09-08 11:00', '呵呵', '测试8', '基础事业', '基础事业', '3');
INSERT INTO `schedule` VALUES ('2017-09-09 11:00', '194123', '网管100', '东软遍在', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-09-09 11:00', 'USB', '丰田', 'IT服务', '汽车点子', '1');
INSERT INTO `schedule` VALUES ('2017-09-09 11:00', '网管3', '逗你玩1', '网络安全', '东软熙康', '2');
INSERT INTO `schedule` VALUES ('2017-09-09 11:00', '呵呵', '测试3', '基础事业', '基础事业', '3');
INSERT INTO `schedule` VALUES ('2017-09-10 11:00', 'c', '硬盘', 'IT服务', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-09-10 11:00', 'admin', '逗你玩134', '其他', '东软熙康', '1');
INSERT INTO `schedule` VALUES ('2017-09-10 11:00', '你好5', '网管3', '东软熙康', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-09-10 11:00', '呵呵', '网管4', '基础事业', '网络安全', '3');
INSERT INTO `schedule` VALUES ('2017-09-11 11:00', '磁盘', '网管8', 'IT服务', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-09-11 11:00', '数据线', '测试1', 'IT服务', '基础事业', '1');
INSERT INTO `schedule` VALUES ('2017-09-11 11:00', 'apm', '显卡', '其他', 'IT服务', '2');
INSERT INTO `schedule` VALUES ('2017-09-11 11:00', '你好3', '测试8', '其他', '基础事业', '3');
INSERT INTO `schedule` VALUES ('2017-09-12 11:00', '光盘', '逗你玩13', 'IT服务', '东软熙康', '0');
INSERT INTO `schedule` VALUES ('2017-09-12 11:00', '数据线', '跳转测试', 'IT服务', '东软遍在', '1');
INSERT INTO `schedule` VALUES ('2017-09-12 11:00', 'apm', '你好5', '其他', '东软熙康', '2');
INSERT INTO `schedule` VALUES ('2017-09-12 11:00', '一汽', '网管5', '汽车点子', '网络安全', '3');
INSERT INTO `schedule` VALUES ('2017-09-13 11:00', '硬盘', '网管', 'IT服务', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-09-13 11:00', '丰田', '数据线', '汽车点子', 'IT服务', '1');
INSERT INTO `schedule` VALUES ('2017-09-13 11:00', '主线', '显卡', 'IT服务', 'IT服务', '2');
INSERT INTO `schedule` VALUES ('2017-09-13 11:00', '内存', '呵呵', 'IT服务', '基础事业', '3');
INSERT INTO `schedule` VALUES ('2017-09-14 11:00', '194123', '网管10', '东软遍在', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-09-14 11:00', '中文', '你好1', '东软遍在', '其他', '1');
INSERT INTO `schedule` VALUES ('2017-09-14 11:00', '主线', '人文', 'IT服务', '汽车点子', '2');
INSERT INTO `schedule` VALUES ('2017-09-14 11:00', '测试8', '网管1', '基础事业', '网络安全', '3');
INSERT INTO `schedule` VALUES ('2017-09-15 11:00', '呵呵2', '网管10', '基础事业', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-09-15 11:00', '呵呵5', '逗你玩134', '基础事业', '东软熙康', '1');
INSERT INTO `schedule` VALUES ('2017-09-15 11:00', '人文', '呵呵4', '汽车点子', '基础事业', '2');
INSERT INTO `schedule` VALUES ('2017-09-15 11:00', 'aaa', '网管5', '东软遍在', '网络安全', '3');
INSERT INTO `schedule` VALUES ('2017-09-16 11:00', 'c', '网管8', 'IT服务', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-09-16 11:00', '你好', '网管7', '其他', '网络安全', '1');
INSERT INTO `schedule` VALUES ('2017-09-16 11:00', '194213', '逗你玩1', '东软遍在', '东软熙康', '2');
INSERT INTO `schedule` VALUES ('2017-09-16 11:00', '测试3', '测试4', '基础事业', '基础事业', '3');
INSERT INTO `schedule` VALUES ('2017-09-17 11:00', '194123', '光盘', '东软遍在', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-09-17 11:00', 'java', 'USB', 'IT服务', 'IT服务', '1');
INSERT INTO `schedule` VALUES ('2017-09-17 11:00', '呵呵4', '显卡', '基础事业', 'IT服务', '2');
INSERT INTO `schedule` VALUES ('2017-09-17 11:00', '大众', '宝马', '汽车点子', '汽车点子', '3');
INSERT INTO `schedule` VALUES ('2017-09-18 11:00', 'c', '逗你玩13', 'IT服务', '东软熙康', '0');
INSERT INTO `schedule` VALUES ('2017-09-18 11:00', 'java', '你好4', 'IT服务', '其他', '1');
INSERT INTO `schedule` VALUES ('2017-09-18 11:00', '人文', '网管3', '汽车点子', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-09-18 11:00', 'cpu', '一汽', 'IT服务', '汽车点子', '3');
INSERT INTO `schedule` VALUES ('2017-09-19 11:00', '呵呵6', '逗你玩13', '基础事业', '东软熙康', '0');
INSERT INTO `schedule` VALUES ('2017-09-19 11:00', '数据线', '网管9', 'IT服务', '网络安全', '1');
INSERT INTO `schedule` VALUES ('2017-09-19 11:00', '显卡', '网管3', 'IT服务', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-09-19 11:00', '网管4', '网管5', '网络安全', '网络安全', '3');
INSERT INTO `schedule` VALUES ('2017-09-20 11:00', '主机', '呵呵6', 'IT服务', '基础事业', '0');
INSERT INTO `schedule` VALUES ('2017-09-20 11:00', '你好', '你好1', '其他', '其他', '1');
INSERT INTO `schedule` VALUES ('2017-09-20 11:00', '测试', '网管3', '基础事业', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-09-20 11:00', 'cpu', '宝马', 'IT服务', '汽车点子', '3');
INSERT INTO `schedule` VALUES ('2017-09-21 11:00', 'apm123', '磁盘', '汽车点子', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-09-21 11:00', 'admin', '你好12', '其他', '其他', '1');
INSERT INTO `schedule` VALUES ('2017-09-21 11:00', '测试2', '逗你玩1', '基础事业', '东软熙康', '2');
INSERT INTO `schedule` VALUES ('2017-09-21 11:00', 'nihao', '网管5', '汽车点子', '网络安全', '3');
INSERT INTO `schedule` VALUES ('2017-09-22 11:00', '磁盘', '网管', 'IT服务', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-09-22 11:00', 'admin', '网卡', '其他', 'IT服务', '1');
INSERT INTO `schedule` VALUES ('2017-09-22 11:00', '测试', '逗你玩1', '基础事业', '东软熙康', '2');
INSERT INTO `schedule` VALUES ('2017-09-22 11:00', 'cpu', '你好2', 'IT服务', '东软熙康', '3');
INSERT INTO `schedule` VALUES ('2017-09-23 11:00', '网管', '网管100', '网络安全', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-09-23 11:00', '丰田', '网管7', '汽车点子', '网络安全', '1');
INSERT INTO `schedule` VALUES ('2017-09-23 11:00', '呵呵3', '逗你玩1', '基础事业', '东软熙康', '2');
INSERT INTO `schedule` VALUES ('2017-09-23 11:00', 'cpu', '测试3', 'IT服务', '基础事业', '3');
INSERT INTO `schedule` VALUES ('2017-09-24 11:00', '磁盘', '逗你玩13', 'IT服务', '东软熙康', '0');
INSERT INTO `schedule` VALUES ('2017-09-24 11:00', 'java', '跳转测试', 'IT服务', '东软遍在', '1');
INSERT INTO `schedule` VALUES ('2017-09-24 11:00', '数据库', '网管6', 'IT服务', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-09-24 11:00', 'aaa', '一汽', '东软遍在', '汽车点子', '3');
INSERT INTO `schedule` VALUES ('2017-09-25 11:00', '中文测试', '硬盘', '东软遍在', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-09-25 11:00', '数据线', '网管7', 'IT服务', '网络安全', '1');
INSERT INTO `schedule` VALUES ('2017-09-25 11:00', 'apm', '测试10', '其他', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-09-25 11:00', 'nihao', '测试3', '汽车点子', '基础事业', '3');
INSERT INTO `schedule` VALUES ('2017-09-26 11:00', '194123', 'c', '东软遍在', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-09-26 11:00', '你好1', '逗你玩134', '其他', '东软熙康', '1');
INSERT INTO `schedule` VALUES ('2017-09-26 11:00', '测试', '网管6', '基础事业', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-09-26 11:00', 'nihao', '你好3', '汽车点子', '其他', '3');
INSERT INTO `schedule` VALUES ('2017-09-27 11:00', '中文测试', '逗你玩13', '东软遍在', '东软熙康', '0');
INSERT INTO `schedule` VALUES ('2017-09-27 11:00', '测试1', '逗你玩134', '基础事业', '东软熙康', '1');
INSERT INTO `schedule` VALUES ('2017-09-27 11:00', '主线', '数据库', 'IT服务', 'IT服务', '2');
INSERT INTO `schedule` VALUES ('2017-09-27 11:00', '大众', '测试8', '汽车点子', '基础事业', '3');
INSERT INTO `schedule` VALUES ('2017-09-28 11:00', '主机', '磁盘', 'IT服务', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-09-28 11:00', '中文', '跳转测试', '东软遍在', '东软遍在', '1');
INSERT INTO `schedule` VALUES ('2017-09-28 11:00', '呵呵4', '网管6', '基础事业', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-09-28 11:00', 'cpu', '你好3', 'IT服务', '其他', '3');
INSERT INTO `schedule` VALUES ('2017-09-29 11:00', '光盘', '呵呵2', 'IT服务', '基础事业', '0');
INSERT INTO `schedule` VALUES ('2017-09-29 11:00', 'USB', '呵呵5', 'IT服务', '基础事业', '1');
INSERT INTO `schedule` VALUES ('2017-09-29 11:00', '人文', '测试10', '汽车点子', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-09-29 11:00', '一汽', '宝马', '汽车点子', '汽车点子', '3');
INSERT INTO `schedule` VALUES ('2017-09-30 11:00', 'apm123', 'ninininini', '汽车点子', '基础事业', '0');
INSERT INTO `schedule` VALUES ('2017-09-30 11:00', '你好4', '网管9', '其他', '网络安全', '1');
INSERT INTO `schedule` VALUES ('2017-09-30 11:00', '呵呵3', '测试注册跳转', '基础事业', '基础事业', '2');
INSERT INTO `schedule` VALUES ('2017-09-30 11:00', '一汽', '网管1', '汽车点子', '网络安全', '3');
INSERT INTO `schedule` VALUES ('2017-10-01 11:00', '中文测试', '光盘', '东软遍在', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-10-01 11:00', '你好1', '呵呵5', '其他', '基础事业', '1');
INSERT INTO `schedule` VALUES ('2017-10-01 11:00', '网管6', '逗你玩', '网络安全', '东软遍在', '2');
INSERT INTO `schedule` VALUES ('2017-10-01 11:00', '测试8', '网管4', '基础事业', '网络安全', '3');
INSERT INTO `schedule` VALUES ('2017-10-02 11:00', 'c', '网管10', 'IT服务', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-10-02 11:00', '你好4', '网管7', '其他', '网络安全', '1');
INSERT INTO `schedule` VALUES ('2017-10-02 11:00', 'apm', '数据库', '其他', 'IT服务', '2');
INSERT INTO `schedule` VALUES ('2017-10-02 11:00', '你好3', '网管4', '其他', '网络安全', '3');
INSERT INTO `schedule` VALUES ('2017-10-03 11:00', '194123', '逗你玩13', '东软遍在', '东软熙康', '0');
INSERT INTO `schedule` VALUES ('2017-10-03 11:00', '网卡', '网管9', 'IT服务', '网络安全', '1');
INSERT INTO `schedule` VALUES ('2017-10-03 11:00', '测试', '测试2', '基础事业', '基础事业', '2');
INSERT INTO `schedule` VALUES ('2017-10-03 11:00', 'nihao', '网管4', '汽车点子', '网络安全', '3');
INSERT INTO `schedule` VALUES ('2017-10-04 11:00', '硬盘', '网管10', 'IT服务', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-10-04 11:00', 'admin', '中文', '其他', '东软遍在', '1');
INSERT INTO `schedule` VALUES ('2017-10-04 11:00', '你好5', '显卡', '东软熙康', 'IT服务', '2');
INSERT INTO `schedule` VALUES ('2017-10-04 11:00', '网管1', '网管5', '网络安全', '网络安全', '3');
INSERT INTO `schedule` VALUES ('2017-10-05 11:00', '194123', '网线', '东软遍在', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-10-05 11:00', '呵呵5', '逗你玩3', '基础事业', '基础事业', '1');
INSERT INTO `schedule` VALUES ('2017-10-05 11:00', '测试', '测试10', '基础事业', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-10-05 11:00', '你好2', '宝马', '东软熙康', '汽车点子', '3');
INSERT INTO `schedule` VALUES ('2017-10-06 11:00', '194123', 'ninininini', '东软遍在', '基础事业', '0');
INSERT INTO `schedule` VALUES ('2017-10-06 11:00', '丰田', '你好4', '汽车点子', '其他', '1');
INSERT INTO `schedule` VALUES ('2017-10-06 11:00', '呵呵4', '测试注册跳转', '基础事业', '基础事业', '2');
INSERT INTO `schedule` VALUES ('2017-10-06 11:00', '你好2', '大众', '东软熙康', '汽车点子', '3');
INSERT INTO `schedule` VALUES ('2017-10-07 11:00', '呵呵6', '网管8', '基础事业', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-10-07 11:00', 'java', '呵呵5', 'IT服务', '基础事业', '1');
INSERT INTO `schedule` VALUES ('2017-10-07 11:00', '呵呵4', '逗你玩', '基础事业', '东软遍在', '2');
INSERT INTO `schedule` VALUES ('2017-10-07 11:00', 'cpu', '测试4', 'IT服务', '基础事业', '3');
INSERT INTO `schedule` VALUES ('2017-10-08 11:00', '硬盘', '网管8', 'IT服务', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-10-08 11:00', '你好12', '呵呵5', '其他', '基础事业', '1');
INSERT INTO `schedule` VALUES ('2017-10-08 11:00', '人文', '逗你玩1', '汽车点子', '东软熙康', '2');
INSERT INTO `schedule` VALUES ('2017-10-08 11:00', '你好2', '网管4', '东软熙康', '网络安全', '3');
INSERT INTO `schedule` VALUES ('2017-10-09 11:00', 'c', '网线', 'IT服务', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-10-09 11:00', '你好1', '网管7', '其他', '网络安全', '1');
INSERT INTO `schedule` VALUES ('2017-10-09 11:00', '你好5', '测试10', '东软熙康', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-10-09 11:00', '19413', '你好2', '东软遍在', '东软熙康', '3');
INSERT INTO `schedule` VALUES ('2017-10-10 11:00', 'apm123', '网管8', '汽车点子', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-10-10 11:00', '呵呵5', '数据线', '基础事业', 'IT服务', '1');
INSERT INTO `schedule` VALUES ('2017-10-10 11:00', '人文', '显卡', '汽车点子', 'IT服务', '2');
INSERT INTO `schedule` VALUES ('2017-10-10 11:00', '你好3', '测试4', '其他', '基础事业', '3');
INSERT INTO `schedule` VALUES ('2017-10-11 11:00', '磁盘', '网线', 'IT服务', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-10-11 11:00', 'java', '数据线', 'IT服务', 'IT服务', '1');
INSERT INTO `schedule` VALUES ('2017-10-11 11:00', '呵呵3', '测试10', '基础事业', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-10-11 11:00', '内存', '测试3', 'IT服务', '基础事业', '3');
INSERT INTO `schedule` VALUES ('2017-10-12 11:00', '主机', '网管8', 'IT服务', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-10-12 11:00', 'admin', '跳转测试', '其他', '东软遍在', '1');
INSERT INTO `schedule` VALUES ('2017-10-12 11:00', '显卡', '逗你玩1', 'IT服务', '东软熙康', '2');
INSERT INTO `schedule` VALUES ('2017-10-12 11:00', '19413', '测试3', '东软遍在', '基础事业', '3');
INSERT INTO `schedule` VALUES ('2017-10-13 11:00', 'apm123', '主机', '汽车点子', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-10-13 11:00', 'java', '网卡', 'IT服务', 'IT服务', '1');
INSERT INTO `schedule` VALUES ('2017-10-13 11:00', '194213', '网管6', '东软遍在', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-10-13 11:00', '呵呵', '网管1', '基础事业', '网络安全', '3');
INSERT INTO `schedule` VALUES ('2017-10-14 11:00', '磁盘', '网管100', 'IT服务', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-10-14 11:00', '你好1', '你好12', '其他', '其他', '1');
INSERT INTO `schedule` VALUES ('2017-10-14 11:00', 'apm', '主线', '其他', 'IT服务', '2');
INSERT INTO `schedule` VALUES ('2017-10-14 11:00', '19413', 'cpu', '东软遍在', 'IT服务', '3');
INSERT INTO `schedule` VALUES ('2017-10-15 11:00', 'ninininini', '磁盘', '基础事业', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-10-15 11:00', 'admin', '你好1', '其他', '其他', '1');
INSERT INTO `schedule` VALUES ('2017-10-15 11:00', '测试注册跳转', '网管3', '基础事业', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-10-15 11:00', 'cpu', 'nihao', 'IT服务', '汽车点子', '3');
INSERT INTO `schedule` VALUES ('2017-10-16 11:00', '网管', '网线', '网络安全', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-10-16 11:00', '网管9', '逗你玩134', '网络安全', '东软熙康', '1');
INSERT INTO `schedule` VALUES ('2017-10-16 11:00', '194213', '逗你玩', '东软遍在', '东软遍在', '2');
INSERT INTO `schedule` VALUES ('2017-10-16 11:00', '测试4', '网管5', '基础事业', '网络安全', '3');
INSERT INTO `schedule` VALUES ('2017-10-17 11:00', '194123', '磁盘', '东软遍在', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-10-17 11:00', '丰田', '跳转测试', '汽车点子', '东软遍在', '1');
INSERT INTO `schedule` VALUES ('2017-10-17 11:00', '呵呵4', '逗你玩1', '基础事业', '东软熙康', '2');
INSERT INTO `schedule` VALUES ('2017-10-17 11:00', '一汽', '网管4', '汽车点子', '网络安全', '3');
INSERT INTO `schedule` VALUES ('2017-10-18 11:00', '网管', '网管10', '网络安全', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-10-18 11:00', '你好12', '逗你玩134', '其他', '东软熙康', '1');
INSERT INTO `schedule` VALUES ('2017-10-18 11:00', '主线', '测试注册跳转', 'IT服务', '基础事业', '2');
INSERT INTO `schedule` VALUES ('2017-10-18 11:00', '你好3', '大众', '其他', '汽车点子', '3');
INSERT INTO `schedule` VALUES ('2017-10-19 11:00', '呵呵2', '网管', '基础事业', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-10-19 11:00', '呵呵5', '网管7', '基础事业', '网络安全', '1');
INSERT INTO `schedule` VALUES ('2017-10-19 11:00', '呵呵3', '测试2', '基础事业', '基础事业', '2');
INSERT INTO `schedule` VALUES ('2017-10-19 11:00', '内存', '测试8', 'IT服务', '基础事业', '3');
INSERT INTO `schedule` VALUES ('2017-10-20 11:00', '呵呵2', '磁盘', '基础事业', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-10-20 11:00', 'admin', '呵呵5', '其他', '基础事业', '1');
INSERT INTO `schedule` VALUES ('2017-10-20 11:00', 'apm', '测试2', '其他', '基础事业', '2');
INSERT INTO `schedule` VALUES ('2017-10-20 11:00', '19413', '网管4', '东软遍在', '网络安全', '3');
INSERT INTO `schedule` VALUES ('2017-10-21 11:00', '194123', '硬盘', '东软遍在', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-10-21 11:00', '数据线', '逗你玩134', 'IT服务', '东软熙康', '1');
INSERT INTO `schedule` VALUES ('2017-10-21 11:00', '你好5', '呵呵3', '东软熙康', '基础事业', '2');
INSERT INTO `schedule` VALUES ('2017-10-21 11:00', '19413', '内存', '东软遍在', 'IT服务', '3');
INSERT INTO `schedule` VALUES ('2017-10-22 11:00', '中文测试', '网管', '东软遍在', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-10-22 11:00', '丰田', '逗你玩134', '汽车点子', '东软熙康', '1');
INSERT INTO `schedule` VALUES ('2017-10-22 11:00', '主线', '你好5', 'IT服务', '东软熙康', '2');
INSERT INTO `schedule` VALUES ('2017-10-22 11:00', '你好2', '你好3', '东软熙康', '其他', '3');
INSERT INTO `schedule` VALUES ('2017-10-23 11:00', '呵呵2', '呵呵6', '基础事业', '基础事业', '0');
INSERT INTO `schedule` VALUES ('2017-10-23 11:00', '中文', '你好', '东软遍在', '其他', '1');
INSERT INTO `schedule` VALUES ('2017-10-23 11:00', 'apm', '网管6', '其他', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-10-23 11:00', '你好2', '测试4', '东软熙康', '基础事业', '3');
INSERT INTO `schedule` VALUES ('2017-10-24 11:00', '呵呵6', '硬盘', '基础事业', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-10-24 11:00', 'java', '网管9', 'IT服务', '网络安全', '1');
INSERT INTO `schedule` VALUES ('2017-10-24 11:00', '呵呵3', '网管6', '基础事业', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-10-24 11:00', '19413', 'nihao', '东软遍在', '汽车点子', '3');
INSERT INTO `schedule` VALUES ('2017-10-25 11:00', '光盘', '磁盘', 'IT服务', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-10-25 11:00', 'admin', '你好', '其他', '其他', '1');
INSERT INTO `schedule` VALUES ('2017-10-25 11:00', '194213', '测试10', '东软遍在', '网络安全', '2');
INSERT INTO `schedule` VALUES ('2017-10-25 11:00', '你好3', '网管1', '其他', '网络安全', '3');
INSERT INTO `schedule` VALUES ('2017-10-26 11:00', '呵呵6', '网管10', '基础事业', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-10-26 11:00', 'admin', 'USB', '其他', 'IT服务', '1');
INSERT INTO `schedule` VALUES ('2017-10-26 11:00', '显卡', '测试', 'IT服务', '基础事业', '2');
INSERT INTO `schedule` VALUES ('2017-10-26 11:00', 'aaa', 'nihao', '东软遍在', '汽车点子', '3');
INSERT INTO `schedule` VALUES ('2017-10-27 11:00', 'apm123', '网管10', '汽车点子', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-10-27 11:00', '测试1', '逗你玩3', '基础事业', '基础事业', '1');
INSERT INTO `schedule` VALUES ('2017-10-27 11:00', 'apm', '逗你玩', '其他', '东软遍在', '2');
INSERT INTO `schedule` VALUES ('2017-10-27 11:00', '你好2', '测试8', '东软熙康', '基础事业', '3');
INSERT INTO `schedule` VALUES ('2017-10-28 11:00', '呵呵2', '网线', '基础事业', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-10-28 11:00', '网管7', '跳转测试', '网络安全', '东软遍在', '1');
INSERT INTO `schedule` VALUES ('2017-10-28 11:00', '主线', '呵呵4', 'IT服务', '基础事业', '2');
INSERT INTO `schedule` VALUES ('2017-10-28 11:00', '宝马', '测试3', '汽车点子', '基础事业', '3');
INSERT INTO `schedule` VALUES ('2017-10-29 11:00', 'apm123', 'c', '汽车点子', 'IT服务', '0');
INSERT INTO `schedule` VALUES ('2017-10-29 11:00', 'java', '丰田', 'IT服务', '汽车点子', '1');
INSERT INTO `schedule` VALUES ('2017-10-29 11:00', '呵呵4', '测试', '基础事业', '基础事业', '2');
INSERT INTO `schedule` VALUES ('2017-10-29 11:00', '19413', '你好3', '东软遍在', '其他', '3');
INSERT INTO `schedule` VALUES ('2017-10-30 11:00', '中文测试', '网管8', '东软遍在', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-10-30 11:00', '呵呵5', '跳转测试', '基础事业', '东软遍在', '1');
INSERT INTO `schedule` VALUES ('2017-10-30 11:00', 'apm', '测试', '其他', '基础事业', '2');
INSERT INTO `schedule` VALUES ('2017-10-30 11:00', '呵呵', '大众', '基础事业', '汽车点子', '3');
INSERT INTO `schedule` VALUES ('2017-10-31 11:00', '网管10', '网管100', '网络安全', '网络安全', '0');
INSERT INTO `schedule` VALUES ('2017-10-31 11:00', 'java', '你好12', 'IT服务', '其他', '1');
INSERT INTO `schedule` VALUES ('2017-10-31 11:00', '人文', '测试注册跳转', '汽车点子', '基础事业', '2');
INSERT INTO `schedule` VALUES ('2017-10-31 11:00', '19413', '网管1', '东软遍在', '网络安全', '3');

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `t_name` varchar(255) NOT NULL,
  `t_password` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  PRIMARY KEY (`t_name`),
  KEY `department` (`department`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`department`) REFERENCES `department` (`p_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('194123', '123456', '东软遍在', 'user');
INSERT INTO `team` VALUES ('19413', '123456', '东软遍在', 'user');
INSERT INTO `team` VALUES ('194213', '123456', '东软遍在', 'user');
INSERT INTO `team` VALUES ('aaa', '123456', '东软遍在', 'user');
INSERT INTO `team` VALUES ('admin', 'nihaoadmin', '其他', 'admin');
INSERT INTO `team` VALUES ('apm', 'aaaaaa', '其他', 'user');
INSERT INTO `team` VALUES ('apm123', 'aaaaaa', '汽车点子', 'user');
INSERT INTO `team` VALUES ('c', '123456', 'IT服务', 'user');
INSERT INTO `team` VALUES ('cpu', '123456', 'IT服务', 'user');
INSERT INTO `team` VALUES ('java', '123456', 'IT服务', 'user');
INSERT INTO `team` VALUES ('nihao', '111111', '汽车点子', 'user');
INSERT INTO `team` VALUES ('ninininini', '123456', '基础事业', 'user');
INSERT INTO `team` VALUES ('USB', '123456', 'IT服务', 'user');
INSERT INTO `team` VALUES ('一汽', '123456', '汽车点子', 'user');
INSERT INTO `team` VALUES ('中文', '123456', '东软遍在', 'user');
INSERT INTO `team` VALUES ('中文测试', '123456', '东软遍在', 'user');
INSERT INTO `team` VALUES ('丰田', '123456', '汽车点子', 'user');
INSERT INTO `team` VALUES ('主机', '123456', 'IT服务', 'user');
INSERT INTO `team` VALUES ('主线', '123456', 'IT服务', 'user');
INSERT INTO `team` VALUES ('人文', '123456', '汽车点子', 'user');
INSERT INTO `team` VALUES ('你好', '123456', '其他', 'user');
INSERT INTO `team` VALUES ('你好1', '123456', '其他', 'user');
INSERT INTO `team` VALUES ('你好12', '123456', '其他', 'user');
INSERT INTO `team` VALUES ('你好2', '123456', '东软熙康', 'user');
INSERT INTO `team` VALUES ('你好3', '123456', '其他', 'user');
INSERT INTO `team` VALUES ('你好4', '123456', '其他', 'user');
INSERT INTO `team` VALUES ('你好5', '123456', '东软熙康', 'user');
INSERT INTO `team` VALUES ('光盘', '123456', 'IT服务', 'user');
INSERT INTO `team` VALUES ('内存', '123456', 'IT服务', 'user');
INSERT INTO `team` VALUES ('呵呵', '123456', '基础事业', 'user');
INSERT INTO `team` VALUES ('呵呵2', '123456', '基础事业', 'user');
INSERT INTO `team` VALUES ('呵呵3', '123456', '基础事业', 'user');
INSERT INTO `team` VALUES ('呵呵4', '123456', '基础事业', 'user');
INSERT INTO `team` VALUES ('呵呵5', '123456', '基础事业', 'user');
INSERT INTO `team` VALUES ('呵呵6', '123456', '基础事业', 'user');
INSERT INTO `team` VALUES ('大众', '123456', '汽车点子', 'user');
INSERT INTO `team` VALUES ('宝马', '123456', '汽车点子', 'user');
INSERT INTO `team` VALUES ('数据库', '123456', 'IT服务', 'user');
INSERT INTO `team` VALUES ('数据线', '123456', 'IT服务', 'user');
INSERT INTO `team` VALUES ('显卡', '123456', 'IT服务', 'user');
INSERT INTO `team` VALUES ('测试', '123456', '基础事业', 'user');
INSERT INTO `team` VALUES ('测试1', '123456', '基础事业', 'user');
INSERT INTO `team` VALUES ('测试10', '123456', '网络安全', 'user');
INSERT INTO `team` VALUES ('测试2', '123456', '基础事业', 'user');
INSERT INTO `team` VALUES ('测试3', '123456', '基础事业', 'user');
INSERT INTO `team` VALUES ('测试4', '123456', '基础事业', 'user');
INSERT INTO `team` VALUES ('测试8', '123456', '基础事业', 'user');
INSERT INTO `team` VALUES ('测试注册跳转', '123456', '基础事业', 'user');
INSERT INTO `team` VALUES ('硬盘', '123456', 'IT服务', 'user');
INSERT INTO `team` VALUES ('磁盘', '123456', 'IT服务', 'user');
INSERT INTO `team` VALUES ('网卡', '123456', 'IT服务', 'user');
INSERT INTO `team` VALUES ('网管', '123456', '网络安全', 'user');
INSERT INTO `team` VALUES ('网管1', '123456', '网络安全', 'user');
INSERT INTO `team` VALUES ('网管10', '123456', '网络安全', 'user');
INSERT INTO `team` VALUES ('网管100', '123456', '网络安全', 'user');
INSERT INTO `team` VALUES ('网管3', '123456', '网络安全', 'user');
INSERT INTO `team` VALUES ('网管4', '123456', '网络安全', 'user');
INSERT INTO `team` VALUES ('网管5', '123456', '网络安全', 'user');
INSERT INTO `team` VALUES ('网管6', '123456', '网络安全', 'user');
INSERT INTO `team` VALUES ('网管7', '123456', '网络安全', 'user');
INSERT INTO `team` VALUES ('网管8', '123456', '网络安全', 'user');
INSERT INTO `team` VALUES ('网管9', '123456', '网络安全', 'user');
INSERT INTO `team` VALUES ('网线', '123456', 'IT服务', 'user');
INSERT INTO `team` VALUES ('跳转测试', '123456', '东软遍在', 'user');
INSERT INTO `team` VALUES ('逗你玩', '123456', '东软遍在', 'user');
INSERT INTO `team` VALUES ('逗你玩1', '123456', '东软熙康', 'user');
INSERT INTO `team` VALUES ('逗你玩13', '123456', '东软熙康', 'user');
INSERT INTO `team` VALUES ('逗你玩134', '123456', '东软熙康', 'user');
INSERT INTO `team` VALUES ('逗你玩3', '123456', '基础事业', 'user');
