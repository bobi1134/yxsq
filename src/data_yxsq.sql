/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80001
Source Host           : localhost:3306
Source Database       : data_yxsq

Target Server Type    : MYSQL
Target Server Version : 80001
File Encoding         : 65001

Date: 2017-07-21 21:11:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for agsq
-- ----------------------------
DROP TABLE IF EXISTS `agsq`;
CREATE TABLE `agsq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agsq_name` varchar(10) DEFAULT NULL,
  `userId` int(20) DEFAULT NULL,
  `add_Time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_agsq_user` (`userId`),
  CONSTRAINT `fk_agsq_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agsq
-- ----------------------------
INSERT INTO `agsq` VALUES ('1', '四川农业大学', '2', '2015-06-01 18:45:28');
INSERT INTO `agsq` VALUES ('2', '四川大学', '2', '2015-05-06 18:45:30');
INSERT INTO `agsq` VALUES ('4', '电子科技大学', '2', '2015-05-20 18:45:34');
INSERT INTO `agsq` VALUES ('5', '北京大学', '2', '2015-05-21 18:45:38');
INSERT INTO `agsq` VALUES ('6', '四川农业大学', '27', '2015-05-18 18:45:43');
INSERT INTO `agsq` VALUES ('7', '四川大学', '27', '2015-05-26 18:45:46');
INSERT INTO `agsq` VALUES ('8', '四川理工学院', '27', '2015-04-14 18:45:50');
INSERT INTO `agsq` VALUES ('9', '宜宾学院', '27', '2015-05-13 18:45:53');
INSERT INTO `agsq` VALUES ('10', '北京大学', '27', '2015-06-01 18:49:53');
INSERT INTO `agsq` VALUES ('11', '四川农业大学', '3', '2015-06-02 09:31:49');

-- ----------------------------
-- Table structure for bb
-- ----------------------------
DROP TABLE IF EXISTS `bb`;
CREATE TABLE `bb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bb_content` varchar(100) DEFAULT NULL,
  `bb_user` varchar(30) DEFAULT NULL,
  `bb_time` datetime DEFAULT NULL,
  `sqId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sqId` (`sqId`),
  CONSTRAINT `bb_ibfk_1` FOREIGN KEY (`sqId`) REFERENCES `sq` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bb
-- ----------------------------
INSERT INTO `bb` VALUES ('3', '有时候，两个人之间的感情，真的就好像化学课里讲过的硝酸--越浓越容易分解。\n						\n			', '测试账号__2', '2015-06-02 00:06:27', '1');
INSERT INTO `bb` VALUES ('4', '那谁谁 你站住 我要跟你表白！！！', '测试账号__2', '2015-06-02 00:06:48', '1');
INSERT INTO `bb` VALUES ('5', '计算机1班的某位帅哥 伦家好喜欢你', '测试账号__1', '2015-06-02 00:07:24', '1');
INSERT INTO `bb` VALUES ('6', '有一种爱可以地久天长，有一种情可以地老天荒，有一个人会和你长长久久，陪你看朝霞晨露。\n						\n			', '测试账号__3', '2015-06-02 00:08:03', '1');
INSERT INTO `bb` VALUES ('7', '<div>你是一位童话里的仙女，给了我生活</div><div><br></div><div>的芳香，给了我生命的春天。</div>', '测试账号__3', '2015-06-02 00:08:15', '1');
INSERT INTO `bb` VALUES ('8', '拟把疏狂图一醉对酒当歌强乐还无味衣带渐宽终不悔为伊消得人憔悴\n						\n			', '测试账号__4', '2015-06-02 00:08:51', '1');
INSERT INTO `bb` VALUES ('9', '我这辈子最大的幸运就是认识你，而最大的不幸却是不能拥有你。也许你会遇到你深爱的人，可是却不会遇到第二人像我这么爱你的人。', '测试账号__4', '2015-06-02 00:09:06', '1');
INSERT INTO `bb` VALUES ('10', '看你们都表白 那我也来表哈白~~~~', '测试账号__5', '2015-06-02 00:09:35', '1');
INSERT INTO `bb` VALUES ('11', '遇上一个人要一分钟的时间，喜欢一个人只需一小时的时间，爱上一个人要一天的时间，可要我忘记你却要用上一生的时间。', '测试账号__5', '2015-06-02 00:09:56', '1');
INSERT INTO `bb` VALUES ('12', '一句平淡的话：知不知道，你很重要。\n						\n			', '测试账号__6', '2015-06-02 00:10:25', '1');
INSERT INTO `bb` VALUES ('13', '喜欢你怎么了 来咬我啊~~ 呼呼', '测试账号__6', '2015-06-02 00:11:04', '1');
INSERT INTO `bb` VALUES ('14', 'O(∩_∩)O哈哈~\n						\n			', '测试账号__6', '2015-06-02 00:11:19', '1');
INSERT INTO `bb` VALUES ('15', '\n						\n			', '测试账号__6', '2015-06-02 09:05:57', '1');
INSERT INTO `bb` VALUES ('16', '我啊的加菲猫空三等奖', '测试账号__6', '2015-06-02 09:06:10', '1');
INSERT INTO `bb` VALUES ('17', '\n						\n			', '测试账号__6', '2015-06-02 09:06:15', '1');
INSERT INTO `bb` VALUES ('18', '东方红is', '测试账号__6', '2015-06-02 09:06:20', '1');
INSERT INTO `bb` VALUES ('19', '我是慢羊羊 ~~~ 我喜欢那只羊~~~', '测试账号__7', '2015-06-08 23:20:23', '1');
INSERT INTO `bb` VALUES ('20', '灰太狼不要和我抢哈~~~~', '测试账号__7', '2015-06-08 23:20:51', '1');
INSERT INTO `bb` VALUES ('21', '\n						\n			', 'Nothing', '2017-01-14 22:43:31', '11');
INSERT INTO `bb` VALUES ('22', 'nn', 'Nothing', '2017-01-14 22:43:38', '11');
INSERT INTO `bb` VALUES ('23', null, null, '2017-01-15 12:29:08', null);
INSERT INTO `bb` VALUES ('24', null, null, '2017-01-15 12:29:08', null);
INSERT INTO `bb` VALUES ('25', null, null, '2017-01-15 12:29:08', null);
INSERT INTO `bb` VALUES ('26', null, null, '2017-01-15 12:29:08', null);
INSERT INTO `bb` VALUES ('27', '\n					mmd	\n			', 'Nothing', '2017-05-23 11:17:54', '9');
INSERT INTO `bb` VALUES ('28', 'fsdafsd', 'Nothing', '2017-05-23 11:17:57', '9');

-- ----------------------------
-- Table structure for gzsq
-- ----------------------------
DROP TABLE IF EXISTS `gzsq`;
CREATE TABLE `gzsq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gzsq_name` varchar(10) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `gzsq_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gzsq
-- ----------------------------
INSERT INTO `gzsq` VALUES ('1', '四川农业大学', '2');
INSERT INTO `gzsq` VALUES ('2', '四川大学', '2');
INSERT INTO `gzsq` VALUES ('3', '内江师范学院', '2');

-- ----------------------------
-- Table structure for imgs
-- ----------------------------
DROP TABLE IF EXISTS `imgs`;
CREATE TABLE `imgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_src` varchar(100) DEFAULT NULL,
  `img_href` varchar(100) DEFAULT NULL,
  `img_title` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgs
-- ----------------------------
INSERT INTO `imgs` VALUES ('1', 'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7qdas5j0j30jg0wen02.jpg', 'yxsq/tz/selectAllRemark.action?tzId=3&sqId=1', '如果最后能在一起，晚点真的无所谓如果最后能在一起，晚点真的无所谓', '1');
INSERT INTO `imgs` VALUES ('2', 'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg', 'yxsq/tz/selectAllRemark.action?tzId=37&sqId=33', '欢迎来到本社区，你可以在这里畅所欲言！', '1');
INSERT INTO `imgs` VALUES ('3', 'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg', 'yxsq/tz/selectAllRemark.action?tzId=21&sqId=17', '欢迎来到本社区，你可以在这里畅所欲言！', '1');
INSERT INTO `imgs` VALUES ('4', 'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg', 'yxsq/tz/selectAllRemark.action?tzId=6&sqId=6', '欢迎来到本社区，你可以在这里畅所欲言！', '1');
INSERT INTO `imgs` VALUES ('5', '5.jpg', null, null, '1');
INSERT INTO `imgs` VALUES ('6', '1.jpg', null, '背景1', '2');
INSERT INTO `imgs` VALUES ('7', '2.jpg', null, '背景2', '2');
INSERT INTO `imgs` VALUES ('8', '3.jpg', null, '背景3', '2');
INSERT INTO `imgs` VALUES ('9', '4.jpg', null, '背景4', '2');
INSERT INTO `imgs` VALUES ('10', '5.jpg', null, '背景5', '2');
INSERT INTO `imgs` VALUES ('11', '6.jpg', null, '背景6', '2');
INSERT INTO `imgs` VALUES ('12', '1.jpg', null, '廊桥叶梦-2', '3');
INSERT INTO `imgs` VALUES ('13', '2.jpg', null, '接天莲叶', '3');
INSERT INTO `imgs` VALUES ('14', '3.jpg', null, '雪山日出', '3');
INSERT INTO `imgs` VALUES ('15', '4.jpg', null, '原野程曦', '3');
INSERT INTO `imgs` VALUES ('16', '5.jpg', null, '三叶草', '3');
INSERT INTO `imgs` VALUES ('17', '6.jpg', null, '层林尽染', '3');
INSERT INTO `imgs` VALUES ('18', '7.jpg', null, '水墨荷花', '3');
INSERT INTO `imgs` VALUES ('19', '8.jpg', null, '海上乐园', '3');
INSERT INTO `imgs` VALUES ('20', '9.jpg', null, '美丽孤岛', '3');
INSERT INTO `imgs` VALUES ('21', '10.jpg', null, '苏州园林', '3');
INSERT INTO `imgs` VALUES ('22', '11.jpg', null, '水上乐园', '3');
INSERT INTO `imgs` VALUES ('23', '12.jpg', null, '水底世界', '3');

-- ----------------------------
-- Table structure for lch_remark
-- ----------------------------
DROP TABLE IF EXISTS `lch_remark`;
CREATE TABLE `lch_remark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lch_remark_content` varchar(999) DEFAULT NULL,
  `lch_remark_time` datetime DEFAULT NULL,
  `tz_remarkId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tz_remarkId` (`tz_remarkId`),
  KEY `userId` (`userId`),
  CONSTRAINT `lch_remark_ibfk_1` FOREIGN KEY (`tz_remarkId`) REFERENCES `tz_remark` (`id`),
  CONSTRAINT `lch_remark_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lch_remark
-- ----------------------------
INSERT INTO `lch_remark` VALUES ('151', '第一眼好像认识多年的熟人~ ', '2015-05-24 18:57:50', '127', '2');
INSERT INTO `lch_remark` VALUES ('152', '回复 测试账号_2：当然 是我这样想而已~', '2015-05-24 18:58:30', '127', '2');
INSERT INTO `lch_remark` VALUES ('153', '所得对~~~', '2015-05-25 18:24:55', '128', '5');
INSERT INTO `lch_remark` VALUES ('154', '回复 测试账号_3：哈哈', '2015-05-25 18:25:00', '128', '5');
INSERT INTO `lch_remark` VALUES ('155', 'hdfhgdf', '2015-05-26 18:41:09', '129', '3');
INSERT INTO `lch_remark` VALUES ('156', '回复 测试账号_2：fdsfds', '2015-05-26 18:41:12', '129', '3');
INSERT INTO `lch_remark` VALUES ('157', '哈哈', '2015-05-28 23:37:09', '130', '5');
INSERT INTO `lch_remark` VALUES ('158', '你好', '2015-05-28 23:37:18', '130', '5');
INSERT INTO `lch_remark` VALUES ('159', '就是哈！', '2015-06-02 00:00:05', '132', '3');
INSERT INTO `lch_remark` VALUES ('160', '是吗？', '2015-06-02 00:00:12', '133', '3');
INSERT INTO `lch_remark` VALUES ('161', '靠法第四喝点水 ', '2015-06-02 08:59:52', '141', '25');
INSERT INTO `lch_remark` VALUES ('162', '听歌的    ', '2015-06-02 09:19:52', '139', '24');
INSERT INTO `lch_remark` VALUES ('163', '发送到发送到', '2015-06-02 09:28:30', '135', '5');
INSERT INTO `lch_remark` VALUES ('164', '发生地方 ', '2015-06-02 09:28:35', '136', '5');
INSERT INTO `lch_remark` VALUES ('165', '哈哈~~', '2015-06-08 23:07:05', '142', '27');
INSERT INTO `lch_remark` VALUES ('166', '回复 测试账号__8：你没~~~', '2015-06-08 23:08:12', '142', '26');
INSERT INTO `lch_remark` VALUES ('167', '村长水贴~~~~', '2015-06-08 23:15:52', '155', '25');
INSERT INTO `lch_remark` VALUES ('168', '回复 测试账号__6：你妹', '2015-06-08 23:16:20', '155', '26');
INSERT INTO `lch_remark` VALUES ('169', '88', '2016-11-24 20:37:16', '158', '38');
INSERT INTO `lch_remark` VALUES ('170', '赞一个', '2016-11-24 21:11:20', '132', '38');
INSERT INTO `lch_remark` VALUES ('171', '回复 Nothing：hhh', '2016-11-30 11:28:51', '127', '5');

-- ----------------------------
-- Table structure for prepare_sq
-- ----------------------------
DROP TABLE IF EXISTS `prepare_sq`;
CREATE TABLE `prepare_sq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sq_name` varchar(15) DEFAULT NULL,
  `sq_introduction` varchar(200) DEFAULT NULL,
  `sq_location` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prepare_sq
-- ----------------------------
INSERT INTO `prepare_sq` VALUES ('32', '天津大学', '天津大学的月下天地', '天津');
INSERT INTO `prepare_sq` VALUES ('33', '天津医科大学', '天津医科大学的月下天地', '天津');
INSERT INTO `prepare_sq` VALUES ('34', '天津中医药大学', '天津中医药大学的月下天地', '天津');
INSERT INTO `prepare_sq` VALUES ('35', '重庆大学', '重庆大学的月下天地', '重庆');
INSERT INTO `prepare_sq` VALUES ('36', '西南大学', '西南大学的月下天地', '重庆');
INSERT INTO `prepare_sq` VALUES ('37', '重庆理工大学', '重庆理工大学的月下天地', '重庆');
INSERT INTO `prepare_sq` VALUES ('38', '四川美术学院', '四川美术学院的月下天地', '重庆');
INSERT INTO `prepare_sq` VALUES ('39', '西南政法大学', '西南政法大学的月下天地', '重庆');
INSERT INTO `prepare_sq` VALUES ('40', '重庆医科大学', '重庆医科大学的月下天地', '重庆');
INSERT INTO `prepare_sq` VALUES ('41', '大连理工大学', '大连理工大学的月下天地', '辽宁');
INSERT INTO `prepare_sq` VALUES ('42', '东北大学', '东北大学的月下天地', '辽宁');
INSERT INTO `prepare_sq` VALUES ('43', '中国医科大学', '中国医科大学的月下天地', '辽宁');
INSERT INTO `prepare_sq` VALUES ('44', '鲁迅美术学院', '鲁迅美术学院的月下天地', '辽宁');
INSERT INTO `prepare_sq` VALUES ('45', '东北财经大学', '东北财经大学的月下天地', '辽宁');
INSERT INTO `prepare_sq` VALUES ('46', '大连海事大学', '大连海事大学的月下天地', '辽宁');
INSERT INTO `prepare_sq` VALUES ('47', '辽宁大学', '辽宁大学的月下天地', '辽宁');
INSERT INTO `prepare_sq` VALUES ('48', '河北大学', '河北大学的月下天地', '河北');
INSERT INTO `prepare_sq` VALUES ('49', '河北农业大学', '河北农业大学的月下天地', '河北');
INSERT INTO `prepare_sq` VALUES ('50', '燕山大学', '燕山大学的月下天地', '河北');
INSERT INTO `prepare_sq` VALUES ('51', '河北师范大学', '河北师范大学的月下天地', '河北');
INSERT INTO `prepare_sq` VALUES ('52', '华北理工大学', '华北理工大学的月下天地', '河北');
INSERT INTO `prepare_sq` VALUES ('53', '河北科技大学', '河北科技大学的月下天地', '河北');
INSERT INTO `prepare_sq` VALUES ('54', '河北北方学院', '河北北方学院的月下天地', '河北');
INSERT INTO `prepare_sq` VALUES ('55', '邯郸学院', '邯郸学院的月下天地', '河北');
INSERT INTO `prepare_sq` VALUES ('56', '郑州大学', '郑州大学的月下天地', '河南');
INSERT INTO `prepare_sq` VALUES ('57', '中原工学院', '中原工学院的月下天地', '河南');
INSERT INTO `prepare_sq` VALUES ('58', '河南大学', '河南大学的月下天地', '河南');
INSERT INTO `prepare_sq` VALUES ('59', '河南工业大学', '河南工业大学的月下天地', '河南');
INSERT INTO `prepare_sq` VALUES ('60', '河南理工大学', '河南理工大学的月下天地', '河南');
INSERT INTO `prepare_sq` VALUES ('61', '许昌学院', '许昌学院的月下天地', '河南');
INSERT INTO `prepare_sq` VALUES ('62', '中州大学', '中州大学的月下天地', '河南');
INSERT INTO `prepare_sq` VALUES ('63', '武汉大学', '武汉大学的月下天地', '湖北');
INSERT INTO `prepare_sq` VALUES ('64', '华中科技大学', '华中科技大学的月下天地', '湖北');
INSERT INTO `prepare_sq` VALUES ('65', '武汉理工大学', '武汉理工大学的月下天地', '湖北');
INSERT INTO `prepare_sq` VALUES ('66', '中国地质大学', '中国地质大学的月下天地', '湖北');
INSERT INTO `prepare_sq` VALUES ('67', '华中师范大学', '华中师范大学的月下天地', '湖北');
INSERT INTO `prepare_sq` VALUES ('68', '中南财经政法大学', '中南财经政法大学的月下天地', '湖北');
INSERT INTO `prepare_sq` VALUES ('69', '武汉纺织大学', '武汉纺织大学大学的月下天地', '湖北');
INSERT INTO `prepare_sq` VALUES ('70', '华中农业大学', '华中农业大学的月下天地', '湖北');
INSERT INTO `prepare_sq` VALUES ('71', '江汉大学', '江汉大学的月下天地', '湖北');
INSERT INTO `prepare_sq` VALUES ('72', '三峡大学', '三峡大学的月下天地', '湖北');
INSERT INTO `prepare_sq` VALUES ('73', '长江大学', '长江大学的月下天地', '湖北');
INSERT INTO `prepare_sq` VALUES ('74', '中南大学', '中南大学的月下天地', '湖南');
INSERT INTO `prepare_sq` VALUES ('75', '湖南大学', '湖南大学的月下天地', '湖南');
INSERT INTO `prepare_sq` VALUES ('76', '湘潭大学', '湘潭大学的月下天地', '湖南');
INSERT INTO `prepare_sq` VALUES ('77', '湖南师范大学', '湖南师范大学的月下天地', '湖南');
INSERT INTO `prepare_sq` VALUES ('78', '南华大学', '南华大学的月下天地', '湖南');
INSERT INTO `prepare_sq` VALUES ('79', '湖南科技大学', '湖南科技大学的月下天地', '湖南');
INSERT INTO `prepare_sq` VALUES ('80', '中南林业科技大学', '中南林业科技大学的月下天地', '湖南');
INSERT INTO `prepare_sq` VALUES ('81', '山东财经大学', '山东财经大学的月下天地', '山东');
INSERT INTO `prepare_sq` VALUES ('82', '山东大学', '山东大学的月下天地', '山东');
INSERT INTO `prepare_sq` VALUES ('83', '山东师范大学', '山东师范大学的月下天地', '山东');
INSERT INTO `prepare_sq` VALUES ('84', '济南大学', '济南大学的月下天地', '山东');
INSERT INTO `prepare_sq` VALUES ('85', '中国海洋大学', '中国海洋大学的月下天地', '山东');
INSERT INTO `prepare_sq` VALUES ('86', '青岛大学', '青岛大学的月下天地', '山东');
INSERT INTO `prepare_sq` VALUES ('87', '山东科技大学', '山东科技大学的月下天地', '山东');
INSERT INTO `prepare_sq` VALUES ('88', '青岛科技大学', '青岛科技大学的月下天地', '山东');
INSERT INTO `prepare_sq` VALUES ('89', '临沂大学', '临沂大学的月下天地', '山东');
INSERT INTO `prepare_sq` VALUES ('90', '中国石油大学', '中国石油大学的月下天地', '山东');
INSERT INTO `prepare_sq` VALUES ('91', '德州学院', '德州学院的月下天地', '山东');
INSERT INTO `prepare_sq` VALUES ('92', '曲阜师范大学', '曲阜师范大学的月下天地', '山东');
INSERT INTO `prepare_sq` VALUES ('93', '淄博职业学院', '淄博职业学院的月下天地', '山东');
INSERT INTO `prepare_sq` VALUES ('94', '中北大学', '中北大学的月下天地', '山西');
INSERT INTO `prepare_sq` VALUES ('95', '山西大学', '山西大学的月下天地', '山西');
INSERT INTO `prepare_sq` VALUES ('96', '太原理工大学', '太原理工大学的月下天地', '山西');
INSERT INTO `prepare_sq` VALUES ('97', '山西财经大学', '山西财经大学的月下天地', '山西');
INSERT INTO `prepare_sq` VALUES ('98', '山西工商学院', '山西工商学院的月下天地', '山西');
INSERT INTO `prepare_sq` VALUES ('99', '晋中学院', '晋中学院的月下天地', '山西');
INSERT INTO `prepare_sq` VALUES ('100', '吕梁学院', '吕梁学院的月下天地', '山西');
INSERT INTO `prepare_sq` VALUES ('101', '运城学院', '运城学院的月下天地', '山西');
INSERT INTO `prepare_sq` VALUES ('102', '西安交通大学', '西安交通大学的月下天地', '陕西');
INSERT INTO `prepare_sq` VALUES ('103', '西北工业大学', '西北工业大学的月下天地', '陕西');
INSERT INTO `prepare_sq` VALUES ('104', '西北大学', '西北大学的月下天地', '陕西');
INSERT INTO `prepare_sq` VALUES ('105', '陕西师范大学', '陕西师范大学的月下天地', '陕西');
INSERT INTO `prepare_sq` VALUES ('106', '西北农林科技大学', '西北农林科技大学的月下天地', '陕西');
INSERT INTO `prepare_sq` VALUES ('107', '合肥工业大学', '合肥工业大学的月下天地', '安徽');
INSERT INTO `prepare_sq` VALUES ('108', '安徽大学', '安徽大学的月下天地', '安徽');
INSERT INTO `prepare_sq` VALUES ('109', '安徽工程大学', '安徽工程大学的月下天地', '安徽');
INSERT INTO `prepare_sq` VALUES ('110', '安徽建筑大学', '安徽建筑大学的月下天地', '安徽');
INSERT INTO `prepare_sq` VALUES ('111', '安徽师范大学', '安徽师范大学的月下天地', '安徽');
INSERT INTO `prepare_sq` VALUES ('112', '安徽农业大学', '安徽农业大学的月下天地', '安徽');
INSERT INTO `prepare_sq` VALUES ('113', '铜陵学院', '铜陵学院的月下天地', '安徽');
INSERT INTO `prepare_sq` VALUES ('114', '黄山学院', '黄山学院的月下天地', '安徽');
INSERT INTO `prepare_sq` VALUES ('115', '中国科学技术大学', '中国科学技术大学的月下天地', '安徽');
INSERT INTO `prepare_sq` VALUES ('116', '合肥学院', '合肥学院的月下天地', '安徽');
INSERT INTO `prepare_sq` VALUES ('117', '巢湖学院', '巢湖学院的月下天地', '安徽');
INSERT INTO `prepare_sq` VALUES ('118', '淮南师范学院', '淮南师范学院的月下天地', '安徽');
INSERT INTO `prepare_sq` VALUES ('119', '安庆师范学院', '安庆师范学院的月下天地', '安徽');
INSERT INTO `prepare_sq` VALUES ('120', '宿州学院', '宿州学院的月下天地', '安徽');
INSERT INTO `prepare_sq` VALUES ('121', '皖南医学院', '皖南医学院的月下天地', '安徽');
INSERT INTO `prepare_sq` VALUES ('122', '浙江大学', '浙江大学的月下天地', '浙江');
INSERT INTO `prepare_sq` VALUES ('123', '浙江传媒学院', '浙江传媒学院的月下天地', '浙江');
INSERT INTO `prepare_sq` VALUES ('124', '台州学院', '台州学院的月下天地', '浙江');
INSERT INTO `prepare_sq` VALUES ('125', '宁波职业技术学院', '宁波职业技术学院的月下天地', '浙江');
INSERT INTO `prepare_sq` VALUES ('126', '中国美术学院', '中国美术学院的月下天地', '浙江');
INSERT INTO `prepare_sq` VALUES ('127', '浙江工业大学', '浙江工业大学的月下天地', '浙江');
INSERT INTO `prepare_sq` VALUES ('128', '浙江工商大学', '浙江工商大学的月下天地', '浙江');
INSERT INTO `prepare_sq` VALUES ('129', '东南大学', '东南大学的月下天地', '江苏');
INSERT INTO `prepare_sq` VALUES ('130', '南京大学', '南京大学的月下天地', '江苏');
INSERT INTO `prepare_sq` VALUES ('131', '苏州大学', '苏州大学的月下天地', '江苏');
INSERT INTO `prepare_sq` VALUES ('132', '河海大学', '河海大学的月下天地', '江苏');
INSERT INTO `prepare_sq` VALUES ('133', '中国矿业大学', '中国矿业大学的月下天地', '江苏');
INSERT INTO `prepare_sq` VALUES ('134', '江南大学', '江南大学的月下天地', '江苏');
INSERT INTO `prepare_sq` VALUES ('135', '南京师范大学', '南京师范大学的月下天地', '江苏');
INSERT INTO `prepare_sq` VALUES ('136', '徐州工程学院', '徐州工程学院的月下天地', '江苏');
INSERT INTO `prepare_sq` VALUES ('137', '江苏大学', '江苏大学的月下天地', '江苏');
INSERT INTO `prepare_sq` VALUES ('138', '南京农业大学', '南京农业大学的月下天地', '江苏');
INSERT INTO `prepare_sq` VALUES ('139', '厦门大学', '厦门大学的月下天地', '福建');
INSERT INTO `prepare_sq` VALUES ('140', '福州大学', '福州大学的月下天地', '福建');
INSERT INTO `prepare_sq` VALUES ('141', '福建师范大学', '福建师范大学的月下天地', '福建');
INSERT INTO `prepare_sq` VALUES ('142', '集美大学', '集美大学的月下天地', '福建');
INSERT INTO `prepare_sq` VALUES ('143', '华侨大学', '华侨大学的月下天地', '福建');
INSERT INTO `prepare_sq` VALUES ('144', '莆田学院', '莆田学院的月下天地', '福建');
INSERT INTO `prepare_sq` VALUES ('145', '厦门理工学院', '厦门理工学院的月下天地', '福建');
INSERT INTO `prepare_sq` VALUES ('146', '闽南理工学院', '闽南理工学院的月下天地', '福建');
INSERT INTO `prepare_sq` VALUES ('147', '三明学院', '三明学院的月下天地', '福建');
INSERT INTO `prepare_sq` VALUES ('148', '武夷学院', '武夷学院的月下天地', '福建');
INSERT INTO `prepare_sq` VALUES ('149', '海南大学', '海南大学的月下天地', '海南');
INSERT INTO `prepare_sq` VALUES ('150', '海南师范大学', '海南师范大学的月下天地', '海南');
INSERT INTO `prepare_sq` VALUES ('151', '海口经济学院', '海口经济学院的月下天地', '海南');
INSERT INTO `prepare_sq` VALUES ('152', '琼州学院', '琼州学院的月下天地', '海南');
INSERT INTO `prepare_sq` VALUES ('153', '三亚学院', '三亚学院的月下天地', '海南');
INSERT INTO `prepare_sq` VALUES ('154', '海南医学院', '海南医学院的月下天地', '海南');
INSERT INTO `prepare_sq` VALUES ('155', '云南大学', '云南大学的月下天地', '云南');
INSERT INTO `prepare_sq` VALUES ('156', '昆明理工大学', '昆明理工大学的月下天地', '云南');
INSERT INTO `prepare_sq` VALUES ('157', '云南农业大学', '云南农业大学的月下天地', '云南');
INSERT INTO `prepare_sq` VALUES ('158', '西南林业大学', '西南林业大学的月下天地', '云南');
INSERT INTO `prepare_sq` VALUES ('159', '昆明医科大学', '昆明医科大学的月下天地', '云南');
INSERT INTO `prepare_sq` VALUES ('160', '云南财经大学', '云南财经大学的月下天地', '云南');
INSERT INTO `prepare_sq` VALUES ('161', '昭通学院', '昭通学院的月下天地', '云南');
INSERT INTO `prepare_sq` VALUES ('162', '普洱学院', '普洱学院的月下天地', '云南');
INSERT INTO `prepare_sq` VALUES ('163', '贵州大学', '贵州大学的月下天地', '贵州');
INSERT INTO `prepare_sq` VALUES ('164', '贵州民族大学', '贵州民族大学的月下天地', '贵州');
INSERT INTO `prepare_sq` VALUES ('165', '贵州财经大学', '贵州财经大学的月下天地', '贵州');
INSERT INTO `prepare_sq` VALUES ('166', '遵义医学院', '遵义医学院的月下天地', '贵州');
INSERT INTO `prepare_sq` VALUES ('167', '凯里学院', '凯里学院的月下天地', '贵州');
INSERT INTO `prepare_sq` VALUES ('168', '安顺学院', '安顺学院的月下天地', '贵州');
INSERT INTO `prepare_sq` VALUES ('169', '六盘水师范学院', '六盘水师范学院的月下天地', '贵州');
INSERT INTO `prepare_sq` VALUES ('170', '青海大学', '青海大学的月下天地', '青海');
INSERT INTO `prepare_sq` VALUES ('171', '青海民族大学', '青海民族大学的月下天地', '青海');
INSERT INTO `prepare_sq` VALUES ('172', '青海师范大学', '青海师范大学的月下天地', '青海');
INSERT INTO `prepare_sq` VALUES ('173', '青海警官职业学院', '青海警官职业学院的月下天地', '青海');
INSERT INTO `prepare_sq` VALUES ('174', '兰州大学', '兰州大学的月下天地', '甘肃');
INSERT INTO `prepare_sq` VALUES ('175', '西北师范大学', '西北师范大学的月下天地', '甘肃');
INSERT INTO `prepare_sq` VALUES ('176', '兰州交通大学', '兰州交通大学的月下天地', '甘肃');
INSERT INTO `prepare_sq` VALUES ('177', '兰州理工大学', '兰州理工大学的月下天地', '甘肃');
INSERT INTO `prepare_sq` VALUES ('178', '兰州商学院', '兰州商学院的月下天地', '甘肃');
INSERT INTO `prepare_sq` VALUES ('179', '天水师范学院', '天水师范学院的月下天地', '甘肃');
INSERT INTO `prepare_sq` VALUES ('180', '甘肃政法学院', '甘肃政法学院的月下天地', '甘肃');
INSERT INTO `prepare_sq` VALUES ('181', '南昌大学', '南昌大学的月下天地', '江西');
INSERT INTO `prepare_sq` VALUES ('182', '东华理工大学', '东华理工大学的月下天地', '江西');
INSERT INTO `prepare_sq` VALUES ('183', '景德镇陶瓷学院', '景德镇陶瓷学院的月下天地', '江西');
INSERT INTO `prepare_sq` VALUES ('184', '井冈山大学', '井冈山大学的月下天地', '江西');
INSERT INTO `prepare_sq` VALUES ('185', '赣南师范学院', '赣南师范学院的月下天地', '江西');
INSERT INTO `prepare_sq` VALUES ('186', '南昌航空大学', '南昌航空大学的月下天地', '江西');
INSERT INTO `prepare_sq` VALUES ('187', '九江学院', '九江学院的月下天地', '江西');
INSERT INTO `prepare_sq` VALUES ('188', '萍乡学院', '萍乡学院的月下天地', '江西');
INSERT INTO `prepare_sq` VALUES ('189', '宜春学院', '宜春学院的月下天地', '江西');
INSERT INTO `prepare_sq` VALUES ('190', '666', '888', '福建');

-- ----------------------------
-- Table structure for prepare_yz
-- ----------------------------
DROP TABLE IF EXISTS `prepare_yz`;
CREATE TABLE `prepare_yz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_sq` varchar(100) DEFAULT NULL,
  `apply_usernickname` varchar(100) DEFAULT NULL,
  `introduce` varchar(100) DEFAULT NULL,
  `apply_reason` varchar(100) DEFAULT NULL,
  `sqId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prepare_yz
-- ----------------------------
INSERT INTO `prepare_yz` VALUES ('1', '西南科技大学', '测试账号__3', '77', '88', '14', '6');

-- ----------------------------
-- Table structure for sq
-- ----------------------------
DROP TABLE IF EXISTS `sq`;
CREATE TABLE `sq` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sq_name` varchar(15) DEFAULT NULL,
  `sq_introduction` varchar(200) DEFAULT NULL,
  `sq_logo_img` varchar(40) DEFAULT NULL,
  `sq_img` varchar(40) DEFAULT NULL,
  `sq_location` varchar(10) DEFAULT NULL,
  `sq_pano` varchar(50) DEFAULT NULL,
  `sq_yz` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sq
-- ----------------------------
INSERT INTO `sq` VALUES ('1', '四川农业大学', '川农大馒头哈哈哈', 'd4b805ea-eea3-4413-94c6-276162fa2de6.jpg', '230396bc-2caa-4782-865f-6873d71c4d75.jpg', '四川', '10071141131010151120000', '1');
INSERT INTO `sq` VALUES ('2', '四川大学', '欢迎川大人', '0555e19b-b538-40df-9dd3-1f4c87719f40.jpg', '6956429e-d332-4724-b294-191575c4b627.jpg', '四川', '10071120121128131732900', null);
INSERT INTO `sq` VALUES ('5', '宜宾学院', '宜学院交流天地', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '四川', '28121018140705102943000', null);
INSERT INTO `sq` VALUES ('6', '内江师范学院', '内师人', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '四川', '28081006140727093912000', null);
INSERT INTO `sq` VALUES ('7', '成都大学', '成都大学学生交流', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '四川', '10071302121223121240000', null);
INSERT INTO `sq` VALUES ('9', '北京大学', '北大学子的交流天地', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '北京', '10011503120328151021600', null);
INSERT INTO `sq` VALUES ('11', '西南交通大学', '西南交大人', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '四川', '10071202121230134623200', null);
INSERT INTO `sq` VALUES ('12', '成都理工大学', '成理大', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '四川', '10071202121223104509700', null);
INSERT INTO `sq` VALUES ('13', '西南石油大学', '西南石油大学的月下社区', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '四川', '10071141131118131946900', null);
INSERT INTO `sq` VALUES ('14', '西南科技大学', '土木工程 核工业 机械', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '四川', '28051202131101145416000', null);
INSERT INTO `sq` VALUES ('15', '四川理工学院', '原四川轻化工学院', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '四川', '28011038140711165918100', null);
INSERT INTO `sq` VALUES ('16', '成都工业学院', '原成都电子高专', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '四川', '10071041131006155740600', null);
INSERT INTO `sq` VALUES ('17', '南方科技大学', '南方科技大学的月下天地', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '广东', '10041047140618144620200', null);
INSERT INTO `sq` VALUES ('18', '中山大学', '中山大学的月下天地', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '广东', '10061004140630131233900', null);
INSERT INTO `sq` VALUES ('19', '暨南大学', '暨南大学的月下天地', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '广东', '10041049140124152656700', null);
INSERT INTO `sq` VALUES ('20', '华南理工大学', '华南理工大学的月下天地', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '广东', '10061055141121133959900', null);
INSERT INTO `sq` VALUES ('21', '深圳大学', '马化腾毕业的学校', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '广东', '10041002111116134021248', null);
INSERT INTO `sq` VALUES ('22', '广东海洋大学', '很吊的大学', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '广东', '26061052141113133307500', null);
INSERT INTO `sq` VALUES ('23', '东北石油大学', '东北石油大学的月下天地', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '黑龙江', '16061036130712130942700', null);
INSERT INTO `sq` VALUES ('25', '哈尔滨工业大学', '哈尔滨工业大学的月下天地', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '黑龙江', '16011012130618103323100', null);
INSERT INTO `sq` VALUES ('26', '哈尔滨工程大学', '哈尔滨工程大学的月下天地', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '黑龙江', '16011014140911142427300', null);
INSERT INTO `sq` VALUES ('27', '东北农业大学', '东北农业大学的月下天地', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '黑龙江', '16011014130613145238300', null);
INSERT INTO `sq` VALUES ('28', '黑龙江大学', '黑龙江大学的月下天地', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '黑龙江', '16011214130622113517300', null);
INSERT INTO `sq` VALUES ('29', '吉林大学', '吉林大学的月下天地', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '吉林', '15011042130608142120300', null);
INSERT INTO `sq` VALUES ('30', '东北师范大学', '东北师范大学的月下天地', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '吉林', '15011236130512133422600', null);
INSERT INTO `sq` VALUES ('31', '延边大学', '延边大学的月下天地', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '吉林', '15091114130820103620200', null);
INSERT INTO `sq` VALUES ('32', '复旦大学', '复旦大学的月下天地', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '上海', '10021230140720152423600', null);
INSERT INTO `sq` VALUES ('33', '上海交通大学', '上海交通大学的月下天地', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '上海', '10021230140720152423600', null);
INSERT INTO `sq` VALUES ('34', '同济大学', '同济大学的月下天地', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '上海', '10021010130512120043900', null);
INSERT INTO `sq` VALUES ('35', '华东师范大学', '华东师范大学的月下天地', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '上海', '10021076120721113346600', null);
INSERT INTO `sq` VALUES ('36', '华东理工大学', '华东理工大学的月下天地', '6d1d0753-eb34-4b96-9353-7aabf9aa2b25.jpg', '5ce64821-0791-4583-a915-692a941b0ced.jpg', '上海', '10021030140516102224700', '1');
INSERT INTO `sq` VALUES ('37', '东华大学', '东华大学的月下天地', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '上海', '10021075120721111607200', null);
INSERT INTO `sq` VALUES ('38', '天津大学', '天津大学的聊天', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '天津', null, null);
INSERT INTO `sq` VALUES ('39', '自贡职业技术学院', '自贡职业技术学院欢迎你~~', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '四川', null, null);
INSERT INTO `sq` VALUES ('40', '南开大学', '南开大学的月下天地', 'sq_logo_img_mr.png', 'sq_img_mr.jpg', '天津', null, null);

-- ----------------------------
-- Table structure for tz
-- ----------------------------
DROP TABLE IF EXISTS `tz`;
CREATE TABLE `tz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tz_title` varchar(100) DEFAULT NULL,
  `tz_content` mediumtext,
  `tz_time` datetime DEFAULT NULL,
  `remarkCount` int(11) DEFAULT NULL,
  `lastRemark` varchar(100) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `sqId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tz_user` (`userId`),
  KEY `fk_tz_sq` (`sqId`),
  CONSTRAINT `fk_tz_sq` FOREIGN KEY (`sqId`) REFERENCES `sq` (`id`),
  CONSTRAINT `fk_tz_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tz
-- ----------------------------
INSERT INTO `tz` VALUES ('1', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\"\" src=\"http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\" style=\"height:291px; width:440px\" /></p>\r\n', '2015-05-24 18:47:18', '0', '暂无评论', '0', '1', '1');
INSERT INTO `tz` VALUES ('2', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p>\r\n\r\n<p>-- By Nothing</p>\r\n\r\n<p><img alt=\"\" src=\"http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\" style=\"height:291px; width:440px\" /></p>\r\n', '2015-05-24 18:49:04', '0', '暂无评论', '2', '1', '2');
INSERT INTO `tz` VALUES ('3', '如果最后能在一起，晚点真的无所谓', '<pre>\r\n有时候人生中兜兜转转可能错过，也许中间她爱上过别人，可是最终她回来了，回来了就好。</pre>\r\n\r\n<p><img alt=\"\" src=\"http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7qdas5j0j30jg0wen02.jpg\" style=\"height:733px; width:440px\" /></p>\r\n', '2015-05-24 18:53:33', '1', '测试账号__2', '1', '2', '1');
INSERT INTO `tz` VALUES ('4', '那谁 我就是喜欢你怎么了', '<p>(*^__^*) 嘻嘻……</p>\r\n\r\n<p><img alt=\"\" src=\"http://ww1.sinaimg.cn/bmiddle/005SIeiBgw1es7qf2pmjyj30e6078t9h.jpg\" style=\"height:224px; width:440px\" /></p>\r\n\r\n<p>你知道吗 - - -&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7qhkn7laj30h601m0t1.jpg\" style=\"height:41px; width:440px\" /></p>\r\n', '2015-05-24 18:55:57', '2', '测试账号__2', '1', '2', '1');
INSERT INTO `tz` VALUES ('5', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-25 17:45:07', '0', '暂无评论', '1', '1', '5');
INSERT INTO `tz` VALUES ('6', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-25 18:08:26', '0', '暂无评论', '0', '1', '6');
INSERT INTO `tz` VALUES ('8', '啦啦', '<p>啦啦</p>\r\n', '2015-05-25 18:31:44', '1', '测试账号__2', '2', '2', '1');
INSERT INTO `tz` VALUES ('9', 'haha ', '<p>哈哈</p>\r\n', '2015-05-25 23:14:05', '1', '测试账号__1', '2', '3', '1');
INSERT INTO `tz` VALUES ('10', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-26 18:46:04', '0', '暂无评论', '1', '1', '7');
INSERT INTO `tz` VALUES ('11', '谢谢你的爱 我来啦', '<p>啦啦啦啦</p>\r\n', '2015-05-28 15:03:56', '0', '暂无评论', '2', '6', '1');
INSERT INTO `tz` VALUES ('13', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:51:31', '0', '暂无评论', '0', '1', '9');
INSERT INTO `tz` VALUES ('15', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:52:16', '0', '暂无评论', null, '1', '11');
INSERT INTO `tz` VALUES ('16', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:52:19', '0', '暂无评论', null, '1', '12');
INSERT INTO `tz` VALUES ('17', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:52:22', '0', '暂无评论', null, '1', '13');
INSERT INTO `tz` VALUES ('18', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:52:26', '0', '暂无评论', null, '1', '14');
INSERT INTO `tz` VALUES ('19', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:52:32', '0', '暂无评论', null, '1', '15');
INSERT INTO `tz` VALUES ('20', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:52:34', '0', '暂无评论', null, '1', '16');
INSERT INTO `tz` VALUES ('21', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:52:35', '0', '暂无评论', null, '1', '17');
INSERT INTO `tz` VALUES ('22', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:52:37', '0', '暂无评论', null, '1', '18');
INSERT INTO `tz` VALUES ('23', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:52:39', '0', '暂无评论', null, '1', '19');
INSERT INTO `tz` VALUES ('24', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:52:41', '0', '暂无评论', '0', '1', '20');
INSERT INTO `tz` VALUES ('25', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:52:43', '0', '暂无评论', null, '1', '21');
INSERT INTO `tz` VALUES ('26', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:52:45', '0', '暂无评论', null, '1', '22');
INSERT INTO `tz` VALUES ('27', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:52:47', '0', '暂无评论', null, '1', '23');
INSERT INTO `tz` VALUES ('29', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:52:51', '0', '暂无评论', null, '1', '25');
INSERT INTO `tz` VALUES ('30', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:52:52', '0', '暂无评论', null, '1', '26');
INSERT INTO `tz` VALUES ('31', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:53:05', '0', '暂无评论', null, '1', '27');
INSERT INTO `tz` VALUES ('32', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:53:09', '2', '此时账号__666', '2', '1', '28');
INSERT INTO `tz` VALUES ('33', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:53:11', '0', '暂无评论', null, '1', '29');
INSERT INTO `tz` VALUES ('34', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:53:13', '0', '暂无评论', null, '1', '30');
INSERT INTO `tz` VALUES ('35', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:53:18', '0', '暂无评论', null, '1', '31');
INSERT INTO `tz` VALUES ('36', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:53:21', '0', '暂无评论', null, '1', '32');
INSERT INTO `tz` VALUES ('37', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:53:22', '0', '暂无评论', null, '1', '33');
INSERT INTO `tz` VALUES ('38', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:53:30', '0', '暂无评论', null, '1', '34');
INSERT INTO `tz` VALUES ('39', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:53:32', '0', '暂无评论', null, '1', '35');
INSERT INTO `tz` VALUES ('40', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:53:39', '0', '暂无评论', null, '1', '36');
INSERT INTO `tz` VALUES ('41', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-05-31 20:53:40', '0', '暂无评论', null, '1', '37');
INSERT INTO `tz` VALUES ('42', 'haha ', '<p>gsdgsd</p>\r\n', '2015-06-01 23:39:35', '0', '暂无评论', null, '3', '1');
INSERT INTO `tz` VALUES ('43', '大家好！！！', '<p><img alt=\"\" src=\"http://ww4.sinaimg.cn/bmiddle/005SIeiBgw1es7qn2ui2yj30b40800u2.jpg\" style=\"height:288px; width:400px\" /></p>\r\n\r\n<p>我在成都 你呢？</p>\r\n', '2015-06-01 23:45:21', '0', '暂无评论', '1', '5', '1');
INSERT INTO `tz` VALUES ('44', '你好大家好我们好！你好大家好我们好！', '<p>你好大家好我们好！你好大家好我们好！你好大家好我们好！</p>\r\n', '2015-06-01 23:54:26', '0', '暂无评论', null, '3', '1');
INSERT INTO `tz` VALUES ('45', '回味童年，还记得你小时候的六一怎么过的吗？', '<p><img alt=\"\" src=\"http://ww4.sinaimg.cn/bmiddle/005SIeiBgw1esp0e657bkj30g40bfgmo.jpg\" style=\"height:312px; width:440px\" /></p>\r\n\r\n<p>虽然在这里的都是些老儿童了，但是还是一点不影响我们的童心滴<img src=\"http://tb2.bdstatic.com/tb/editor/images/bearchildren/bearchildren_02.gif?t=20140803\" style=\"height:80px; width:80px\" /></p>\r\n', '2015-06-01 23:58:03', '3', '测试账号', '1', '3', '1');
INSERT INTO `tz` VALUES ('46', '我想偶遇你', '<p>我在想，在你们泱泱川农大的社区里能不能遇到我家的那位呢，才开始玩贴吧，好奇得很。川农你好咯！我超喜欢你的图书馆前的菜还有那几头被我玩的铁牛。嘿嘿！</p>\r\n', '2015-06-02 00:00:51', '3', '测试账号__7', '0', '3', '1');
INSERT INTO `tz` VALUES ('47', '有没有喜欢动漫的o(≥v≤)o', '<p><img alt=\"\" src=\"http://ww1.sinaimg.cn/bmiddle/005SIeiBgw1esp18ah7z9j30g40kmta1.jpg\" style=\"height:563px; width:440px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"http://ww2.sinaimg.cn/bmiddle/005SIeiBgw1esp18air19j30fj0avdgs.jpg\" style=\"height:308px; width:440px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1esp18anbosj306t03m3yf.jpg\" style=\"height:130px; width:245px\" /></p>\r\n', '2015-06-02 00:03:25', '4', '测试账号__8', '0', '5', '1');
INSERT INTO `tz` VALUES ('48', 'dajiahao 啦啦', '<p>你是否就看电视</p>\r\n', '2015-06-02 08:59:07', '1', '测试账号__6', null, '26', '1');
INSERT INTO `tz` VALUES ('49', '老看图~~~~', '<p><img alt=\"\" src=\"http://ww2.sinaimg.cn/bmiddle/005SIeiBgw1esp18air19j30fj0avdgs.jpg\" style=\"height:308px; width:440px\" /></p>\r\n\r\n<p>股份谁都会</p>\r\n', '2015-06-02 09:04:36', '0', '暂无评论', '1', '25', '1');
INSERT INTO `tz` VALUES ('50', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-06-02 09:18:38', '0', '暂无评论', null, '1', '38');
INSERT INTO `tz` VALUES ('51', '大家好 我是XXX', '<p>你好~~~~~~~~~~~~~~~~~</p>\r\n', '2015-06-08 22:58:38', '0', '暂无评论', null, '28', '1');
INSERT INTO `tz` VALUES ('52', '大叫好~~~我是甘同学', '<p>~~~~~~~~~~~~~~~~OKM</p>\r\n', '2015-06-08 23:06:18', '2', '测试账号__7', null, '27', '1');
INSERT INTO `tz` VALUES ('53', '我来水一贴~~~~', '<h2 style=\"font-style:italic;\"><em><strong>哈哈哈~~~</strong></em></h2>\r\n\r\n<p><img alt=\"\" src=\"http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1esp18anbosj306t03m3yf.jpg\" style=\"height:130px; width:245px\" /></p>\r\n', '2015-06-08 23:13:41', '12', '测试账号__7', '2', '26', '1');
INSERT INTO `tz` VALUES ('54', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2015-06-08 23:33:39', '0', '暂无评论', null, '1', '39');
INSERT INTO `tz` VALUES ('56', 'AAA', 'BBB', null, '0', '暂无评论', null, '38', '2');
INSERT INTO `tz` VALUES ('57', 'AAA', 'BBB', '2016-11-24 20:27:33', '0', '暂无评论', null, '38', '28');
INSERT INTO `tz` VALUES ('58', '箱啪啪啪', '<p>和女神</p>\r\n', '2016-11-24 20:28:57', '3', '此时账号__666', null, '38', '15');
INSERT INTO `tz` VALUES ('59', '赫尔咯', '<p>啊6666</p>\r\n', '2016-11-24 21:11:47', '0', '暂无评论', null, '38', '1');
INSERT INTO `tz` VALUES ('60', '你妹啊', '<p>鹅鹅鹅饿饿</p>\r\n', '2016-11-24 21:17:27', '0', '暂无评论', null, '38', '36');
INSERT INTO `tz` VALUES ('61', '欢迎来到本社区，你可以在这里畅所欲言！', '<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt=\'\' src=\'http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg\' style=\'height:291px; width:440px\'/></p>', '2016-12-17 15:34:35', '0', '暂无评论', null, '1', '40');
INSERT INTO `tz` VALUES ('62', 'dd', '<p>dd</p>\r\n', '2017-05-23 11:19:44', '0', '暂无评论', null, '2', '11');

-- ----------------------------
-- Table structure for tz_remark
-- ----------------------------
DROP TABLE IF EXISTS `tz_remark`;
CREATE TABLE `tz_remark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tz_remark_content` varchar(999) DEFAULT NULL,
  `tz_remark_time` datetime DEFAULT NULL,
  `lcNum` int(11) DEFAULT NULL,
  `tzId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tzId` (`tzId`),
  KEY `userId` (`userId`),
  CONSTRAINT `tz_remark_ibfk_2` FOREIGN KEY (`tzId`) REFERENCES `tz` (`id`),
  CONSTRAINT `tz_remark_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tz_remark
-- ----------------------------
INSERT INTO `tz_remark` VALUES ('127', '一见钟情不过如此', '2015-05-24 18:57:15', '1', '4', '3');
INSERT INTO `tz_remark` VALUES ('128', '真的无所谓~~', '2015-05-25 18:24:47', '1', '3', '5');
INSERT INTO `tz_remark` VALUES ('129', 'gg', '2015-05-26 18:41:05', '1', '9', '3');
INSERT INTO `tz_remark` VALUES ('130', '好', '2015-05-28 23:36:59', '1', '8', '5');
INSERT INTO `tz_remark` VALUES ('131', '幼儿园要组织上台表演节目，还要发小蛋糕', '2015-06-01 23:58:36', '1', '45', '3');
INSERT INTO `tz_remark` VALUES ('132', '小伙伴们现在都长大了，好久都没有一起过6.1了', '2015-06-01 23:58:58', '2', '45', '5');
INSERT INTO `tz_remark` VALUES ('133', '学校组织活动上台表演节目', '2015-06-01 23:59:38', '3', '45', '6');
INSERT INTO `tz_remark` VALUES ('134', '我我我', '2015-06-02 00:15:58', '1', '47', '25');
INSERT INTO `tz_remark` VALUES ('135', '啦啦啦啦', '2015-06-02 00:16:30', '2', '47', '25');
INSERT INTO `tz_remark` VALUES ('136', '我来啦', '2015-06-02 00:16:47', '3', '47', '27');
INSERT INTO `tz_remark` VALUES ('137', '我是灰太狼！！', '2015-06-02 00:16:55', '4', '47', '27');
INSERT INTO `tz_remark` VALUES ('138', '我老婆是红太狼~~~', '2015-06-02 00:17:09', '1', '46', '27');
INSERT INTO `tz_remark` VALUES ('139', '我又来了', '2015-06-02 00:17:27', '2', '46', '26');
INSERT INTO `tz_remark` VALUES ('140', '慢羊羊~~~', '2015-06-02 00:17:35', '3', '46', '26');
INSERT INTO `tz_remark` VALUES ('141', '分公司答复', '2015-06-02 08:59:42', '1', '48', '25');
INSERT INTO `tz_remark` VALUES ('142', '说的好~~~', '2015-06-08 23:06:54', '1', '52', '27');
INSERT INTO `tz_remark` VALUES ('143', '慢羊羊欢迎你~~~~', '2015-06-08 23:07:51', '2', '52', '26');
INSERT INTO `tz_remark` VALUES ('144', '1', '2015-06-08 23:14:06', '1', '53', '26');
INSERT INTO `tz_remark` VALUES ('145', '2', '2015-06-08 23:14:09', '2', '53', '26');
INSERT INTO `tz_remark` VALUES ('146', '3', '2015-06-08 23:14:11', '3', '53', '26');
INSERT INTO `tz_remark` VALUES ('147', '4', '2015-06-08 23:14:15', '4', '53', '26');
INSERT INTO `tz_remark` VALUES ('148', '5', '2015-06-08 23:14:18', '5', '53', '26');
INSERT INTO `tz_remark` VALUES ('149', '6', '2015-06-08 23:14:21', '6', '53', '26');
INSERT INTO `tz_remark` VALUES ('150', '7', '2015-06-08 23:14:26', '7', '53', '26');
INSERT INTO `tz_remark` VALUES ('151', '8', '2015-06-08 23:14:30', '8', '53', '26');
INSERT INTO `tz_remark` VALUES ('152', '9', '2015-06-08 23:14:34', '9', '53', '26');
INSERT INTO `tz_remark` VALUES ('153', '10', '2015-06-08 23:14:38', '10', '53', '26');
INSERT INTO `tz_remark` VALUES ('154', '11', '2015-06-08 23:14:45', '11', '53', '26');
INSERT INTO `tz_remark` VALUES ('155', '12', '2015-06-08 23:15:05', '12', '53', '26');
INSERT INTO `tz_remark` VALUES ('156', '666', '2016-11-24 20:33:19', '1', '58', '38');
INSERT INTO `tz_remark` VALUES ('157', '哈哈', '2016-11-24 20:33:26', '2', '58', '38');
INSERT INTO `tz_remark` VALUES ('158', '77', '2016-11-24 20:37:10', '3', '58', '38');
INSERT INTO `tz_remark` VALUES ('159', '么么哒', '2016-11-24 21:19:49', '1', '32', '38');
INSERT INTO `tz_remark` VALUES ('160', '【啪啪啪', '2016-11-24 21:20:00', '2', '32', '38');
INSERT INTO `tz_remark` VALUES ('161', 'ggg', '2016-11-30 11:28:45', '2', '4', '5');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT '',
  `password` varchar(20) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `age` date DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `homepage_img` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `yz_sqId` int(6) DEFAULT NULL,
  `see_Id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '111111', '1', '系统管理员', '2010-10-06', '1761328790@qq.com', 'user_admin.png', '11.jpg', '1', '1', null, 'null_38_null_null_');
INSERT INTO `user` VALUES ('2', '761328790', '111111', '1', 'Nothing', '2013-10-16', '1761328790@qq.com', '1.jpg', '6.jpg', '1', '1', null, '38_null_');
INSERT INTO `user` VALUES ('3', '11111', '111111', '2', '测试账号__1', '2014-01-01', '11111@qq.com', '1bf4e985-5aa9-4a20-9ca0-954e14a6ff37.jpg', '7.jpg', '2', '1', '1', null);
INSERT INTO `user` VALUES ('5', '22222', '111111', '1', '测试账号__2', '2010-02-02', '22222@qq.com', 'd386697a-8335-420f-9de2-1b67487d1195.jpeg', '6.jpg', '2', '1', '1', '3_');
INSERT INTO `user` VALUES ('6', '33333', '111111', '2', '测试账号', '2015-05-20', '33333@qq.com', '8508b167-05f6-4060-bff8-0ee697b4c720.jpg', '11.jpg', '3', '1', null, 'null_null_null_null_');
INSERT INTO `user` VALUES ('7', '44444', '111111', '2', '测试账号__4', '2013-01-05', '44444@qq.com', 'bd9360b3-0d1b-4304-b1da-68f768082750.jpg', '1.jpg', '3', '1', null, null);
INSERT INTO `user` VALUES ('24', '55555', '111111', '2', '测试账号__5', '2015-05-27', '55555@qq.com', '667807c3-23af-47ec-bc0b-ea01d4abd1a6.jpg', '1.jpg', '3', '1', null, 'null_null_');
INSERT INTO `user` VALUES ('25', '66666', '111111', '1', '测试账号__6', '2015-05-27', '66666@qq.com', 'faa24b29-2924-4176-8d94-6390d2cdb3a0.jpg', '1.jpg', '3', '1', null, '38_null_null_null_');
INSERT INTO `user` VALUES ('26', '77777', '111111', '2', '测试账号__7', '2015-05-28', '77777@qq.com', 'd5d0c38e-6405-4ffd-826c-3c0d047e10cd.jpg', '3.jpg', '3', '1', null, 'null_null_null_null_');
INSERT INTO `user` VALUES ('27', '88888', '111111', '2', '测试账号__8', '2015-05-28', '8888@qq.com', '08396431-6878-45cd-b484-22a8ff0e0c17.jpg', '1.jpg', '3', '1', null, '38_null_7_24_');
INSERT INTO `user` VALUES ('28', '99999', '111111', '1', '测试账号__9', '2015-04-01', '99999@qq.com', 'user_mr.jpg', '1.jpg', '3', '1', null, '38_1_');
INSERT INTO `user` VALUES ('29', '11112', '111111', '2', '测试账号__10', '2015-04-21', '11112@qq.com', 'user_mr.jpg', '1.jpg', '3', '1', null, null);
INSERT INTO `user` VALUES ('30', '11113', '111111', '1', '测试账号__11', '2010-05-28', '11113@qq.com', 'user_mr.jpg', '1.jpg', '3', '1', null, null);
INSERT INTO `user` VALUES ('31', '11114', '111111', '2', '测试账号__12', '2015-05-04', '11114@qq.com', 'user_mr.jpg', '1.jpg', '3', '1', null, 'null_null_null_null_');
INSERT INTO `user` VALUES ('32', '11115', '111111', '2', '测试账号__13', '2015-05-03', '11115@qq.com', 'user_mr.jpg', '1.jpg', '3', '1', null, null);
INSERT INTO `user` VALUES ('33', '11116', '111111', '1', '测试账号__14', '2015-03-09', '11116@qq.com', 'user_mr.jpg', '1.jpg', '3', '1', null, null);
INSERT INTO `user` VALUES ('34', '11117', '111111', '1', '测试账号__15', '2012-01-28', '11117@qq.com', 'user_mr.jpg', '1.jpg', '3', '1', null, null);
INSERT INTO `user` VALUES ('35', '11118', '111111', '1', '测试账号__16', '2015-04-07', '11118@qq.com', 'user_mr.jpg', '1.jpg', '3', '1', null, null);
INSERT INTO `user` VALUES ('37', '11119', '111111', '1', '此时账号__17', '2015-06-02', '1451965355@qq.com', 'd5b8add3-3094-4f65-81d1-6b10a7babe41.jpg', '8.jpg', '3', '1', null, 'null_null_');
INSERT INTO `user` VALUES ('38', '123456', '111111', '1', '此时账号__666', '2016-11-24', '761328790@qq.com', 'user_mr.jpg', '3.jpg', '2', '1', '36', null);
INSERT INTO `user` VALUES ('39', '321332', '111111', '1', '111111', '2016-11-24', '761328790@qq.com', 'user_mr.jpg', '1.jpg', '3', '2', null, 'null_null_null_null_');
INSERT INTO `user` VALUES ('40', '5436546546654', '222222', '1', '222222', '2016-11-24', '761328790@qq.com', 'user_mr.jpg', '1.jpg', '3', '2', null, 'null_');
