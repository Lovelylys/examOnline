/*
 Navicat Premium Data Transfer

 Source Server         : Mysq
 Source Server Type    : MySQL
 Source Server Version : 50536
 Source Host           : localhost:3306
 Source Schema         : onlinetest

 Target Server Type    : MySQL
 Target Server Version : 50536
 File Encoding         : 65001

 Date: 07/05/2019 23:20:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class_tea
-- ----------------------------
DROP TABLE IF EXISTS `class_tea`;
CREATE TABLE `class_tea`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `classid` int(20) NULL DEFAULT NULL,
  `teacherid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of class_tea
-- ----------------------------
INSERT INTO `class_tea` VALUES (1, 1, 'app222');
INSERT INTO `class_tea` VALUES (2, 2, 'app222');
INSERT INTO `class_tea` VALUES (3, 3, 'app222');
INSERT INTO `class_tea` VALUES (4, 1, 'jl');
INSERT INTO `class_tea` VALUES (5, 2, 'jl');
INSERT INTO `class_tea` VALUES (6, 3, 'teacher3');
INSERT INTO `class_tea` VALUES (7, 2, 'teacher3');

-- ----------------------------
-- Table structure for t_class
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class`  (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '班级编号',
  `classname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级名称',
  `gradeid` int(20) NULL DEFAULT NULL COMMENT '年级ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_class
-- ----------------------------
INSERT INTO `t_class` VALUES (1, '高三1班', 3);
INSERT INTO `t_class` VALUES (2, '高三2班', 3);
INSERT INTO `t_class` VALUES (3, '高三3班', 3);
INSERT INTO `t_class` VALUES (7, '高二1班', 2);
INSERT INTO `t_class` VALUES (8, '高四2班', 7);
INSERT INTO `t_class` VALUES (9, '高一1班', 1);

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course`  (
  `courseid` int(5) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `coursestate` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`courseid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES (1, '语文', '0');
INSERT INTO `t_course` VALUES (2, '数学', '0');
INSERT INTO `t_course` VALUES (3, '英语', '0');
INSERT INTO `t_course` VALUES (7, '盗墓', '0');

-- ----------------------------
-- Table structure for t_errorbook
-- ----------------------------
DROP TABLE IF EXISTS `t_errorbook`;
CREATE TABLE `t_errorbook`  (
  `bookid` int(10) NOT NULL AUTO_INCREMENT,
  `userid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseid` int(40) NOT NULL,
  `gradeid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uanswer` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `questionid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `typeid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bookid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 243 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_errorbook
-- ----------------------------
INSERT INTO `t_errorbook` VALUES (1, 'zhangsan', 1, '3', 'A', '1', '2');
INSERT INTO `t_errorbook` VALUES (2, 'zhangsan', 1, '3', 'A', '29', '1');
INSERT INTO `t_errorbook` VALUES (3, 'zhangsan', 1, '3', 'A', '30', '1');
INSERT INTO `t_errorbook` VALUES (4, 'zhangsan', 1, '3', 'A', '34', '1');
INSERT INTO `t_errorbook` VALUES (5, 'zhangsan', 1, '3', 'A', '24', '1');
INSERT INTO `t_errorbook` VALUES (6, 'zhangsan', 1, '3', 'A', '21', '1');
INSERT INTO `t_errorbook` VALUES (7, 'zhangsan', 1, '3', 'A', '24', '1');
INSERT INTO `t_errorbook` VALUES (8, 'zhangsan', 1, '3', 'A', '21', '1');
INSERT INTO `t_errorbook` VALUES (9, 'zhangsan', 1, '3', 'A', '24', '1');
INSERT INTO `t_errorbook` VALUES (10, 'zhangsan', 1, '3', 'A', '21', '1');
INSERT INTO `t_errorbook` VALUES (11, 'zhangsan', 1, '3', 'A', '24', '1');
INSERT INTO `t_errorbook` VALUES (12, 'zhangsan', 1, '3', 'A', '21', '1');
INSERT INTO `t_errorbook` VALUES (13, 'zhangsan', 1, '3', 'A', '24', '1');
INSERT INTO `t_errorbook` VALUES (14, 'zhangsan', 1, '3', 'A', '21', '1');
INSERT INTO `t_errorbook` VALUES (15, 'zhangsan', 1, '3', 'A', '24', '1');
INSERT INTO `t_errorbook` VALUES (16, 'zhangsan', 1, '3', 'A', '21', '1');
INSERT INTO `t_errorbook` VALUES (17, 'zhaowen', 1, '3', 'A', '1', '1');
INSERT INTO `t_errorbook` VALUES (18, 'app', 1, '3', 'A', '1', '1');
INSERT INTO `t_errorbook` VALUES (19, 'app', 1, '3', 'A', '26', '1');
INSERT INTO `t_errorbook` VALUES (20, 'app', 1, '3', 'A', '21', '1');
INSERT INTO `t_errorbook` VALUES (21, 'app', 1, '3', 'A', '24', '1');
INSERT INTO `t_errorbook` VALUES (22, 'app', 1, '3', 'A', '30', '1');
INSERT INTO `t_errorbook` VALUES (23, 'app', 1, '3', 'A', '23', '1');
INSERT INTO `t_errorbook` VALUES (24, 'app', 1, '3', 'A', '29', '1');
INSERT INTO `t_errorbook` VALUES (25, 'app', 1, '3', 'A', '1', '1');
INSERT INTO `t_errorbook` VALUES (26, 'app', 1, '3', 'A', '34', '1');
INSERT INTO `t_errorbook` VALUES (27, 'app', 1, '3', 'A', '31', '1');
INSERT INTO `t_errorbook` VALUES (28, 'app', 1, '3', 'A', '27', '1');
INSERT INTO `t_errorbook` VALUES (29, 'app', 1, '3', 'A', '25', '1');
INSERT INTO `t_errorbook` VALUES (30, 'app22', 1, '3', 'A', '1', '1');
INSERT INTO `t_errorbook` VALUES (122, 'stu4', 1, NULL, 'B', '2', '1');
INSERT INTO `t_errorbook` VALUES (123, 'stu4', 1, NULL, 'C', '3', '1');
INSERT INTO `t_errorbook` VALUES (124, 'stu4', 1, NULL, 'C', '28', '1');
INSERT INTO `t_errorbook` VALUES (125, 'stu4', 1, NULL, 'B', '22', '1');
INSERT INTO `t_errorbook` VALUES (127, 'stu4', 1, NULL, '啊，这个格式也很丑', '9', '4');
INSERT INTO `t_errorbook` VALUES (128, 'stu4', 1, NULL, '我tm怎么知道', '10', '4');
INSERT INTO `t_errorbook` VALUES (129, 'stu4', 1, NULL, '艹，这么多题', '17', '4');
INSERT INTO `t_errorbook` VALUES (130, 'stu4', 1, NULL, '真滴烦', '18', '4');
INSERT INTO `t_errorbook` VALUES (131, 'stu4', 1, NULL, '日你姥姥', '14', '4');
INSERT INTO `t_errorbook` VALUES (132, 'stu4', 1, NULL, 'C', '28', '1');
INSERT INTO `t_errorbook` VALUES (133, 'stu4', 1, NULL, 'B', '22', '1');
INSERT INTO `t_errorbook` VALUES (134, 'stu4', 1, NULL, '卧槽', '9', '4');
INSERT INTO `t_errorbook` VALUES (135, 'stu4', 1, NULL, '又tm做一遍', '10', '4');
INSERT INTO `t_errorbook` VALUES (136, 'stu4', 1, NULL, '早就忘记了', '17', '4');
INSERT INTO `t_errorbook` VALUES (137, 'stu4', 1, NULL, '这些年学到狗身上了', '18', '4');
INSERT INTO `t_errorbook` VALUES (138, 'stu4', 1, NULL, '真滴烦哦', '14', '4');
INSERT INTO `t_errorbook` VALUES (139, 'stu3', 1, NULL, 'A', '29', '1');
INSERT INTO `t_errorbook` VALUES (140, 'stu3', 1, NULL, 'A', '1', '1');
INSERT INTO `t_errorbook` VALUES (141, 'stu3', 1, NULL, '', '23', '1');
INSERT INTO `t_errorbook` VALUES (142, 'stu3', 1, NULL, '', '3', '1');
INSERT INTO `t_errorbook` VALUES (143, 'stu3', 1, NULL, '', '26', '1');
INSERT INTO `t_errorbook` VALUES (144, 'stu3', 1, NULL, '', '27', '1');
INSERT INTO `t_errorbook` VALUES (145, 'stu3', 1, NULL, '', '11', '4');
INSERT INTO `t_errorbook` VALUES (146, 'stu3', 1, NULL, '', '5', '4');
INSERT INTO `t_errorbook` VALUES (147, 'stu3', 1, NULL, '', '13', '4');
INSERT INTO `t_errorbook` VALUES (148, 'stu3', 1, NULL, '', '9', '4');
INSERT INTO `t_errorbook` VALUES (149, 'stu3', 1, NULL, '', '8', '4');
INSERT INTO `t_errorbook` VALUES (150, 'stu3', 1, NULL, 'A', '1', '1');
INSERT INTO `t_errorbook` VALUES (151, 'stu3', 1, NULL, '', '23', '1');
INSERT INTO `t_errorbook` VALUES (152, 'stu3', 1, NULL, '', '3', '1');
INSERT INTO `t_errorbook` VALUES (153, 'stu3', 1, NULL, '', '26', '1');
INSERT INTO `t_errorbook` VALUES (154, 'stu3', 1, NULL, '', '27', '1');
INSERT INTO `t_errorbook` VALUES (155, 'stu3', 1, NULL, '', '11', '4');
INSERT INTO `t_errorbook` VALUES (156, 'stu3', 1, NULL, '', '5', '4');
INSERT INTO `t_errorbook` VALUES (157, 'stu3', 1, NULL, '', '13', '4');
INSERT INTO `t_errorbook` VALUES (158, 'stu3', 1, NULL, '', '9', '4');
INSERT INTO `t_errorbook` VALUES (159, 'stu3', 1, NULL, '', '8', '4');
INSERT INTO `t_errorbook` VALUES (160, 'stu3', 1, NULL, 'A', '1', '1');
INSERT INTO `t_errorbook` VALUES (161, 'stu3', 1, NULL, 'A', '23', '1');
INSERT INTO `t_errorbook` VALUES (162, 'stu3', 1, NULL, 'A', '26', '1');
INSERT INTO `t_errorbook` VALUES (163, 'stu3', 1, NULL, '', '27', '1');
INSERT INTO `t_errorbook` VALUES (164, 'stu3', 1, NULL, '', '11', '4');
INSERT INTO `t_errorbook` VALUES (165, 'stu3', 1, NULL, '', '5', '4');
INSERT INTO `t_errorbook` VALUES (166, 'stu3', 1, NULL, '', '13', '4');
INSERT INTO `t_errorbook` VALUES (167, 'stu3', 1, NULL, '', '9', '4');
INSERT INTO `t_errorbook` VALUES (168, 'stu3', 1, NULL, '', '8', '4');
INSERT INTO `t_errorbook` VALUES (169, 'stu3', 1, NULL, 'A', '1', '1');
INSERT INTO `t_errorbook` VALUES (170, 'stu3', 1, NULL, 'B', '3', '1');
INSERT INTO `t_errorbook` VALUES (171, 'stu3', 1, NULL, 'A', '27', '1');
INSERT INTO `t_errorbook` VALUES (172, 'stu3', 1, NULL, '。。。', '11', '4');
INSERT INTO `t_errorbook` VALUES (173, 'stu3', 1, NULL, '', '5', '4');
INSERT INTO `t_errorbook` VALUES (174, 'stu3', 1, NULL, '', '13', '4');
INSERT INTO `t_errorbook` VALUES (175, 'stu3', 1, NULL, '', '9', '4');
INSERT INTO `t_errorbook` VALUES (176, 'stu3', 1, NULL, '', '8', '4');
INSERT INTO `t_errorbook` VALUES (177, 'stu3', 1, NULL, 'A', '1', '1');
INSERT INTO `t_errorbook` VALUES (178, 'stu3', 1, NULL, '', '23', '1');
INSERT INTO `t_errorbook` VALUES (179, 'stu3', 1, NULL, '', '3', '1');
INSERT INTO `t_errorbook` VALUES (180, 'stu3', 1, NULL, '', '26', '1');
INSERT INTO `t_errorbook` VALUES (181, 'stu3', 1, NULL, '', '27', '1');
INSERT INTO `t_errorbook` VALUES (182, 'stu3', 1, NULL, '', '11', '4');
INSERT INTO `t_errorbook` VALUES (183, 'stu3', 1, NULL, '', '5', '4');
INSERT INTO `t_errorbook` VALUES (184, 'stu3', 1, NULL, '', '13', '4');
INSERT INTO `t_errorbook` VALUES (185, 'stu3', 1, NULL, '', '9', '4');
INSERT INTO `t_errorbook` VALUES (186, 'stu3', 1, NULL, '', '8', '4');
INSERT INTO `t_errorbook` VALUES (187, 'stu3', 1, NULL, 'A', '1', '1');
INSERT INTO `t_errorbook` VALUES (188, 'stu3', 1, NULL, 'A', '23', '1');
INSERT INTO `t_errorbook` VALUES (189, 'stu3', 1, NULL, 'C', '3', '1');
INSERT INTO `t_errorbook` VALUES (190, 'stu3', 1, NULL, '', '26', '1');
INSERT INTO `t_errorbook` VALUES (191, 'stu3', 1, NULL, '', '27', '1');
INSERT INTO `t_errorbook` VALUES (192, 'stu3', 1, NULL, '', '11', '4');
INSERT INTO `t_errorbook` VALUES (193, 'stu3', 1, NULL, '', '5', '4');
INSERT INTO `t_errorbook` VALUES (194, 'stu3', 1, NULL, '', '13', '4');
INSERT INTO `t_errorbook` VALUES (195, 'stu3', 1, NULL, '', '9', '4');
INSERT INTO `t_errorbook` VALUES (196, 'stu3', 1, NULL, '', '8', '4');
INSERT INTO `t_errorbook` VALUES (197, 'stu3', 1, NULL, 'C', '1', '1');
INSERT INTO `t_errorbook` VALUES (198, 'stu3', 1, NULL, 'C', '3', '1');
INSERT INTO `t_errorbook` VALUES (199, 'stu3', 1, NULL, 'A', '26', '1');
INSERT INTO `t_errorbook` VALUES (200, 'stu3', 1, NULL, '', '27', '1');
INSERT INTO `t_errorbook` VALUES (201, 'stu3', 1, NULL, '', '11', '4');
INSERT INTO `t_errorbook` VALUES (202, 'stu3', 1, NULL, '', '5', '4');
INSERT INTO `t_errorbook` VALUES (203, 'stu3', 1, NULL, '', '13', '4');
INSERT INTO `t_errorbook` VALUES (204, 'stu3', 1, NULL, '', '9', '4');
INSERT INTO `t_errorbook` VALUES (205, 'stu3', 1, NULL, '', '8', '4');
INSERT INTO `t_errorbook` VALUES (206, 'stu3', 1, NULL, 'C', '1', '1');
INSERT INTO `t_errorbook` VALUES (207, 'stu3', 1, NULL, 'A', '23', '1');
INSERT INTO `t_errorbook` VALUES (208, 'stu3', 1, NULL, 'C', '3', '1');
INSERT INTO `t_errorbook` VALUES (209, 'stu3', 1, NULL, 'B', '26', '1');
INSERT INTO `t_errorbook` VALUES (210, 'stu3', 1, NULL, '', '27', '1');
INSERT INTO `t_errorbook` VALUES (211, 'stu3', 1, NULL, '', '11', '4');
INSERT INTO `t_errorbook` VALUES (212, 'stu3', 1, NULL, '', '5', '4');
INSERT INTO `t_errorbook` VALUES (213, 'stu3', 1, NULL, '', '13', '4');
INSERT INTO `t_errorbook` VALUES (214, 'stu3', 1, NULL, '', '9', '4');
INSERT INTO `t_errorbook` VALUES (215, 'stu3', 1, NULL, '', '8', '4');
INSERT INTO `t_errorbook` VALUES (216, 'stu3', 1, NULL, 'B', '1', '1');
INSERT INTO `t_errorbook` VALUES (217, 'stu3', 1, NULL, 'D', '3', '1');
INSERT INTO `t_errorbook` VALUES (218, 'stu3', 1, NULL, 'A', '26', '1');
INSERT INTO `t_errorbook` VALUES (219, 'stu3', 1, NULL, 'C', '27', '1');
INSERT INTO `t_errorbook` VALUES (220, 'stu3', 1, NULL, '', '11', '4');
INSERT INTO `t_errorbook` VALUES (221, 'stu3', 1, NULL, '', '5', '4');
INSERT INTO `t_errorbook` VALUES (222, 'stu3', 1, NULL, '', '13', '4');
INSERT INTO `t_errorbook` VALUES (223, 'stu3', 1, NULL, '', '9', '4');
INSERT INTO `t_errorbook` VALUES (224, 'stu3', 1, NULL, '', '8', '4');
INSERT INTO `t_errorbook` VALUES (225, 'stu3', 1, NULL, 'A', '1', '1');
INSERT INTO `t_errorbook` VALUES (226, 'stu3', 1, NULL, 'B', '3', '1');
INSERT INTO `t_errorbook` VALUES (227, 'stu3', 1, NULL, 'D', '26', '1');
INSERT INTO `t_errorbook` VALUES (228, 'stu3', 1, NULL, 'B', '27', '1');
INSERT INTO `t_errorbook` VALUES (229, 'stu3', 1, NULL, '', '11', '4');
INSERT INTO `t_errorbook` VALUES (230, 'stu3', 1, NULL, '', '5', '4');
INSERT INTO `t_errorbook` VALUES (231, 'stu3', 1, NULL, '', '13', '4');
INSERT INTO `t_errorbook` VALUES (232, 'stu3', 1, NULL, '', '9', '4');
INSERT INTO `t_errorbook` VALUES (233, 'stu3', 1, NULL, '', '8', '4');
INSERT INTO `t_errorbook` VALUES (234, 'stu3', 1, NULL, 'A', '1', '1');
INSERT INTO `t_errorbook` VALUES (235, 'stu3', 1, NULL, 'A', '23', '1');
INSERT INTO `t_errorbook` VALUES (236, 'stu3', 1, NULL, 'A', '26', '1');
INSERT INTO `t_errorbook` VALUES (237, 'stu3', 1, NULL, 'A', '27', '1');
INSERT INTO `t_errorbook` VALUES (238, 'stu3', 1, NULL, '', '11', '4');
INSERT INTO `t_errorbook` VALUES (239, 'stu3', 1, NULL, '', '5', '4');
INSERT INTO `t_errorbook` VALUES (240, 'stu3', 1, NULL, '', '13', '4');
INSERT INTO `t_errorbook` VALUES (241, 'stu3', 1, NULL, '', '9', '4');
INSERT INTO `t_errorbook` VALUES (242, 'stu3', 1, NULL, '', '8', '4');

-- ----------------------------
-- Table structure for t_grade
-- ----------------------------
DROP TABLE IF EXISTS `t_grade`;
CREATE TABLE `t_grade`  (
  `gradeid` int(5) NOT NULL AUTO_INCREMENT,
  `gradename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`gradeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_grade
-- ----------------------------
INSERT INTO `t_grade` VALUES (1, '高一', '1,2,3');
INSERT INTO `t_grade` VALUES (2, '高二', '1,2,3');
INSERT INTO `t_grade` VALUES (3, '高三', '1,2,3');
INSERT INTO `t_grade` VALUES (7, '高四', '7');

-- ----------------------------
-- Table structure for t_paper
-- ----------------------------
DROP TABLE IF EXISTS `t_paper`;
CREATE TABLE `t_paper`  (
  `paperid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `papername` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gradeid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `questionid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `begintime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endtime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `allowtime` int(20) NOT NULL,
  `score` float(20, 2) NULL DEFAULT NULL,
  `paperstate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `classid` int(50) NULL DEFAULT NULL,
  `teacherid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deadline` datetime NULL DEFAULT NULL,
  `totalScore` float(20, 2) NULL DEFAULT NULL,
  INDEX `paperid`(`paperid`) USING BTREE,
  INDEX `classid`(`classid`) USING BTREE,
  CONSTRAINT `t_paper_ibfk_1` FOREIGN KEY (`classid`) REFERENCES `t_class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_paper
-- ----------------------------
INSERT INTO `t_paper` VALUES ('sj001', '高三语文期末考试试题', '1', '3', NULL, '2,3,1', NULL, NULL, 120, NULL, '0', NULL, 'teacher3', NULL, 15.00);
INSERT INTO `t_paper` VALUES ('sj001', '高三语文期末考试试题', '1', '3', 'zhangsan', '2,3,1', '2017-03-26 23:22:36', '2017-03-26 23:22:36', 120, 5.00, '2', 2, 'teacher3', NULL, 15.00);
INSERT INTO `t_paper` VALUES ('sj002', '高三语文期末考试（0324）', '1', '3', NULL, '29,28,30,22,34,9,10,17,18,14', NULL, NULL, 120, NULL, '0', NULL, 'teacher3', NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj002', '高三语文期末考试（0324）', '1', '3', 'zhangsan', '29,28,30,22,34,9,10,17,18,14', '2017-03-27 21:45:23', '2017-03-27 21:45:30', 120, 10.00, '2', 2, 'teacher3', NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj003', '高三语文高考仿真训练（一）', '1', '3', NULL, '2,24,32,21,22,7,4,19,17,15', NULL, NULL, 120, NULL, '0', NULL, 'teacher4', NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj004', '高三语文高考仿真训练（二）', '1', '3', NULL, '1,23,3,26,27,11,5,13,9,8', NULL, NULL, 120, NULL, '0', NULL, 'teacher3', NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj003', '高三语文高考仿真训练（一）', '1', '3', 'zhangsan', '2,24,32,21,22,7,4,19,17,15', '2017-03-28 09:09:26', '2017-03-28 09:09:33', 120, 15.00, '2', 2, 'teacher4', NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj004', '高三语文高考仿真训练（二）', '1', '3', 'zhangsan', '1,23,3,26,27,11,5,13,9,8', NULL, NULL, 120, NULL, '1', NULL, NULL, NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj005', '高三语文高考仿真训练（三）', '1', '3', NULL, '3,33,27,26,32,12,9,19,10,18', NULL, NULL, 120, NULL, '0', NULL, 'teacher4', NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj005', '高三语文高考仿真训练（三）', '1', '3', 'zhangsan', '3,33,27,26,32,12,9,19,10,18', NULL, NULL, 120, NULL, '1', NULL, NULL, NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj001', '高三语文期末考试试题', '1', '3', 'zhaowen', '2,3,1', '2017-03-28 09:18:23', '2017-03-28 09:18:24', 120, 10.00, '2', 1, 'teacher3', NULL, 15.00);
INSERT INTO `t_paper` VALUES ('sj002', '高三语文期末考试（0324）', '1', '3', 'zhaowen', '29,28,30,22,34,9,10,17,18,14', NULL, NULL, 120, NULL, '1', NULL, NULL, NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj003', '高三语文高考仿真训练（一）', '1', '3', 'zhaowen', '2,24,32,21,22,7,4,19,17,15', NULL, NULL, 120, NULL, '1', NULL, NULL, NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj004', '高三语文高考仿真训练（二）', '1', '3', 'zhaowen', '1,23,3,26,27,11,5,13,9,8', NULL, NULL, 120, NULL, '1', NULL, NULL, NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj005', '高三语文高考仿真训练（三）', '1', '3', 'zhaowen', '3,33,27,26,32,12,9,19,10,18', NULL, NULL, 120, NULL, '1', NULL, NULL, NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj006', '高三语文测试', '1', '3', NULL, '32,27,22,20,29,17,12,13,9,15', NULL, NULL, 120, NULL, '0', NULL, 'teacher5', NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj006', '高三语文测试', '1', '3', 'zhangsan', '32,27,22,20,29,17,12,13,9,15', NULL, NULL, 120, NULL, '1', NULL, NULL, NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj001', '高三语文期末考试试题', '1', '3', 'app', '2,3,1', '2019-03-19 20:23:51', '2019-03-19 20:23:57', 120, 10.00, '2', 2, 'teacher3', '2019-03-31 19:33:58', 15.00);
INSERT INTO `t_paper` VALUES ('sj002', '高三语文期末考试（0324）', '1', '3', 'app', '29,28,30,22,34,9,10,17,18,14', NULL, NULL, 120, NULL, '1', NULL, NULL, NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj003', '高三语文高考仿真训练（一）', '1', '3', 'app', '2,24,32,21,22,7,4,19,17,15', NULL, NULL, 120, NULL, '1', NULL, NULL, NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj004', '高三语文高考仿真训练（二）', '1', '3', 'app', '1,23,3,26,27,11,5,13,9,8', NULL, NULL, 120, NULL, '1', NULL, NULL, NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj005', '高三语文高考仿真训练（三）', '1', '3', 'app', '3,33,27,26,32,12,9,19,10,18', NULL, NULL, 120, NULL, '1', NULL, NULL, NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj006', '高三语文测试', '1', '3', 'app', '32,27,22,20,29,17,12,13,9,15', NULL, NULL, 120, NULL, '1', NULL, NULL, NULL, 50.00);
INSERT INTO `t_paper` VALUES ('2222', '123', '2', '3', NULL, '26,32,2,22,21,24,30,23,33,29,1,34,31,28,3,27,25,20,14,9,5,18,6,10,12,17,13,7', NULL, NULL, 200, NULL, '0', NULL, 'teacher3', NULL, 140.00);
INSERT INTO `t_paper` VALUES ('2222', '123', '2', '3', 'app', '26,32,2,22,21,24,30,23,33,29,1,34,31,28,3,27,25,20,14,9,5,18,6,10,12,17,13,7', '', '2019-03-19 20:30:30', 200, 35.00, '2', 2, 'teacher3', NULL, 140.00);
INSERT INTO `t_paper` VALUES ('sj001', '高三语文期末考试试题', '1', '3', 'app22', '2,3,1', '2019-03-20 17:26:44', '2019-03-20 17:26:46', 120, 10.00, '2', 2, 'teacher3', NULL, 15.00);
INSERT INTO `t_paper` VALUES ('sj002', '高三语文期末考试（0324）', '1', '3', 'app22', '29,28,30,22,34,9,10,17,18,14', NULL, NULL, 120, NULL, '1', NULL, NULL, NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj003', '高三语文高考仿真训练（一）', '1', '3', 'app22', '2,24,32,21,22,7,4,19,17,15', NULL, NULL, 120, NULL, '1', NULL, NULL, NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj004', '高三语文高考仿真训练（二）', '1', '3', 'app22', '1,23,3,26,27,11,5,13,9,8', NULL, NULL, 120, NULL, '1', NULL, NULL, NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj005', '高三语文高考仿真训练（三）', '1', '3', 'app22', '3,33,27,26,32,12,9,19,10,18', NULL, NULL, 120, NULL, '1', NULL, NULL, NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj006', '高三语文测试', '1', '3', 'app22', '32,27,22,20,29,17,12,13,9,15', NULL, NULL, 120, NULL, '1', NULL, NULL, NULL, 50.00);
INSERT INTO `t_paper` VALUES ('2222', '123', '2', '3', 'app22', '26,32,2,22,21,24,30,23,33,29,1,34,31,28,3,27,25,20,14,9,5,18,6,10,12,17,13,7', NULL, NULL, 200, NULL, '1', NULL, NULL, NULL, 140.00);
INSERT INTO `t_paper` VALUES ('sj001', '高三语文期末考试试题', '1', '3', 'stu3', '2,3,1', NULL, NULL, 120, NULL, '1', NULL, NULL, '2019-04-15 10:08:39', 15.00);
INSERT INTO `t_paper` VALUES ('sj003', '高三语文高考仿真训练（一）', '1', '3', 'stu3', '2,24,32,21,22,7,4,19,17,15', NULL, NULL, 120, NULL, '1', NULL, NULL, '2019-04-17 10:08:44', 50.00);
INSERT INTO `t_paper` VALUES ('sj004', '高三语文高考仿真训练（二）', '1', '3', 'stu3', '1,23,3,26,27,11,5,13,9,8', '2019-04-24 11:03:44', '2019-04-24 11:04:31', 120, 5.00, '2', NULL, NULL, '2019-04-25 10:37:00', 50.00);
INSERT INTO `t_paper` VALUES ('sj005', '高三语文高考仿真训练（三）', '1', '3', 'stu3', '3,33,27,26,32,12,9,19,10,18', NULL, NULL, 120, NULL, '1', NULL, NULL, '2019-04-05 10:08:52', 50.00);
INSERT INTO `t_paper` VALUES ('sj006', '高三语文测试', '1', '3', 'stu3', '32,27,22,20,29,17,12,13,9,15', NULL, NULL, 120, NULL, '1', NULL, NULL, '2019-04-12 10:08:56', 50.00);
INSERT INTO `t_paper` VALUES ('2222', '123', '2', '3', 'stu3', '26,32,2,22,21,24,30,23,33,29,1,34,31,28,3,27,25,20,14,9,5,18,6,10,12,17,13,7', NULL, NULL, 200, NULL, '1', NULL, NULL, '2019-05-03 10:08:59', 140.00);
INSERT INTO `t_paper` VALUES ('sj007', '高三语文测试卷', '1', '3', NULL, '29,28,24,30,2,27,31,23,32,34,11,7,8,15,9,5,19,17,6,18', NULL, NULL, 120, NULL, '0', NULL, 'teacher4', NULL, 100.00);
INSERT INTO `t_paper` VALUES ('sj010', '高三语文测试卷4', '1', '3', NULL, '32,21,25,4,19', NULL, NULL, 120, NULL, '0', NULL, 'teacher4', NULL, 25.00);
INSERT INTO `t_paper` VALUES ('sj009', '高三语文测试卷3', '1', '3', NULL, '24,23,32,2,22,30,34,26,3,33,27,10,7', NULL, NULL, 120, NULL, '0', NULL, 'teacher4', NULL, 65.00);
INSERT INTO `t_paper` VALUES ('sj007', '高三语文测试卷', '1', '3', NULL, '29,28,24,30,2,27,31,23,32,34,11,7,8,15,9,5,19,17,6,18', NULL, NULL, 120, NULL, '1', 2, 'teacher4', '2019-04-05 08:00:00', 100.00);
INSERT INTO `t_paper` VALUES ('sj001', '高三语文期末考试试题', '1', '3', 'stu4', '2,3,1', '2019-04-09 23:31:01', '2019-04-09 23:31:08', 120, 5.00, '2', 2, 'teacher3', '2019-06-15 16:20:40', 15.00);
INSERT INTO `t_paper` VALUES ('sj002', '高三语文期末考试（0324）', '1', '3', 'stu4', '29,28,30,22,34,9,10,17,18,14,39', '2019-04-10 12:39:58', '2019-04-10 12:40:00', 120, 5.00, '2', 2, 'teacher3', '2019-04-10 13:05:53', 50.00);
INSERT INTO `t_paper` VALUES ('sj003', '高三语文高考仿真训练（一）', '1', '3', 'stu4', '2,24,32,21,22,7,4,19,17,15', NULL, NULL, 120, NULL, '1', NULL, 'teacher4', NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj004', '高三语文高考仿真训练（二）', '1', '3', 'stu4', '1,23,3,26,27,11,5,13,9,8', NULL, NULL, 120, NULL, '1', NULL, 'teacher3', NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj005', '高三语文高考仿真训练（三）', '1', '3', 'stu4', '3,33,27,26,32,12,9,19,10,18', NULL, NULL, 120, NULL, '1', NULL, 'teacher4', NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj006', '高三语文测试', '1', '3', 'stu4', '32,27,22,20,29,17,12,13,9,15', NULL, NULL, 120, NULL, '1', NULL, 'teacher5', NULL, 50.00);
INSERT INTO `t_paper` VALUES ('sj007', '高三语文测试卷', '1', '3', 'stu4', '29,28,24,30,2,27,31,23,32,34,11,7,8,15,9,5,19,17,6,18', NULL, NULL, 120, NULL, '1', NULL, 'teacher4', NULL, 100.00);
INSERT INTO `t_paper` VALUES ('sj010', '高三语文测试卷4', '1', '3', 'stu4', '32,21,25,4,19', NULL, NULL, 120, NULL, '1', NULL, 'teacher4', NULL, 25.00);
INSERT INTO `t_paper` VALUES ('sj009', '高三语文测试卷3', '1', '3', 'stu4', '24,23,32,2,22,30,34,26,3,33,27,10,7', NULL, NULL, 120, NULL, '1', NULL, 'teacher4', NULL, 65.00);
INSERT INTO `t_paper` VALUES ('2222', '123', '2', '3', 'stu4', '26,32,2,22,21,24,30,23,33,29,1,34,31,28,3,27,25,20,14,9,5,18,6,10,12,17,13,7', NULL, NULL, 200, NULL, '1', NULL, 'teacher3', NULL, 140.00);
INSERT INTO `t_paper` VALUES ('sj002', '高三语文期末考试（0324）', '1', '3', NULL, '29,28,30,22,34,9,10,17,18,14', NULL, NULL, 120, NULL, '1', 3, 'teacher3', '2019-04-28 08:00:00', 50.00);
INSERT INTO `t_paper` VALUES ('sj11', '高三语文测试卷(4.11)', '1', '3', NULL, '15,34,33,6,39', NULL, NULL, 60, NULL, '0', NULL, 'teacher4', NULL, 25.00);
INSERT INTO `t_paper` VALUES ('sj12', '高三语文测试卷2(4.11)', '1', '3', NULL, '18,19,33,7,34,5', NULL, NULL, 60, NULL, '0', NULL, 'teacher4', NULL, 30.00);
INSERT INTO `t_paper` VALUES ('sj002', '高三语文期末考试（0324）', '1', '3', 'stu3', '29,28,30,22,34,9,10,17,18,14', '2019-04-21 16:35:01', '2019-04-21 16:35:06', 120, 0.00, '2', 3, 'teacher3', '2019-04-28 08:00:00', 50.00);

-- ----------------------------
-- Table structure for t_question
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question`  (
  `questionid` int(10) NOT NULL AUTO_INCREMENT,
  `quesname` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optiona` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `optionb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `optionc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `optiond` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `answer` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answerdetail` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `useranswer` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `courseid` int(20) NOT NULL,
  `typeid` int(20) NOT NULL,
  `difficulty` int(2) NOT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gradeid` int(20) NULL DEFAULT NULL,
  `testpointid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wrongCount` int(20) NULL DEFAULT 0,
  `selectedCount` int(20) NULL DEFAULT 0,
  PRIMARY KEY (`questionid`) USING BTREE,
  INDEX `testpointid`(`testpointid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO `t_question` VALUES (1, '下列词语中加点字的读音，全部正确的一项是（）', 'A．暂时zàn    埋怨mái    谆谆告诫zhūn   引吭高歌háng', 'B．豆豉chǐ    踝骨huái    踉踉跄跄cāng   按图索骥jì', 'C．梗概gěn    删改shān    炊烟袅袅niǎo  明眸皓齿móu', 'D．搁浅gē     解剖pōu     鬼鬼祟祟suì   不屑一顾xiè', 'D', 'A．埋 mán， B．跄 qiàng C.梗gěng', NULL, 1, 1, 2, '本题考察的都是基础字音，没有出现偏难怪的字音', 3, '4', 11, 0);
INSERT INTO `t_question` VALUES (2, '下列词语中，没有错别字的一项是（）', 'A．妨碍    功夫片    钟灵毓秀   管中窥豹，可见一斑', 'B．梳妆    吊胃口    瞠目结舌   文武之道，一张一驰', 'C．辐射    入场券    循章摘句   风声鹤唳，草木皆兵', 'D．蜚然    直辖市    秘而不宣   城门失火，殃及池鱼', 'A', 'B.文武之道，一张一弛；C.寻章摘句；D.斐然', NULL, 1, 1, 3, '本题考察的都是高考高频字形。', 3, '3', 0, 0);
INSERT INTO `t_question` VALUES (3, '下列各句中加点词语的使用，不恰当的一项是（）', 'A．“2015年度中国文化跨界论坛”日前在北京举行，届时来自世界各国的艺术家、企业家和媒体人围绕当前文化创意产业发展中的热点进行了交流。', 'B．对于那些熟稔互联网的人来说，进行“互联网+”创业，最难的可能并不是“互联网”这一部分，而是“+”什么以及怎么“+”的问题。 ', 'C．这家民用小型无人机公司一年前还寂寂无闻，一年后却声名鹊起，其系列产品先后被评为“十大科技产品“2014年杰出高科技产品”。', 'D．近年来，广袤蜀地的新村建设全面推进，大巴山区漂亮民居星罗棋雍，大凉山上彝家    新寨鳞次栉比，西部高原羌寨碉楼拔地而起。', 'A', '届时是“到时候”的意思，而本句所叙述的是已经发生了的事实。', NULL, 1, 1, 1, '本题考察的是词语和成语运用。都是考纲内的高频词语辨析和成语分析，难度不大。', 3, '4', 9, 0);
INSERT INTO `t_question` VALUES (4, '吾视其辙乱，_________________，故逐之。（《曹刿论战》）', NULL, NULL, NULL, NULL, '望其旗靡', NULL, NULL, 1, 4, 3, NULL, 3, '5', 0, 1);
INSERT INTO `t_question` VALUES (5, '明明如月，_________________?（曹操《短歌行》）', NULL, NULL, NULL, NULL, '何时可掇', NULL, NULL, 1, 4, 1, NULL, 3, '5', 11, 2);
INSERT INTO `t_question` VALUES (6, '闾阎扑地，_________________，舸舰弥津，青雀黄龙之舳。（王勃《滕王阁序》）', NULL, NULL, NULL, NULL, '钟鸣鼎食之家', NULL, NULL, 1, 4, 3, NULL, 3, '5', 0, 1);
INSERT INTO `t_question` VALUES (7, '万里悲秋常作客，_________________。（杜甫《登高》）', NULL, NULL, NULL, NULL, '百年多病独登台', NULL, NULL, 1, 4, 3, NULL, 3, '5', 0, 1);
INSERT INTO `t_question` VALUES (8, '_________________ ，铁骑突出刀枪鸣。（白居易《琵琶行》）', NULL, NULL, NULL, NULL, '银瓶乍破水浆迸', NULL, NULL, 1, 4, 2, NULL, 3, '3', 11, 0);
INSERT INTO `t_question` VALUES (9, '予谓菊，_________________；牡丹，花之富贵者也。（周敦颐《爱莲说》）', NULL, NULL, NULL, NULL, '花之隐逸者也', NULL, NULL, 1, 4, 3, NULL, 3, '3', 11, 0);
INSERT INTO `t_question` VALUES (10, '持节云中，_________________？（苏轼《江城子·密州出猎》）', NULL, NULL, NULL, NULL, '何日遣冯唐', NULL, NULL, 1, 4, 2, NULL, 3, '3', 0, 0);
INSERT INTO `t_question` VALUES (11, '_________________，瑞脑销金兽。（李清照《醉花阴》）', NULL, NULL, NULL, NULL, '薄雾浓云愁永昼', NULL, NULL, 1, 4, 2, NULL, 3, '3', 11, 0);
INSERT INTO `t_question` VALUES (12, '人不知而不愠，              ？（《论语》）', NULL, NULL, NULL, NULL, '不亦君子乎', NULL, NULL, 1, 4, 1, NULL, 3, '3', 0, 0);
INSERT INTO `t_question` VALUES (13, '君子博学而日参省乎己,_________________。（《荀子·劝学》）', NULL, NULL, NULL, NULL, '则知明而行无过矣', NULL, NULL, 1, 4, 2, NULL, 3, '3', 11, 0);
INSERT INTO `t_question` VALUES (14, '涉江采芙蓉，_________________。（《古诗十九首》）', NULL, NULL, NULL, NULL, '兰泽多芳草', NULL, NULL, 1, 4, 3, NULL, 3, '3', 0, 1);
INSERT INTO `t_question` VALUES (15, '母、孙二人，更相为命，_________________。（李密《陈情表》）', NULL, NULL, NULL, NULL, '是以区区不能废远', NULL, NULL, 1, 4, 3, NULL, 3, '3', 0, 1);
INSERT INTO `t_question` VALUES (16, '三径就荒，_________________。（陶渊明《归去来兮辞》）', NULL, NULL, NULL, NULL, '松菊犹存', NULL, NULL, 1, 4, 3, NULL, 3, '3', 0, 0);
INSERT INTO `t_question` VALUES (17, '岩扉松径长寂寥，_________________。（孟浩然《夜归鹿门歌》）', NULL, NULL, NULL, NULL, '惟有幽人自来去', NULL, NULL, 1, 4, 2, NULL, 3, '3', 0, 0);
INSERT INTO `t_question` VALUES (18, '群山万壑赴荆门，_________________。（杜甫《咏怀古迹》）', NULL, NULL, NULL, NULL, '生长明妃尚有村', NULL, NULL, 1, 4, 3, NULL, 3, '3', 0, 1);
INSERT INTO `t_question` VALUES (19, '遥岑远目，献愁供恨，_________________。（辛弃疾《水龙吟·登建康赏心亭》）', NULL, NULL, NULL, NULL, '玉簪螺髻', NULL, NULL, 1, 4, 3, NULL, 3, '3', 0, 2);
INSERT INTO `t_question` VALUES (20, '下列词语中加点的字，读音全都正确的一组是（ ）', 'A. 场(chǎng)所    逮(dài)捕    疾风劲(jìng)草', 'B. 应(yìng)届     贿赂(lù)     飒(sà)爽英姿', 'C. 功绩(jì)       星宿(sù)     揆情度(duó)理', 'D. 谈吐(tù)       麇(qún)集    短小精悍(hàn)', 'A', 'B项“应”C项“宿”D项“吐”', NULL, 1, 1, 2, NULL, 3, '4', 0, 0);
INSERT INTO `t_question` VALUES (21, '下列词语书写没有错别字的一项是（ ）', 'A．首屈一指    毛骨耸然    义愤填膺    劳动锻练', 'B．励行节约    一枕黄梁    妄费心机    通宵达旦', 'C．堰苗助长    结局园满    不可思议    一劳永逸', 'D.   记忆犹新    乔装打扮    顷刻之间    罄竹难书', 'D', 'A项“耸”应为“悚”，“练”应为“炼”B项“励”应为“厉”“梁”应为“粱”“妄”为“枉”；C项“堰”应为“揠”“园”应为“圆”', NULL, 1, 1, 1, NULL, 3, '1', 0, 0);
INSERT INTO `t_question` VALUES (22, '下列各句中没有语病的一句是（ ）', 'A．上海文艺出版社出版的《生存》，出自一位蛰居海外二十多年的加拿大籍华裔之手。', 'B．孔繁森的名字已家喻户晓，对大家都不陌生。', 'C.   日子长了，老王一家对他们的感情越来越深厚，就像自己家里人一样。', 'D．无论老师和学生，毫无例外，都必须遵守学校的规章制度。', 'A', 'B“对大家”后加“来说”；C句不明确，“就像”前加“待他们”；D“无论”与“和”不搭配，“和”应为“或”。', NULL, 1, 1, 2, NULL, 3, '2', 0, 0);
INSERT INTO `t_question` VALUES (23, '下列词语中加点的字，读音全都正确的一组是（ ）', 'A. 扼(é)要     游弋(yì)     风驰电掣(chè)', 'B. 娱(yú)乐    伺(cì)候     强(qiáng)人所难', 'C. 蓓蕾(lěi)   犒(kào)赏    锲(qiè)而不舍', 'D. 讹(é)诈     口供(gōng)   行若狗彘(zhì)', 'C', 'A项“扼”B项“强”D项“供”', NULL, 1, 1, 3, NULL, 3, '4', 7, 0);
INSERT INTO `t_question` VALUES (24, '下列词语没有错别字的一项是（ ）', 'A. 真知灼见    高瞻远瞩    怨天忧人    鼓噪而进', 'B. 雅俗共赏    招摇撞骗    喧宾夺主    杀一敬百', 'C. 到处传诵    梳装打扮    心劳日拙    计划缜密', 'D. 改弦更张    当仁不让    恶意诅咒    墨守成规', 'D', 'A项“忧”应为“尤”B项“敬”应为“儆”或“警”C项“装”应为“妆”', NULL, 1, 1, 3, NULL, 3, '5', 0, 0);
INSERT INTO `t_question` VALUES (25, '下列词语中加点的字，读音全都正确的一组是（ ）', 'A. 哺(pǔ)育      对峙(zhì)     面面相觑(qù)', 'B. 模(mú)样      歼(qiān)灭    广袤(mào)无垠', 'C．场(cháng)院   拓(tuò)片     一暴(pù)十寒', 'D. 答(dā)应      症(zhēng)结   惝(tǎng)恍迷离', 'D', 'A项“哺”B项“歼”C项“拓”1', NULL, 1, 1, 1, NULL, 3, '4', 0, 0);
INSERT INTO `t_question` VALUES (26, '下列词语没有错别字的一项是（ ）', 'A．毕躬毕敬    按部就班    防患未然    雷霆万钧', 'B．不记其数    发奋图强    和盘托出    恍然大悟', 'C．荒谬绝伦    琅琅上口    滥竽充数    死心塌地', 'D. 故弄悬虚    东拼西凑    哄堂大笑    破釜沉舟', 'C', 'A项“躬”应为“恭”B项“记”应为“计”D项“悬”应为“玄”', NULL, 1, 1, 2, NULL, 3, '2', 10, 0);
INSERT INTO `t_question` VALUES (27, '下列各句，没有语病、句意明确的一句是（ ）', 'A. 中国人民自从接受了马克思主义之后，中国的革命就在毛泽东同志的领导下从胜利走向胜利。', 'B．我们要改革和完善符合科学技术发展客观规律的、与社会主义市场经济相适应的、科技同经济有机结合相互促进的科技新体制。', 'C. 乍得总统哈布雷十四日说，乍得政府希望与利比亚谈判，以寻求解决两国间的矛盾。', 'D. 我们历来主张向外国先进的科学文化学习和借鉴，而且已经这样做了；但我们也历来反对盲目照搬外国，全盘西化，事实证明，那样做是极端错误的。', 'D', 'A“自从”应放在“中国人民”前面；B去掉“改革和”；C“寻求”缺少宾语，应改为“以寻求解决两国间矛盾的办法”。', NULL, 1, 1, 3, NULL, 3, '2', 11, 0);
INSERT INTO `t_question` VALUES (28, '下列各组词语中加点的字的读音，与所给注音全都相同的一组是（ ）', 'A．号háo      号叫    号丧    号哭    号淘大哭', 'B．强qiáng    强制    强迫    强化    强词夺理', 'C．贴tiè      字贴    碑贴    面贴    俯首贴耳', 'D．累lěi      累计    连累    累赘    危若累卵', 'A', 'B项“强词夺理”的“强”C项“俯首贴耳”的“贴”D项“累赘”的“累”', NULL, 1, 1, 3, NULL, 3, '2', 0, 0);
INSERT INTO `t_question` VALUES (29, '下列词语没有错别字的一项是（ ）', 'A．名不副实    礼上往来    呕心沥血    如愿以偿', 'B．淋漓尽致    麻木不仁    络绎不绝    明察秋毫', 'C.  流离迁徙    奴颜婢膝    气息奄奄    迫不急待', 'D.  轻歌曼舞    凭白无故    前仆后继    盛气凌人', 'B', 'A项“上”应为“尚”C项“急”应为“及”D项“凭”应为“平”', NULL, 1, 1, 1, NULL, 3, '2', 1, 0);
INSERT INTO `t_question` VALUES (30, '下列各句，没有语病，句意明确的一句是（ ）', 'A．现在，许多青年男女不再以财产多寡和门第高低为条件，而以能劳动，有科学文化知识为标准去选择自己的伴侣。', 'B．这个村今年水稻获得了大丰收，不但向国家交售了六万斤谷子，而且不吃国家的供应粮了。', 'C.   厂长采纳了两个工人的合理化建议，这大大激发了全厂职工出谋献策的积极性。', 'D．鉴于动物有上述特点，我们可以预测，随着信息时代的到来，科学技术的不断发展，在未来的战争舞台上，将有越来越多的“动物兵”出现。', 'D', 'A“能劳动”“有科学文化知识”前分别加“是否”；B应改为“不但不吃国家的供应粮了，而且向国家交售了六万斤谷子”；C“两个”有歧义，可改为“两名工人的合理化建议”或“工人的两个合理化建议”。', NULL, 1, 1, 2, NULL, 3, '2', 0, 0);
INSERT INTO `t_question` VALUES (31, '下列各组词语中加点的字的读音，与所给注音全都相同的一组是（ ）', 'A．角jiǎo    号角    角落    头角    群雄角逐', 'B．笼lóng    笼子    牢笼    笼屉    烟笼雾锁', 'C．量liáng   思量    打量    测量    量体裁衣', 'D．削xuē     剥削    削减    瘦削    日削月割', 'D', 'A项“群雄角逐”的“角”B项“烟笼雾锁”的“笼”C项“量体裁衣”的“量”', NULL, 1, 1, 3, NULL, 3, '4', 0, 0);
INSERT INTO `t_question` VALUES (32, '下列词语没有错别字的一项是（ ）', 'A．和蔼可亲    并行不悖    举一反三    唉声叹气', 'B．撤消处分    柳暗花明    中西合璧    称心如意', 'C．黯然销魂    原型毕露    惨无人道    计日程功', 'D．原物必还    为虎作伥    扬常而去    一张一驰', 'A', 'B项“消”应为“销”C项“型”应为“形”D项“必”应为“毕”', NULL, 1, 1, 3, NULL, 3, '4', 0, 0);
INSERT INTO `t_question` VALUES (33, '下列句子中，成语使用正确的一句是（ ）', 'A．听到我校运动队在全市中学生运动会上夺得团体总分第一名的消息，一向不苟言笑的刘校长也显得非常兴奋，在操场上手舞足蹈地同老师们谈着、笑着。', 'B．洪水冲垮了李老汉的房子，全村人都很难过，村前村后，哀鸿遍野。', 'C.   突然，一个影子如白驹过隙一般一闪而过，快捷异常。', 'D．第一次试验失败了，王工程师抱恨终天，直到深夜心里还很难过。', 'A', 'B项比喻流离失所的灾民；C项形容时间过得快，与句意不符；D项是指恨一辈子，与句意不符。', NULL, 1, 1, 3, NULL, 3, '5', 0, 2);
INSERT INTO `t_question` VALUES (34, '下列各句没有语病，语意明确的一句是（ ）', 'A．加强对全民环保意识的教育，是当前非常至关重要的问题。', 'B．张义和王强上课说话，被老师叫到办公室去了。', 'C．选修课的开设，使同学们的志趣和特长得到了充分的发挥。', 'D．教育优先发展的战略地位，在《教育法》颁布后，得到了进一步落实。', 'B,D', 'A“非常”与“至关”重复；B项有歧义；C项“志趣”与“发挥”不搭配。', NULL, 1, 2, 3, NULL, 3, '3,5', 0, 3);
INSERT INTO `t_question` VALUES (38, '命苦不能怨政府，___________', NULL, NULL, NULL, NULL, '点背不能怪社会', '好湿好湿', NULL, 2, 4, 7, '真滴好', NULL, '7,8', 0, 0);
INSERT INTO `t_question` VALUES (39, '我是你爸爸的爷爷', NULL, NULL, NULL, NULL, '对', '毕竟是祖爷爷', NULL, 1, 3, 5, '真滴好', NULL, '2,3', 0, 1);
INSERT INTO `t_question` VALUES (40, '十六字风水秘术是谁写的', NULL, NULL, NULL, NULL, '张三链子', '明清名人张三爷，一人挂三符，人称三链', NULL, 2, 3, 7, '哈哈哈', NULL, '7,8', 0, 0);

-- ----------------------------
-- Table structure for t_teacher
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher`  (
  `userid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userpwd` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grade` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `usertype` int(2) NOT NULL COMMENT '0是学生，1教师，2管理员',
  `userstate` int(2) NOT NULL,
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `classid` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE,
  INDEX `classid`(`classid`) USING BTREE,
  CONSTRAINT `t_teacher_ibfk_1` FOREIGN KEY (`classid`) REFERENCES `t_class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES ('app', 'app', '202cb962ac59075b964b07152d234b70', '3', 2, 1, '525988279@qq.com', NULL, 'ppp', NULL, NULL);
INSERT INTO `t_teacher` VALUES ('app222', '管六月', '202cb962ac59075b964b07152d234b70', '3', 1, 1, '525988279@qq.com', '15819423242', '123', NULL, NULL);
INSERT INTO `t_teacher` VALUES ('jl', '杰龙', 'e10adc3949ba59abbe56e057f20f883e', '3', 1, 0, 'jl@163.com', '15819423242', 'addresss', '123456', NULL);
INSERT INTO `t_teacher` VALUES ('teacher3', '老师3', '202cb962ac59075b964b07152d234b70', '3', 1, 1, '123', NULL, '123', NULL, NULL);

-- ----------------------------
-- Table structure for t_testpoint
-- ----------------------------
DROP TABLE IF EXISTS `t_testpoint`;
CREATE TABLE `t_testpoint`  (
  `id` bigint(200) NOT NULL AUTO_INCREMENT COMMENT '学科属性id，考点id',
  `first_test_point` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第一层的学科属性、考点',
  `second_test_point` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第二层的学科属性',
  `third_test_point` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三层的学科属性',
  `course_id` int(20) NULL DEFAULT NULL COMMENT '课程id',
  `grade_id` int(20) NULL DEFAULT NULL,
  `difficulty` int(200) NULL DEFAULT NULL COMMENT '每个考点的难度系数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `t_testpoint_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `t_course` (`courseid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_testpoint
-- ----------------------------
INSERT INTO `t_testpoint` VALUES (1, '古诗词', NULL, NULL, 1, 3, 2);
INSERT INTO `t_testpoint` VALUES (2, '语法语病', NULL, NULL, 1, 1, 2);
INSERT INTO `t_testpoint` VALUES (3, '错别字', NULL, NULL, 1, 3, 3);
INSERT INTO `t_testpoint` VALUES (4, '拼音', NULL, NULL, 1, 3, 2);
INSERT INTO `t_testpoint` VALUES (5, '成语', NULL, NULL, 1, 3, 2);
INSERT INTO `t_testpoint` VALUES (6, '函数', '一般研究', '反函数 ', 2, 2, 4);
INSERT INTO `t_testpoint` VALUES (7, '函数', '一般研究', '性质', 2, 1, 2);
INSERT INTO `t_testpoint` VALUES (8, '函数', '具体函数', '指数', 2, 1, 5);
INSERT INTO `t_testpoint` VALUES (9, '函数', '具体函数', '指数函数', 2, 2, 2);
INSERT INTO `t_testpoint` VALUES (10, '函数', '具体函数', '对数函数', 2, 3, 1);
INSERT INTO `t_testpoint` VALUES (11, '语法', '动词', '动词词义辨析', 3, 1, 4);
INSERT INTO `t_testpoint` VALUES (12, '语法', '动词', '近义动词辨析', 3, 2, 5);
INSERT INTO `t_testpoint` VALUES (13, '语法', '动词', '动词宾语固定搭配', 3, 3, 2);

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`  (
  `typeid` int(5) NOT NULL AUTO_INCREMENT,
  `typename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `score` float(20, 2) NOT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`typeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES (1, '单选题', 5.00, '只能选择一个');
INSERT INTO `t_type` VALUES (2, '多选题', 5.00, '下列选项中，至少有两个是正确的');
INSERT INTO `t_type` VALUES (3, '判断题', 5.00, '请判断对错');
INSERT INTO `t_type` VALUES (4, '填空题', 5.00, 'cs');
INSERT INTO `t_type` VALUES (5, '简答题', 5.00, '主观题目，没有布置相关的功能');
INSERT INTO `t_type` VALUES (6, '操作题', 5.00, '功能暂未实现');
INSERT INTO `t_type` VALUES (10, '花钱题', 10000.00, '通过花钱让自己达到及格的题目');
INSERT INTO `t_type` VALUES (11, '幻想题', 100.00, '通过幻想自己能拿多少分的题目');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `userid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userpwd` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gradeid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `usertype` int(2) NOT NULL COMMENT '0是学生，1教师，2管理员',
  `userstate` int(2) NOT NULL,
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `classid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE,
  INDEX `classid`(`classid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('app', '管理员1', '250cf8b51c773f3f8dc8b4be867a9a02', '3', 0, 2, '525988279@qq.com', '15819423242', 'ppp', '666', '2');
INSERT INTO `t_user` VALUES ('app2', '管理员2', '202cb962ac59075b964b07152d234b70', '3', 2, 1, '525988279@qq.com', '15819423242', 'ppp', NULL, NULL);
INSERT INTO `t_user` VALUES ('app666', '学生一', '202cb962ac59075b964b07152d234b70', '3', 0, 1, '525988279@qq.com', '15819423242', '123', NULL, '1');
INSERT INTO `t_user` VALUES ('ceyi', '侧翼', 'e10adc3949ba59abbe56e057f20f883e', '3', 0, 2, 'ceyi@163.com', '123456', '123456', 'cs', '2');
INSERT INTO `t_user` VALUES ('jl', '杰龙', 'e10adc3949ba59abbe56e057f20f883e', '3', 1, 2, 'jl@163.com', '15819423242', 'addresss', '123456', '1');
INSERT INTO `t_user` VALUES ('stu2', '学生22', '250cf8b51c773f3f8dc8b4be867a9a02', '3', 0, 1, '525988279@qq.com', '15819423242', 'ppp', '', '3');
INSERT INTO `t_user` VALUES ('stu3', '学生33', '81dc9bdb52d04dc20036dbd8313ed055', '3', 0, 1, '525988279@qq.com', '15819423242', 'ppp', NULL, '3');
INSERT INTO `t_user` VALUES ('stu4', '小孔', '202cb962ac59075b964b07152d234b70', '3', 0, 1, '525988279@qq.com', '0666134568', '暨南大学', NULL, '2');
INSERT INTO `t_user` VALUES ('stu5', '张力豪', '202cb962ac59075b964b07152d234b70', '3', 0, 1, '525988279@qq.com', NULL, '紫禁城', NULL, '2');
INSERT INTO `t_user` VALUES ('stu7', '鸣人', '202cb962ac59075b964b07152d234b70', '3', 0, 1, '525988279@qq.com', NULL, '木叶村', NULL, '2');
INSERT INTO `t_user` VALUES ('teacher3', '老师3', '202cb962ac59075b964b07152d234b70', '3', 1, 1, '123', NULL, '123', NULL, NULL);
INSERT INTO `t_user` VALUES ('teacher4', '老师4', '202cb962ac59075b964b07152d234b70', '3', 1, 1, '525988279@qq.com', '15819423242', 'addresss', NULL, NULL);
INSERT INTO `t_user` VALUES ('teacher5', '教师5', '202cb962ac59075b964b07152d234b70', '3', 1, 1, '525988279@qq.com', '15819423242', 'ppp', NULL, NULL);
INSERT INTO `t_user` VALUES ('zhangsan', '张三', '202cb962ac59075b964b07152d234b70', '3', 0, 1, 'zhangsan@163.com', '123456', '321', '555', '2');
INSERT INTO `t_user` VALUES ('zhaosi', '赵四', 'e10adc3949ba59abbe56e057f20f883e', '3', 0, 2, 'zhaosi@163.com', '123456', '111', '11', '1');
INSERT INTO `t_user` VALUES ('zhaowen', '赵雯', 'e10adc3949ba59abbe56e057f20f883e', '3', 0, 1, 'zhaowen@163.com', '123456', '12', '111', '1');

-- ----------------------------
-- Table structure for u_answers
-- ----------------------------
DROP TABLE IF EXISTS `u_answers`;
CREATE TABLE `u_answers`  (
  `id` bigint(200) NOT NULL AUTO_INCREMENT,
  `studentid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gettedscore` float(20, 2) NOT NULL,
  `testpointid` int(20) NULL DEFAULT NULL,
  `score` float(200, 2) NULL DEFAULT NULL,
  `classid` int(200) NULL DEFAULT NULL,
  `courseid` int(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of u_answers
-- ----------------------------
INSERT INTO `u_answers` VALUES (1, 'stu3', 5.00, 1, 40.00, 3, 2);
INSERT INTO `u_answers` VALUES (2, 'stu3', 10.00, 3, 260.00, 3, 1);
INSERT INTO `u_answers` VALUES (3, 'stu3', 30.00, 4, 205.00, 3, 1);
INSERT INTO `u_answers` VALUES (4, 'stu4', 46.50, 2, 91.50, 2, 1);
INSERT INTO `u_answers` VALUES (5, 'stu4', 10.00, 1, 40.00, 2, 2);
INSERT INTO `u_answers` VALUES (10, 'stu4', 16.50, 3, 106.50, 2, 1);
INSERT INTO `u_answers` VALUES (11, 'stu4', 5.00, 4, 50.00, 2, 1);
INSERT INTO `u_answers` VALUES (12, 'stu4', 5.00, 5, 10.00, 2, 1);
INSERT INTO `u_answers` VALUES (13, 'stu3', 5.00, 2, 115.00, 3, 1);
INSERT INTO `u_answers` VALUES (14, 'stu3', 0.00, 5, 55.00, NULL, 1);

-- ----------------------------
-- Table structure for u_result
-- ----------------------------
DROP TABLE IF EXISTS `u_result`;
CREATE TABLE `u_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `studentid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `paperid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `objectscore` int(20) NOT NULL,
  `subjectscore` int(20) NULL DEFAULT NULL,
  `classid` int(11) NULL DEFAULT NULL,
  `teacherid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of u_result
-- ----------------------------
INSERT INTO `u_result` VALUES (1, 'stu2', 'sj001', 20, NULL, 3, 'teacher3');
INSERT INTO `u_result` VALUES (2, 'stu2', 'sj002', 40, NULL, 3, 'teacher3');
INSERT INTO `u_result` VALUES (3, 'stu2', 'sj003', 30, NULL, 3, 'teacher4');
INSERT INTO `u_result` VALUES (4, 'stu3', '2222', 50, NULL, 2, 'teacher4');

SET FOREIGN_KEY_CHECKS = 1;
