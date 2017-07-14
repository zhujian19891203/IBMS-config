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

SET FOREIGN_KEY_CHECKS=0;


-- ----------------------------
-- qrtz_*表主要跟定时器相关，暂时用不到
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for query_config
-- ----------------------------
DROP TABLE IF EXISTS `query_config`;
CREATE TABLE `query_config` (
  `id` varchar(36) NOT NULL,
  `columnsName` longtext,
  `pageName` longtext,
  `queryId` varchar(255) DEFAULT NULL,
  `userid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- tbl_*表主要跟业务相关，部分表暂时没用到
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_demo_generator
-- ----------------------------
DROP TABLE IF EXISTS `tbl_demo_generator`;
CREATE TABLE `tbl_demo_generator` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `isEnable` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dict_nation` tinyblob,
  `remark` longtext,
  `salary` double DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `enable` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tbl_dict
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dict`;
CREATE TABLE `tbl_dict` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `code` varchar(200) DEFAULT NULL,
  `levelCode` varchar(36) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `parent_id` varchar(200) DEFAULT NULL,
  `remark` longtext,
  `value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_dict` VALUES ('402881ec54b7493f0154b7113e8f0008', now(), '0', now(), '0', 'INTENTION', '000029000002', '意向', '402881ec54b7493f0154b7545e8f0008', '', '');
INSERT INTO `tbl_dict` VALUES ('402881ec54b7493f0154b7115e8f0008', now(), '0', now(), '0', 'FORMAL', '000029000003', '正式', '402881ec54b7493f0154b7545e8f0008', '', '');
INSERT INTO `tbl_dict` VALUES ('402881ec54b7493f0154b7135e8f0008', now(), '0', now(), '0', 'CONSULTING', '000029000001', '咨询', '402881ec54b7493f0154b7545e8f0008', '', '');
INSERT INTO `tbl_dict` VALUES ('402881ec54b7493f0154b75082770007', now(), '0', now(), '0', 'PPSITION', '000028', '职务', null, '', '');
INSERT INTO `tbl_dict` VALUES ('402881ec54b7493f0154b7514e8f0008', now(), '0', now(), '0', 'SELL', '000028000001', '销售', '402881ec54b7493f0154b75082770007', '', '');
INSERT INTO `tbl_dict` VALUES ('402881ec54b7493f0154b7545e8f0008', now(), '0', now(), '0', 'STATES', '000029', '阶段', null, '', '');
INSERT INTO `tbl_dict` VALUES ('402881ef557b216701557b2f29cf0000', now(), '0', now(), '0', 'CLIENTLEVEL', '000080', '客户级别', null, null, null);
INSERT INTO `tbl_dict` VALUES ('402881ef557b216701557b3111bc0001', now(), '0', now(), '0', 'CLIENTLEVEL_1', '000080000001', '战略客户', '402881ef557b216701557b2f29cf0000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881ef557b216701557b31931a0002', now(), '0', now(), '0', 'CLIENTLEVEL_3', '000080000002', '一般客户', '402881ef557b216701557b2f29cf0000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881ef557b216701557b31fca00003', now(), '0', now(), '0', 'CLIENTLEVEL_3', '000080000003', '重点客户', '402881ef557b216701557b2f29cf0000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881ef557b216701557b45fca00003', now(), '0', now(), '0', 'POSITIONS', '000033', '职位', null, null, null);
INSERT INTO `tbl_dict` VALUES ('402881ef557b216701565b45fca00003', now(), '0', now(), '0', 'MANAGER', '000033000001', '经理', '402881ef557b216701557b45fca00003', null, null);
INSERT INTO `tbl_dict` VALUES ('402881ef557b216701675b45fca00003', now(), '0', now(), '0', 'CUSTOMER', '000033000002', '客服', '402881ef557b216701557b45fca00003', null, null);
INSERT INTO `tbl_dict` VALUES ('402881f053b726080153b72893a60000', now(), '0', now(), '0', 'ACCOUNTCHECKTYPE', '000011', '对账类型', '', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053b726080153b7294a1d0001', now(), '0', now(), '0', 'MONTH_CHECK', '000011000001', '月结', '402881f053b726080153b72893a60000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053b726080153b72986f80002', now(), '0', now(), '0', 'HQ_CHECK', '000011000002', '票到', '402881f053b726080153b72893a60000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053b726080153b74586f80002', now(), '0', now(), '0', 'PRE_CHECK', '000011000003', '预付', '402881f053b726080153b72893a60000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053cd670d0153cd6d6be40000', now(), '0', now(), '0', 'EDUCATION', '000017', '学历', null, '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053cd72330153cd78bacf0000', now(), '0', now(), '0', 'EDUCATIONCOLLEGE', '000017000001', '本科', '402881f053cd670d0153cd6d6be40000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053cd72330153cd796ac90001', now(), '0', now(), '0', 'EDUCATIONHIGHSCHOOL', '000017000002', '高中', '402881f053cd670d0153cd6d6be40000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053cd72330153cd80b46c0002', now(), '0', now(), '0', 'EDUCATIONPRIMARY', '000017000003', '小学', '402881f053cd670d0153cd6d6be40000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053cd72330153cd8153450003', now(), '0', now(), '0', 'EDUCATIONJUNIOR', '000017000004', '初中', '402881f053cd670d0153cd6d6be40000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053cd72330153cd820b960004', now(), '0', now(), '0', 'EDUCATIONDOCTOR', '000017000005', '博士', '402881f053cd670d0153cd6d6be40000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053cd72330153cd82a79d0005', now(), '0', now(), '0', 'EDUCATIONMASTER', '000017000006', '硕士', '402881f053cd670d0153cd6d6be40000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053cd72330153cd8384590006', now(), '0', now(), '0', 'EDUCATIONJUNIORCOLLEGE', '000017000007', '大专', '402881f053cd670d0153cd6d6be40000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4a5260153d4a845920001', now(), '0', now(), '0', 'TAXPAYERTYPE', '000019', '纳税人', null, '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4a5260153d4a9d0f00002', now(), '0', now(), '0', 'GENERALTAXPAYER', '000019000001', '一般纳税人', '402881f053d4a5260153d4a845920001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4a5260153d4ab6b110003', now(), '0', now(), '0', 'SMALLSCALETAXPAYER', '000019000002', '小规模纳税人', '402881f053d4a5260153d4a845920001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4a5260153d4ab6b130003', now(), '0', now(), '0', 'GTAXPAYER', '000019000003', '个体工商户', '402881f053d4a5260153d4a845920001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4a5260153d4aceaf20004', now(), '0', now(), '0', 'CAPITALTYPE', '000020', '企业性质', null, '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4a5260153d4ae22ee0005', now(), '0', now(), '0', 'OVERSEASFUNDED', '000020000001', '外资企业', '402881f053d4a5260153d4aceaf20004', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4a5260153d4aeadd20006', now(), '0', now(), '0', 'STATEOWNED', '000020000002', '国营企业', '402881f053d4a5260153d4aceaf20004', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4a5260153d4af6f1a0007', now(), '0', now(), '0', 'JOINTVENTURE', '000020000003', '合资企业', '402881f053d4a5260153d4aceaf20004', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4a5260153d4b0a80c0008', now(), '0', now(), '0', 'PRIVATE', '000020000004', '民营企业', '402881f053d4a5260153d4aceaf20004', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4eccd0153d5117aac0001', now(), '0', now(), '0', 'SETTLEMENTTYPE', '000021', '结算方式', null, '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4eccd0153d512a8580002', now(), '0', now(), '0', 'HQ_SETTLE', '000021000001', '统一结算', '402881f053d4eccd0153d5117aac0001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4eccd0153d513a0260003', now(), '0', now(), '0', 'INDIVIDUAL_SETTLE', '000021000002', '独立结算', '402881f053d4eccd0153d5117aac0001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e570c0890001', now(), '0', now(), '0', 'NATION', '000023', '民族', null, '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57116300002', now(), '0', now(), '0', 'NATION01', '000023000001', '汉族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5716e790003', now(), '0', now(), '0', 'NATION02', '000023000002', '蒙古族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e571c0f60004', now(), '0', now(), '0', 'NATION03', '000023000003', '回族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5723ada0005', now(), '0', now(), '0', 'NATION04', '000023000004', '藏族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57269ca0006', now(), '0', now(), '0', 'NATION05', '000023000005', '维吾尔族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57293c20007', now(), '0', now(), '0', 'NATION06', '000023000006', '苗族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e572e34c0008', now(), '0', now(), '0', 'NATION07', '000023000007', '彝族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5732caf0009', now(), '0', now(), '0', 'NATION08', '000023000008', '壮族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57366fb000a', now(), '0', now(), '0', 'NATION09', '000023000009', '布依族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5739474000b', now(), '0', now(), '0', 'NATION10', '000023000010', '朝鲜族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e573cc35000c', now(), '0', now(), '0', 'NATION11', '000023000011', '满族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5743c21000d', now(), '0', now(), '0', 'NATION12', '000023000012', '侗族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5747f53000e', now(), '0', now(), '0', 'NATION13', '000023000013', '瑶族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e574b560000f', now(), '0', now(), '0', 'NATION14', '000023000014', '白族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57575d20010', now(), '0', now(), '0', 'NATION15', '000023000015', '土家族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5759d8f0011', now(), '0', now(), '0', 'NATION16', '000023000016', '哈尼族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e575d9640012', now(), '0', now(), '0', 'NATION17', '000023000017', '哈萨克族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5761ee30013', now(), '0', now(), '0', 'NATION18', '000023000018', '傣族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5764cfb0014', now(), '0', now(), '0', 'NATION18', '000023000019', '黎族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5768eff0015', now(), '0', now(), '0', 'NATION20', '000023000020', '傈僳族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e576c05a0016', now(), '0', now(), '0', 'NATION21', '000023000021', '佤族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5771fb10017', now(), '0', now(), '0', 'NATION22', '000023000022', '畲族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e577754f0018', now(), '0', now(), '0', 'NATION23', '000023000023', '高山族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e577d8220019', now(), '0', now(), '0', 'NATION24', '000023000024', '拉祜族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57840d4001a', now(), '0', now(), '0', 'NATION25', '000023000025', '水族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e578beac001b', now(), '0', now(), '0', 'NATION26', '000023000026', '东乡族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e579cc50001c', now(), '0', now(), '0', 'NATION27', '000023000027', '纳西族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57a4b49001d', now(), '0', now(), '0', 'NATION28', '000023000028', '景颇族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57ab2ed001e', now(), '0', now(), '0', 'NATION29', '000023000029', '柯尔克孜族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57aeb4a001f', now(), '0', now(), '0', 'NATION30', '000023000030', '土族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57bb0c20020', now(), '0', now(), '0', 'NATION31', '000023000031', '达斡尔族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57c1cb50021', now(), '0', now(), '0', 'NATION32', '000023000032', '仫佬族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57c71630022', now(), '0', now(), '0', 'NATION33', '000023000033', '羌族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57cb5aa0023', now(), '0', now(), '0', 'NATION34', '000023000034', '布朗族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57d27c90024', now(), '0', now(), '0', '35', '000023000035', '撒拉族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57df9a10025', now(), '0', now(), '0', 'NATION36', '000023000036', '毛难族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57e48b80026', now(), '0', now(), '0', 'NATION37', '000023000037', '仡佬族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57e8b080027', now(), '0', now(), '0', 'NATION38', '000023000038', '锡伯族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57ebe990028', now(), '0', now(), '0', 'NATION', '000023000039', '阿昌族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57ef9f50029', now(), '0', now(), '0', 'NATION40', '000023000040', '普米族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57f6094002a', now(), '0', now(), '0', 'NATION41', '000023000041', '塔吉克族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57fbe0b002b', now(), '0', now(), '0', 'NATION42', '000023000042', '怒族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57ffd10002c', now(), '0', now(), '0', 'NATION43', '000023000043', '乌兹别克', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5802506002d', now(), '0', now(), '0', 'NATION44', '000023000044', '俄罗斯族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e58066c6002e', now(), '0', now(), '0', 'NATION45', '000023000045', '鄂温克族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e580a981002f', now(), '0', now(), '0', 'NATION46', '000023000046', '崩龙族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e580e3540030', now(), '0', now(), '0', 'NATION47', '000023000047', '保安族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5813d0a0031', now(), '0', now(), '0', 'NATION48', '000023000048', '裕固族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e581adce0032', now(), '0', now(), '0', 'NATION49', '000023000049', '京族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e581eb050033', now(), '0', now(), '0', 'NATION50', '000023000050', '塔塔尔族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e582223b0034', now(), '0', now(), '0', 'NATION51', '000023000051', '独龙族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e58269950035', now(), '0', now(), '0', 'NATION52', '000023000052', '鄂伦春族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e582c7b80036', now(), '0', now(), '0', 'NATION53', '000023000053', '赫哲族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e58307aa0037', now(), '0', now(), '0', 'NATION54', '000023000054', '门巴族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e583596a0038', now(), '0', now(), '0', 'NATION55', '000023000055', '珞巴族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5838d9c0039', now(), '0', now(), '0', 'NATION56', '000023000056', '基诺族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053f983b00153f98597fd0000', now(), '0', now(), '0', 'MESSAGETYPE', '000024', '站内信类型', null, '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053f983b00153f986e77c0001', now(), '0', now(), '0', 'MESSAGEPRODUCT', '000024000001', '生产', '402881f053f983b00153f98597fd0000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053f983b00153f98822340002', now(), '0', now(), '0', 'MESSAGEMARKET', '000024000002', '销售', '402881f053f983b00153f98597fd0000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053f983b00153f988e3190003', now(), '0', now(), '0', 'MESSAGEDELIVERY', '000024000003', '送货', '402881f053f983b00153f98597fd0000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053f983b00153f989be130004', now(), '0', now(), '0', 'MESSAGEPURCHASE', '000024000004', '采购', '402881f053f983b00153f98597fd0000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f0540024cd0154003bae140006', now(), '0', now(), '0', 'INFORM', '000024000005', '通知', '402881f053f983b00153f98597fd0000', '', '');
INSERT INTO `tbl_dict` VALUES ('402882f453c561fa0153c5647ce00003', now(), '0', now(), '0', 'CHANNELTYPE', '000013', '来源', null, '', '');
INSERT INTO `tbl_dict` VALUES ('402882f453c561fa0153c56598ee0004', now(), '0', now(), '0', 'CHANNELTYPEACTIVITY', '000013000001', '推广活动', '402882f453c561fa0153c5647ce00003', '', '');
INSERT INTO `tbl_dict` VALUES ('402882f453c561fa0153c565dd6b0005', now(), '0', now(), '0', 'CHANNELTYPETEL', '000013000002', '电话咨询', '402882f453c561fa0153c5647ce00003', '', '');
INSERT INTO `tbl_dict` VALUES ('402882f453cf94730153cf96f8e40000', now(), '0', now(), '0', 'SUPPLIERLEVEL', '000018', '供应商级别', null, '', '');
INSERT INTO `tbl_dict` VALUES ('402882f453cf94730153cf97dbc30001', now(), '0', now(), '0', 'SUPPLIERLEVELSILVER', '000018000001', '一般供应商', '402882f453cf94730153cf96f8e40000', '', '');
INSERT INTO `tbl_dict` VALUES ('402882f453cf94730153cf9834bd0002', now(), '0', now(), '0', 'SUPPLIERLEVELGOLD', '000018000002', '重点供应商', '402882f453cf94730153cf96f8e40000', '', '');
INSERT INTO `tbl_dict` VALUES ('402882f453cf94730153cf98f3fa0003', now(), '0', now(), '0', 'SUPPLIERLEVELDIAMOND', '000018000003', '战略供应商', '402882f453cf94730153cf96f8e40000', '', '');
INSERT INTO `tbl_dict` VALUES ('8a2c43d853f918e30153f92417ab0004', now(), '0', now(), '0', 'CHANNELTYPEMEDIA', '000013000003', '媒体广告', '402882f453c561fa0153c5647ce00003', '', '');
INSERT INTO `tbl_dict` VALUES ('8a2c43d853f918e30153f92589ad0005', now(), '0', now(), '0', 'CHANNELTYPEPEINTRO', '000013000004', '熟人推荐', '402882f453c561fa0153c5647ce00003', '', '');
INSERT INTO `tbl_dict` VALUES ('8a2c43d853f918e30153f928e92e0006', now(), '0', now(), '0', 'CHANNELTYPEOTHERS', '000013000005', '其他', '402882f453c561fa0153c5647ce00003', '', '');
INSERT INTO `tbl_dict` VALUES ('bc4d163c5880ab4901588b5582360001', now(), '0', now(), '0', 'TEXT', '000024000006', '短信', '402881f053f983b00153f98597fd0000', '', '');
INSERT INTO `tbl_dict` VALUES ('bc4d163c5880ab4901588b5b49080002', now(), '0', now(), '0', 'HANZU', '000023000057', '汉族', '402881f053e55e710153e570c0890001', '', '');


-- ----------------------------
-- Table structure for tbl_file
-- ----------------------------
DROP TABLE IF EXISTS `tbl_file`;
CREATE TABLE `tbl_file` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `create_user_id` varchar(255) DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  `fileSize` bigint(20) DEFAULT NULL,
  `form_ID` varchar(255) DEFAULT NULL,
  `savedName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tbl_function_filter
-- ----------------------------
DROP TABLE IF EXISTS `tbl_function_filter`;
CREATE TABLE `tbl_function_filter` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `class_type` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `functionId` varchar(255) DEFAULT NULL,
  `roleId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tbl_markdown
-- ----------------------------
DROP TABLE IF EXISTS `tbl_markdown`;
CREATE TABLE `tbl_markdown` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `content` longtext,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_markdown` VALUES ('402880e958ecdff60158ed0c62ba0001', now(), '0', now(), '0', 'Markdown,关键字', '欢迎使用Markdown编辑器写文章', null, '# 欢迎使用Markdown编辑器写文章\n\n本Markdown编辑器使用**Editor.md**修改而来，用它写技术文章，将会带来全新的体验哦：\n\n- **Markdown和扩展Markdown简洁的语法**\n- **代码块高亮**\n- **图片链接和图片上传**\n- ***LaTex*数学公式**\n- **UML序列图和流程图**\n- **离线写文章**\n- **导入导出Markdown文件**\n- **丰富的快捷键**\n-------------------\n\n## 快捷键\n\n - 加粗     `Ctrl + B`\n - 斜体     `Ctrl + I`\n - 引用     `Ctrl + Q`\n - 插入链接    `Ctrl + L`\n - 插入代码    `Ctrl + K`\n - 插入图片    `Ctrl + G`\n - 提升标题    `Ctrl + H`\n - 有序列表    `Ctrl + O`\n - 无序列表    `Ctrl + U`\n - 横线    `Ctrl + R`\n - 撤销    `Ctrl + Z`\n - 重做    `Ctrl + Y`\n\n## Markdown及扩展\n\n> Markdown 是一种轻量级标记语言，它允许人们使用易读易写的纯文本格式编写文档，然后转换成格式丰富的HTML页面。    —— <a href=\"https://zh.wikipedia.org/wiki/Markdown\" target=\"_blank\"> [ 维基百科 ]\n\n使用简单的符号标识不同的标题，将某些文字标记为**粗体**或者*斜体*，创建一个[链接](http://www.csdn.net)等，详细语法参考帮助？。\n\n本编辑器支持 **Markdown Extra** , 　扩展了很多好用的功能。具体请参考[Github][2].\n\n### 表格\n\n**Markdown　Extra**　表格语法：\n\n项目     | 价格\n-------- | ---\nComputer | $1600\nPhone    | $12\nPipe     | $1\n\n可以使用冒号来定义对齐方式：\n\n| 项目      |    价格 | 数量  |\n| :-------- | --------:| :--: |\n| Computer  | 1600 元 |  5   |\n| Phone     |   12 元 |  12  |\n| Pipe      |    1 元 | 234  |\n\n\n### 代码块\n代码块语法遵循标准markdown代码，例如：\n``` python\n@requires_authorization\ndef somefunc(param1=\'\', param2=0):\n    \'\'\'A docstring\'\'\'\n    if param1 > param2: # interesting\n        print \'Greater\'\n    return (param2 - param1 + 1) or None\nclass SomeClass:\n    pass\n>>> message = \'\'\'interpreter\n... prompt\'\'\'\n```\n\n\n### 目录\n用 `[TOC]`来生成目录：\n\n[TOC]\n\n### 数学公式\n使用MathJax渲染*LaTex* 数学公式，详见[math.stackexchange.com][1].\n\n - 行内公式，数学公式为：$\\Gamma(n) = (n-1)!\\quad\\forall n\\in\\mathbb N$。\n - 块级公式：\n\n$$  x = \\dfrac{-b \\pm \\sqrt{b^2 - 4ac}}{2a} $$\n\n更多LaTex语法请参考 [这儿][3].\n\n### UML 图:\n\n可以渲染序列图：\n\n```sequence\n张三->李四: 嘿，小四儿, 写博客了没?\nNote right of 李四: 李四愣了一下，说：\n李四-->张三: 忙得吐血，哪有时间写。\n```\n\n或者流程图：\n\n```flow\nst=>start: 开始\ne=>end: 结束\nop=>operation: 我的操作\ncond=>condition: 确认？\n\nst->op->cond\ncond(yes)->e\ncond(no)->op\n```\n\n- 关于 **序列图** 语法，参考 [这儿][4],\n- 关于 **流程图** 语法，参考 [这儿][5].\n\n## 离线写博客\n\n即使用户在没有网络的情况下，也可以通过本编辑器离线写文章（直接在曾经使用过的浏览器中输入[write.blog.csdn.net/mdeditor](http://write.blog.csdn.net/mdeditor)即可。**Markdown编辑器**使用浏览器离线存储将内容保存在本地。\n\n用户写文章的过程中，内容实时保存在浏览器缓存中，在用户关闭浏览器或者其它异常情况下，内容不会丢失。用户再次打开浏览器时，会显示上次用户正在编辑的没有发表的内容。\n\n文章发表后，本地缓存将被删除。\n\n用户可以选择 <i class=\"icon-disk\"></i> 把正在写的文章保存到服务器草稿箱，即使换浏览器或者清除缓存，内容也不会丢失。\n\n> **注意：**虽然浏览器存储大部分时候都比较可靠，但为了您的数据安全，在联网后，**请务必及时发表或者保存到服务器草稿箱**', null);


-- ----------------------------
-- Table structure for tbl_message
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message`;
CREATE TABLE `tbl_message` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `messageFlag` varchar(255) DEFAULT NULL,
  `messageStatus` varchar(255) DEFAULT NULL,
  `messageType` varchar(255) DEFAULT NULL,
  `receiveUsers` longtext,
  `remark` longtext,
  `sendContent` longtext,
  `sendSubject` varchar(255) DEFAULT NULL,
  `sendTime` datetime DEFAULT NULL,
  `sendUser` varchar(255) DEFAULT NULL,
  `sendUserID` varchar(255) DEFAULT NULL,
  `fileIds` longtext,
  `receiverIds` longtext,
  `receiverType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tbl_message_attachment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message_attachment`;
CREATE TABLE `tbl_message_attachment` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `messageid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mcncia3i9t8e3sakiasxap8gw` (`messageid`),
  CONSTRAINT `FK_mcncia3i9t8e3sakiasxap8gw` FOREIGN KEY (`messageid`) REFERENCES `tbl_message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tbl_message_group
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message_group`;
CREATE TABLE `tbl_message_group` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` longtext,
  `sort` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tbl_message_group_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message_group_user`;
CREATE TABLE `tbl_message_group_user` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `group_id` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tbl_message_receiver
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message_receiver`;
CREATE TABLE `tbl_message_receiver` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `isRead` varchar(255) DEFAULT NULL,
  `messageFlag` varchar(255) DEFAULT NULL,
  `messageType` varchar(255) DEFAULT NULL,
  `readTime` datetime DEFAULT NULL,
  `receiveAddress` varchar(255) DEFAULT NULL,
  `receiveUserID` varchar(255) DEFAULT NULL,
  `remark` longtext,
  `message` varchar(36) DEFAULT NULL,
  `readYet` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4opt20g1s1vej8lay6pb31sdp` (`message`),
  CONSTRAINT `FK_4opt20g1s1vej8lay6pb31sdp` FOREIGN KEY (`message`) REFERENCES `tbl_message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tbl_simple_mail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_simple_mail`;
CREATE TABLE `tbl_simple_mail` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `content` longtext,
  `mail_type` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `fromUser` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tbl_user_avatar
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_avatar`;
CREATE TABLE `tbl_user_avatar` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tbl_user_oauth
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_oauth`;
CREATE TABLE `tbl_user_oauth` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `oauth_id` varchar(255) DEFAULT NULL,
  `oauth_type` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;








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

INSERT INTO `tbl_function` VALUES ('402880eb58d9a6d40158d9a7b21f0000', now(), '0', now(), '0', 'SYSTEM_CONFIG', '0', 'fa fa-cogs', '000001', '系统设置', '', '', '');
INSERT INTO `tbl_function` VALUES ('4028818a56d407950156d41352630000', now(), '0', now(), '0', 'AUTH_MANAGEMENT', '0', 'fa fa-shield', '000002', '权限管理', '', '', '');
INSERT INTO `tbl_function` VALUES ('4028818a56d407950156d41435830001', now(), '0', now(), '0', 'USER_MANAGEMENT', '1', 'fa fa-user', '000002000001', '用户管理', '4028818a56d407950156d41352630000', '', '/user/list');
INSERT INTO `tbl_function` VALUES ('4028818a56d407950156d41d32ab0003', now(), '0', now(), '0', 'FUNCTION_MANAGEMENT', '1', 'fa fa-key', '000002000003', '功能管理', '4028818a56d407950156d41352630000', '', '/function/tree');
INSERT INTO `tbl_function` VALUES ('4028818a56d407950156d4ecfafa0004', now(), '0', now(), '0', 'ROLE_MANAGEMENT', '1', 'fa fa-odnoklassniki-square', '000002000002', '角色管理', '4028818a56d407950156d41352630000', '', '/role/list');
INSERT INTO `tbl_function` VALUES ('4028b8815d3043ea015d3047ab020000', now(), '0', now(), '0', 'TAB_INFO_JSON', '1', 'fa fa-file-text-o', '000001000001', 'TAB信息配置', '402880eb58d9a6d40158d9a7b21f0000', '', '/jsoneditor/tabinfo');
INSERT INTO `tbl_function` VALUES ('4028b8815d3043ea015d30483e990001', now(), '0', now(), '0', 'PATROL_PATH_JSON', '1', 'fa fa-file-text-o', '000001000002', '巡逻路径配置', '402880eb58d9a6d40158d9a7b21f0000', '', '/jsoneditor/patrolpath');
INSERT INTO `tbl_function` VALUES ('4028b8815d3043ea015d30499f640002', now(), '0', now(), '0', 'CAMERA_INFO_CONFIG', '1', 'fa fa-file-excel-o', '000001000003', '摄像头信息配置', '402880eb58d9a6d40158d9a7b21f0000', '', '/excelimporter/camera');
INSERT INTO `tbl_function` VALUES ('4028b8815d3043ea015d304a51b30003', now(), '0', now(), '0', 'BUILDING_DEVICE_INFO_CONFIG', '1', 'fa fa-file-excel-o', '000001000004', '楼控信息配置', '402880eb58d9a6d40158d9a7b21f0000', '', '/excelimporter/buildingdevice');
INSERT INTO `tbl_function` VALUES ('8a8a807a59634b2801596364e33d0001', now(), '0', now(), '0', 'ROLE_FUNCTION', '1', 'fa fa-hand-o-right', '000002000004', '角色授权', '4028818a56d407950156d41352630000', '', '/rolefunc/list');


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

INSERT INTO `tbl_role` VALUES ('bc4d163c5880ab4901588b6681e50003', now(), '0', now(), '0', 'ADMIN', '管理员', '', '1');
INSERT INTO `tbl_role` VALUES ('4028818a56fd502f015700209b040000', now(), '0', now(), '0', 'USER', '普通用户', '', '2');


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

INSERT INTO `tbl_role_function` VALUES ('8a8a83295a8e4242015a8f49d1380000', now(), '0', now(), '0', '402880eb58d9a6d40158d9a7b21f0000', 'bc4d163c5880ab4901588b6681e50003', '');
INSERT INTO `tbl_role_function` VALUES ('8a8a83295a8e4242015a8f49d1610001', now(), '0', now(), '0', '4028818a56d407950156d41352630000', 'bc4d163c5880ab4901588b6681e50003', '');
INSERT INTO `tbl_role_function` VALUES ('8a8a83295a8e4242015a8f49d1620002', now(), '0', now(), '0', '402880eb58d9a6d40158d9a7b21f0000', '4028818a56fd502f015700209b040000', '');


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

INSERT INTO `tbl_user` VALUES ('8afa96f6564a787601564a818bf80002', now(), '0', now(), '0', null, null, null, 'admin', null, 'admin', null, '02040703080500070a020906020a0105090c0107', null, null, null, null, null);


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

INSERT INTO `tbl_user_role` VALUES ('4028819359637b580159638f46a00001', now(), '0', now(), '0', 'bc4d163c5880ab4901588b6681e50003', '8afa96f6564a787601564a818bf80002');


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
  `content` longtext NOT NULL,
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
  `content` longtext NOT NULL,
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
  `sheet_name` varchar(255) NOT NULL,
  `order_index` int(11) NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`order_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tbl_excelimporter_buildingdevice
-- ----------------------------
DROP TABLE IF EXISTS `tbl_excelimporter_buildingdevice`;
CREATE TABLE `tbl_excelimporter_buildingdevice` (
  `id` varchar(36) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `sheet_name` varchar(255) NOT NULL,
  `order_index` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL DEFAULT '',
  `devicename_or_objectname` varchar(255) NOT NULL,
  `deviceid_or_objectid` varchar(255) NOT NULL,
  `object_type` tinyint NOT NULL,
  `sensor` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`order_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;