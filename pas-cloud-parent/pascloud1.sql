/*
MySQL Data Transfer
Source Host: localhost
Source Database: pascloud1
Target Host: localhost
Target Database: pascloud1
Date: 2016/6/20 18:09:29
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for t_user
-- ----------------------------
CREATE TABLE `t_user` (
  `userId` int(11) DEFAULT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'ccc', '3rerw3');
