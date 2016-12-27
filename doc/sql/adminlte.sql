/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : adminlte

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2016-12-27 11:01:10
*/

SET FOREIGN_KEY_CHECKS=0;

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
-- Records of query_config
-- ----------------------------

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

-- ----------------------------
-- Records of tbl_dict
-- ----------------------------
INSERT INTO `tbl_dict` VALUES ('402880ef563c0d2801563e6558a80008', '2016-07-31 08:40:44', '0', '2016-07-31 08:40:44', '0', 'test', '000024000001000001', 'tester8', '402881f053f983b00153f986e77c0001', '', '');
INSERT INTO `tbl_dict` VALUES ('402880ef563c0d2801563e65898a0009', '2016-07-31 08:40:56', '0', '2016-07-31 08:40:56', '0', 'tt', '000024000001000002', 'ttt', '402881f053f983b00153f986e77c0001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881ec54b7493f0154b7113e8f0008', null, '0', '2016-06-23 10:53:13', '1', 'INTENTION', '000029000002', '意向', '402881ec54b7493f0154b7545e8f0008', '', '');
INSERT INTO `tbl_dict` VALUES ('402881ec54b7493f0154b7115e8f0008', null, '0', '2016-06-23 10:57:06', '1', 'FORMAL', '000029000003', '正式', '402881ec54b7493f0154b7545e8f0008', '', '');
INSERT INTO `tbl_dict` VALUES ('402881ec54b7493f0154b7135e8f0008', null, '0', '2016-06-23 10:56:34', '1', 'CONSULTING', '000029000001', '咨询', '402881ec54b7493f0154b7545e8f0008', '', '');
INSERT INTO `tbl_dict` VALUES ('402881ec54b7493f0154b75082770007', null, '0', null, '0', 'PPSITION', '000028', '职务', null, '', '');
INSERT INTO `tbl_dict` VALUES ('402881ec54b7493f0154b7514e8f0008', null, '0', null, '2', 'SELL', '000028000001', '销售', '402881ec54b7493f0154b75082770007', '', '');
INSERT INTO `tbl_dict` VALUES ('402881ec54b7493f0154b7545e8f0008', null, '0', '2016-06-23 12:19:26', '4', 'STATES', '000029', '阶段', null, '', '');
INSERT INTO `tbl_dict` VALUES ('402881ef557b216701557b2f29cf0000', '2016-06-23 10:55:36', '0', '2016-06-23 10:55:36', '0', 'CLIENTLEVEL', '000080', '客户级别', null, null, null);
INSERT INTO `tbl_dict` VALUES ('402881ef557b216701557b3111bc0001', '2016-06-23 10:57:41', '0', '2016-06-23 10:57:41', '0', 'CLIENTLEVEL_1', '000080000001', '战略客户', '402881ef557b216701557b2f29cf0000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881ef557b216701557b31931a0002', '2016-06-23 10:58:14', '0', '2016-06-23 10:58:14', '0', 'CLIENTLEVEL_3', '000080000002', '一般客户', '402881ef557b216701557b2f29cf0000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881ef557b216701557b31fca00003', '2016-06-23 10:58:41', '0', '2016-06-23 10:58:41', '0', 'CLIENTLEVEL_3', '000080000003', '重点客户', '402881ef557b216701557b2f29cf0000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881ef557b216701557b45fca00003', null, '0', null, '0', 'POSITIONS', '000033', '职位', null, null, null);
INSERT INTO `tbl_dict` VALUES ('402881ef557b216701565b45fca00003', null, '0', null, '0', 'MANAGER', '000033000001', '经理', '402881ef557b216701557b45fca00003', null, null);
INSERT INTO `tbl_dict` VALUES ('402881ef557b216701675b45fca00003', null, '0', null, '0', 'CUSTOMER', '000033000002', '客服', '402881ef557b216701557b45fca00003', null, null);
INSERT INTO `tbl_dict` VALUES ('402881f053b726080153b72893a60000', null, '0', '2016-08-24 20:54:20', '5', 'ACCOUNTCHECKTYPE', '000011', '对账类型', '', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053b726080153b7294a1d0001', null, '0', '2016-06-23 10:42:59', '4', 'MONTH_CHECK', '000011000001', '月结', '402881f053b726080153b72893a60000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053b726080153b72986f80002', null, '0', '2016-06-23 10:31:30', '3', 'HQ_CHECK', '000011000002', '票到', '402881f053b726080153b72893a60000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053b726080153b74586f80002', null, '0', '2016-06-23 10:42:48', '4', 'PRE_CHECK', '000011000003', '预付', '402881f053b726080153b72893a60000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053cd670d0153cd6d6be40000', null, '0', null, '2', 'EDUCATION', '000017', '学历', null, '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053cd72330153cd78bacf0000', null, '0', null, '0', 'EDUCATIONCOLLEGE', '000017000001', '本科', '402881f053cd670d0153cd6d6be40000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053cd72330153cd796ac90001', null, '0', null, '0', 'EDUCATIONHIGHSCHOOL', '000017000002', '高中', '402881f053cd670d0153cd6d6be40000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053cd72330153cd80b46c0002', null, '0', null, '0', 'EDUCATIONPRIMARY', '000017000003', '小学', '402881f053cd670d0153cd6d6be40000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053cd72330153cd8153450003', null, '0', null, '0', 'EDUCATIONJUNIOR', '000017000004', '初中', '402881f053cd670d0153cd6d6be40000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053cd72330153cd820b960004', null, '0', null, '0', 'EDUCATIONDOCTOR', '000017000005', '博士', '402881f053cd670d0153cd6d6be40000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053cd72330153cd82a79d0005', null, '0', null, '0', 'EDUCATIONMASTER', '000017000006', '硕士', '402881f053cd670d0153cd6d6be40000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053cd72330153cd8384590006', null, '0', null, '0', 'EDUCATIONJUNIORCOLLEGE', '000017000007', '大专', '402881f053cd670d0153cd6d6be40000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4a5260153d4a845920001', null, '0', null, '0', 'TAXPAYERTYPE', '000019', '纳税人', null, '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4a5260153d4a9d0f00002', null, '0', null, '0', 'GENERALTAXPAYER', '000019000001', '一般纳税人', '402881f053d4a5260153d4a845920001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4a5260153d4ab6b110003', null, '0', null, '0', 'SMALLSCALETAXPAYER', '000019000002', '小规模纳税人', '402881f053d4a5260153d4a845920001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4a5260153d4ab6b130003', null, '0', '2016-06-23 10:24:40', '1', 'GTAXPAYER', '000019000003', '个体工商户', '402881f053d4a5260153d4a845920001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4a5260153d4aceaf20004', null, '0', null, '0', 'CAPITALTYPE', '000020', '企业性质', null, '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4a5260153d4ae22ee0005', null, '1', null, '1', 'OVERSEASFUNDED', '000020000001', '外资企业', '402881f053d4a5260153d4aceaf20004', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4a5260153d4aeadd20006', null, '0', null, '0', 'STATEOWNED', '000020000002', '国营企业', '402881f053d4a5260153d4aceaf20004', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4a5260153d4af6f1a0007', null, '0', null, '0', 'JOINTVENTURE', '000020000003', '合资企业', '402881f053d4a5260153d4aceaf20004', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4a5260153d4b0a80c0008', null, '0', null, '1', 'PRIVATE', '000020000004', '民营企业', '402881f053d4a5260153d4aceaf20004', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4eccd0153d5117aac0001', null, '0', '2016-06-21 10:33:20', '2', 'SETTLEMENTTYPE', '000021', '结算方式', null, '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4eccd0153d512a8580002', null, '0', null, '1', 'HQ_SETTLE', '000021000001', '统一结算', '402881f053d4eccd0153d5117aac0001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053d4eccd0153d513a0260003', null, '0', null, '1', 'INDIVIDUAL_SETTLE', '000021000002', '独立结算', '402881f053d4eccd0153d5117aac0001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e570c0890001', null, '0', null, '0', 'NATION', '000023', '民族', null, '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57116300002', null, '0', null, '0', 'NATION01', '000023000001', '汉族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5716e790003', null, '0', null, '0', 'NATION02', '000023000002', '蒙古族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e571c0f60004', null, '0', null, '0', 'NATION03', '000023000003', '回族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5723ada0005', null, '0', null, '0', 'NATION04', '000023000004', '藏族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57269ca0006', null, '0', null, '0', 'NATION05', '000023000005', '维吾尔族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57293c20007', null, '0', null, '0', 'NATION06', '000023000006', '苗族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e572e34c0008', null, '0', null, '0', 'NATION07', '000023000007', '彝族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5732caf0009', null, '0', null, '0', 'NATION08', '000023000008', '壮族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57366fb000a', null, '0', null, '0', 'NATION09', '000023000009', '布依族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5739474000b', null, '0', null, '0', 'NATION10', '000023000010', '朝鲜族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e573cc35000c', null, '0', null, '0', 'NATION11', '000023000011', '满族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5743c21000d', null, '0', null, '0', 'NATION12', '000023000012', '侗族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5747f53000e', null, '0', null, '0', 'NATION13', '000023000013', '瑶族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e574b560000f', null, '0', null, '0', 'NATION14', '000023000014', '白族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57575d20010', null, '0', null, '0', 'NATION15', '000023000015', '土家族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5759d8f0011', null, '0', null, '0', 'NATION16', '000023000016', '哈尼族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e575d9640012', null, '0', null, '0', 'NATION17', '000023000017', '哈萨克族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5761ee30013', null, '0', null, '0', 'NATION18', '000023000018', '傣族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5764cfb0014', null, '0', null, '0', 'NATION18', '000023000019', '黎族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5768eff0015', null, '0', null, '0', 'NATION20', '000023000020', '傈僳族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e576c05a0016', null, '0', null, '0', 'NATION21', '000023000021', '佤族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5771fb10017', null, '0', null, '0', 'NATION22', '000023000022', '畲族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e577754f0018', null, '0', null, '0', 'NATION23', '000023000023', '高山族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e577d8220019', null, '0', null, '0', 'NATION24', '000023000024', '拉祜族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57840d4001a', null, '0', null, '0', 'NATION25', '000023000025', '水族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e578beac001b', null, '0', null, '0', 'NATION26', '000023000026', '东乡族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e579cc50001c', null, '0', null, '0', 'NATION27', '000023000027', '纳西族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57a4b49001d', null, '0', null, '0', 'NATION28', '000023000028', '景颇族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57ab2ed001e', null, '0', null, '0', 'NATION29', '000023000029', '柯尔克孜族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57aeb4a001f', null, '0', null, '0', 'NATION30', '000023000030', '土族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57bb0c20020', null, '0', null, '0', 'NATION31', '000023000031', '达斡尔族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57c1cb50021', null, '0', null, '0', 'NATION32', '000023000032', '仫佬族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57c71630022', null, '0', null, '0', 'NATION33', '000023000033', '羌族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57cb5aa0023', null, '0', null, '0', 'NATION34', '000023000034', '布朗族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57d27c90024', null, '0', null, '0', '35', '000023000035', '撒拉族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57df9a10025', null, '0', null, '0', 'NATION36', '000023000036', '毛难族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57e48b80026', null, '0', null, '0', 'NATION37', '000023000037', '仡佬族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57e8b080027', null, '0', null, '0', 'NATION38', '000023000038', '锡伯族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57ebe990028', null, '0', null, '0', 'NATION', '000023000039', '阿昌族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57ef9f50029', null, '0', null, '0', 'NATION40', '000023000040', '普米族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57f6094002a', null, '0', null, '0', 'NATION41', '000023000041', '塔吉克族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57fbe0b002b', null, '0', null, '0', 'NATION42', '000023000042', '怒族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e57ffd10002c', null, '0', null, '0', 'NATION43', '000023000043', '乌兹别克', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5802506002d', null, '0', null, '0', 'NATION44', '000023000044', '俄罗斯族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e58066c6002e', null, '0', null, '0', 'NATION45', '000023000045', '鄂温克族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e580a981002f', null, '0', null, '0', 'NATION46', '000023000046', '崩龙族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e580e3540030', null, '0', null, '0', 'NATION47', '000023000047', '保安族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5813d0a0031', null, '0', null, '0', 'NATION48', '000023000048', '裕固族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e581adce0032', null, '0', null, '0', 'NATION49', '000023000049', '京族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e581eb050033', null, '0', null, '0', 'NATION50', '000023000050', '塔塔尔族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e582223b0034', null, '0', null, '0', 'NATION51', '000023000051', '独龙族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e58269950035', null, '0', null, '0', 'NATION52', '000023000052', '鄂伦春族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e582c7b80036', null, '0', null, '0', 'NATION53', '000023000053', '赫哲族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e58307aa0037', null, '0', null, '0', 'NATION54', '000023000054', '门巴族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e583596a0038', null, '0', null, '0', 'NATION55', '000023000055', '珞巴族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053e55e710153e5838d9c0039', null, '0', null, '0', 'NATION56', '000023000056', '基诺族', '402881f053e55e710153e570c0890001', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053f983b00153f98597fd0000', null, '0', null, '0', 'MESSAGETYPE', '000024', '站内信类型', null, '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053f983b00153f986e77c0001', null, '0', '2016-07-31 08:40:32', '2', 'MESSAGEPRODUCT', '000024000001', '生产', '402881f053f983b00153f98597fd0000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053f983b00153f98822340002', null, '0', null, '0', 'MESSAGEMARKET', '000024000002', '销售', '402881f053f983b00153f98597fd0000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053f983b00153f988e3190003', null, '0', null, '0', 'MESSAGEDELIVERY', '000024000003', '送货', '402881f053f983b00153f98597fd0000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f053f983b00153f989be130004', null, '0', null, '0', 'MESSAGEPURCHASE', '000024000004', '采购', '402881f053f983b00153f98597fd0000', '', '');
INSERT INTO `tbl_dict` VALUES ('402881f0540024cd0154003bae140006', null, '0', null, '0', 'INFORM', '000024000005', '通知', '402881f053f983b00153f98597fd0000', '', '');
INSERT INTO `tbl_dict` VALUES ('402882f453c561fa0153c5647ce00003', null, '0', null, '0', 'CHANNELTYPE', '000013', '来源', null, '', '');
INSERT INTO `tbl_dict` VALUES ('402882f453c561fa0153c56598ee0004', null, '0', '2016-08-27 23:55:23', '1', 'CHANNELTYPEACTIVITY', '000013000001', '推广活动', '402882f453c561fa0153c5647ce00003', '', '');
INSERT INTO `tbl_dict` VALUES ('402882f453c561fa0153c565dd6b0005', null, '0', null, '1', 'CHANNELTYPETEL', '000013000002', '电话咨询', '402882f453c561fa0153c5647ce00003', '', '');
INSERT INTO `tbl_dict` VALUES ('402882f453cf94730153cf96f8e40000', null, '0', null, '0', 'SUPPLIERLEVEL', '000018', '供应商级别', null, '', '');
INSERT INTO `tbl_dict` VALUES ('402882f453cf94730153cf97dbc30001', null, '0', '2016-06-23 10:18:12', '2', 'SUPPLIERLEVELSILVER', '000018000001', '一般供应商', '402882f453cf94730153cf96f8e40000', '', '');
INSERT INTO `tbl_dict` VALUES ('402882f453cf94730153cf9834bd0002', null, '0', '2016-06-23 10:18:00', '2', 'SUPPLIERLEVELGOLD', '000018000002', '重点供应商', '402882f453cf94730153cf96f8e40000', '', '');
INSERT INTO `tbl_dict` VALUES ('402882f453cf94730153cf98f3fa0003', null, '0', '2016-06-23 10:17:32', '2', 'SUPPLIERLEVELDIAMOND', '000018000003', '战略供应商', '402882f453cf94730153cf96f8e40000', '', '');
INSERT INTO `tbl_dict` VALUES ('8a2c43d853f918e30153f92417ab0004', null, '0', null, '0', 'CHANNELTYPEMEDIA', '000013000003', '媒体广告', '402882f453c561fa0153c5647ce00003', '', '');
INSERT INTO `tbl_dict` VALUES ('8a2c43d853f918e30153f92589ad0005', null, '0', null, '0', 'CHANNELTYPEPEINTRO', '000013000004', '熟人推荐', '402882f453c561fa0153c5647ce00003', '', '');
INSERT INTO `tbl_dict` VALUES ('8a2c43d853f918e30153f928e92e0006', null, '0', null, '0', 'CHANNELTYPEOTHERS', '000013000005', '其他', '402882f453c561fa0153c5647ce00003', '', '');
INSERT INTO `tbl_dict` VALUES ('bc4d163c5880ab4901588b5582360001', '2016-11-22 17:19:46', '0', '2016-11-22 17:19:46', '0', 'TEXT', '000024000006', '短信', '402881f053f983b00153f98597fd0000', '', '');
INSERT INTO `tbl_dict` VALUES ('bc4d163c5880ab4901588b5b49080002', '2016-11-22 17:26:05', '0', '2016-11-22 17:26:05', '0', 'HANZU', '000023000057', '汉族', '402881f053e55e710153e570c0890001', '', '');

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
-- Records of tbl_function
-- ----------------------------
INSERT INTO `tbl_function` VALUES ('402880e958eb83230158eb85a30f0000', '2016-12-11 09:35:53', '0', '2016-12-11 09:35:53', '0', 'ARTICLE', '1', 'fa fa-edit', '000028000001', '我的文章', '402880eb58d9a6d40158d9a7b21f0000', '', '/markdown/list');
INSERT INTO `tbl_function` VALUES ('402880eb56875b7f0156876338100000', '2016-08-14 12:50:41', '0', '2016-12-05 15:12:59', '3', 'DEMO', '0', 'fa fa-table', '000002', 'CURD DEMO', '', '', '');
INSERT INTO `tbl_function` VALUES ('402880eb56875b7f01568763ac630001', '2016-08-14 12:51:11', '0', '2016-12-05 16:22:21', '5', 'USER-DIALOG', '1', 'fa fa-user', '000002000001', '用户列表-Dailog', '402880eb56875b7f0156876338100000', '', '/user/list');
INSERT INTO `tbl_function` VALUES ('402880eb58d9a6d40158d9a7b21f0000', '2016-12-07 22:19:55', '0', '2016-12-07 22:19:55', '0', 'TOOL', '0', 'fa fa-wrench', '000028', '系统工具', '', '', '');
INSERT INTO `tbl_function` VALUES ('402880eb58d9a6d40158d9a995130001', '2016-12-07 22:21:59', '0', '2016-12-12 09:59:46', '3', 'MARKDOWN', '1', 'fa fa-pencil', '000028000002', 'Markdown编辑器', '402880eb58d9a6d40158d9a7b21f0000', '', '/markdown/edit');
INSERT INTO `tbl_function` VALUES ('40288182579e398f0157a25ca29a0002', '2016-10-08 11:36:02', '0', '2016-10-08 11:36:02', '0', 'USER-DEMO-TAB', '1', 'fa fa-male', '000002000002', '用户列表-Tab', '402880eb56875b7f0156876338100000', 'CURD-DEMO tab方式', '/user/tab/list');
INSERT INTO `tbl_function` VALUES ('4028818a567745ec0156786cd39e000b', '2016-08-11 15:06:53', '0', '2016-08-30 14:06:15', '5', 'TODO', '0', 'fa fa-calendar-check-o', '000001', '我的待办', '', '', '');
INSERT INTO `tbl_function` VALUES ('4028818a56d407950156d41352630000', '2016-08-29 10:14:11', '0', '2016-08-29 10:14:11', '0', 'SYSTEM', '0', 'fa fa-tv', '000030', '系统管理', '', '', '');
INSERT INTO `tbl_function` VALUES ('4028818a56d407950156d41435830001', '2016-08-29 10:15:09', '0', '2016-08-29 10:15:09', '0', 'USER', '1', 'fa fa-user', '000030000001', '用户管理', '4028818a56d407950156d41352630000', '', '/user/list');
INSERT INTO `tbl_function` VALUES ('4028818a56d407950156d4160e390002', '2016-08-29 10:17:10', '0', '2016-08-29 10:17:10', '0', 'DICTIONARY', '1', 'fa fa-book', '000030000002', '字典管理', '4028818a56d407950156d41352630000', '', '/dict/tree');
INSERT INTO `tbl_function` VALUES ('4028818a56d407950156d41d32ab0003', '2016-08-29 10:24:58', '0', '2016-08-30 13:43:36', '1', 'FUNCTION', '1', 'fa fa-cog', '000030000003', '菜单管理', '4028818a56d407950156d41352630000', '', '/function/tree');
INSERT INTO `tbl_function` VALUES ('4028818a56d407950156d4ecfafa0004', '2016-08-29 14:11:55', '0', '2016-08-30 13:44:07', '1', 'Role', '1', 'fa fa-street-view', '000030000004', '角色管理', '4028818a56d407950156d41352630000', '', '/role/list');
INSERT INTO `tbl_function` VALUES ('402881f25681c52a015681d472ba0000', '2016-08-13 10:56:39', '0', '2016-12-05 09:58:40', '2', 'TEST', '1', 'fa fa-bicycle', '000001000001', 'TEST', '4028818a567745ec0156786cd39e000b', '', 'TEST');
INSERT INTO `tbl_function` VALUES ('8a8a801b58ce0f500158ce14d2c20000', '2016-12-05 16:23:40', '0', '2016-12-05 16:23:40', '0', 'USER-PAGE', '1', 'fa fa-user', '000002000003', '用户列表-Page', '402880eb56875b7f0156876338100000', '', '/user/page/list');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_markdown
-- ----------------------------
INSERT INTO `tbl_markdown` VALUES ('402880e958ecdff60158ed0c62ba0001', '2016-12-11 16:42:41', '0', '2016-12-11 21:09:55', '1', 'Markdown,关键字', '欢迎使用Markdown编辑器写文章', null, '# 欢迎使用Markdown编辑器写文章\n\n本Markdown编辑器使用**Editor.md**修改而来，用它写技术文章，将会带来全新的体验哦：\n\n- **Markdown和扩展Markdown简洁的语法**\n- **代码块高亮**\n- **图片链接和图片上传**\n- ***LaTex*数学公式**\n- **UML序列图和流程图**\n- **离线写文章**\n- **导入导出Markdown文件**\n- **丰富的快捷键**\n-------------------\n\n## 快捷键\n\n - 加粗     `Ctrl + B`\n - 斜体     `Ctrl + I`\n - 引用     `Ctrl + Q`\n - 插入链接    `Ctrl + L`\n - 插入代码    `Ctrl + K`\n - 插入图片    `Ctrl + G`\n - 提升标题    `Ctrl + H`\n - 有序列表    `Ctrl + O`\n - 无序列表    `Ctrl + U`\n - 横线    `Ctrl + R`\n - 撤销    `Ctrl + Z`\n - 重做    `Ctrl + Y`\n\n## Markdown及扩展\n\n> Markdown 是一种轻量级标记语言，它允许人们使用易读易写的纯文本格式编写文档，然后转换成格式丰富的HTML页面。    —— <a href=\"https://zh.wikipedia.org/wiki/Markdown\" target=\"_blank\"> [ 维基百科 ]\n\n使用简单的符号标识不同的标题，将某些文字标记为**粗体**或者*斜体*，创建一个[链接](http://www.csdn.net)等，详细语法参考帮助？。\n\n本编辑器支持 **Markdown Extra** , 　扩展了很多好用的功能。具体请参考[Github][2].\n\n### 表格\n\n**Markdown　Extra**　表格语法：\n\n项目     | 价格\n-------- | ---\nComputer | $1600\nPhone    | $12\nPipe     | $1\n\n可以使用冒号来定义对齐方式：\n\n| 项目      |    价格 | 数量  |\n| :-------- | --------:| :--: |\n| Computer  | 1600 元 |  5   |\n| Phone     |   12 元 |  12  |\n| Pipe      |    1 元 | 234  |\n\n\n### 代码块\n代码块语法遵循标准markdown代码，例如：\n``` python\n@requires_authorization\ndef somefunc(param1=\'\', param2=0):\n    \'\'\'A docstring\'\'\'\n    if param1 > param2: # interesting\n        print \'Greater\'\n    return (param2 - param1 + 1) or None\nclass SomeClass:\n    pass\n>>> message = \'\'\'interpreter\n... prompt\'\'\'\n```\n\n\n### 目录\n用 `[TOC]`来生成目录：\n\n[TOC]\n\n### 数学公式\n使用MathJax渲染*LaTex* 数学公式，详见[math.stackexchange.com][1].\n\n - 行内公式，数学公式为：$\\Gamma(n) = (n-1)!\\quad\\forall n\\in\\mathbb N$。\n - 块级公式：\n\n$$	x = \\dfrac{-b \\pm \\sqrt{b^2 - 4ac}}{2a} $$\n\n更多LaTex语法请参考 [这儿][3].\n\n### UML 图:\n\n可以渲染序列图：\n\n```sequence\n张三->李四: 嘿，小四儿, 写博客了没?\nNote right of 李四: 李四愣了一下，说：\n李四-->张三: 忙得吐血，哪有时间写。\n```\n\n或者流程图：\n\n```flow\nst=>start: 开始\ne=>end: 结束\nop=>operation: 我的操作\ncond=>condition: 确认？\n\nst->op->cond\ncond(yes)->e\ncond(no)->op\n```\n\n- 关于 **序列图** 语法，参考 [这儿][4],\n- 关于 **流程图** 语法，参考 [这儿][5].\n\n## 离线写博客\n\n即使用户在没有网络的情况下，也可以通过本编辑器离线写文章（直接在曾经使用过的浏览器中输入[write.blog.csdn.net/mdeditor](http://write.blog.csdn.net/mdeditor)即可。**Markdown编辑器**使用浏览器离线存储将内容保存在本地。\n\n用户写文章的过程中，内容实时保存在浏览器缓存中，在用户关闭浏览器或者其它异常情况下，内容不会丢失。用户再次打开浏览器时，会显示上次用户正在编辑的没有发表的内容。\n\n文章发表后，本地缓存将被删除。\n\n用户可以选择 <i class=\"icon-disk\"></i> 把正在写的文章保存到服务器草稿箱，即使换浏览器或者清除缓存，内容也不会丢失。\n\n> **注意：**虽然浏览器存储大部分时候都比较可靠，但为了您的数据安全，在联网后，**请务必及时发表或者保存到服务器草稿箱**');

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
-- Records of tbl_role
-- ----------------------------
INSERT INTO `tbl_role` VALUES ('4028818a56fd502f015700209b040000', '2016-09-06 23:31:59', '0', '2016-09-08 20:59:06', '40', '1232', 'TEST1243433', '', '2');
INSERT INTO `tbl_role` VALUES ('bc4d163c5880ab4901588b6681e50003', '2016-11-22 17:38:20', '0', '2016-11-22 17:38:20', '0', 'ADMIN', '管理员', '', '1');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_role_function
-- ----------------------------

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
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1f150ec4321411e6a46d10a0f3df85fa', '2016-06-14 17:41:14', '0', '2016-06-14 17:41:14', '1', null, '2016-06-14 17:41:14', 'test@163.com', 'tester', '13813888888', 'tester3', '1', '888888', null, '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('23c87eb0321411e6a46d10a0f3df85fa', '2016-06-14 17:41:22', '0', '2016-06-14 17:41:22', '1', null, '2016-06-14 17:41:22', 'test@163.com', 'tester', '13813888888', 'tester5', '1', '888888', null, '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('23e6e45d321411e6a46d10a0f3df85fa', '2016-06-14 17:41:23', '0', '2016-12-05 19:35:29', '13', null, '2016-06-14 00:00:00', 'test@163.com', 'tester', '13813888888', 'tester6', null, null, '', '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('2405dc64321411e6a46d10a0f3df85fa', '2016-06-14 17:41:23', '0', '2016-06-14 17:41:23', '1', null, '2016-06-14 17:41:23', 'test@163.com', 'tester', '13813888888', 'tester7', '1', '888888', null, '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('24961408321411e6a46d10a0f3df85fa', '2016-06-14 17:41:24', '0', '2016-07-26 22:24:16', '2', null, '2016-06-14 00:00:00', 'test@163.com', 'tester', '13813888888', 'tester9', null, null, '', '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('24b7164a321411e6a46d10a0f3df85fa', '2016-06-14 17:41:24', '0', '2016-06-14 17:41:24', '1', null, '2016-06-14 17:41:24', 'test@163.com', 'tester', '13813888888', 'tester10', '1', '888888', null, '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('24f40c7b321411e6a46d10a0f3df85fa', '2016-06-14 17:41:24', '0', '2016-12-05 19:51:00', '2', null, '2016-06-14 00:00:00', 'test@163.com', 'tester', '13813888888', 'tester12', null, null, '', '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('2510c36e321411e6a46d10a0f3df85fa', '2016-06-14 17:41:24', '0', '2016-06-14 17:41:24', '1', null, '2016-06-14 17:41:24', 'test@163.com', 'tester', '13813888888', 'tester13', '1', '888888', null, '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('252caeaf321411e6a46d10a0f3df85fa', '2016-06-14 17:41:25', '0', '2016-06-14 17:41:25', '1', null, '2016-06-14 17:41:25', 'test@163.com', 'tester', '13813888888', 'tester14', '1', '888888', null, '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('254f9b64321411e6a46d10a0f3df85fa', '2016-06-14 17:41:25', '0', '2016-12-05 19:44:37', '13', null, '2016-06-14 00:00:00', 'test@163.com', 'tester', '13813888888', 'tester15', null, null, '', '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('25713641321411e6a46d10a0f3df85fa', '2016-06-14 17:41:25', '0', '2016-06-14 17:41:25', '1', null, '2016-06-14 17:41:25', 'test@163.com', 'tester', '13813888888', 'tester16', '1', '888888', null, '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('25924d86321411e6a46d10a0f3df85fa', '2016-06-14 17:41:25', '0', '2016-12-05 21:27:23', '2', null, '2016-06-14 00:00:00', 'test@163.com', 'tester', '13813888888', 'tester17', null, null, '', '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('25b24324321411e6a46d10a0f3df85fa', '2016-06-14 17:41:26', '0', '2016-06-14 17:41:26', '1', null, '2016-06-14 17:41:26', 'test@163.com', 'tester', '13813888888', 'tester18', '1', '888888', null, '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('25eff07c321411e6a46d10a0f3df85fa', '2016-06-14 17:41:26', '0', '2016-06-14 17:41:26', '1', null, '2016-06-14 17:41:26', 'test@163.com', 'tester', '13813888888', 'tester20', '1', '888888', null, '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('262a3774321411e6a46d10a0f3df85fa', '2016-06-14 17:41:26', '0', '2016-06-14 17:41:26', '1', null, '2016-06-14 17:41:26', 'test@163.com', 'tester', '13813888888', 'tester21', '1', '888888', null, '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('266ce1a2321411e6a46d10a0f3df85fa', '2016-06-14 17:41:27', '0', '2016-06-14 17:41:27', '1', null, '2016-06-14 17:41:27', 'test@163.com', 'tester', '13813888888', 'tester23', '1', '888888', null, '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('268d44bf321411e6a46d10a0f3df85fa', '2016-06-14 17:41:27', '0', '2016-06-14 17:41:27', '1', null, '2016-06-14 17:41:27', 'test@163.com', 'tester', '13813888888', 'tester24', '1', '888888', null, '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('26abb5d0321411e6a46d10a0f3df85fa', '2016-06-14 17:41:27', '0', '2016-06-14 17:41:27', '1', null, '2016-06-14 17:41:27', 'test@163.com', 'tester', '13813888888', 'tester25', '1', '888888', null, '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('26cabdc3321411e6a46d10a0f3df85fa', '2016-06-14 17:41:27', '0', '2016-06-14 17:41:27', '1', null, '2016-06-14 17:41:27', 'test@163.com', 'tester', '13813888888', 'tester26', '1', '888888', null, '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('275a01e2321411e6a46d10a0f3df85fa', '2016-06-14 17:41:28', '0', '2016-12-05 19:47:31', '5', null, '2016-06-14 00:00:00', 'test@163.com', 'tester', '13813888888', 'tester31fdsfdsf', null, null, '', '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('27773eda321411e6a46d10a0f3df85fa', '2016-06-14 17:41:29', '0', '2016-12-05 19:47:21', '6', null, '2016-06-14 00:00:00', 'test@163.com', 'tester', '13813888888', 'tester32', null, null, '', '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('2793c5eb321411e6a46d10a0f3df85fa', '2016-06-14 17:41:29', '0', '2016-07-29 12:30:52', '4', null, '2016-06-14 00:00:00', 'test@163.com', 'tester', '13813888888', '243567890', null, null, '', '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('27b24306321411e6a46d10a0f3df85fa', '2016-06-14 17:41:29', '0', '2016-06-14 17:41:29', '1', null, '2016-06-14 17:41:29', 'test@163.com', 'tester', '13813888888', 'tester34', '1', '888888', null, '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('27cc52be321411e6a46d10a0f3df85fa', '2016-06-14 17:41:29', '0', '2016-06-14 17:41:29', '1', null, '2016-06-14 17:41:29', 'test@163.com', 'tester', '13813888888', 'tester35', '1', '888888', null, '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('27ea2ce3321411e6a46d10a0f3df85fa', '2016-06-14 17:41:29', '0', '2016-06-14 17:41:29', '1', null, '2016-06-14 17:41:29', 'test@163.com', 'tester', '13813888888', 'tester36', '1', '888888', null, '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('28268c27321411e6a46d10a0f3df85fa', '2016-06-14 17:41:30', '0', '2016-06-14 17:41:30', '1', null, '2016-06-14 17:41:30', 'test@163.com', 'tester', '13813888888', 'tester38', '1', '888888', null, '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('2d7e7f00321411e6a46d10a0f3df85fa', '2016-06-14 17:41:39', '0', '2016-07-26 22:15:37', '5', null, '2016-06-14 00:00:00', 'test@163.com', 'tester', '13813888888', 'tester39fdsfsdfds', null, null, '', '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('2d9b6d58321411e6a46d10a0f3df85fa', '2016-06-14 17:41:39', '0', '2016-06-14 17:41:39', '1', null, '2016-06-14 17:41:39', 'test@163.com', 'tester', '13813888888', 'tester40', '1', '888888', null, '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('2db9a18c321411e6a46d10a0f3df85fa', '2016-06-14 17:41:39', '0', '2016-06-14 17:41:39', '1', null, '2016-06-14 17:41:39', 'test@163.com', 'tester', '13813888888', 'tester41', '1', '888888', null, '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('2dd55c4e321411e6a46d10a0f3df85fa', '2016-06-14 17:41:39', '0', '2016-10-07 17:20:11', '10', null, '2016-06-14 00:00:00', 'test@163.com', 'tester', '13813888888', 'tester42', null, null, '', '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('2df1e46d321411e6a46d10a0f3df85fa', '2016-06-14 17:41:39', '0', '2016-07-26 22:05:08', '3', null, '2016-06-14 00:00:00', 'test@163.com', 'tester', '13813888888', 'tester43', null, null, '', '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('2e5f797a321411e6a46d10a0f3df85fa', '2016-06-14 17:41:40', '0', '2016-07-26 22:24:27', '4', null, '2016-06-14 00:00:00', 'test@163.com', 'tester', '13813888888', 'tester45', null, null, '', '1', '13601047561', null, '1');
INSERT INTO `tbl_user` VALUES ('402880e456223e8f0156223feee10000', '2016-07-25 21:30:30', '0', '2016-10-07 17:19:19', '3', null, '2016-07-06 00:00:00', 'test@163.com', 'jrn', '13813888888', 'billJiang', null, null, '475572229', '1', '01083595052', null, '');
INSERT INTO `tbl_user` VALUES ('402880e456223e8f0156225736a40001', '2016-07-25 21:55:56', '0', '2016-12-05 19:47:14', '9', null, '2016-07-06 00:00:00', 'test@163.com', 'jrn', '13813888888', 'billJiang', null, null, '475572229', '1', '', null, '');
INSERT INTO `tbl_user` VALUES ('402880e456223e8f015625152b460002', '2016-07-26 19:03:03', '0', '2016-12-05 19:47:43', '7', null, '2016-07-06 00:00:00', 'test@163.com', 'test', '13813888888', 'testwewewewew', null, null, '475572229', '0', '01083595052', null, '');
INSERT INTO `tbl_user` VALUES ('402880e456223e8f015625231d8e0003', '2016-07-26 19:02:18', null, '2016-07-26 18:59:59', '2', null, '2016-07-22 00:00:00', 'test@163.com', 'test', '13813888888', 'test', null, null, '475572229', '1', '01083595052', null, '');
INSERT INTO `tbl_user` VALUES ('402880e456223e8f0156252449760004', '2016-07-26 10:59:10', '0', '2016-10-07 17:23:51', '5', null, '2016-07-07 00:00:00', 'test@163.com', 'jrn', '13813888888', 'billJiang', null, null, '', '1', '', null, '');
INSERT INTO `tbl_user` VALUES ('4028818458d281780158d31c9d940000', '2016-12-06 15:50:17', '0', '2016-12-06 15:51:30', '1', null, '2016-12-18 00:00:00', 'test@163.com', 'fd', '13813888888', '12345678', null, null, '', '1', '01083595052', null, '');
INSERT INTO `tbl_user` VALUES ('4028818458d3f33d0158d3f5ca120001', '2016-12-06 19:47:30', '0', '2016-12-06 19:47:30', '0', null, '2016-12-19 00:00:00', 'test@163.com', 'tester', '13813888888', '232323', null, null, '', '1', '01083595052', null, '');
INSERT INTO `tbl_user` VALUES ('4028818458d3f33d0158d400a71c0003', '2016-12-06 19:59:22', '0', '2016-12-06 19:59:22', '0', null, '2016-12-05 00:00:00', 'test@163.com', 'tester', '13813888888', 'fdfs', null, null, '', '1', 'test', null, '');
INSERT INTO `tbl_user` VALUES ('4028818458d3f33d0158d40197dd0004', '2016-12-06 20:00:24', '0', '2016-12-06 20:00:24', '0', null, '2016-12-13 00:00:00', 'test@163.com', 'tester', '13813888888', 'TEST1243433', null, null, '', '1', 'test', null, '');
INSERT INTO `tbl_user` VALUES ('4028818458d3f33d0158d407b7de0005', '2016-12-06 20:07:05', '0', '2016-12-06 20:07:05', '0', null, '2016-12-01 00:00:00', 'jrn1012@petrochina.com.cn', 'tester', '13813888888', 'TEST1243433', null, null, '', '1', '13601047561', null, '');
INSERT INTO `tbl_user` VALUES ('4028818458d40f4f0158d4108eb60001', '2016-12-06 20:16:44', '0', '2016-12-06 20:16:44', '0', null, '2016-12-13 00:00:00', '517208243@qq.com', '43', '13813888888', '1234567765432', null, null, '475572229', '1', '01083595052', null, '');
INSERT INTO `tbl_user` VALUES ('4028818458d40f4f0158d4169f9d0007', '2016-12-06 20:23:22', '0', '2016-12-11 16:42:21', '2', null, '2016-12-20 00:00:00', 'test@163.com', '2', '2', '1323232', null, null, '', '1', '2', null, '');
INSERT INTO `tbl_user` VALUES ('8a8a801b58c829670158c86deb5a0000', '2016-12-04 14:03:16', null, '2016-12-04 14:03:16', '0', null, '2016-11-29 00:00:00', 'test@163.com', '11', '13813888888', 'fdfs', null, null, '', '1', '01083595052', null, '');
INSERT INTO `tbl_user` VALUES ('8a8a801b58ce0f500158ce7999690001', '2016-12-05 18:13:45', '0', '2016-12-05 19:45:29', '2', null, '2016-12-01 00:00:00', 'test@163.com', 'tester', '13813888888', 'hello world', null, null, '475572229', '1', '13601047561', null, '');
INSERT INTO `tbl_user` VALUES ('8afa96f6564a787601564a79fd970000', '2016-08-02 16:58:44', '0', '2016-12-05 19:44:54', '2', null, '2016-02-29 00:00:00', 'test@163.com', 'tt', '13813888888', 'test', null, null, '', '0', 'test', null, '');
INSERT INTO `tbl_user` VALUES ('8afa96f6564a787601564a818bf80002', '2016-08-02 17:06:59', '0', '2016-09-02 22:26:01', '1', null, '2016-03-03 00:00:00', 'test@163.com', 'qqqfr', '13813888888', 'zzz', null, null, '10599w2e3de', '1', '', null, '');

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
-- Records of tbl_user_avatar
-- ----------------------------
INSERT INTO `tbl_user_avatar` VALUES ('4028818458d40f4f0158d41667830006', '2016-12-06 20:23:07', null, '2016-12-11 16:42:17', '3', '1323232_1481445737480.jpg', '\\uploadPath\\avatar\\1323232_1481445737480.jpg', '4028818458d40f4f0158d4169f9d0007');
INSERT INTO `tbl_user_avatar` VALUES ('8afa96f658f1071d0158f10892a80000', '2016-12-12 11:17:00', null, '2016-12-12 11:17:00', '0', 'new_1481512619938.jpg', '\\uploadPath\\avatar\\new_1481512619938.jpg', '0');
INSERT INTO `tbl_user_avatar` VALUES ('8afa96f658f1071d0158f109333f0001', '2016-12-12 11:17:41', null, '2016-12-12 11:17:41', '0', 'new_1481512661820.jpg', '\\uploadPath\\avatar\\new_1481512661820.jpg', '0');

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
-- Records of tbl_user_role
-- ----------------------------
