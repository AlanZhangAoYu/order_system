/*
 Navicat MySQL Data Transfer

 Source Server         : 链接1
 Source Server Type    : MySQL
 Source Server Version : 80024
 Source Host           : localhost:3306
 Source Schema         : order_system

 Target Server Type    : MySQL
 Target Server Version : 80024
 File Encoding         : 65001

 Date: 05/06/2022 10:20:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for com_tab
-- ----------------------------
DROP TABLE IF EXISTS `com_tab`;
CREATE TABLE `com_tab`  (
  `cid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜品(商品)id',
  `cname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名',
  `sid` int(5) UNSIGNED ZEROFILL NOT NULL COMMENT '所属商家的id',
  `price` decimal(10, 2) NOT NULL COMMENT '商品单价',
  `ctid` int NULL DEFAULT 0 COMMENT '商品所属类别',
  `describe` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '商品描述',
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品图片',
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  INDEX `ctid`(`ctid`) USING BTREE,
  CONSTRAINT `com_tab_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `shop_info_tab` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `com_tab_ibfk_2` FOREIGN KEY (`ctid`) REFERENCES `com_type_tab` (`ctid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of com_tab
-- ----------------------------
INSERT INTO `com_tab` VALUES (1, '元气全家福水饺', 10000, 15.00, 12, '16个、4钟馅拼盘+蘸蝶', 'com_1.jpg');
INSERT INTO `com_tab` VALUES (2, '元气DIY水饺', 10000, 15.90, 12, '自选馅+蘸蝶', 'com_2.jpg');
INSERT INTO `com_tab` VALUES (3, '元气成都火锅饺子', 10000, 17.00, 12, '火锅底料+16个汤饺', 'com_3.jpg');
INSERT INTO `com_tab` VALUES (4, '韭菜鲜肉水饺', 10000, 15.90, 12, '16个+蘸料', 'com_4.jpg');
INSERT INTO `com_tab` VALUES (5, '白菜鲜肉水饺', 10000, 15.90, 12, '16个+蘸料', 'com_5.jpg');
INSERT INTO `com_tab` VALUES (6, '大葱鲜肉水饺', 10000, 15.90, 12, '16个+蘸料', 'com_6.jpg');
INSERT INTO `com_tab` VALUES (7, '暖冬热饮单人餐', 10001, 16.80, 6, '香辣鸡腿堡+甘梅红薯条+满分热椰椰', 'com_7.jpg');
INSERT INTO `com_tab` VALUES (8, '香辣鸡腿堡', 10001, 15.00, 6, '面包片 鸡腿肉 生菜', 'com_8.jpg');
INSERT INTO `com_tab` VALUES (9, '辣味鸡肉卷', 10001, 16.00, 6, '鸡腿肉 生菜 面饼', 'com_9.jpg');
INSERT INTO `com_tab` VALUES (10, '劲脆鲜虾堡', 10001, 15.00, 6, '不辣 虾肉 面包片', 'com_10.jpg');
INSERT INTO `com_tab` VALUES (11, '中可乐', 10001, 9.00, 1, '一如既往的好喝~', NULL);
INSERT INTO `com_tab` VALUES (12, '咖啡', 10001, 10.00, 1, '丝一般地顺滑~', NULL);
INSERT INTO `com_tab` VALUES (13, '烤肠', 10002, 2.80, 10, '', 'com_13.jpg');
INSERT INTO `com_tab` VALUES (14, '孜然烤肉饭', 10002, 14.90, 10, '大份', 'com_14.jpg');
INSERT INTO `com_tab` VALUES (15, '蜜汁烤肉饭', 10002, 14.90, 10, '大份', NULL);
INSERT INTO `com_tab` VALUES (16, '泰式甜辣烤肉饭', 10002, 15.90, 10, '大份', 'com_16.jpg');
INSERT INTO `com_tab` VALUES (17, '黑胡椒脆皮鸡饭', 10002, 14.90, 10, '大份', NULL);
INSERT INTO `com_tab` VALUES (18, '全肉脆皮鸡饭', 10002, 18.80, 10, '大份', NULL);
INSERT INTO `com_tab` VALUES (19, '牛肉咔饼', 10003, 10.00, 10, '牛肉+香菜', 'com_19.jpg');
INSERT INTO `com_tab` VALUES (20, '香辣泡泡鸡米饭', 10002, 17.80, 10, '加时蔬', 'com_20.jpg');
INSERT INTO `com_tab` VALUES (21, '钵钵鸡单人套餐', 10003, 34.32, 11, '荤菜15串+素菜15串+荷包蛋1份', NULL);
INSERT INTO `com_tab` VALUES (22, '特色臊子蛋炒饭', 10003, 10.00, 9, '特色主食', 'com_22.jpg');
INSERT INTO `com_tab` VALUES (23, '孜然烤五花肉拌饭', 10004, 20.00, 9, '下饭拌饭酱+烤五花肉', 'com_23.jpg');
INSERT INTO `com_tab` VALUES (24, '鲜炒小煎鸡盖饭', 10004, 22.50, 9, '赠腿排1份+牛肉酱', 'con_24.jpg');
INSERT INTO `com_tab` VALUES (25, '单人网红酸菜鱼套餐', 10006, 22.00, 10, '金针菇+蛋饺+粉丝+豆皮', NULL);
INSERT INTO `com_tab` VALUES (26, '人气·浓香咖喱鸡拌饭', 10006, 16.00, 10, '', NULL);
INSERT INTO `com_tab` VALUES (27, '火山岩石烤肠', 10006, 2.90, 10, '肉多才是硬道理', NULL);
INSERT INTO `com_tab` VALUES (28, '精选无刺鱼', 10006, 9.90, 9, '低脂、健康', NULL);

-- ----------------------------
-- Table structure for com_type_tab
-- ----------------------------
DROP TABLE IF EXISTS `com_type_tab`;
CREATE TABLE `com_type_tab`  (
  `ctid` int NOT NULL COMMENT '商品类型码',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品类别名',
  PRIMARY KEY (`ctid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of com_type_tab
-- ----------------------------
INSERT INTO `com_type_tab` VALUES (0, '未分类');
INSERT INTO `com_type_tab` VALUES (1, '甜点饮品');
INSERT INTO `com_type_tab` VALUES (2, '超市便利');
INSERT INTO `com_type_tab` VALUES (3, '蔬菜水果');
INSERT INTO `com_type_tab` VALUES (4, '医用药品');
INSERT INTO `com_type_tab` VALUES (5, '早餐');
INSERT INTO `com_type_tab` VALUES (6, '汉堡披萨');
INSERT INTO `com_type_tab` VALUES (7, '面包蛋糕');
INSERT INTO `com_type_tab` VALUES (8, '日韩料理');
INSERT INTO `com_type_tab` VALUES (9, '家常菜');
INSERT INTO `com_type_tab` VALUES (10, '特色小吃');
INSERT INTO `com_type_tab` VALUES (11, '火锅烧烤');
INSERT INTO `com_type_tab` VALUES (12, '米粉面馆');

-- ----------------------------
-- Table structure for order_form
-- ----------------------------
DROP TABLE IF EXISTS `order_form`;
CREATE TABLE `order_form`  (
  `ofid` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单号',
  `uid` int(5) UNSIGNED ZEROFILL NOT NULL COMMENT '提交订单用户id',
  `sid` int(5) UNSIGNED ZEROFILL NOT NULL COMMENT '商家id',
  `date` datetime NOT NULL COMMENT '订单提交时间',
  `price` decimal(10, 2) NOT NULL COMMENT '订单总价',
  `stid` int NOT NULL COMMENT '订单状态码',
  PRIMARY KEY (`ofid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  INDEX `stid`(`stid`) USING BTREE,
  CONSTRAINT `order_form_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_info_tab` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_form_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `shop_info_tab` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_form_ibfk_3` FOREIGN KEY (`stid`) REFERENCES `state_tab` (`stid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_form
-- ----------------------------
INSERT INTO `order_form` VALUES (1, 10000, 10002, '2021-11-24 11:01:40', 20.00, 5);
INSERT INTO `order_form` VALUES (2, 10001, 10000, '2021-11-24 11:05:39', 18.70, 5);
INSERT INTO `order_form` VALUES (3, 10002, 10001, '2021-11-24 11:06:14', 21.60, 5);
INSERT INTO `order_form` VALUES (4, 10001, 10001, '2021-12-01 12:05:07', 30.00, 5);
INSERT INTO `order_form` VALUES (5, 10003, 10000, '2021-12-10 16:32:46', 32.90, 5);
INSERT INTO `order_form` VALUES (6, 10002, 10002, '2021-12-10 18:55:53', 17.70, 5);
INSERT INTO `order_form` VALUES (7, 10004, 10003, '2021-12-11 14:35:34', 20.00, 5);
INSERT INTO `order_form` VALUES (8, 10000, 10004, '2021-12-11 14:45:25', 20.00, 5);
INSERT INTO `order_form` VALUES (9, 10000, 10001, '2021-12-12 11:39:43', 30.00, 5);
INSERT INTO `order_form` VALUES (10, 10004, 10003, '2021-12-12 11:43:24', 34.32, 5);
INSERT INTO `order_form` VALUES (11, 10005, 10006, '2021-12-13 12:24:54', 21.90, 5);
INSERT INTO `order_form` VALUES (12, 10000, 10002, '2021-12-13 12:56:30', 2.80, 5);
INSERT INTO `order_form` VALUES (13, 10000, 10000, '2021-12-14 09:59:58', 29.80, 5);
INSERT INTO `order_form` VALUES (14, 10002, 10001, '2021-12-15 15:27:49', 15.00, 5);
INSERT INTO `order_form` VALUES (16, 10001, 10002, '2021-12-26 19:06:56', 37.40, 5);
INSERT INTO `order_form` VALUES (17, 10003, 10000, '2022-06-04 12:52:25', 15.00, 5);

-- ----------------------------
-- Table structure for order_item_info_tab
-- ----------------------------
DROP TABLE IF EXISTS `order_item_info_tab`;
CREATE TABLE `order_item_info_tab`  (
  `ofid` int UNSIGNED NOT NULL COMMENT '订单号',
  `cid` int UNSIGNED NOT NULL COMMENT '商品id',
  `num` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品数量',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '此项商品价格(单价*数量)',
  `tips` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`ofid`, `cid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  CONSTRAINT `order_item_info_tab_ibfk_1` FOREIGN KEY (`ofid`) REFERENCES `order_form` (`ofid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_item_info_tab_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `com_tab` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_item_info_tab
-- ----------------------------
INSERT INTO `order_item_info_tab` VALUES (1, 14, 1, 14.90, '');
INSERT INTO `order_item_info_tab` VALUES (2, 4, 1, 15.90, '加辣');
INSERT INTO `order_item_info_tab` VALUES (3, 7, 1, 16.80, '');
INSERT INTO `order_item_info_tab` VALUES (4, 8, 1, 15.00, '');
INSERT INTO `order_item_info_tab` VALUES (4, 9, 1, 15.00, '');
INSERT INTO `order_item_info_tab` VALUES (5, 2, 1, 15.90, '');
INSERT INTO `order_item_info_tab` VALUES (5, 3, 1, 17.00, '');
INSERT INTO `order_item_info_tab` VALUES (6, 13, 1, 2.80, '');
INSERT INTO `order_item_info_tab` VALUES (6, 15, 1, 14.90, '');
INSERT INTO `order_item_info_tab` VALUES (7, 19, 1, 10.00, '');
INSERT INTO `order_item_info_tab` VALUES (7, 22, 1, 10.00, '');
INSERT INTO `order_item_info_tab` VALUES (8, 23, 1, 20.00, '');
INSERT INTO `order_item_info_tab` VALUES (9, 8, 1, 15.00, '');
INSERT INTO `order_item_info_tab` VALUES (9, 10, 1, 15.00, '');
INSERT INTO `order_item_info_tab` VALUES (10, 21, 1, 34.32, '');
INSERT INTO `order_item_info_tab` VALUES (11, 25, 1, 21.90, '');
INSERT INTO `order_item_info_tab` VALUES (12, 13, 1, 2.80, '');
INSERT INTO `order_item_info_tab` VALUES (13, 1, 2, 29.80, '');
INSERT INTO `order_item_info_tab` VALUES (14, 8, 1, 15.00, '');
INSERT INTO `order_item_info_tab` VALUES (16, 13, 2, 5.60, '');
INSERT INTO `order_item_info_tab` VALUES (16, 16, 2, 31.80, '');
INSERT INTO `order_item_info_tab` VALUES (17, 1, 1, 15.00, '');

-- ----------------------------
-- Table structure for shop_info_tab
-- ----------------------------
DROP TABLE IF EXISTS `shop_info_tab`;
CREATE TABLE `shop_info_tab`  (
  `sid` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '商家id',
  `sname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商店名称',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `realname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '真实姓名',
  `idcard` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '身份证号',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电话',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商店地址',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10007 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop_info_tab
-- ----------------------------
INSERT INTO `shop_info_tab` VALUES (10000, '元气饺子·鲜饺制造铺', 'e10adc3949ba59abbe56e057f20f883e', '李狗蛋', '45978542478951126x', '15963247852', '航天北路204号');
INSERT INTO `shop_info_tab` VALUES (10001, '华莱士·全鸡汉堡(沃尔玛店)', 'e10adc3949ba59abbe56e057f20f883e', '张麻子', '265184196314785524', '15487521698', '迎宾路264号沃尔玛超市');
INSERT INTO `shop_info_tab` VALUES (10002, '土耳其烤肉饭', 'e10adc3949ba59abbe56e057f20f883e', '傻逼', '497524845262487521', '13475846295', '海棠路228号');
INSERT INTO `shop_info_tab` VALUES (10003, '叶婆婆钵钵鸡', 'e10adc3949ba59abbe56e057f20f883e', '叶来香', '546932157485241596', '13457854621', '建设路4号美食广场正大门');
INSERT INTO `shop_info_tab` VALUES (10004, '乡村基(乐山沃尔玛店)', 'e10adc3949ba59abbe56e057f20f883e', '赵大宝', '596214896541274158', '18654712309', '滨河路2号福泉中心3楼');
INSERT INTO `shop_info_tab` VALUES (10006, '鱼小喵在成都(乐山旗舰店)', 'e10adc3949ba59abbe56e057f20f883e', '鱼小喵', '318149201409184214', '15948756235', '天府大道408号财富广场B座');

-- ----------------------------
-- Table structure for state_tab
-- ----------------------------
DROP TABLE IF EXISTS `state_tab`;
CREATE TABLE `state_tab`  (
  `stid` int NOT NULL COMMENT '订单状态码',
  `stname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单状态名',
  PRIMARY KEY (`stid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of state_tab
-- ----------------------------
INSERT INTO `state_tab` VALUES (0, '已取消');
INSERT INTO `state_tab` VALUES (1, '未提交');
INSERT INTO `state_tab` VALUES (2, '未付款');
INSERT INTO `state_tab` VALUES (3, '未发货');
INSERT INTO `state_tab` VALUES (4, '正在派送');
INSERT INTO `state_tab` VALUES (5, '已签收');

-- ----------------------------
-- Table structure for user_info_tab
-- ----------------------------
DROP TABLE IF EXISTS `user_info_tab`;
CREATE TABLE `user_info_tab`  (
  `uid` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `uname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `realname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '真实姓名',
  `idcard` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '身份证号',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电话',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收货地址',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10012 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info_tab
-- ----------------------------
INSERT INTO `user_info_tab` VALUES (10000, '最迷人的痛', 'e10adc3949ba59abbe56e057f20f883e', '张傲宇', '510166925966612542', '15974289425', '饭都花园2栋2单元309号');
INSERT INTO `user_info_tab` VALUES (10001, '甜甜的殇', 'e10adc3949ba59abbe56e057f20f883e', '李利亚', '249752842575541598', '15632487521', '东大街2号锦上城6栋4单元1204号');
INSERT INTO `user_info_tab` VALUES (10002, '万艾可', 'e10adc3949ba59abbe56e057f20f883e', '张伟', '456159752485267521', '12456985247', '成华大道4号B座第九空间大厦2208号');
INSERT INTO `user_info_tab` VALUES (10003, '谢之谦', 'e10adc3949ba59abbe56e057f20f883e', '谢林', '421632548721489652', '15487536214', '蔚蓝路2号东苑1栋3单元206号');
INSERT INTO `user_info_tab` VALUES (10004, '麦克雷', 'e10adc3949ba59abbe56e057f20f883e', '梁俊龙', '514784521497853214', '15487526214', '电子科技大学');
INSERT INTO `user_info_tab` VALUES (10005, '皇帝仙剑', 'e10adc3949ba59abbe56e057f20f883e', '陈浩伟', '56987542648752147x', '19148752614', '蔚蓝路4号西城');
INSERT INTO `user_info_tab` VALUES (10006, '夜夜夜夜~', 'e10adc3949ba59abbe56e057f20f883e', '王五', '591245751420164875', '19154824875', '滨河路4号福泉中心');

SET FOREIGN_KEY_CHECKS = 1;
