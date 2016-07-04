/*
MySQL Data Transfer
Source Host: localhost
Source Database: pascloud_redpacket
Target Host: localhost
Target Database: pascloud_redpacket
Date: 2016/7/4 14:46:42
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for red_red_packet_account
-- ----------------------------
CREATE TABLE `red_red_packet_account` (
  `RED_PACKET_ACCOUNT_ID` int(11) DEFAULT NULL,
  `BALANCE_AMOUNT` decimal(10,0) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `red_red_packet_account` VALUES ('1', '990', '1000');
INSERT INTO `red_red_packet_account` VALUES ('2', '1010', '2000');
