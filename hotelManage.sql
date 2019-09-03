/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : jdgl

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 03/09/2019 21:31:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for clean_distory
-- ----------------------------
DROP TABLE IF EXISTS `clean_distory`;
CREATE TABLE `clean_distory` (
  `worker_id` int(8) NOT NULL,
  `room_num` int(3) DEFAULT NULL,
  `clean_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`clean_time`) USING BTREE,
  KEY `clean` (`worker_id`) USING BTREE,
  CONSTRAINT `clean` FOREIGN KEY (`worker_id`) REFERENCES `clean_worker` (`worker_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='clean	worker_id	jdgl	clean_worker	work_id	NO ACTION	NO ACTION\r\n';

-- ----------------------------
-- Table structure for clean_worker
-- ----------------------------
DROP TABLE IF EXISTS `clean_worker`;
CREATE TABLE `clean_worker` (
  `worker_id` int(4) NOT NULL AUTO_INCREMENT,
  `worker_name` varchar(255) DEFAULT NULL,
  `clean_num` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`worker_id`) USING BTREE,
  KEY `work_id` (`worker_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for custom
-- ----------------------------
DROP TABLE IF EXISTS `custom`;
CREATE TABLE `custom` (
  `id` char(18) NOT NULL,
  `costMoney` int(5) DEFAULT '0',
  `costType` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `sex` tinyint(2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `dic_name` varchar(255) DEFAULT NULL,
  `key` tinyint(1) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for jdorder
-- ----------------------------
DROP TABLE IF EXISTS `jdorder`;
CREATE TABLE `jdorder` (
  `order_id` int(8) NOT NULL AUTO_INCREMENT,
  `customer_id` char(18) DEFAULT NULL,
  `room` int(3) DEFAULT NULL,
  `money` int(8) DEFAULT NULL,
  `order_data` datetime DEFAULT NULL,
  `costThing` varchar(255) DEFAULT NULL,
  `do_person` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  KEY `0` (`customer_id`) USING BTREE,
  KEY `2` (`room`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `room_num` int(3) NOT NULL,
  `room_stat` tinyint(1) NOT NULL DEFAULT '0',
  `room_price` int(4) DEFAULT '110',
  `custom` char(18) DEFAULT NULL,
  `movein_date` datetime DEFAULT NULL,
  `moveout_date` datetime DEFAULT NULL,
  PRIMARY KEY (`room_num`) USING BTREE,
  KEY `r` (`room_stat`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for salary_distory
-- ----------------------------
DROP TABLE IF EXISTS `salary_distory`;
CREATE TABLE `salary_distory` (
  `salary` int(5) NOT NULL,
  `worker_id` int(4) NOT NULL,
  `do_date` datetime DEFAULT NULL,
  KEY `worker` (`worker_id`) USING BTREE,
  CONSTRAINT `worker` FOREIGN KEY (`worker_id`) REFERENCES `clean_worker` (`worker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for vip
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `vip_type` tinyint(1) DEFAULT '0',
  `integral` int(8) DEFAULT '0',
  `idCard` char(18) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `sex` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `v` (`vip_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20551021 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for worker
-- ----------------------------
DROP TABLE IF EXISTS `worker`;
CREATE TABLE `worker` (
  `worker_id` int(5) NOT NULL,
  `worker_type` tinyint(1) NOT NULL DEFAULT '0',
  `passwd` varchar(255) NOT NULL,
  `worker_sex` tinyint(1) NOT NULL,
  `worker_name` varchar(255) DEFAULT NULL,
  `cleanRoom` int(3) DEFAULT NULL,
  PRIMARY KEY (`worker_id`,`worker_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Procedure structure for p_test
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_test`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_test`()
BEGIN
update room set room_stat = 0;
END;
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
