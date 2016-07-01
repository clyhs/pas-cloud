/*
MySQL Data Transfer
Source Host: localhost
Source Database: pascloud1
Target Host: localhost
Target Database: pascloud1
Date: 2016/7/1 15:05:31
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for cap_capital_account
-- ----------------------------
CREATE TABLE `cap_capital_account` (
  `CAPITAL_ACCOUNT_ID` int(11) DEFAULT NULL,
  `BALANCE_AMOUNT` decimal(10,0) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for ord_order
-- ----------------------------
CREATE TABLE `ord_order` (
  `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PAYER_USER_ID` int(11) DEFAULT NULL,
  `PAYEE_USER_ID` int(11) DEFAULT NULL,
  `RED_PACKET_PAY_AMOUNT` decimal(10,0) DEFAULT NULL,
  `CAPITAL_PAY_AMOUNT` decimal(10,0) DEFAULT NULL,
  `STATUS` varchar(45) DEFAULT NULL,
  `MERCHANT_ORDER_NO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ord_order_line
-- ----------------------------
CREATE TABLE `ord_order_line` (
  `ORDER_LINE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `QUANTITY` decimal(10,0) DEFAULT NULL,
  `UNIT_PRICE` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ORDER_LINE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ord_shop
-- ----------------------------
CREATE TABLE `ord_shop` (
  `SHOP_ID` int(11) NOT NULL,
  `OWNER_USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SHOP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for red_red_packet_account
-- ----------------------------
CREATE TABLE `red_red_packet_account` (
  `RED_PACKET_ACCOUNT_ID` int(11) DEFAULT NULL,
  `BALANCE_AMOUNT` decimal(10,0) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
CREATE TABLE `t_user` (
  `userId` int(11) DEFAULT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tcc_transaction
-- ----------------------------
CREATE TABLE `tcc_transaction` (
  `TRANSACTION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GLOBAL_TX_ID` varbinary(32) NOT NULL,
  `BRANCH_QUALIFIER` varbinary(32) NOT NULL,
  `CONTENT` varbinary(8000) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TRANSACTION_TYPE` int(11) DEFAULT NULL,
  `RETRIED_COUNT` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`TRANSACTION_ID`),
  UNIQUE KEY `UX_TX_BQ` (`GLOBAL_TX_ID`,`BRANCH_QUALIFIER`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `cap_capital_account` VALUES ('1', '950', '1000');
INSERT INTO `cap_capital_account` VALUES ('2', '1050', '2000');
INSERT INTO `ord_order` VALUES ('15', '1000', '2000', null, null, 'PAY_FAILED', null);
INSERT INTO `ord_shop` VALUES ('1', '2000');
INSERT INTO `red_red_packet_account` VALUES ('1', '90', '1000');
INSERT INTO `red_red_packet_account` VALUES ('2', '120', '2000');
INSERT INTO `t_user` VALUES ('3', 'ccc', '3rerw3');
INSERT INTO `t_user` VALUES ('3', 'ccc', '3rerw3');
INSERT INTO `t_user` VALUES ('3', 'ccc', '3rerw3');
INSERT INTO `t_user` VALUES ('3', 'ccc', '3rerw3');
INSERT INTO `t_user` VALUES ('3', 'ccc', '3rerw3');
INSERT INTO `t_user` VALUES ('3', 'ccc', '3rerw3');
INSERT INTO `t_user` VALUES ('3', 'ccc', '3rerw3');
INSERT INTO `t_user` VALUES ('3', 'ccc', '3rerw3');
INSERT INTO `t_user` VALUES ('3', 'ccc', '3rerw3');
INSERT INTO `t_user` VALUES ('2', '小强', '3rerw3');
