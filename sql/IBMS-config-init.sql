/*
Source Host           : localhost:3306
Source Database       : IBMS_CONFIG
Target Server Type    : MYSQL
*/


-- ----------------------------
-- Create DB
-- ----------------------------
DROP DATABASE IF EXISTS `IBMS_CONFIG`;
CREATE DATABASE `IBMS_CONFIG`;

USE `IBMS_CONFIG`;


-- ----------------------------
-- Table structure for tbl_function
-- ----------------------------
DROP TABLE IF EXISTS `tbl_function`;
CREATE TABLE `tbl_function` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `functype` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `levelCode` varchar(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `remark` longtext,
  `url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tbl_role
-- ----------------------------
DROP TABLE IF EXISTS `tbl_role`;
CREATE TABLE `tbl_role` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remark` longtext,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tbl_role_function
-- ----------------------------
DROP TABLE IF EXISTS `tbl_role_function`;
CREATE TABLE `tbl_role_function` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `functionId` varchar(36) DEFAULT NULL,
  `roleId` varchar(36) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `open_account` varchar(5) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `telphone` varchar(255) DEFAULT NULL,
  `wechat` varchar(255) DEFAULT NULL,
  `isSuperAdmin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tbl_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_role`;
CREATE TABLE `tbl_user_role` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `roleId` varchar(36) DEFAULT NULL,
  `userId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ds15bcoaufaq7shnl3445nc3o` (`userId`) USING BTREE,
  CONSTRAINT `tbl_user_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tbl_jsoneditor_tabinfo
-- ----------------------------
DROP TABLE IF EXISTS `tbl_jsoneditor_tabinfo`;
CREATE TABLE `tbl_jsoneditor_tabinfo` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `tbl_jsoneditor_tabinfo` VALUES(uuid(), now(), now(), '0', '0', 'admin_init', '[{"tabindex":1,"title":"视频监控","type":"web","url":"file:///resources/VideoMonitor/index.html","rendering_engine":"WEBKIT"},{"tabindex":2,"title":"楼控系统","type":"web","url":"file:///resources/Building/index.html","rendering_engine":"WEBKIT"},{"tabindex":3,"title":"一卡通系统","type":"web","url":"http://172.16.143.5:8081","rendering_engine":"IE"},{"tabindex":4,"title":"食堂消费管理系统","type":"web","url":"http://172.16.143.5:8085","rendering_engine":"IE"},{"tabindex":5,"title":"其他子系统","type":"shortcut","appinfo":[{"app_name":"腾讯QQ","app_path":"C:/Program Files (x86)/Tencent/QQ/Bin/QQ.exe","app_params":"","icon_path":"resources/Icons/QQ.png","icon_width":80,"icon_height":80},{"app_name":"微信","app_path":"C:/Program Files (x86)/Tencent/WeChat/WeChat.exe","app_params":"","icon_path":"resources/Icons/wechat.png","icon_width":150,"icon_height":150},{"app_name":"腾讯官网","app_path":"C:/Program Files (x86)/Internet Explorer/iexplore.exe","app_params":"http://www.qq.com","icon_path":"resources/Icons/ie.png","icon_width":80,"icon_height":80}]}]');


-- ----------------------------
-- Table structure for tbl_jsoneditor_patrolpath
-- ----------------------------
DROP TABLE IF EXISTS `tbl_jsoneditor_patrolpath`;
CREATE TABLE `tbl_jsoneditor_patrolpath` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `tbl_jsoneditor_patrolpath` VALUES(uuid(), now(), now(), '0', '0', 'admin_init', '[{"dir_path":"data/DXSchool/camera_path/Camera001.txt","title":"漫游园区路径","frames":4600},{"dir_path":"data/DXSchool/camera_path/Camera002.txt","title":"展示大厅路径","frames":4002},{"dir_path":"data/DXSchool/camera_path/Camera003.txt","title":"鸟瞰花园","frames":550}]');


-- ----------------------------
-- Table structure for tbl_excelimporter_camera
-- ----------------------------
DROP TABLE IF EXISTS `tbl_excelimporter_camera`;
CREATE TABLE `tbl_excelimporter_camera` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;