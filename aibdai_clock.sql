/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : aibdai_clock

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-05-14 18:38:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aibdai_advice
-- ----------------------------
DROP TABLE IF EXISTS `aibdai_advice`;
CREATE TABLE `aibdai_advice` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `msg` text NOT NULL,
  `create_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of aibdai_advice
-- ----------------------------
INSERT INTO `aibdai_advice` VALUES ('1', '1', '意见罚款', '1458299828');
INSERT INTO `aibdai_advice` VALUES ('2', '1', 'hfkjdhf', '1458582504');

-- ----------------------------
-- Table structure for aibdai_arithmetic_desc
-- ----------------------------
DROP TABLE IF EXISTS `aibdai_arithmetic_desc`;
CREATE TABLE `aibdai_arithmetic_desc` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `desc` text NOT NULL,
  `min` float unsigned NOT NULL,
  `max` float unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aibdai_arithmetic_desc
-- ----------------------------
INSERT INTO `aibdai_arithmetic_desc` VALUES ('1', '屈辱、孤僻、生不如死。能量危险值，需要去寻找专业的心理服务！', '0', '60');
INSERT INTO `aibdai_arithmetic_desc` VALUES ('2', '懊悔、内疚、自我怜悯。能量超低，尽快寻求专业的心理服务！', '60', '90');
INSERT INTO `aibdai_arithmetic_desc` VALUES ('3', '绝望、无助、自暴自弃。能量非常低，建议寻求专业心理服务！', '90', '150');
INSERT INTO `aibdai_arithmetic_desc` VALUES ('4', '忧伤、丧气、意志消沉。能量很低，可以寻求专业的心理服务！', '150', '225');
INSERT INTO `aibdai_arithmetic_desc` VALUES ('5', '恐惧、担忧、危机四伏。能量预警线，赶紧寻找能量值在500以上的人借取能量吧！', '225', '300');
INSERT INTO `aibdai_arithmetic_desc` VALUES ('6', '需求、渴望、无法满足。能量渐渐储备，开始拥有可支配的部分能量。', '300', '375');
INSERT INTO `aibdai_arithmetic_desc` VALUES ('7', '敏感、暴躁、有攻击性。能量已有所储备，勿让负面情绪左右而流失能量！', '375', '450');
INSERT INTO `aibdai_arithmetic_desc` VALUES ('8', '傲慢、激昂、寻求自尊。能量储备未到及格线，但是消极向积极转变的开始！', '450', '525');
INSERT INTO `aibdai_arithmetic_desc` VALUES ('9', '突破、鼓舞、勇于担当。能量储备超越了80%的人，生活会有积极可喜的变化！', '525', '600');
INSERT INTO `aibdai_arithmetic_desc` VALUES ('10', '客观、宁静、开放灵活。拥有了影响他人的能量，尝试帮助他人吧！', '600', '625');
INSERT INTO `aibdai_arithmetic_desc` VALUES ('11', '积极、友善、乐在其中。能量储备丰富，可以向低能量的人赠予能量！', '625', '655');
INSERT INTO `aibdai_arithmetic_desc` VALUES ('12', '接纳、平等、 兼容并包。拥有创造自身能量的源泉并无形地影响着他人！', '655', '675');
INSERT INTO `aibdai_arithmetic_desc` VALUES ('13', '洞察、理智、不被负面情感左右。克服了情感缺陷，通向高层级能量，需要更近于事物本质！', '675', '700');
INSERT INTO `aibdai_arithmetic_desc` VALUES ('14', '恒久、无条件的爱。心怀大爱，对本质有顿悟的能力，向周围散发你的光亮吧！', '700', '750');
INSERT INTO `aibdai_arithmetic_desc` VALUES ('15', '感恩、祝福、始终美好。能量值非常高，意欲利于社会，悲悯世界，你的能量场影响着他人！', '750', '770');
INSERT INTO `aibdai_arithmetic_desc` VALUES ('16', '超然、自我实现、内外统一。能量值超高， 超越世俗牵绊，社会各领域的领军人物！', '770', '800');
INSERT INTO `aibdai_arithmetic_desc` VALUES ('17', '慈悲、无我、天人合一。能量值爆表，强大的感召力，你的吸子能量场甚至能影响人类！', '800', '1000');

-- ----------------------------
-- Table structure for aibdai_clock
-- ----------------------------
DROP TABLE IF EXISTS `aibdai_clock`;
CREATE TABLE `aibdai_clock` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `info` varchar(255) NOT NULL COMMENT '闹钟信息',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `pre_complete_time` int(11) unsigned NOT NULL COMMENT '目标开始时间',
  `remind_time` varchar(255) NOT NULL COMMENT '提醒时间',
  `is_complete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否完成,0未完成，1完成',
  `complete_time` int(11) unsigned NOT NULL COMMENT '完成时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '闹钟状态，1正常,0禁用',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0正常，１删除',
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `is_complete` (`is_complete`),
  KEY `pre_complete_time` (`pre_complete_time`),
  KEY `remind_time` (`remind_time`),
  KEY `status` (`status`),
  KEY `isdelete` (`isdelete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aibdai_clock
-- ----------------------------
INSERT INTO `aibdai_clock` VALUES ('16', '1', '我要早起', '备注', '1454381992', '12:12', '0', '0', '1', '0', '1454387370', '1454387370');
INSERT INTO `aibdai_clock` VALUES ('17', '1', '我要早起', '备注', '1454381992', '12:12', '0', '0', '1', '0', '1454387370', '1454387370');
INSERT INTO `aibdai_clock` VALUES ('21', '1', '我要早起', '备注', '1454381992', '12:12', '0', '0', '1', '0', '1454387371', '1454387371');
INSERT INTO `aibdai_clock` VALUES ('22', '1', '我要早起', '备注', '1454381992', '12:12', '0', '0', '1', '0', '1454387371', '1454387371');
INSERT INTO `aibdai_clock` VALUES ('23', '1', '我要早起', '备注', '1454381992', '12:12', '0', '0', '1', '0', '1454387372', '1454387372');
INSERT INTO `aibdai_clock` VALUES ('24', '1', '我要早起', '备注', '1454381992', '12:12', '0', '0', '1', '0', '1454387372', '1454387372');
INSERT INTO `aibdai_clock` VALUES ('25', '1', '我要早起', '备注', '1454381992', '12:12', '0', '0', '1', '0', '1454387372', '1454387372');
INSERT INTO `aibdai_clock` VALUES ('114', '1', '123', null, '705826478', '12:12', '0', '0', '1', '0', '1463221894', '1463221894');

-- ----------------------------
-- Table structure for aibdai_config
-- ----------------------------
DROP TABLE IF EXISTS `aibdai_config`;
CREATE TABLE `aibdai_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `test_time1` varchar(11) NOT NULL COMMENT '测试时间1,hh:mm格式',
  `test_time2` varchar(11) NOT NULL COMMENT '测试时间2,hh:mm格式',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of aibdai_config
-- ----------------------------
INSERT INTO `aibdai_config` VALUES ('1', '1', '12:00', '14:00');
INSERT INTO `aibdai_config` VALUES ('2', '49', '12:00', '20:00');
INSERT INTO `aibdai_config` VALUES ('3', '61', '06:04', '03:04');
INSERT INTO `aibdai_config` VALUES ('4', '47', '23:55', '00:02');
INSERT INTO `aibdai_config` VALUES ('5', '89', '00:02', '01:01');
INSERT INTO `aibdai_config` VALUES ('6', '90', '00:01', '00:01');
INSERT INTO `aibdai_config` VALUES ('7', '91', '00:01', '02:01');
INSERT INTO `aibdai_config` VALUES ('8', '98', '00:02', '00:02');
INSERT INTO `aibdai_config` VALUES ('9', '99', '02:01', '01:01');
INSERT INTO `aibdai_config` VALUES ('10', '57', '00:03', '09:02');

-- ----------------------------
-- Table structure for aibdai_energy_advice
-- ----------------------------
DROP TABLE IF EXISTS `aibdai_energy_advice`;
CREATE TABLE `aibdai_energy_advice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `min` float unsigned NOT NULL,
  `max` float(255,0) unsigned NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `create_time` int(10) unsigned NOT NULL,
  `update` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `min` (`min`),
  KEY `max` (`max`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aibdai_energy_advice
-- ----------------------------
INSERT INTO `aibdai_energy_advice` VALUES ('1', '0', '60', '屈辱、孤僻、生不如死。能量危险值,需要去寻找专业的心理服务!', '1', '0', '0');
INSERT INTO `aibdai_energy_advice` VALUES ('2', '60', '90', '懊悔、内疚、自我怜悯。能量超低,尽快寻求专业的心理服务!', '1', '0', '0');
INSERT INTO `aibdai_energy_advice` VALUES ('3', '90', '150', '绝望、无助、自暴自弃。能量非常低,建议寻求专业心理服务!', '1', '0', '0');
INSERT INTO `aibdai_energy_advice` VALUES ('4', '150', '225', '忧伤、丧气、意志消沉。能量很低,可以寻求专业的心理服务!', '1', '0', '0');
INSERT INTO `aibdai_energy_advice` VALUES ('5', '225', '300', '恐惧、担忧、危机四伏。能量预警线,赶紧寻找能量值在 500 以上的人借取能量吧!', '1', '0', '0');
INSERT INTO `aibdai_energy_advice` VALUES ('6', '300', '375', '需求、渴望、无法满足。能量渐渐储备,开始拥有可支配的部分能量。', '1', '0', '0');
INSERT INTO `aibdai_energy_advice` VALUES ('7', '375', '450', '敏感、暴躁、有攻击性。能量已有所储备,勿让负面情绪左右而流失能量。', '1', '0', '0');
INSERT INTO `aibdai_energy_advice` VALUES ('8', '450', '525', '傲慢、激昂、寻求自尊。能量储备未到及格线,但是消极向积极转变的开始。', '1', '0', '0');
INSERT INTO `aibdai_energy_advice` VALUES ('9', '525', '600', '突破、鼓舞、勇于担当。能量储备超越了 80%的人,生活会有积极可喜的变化。', '1', '0', '0');
INSERT INTO `aibdai_energy_advice` VALUES ('10', '600', '625', '客观、宁静、开放灵活。拥有了影响他人的能量,尝试帮助他人吧。', '1', '0', '0');
INSERT INTO `aibdai_energy_advice` VALUES ('11', '625', '655', '积极、友善、乐在其中。能量储备丰富,可以向低能量的人赠予能量。', '1', '0', '0');
INSERT INTO `aibdai_energy_advice` VALUES ('12', '655', '675', '接纳、平等、 兼容并包。拥有创造自身能量的源泉并无形地影响着他人。', '1', '0', '0');
INSERT INTO `aibdai_energy_advice` VALUES ('13', '675', '700', '洞察、理智、不被负面情感左右。克服了情感缺陷,通向高层级能量,需要更近于事物本质。', '1', '0', '0');
INSERT INTO `aibdai_energy_advice` VALUES ('14', '700', '750', '恒久、无条件的爱。心怀大爱,对本质有顿悟的能力,向周围散发你的光亮吧。', '1', '0', '0');
INSERT INTO `aibdai_energy_advice` VALUES ('15', '750', '770', '感恩、祝福、始终美好。能量值非常高,意欲利于社会,悲悯世界,你的能量场影响着他人。', '1', '0', '0');
INSERT INTO `aibdai_energy_advice` VALUES ('16', '770', '800', '超然、自我实现、内外统一。能量值超高, 超越世俗牵绊,社会各领域的领军人物。', '1', '0', '0');
INSERT INTO `aibdai_energy_advice` VALUES ('17', '800', '1000', '慈悲、无我、天人合一。能量值爆表,强大的感召力,你的吸子能量场甚至能影响人类。', '1', '0', '0');

-- ----------------------------
-- Table structure for aibdai_energy_day
-- ----------------------------
DROP TABLE IF EXISTS `aibdai_energy_day`;
CREATE TABLE `aibdai_energy_day` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `energy_value` float NOT NULL COMMENT '能量值',
  `test_time` int(11) unsigned NOT NULL COMMENT '测试时间',
  `test_date` int(8) unsigned NOT NULL COMMENT '测试日期',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `test_date` (`test_date`)
) ENGINE=InnoDB AUTO_INCREMENT=657 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aibdai_energy_day
-- ----------------------------
INSERT INTO `aibdai_energy_day` VALUES ('11', '1', '32', '1454234126', '20160131');
INSERT INTO `aibdai_energy_day` VALUES ('12', '1', '32', '1454234137', '20160131');
INSERT INTO `aibdai_energy_day` VALUES ('13', '1', '32', '1454234143', '20160131');
INSERT INTO `aibdai_energy_day` VALUES ('14', '1', '38', '1454234149', '20160131');
INSERT INTO `aibdai_energy_day` VALUES ('15', '1', '38', '1454297019', '20160201');
INSERT INTO `aibdai_energy_day` VALUES ('16', '1', '38', '1454297022', '20160201');
INSERT INTO `aibdai_energy_day` VALUES ('17', '1', '38', '1454316827', '20160201');
INSERT INTO `aibdai_energy_day` VALUES ('18', '1', '0', '1454462452', '20160203');
INSERT INTO `aibdai_energy_day` VALUES ('19', '1', '23', '1454466560', '20160203');
INSERT INTO `aibdai_energy_day` VALUES ('20', '1', '23', '1454466581', '20160203');
INSERT INTO `aibdai_energy_day` VALUES ('21', '1', '23', '1454466626', '20160203');
INSERT INTO `aibdai_energy_day` VALUES ('22', '1', '23', '1454466632', '20160203');
INSERT INTO `aibdai_energy_day` VALUES ('23', '1', '135', '1454510855', '20160203');
INSERT INTO `aibdai_energy_day` VALUES ('24', '1', '370', '1454511143', '20160203');
INSERT INTO `aibdai_energy_day` VALUES ('25', '1', '370', '1454512435', '20160203');
INSERT INTO `aibdai_energy_day` VALUES ('26', '1', '220', '1454514137', '20160203');
INSERT INTO `aibdai_energy_day` VALUES ('27', '1', '370', '1454514330', '20160203');
INSERT INTO `aibdai_energy_day` VALUES ('28', '1', '590', '1454514583', '20160203');
INSERT INTO `aibdai_energy_day` VALUES ('29', '1', '370', '1454514609', '20160203');
INSERT INTO `aibdai_energy_day` VALUES ('30', '1', '310', '1454514663', '20160203');
INSERT INTO `aibdai_energy_day` VALUES ('31', '1', '370', '1454515045', '20160203');
INSERT INTO `aibdai_energy_day` VALUES ('32', '1', '220', '1454516972', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('33', '1', '135', '1454517048', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('34', '1', '220', '1454517075', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('35', '1', '185', '1454517247', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('36', '1', '220', '1454517366', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('37', '1', '515', '1454517788', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('38', '1', '370', '1454517979', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('39', '1', '565', '1454518054', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('40', '1', '565', '1454518076', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('41', '1', '325', '1454518091', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('42', '1', '135', '1454518125', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('43', '1', '220', '1454518189', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('44', '1', '565', '1454518397', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('45', '1', '135', '1454518505', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('46', '1', '325', '1454518855', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('47', '1', '60', '1454584093', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('48', '1', '220', '1454585101', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('49', '1', '370', '1454585172', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('50', '1', '220', '1454585278', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('51', '1', '60', '1454586603', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('52', '1', '190', '1454592890', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('53', '1', '325', '1454594604', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('54', '1', '220', '1454594678', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('55', '1', '185', '1454595256', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('56', '1', '370', '1454596411', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('57', '1', '220', '1454597245', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('58', '1', '60', '1454598224', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('59', '1', '185', '1454598263', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('60', '1', '185', '1454599416', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('61', '1', '390', '1454599542', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('62', '1', '135', '1454599764', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('63', '1', '370', '1454599797', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('64', '1', '60', '1454600092', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('65', '1', '370', '1454600122', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('66', '1', '60', '1454600221', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('67', '1', '220', '1454600537', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('68', '1', '220', '1454601476', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('69', '1', '220', '1454601517', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('70', '1', '135', '1454601545', '20160204');
INSERT INTO `aibdai_energy_day` VALUES ('71', '1', '60', '1454601756', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('72', '1', '370', '1454602692', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('73', '1', '135', '1454602809', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('74', '1', '60', '1454603069', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('75', '1', '60', '1454603248', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('76', '1', '142', '1454603315', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('77', '1', '925', '1454603610', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('78', '49', '100', '1454604146', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('79', '49', '200', '1454604163', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('80', '49', '845', '1454604692', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('81', '49', '200', '1454606194', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('82', '1', '812', '1454607318', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('83', '1', '850', '1454663085', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('84', '1', '515', '1454664701', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('85', '1', '185', '1454665475', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('86', '1', '240', '1454665794', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('87', '1', '39', '1454670270', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('88', '1', '220', '1454672572', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('89', '1', '370', '1454672682', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('90', '1', '220', '1454678183', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('91', '1', '135', '1454678272', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('92', '1', '325', '1454682081', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('93', '1', '515', '1454682237', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('94', '1', '240', '1454682368', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('95', '1', '125', '1454682402', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('96', '1', '185', '1454682444', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('97', '1', '370', '1454682627', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('98', '1', '240', '1454682694', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('99', '1', '380', '1454683301', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('100', '1', '325', '1454683502', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('101', '1', '135', '1454684411', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('102', '1', '220', '1454684483', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('103', '1', '185', '1454684733', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('104', '1', '110', '1454684948', '20160205');
INSERT INTO `aibdai_energy_day` VALUES ('105', '1', '185', '1454690270', '20160206');
INSERT INTO `aibdai_energy_day` VALUES ('106', '1', '185', '1454690581', '20160206');
INSERT INTO `aibdai_energy_day` VALUES ('107', '77', '185', '1454691917', '20160206');
INSERT INTO `aibdai_energy_day` VALUES ('108', '61', '507', '1454692579', '20160206');
INSERT INTO `aibdai_energy_day` VALUES ('109', '61', '653', '1454692601', '20160206');
INSERT INTO `aibdai_energy_day` VALUES ('110', '61', '548', '1454692634', '20160206');
INSERT INTO `aibdai_energy_day` VALUES ('111', '81', '278', '1454692830', '20160206');
INSERT INTO `aibdai_energy_day` VALUES ('112', '82', '506', '1454692924', '20160206');
INSERT INTO `aibdai_energy_day` VALUES ('113', '61', '570', '1454693081', '20160206');
INSERT INTO `aibdai_energy_day` VALUES ('114', '82', '349', '1454693189', '20160206');
INSERT INTO `aibdai_energy_day` VALUES ('115', '1', '110', '1454751095', '20160206');
INSERT INTO `aibdai_energy_day` VALUES ('116', '1', '220', '1455443716', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('117', '1', '370', '1455444329', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('118', '1', '39', '1455444434', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('119', '1', '185', '1455444829', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('120', '1', '135', '1455446499', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('121', '1', '565', '1455446912', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('122', '1', '185', '1455447392', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('123', '1', '220', '1455447422', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('124', '1', '115', '1455447752', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('125', '1', '370', '1455447781', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('126', '1', '370', '1455448730', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('127', '1', '325', '1455457820', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('128', '1', '110', '1455459813', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('129', '1', '115', '1455459852', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('130', '1', '325', '1455459971', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('131', '1', '110', '1455460443', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('132', '1', '565', '1455460655', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('133', '1', '185', '1455460750', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('134', '1', '195', '1455460831', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('135', '1', '515', '1455460864', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('136', '1', '220', '1455461137', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('137', '1', '187', '1455461986', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('138', '47', '135', '1455464418', '20160214');
INSERT INTO `aibdai_energy_day` VALUES ('139', '1', '500', '1455466857', '20160215');
INSERT INTO `aibdai_energy_day` VALUES ('140', '1', '565', '1455466941', '20160215');
INSERT INTO `aibdai_energy_day` VALUES ('141', '1', '135', '1455467089', '20160215');
INSERT INTO `aibdai_energy_day` VALUES ('142', '1', '647', '1455469744', '20160215');
INSERT INTO `aibdai_energy_day` VALUES ('143', '49', '220', '1455618264', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('144', '83', '216', '1455618759', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('145', '83', '216', '1455618903', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('146', '83', '216', '1455619001', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('147', '49', '0', '1455619363', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('148', '49', '354', '1455619569', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('149', '49', '204', '1455619666', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('150', '49', '574', '1455620315', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('151', '49', '574', '1455620339', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('152', '1', '500', '1455620491', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('153', '49', '574', '1455621063', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('154', '49', '574', '1455621063', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('155', '49', '0', '1455621698', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('156', '49', '0', '1455621835', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('157', '1', '500', '1455621940', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('158', '49', '0', '1455622204', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('159', '49', '470', '1455622233', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('160', '49', '361', '1455622608', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('161', '1', '135', '1455637251', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('162', '1', '39', '1455637410', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('163', '1', '60', '1455638335', '20160216');
INSERT INTO `aibdai_energy_day` VALUES ('164', '1', '60', '1455638417', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('165', '1', '370', '1455638483', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('166', '1', '60', '1455638640', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('167', '1', '60', '1455638749', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('168', '1', '60', '1455638779', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('169', '1', '60', '1455638993', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('170', '1', '60', '1455639163', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('171', '1', '925', '1455639325', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('172', '1', '240', '1455639357', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('173', '1', '32', '1455639409', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('174', '1', '220', '1455642288', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('175', '1', '380', '1455642499', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('176', '1', '185', '1455644438', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('177', '1', '577', '1455644493', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('178', '1', '225', '1455644543', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('179', '1', '230', '1455644567', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('180', '1', '220', '1455644769', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('181', '1', '135', '1455644869', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('182', '1', '185', '1455645114', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('183', '1', '220', '1455645927', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('184', '1', '230', '1455700395', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('185', '1', '565', '1455700542', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('186', '49', '0', '1455707994', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('187', '1', '95', '1455708074', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('188', '49', '0', '1455708127', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('189', '49', '524', '1455708154', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('190', '49', '161', '1455708178', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('191', '49', '161', '1455709007', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('192', '49', '161', '1455709017', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('193', '49', '161', '1455709153', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('194', '49', '161', '1455709385', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('195', '49', '161', '1455709602', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('196', '1', '282', '1455709775', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('197', '49', '161', '1455709855', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('198', '49', '161', '1455709947', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('199', '49', '161', '1455709962', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('200', '49', '239', '1455716599', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('201', '1', '415', '1455717060', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('202', '49', '199', '1455717904', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('203', '49', '199', '1455717924', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('204', '49', '266', '1455718170', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('205', '49', '266', '1455718199', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('206', '1', '335', '1455719488', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('207', '49', '266', '1455719678', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('208', '49', '266', '1455719800', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('209', '49', '266', '1455719967', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('210', '49', '266', '1455720159', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('211', '1', '285', '1455720177', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('212', '49', '266', '1455720235', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('213', '49', '266', '1455720365', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('214', '1', '226', '1455720395', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('215', '49', '266', '1455720471', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('216', '49', '266', '1455720560', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('217', '1', '90', '1455720864', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('218', '1', '313', '1455720917', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('219', '49', '266', '1455721034', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('220', '1', '218', '1455721179', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('221', '1', '412', '1455721202', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('222', '1', '356', '1455721246', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('223', '1', '448', '1455721742', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('224', '1', '443', '1455721772', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('225', '1', '357', '1455721792', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('226', '49', '266', '1455721846', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('227', '1', '448', '1455721880', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('228', '1', '293', '1455721900', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('229', '1', '627', '1455722132', '20160217');
INSERT INTO `aibdai_energy_day` VALUES ('230', '49', '266', '1455726208', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('231', '49', '266', '1455726227', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('232', '49', '266', '1455726254', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('233', '49', '266', '1455726504', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('234', '49', '266', '1455726632', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('235', '49', '266', '1455726861', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('236', '49', '266', '1455726979', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('237', '49', '266', '1455727085', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('238', '49', '266', '1455727119', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('239', '49', '266', '1455727180', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('240', '49', '266', '1455727934', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('241', '49', '266', '1455728940', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('242', '49', '266', '1455787536', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('243', '1', '162', '1455793769', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('244', '1', '196', '1455795373', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('245', '1', '443', '1455795429', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('246', '1', '322', '1455796417', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('247', '1', '196', '1455796546', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('248', '1', '196', '1455796666', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('249', '47', '208', '1455803840', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('250', '47', '196', '1455804243', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('251', '89', '196', '1455804323', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('252', '89', '196', '1455804472', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('253', '90', '322', '1455804617', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('254', '90', '322', '1455804719', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('255', '90', '196', '1455804896', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('256', '90', '196', '1455805007', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('257', '90', '196', '1455805096', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('258', '91', '243', '1455806147', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('259', '91', '196', '1455806312', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('260', '91', '322', '1455806452', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('261', '1', '417', '1455806549', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('262', '47', '322', '1455807327', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('263', '47', '322', '1455808592', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('264', '47', '458', '1455809332', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('265', '47', '196', '1455809365', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('266', '47', '227', '1455809467', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('267', '47', '128', '1455809503', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('268', '47', '152', '1455809532', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('269', '47', '322', '1455809974', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('270', '1', '196', '1455810119', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('271', '47', '322', '1455810350', '20160218');
INSERT INTO `aibdai_energy_day` VALUES ('272', '47', '196', '1455811599', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('273', '47', '196', '1455811725', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('274', '47', '113', '1455811955', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('275', '47', '322', '1455812052', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('276', '47', '196', '1455812134', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('277', '47', '196', '1455812167', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('278', '47', '196', '1455812336', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('279', '47', '178', '1455812414', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('280', '47', '196', '1455812905', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('281', '49', '196', '1455812911', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('282', '47', '152', '1455813035', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('283', '49', '0', '1455813087', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('284', '47', '131', '1455813594', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('285', '49', '0', '1455813913', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('286', '49', '0', '1455813928', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('287', '47', '196', '1455814059', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('288', '47', '126', '1455814092', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('289', '47', '150', '1455814299', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('290', '49', '0', '1455816557', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('291', '49', '0', '1455816781', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('292', '49', '0', '1455817432', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('293', '49', '0', '1455817946', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('294', '47', '468', '1455819853', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('295', '47', '322', '1455819966', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('296', '49', '0', '1455874228', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('297', '47', '162', '1455879352', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('298', '47', '117', '1455879419', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('299', '47', '115', '1455879714', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('300', '47', '165', '1455879782', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('301', '47', '397', '1455879928', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('302', '47', '88', '1455882874', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('303', '47', '320', '1455889224', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('304', '47', '216', '1455889344', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('305', '47', '122', '1455890110', '20160219');
INSERT INTO `aibdai_energy_day` VALUES ('306', '1', '290', '1456135595', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('307', '1', '311', '1456135660', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('308', '1', '247', '1456135707', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('309', '1', '210', '1456136019', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('310', '1', '282', '1456136140', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('311', '1', '196', '1456136989', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('312', '1', '325', '1456137169', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('313', '1', '283', '1456137252', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('314', '1', '221', '1456138139', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('315', '1', '120', '1456139024', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('316', '1', '120', '1456139719', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('317', '1', '287', '1456141163', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('318', '47', '352', '1456149476', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('319', '47', '160', '1456149517', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('320', '47', '157', '1456149802', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('321', '47', '420', '1456149839', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('322', '47', '283', '1456149881', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('323', '47', '311', '1456150027', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('324', '47', '236', '1456150074', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('325', '47', '211', '1456150117', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('326', '47', '236', '1456151369', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('327', '47', '448', '1456152309', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('328', '47', '296', '1456152473', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('329', '87', '229', '1456152680', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('330', '47', '352', '1456152737', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('331', '47', '388', '1456152816', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('332', '95', '309', '1456153107', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('333', '47', '175', '1456153900', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('334', '47', '448', '1456155002', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('335', '87', '124', '1456155332', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('336', '89', '403', '1456155457', '20160222');
INSERT INTO `aibdai_energy_day` VALUES ('337', '89', '388', '1456157860', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('338', '89', '448', '1456158251', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('339', '89', '260', '1456158278', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('340', '89', '448', '1456158508', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('341', '89', '352', '1456158684', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('342', '89', '236', '1456159176', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('343', '89', '448', '1456159527', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('344', '89', '611', '1456159579', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('345', '89', '420', '1456159691', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('346', '89', '540', '1456159746', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('347', '89', '520', '1456159833', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('348', '49', '0', '1456160021', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('349', '49', '0', '1456160084', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('350', '49', '0', '1456160157', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('351', '49', '0', '1456160184', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('352', '49', '0', '1456160349', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('353', '49', '0', '1456160653', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('354', '89', '122', '1456160729', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('355', '89', '210', '1456162226', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('356', '49', '0', '1456162692', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('357', '49', '0', '1456163341', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('358', '49', '0', '1456163462', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('359', '49', '0', '1456163548', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('360', '49', '0', '1456163745', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('361', '49', '0', '1456163777', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('362', '49', '470', '1456163789', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('363', '49', '470', '1456163822', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('364', '49', '470', '1456163856', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('365', '49', '470', '1456164149', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('366', '49', '470', '1456164162', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('367', '49', '470', '1456164426', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('368', '49', '470', '1456164435', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('369', '47', '122', '1456219314', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('370', '47', '532', '1456219595', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('371', '47', '210', '1456219635', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('372', '47', '211', '1456220071', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('373', '47', '210', '1456220114', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('374', '47', '352', '1456221157', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('375', '47', '385', '1456221274', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('376', '47', '448', '1456221304', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('377', '47', '520', '1456221490', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('378', '47', '520', '1456222595', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('379', '47', '252', '1456222634', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('380', '47', '448', '1456223027', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('381', '47', '520', '1456223192', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('382', '47', '282', '1456223307', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('383', '47', '210', '1456223607', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('384', '47', '164', '1456223743', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('385', '47', '210', '1456225520', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('386', '47', '282', '1456226378', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('387', '47', '448', '1456227164', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('388', '47', '282', '1456227216', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('389', '47', '448', '1456227307', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('390', '47', '251', '1456229096', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('391', '47', '173', '1456234646', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('392', '47', '352', '1456234706', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('393', '47', '135', '1456234763', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('394', '47', '448', '1456234956', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('395', '47', '491', '1456235060', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('396', '47', '210', '1456235119', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('397', '47', '311', '1456235849', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('398', '47', '247', '1456236440', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('399', '47', '388', '1456236640', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('400', '47', '282', '1456238669', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('401', '47', '420', '1456238706', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('402', '87', '239', '1456239405', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('403', '87', '239', '1456239420', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('404', '99', '468', '1456241395', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('405', '99', '397', '1456241459', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('406', '49', '470', '1456243050', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('407', '49', '470', '1456243161', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('408', '49', '470', '1456243163', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('409', '49', '470', '1456243173', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('410', '49', '470', '1456243190', '20160223');
INSERT INTO `aibdai_energy_day` VALUES ('411', '61', '0', '1456243568', '20160224');
INSERT INTO `aibdai_energy_day` VALUES ('412', '61', '476', '1456243929', '20160224');
INSERT INTO `aibdai_energy_day` VALUES ('413', '47', '397', '1456245033', '20160224');
INSERT INTO `aibdai_energy_day` VALUES ('414', '47', '491', '1456245949', '20160224');
INSERT INTO `aibdai_energy_day` VALUES ('415', '47', '448', '1456247054', '20160224');
INSERT INTO `aibdai_energy_day` VALUES ('416', '47', '520', '1456247084', '20160224');
INSERT INTO `aibdai_energy_day` VALUES ('417', '47', '388', '1456247636', '20160224');
INSERT INTO `aibdai_energy_day` VALUES ('418', '47', '448', '1456247671', '20160224');
INSERT INTO `aibdai_energy_day` VALUES ('419', '47', '236', '1456247850', '20160224');
INSERT INTO `aibdai_energy_day` VALUES ('420', '47', '311', '1456248060', '20160224');
INSERT INTO `aibdai_energy_day` VALUES ('421', '47', '455', '1456248281', '20160224');
INSERT INTO `aibdai_energy_day` VALUES ('422', '47', '282', '1456248404', '20160224');
INSERT INTO `aibdai_energy_day` VALUES ('423', '47', '325', '1456250268', '20160224');
INSERT INTO `aibdai_energy_day` VALUES ('424', '47', '347', '1456250350', '20160224');
INSERT INTO `aibdai_energy_day` VALUES ('425', '47', '448', '1456313570', '20160224');
INSERT INTO `aibdai_energy_day` VALUES ('426', '47', '420', '1456313898', '20160224');
INSERT INTO `aibdai_energy_day` VALUES ('427', '47', '520', '1456314129', '20160224');
INSERT INTO `aibdai_energy_day` VALUES ('428', '47', '371', '1456314460', '20160224');
INSERT INTO `aibdai_energy_day` VALUES ('429', '47', '352', '1456314537', '20160224');
INSERT INTO `aibdai_energy_day` VALUES ('430', '47', '282', '1456314888', '20160224');
INSERT INTO `aibdai_energy_day` VALUES ('431', '49', '0', '1456330668', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('432', '49', '0', '1456330684', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('433', '87', '239', '1456331044', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('434', '87', '239', '1456331081', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('435', '87', '239', '1456331095', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('436', '87', '239', '1456331210', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('437', '49', '0', '1456331514', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('438', '49', '0', '1456331541', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('439', '49', '0', '1456331560', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('440', '47', '352', '1456331566', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('441', '49', '0', '1456331594', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('442', '47', '448', '1456331665', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('443', '47', '448', '1456331790', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('444', '47', '448', '1456332259', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('445', '47', '448', '1456332547', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('446', '47', '282', '1456332691', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('447', '47', '448', '1456332924', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('448', '47', '448', '1456333019', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('449', '49', '0', '1456333533', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('450', '47', '352', '1456333595', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('451', '47', '532', '1456333767', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('452', '47', '222', '1456334852', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('453', '49', '0', '1456334918', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('454', '49', '0', '1456391360', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('455', '49', '0', '1456392036', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('456', '49', '0', '1456392052', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('457', '47', '236', '1456392493', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('458', '47', '397', '1456398756', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('459', '47', '397', '1456399541', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('460', '47', '532', '1456400925', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('461', '47', '283', '1456401072', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('462', '47', '540', '1456401189', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('463', '47', '592', '1456401298', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('464', '47', '448', '1456401645', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('465', '49', '0', '1456401933', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('466', '49', '0', '1456404505', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('467', '49', '0', '1456404617', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('468', '49', '0', '1456407451', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('469', '49', '0', '1456407480', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('470', '49', '0', '1456407557', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('471', '49', '0', '1456407744', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('472', '49', '0', '1456408023', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('473', '49', '0', '1456408120', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('474', '49', '0', '1456408746', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('475', '49', '0', '1456408803', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('476', '49', '0', '1456409266', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('477', '49', '0', '1456409295', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('478', '49', '0', '1456409333', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('479', '49', '0', '1456409350', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('480', '49', '0', '1456409407', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('481', '49', '0', '1456409547', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('482', '49', '0', '1456409639', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('483', '49', '0', '1456409964', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('484', '49', '0', '1456410121', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('485', '49', '0', '1456410322', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('486', '49', '0', '1456410380', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('487', '49', '0', '1456410408', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('488', '49', '0', '1456410421', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('489', '49', '0', '1456410445', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('490', '47', '122', '1456410446', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('491', '49', '0', '1456410460', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('492', '49', '0', '1456410728', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('493', '49', '0', '1456410809', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('494', '49', '0', '1456410890', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('495', '49', '0', '1456411302', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('496', '49', '0', '1456411389', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('497', '49', '0', '1456411846', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('498', '47', '245', '1456411870', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('499', '49', '0', '1456412385', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('500', '49', '0', '1456412824', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('501', '49', '0', '1456413121', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('502', '49', '0', '1456413147', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('503', '49', '0', '1456413274', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('504', '49', '0', '1456413290', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('505', '49', '0', '1456413404', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('506', '49', '0', '1456413441', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('507', '49', '0', '1456413449', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('508', '49', '0', '1456413458', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('509', '49', '0', '1456413568', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('510', '49', '0', '1456413704', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('511', '49', '0', '1456413756', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('512', '1', '615', '1456414628', '20160225');
INSERT INTO `aibdai_energy_day` VALUES ('513', '49', '0', '1456418073', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('514', '49', '0', '1456418189', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('515', '49', '0', '1456418246', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('516', '49', '0', '1456418475', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('517', '47', '296', '1456418733', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('518', '47', '468', '1456418781', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('519', '47', '397', '1456419332', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('520', '49', '0', '1456419668', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('521', '47', '468', '1456419730', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('522', '47', '468', '1456421988', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('523', '47', '196', '1456423439', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('524', '49', '0', '1456423524', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('525', '49', '0', '1456423544', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('526', '47', '448', '1456423546', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('527', '49', '0', '1456423564', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('528', '47', '397', '1456423582', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('529', '49', '0', '1456479316', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('530', '49', '0', '1456479332', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('531', '47', '282', '1456479357', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('532', '47', '448', '1456479455', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('533', '49', '0', '1456479481', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('534', '49', '0', '1456479497', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('535', '49', '0', '1456479681', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('536', '49', '0', '1456479693', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('537', '49', '0', '1456479716', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('538', '49', '0', '1456479743', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('539', '49', '0', '1456480744', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('540', '47', '352', '1456480745', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('541', '47', '311', '1456480818', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('542', '47', '388', '1456480931', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('543', '49', '0', '1456480972', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('544', '49', '0', '1456481145', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('545', '49', '0', '1456481374', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('546', '49', '0', '1456481458', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('547', '49', '0', '1456481640', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('548', '49', '0', '1456481728', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('549', '49', '0', '1456482029', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('550', '49', '0', '1456482340', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('551', '49', '0', '1456482665', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('552', '49', '0', '1456484738', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('553', '49', '0', '1456484999', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('554', '49', '0', '1456485120', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('555', '49', '0', '1456485126', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('556', '49', '0', '1456485135', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('557', '49', '0', '1456485337', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('558', '49', '0', '1456485401', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('559', '49', '0', '1456485525', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('560', '49', '0', '1456485576', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('561', '49', '0', '1456485695', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('562', '49', '0', '1456485947', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('563', '49', '0', '1456486066', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('564', '49', '0', '1456487608', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('565', '49', '0', '1456487839', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('566', '49', '0', '1456493377', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('567', '49', '0', '1456493476', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('568', '49', '0', '1456493590', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('569', '49', '0', '1456493729', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('570', '49', '0', '1456494010', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('571', '49', '0', '1456494060', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('572', '49', '0', '1456495819', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('573', '49', '0', '1456495984', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('574', '49', '0', '1456496030', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('575', '49', '0', '1456496192', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('576', '49', '0', '1456496853', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('577', '49', '0', '1456497007', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('578', '49', '0', '1456497031', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('579', '49', '0', '1456497049', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('580', '49', '0', '1456497662', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('581', '49', '0', '1456497675', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('582', '49', '0', '1456497696', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('583', '49', '0', '1456497706', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('584', '49', '0', '1456497720', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('585', '49', '0', '1456497924', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('586', '49', '0', '1456501529', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('587', '49', '0', '1456501544', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('588', '49', '0', '1456501564', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('589', '49', '0', '1456501574', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('590', '49', '0', '1456501576', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('591', '49', '0', '1456501605', '20160226');
INSERT INTO `aibdai_energy_day` VALUES ('592', '47', '468', '1456503538', '20160227');
INSERT INTO `aibdai_energy_day` VALUES ('593', '49', '0', '1456503560', '20160227');
INSERT INTO `aibdai_energy_day` VALUES ('594', '49', '0', '1456503587', '20160227');
INSERT INTO `aibdai_energy_day` VALUES ('595', '49', '0', '1456503596', '20160227');
INSERT INTO `aibdai_energy_day` VALUES ('596', '47', '551', '1456503633', '20160227');
INSERT INTO `aibdai_energy_day` VALUES ('597', '49', '0', '1456503676', '20160227');
INSERT INTO `aibdai_energy_day` VALUES ('598', '49', '0', '1456505145', '20160227');
INSERT INTO `aibdai_energy_day` VALUES ('599', '49', '0', '1456505276', '20160227');
INSERT INTO `aibdai_energy_day` VALUES ('600', '49', '0', '1456505351', '20160227');
INSERT INTO `aibdai_energy_day` VALUES ('601', '49', '0', '1456505541', '20160227');
INSERT INTO `aibdai_energy_day` VALUES ('602', '49', '0', '1456508902', '20160227');
INSERT INTO `aibdai_energy_day` VALUES ('603', '49', '0', '1456509153', '20160227');
INSERT INTO `aibdai_energy_day` VALUES ('604', '49', '0', '1456509324', '20160227');
INSERT INTO `aibdai_energy_day` VALUES ('605', '49', '0', '1456509940', '20160227');
INSERT INTO `aibdai_energy_day` VALUES ('606', '49', '0', '1456510024', '20160227');
INSERT INTO `aibdai_energy_day` VALUES ('607', '49', '0', '1456510134', '20160227');
INSERT INTO `aibdai_energy_day` VALUES ('608', '47', '468', '1456738213', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('609', '47', '468', '1456738214', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('610', '49', '0', '1456739976', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('611', '49', '0', '1456740277', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('612', '47', '468', '1456740452', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('613', '49', '0', '1456740962', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('614', '49', '0', '1456741008', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('615', '49', '0', '1456745217', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('616', '47', '468', '1456745379', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('617', '49', '0', '1456745631', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('618', '49', '0', '1456745842', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('619', '49', '0', '1456753470', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('620', '49', '0', '1456755026', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('621', '49', '361', '1456755263', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('622', '49', '361', '1456755290', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('623', '49', '361', '1456755308', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('624', '49', '361', '1456755361', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('625', '49', '361', '1456755374', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('626', '49', '361', '1456755408', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('627', '49', '564', '1456755422', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('628', '49', '564', '1456755486', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('629', '49', '564', '1456755541', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('630', '49', '564', '1456757353', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('631', '49', '564', '1456758223', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('632', '49', '564', '1456758391', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('633', '49', '564', '1456758428', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('634', '49', '564', '1456758436', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('635', '49', '564', '1456758453', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('636', '49', '0', '1456760286', '20160229');
INSERT INTO `aibdai_energy_day` VALUES ('637', '85', '166', '1456764427', '20160301');
INSERT INTO `aibdai_energy_day` VALUES ('638', '85', '166', '1456764438', '20160301');
INSERT INTO `aibdai_energy_day` VALUES ('639', '85', '166', '1456764448', '20160301');
INSERT INTO `aibdai_energy_day` VALUES ('640', '85', '166', '1456764457', '20160301');
INSERT INTO `aibdai_energy_day` VALUES ('641', '47', '282', '1456765764', '20160301');
INSERT INTO `aibdai_energy_day` VALUES ('642', '49', '0', '1456766748', '20160301');
INSERT INTO `aibdai_energy_day` VALUES ('643', '103', '0', '1456768413', '20160301');
INSERT INTO `aibdai_energy_day` VALUES ('644', '49', '0', '1456823081', '20160301');
INSERT INTO `aibdai_energy_day` VALUES ('645', '49', '0', '1456823211', '20160301');
INSERT INTO `aibdai_energy_day` VALUES ('646', '106', '0', '1456823787', '20160301');
INSERT INTO `aibdai_energy_day` VALUES ('647', '106', '0', '1456823947', '20160301');
INSERT INTO `aibdai_energy_day` VALUES ('648', '106', '0', '1456824895', '20160301');
INSERT INTO `aibdai_energy_day` VALUES ('649', '106', '0', '1456826504', '20160301');
INSERT INTO `aibdai_energy_day` VALUES ('650', '49', '0', '1456828445', '20160301');
INSERT INTO `aibdai_energy_day` VALUES ('651', '49', '0', '1456829057', '20160301');
INSERT INTO `aibdai_energy_day` VALUES ('652', '49', '0', '1456829921', '20160301');
INSERT INTO `aibdai_energy_day` VALUES ('653', '49', '0', '1456831188', '20160301');
INSERT INTO `aibdai_energy_day` VALUES ('654', '49', '0', '1456831195', '20160301');
INSERT INTO `aibdai_energy_day` VALUES ('655', '1', '1', '1457451475', '20160308');
INSERT INTO `aibdai_energy_day` VALUES ('656', '49', '640', '1459263997', '20160329');

-- ----------------------------
-- Table structure for aibdai_energy_month
-- ----------------------------
DROP TABLE IF EXISTS `aibdai_energy_month`;
CREATE TABLE `aibdai_energy_month` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `energy_value` float(255,0) DEFAULT NULL,
  `test_time` int(11) DEFAULT NULL,
  `test_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `test_date` (`test_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of aibdai_energy_month
-- ----------------------------

-- ----------------------------
-- Table structure for aibdai_energy_rank
-- ----------------------------
DROP TABLE IF EXISTS `aibdai_energy_rank`;
CREATE TABLE `aibdai_energy_rank` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `last_value` float unsigned NOT NULL COMMENT '最后测试能量值',
  `all_value` float NOT NULL COMMENT '总测试能量值',
  `test_time` int(11) unsigned NOT NULL COMMENT '最后测试时间',
  `test_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '测试总次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `test_count` (`test_count`),
  KEY `all_value` (`all_value`),
  KEY `last_value` (`last_value`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=432 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aibdai_energy_rank
-- ----------------------------
INSERT INTO `aibdai_energy_rank` VALUES ('8', '1', '1', '47653', '1457451475', '185');
INSERT INTO `aibdai_energy_rank` VALUES ('69', '49', '640', '28228', '1459263997', '260');
INSERT INTO `aibdai_energy_rank` VALUES ('98', '77', '185', '185', '1454691917', '1');
INSERT INTO `aibdai_energy_rank` VALUES ('99', '61', '476', '2754', '1456243929', '6');
INSERT INTO `aibdai_energy_rank` VALUES ('102', '81', '278', '278', '1454692830', '1');
INSERT INTO `aibdai_energy_rank` VALUES ('103', '82', '349', '855', '1454693189', '2');
INSERT INTO `aibdai_energy_rank` VALUES ('126', '47', '282', '46614', '1456765764', '144');
INSERT INTO `aibdai_energy_rank` VALUES ('132', '83', '216', '648', '1455619001', '3');
INSERT INTO `aibdai_energy_rank` VALUES ('239', '89', '210', '5798', '1456162226', '16');
INSERT INTO `aibdai_energy_rank` VALUES ('241', '90', '196', '1232', '1455805096', '5');
INSERT INTO `aibdai_energy_rank` VALUES ('246', '91', '322', '761', '1455806452', '3');
INSERT INTO `aibdai_energy_rank` VALUES ('317', '87', '239', '1787', '1456331210', '8');
INSERT INTO `aibdai_energy_rank` VALUES ('320', '95', '309', '309', '1456153107', '1');
INSERT INTO `aibdai_energy_rank` VALUES ('392', '99', '397', '865', '1456241459', '2');
INSERT INTO `aibdai_energy_rank` VALUES ('422', '85', '166', '664', '1456764457', '4');
INSERT INTO `aibdai_energy_rank` VALUES ('428', '103', '0', '0', '1456768413', '1');
INSERT INTO `aibdai_energy_rank` VALUES ('431', '106', '0', '0', '1456826504', '4');

-- ----------------------------
-- Table structure for aibdai_energy_week
-- ----------------------------
DROP TABLE IF EXISTS `aibdai_energy_week`;
CREATE TABLE `aibdai_energy_week` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `energy_value` float(255,0) DEFAULT NULL,
  `test_time` int(11) DEFAULT NULL,
  `test_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `test_date` (`test_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of aibdai_energy_week
-- ----------------------------

-- ----------------------------
-- Table structure for aibdai_msg
-- ----------------------------
DROP TABLE IF EXISTS `aibdai_msg`;
CREATE TABLE `aibdai_msg` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发送用户id',
  `target_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '目标用户id',
  `msg_type` int(11) NOT NULL COMMENT '消息类型',
  `msg` text NOT NULL COMMENT '消息内容',
  `reply` text COMMENT '回复内容',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除，1删除，０正常',
  `isread` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否阅读，0未读，１已读',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `isdelete` (`isdelete`) USING BTREE,
  KEY `target_id` (`target_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of aibdai_msg
-- ----------------------------
INSERT INTO `aibdai_msg` VALUES ('1', '1', '47', '1', 'stay hungry stay foolish', null, '1454685206', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('2', '1', '47', '1', 'stay hungry stay foolish', null, '1454685208', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('3', '1', '47', '1', 'stay hungry stay foolish', null, '1454685210', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('4', '1', '47', '1', 'stay hungry stay foolish', null, '1454685231', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('5', '1', '47', '1', 'stay hungry stay foolish', null, '1454685236', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('6', '1', '47', '1', 'stay hungry stay foolish', null, '1454685238', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('7', '1', '47', '2', 'The ', null, '1455461556', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('8', '1', '47', '2', 'The ', null, '1455461558', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('9', '1', '47', '2', 'The ', null, '1455461650', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('10', '1', '47', '2', 'The ', null, '1455461652', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('11', '1', '47', '2', 'The ', null, '1455461654', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('12', '1', '47', '2', 'The ', null, '1455461655', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('13', '1', '47', '2', 'The ', null, '1455461657', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('14', '1', '47', '2', 'The ', null, '1455461812', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('15', '1', '47', '2', 'The ', null, '1455461813', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('16', '47', '1', '2', '', null, '1455463919', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('17', '47', '1', '2', '', null, '1455463924', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('18', '47', '1', '2', '', null, '1455463925', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('19', '47', '1', '2', '', null, '1455463926', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('20', '47', '1', '2', '', null, '1455463928', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('21', '47', '1', '2', '', null, '1455463928', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('22', '47', '1', '2', '我们都会有些不是我 便是你的确是不是很多人', null, '1455464299', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('23', '47', '1', '2', '我们都会有些不是我 便是你的确是不是很多', null, '1455464449', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('24', '1', '49', '1', '\"1111\"', null, '1455550451', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('25', '1', '49', '1', '\"1111\"', null, '1455552720', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('26', '83', '49', '1', '', null, '1455618787', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('27', '83', '49', '1', '', null, '1455618795', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('28', '83', '49', '1', '', null, '1455618796', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('29', '83', '49', '1', '', null, '1455618797', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('30', '83', '49', '1', '', null, '1455618797', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('31', '83', '49', '1', '', null, '1455618797', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('32', '83', '49', '1', '', null, '1455618797', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('33', '83', '49', '1', '', null, '1455618797', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('34', '83', '49', '1', '', null, '1455618797', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('35', '83', '49', '1', '', null, '1455618798', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('36', '83', '49', '1', '', null, '1455618798', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('37', '83', '49', '1', '', null, '1455618798', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('38', '83', '49', '1', '', null, '1455618798', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('39', '83', '49', '1', '', null, '1455618798', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('40', '83', '49', '1', '', null, '1455618798', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('41', '83', '49', '1', '', null, '1455618798', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('42', '83', '49', '1', '', null, '1455618798', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('43', '83', '49', '1', '', null, '1455618799', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('44', '83', '49', '1', '', null, '1455618799', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('45', '83', '49', '1', '', null, '1455618799', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('46', '83', '49', '1', '', null, '1455618799', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('47', '83', '49', '1', '', null, '1455618799', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('48', '83', '49', '1', '', null, '1455618799', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('49', '83', '49', '1', '', null, '1455618799', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('50', '83', '49', '1', '', null, '1455618799', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('51', '83', '49', '1', '', null, '1455618800', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('52', '83', '49', '1', '', null, '1455618800', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('53', '83', '49', '1', '', null, '1455618800', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('54', '83', '49', '1', '', null, '1455618800', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('55', '83', '49', '1', '', null, '1455618806', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('56', '83', '49', '1', '', null, '1455618807', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('57', '83', '49', '1', '', null, '1455618807', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('58', '83', '49', '1', '', null, '1455618807', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('59', '83', '49', '1', '', null, '1455618807', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('60', '83', '49', '1', '', null, '1455618914', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('61', '83', '49', '1', '', null, '1455618923', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('62', '83', '49', '1', '', null, '1455618929', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('63', '83', '49', '1', '', null, '1455618930', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('64', '83', '49', '1', '', null, '1455618930', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('65', '83', '49', '1', '', null, '1455618930', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('66', '83', '49', '1', '', null, '1455618931', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('67', '1', '47', '2', 'aibudai', null, '1455792884', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('68', '1', '47', '2', '测试能量语句1', null, '1455810164', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('69', '1', '47', '2', '测试能量语句2', null, '1455810168', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('70', '1', '47', '2', '测试能量语句3', null, '1455810171', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('71', '1', '47', '2', '测试能量语句4', null, '1455810173', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('72', '1', '47', '2', '测试能量语句5', null, '1455810176', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('73', '1', '61', '2', '乡。好难受', null, '1455895265', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('74', '47', '49', '1', '哈哈，还不错哈', null, '1456148562', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('75', '47', '49', '1', '欢迎下次再来', null, '1456148579', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('76', '47', '49', '1', '欢迎下次再来', null, '1456148607', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('77', '87', '95', '1', '满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满满', null, '1456152747', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('78', '97', '87', '1', '你好', null, '1456153686', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('79', '98', '87', '2', '你和', null, '1456156021', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('80', '98', '87', '2', '你和', null, '1456156022', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('81', '98', '87', '2', '你和', null, '1456156024', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('82', '98', '87', '2', '你和', null, '1456156025', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('83', '98', '87', '2', '你和', null, '1456156026', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('84', '98', '87', '2', '你和', null, '1456156027', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('85', '98', '87', '2', '你和', null, '1456156029', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('86', '98', '87', '2', '你和', null, '1456156030', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('87', '98', '87', '2', '你和', null, '1456156031', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('88', '98', '87', '2', '你和', null, '1456156039', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('89', '48', '49', '2', '今天天气不错', null, '1456164101', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('90', '48', '49', '2', '哈哈哈，下班了', null, '1456164235', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('91', '47', '89', '2', 'The only one ', null, '1456222796', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('92', '47', '89', '2', 'The only one ', null, '1456222835', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('93', '47', '89', '2', 'The only one ', null, '1456222973', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('94', '47', '89', '2', 'The only thing that would make it a lot of ', null, '1456223052', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('95', '49', '61', '2', '哈哈哈哈', null, '1456242978', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('96', '61', '49', '2', '还出来568', null, '1456243144', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('97', '49', '61', '2', '哈哈，天气不错', null, '1456243544', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('98', '1', '47', '2', '真正的勇士是认清生活的真相，依然热爱生活', null, '1456412038', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('99', '1', '47', '2', '真正的勇士是认清生活的真相，依然热爱生活', null, '1456412041', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('100', '1', '47', '2', '真正的勇士是认清生活的真相，依然热爱生活', null, '1456412044', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('101', '1', '47', '2', '真正的勇士是认清生活的真相，依然热爱生活', null, '1456412046', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('102', '1', '46', '1', '123', null, '1456419251', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('103', '1', '83', '1', 'hah', null, '1456423390', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('104', '49', '49', '2', '还差不多', null, '1456843218', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('105', '66', '66', '2', '还差不多', null, '1456844012', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('106', '66', '66', '2', '哈哈哈哈？居多', null, '1456845010', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('107', '66', '66', '2', '不聊了可口可乐', null, '1456845409', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('108', '66', '66', '2', '纪录片起', null, '1456845450', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('109', '66', '66', '2', '扣扣扣了', null, '1456845455', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('110', '66', '66', '2', '你下午lomo', null, '1456845460', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('111', '66', '66', '2', '哦乌克丽丽', null, '1456845465', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('112', '66', '66', '2', '五天可口可乐', null, '1456845472', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('113', '66', '66', '2', '五天可口可乐呕吐扣扣了', null, '1456845476', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('114', '66', '66', '2', '五天可口可乐呕吐扣扣了呕吐', null, '1456845479', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('115', '66', '66', '2', '啊旅途', null, '1456845598', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('116', '66', '66', '2', 'YY图JJ', null, '1456845604', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('117', '66', '66', '2', 'YY图JJ找我了', null, '1456845625', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('118', '66', '66', '2', '还差不多', null, '1456846584', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('119', '66', '66', '2', '还差不多，就开始', null, '1456846587', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('120', '66', '66', '2', '还差不多，就开OK脱了，哦屠龙记', null, '1456846593', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('121', '66', '66', '2', '还差不多，就开OK脱了，哦老嬷嬷屠龙记', null, '1456846597', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('122', '66', '66', '2', '纪录片起，吉吉', null, '1456846774', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('123', '66', '66', '2', '纪录片起，吉吉可口可乐', null, '1456846778', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('124', '66', '66', '2', '纪录片起，吉吉可口可乐萝莉控', null, '1456846780', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('125', '66', '66', '2', '纪录片起，吉吉可口可乐萝莉控冥界警局V5', null, '1456846783', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('126', '66', '66', '2', '纪录片起，吉吉可口可乐萝莉控冥界警局V5旅途突击', null, '1456846785', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('127', '66', '66', '2', '纪录片起，吉吉可口可乐萝莉控冥界警局V5旅途突击可口可乐了', null, '1456846787', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('128', '66', '66', '2', '纪录片起，吉吉可口可乐萝莉控冥界警局V5旅途突击可口可乐了', null, '1456846788', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('129', '66', '66', '2', 'JJ葵花', null, '1456847061', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('130', '66', '66', '2', '纪录片起', null, '1456847461', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('131', '66', '66', '2', '纪录片起5588565', null, '1456847464', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('132', '66', '66', '2', '纪录片起5588565658774444', null, '1456847466', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('133', '66', '66', '2', '纪录片起5588565658774444688885', null, '1456847468', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('134', '66', '66', '2', '困了就睡起', null, '1456848375', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('135', '66', '66', '2', '考虑考虑', null, '1456848406', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('136', '66', '66', '2', '考虑考虑55555', null, '1456848409', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('137', '66', '66', '2', '考虑考虑55555具体来讲', null, '1456848413', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('138', '66', '66', '2', '考虑考虑55555具体来讲女停机了', null, '1456848416', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('139', '66', '66', '2', '考虑考虑55555具体来讲女停机了考虑考虑', null, '1456848418', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('140', '66', '66', '2', '近距离', null, '1456848726', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('141', '66', '66', '2', '近距离5555', null, '1456848730', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('142', '66', '66', '2', '近距离5555哦哦距离', null, '1456848733', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('143', '66', '66', '2', '近距离5555哦哦距离路路通', null, '1456848736', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('144', '66', '66', '2', '近距离5555哦哦距离路路通近距离', null, '1456848739', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('145', '66', '66', '2', '近距离555', null, '1456849219', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('146', '66', '66', '2', '近距离555女吐了', null, '1456849222', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('147', '66', '66', '2', '近距离555女吐了具体来讲', null, '1456849225', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('148', '66', '66', '2', '近距离555女吐了具体来讲可口可乐了', null, '1456849228', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('149', '66', '66', '2', '近距离555女吐了具体来讲可口可沐浴露乐了', null, '1456849231', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('150', '66', '66', '2', '考虑考虑555', null, '1456849443', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('151', '66', '66', '2', '考虑考虑555没流量了', null, '1456849446', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('152', '66', '66', '2', '考虑考虑555没流量了具体来讲', null, '1456849449', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('153', '66', '66', '2', '板栗科技', null, '1456849509', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('154', '66', '66', '2', '板栗科技摸我', null, '1456849512', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('155', '66', '66', '2', '板栗科技摸我兔兔我', null, '1456849515', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('156', '66', '66', '2', '板栗科技摸我兔兔我民族团结', null, '1456849518', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('157', '66', '66', '2', '板栗科技摸我兔兔我民族团结摩天轮', null, '1456849521', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('158', '66', '66', '2', '板栗科技摸我兔兔我民族团结摩天轮', null, '1456849521', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('159', '66', '66', '2', '55555555', null, '1456850172', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('160', '66', '66', '2', '55555555监控哦哦', null, '1456850175', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('161', '66', '66', '2', '55555555监控哦哦5句我们', null, '1456850179', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('162', '66', '66', '2', '55555555监控哦哦5句我们龙膜', null, '1456850182', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('163', '66', '66', '2', '近距离', null, '1456850592', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('164', '66', '66', '2', '近距离555555', null, '1456850595', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('165', '66', '66', '2', '近距离555555凸透镜', null, '1456850598', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('166', '66', '66', '2', '近距离555555凸透镜咯菌腈', null, '1456850600', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('167', '66', '66', '2', '滤清器5558', null, '1456850719', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('168', '66', '66', '2', '据统计555', null, '1456850732', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('169', '66', '66', '2', '据统计555哈伦裤', null, '1456850735', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('170', '66', '66', '2', '据统计555哈伦裤咯网络', null, '1456850738', '0', '1', '1');
INSERT INTO `aibdai_msg` VALUES ('171', '66', '66', '2', '考虑考虑5555', null, '1456851370', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('172', '66', '66', '2', '近距离555', null, '1456851385', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('173', '66', '66', '2', '近距离555据统计555', null, '1456851388', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('174', '66', '66', '2', '近距离555据统计555‘太可怜了’', null, '1456851393', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('175', '66', '66', '2', '考虑考虑555', null, '1456851920', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('176', '66', '66', '2', '考虑考虑555考虑考虑', null, '1456851922', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('177', '66', '66', '2', '考虑考虑555考虑考虑看一下', null, '1456851925', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('178', '66', '66', '2', '考虑考虑555考虑考虑看一下LOL', null, '1456851928', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('179', '66', '66', '2', '155具体', null, '1456852068', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('180', '66', '66', '2', '155具体女子学院', null, '1456852071', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('181', '66', '66', '2', '恐龙妹体女子学院木头', null, '1456852077', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('182', '66', '66', '2', '恐龙妹体女子学院木头咯YY我', null, '1456852080', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('183', '66', '66', '2', '恐龙妹体女子学院木头咯YY我下雨了', null, '1456852083', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('184', '66', '66', '2', '近距离56552', null, '1456852430', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('185', '66', '66', '2', '近距离56552空间里', null, '1456852434', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('186', '66', '66', '2', '近距离56552空间里来昆明', null, '1456852437', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('187', '66', '66', '2', '近距离56552空间里来昆明凸透镜', null, '1456852439', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('188', '66', '66', '2', '近距离56552空间里来昆明凸透镜默默哦', null, '1456852446', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('189', '66', '66', '2', '5句提交8555', null, '1456853083', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('190', '66', '66', '2', '5句提交8555图停机了', null, '1456853086', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('191', '66', '66', '2', '5句提交8555图停机了具体', null, '1456853089', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('192', '66', '66', '2', '5句提交8555图停机了具体近距离', null, '1456853092', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('193', '66', '66', '2', '考虑考虑5555', null, '1456853301', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('194', '66', '66', '2', '考虑考虑5555OK吐了', null, '1456853306', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('195', '66', '66', '2', '考虑考虑5555OK吐了考虑考虑', null, '1456853310', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('196', '66', '66', '2', '路路通585', null, '1456853547', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('197', '66', '66', '2', '路路通585旅途', null, '1456853551', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('198', '66', '66', '2', '路路通585旅途铝土矿', null, '1456853554', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('199', '66', '66', '2', '路路通585旅途铝土矿近距离', null, '1456853557', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('200', '66', '66', '2', '路路通585旅途铝土矿近距离考虑考虑', null, '1456853560', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('201', '66', '66', '2', '路路通585旅途铝土矿近考虑考虑离考虑考虑', null, '1456853563', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('202', '66', '66', '2', '据统计5555', null, '1456853723', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('203', '66', '66', '2', '据统计5555兔兔', null, '1456853726', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('204', '66', '66', '2', '据统计5555兔兔考虑考虑', null, '1456853729', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('205', '66', '66', '2', '据统计5555兔兔考虑考虑联系我', null, '1456853732', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('206', '66', '66', '2', '据统计5555兔兔考虑考虑联系我监控', null, '1456853735', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('207', '66', '66', '2', '考虑考虑555', null, '1456853815', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('208', '66', '66', '2', '看看咯', null, '1456853827', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('209', '66', '66', '2', '看看咯考虑考虑', null, '1456853830', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('210', '66', '66', '2', '看看咯考虑考虑裤头', null, '1456853832', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('211', '66', '66', '2', '看看咯考虑考虑裤头没有我', null, '1456853835', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('212', '66', '66', '2', '看看咯考虑考虑裤头没有我铝土矿', null, '1456853838', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('213', '66', '66', '2', '看看咯考虑考虑裤头没有我铝土矿凸透镜', null, '1456853840', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('214', '66', '66', '2', '看看咯考虑考虑裤头没有我铝土矿凸透镜考虑考虑', null, '1456853843', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('215', '66', '66', '2', '看看咯考虑考虑裤头没有我铝土矿凸透镜考虑考虑农历', null, '1456853845', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('216', '66', '66', '2', '看看咯考虑考虑裤头没有我铝土矿凸透镜考虑考虑农历紧急集合', null, '1456853848', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('217', '66', '66', '2', '看看咯考虑考虑裤头没有我铝土矿凸透镜考虑考虑农历紧急集合控件', null, '1456853851', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('218', '66', '66', '2', '看看咯考虑考虑裤头没有我铝土矿凸透镜考虑考虑农历紧急集合控件考虑考虑', null, '1456853853', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('219', '66', '66', '2', '看看咯考虑考虑裤头没有我铝土矿凸透镜考虑考虑农历紧急集合控考虑考虑件考虑考虑', null, '1456853856', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('220', '66', '66', '2', '考虑考虑', null, '1456853966', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('221', '66', '66', '2', '考虑考虑考虑', null, '1456853969', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('222', '66', '66', '2', '考虑考虑考虑5558', null, '1456853972', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('223', '66', '66', '2', '考虑考虑考虑5558路路通', null, '1456853975', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('224', '66', '66', '2', '考虑考虑考虑5558路路通有图', null, '1456853978', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('225', '66', '66', '2', '考虑考虑考虑5558路路通有图图示', null, '1456853981', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('226', '66', '66', '2', '考虑考虑考虑5558路路通有图图示叽叽咕咕', null, '1456853983', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('227', '66', '66', '2', '考虑考虑考虑5558路路通有图图示叽叽咕咕龙膜', null, '1456853987', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('228', '66', '66', '2', '考虑考虑考虑5558路路通有图图示叽叽咕咕龙膜没有物流', null, '1456853989', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('229', '66', '66', '2', '考虑考虑考虑5558路路通有图图示叽叽咕咕龙膜没有物流具体化', null, '1456853992', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('230', '66', '66', '2', '考虑考虑考虑5558路路通有图图示叽叽咕咕龙膜没有物流具体化你想我了', null, '1456853995', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('231', '66', '66', '2', '了咯了556', null, '1456854183', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('232', '66', '66', '2', '了咯了5566658', null, '1456854186', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('233', '66', '66', '2', '了咯了5566658g考虑考虑', null, '1456854193', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('234', '66', '66', '2', '了咯了5566658g考虑考虑考虑考虑', null, '1456854196', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('235', '66', '66', '2', '了咯了5566658g考虑考虑考虑考虑看看咯', null, '1456854198', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('236', '66', '66', '2', '了咯了5566658g考虑考虑考虑考虑看看咯龙膜', null, '1456854201', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('237', '66', '66', '2', '了咯了5566658g考虑考虑考虑考虑看看咯龙膜乌克丽丽', null, '1456854204', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('238', '66', '66', '2', '了咯了5566658g考虑考虑考虑考虑看看咯龙膜乌克丽丽可口可乐了', null, '1456854206', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('239', '66', '66', '2', '近距离考虑考虑', null, '1456854326', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('240', '66', '66', '2', '近距离考虑考虑没流量了', null, '1456854329', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('241', '66', '66', '2', '近距离考虑考虑没流量了考虑考虑', null, '1456854332', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('242', '66', '66', '2', '近距离考虑考虑没流量了考虑考看看咯虑', null, '1456854335', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('243', '66', '66', '2', '近距离考虑考虑没流量了考虑考看看咯虑摸我', null, '1456854340', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('244', '66', '66', '2', '近距离考虑考虑没流量了考虑考看看咯虑摸我我在我', null, '1456854343', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('245', '66', '66', '2', '近距离考虑考虑没流量了考虑考看看咯虑摸我我在我我我我我', null, '1456854346', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('246', '66', '66', '2', '近距离考虑考虑没流量了考虑考看看咯虑摸我我在我我我我我女近距离', null, '1456854349', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('247', '66', '66', '2', '近距离', null, '1456854476', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('248', '66', '66', '2', '近距离考虑考虑', null, '1456854479', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('249', '66', '66', '2', '近距离考虑考虑T裤接口', null, '1456854482', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('250', '66', '66', '2', '近距离考虑考虑T裤接口龙膜', null, '1456854485', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('251', '66', '66', '2', '近距离考虑考虑T裤接口龙膜通知近距离', null, '1456854488', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('252', '66', '66', '2', '近距离考虑考虑T裤接口龙膜通知近距离看空间', null, '1456854491', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('253', '66', '66', '2', '近距离考虑考虑T裤接口龙膜通知近距离看空间弄弄', null, '1456854493', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('254', '66', '66', '2', '近距离考虑考虑T裤接口龙膜通知近距离看空间弄弄考虑考虑', null, '1456854496', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('255', '66', '66', '2', '近距离考虑考虑T裤接口龙膜通知近距离看空间弄弄考虑考虑考虑考虑', null, '1456854499', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('256', '66', '66', '2', '近距离考虑考虑T裤接口龙膜通知近距离看空间弄弄考虑考虑考虑考虑哈哈哈咯', null, '1456854502', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('257', '66', '66', '2', '近距离考虑考虑T裤接口龙膜通知近距离看空间弄弄考虑考虑考虑考虑哈哈哈咯陌陌', null, '1456854504', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('258', '66', '66', '2', '近距离考虑考虑T裤接口龙膜通知近距离看空间弄弄考虑考虑考虑考虑哈哈哈咯陌陌叫我', null, '1456854507', '0', '1', '0');
INSERT INTO `aibdai_msg` VALUES ('259', '66', '49', '2', '近距离', null, '1456854809', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('260', '66', '49', '2', '考虑考虑', null, '1456854844', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('261', '66', '49', '2', '近距离', null, '1456855440', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('262', '66', '49', '2', '考虑考虑', null, '1456855452', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('263', '66', '49', '2', '考虑考虑屠龙记', null, '1456855455', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('264', '66', '49', '2', '考虑考虑屠龙记龙膜', null, '1456855457', '0', '0', '1');
INSERT INTO `aibdai_msg` VALUES ('265', '1', '1', '2', '加油!', null, '1457452458', '0', '0', '0');
INSERT INTO `aibdai_msg` VALUES ('266', '1', '62', '1', 'jfdj', null, '1457609831', '0', '0', '0');

-- ----------------------------
-- Table structure for aibdai_msg_read
-- ----------------------------
DROP TABLE IF EXISTS `aibdai_msg_read`;
CREATE TABLE `aibdai_msg_read` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `msg_id` bigint(20) unsigned NOT NULL COMMENT '消息id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `msg_id` (`msg_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of aibdai_msg_read
-- ----------------------------

-- ----------------------------
-- Table structure for aibdai_share
-- ----------------------------
DROP TABLE IF EXISTS `aibdai_share`;
CREATE TABLE `aibdai_share` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1激励闹钟分享,2能量值分享',
  `user_id` bigint(20) unsigned NOT NULL,
  `info` text NOT NULL,
  `isdelete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `isdelete` (`isdelete`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of aibdai_share
-- ----------------------------
INSERT INTO `aibdai_share` VALUES ('1', '1', '1', '分享信息', '0', '1457975267');
INSERT INTO `aibdai_share` VALUES ('2', '1', '1', 'fdffd', '0', '1457976006');
INSERT INTO `aibdai_share` VALUES ('3', '1', '1', '我要早起', '0', '1457977266');
INSERT INTO `aibdai_share` VALUES ('4', '1', '1', 'hello clock', '0', '1457985051');
INSERT INTO `aibdai_share` VALUES ('5', '2', '1', '999.000000', '0', '1458731069');
INSERT INTO `aibdai_share` VALUES ('6', '2', '1', '999', '0', '1458731150');
INSERT INTO `aibdai_share` VALUES ('7', '1', '1', '我要在3月16日 02:03完成[jkfd]，我正在使用能量时钟哦！', '0', '1458756808');
INSERT INTO `aibdai_share` VALUES ('8', '2', '1', '100', '0', '1458757259');

-- ----------------------------
-- Table structure for aibdai_sms_record
-- ----------------------------
DROP TABLE IF EXISTS `aibdai_sms_record`;
CREATE TABLE `aibdai_sms_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) DEFAULT NULL,
  `type` tinyint(5) unsigned DEFAULT NULL COMMENT '1注册，2找回密码，3登录',
  `code` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '1成功，0失败',
  `send_date` int(11) DEFAULT NULL,
  `send_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aibdai_sms_record
-- ----------------------------

-- ----------------------------
-- Table structure for aibdai_theme
-- ----------------------------
DROP TABLE IF EXISTS `aibdai_theme`;
CREATE TABLE `aibdai_theme` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '主题',
  `msg` varchar(255) NOT NULL COMMENT '题目介绍',
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aibdai_theme
-- ----------------------------
INSERT INTO `aibdai_theme` VALUES ('8', '123123', '12312312', '1462847864');
INSERT INTO `aibdai_theme` VALUES ('9', '你好', '12123', '1462850763');
INSERT INTO `aibdai_theme` VALUES ('10', '123123123', '12123123', '1462850774');
INSERT INTO `aibdai_theme` VALUES ('11', '123123123', '123123123', '1462873135');
INSERT INTO `aibdai_theme` VALUES ('12', '123123123', '123123123', '1462873180');
INSERT INTO `aibdai_theme` VALUES ('13', '123123123', '123123123', '1462873193');

-- ----------------------------
-- Table structure for aibdai_user
-- ----------------------------
DROP TABLE IF EXISTS `aibdai_user`;
CREATE TABLE `aibdai_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` bigint(11) DEFAULT NULL COMMENT '手机号',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `sex` int(2) NOT NULL DEFAULT '1' COMMENT '性别 1：男  2：女',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `password` char(32) DEFAULT NULL COMMENT '密码',
  `last_login_time` int(11) NOT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '上次登录ip',
  `login_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `login_type` tinyint(1) NOT NULL COMMENT '登录类型，1,web  2,android   3,ios',
  `login_session` varchar(255) NOT NULL COMMENT '登录状态唯一标识',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '帐号状态，1正常，0禁用',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_2` (`mobile`) USING BTREE,
  UNIQUE KEY `email_2` (`email`) USING BTREE,
  KEY `status` (`status`),
  KEY `mobile` (`mobile`,`password`) USING BTREE,
  KEY `email` (`email`,`password`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aibdai_user
-- ----------------------------
INSERT INTO `aibdai_user` VALUES ('1', '13121126169', 'hello', '1', null, 'e10adc3949ba59abbe56e057f20f883e', '1463220959', '127.0.0.1', '209', '1', 'sess_5736f364f051c', '1', '1453861845', '1453861845');
INSERT INTO `aibdai_user` VALUES ('2', '13121126168', '', '0', null, 'e10adc3949ba59abbe56e057f20f883e', '1454211370', '192.168.1.188', '33', '1', '', '1', '1453861845', '1453861845');
INSERT INTO `aibdai_user` VALUES ('29', null, '', '0', null, null, '1454210648', '192.168.1.188', '19', '1', 'sess_56ad7e587dc9a', '1', '1454210123', '1454210123');
INSERT INTO `aibdai_user` VALUES ('30', null, '', '0', null, null, '1454210689', '192.168.1.188', '1', '1', 'sess_56ad7e8117ffb', '1', '1454210689', '1454210689');
INSERT INTO `aibdai_user` VALUES ('31', null, '', '0', null, null, '1454210828', '192.168.1.188', '2', '1', 'sess_56ad7f0c5e536', '1', '1454210773', '1454210773');
INSERT INTO `aibdai_user` VALUES ('32', null, '', '0', null, null, '1454210875', '192.168.1.188', '2', '1', 'sess_56ad7f3bc2ccb', '1', '1454210834', '1454210834');
INSERT INTO `aibdai_user` VALUES ('33', null, '', '0', null, null, '1454210880', '192.168.1.188', '1', '1', 'sess_56ad7f407d09f', '1', '1454210880', '1454210880');
INSERT INTO `aibdai_user` VALUES ('34', null, '', '0', null, null, '0', '', '0', '0', '', '1', '1454210904', '1454210904');
INSERT INTO `aibdai_user` VALUES ('35', null, '', '0', null, null, '0', '', '0', '0', '', '1', '1454210914', '1454210914');
INSERT INTO `aibdai_user` VALUES ('36', null, '', '0', null, null, '0', '', '0', '0', '', '1', '1454210921', '1454210921');
INSERT INTO `aibdai_user` VALUES ('37', null, '', '0', null, null, '0', '', '0', '0', '', '1', '1454211026', '1454211026');
INSERT INTO `aibdai_user` VALUES ('38', null, '', '0', null, null, '0', '', '0', '0', '', '1', '1454211067', '1454211067');
INSERT INTO `aibdai_user` VALUES ('39', null, '', '0', null, null, '1454211107', '192.168.1.188', '8', '1', 'sess_56ad802324f66', '1', '1454211100', '1454211100');
INSERT INTO `aibdai_user` VALUES ('40', null, '', '0', null, null, '1454211118', '192.168.1.188', '2', '1', 'sess_56ad802ed07d7', '1', '1454211110', '1454211110');
INSERT INTO `aibdai_user` VALUES ('41', null, '', '0', null, null, '1454294268', '192.168.1.188', '3', '1', 'sess_56aec4fcbce56', '1', '1454211133', '1454211133');
INSERT INTO `aibdai_user` VALUES ('42', '13121126167', '', '0', null, 'e10adc3949ba59abbe56e057f20f883e', '1462785144', '127.0.0.1', '12', '1', 'sess_573054784795e', '1', '1454211378', '1454211378');
INSERT INTO `aibdai_user` VALUES ('43', '13121126166', '', '0', null, null, '1454314830', '192.168.1.188', '32', '1', 'sess_56af154e8ac3a', '1', '1454211668', '1454211668');
INSERT INTO `aibdai_user` VALUES ('44', null, '', '0', null, null, '1454294762', '192.168.1.188', '20', '1', 'sess_56aec6eb013a6', '1', '1454212125', '1454212125');
INSERT INTO `aibdai_user` VALUES ('45', null, '', '0', null, null, '1454217601', '192.168.1.2', '1', '2', 'sess_56ad9981cfae8', '1', '1454217601', '1454217601');
INSERT INTO `aibdai_user` VALUES ('46', '13121126111', '', '0', null, null, '1454295082', '192.168.1.188', '2', '1', 'sess_56aec82ae4f41', '1', '1454294977', '1454294977');
INSERT INTO `aibdai_user` VALUES ('47', '18518205592', '', '0', null, null, '1456826345', '192.168.1.3', '167', '3', 'sess_56d567e909698', '1', '1454311964', '1454311964');
INSERT INTO `aibdai_user` VALUES ('48', '15645326598', '', '0', null, null, '1454400747', '192.168.1.2', '12', '2', 'sess_56b064ec01f35', '1', '1454318435', '1454318435');
INSERT INTO `aibdai_user` VALUES ('49', '18317770650', '', '0', null, null, '1459263997', '192.168.1.3', '172', '2', 'sess_56fa99fd71b9c', '1', '1454394307', '1454394307');
INSERT INTO `aibdai_user` VALUES ('50', '15689745689', '', '0', null, null, '1454394499', '192.168.1.2', '1', '2', 'sess_56b04c838bb0f', '1', '1454394499', '1454394499');
INSERT INTO `aibdai_user` VALUES ('51', null, '', '0', null, null, '1454395024', '192.168.1.2', '1', '3', 'sess_56b04e90691f2', '1', '1454395024', '1454395024');
INSERT INTO `aibdai_user` VALUES ('52', '18653265896', '', '0', null, null, '1454395794', '192.168.1.2', '1', '2', 'sess_56b05192823b9', '1', '1454395794', '1454395794');
INSERT INTO `aibdai_user` VALUES ('53', '18653215478', '', '0', null, null, '1454396008', '192.168.1.2', '2', '2', 'sess_56b05268e48a3', '1', '1454395934', '1454395934');
INSERT INTO `aibdai_user` VALUES ('54', '18532654125', '', '0', null, null, '1454396426', '192.168.1.2', '1', '2', 'sess_56b0540a1392e', '1', '1454396426', '1454396426');
INSERT INTO `aibdai_user` VALUES ('55', '18652356487', '', '0', null, null, '1454396564', '192.168.1.2', '1', '2', 'sess_56b0549471d93', '1', '1454396564', '1454396564');
INSERT INTO `aibdai_user` VALUES ('56', '18656589652', '', '0', null, null, '1454396989', '192.168.1.2', '1', '2', 'sess_56b0563d50d95', '1', '1454396989', '1454396989');
INSERT INTO `aibdai_user` VALUES ('57', null, '', '0', null, null, '1456410630', '192.168.1.3', '2', '3', '', '1', '1454462800', '1454462800');
INSERT INTO `aibdai_user` VALUES ('58', '15658656231', '', '0', null, null, '1454501451', '192.168.1.2', '1', '2', 'sess_56b1ee4b7ab3e', '1', '1454501451', '1454501451');
INSERT INTO `aibdai_user` VALUES ('59', '18310627080', '', '0', null, null, '1454501679', '192.168.1.2', '1', '2', 'sess_56b1ef2f8d8af', '1', '1454501679', '1454501679');
INSERT INTO `aibdai_user` VALUES ('60', '18536236541', '', '0', null, null, '1454592480', '192.168.1.2', '1', '2', '', '1', '1454592480', '1454592480');
INSERT INTO `aibdai_user` VALUES ('61', '13240382024', '', '0', null, null, '1456243376', '192.168.1.3', '7', '2', 'sess_56cc82b0ab795', '1', '1454688970', '1454688970');
INSERT INTO `aibdai_user` VALUES ('62', '18317770659', '', '0', null, null, '1454689240', '192.168.1.2', '1', '2', '', '1', '1454689240', '1454689240');
INSERT INTO `aibdai_user` VALUES ('63', '18356235689', '', '0', null, null, '1454689437', '192.168.1.2', '1', '2', '', '1', '1454689437', '1454689437');
INSERT INTO `aibdai_user` VALUES ('64', '15686532456', '', '0', null, null, '1454689621', '192.168.1.2', '1', '2', '', '1', '1454689621', '1454689621');
INSERT INTO `aibdai_user` VALUES ('65', '15685236586', '', '0', null, null, '1454689704', '192.168.1.2', '1', '2', '', '1', '1454689704', '1454689704');
INSERT INTO `aibdai_user` VALUES ('66', '15623568945', '', '0', null, null, '1456848355', '192.168.1.3', '4', '2', 'sess_56d5bde39f570', '1', '1454690032', '1454690032');
INSERT INTO `aibdai_user` VALUES ('67', '15623568752', '', '0', null, null, '1454690464', '192.168.1.2', '1', '2', '', '1', '1454690464', '1454690464');
INSERT INTO `aibdai_user` VALUES ('68', '15326896235', '', '0', null, null, '1454690543', '192.168.1.2', '1', '2', '', '1', '1454690543', '1454690543');
INSERT INTO `aibdai_user` VALUES ('69', '14789562316', '', '0', null, null, '1454690569', '192.168.1.2', '1', '2', '', '1', '1454690569', '1454690569');
INSERT INTO `aibdai_user` VALUES ('70', '15632689653', '', '0', null, null, '1454690827', '192.168.1.2', '1', '2', '', '1', '1454690827', '1454690827');
INSERT INTO `aibdai_user` VALUES ('71', '15896532568', '', '0', null, null, '1454690900', '192.168.1.2', '1', '2', '', '1', '1454690900', '1454690900');
INSERT INTO `aibdai_user` VALUES ('72', '15963256897', '', '0', null, null, '1454690921', '192.168.1.2', '1', '2', '', '1', '1454690921', '1454690921');
INSERT INTO `aibdai_user` VALUES ('73', '15326985632', '', '0', null, null, '1454690970', '192.168.1.2', '1', '2', '', '1', '1454690970', '1454690970');
INSERT INTO `aibdai_user` VALUES ('74', '15965321452', '', '0', null, null, '1454691014', '192.168.1.2', '1', '2', '', '1', '1454691014', '1454691014');
INSERT INTO `aibdai_user` VALUES ('75', '15896532157', '', '0', null, null, '1454691040', '192.168.1.2', '1', '2', '', '1', '1454691040', '1454691040');
INSERT INTO `aibdai_user` VALUES ('76', '15632896532', '', '0', null, null, '1454691051', '192.168.1.2', '1', '2', '', '1', '1454691051', '1454691051');
INSERT INTO `aibdai_user` VALUES ('77', '15623564789', '', '0', null, null, '1454691900', '192.168.1.2', '1', '2', '', '1', '1454691900', '1454691900');
INSERT INTO `aibdai_user` VALUES ('78', '18532658965', '', '0', null, null, '1454692038', '192.168.1.2', '1', '2', '', '1', '1454692038', '1454692038');
INSERT INTO `aibdai_user` VALUES ('79', '15623568952', '', '0', null, null, '1454692352', '192.168.1.2', '1', '2', '', '1', '1454692352', '1454692352');
INSERT INTO `aibdai_user` VALUES ('80', '17895623145', '', '0', null, null, '1454692374', '192.168.1.2', '1', '2', '', '1', '1454692374', '1454692374');
INSERT INTO `aibdai_user` VALUES ('81', '13568956235', '', '0', null, null, '1454692807', '192.168.1.2', '1', '2', '', '1', '1454692807', '1454692807');
INSERT INTO `aibdai_user` VALUES ('82', '15632865387', '', '0', null, null, '1454693232', '192.168.1.2', '2', '2', 'sess_56b4db706cc96', '1', '1454692910', '1454692910');
INSERT INTO `aibdai_user` VALUES ('83', '15689456231', '', '0', null, null, '1455618486', '192.168.1.3', '1', '2', '', '1', '1455618486', '1455618486');
INSERT INTO `aibdai_user` VALUES ('84', '15368965235', '', '0', null, null, '1455787564', '192.168.1.3', '1', '2', '', '1', '1455787564', '1455787564');
INSERT INTO `aibdai_user` VALUES ('85', '13811463001', '', '0', null, null, '1456764333', '192.168.1.3', '4', '2', '', '1', '1455789006', '1455789006');
INSERT INTO `aibdai_user` VALUES ('86', '13811111111', '', '0', null, null, '1455790176', '192.168.1.3', '1', '2', '', '1', '1455790176', '1455790176');
INSERT INTO `aibdai_user` VALUES ('87', '13333333333', '', '0', null, null, '1456242521', '192.168.1.3', '6', '2', '', '1', '1455790228', '1455790228');
INSERT INTO `aibdai_user` VALUES ('88', '13888888888', '', '0', null, null, '1455790337', '192.168.1.3', '1', '2', '', '1', '1455790337', '1455790337');
INSERT INTO `aibdai_user` VALUES ('89', '15803831311', '', '0', null, null, '1456155428', '192.168.1.3', '4', '3', '', '1', '1455804300', '1455804300');
INSERT INTO `aibdai_user` VALUES ('90', '13837830453', '', '0', null, null, '1455804537', '192.168.1.3', '1', '3', '', '1', '1455804537', '1455804537');
INSERT INTO `aibdai_user` VALUES ('91', '15803831111', '', '0', null, null, '1455805112', '192.168.1.3', '1', '3', 'sess_56c5d2b83885a', '1', '1455805112', '1455805112');
INSERT INTO `aibdai_user` VALUES ('92', null, '', '0', null, null, '1455805112', '', '0', '0', '', '1', '0', '0');
INSERT INTO `aibdai_user` VALUES ('93', null, '', '0', null, null, '1455805112', '', '0', '0', '', '1', '0', '0');
INSERT INTO `aibdai_user` VALUES ('94', '15689561234', '', '0', null, null, '1455880360', '192.168.1.3', '2', '2', 'sess_56c6f8a89e21d', '1', '1455875368', '1455875368');
INSERT INTO `aibdai_user` VALUES ('95', '13344444444', '', '0', null, null, '1456153183', '192.168.1.3', '3', '2', '', '1', '1456152133', '1456152133');
INSERT INTO `aibdai_user` VALUES ('96', '13355555555', '', '0', null, null, '1456152170', '192.168.1.3', '1', '2', '', '1', '1456152170', '1456152170');
INSERT INTO `aibdai_user` VALUES ('97', '13666666666', '', '0', null, null, '1456153207', '192.168.1.3', '1', '2', '', '1', '1456153207', '1456153207');
INSERT INTO `aibdai_user` VALUES ('98', '13444444444', '', '0', null, null, '1456155570', '192.168.1.3', '2', '3', '', '1', '1456155382', '1456155382');
INSERT INTO `aibdai_user` VALUES ('99', '15802221211', '', '0', null, null, '1456238962', '192.168.1.3', '1', '3', '', '1', '1456238962', '1456238962');
INSERT INTO `aibdai_user` VALUES ('100', '15545668886', '', '0', null, null, '1456242762', '192.168.1.3', '1', '2', '', '1', '1456242762', '1456242762');
INSERT INTO `aibdai_user` VALUES ('101', '15869568653', '', '0', null, null, '1456242862', '192.168.1.3', '1', '2', '', '1', '1456242862', '1456242862');
INSERT INTO `aibdai_user` VALUES ('102', null, '', '0', null, null, '1456766008', '192.168.1.3', '1', '1', 'sess_56d47c38b54a9', '1', '1456766008', '1456766008');
INSERT INTO `aibdai_user` VALUES ('103', '15689562356', '', '0', null, null, '1456768091', '192.168.1.3', '1', '2', '', '1', '1456768091', '1456768091');
INSERT INTO `aibdai_user` VALUES ('104', '15635689655', '', '0', null, null, '1456768435', '192.168.1.3', '1', '2', '', '1', '1456768435', '1456768435');
INSERT INTO `aibdai_user` VALUES ('105', '18356566552', '', '0', null, null, '1456823533', '192.168.1.3', '1', '2', '', '1', '1456823533', '1456823533');
INSERT INTO `aibdai_user` VALUES ('106', '15368965324', '', '0', null, null, '1456823775', '192.168.1.3', '1', '2', 'sess_56d55ddf7c55f', '1', '1456823775', '1456823775');
INSERT INTO `aibdai_user` VALUES ('107', null, '', '0', null, null, '1457013661', '192.168.1.3', '1', '1', 'sess_56d8439e06fec', '1', '1457013661', '1457013661');
INSERT INTO `aibdai_user` VALUES ('108', '15623456897', '', '0', null, null, '1457446886', '192.168.1.3', '1', '1', 'sess_56dedfe6a8d58', '1', '1457446886', '1457446886');
INSERT INTO `aibdai_user` VALUES ('109', null, '', '0', null, null, '1457447379', '192.168.1.21', '1', '1', 'sess_56dee1d417c69', '1', '1457447379', '1457447379');
INSERT INTO `aibdai_user` VALUES ('110', '18656231456', '', '0', null, null, '1457453173', '192.168.1.3', '3', '1', 'sess_56def875e812f', '1', '1457453089', '1457453089');

-- ----------------------------
-- Table structure for aibdai_user_info
-- ----------------------------
DROP TABLE IF EXISTS `aibdai_user_info`;
CREATE TABLE `aibdai_user_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `nickname` varchar(255) DEFAULT NULL COMMENT '用户昵称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aibdai_user_info
-- ----------------------------
INSERT INTO `aibdai_user_info` VALUES ('26', '29', '哈哈');
INSERT INTO `aibdai_user_info` VALUES ('27', '30', '哈哈');
INSERT INTO `aibdai_user_info` VALUES ('28', '31', '哈哈');
INSERT INTO `aibdai_user_info` VALUES ('29', '32', '哈哈');
INSERT INTO `aibdai_user_info` VALUES ('30', '33', '哈哈');
INSERT INTO `aibdai_user_info` VALUES ('31', '39', '哈哈');
INSERT INTO `aibdai_user_info` VALUES ('32', '40', '哈哈');
INSERT INTO `aibdai_user_info` VALUES ('33', '41', '哈哈');
INSERT INTO `aibdai_user_info` VALUES ('34', '1', 'nickname');
INSERT INTO `aibdai_user_info` VALUES ('35', '44', null);
INSERT INTO `aibdai_user_info` VALUES ('36', '45', null);
INSERT INTO `aibdai_user_info` VALUES ('37', '46', '13121126111');
INSERT INTO `aibdai_user_info` VALUES ('38', '47', '18518205592');
INSERT INTO `aibdai_user_info` VALUES ('39', '48', '15645326598');
INSERT INTO `aibdai_user_info` VALUES ('40', '49', '18317770650');
INSERT INTO `aibdai_user_info` VALUES ('41', '50', '15689745689');
INSERT INTO `aibdai_user_info` VALUES ('42', '51', '爱布袋QQ登录');
INSERT INTO `aibdai_user_info` VALUES ('43', '52', '18653265896');
INSERT INTO `aibdai_user_info` VALUES ('44', '53', '18653215478');
INSERT INTO `aibdai_user_info` VALUES ('45', '54', '18532654125');
INSERT INTO `aibdai_user_info` VALUES ('46', '55', '18652356487');
INSERT INTO `aibdai_user_info` VALUES ('47', '56', '18656589652');
INSERT INTO `aibdai_user_info` VALUES ('48', '57', '爱布袋QQ登录');
INSERT INTO `aibdai_user_info` VALUES ('49', '58', '15658656231');
INSERT INTO `aibdai_user_info` VALUES ('50', '59', '18310627080');
INSERT INTO `aibdai_user_info` VALUES ('51', '60', '18536236541');
INSERT INTO `aibdai_user_info` VALUES ('52', '61', '13240382024');
INSERT INTO `aibdai_user_info` VALUES ('53', '62', '18317770659');
INSERT INTO `aibdai_user_info` VALUES ('54', '63', '18356235689');
INSERT INTO `aibdai_user_info` VALUES ('55', '64', '15686532456');
INSERT INTO `aibdai_user_info` VALUES ('56', '65', '15685236586');
INSERT INTO `aibdai_user_info` VALUES ('57', '66', '15623568945');
INSERT INTO `aibdai_user_info` VALUES ('58', '67', '15623568752');
INSERT INTO `aibdai_user_info` VALUES ('59', '68', '15326896235');
INSERT INTO `aibdai_user_info` VALUES ('60', '69', '14789562316');
INSERT INTO `aibdai_user_info` VALUES ('61', '70', '15632689653');
INSERT INTO `aibdai_user_info` VALUES ('62', '71', '15896532568');
INSERT INTO `aibdai_user_info` VALUES ('63', '72', '15963256897');
INSERT INTO `aibdai_user_info` VALUES ('64', '73', '15326985632');
INSERT INTO `aibdai_user_info` VALUES ('65', '74', '15965321452');
INSERT INTO `aibdai_user_info` VALUES ('66', '75', '15896532157');
INSERT INTO `aibdai_user_info` VALUES ('67', '76', '15632896532');
INSERT INTO `aibdai_user_info` VALUES ('68', '77', '15623564789');
INSERT INTO `aibdai_user_info` VALUES ('69', '78', '18532658965');
INSERT INTO `aibdai_user_info` VALUES ('70', '79', '15623568952');
INSERT INTO `aibdai_user_info` VALUES ('71', '80', '17895623145');
INSERT INTO `aibdai_user_info` VALUES ('72', '81', '13568956235');
INSERT INTO `aibdai_user_info` VALUES ('73', '82', '15632865387');
INSERT INTO `aibdai_user_info` VALUES ('74', '83', '15689456231');
INSERT INTO `aibdai_user_info` VALUES ('75', '84', '15368965235');
INSERT INTO `aibdai_user_info` VALUES ('76', '85', '13811463001');
INSERT INTO `aibdai_user_info` VALUES ('77', '86', '13811111111');
INSERT INTO `aibdai_user_info` VALUES ('78', '87', '13333333333');
INSERT INTO `aibdai_user_info` VALUES ('79', '88', '13888888888');
INSERT INTO `aibdai_user_info` VALUES ('80', '89', '15803831311');
INSERT INTO `aibdai_user_info` VALUES ('81', '90', '13837830453');
INSERT INTO `aibdai_user_info` VALUES ('82', '91', '15803831111');
INSERT INTO `aibdai_user_info` VALUES ('83', '94', '15689561234');
INSERT INTO `aibdai_user_info` VALUES ('84', '95', '13344444444');
INSERT INTO `aibdai_user_info` VALUES ('85', '96', '13355555555');
INSERT INTO `aibdai_user_info` VALUES ('86', '97', '13666666666');
INSERT INTO `aibdai_user_info` VALUES ('87', '98', '13444444444');
INSERT INTO `aibdai_user_info` VALUES ('88', '0', 'sys');
INSERT INTO `aibdai_user_info` VALUES ('89', '99', '15802221211');
INSERT INTO `aibdai_user_info` VALUES ('90', '100', '15545668886');
INSERT INTO `aibdai_user_info` VALUES ('91', '101', '15869568653');
INSERT INTO `aibdai_user_info` VALUES ('92', '102', null);
INSERT INTO `aibdai_user_info` VALUES ('93', '103', '15689562356');
INSERT INTO `aibdai_user_info` VALUES ('94', '104', '15635689655');
INSERT INTO `aibdai_user_info` VALUES ('95', '105', '18356566552');
INSERT INTO `aibdai_user_info` VALUES ('96', '106', '15368965324');
INSERT INTO `aibdai_user_info` VALUES ('97', '107', 'xiaozhang');
INSERT INTO `aibdai_user_info` VALUES ('98', '108', '15623456897');
INSERT INTO `aibdai_user_info` VALUES ('99', '109', 'demo用户');
INSERT INTO `aibdai_user_info` VALUES ('100', '110', '18656231456');
INSERT INTO `aibdai_user_info` VALUES ('101', '111', '123456');
INSERT INTO `aibdai_user_info` VALUES ('102', '112', '123456');
INSERT INTO `aibdai_user_info` VALUES ('103', '113', '123456');

-- ----------------------------
-- Table structure for aibdai_user_org
-- ----------------------------
DROP TABLE IF EXISTS `aibdai_user_org`;
CREATE TABLE `aibdai_user_org` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `org_type` tinyint(2) unsigned NOT NULL COMMENT '第三方登录类型',
  `access_token` varchar(255) NOT NULL COMMENT '登录返回token',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `org_type` (`org_type`,`access_token`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aibdai_user_org
-- ----------------------------
INSERT INTO `aibdai_user_org` VALUES ('26', '29', '1', '2');
INSERT INTO `aibdai_user_org` VALUES ('27', '30', '1', '3');
INSERT INTO `aibdai_user_org` VALUES ('28', '31', '1', '4');
INSERT INTO `aibdai_user_org` VALUES ('29', '32', '1', '5');
INSERT INTO `aibdai_user_org` VALUES ('30', '33', '1', '6');
INSERT INTO `aibdai_user_org` VALUES ('31', '39', '1', '10');
INSERT INTO `aibdai_user_org` VALUES ('32', '40', '1', '11');
INSERT INTO `aibdai_user_org` VALUES ('33', '41', '1', '12');
INSERT INTO `aibdai_user_org` VALUES ('34', '44', '1', '123');
INSERT INTO `aibdai_user_org` VALUES ('35', '45', '2', '123');
INSERT INTO `aibdai_user_org` VALUES ('36', '51', '1', 'BF8F47629A20CDF492A5270A1E074CE');
INSERT INTO `aibdai_user_org` VALUES ('37', '57', '1', 'BF8F47629A20CDF492A5270A1E074CEB');
INSERT INTO `aibdai_user_org` VALUES ('38', '102', '1', 'fjadskf');
INSERT INTO `aibdai_user_org` VALUES ('39', '107', '2', 'fjiasdjf');
INSERT INTO `aibdai_user_org` VALUES ('40', '109', '1', 'token');
