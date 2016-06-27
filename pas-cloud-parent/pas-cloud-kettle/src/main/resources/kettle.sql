/*
MySQL Data Transfer
Source Host: localhost
Source Database: kettle
Target Host: localhost
Target Database: kettle
Date: 2016/6/27 14:06:36
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for r_cluster
-- ----------------------------
CREATE TABLE `r_cluster` (
  `ID_CLUSTER` bigint(20) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BASE_PORT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SOCKETS_BUFFER_SIZE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SOCKETS_FLUSH_INTERVAL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SOCKETS_COMPRESSED` tinyint(1) DEFAULT NULL,
  `DYNAMIC_CLUSTER` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_CLUSTER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_cluster_slave
-- ----------------------------
CREATE TABLE `r_cluster_slave` (
  `ID_CLUSTER_SLAVE` bigint(20) NOT NULL,
  `ID_CLUSTER` int(11) DEFAULT NULL,
  `ID_SLAVE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_CLUSTER_SLAVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_condition
-- ----------------------------
CREATE TABLE `r_condition` (
  `ID_CONDITION` bigint(20) NOT NULL,
  `ID_CONDITION_PARENT` int(11) DEFAULT NULL,
  `NEGATED` tinyint(1) DEFAULT NULL,
  `OPERATOR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LEFT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION_FUNCTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RIGHT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_VALUE_RIGHT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_CONDITION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_database
-- ----------------------------
CREATE TABLE `r_database` (
  `ID_DATABASE` bigint(20) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_DATABASE_TYPE` int(11) DEFAULT NULL,
  `ID_DATABASE_CONTYPE` int(11) DEFAULT NULL,
  `HOST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATABASE_NAME` mediumtext COLLATE utf8_unicode_ci,
  `PORT` int(11) DEFAULT NULL,
  `USERNAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVERNAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA_TBS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_TBS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_DATABASE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_database_attribute
-- ----------------------------
CREATE TABLE `r_database_attribute` (
  `ID_DATABASE_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_DATABASE` int(11) DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE_STR` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID_DATABASE_ATTRIBUTE`),
  UNIQUE KEY `IDX_RDAT` (`ID_DATABASE`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_database_contype
-- ----------------------------
CREATE TABLE `r_database_contype` (
  `ID_DATABASE_CONTYPE` bigint(20) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_DATABASE_CONTYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_database_type
-- ----------------------------
CREATE TABLE `r_database_type` (
  `ID_DATABASE_TYPE` bigint(20) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_DATABASE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_dependency
-- ----------------------------
CREATE TABLE `r_dependency` (
  `ID_DEPENDENCY` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `ID_DATABASE` int(11) DEFAULT NULL,
  `TABLE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_DEPENDENCY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_directory
-- ----------------------------
CREATE TABLE `r_directory` (
  `ID_DIRECTORY` bigint(20) NOT NULL,
  `ID_DIRECTORY_PARENT` int(11) DEFAULT NULL,
  `DIRECTORY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_DIRECTORY`),
  UNIQUE KEY `IDX_RDIR` (`ID_DIRECTORY_PARENT`,`DIRECTORY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_element
-- ----------------------------
CREATE TABLE `r_element` (
  `ID_ELEMENT` bigint(20) NOT NULL,
  `ID_ELEMENT_TYPE` int(11) DEFAULT NULL,
  `NAME` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID_ELEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_element_attribute
-- ----------------------------
CREATE TABLE `r_element_attribute` (
  `ID_ELEMENT_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_ELEMENT` int(11) DEFAULT NULL,
  `ID_ELEMENT_ATTRIBUTE_PARENT` int(11) DEFAULT NULL,
  `ATTR_KEY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATTR_VALUE` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID_ELEMENT_ATTRIBUTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_element_type
-- ----------------------------
CREATE TABLE `r_element_type` (
  `ID_ELEMENT_TYPE` bigint(20) NOT NULL,
  `ID_NAMESPACE` int(11) DEFAULT NULL,
  `NAME` mediumtext COLLATE utf8_unicode_ci,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID_ELEMENT_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_job
-- ----------------------------
CREATE TABLE `r_job` (
  `ID_JOB` bigint(20) NOT NULL,
  `ID_DIRECTORY` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci,
  `EXTENDED_DESCRIPTION` mediumtext COLLATE utf8_unicode_ci,
  `JOB_VERSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `JOB_STATUS` int(11) DEFAULT NULL,
  `ID_DATABASE_LOG` int(11) DEFAULT NULL,
  `TABLE_NAME_LOG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_USER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `MODIFIED_USER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT NULL,
  `USE_BATCH_ID` tinyint(1) DEFAULT NULL,
  `PASS_BATCH_ID` tinyint(1) DEFAULT NULL,
  `USE_LOGFIELD` tinyint(1) DEFAULT NULL,
  `SHARED_FILE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_JOB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_job_attribute
-- ----------------------------
CREATE TABLE `r_job_attribute` (
  `ID_JOB_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_JOB` int(11) DEFAULT NULL,
  `NR` int(11) DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE_NUM` bigint(20) DEFAULT NULL,
  `VALUE_STR` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID_JOB_ATTRIBUTE`),
  UNIQUE KEY `IDX_JATT` (`ID_JOB`,`CODE`,`NR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_job_hop
-- ----------------------------
CREATE TABLE `r_job_hop` (
  `ID_JOB_HOP` bigint(20) NOT NULL,
  `ID_JOB` int(11) DEFAULT NULL,
  `ID_JOBENTRY_COPY_FROM` int(11) DEFAULT NULL,
  `ID_JOBENTRY_COPY_TO` int(11) DEFAULT NULL,
  `ENABLED` tinyint(1) DEFAULT NULL,
  `EVALUATION` tinyint(1) DEFAULT NULL,
  `UNCONDITIONAL` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_JOB_HOP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_job_lock
-- ----------------------------
CREATE TABLE `r_job_lock` (
  `ID_JOB_LOCK` bigint(20) NOT NULL,
  `ID_JOB` int(11) DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `LOCK_MESSAGE` mediumtext COLLATE utf8_unicode_ci,
  `LOCK_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_JOB_LOCK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_job_note
-- ----------------------------
CREATE TABLE `r_job_note` (
  `ID_JOB` int(11) DEFAULT NULL,
  `ID_NOTE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_jobentry
-- ----------------------------
CREATE TABLE `r_jobentry` (
  `ID_JOBENTRY` bigint(20) NOT NULL,
  `ID_JOB` int(11) DEFAULT NULL,
  `ID_JOBENTRY_TYPE` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID_JOBENTRY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_jobentry_attribute
-- ----------------------------
CREATE TABLE `r_jobentry_attribute` (
  `ID_JOBENTRY_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_JOB` int(11) DEFAULT NULL,
  `ID_JOBENTRY` int(11) DEFAULT NULL,
  `NR` int(11) DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE_NUM` double DEFAULT NULL,
  `VALUE_STR` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID_JOBENTRY_ATTRIBUTE`),
  UNIQUE KEY `IDX_RJEA` (`ID_JOBENTRY_ATTRIBUTE`,`CODE`,`NR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_jobentry_copy
-- ----------------------------
CREATE TABLE `r_jobentry_copy` (
  `ID_JOBENTRY_COPY` bigint(20) NOT NULL,
  `ID_JOBENTRY` int(11) DEFAULT NULL,
  `ID_JOB` int(11) DEFAULT NULL,
  `ID_JOBENTRY_TYPE` int(11) DEFAULT NULL,
  `NR` int(11) DEFAULT NULL,
  `GUI_LOCATION_X` int(11) DEFAULT NULL,
  `GUI_LOCATION_Y` int(11) DEFAULT NULL,
  `GUI_DRAW` tinyint(1) DEFAULT NULL,
  `PARALLEL` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_JOBENTRY_COPY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_jobentry_database
-- ----------------------------
CREATE TABLE `r_jobentry_database` (
  `ID_JOB` int(11) DEFAULT NULL,
  `ID_JOBENTRY` int(11) DEFAULT NULL,
  `ID_DATABASE` int(11) DEFAULT NULL,
  KEY `IDX_RJD1` (`ID_JOB`),
  KEY `IDX_RJD2` (`ID_DATABASE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_jobentry_type
-- ----------------------------
CREATE TABLE `r_jobentry_type` (
  `ID_JOBENTRY_TYPE` bigint(20) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_JOBENTRY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_log
-- ----------------------------
CREATE TABLE `r_log` (
  `ID_LOG` bigint(20) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_LOGLEVEL` int(11) DEFAULT NULL,
  `LOGTYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILENAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILEEXTENTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADD_DATE` tinyint(1) DEFAULT NULL,
  `ADD_TIME` tinyint(1) DEFAULT NULL,
  `ID_DATABASE_LOG` int(11) DEFAULT NULL,
  `TABLE_NAME_LOG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_LOG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_loglevel
-- ----------------------------
CREATE TABLE `r_loglevel` (
  `ID_LOGLEVEL` bigint(20) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_LOGLEVEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_namespace
-- ----------------------------
CREATE TABLE `r_namespace` (
  `ID_NAMESPACE` bigint(20) NOT NULL,
  `NAME` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID_NAMESPACE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_note
-- ----------------------------
CREATE TABLE `r_note` (
  `ID_NOTE` bigint(20) NOT NULL,
  `VALUE_STR` mediumtext COLLATE utf8_unicode_ci,
  `GUI_LOCATION_X` int(11) DEFAULT NULL,
  `GUI_LOCATION_Y` int(11) DEFAULT NULL,
  `GUI_LOCATION_WIDTH` int(11) DEFAULT NULL,
  `GUI_LOCATION_HEIGHT` int(11) DEFAULT NULL,
  `FONT_NAME` mediumtext COLLATE utf8_unicode_ci,
  `FONT_SIZE` int(11) DEFAULT NULL,
  `FONT_BOLD` tinyint(1) DEFAULT NULL,
  `FONT_ITALIC` tinyint(1) DEFAULT NULL,
  `FONT_COLOR_RED` int(11) DEFAULT NULL,
  `FONT_COLOR_GREEN` int(11) DEFAULT NULL,
  `FONT_COLOR_BLUE` int(11) DEFAULT NULL,
  `FONT_BACK_GROUND_COLOR_RED` int(11) DEFAULT NULL,
  `FONT_BACK_GROUND_COLOR_GREEN` int(11) DEFAULT NULL,
  `FONT_BACK_GROUND_COLOR_BLUE` int(11) DEFAULT NULL,
  `FONT_BORDER_COLOR_RED` int(11) DEFAULT NULL,
  `FONT_BORDER_COLOR_GREEN` int(11) DEFAULT NULL,
  `FONT_BORDER_COLOR_BLUE` int(11) DEFAULT NULL,
  `DRAW_SHADOW` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_NOTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_partition
-- ----------------------------
CREATE TABLE `r_partition` (
  `ID_PARTITION` bigint(20) NOT NULL,
  `ID_PARTITION_SCHEMA` int(11) DEFAULT NULL,
  `PARTITION_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_PARTITION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_partition_schema
-- ----------------------------
CREATE TABLE `r_partition_schema` (
  `ID_PARTITION_SCHEMA` bigint(20) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DYNAMIC_DEFINITION` tinyint(1) DEFAULT NULL,
  `PARTITIONS_PER_SLAVE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_PARTITION_SCHEMA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_repository_log
-- ----------------------------
CREATE TABLE `r_repository_log` (
  `ID_REPOSITORY_LOG` bigint(20) NOT NULL,
  `REP_VERSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOG_DATE` datetime DEFAULT NULL,
  `LOG_USER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OPERATION_DESC` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID_REPOSITORY_LOG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_slave
-- ----------------------------
CREATE TABLE `r_slave` (
  `ID_SLAVE` bigint(20) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HOST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PORT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEB_APP_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USERNAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROXY_HOST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROXY_PORT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NON_PROXY_HOSTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MASTER` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_SLAVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_step
-- ----------------------------
CREATE TABLE `r_step` (
  `ID_STEP` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci,
  `ID_STEP_TYPE` int(11) DEFAULT NULL,
  `DISTRIBUTE` tinyint(1) DEFAULT NULL,
  `COPIES` int(11) DEFAULT NULL,
  `GUI_LOCATION_X` int(11) DEFAULT NULL,
  `GUI_LOCATION_Y` int(11) DEFAULT NULL,
  `GUI_DRAW` tinyint(1) DEFAULT NULL,
  `COPIES_STRING` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_STEP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_step_attribute
-- ----------------------------
CREATE TABLE `r_step_attribute` (
  `ID_STEP_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `ID_STEP` int(11) DEFAULT NULL,
  `NR` int(11) DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE_NUM` bigint(20) DEFAULT NULL,
  `VALUE_STR` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID_STEP_ATTRIBUTE`),
  UNIQUE KEY `IDX_RSAT` (`ID_STEP`,`CODE`,`NR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_step_database
-- ----------------------------
CREATE TABLE `r_step_database` (
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `ID_STEP` int(11) DEFAULT NULL,
  `ID_DATABASE` int(11) DEFAULT NULL,
  KEY `IDX_RSD1` (`ID_TRANSFORMATION`),
  KEY `IDX_RSD2` (`ID_DATABASE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_step_type
-- ----------------------------
CREATE TABLE `r_step_type` (
  `ID_STEP_TYPE` bigint(20) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HELPTEXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_STEP_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_trans_attribute
-- ----------------------------
CREATE TABLE `r_trans_attribute` (
  `ID_TRANS_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `NR` int(11) DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE_NUM` bigint(20) DEFAULT NULL,
  `VALUE_STR` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID_TRANS_ATTRIBUTE`),
  UNIQUE KEY `IDX_TATT` (`ID_TRANSFORMATION`,`CODE`,`NR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_trans_cluster
-- ----------------------------
CREATE TABLE `r_trans_cluster` (
  `ID_TRANS_CLUSTER` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `ID_CLUSTER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_CLUSTER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_trans_hop
-- ----------------------------
CREATE TABLE `r_trans_hop` (
  `ID_TRANS_HOP` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `ID_STEP_FROM` int(11) DEFAULT NULL,
  `ID_STEP_TO` int(11) DEFAULT NULL,
  `ENABLED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_HOP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_trans_lock
-- ----------------------------
CREATE TABLE `r_trans_lock` (
  `ID_TRANS_LOCK` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `LOCK_MESSAGE` mediumtext COLLATE utf8_unicode_ci,
  `LOCK_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_LOCK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_trans_note
-- ----------------------------
CREATE TABLE `r_trans_note` (
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `ID_NOTE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_trans_partition_schema
-- ----------------------------
CREATE TABLE `r_trans_partition_schema` (
  `ID_TRANS_PARTITION_SCHEMA` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `ID_PARTITION_SCHEMA` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_PARTITION_SCHEMA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_trans_slave
-- ----------------------------
CREATE TABLE `r_trans_slave` (
  `ID_TRANS_SLAVE` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `ID_SLAVE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_SLAVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_trans_step_condition
-- ----------------------------
CREATE TABLE `r_trans_step_condition` (
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `ID_STEP` int(11) DEFAULT NULL,
  `ID_CONDITION` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_transformation
-- ----------------------------
CREATE TABLE `r_transformation` (
  `ID_TRANSFORMATION` bigint(20) NOT NULL,
  `ID_DIRECTORY` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci,
  `EXTENDED_DESCRIPTION` mediumtext COLLATE utf8_unicode_ci,
  `TRANS_VERSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TRANS_STATUS` int(11) DEFAULT NULL,
  `ID_STEP_READ` int(11) DEFAULT NULL,
  `ID_STEP_WRITE` int(11) DEFAULT NULL,
  `ID_STEP_INPUT` int(11) DEFAULT NULL,
  `ID_STEP_OUTPUT` int(11) DEFAULT NULL,
  `ID_STEP_UPDATE` int(11) DEFAULT NULL,
  `ID_DATABASE_LOG` int(11) DEFAULT NULL,
  `TABLE_NAME_LOG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_BATCHID` tinyint(1) DEFAULT NULL,
  `USE_LOGFIELD` tinyint(1) DEFAULT NULL,
  `ID_DATABASE_MAXDATE` int(11) DEFAULT NULL,
  `TABLE_NAME_MAXDATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_NAME_MAXDATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OFFSET_MAXDATE` double DEFAULT NULL,
  `DIFF_MAXDATE` double DEFAULT NULL,
  `CREATED_USER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `MODIFIED_USER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT NULL,
  `SIZE_ROWSET` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TRANSFORMATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_user
-- ----------------------------
CREATE TABLE `r_user` (
  `ID_USER` bigint(20) NOT NULL,
  `LOGIN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENABLED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_USER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_value
-- ----------------------------
CREATE TABLE `r_value` (
  `ID_VALUE` bigint(20) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE_STR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_NULL` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for r_version
-- ----------------------------
CREATE TABLE `r_version` (
  `ID_VERSION` bigint(20) NOT NULL,
  `MAJOR_VERSION` int(11) DEFAULT NULL,
  `MINOR_VERSION` int(11) DEFAULT NULL,
  `UPGRADE_DATE` datetime DEFAULT NULL,
  `IS_UPGRADE` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_VERSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `r_database_contype` VALUES ('1', 'Native', 'Native (JDBC)');
INSERT INTO `r_database_contype` VALUES ('2', 'ODBC', 'ODBC');
INSERT INTO `r_database_contype` VALUES ('3', 'OCI', 'OCI');
INSERT INTO `r_database_contype` VALUES ('4', 'Plugin', 'Plugin specific access method');
INSERT INTO `r_database_contype` VALUES ('5', 'JNDI', 'JNDI');
INSERT INTO `r_database_contype` VALUES ('6', ',', 'Custom');
INSERT INTO `r_database_type` VALUES ('1', 'ORACLERDB', 'Oracle RDB');
INSERT INTO `r_database_type` VALUES ('2', 'INFINIDB', 'Calpont InfiniDB');
INSERT INTO `r_database_type` VALUES ('3', 'INFOBRIGHT', 'Infobright');
INSERT INTO `r_database_type` VALUES ('4', 'PALO', 'Palo MOLAP Server');
INSERT INTO `r_database_type` VALUES ('5', 'GENERIC', 'Generic database');
INSERT INTO `r_database_type` VALUES ('6', 'AS/400', 'AS/400');
INSERT INTO `r_database_type` VALUES ('7', 'SYBASEIQ', 'SybaseIQ');
INSERT INTO `r_database_type` VALUES ('8', 'HIVE2', 'Hadoop Hive 2');
INSERT INTO `r_database_type` VALUES ('9', 'SQLITE', 'SQLite');
INSERT INTO `r_database_type` VALUES ('10', 'DERBY', 'Apache Derby');
INSERT INTO `r_database_type` VALUES ('11', 'INFORMIX', 'Informix');
INSERT INTO `r_database_type` VALUES ('12', 'INGRES', 'Ingres');
INSERT INTO `r_database_type` VALUES ('13', 'HIVE', 'Hadoop Hive');
INSERT INTO `r_database_type` VALUES ('14', 'IMPALASIMBA', 'Cloudera Impala');
INSERT INTO `r_database_type` VALUES ('15', 'REMEDY-AR-SYSTEM', 'Remedy Action Request System');
INSERT INTO `r_database_type` VALUES ('16', 'POSTGRESQL', 'PostgreSQL');
INSERT INTO `r_database_type` VALUES ('17', 'SAPR3', 'SAP ERP System');
INSERT INTO `r_database_type` VALUES ('18', 'REDSHIFT', 'Redshift');
INSERT INTO `r_database_type` VALUES ('19', 'CACHE', 'Intersystems Cache');
INSERT INTO `r_database_type` VALUES ('20', 'MSSQL', 'MS SQL Server');
INSERT INTO `r_database_type` VALUES ('21', 'TERADATA', 'Teradata');
INSERT INTO `r_database_type` VALUES ('22', 'DB2', 'IBM DB2');
INSERT INTO `r_database_type` VALUES ('23', 'SQLBASE', 'Gupta SQL Base');
INSERT INTO `r_database_type` VALUES ('24', 'MYSQL', 'MySQL');
INSERT INTO `r_database_type` VALUES ('25', 'FIREBIRD', 'Firebird SQL');
INSERT INTO `r_database_type` VALUES ('26', 'HYPERSONIC', 'Hypersonic');
INSERT INTO `r_database_type` VALUES ('27', 'MSACCESS', 'MS Access');
INSERT INTO `r_database_type` VALUES ('28', 'KINGBASEES', 'KingbaseES');
INSERT INTO `r_database_type` VALUES ('29', 'INTERBASE', 'Borland Interbase');
INSERT INTO `r_database_type` VALUES ('30', 'VERTICA5', 'Vertica 5+');
INSERT INTO `r_database_type` VALUES ('31', 'MSSQLNATIVE', 'MS SQL Server (Native)');
INSERT INTO `r_database_type` VALUES ('32', 'EXASOL4', 'Exasol 4');
INSERT INTO `r_database_type` VALUES ('33', 'EXTENDB', 'ExtenDB');
INSERT INTO `r_database_type` VALUES ('34', 'OpenERPDatabaseMeta', 'OpenERP Server');
INSERT INTO `r_database_type` VALUES ('35', 'UNIVERSE', 'UniVerse database');
INSERT INTO `r_database_type` VALUES ('36', 'NEOVIEW', 'Neoview');
INSERT INTO `r_database_type` VALUES ('37', 'LucidDB', 'LucidDB');
INSERT INTO `r_database_type` VALUES ('38', 'SAPDB', 'MaxDB (SAP DB)');
INSERT INTO `r_database_type` VALUES ('39', 'VERTICA', 'Vertica');
INSERT INTO `r_database_type` VALUES ('40', 'DBASE', 'dBase III, IV or 5');
INSERT INTO `r_database_type` VALUES ('41', 'H2', 'H2');
INSERT INTO `r_database_type` VALUES ('42', 'VECTORWISE', 'Ingres VectorWise');
INSERT INTO `r_database_type` VALUES ('43', 'SYBASE', 'Sybase');
INSERT INTO `r_database_type` VALUES ('44', 'ORACLE', 'Oracle');
INSERT INTO `r_database_type` VALUES ('45', 'MONDRIAN', 'Native Mondrian');
INSERT INTO `r_database_type` VALUES ('46', 'NETEZZA', 'Netezza');
INSERT INTO `r_database_type` VALUES ('47', 'IMPALA', 'Impala');
INSERT INTO `r_database_type` VALUES ('48', 'KettleThin', 'Pentaho Data Services');
INSERT INTO `r_database_type` VALUES ('49', 'GREENPLUM', 'Greenplum');
INSERT INTO `r_database_type` VALUES ('50', 'MONETDB', 'MonetDB');
INSERT INTO `r_directory` VALUES ('1', '0', 'file01');
INSERT INTO `r_directory` VALUES ('2', '0', 'file02');
INSERT INTO `r_directory` VALUES ('3', '2', 'myfile');
INSERT INTO `r_job` VALUES ('1', '0', 'job01', null, null, null, '0', '-1', null, '-', '2016-06-27 09:31:54', 'admin', '2016-06-27 10:38:23', '1', '0', '1', null);
INSERT INTO `r_job` VALUES ('2', '3', 'job02', null, null, null, '0', '-1', null, '-', '2016-06-27 09:32:34', 'admin', '2016-06-27 10:31:20', '1', '0', '1', null);
INSERT INTO `r_job_attribute` VALUES ('166', '2', '0', 'LOG_SIZE_LIMIT', '0', null);
INSERT INTO `r_job_attribute` VALUES ('167', '2', '0', 'JOB_LOG_TABLE_CONNECTION_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('168', '2', '0', 'JOB_LOG_TABLE_SCHEMA_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('169', '2', '0', 'JOB_LOG_TABLE_TABLE_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('170', '2', '0', 'JOB_LOG_TABLE_TIMEOUT_IN_DAYS', '0', null);
INSERT INTO `r_job_attribute` VALUES ('171', '2', '0', 'JOB_LOG_TABLE_FIELD_ID0', '0', 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES ('172', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME0', '0', 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES ('173', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED0', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('174', '2', '0', 'JOB_LOG_TABLE_FIELD_ID1', '0', 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('175', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME1', '0', 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('176', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED1', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('177', '2', '0', 'JOB_LOG_TABLE_FIELD_ID2', '0', 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES ('178', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME2', '0', 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES ('179', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED2', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('180', '2', '0', 'JOB_LOG_TABLE_FIELD_ID3', '0', 'STATUS');
INSERT INTO `r_job_attribute` VALUES ('181', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME3', '0', 'STATUS');
INSERT INTO `r_job_attribute` VALUES ('182', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED3', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('183', '2', '0', 'JOB_LOG_TABLE_FIELD_ID4', '0', 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES ('184', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME4', '0', 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES ('185', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED4', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('186', '2', '0', 'JOB_LOG_TABLE_FIELD_ID5', '0', 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES ('187', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME5', '0', 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES ('188', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED5', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('189', '2', '0', 'JOB_LOG_TABLE_FIELD_ID6', '0', 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES ('190', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME6', '0', 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES ('191', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED6', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('192', '2', '0', 'JOB_LOG_TABLE_FIELD_ID7', '0', 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES ('193', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME7', '0', 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES ('194', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED7', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('195', '2', '0', 'JOB_LOG_TABLE_FIELD_ID8', '0', 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES ('196', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME8', '0', 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES ('197', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED8', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('198', '2', '0', 'JOB_LOG_TABLE_FIELD_ID9', '0', 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES ('199', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME9', '0', 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES ('200', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED9', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('201', '2', '0', 'JOB_LOG_TABLE_FIELD_ID10', '0', 'ERRORS');
INSERT INTO `r_job_attribute` VALUES ('202', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME10', '0', 'ERRORS');
INSERT INTO `r_job_attribute` VALUES ('203', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED10', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('204', '2', '0', 'JOB_LOG_TABLE_FIELD_ID11', '0', 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES ('205', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME11', '0', 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES ('206', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED11', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('207', '2', '0', 'JOB_LOG_TABLE_FIELD_ID12', '0', 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES ('208', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME12', '0', 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES ('209', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED12', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('210', '2', '0', 'JOB_LOG_TABLE_FIELD_ID13', '0', 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES ('211', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME13', '0', 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES ('212', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED13', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('213', '2', '0', 'JOB_LOG_TABLE_FIELD_ID14', '0', 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES ('214', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME14', '0', 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES ('215', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED14', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('216', '2', '0', 'JOB_LOG_TABLE_FIELD_ID15', '0', 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES ('217', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME15', '0', 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES ('218', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED15', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('219', '2', '0', 'JOB_LOG_TABLE_FIELD_ID16', '0', 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES ('220', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME16', '0', 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES ('221', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED16', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('222', '2', '0', 'JOB_LOG_TABLE_FIELD_ID17', '0', 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES ('223', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME17', '0', 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES ('224', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED17', '0', 'N');
INSERT INTO `r_job_attribute` VALUES ('225', '2', '0', 'JOB_LOG_TABLE_FIELD_ID18', '0', 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES ('226', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME18', '0', 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES ('227', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED18', '0', 'N');
INSERT INTO `r_job_attribute` VALUES ('228', '2', '0', 'JOB_LOG_TABLE_FIELD_ID19', '0', 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES ('229', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME19', '0', 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES ('230', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED19', '0', 'N');
INSERT INTO `r_job_attribute` VALUES ('231', '2', '0', 'JOB_LOG_TABLE_FIELD_ID20', '0', 'CLIENT');
INSERT INTO `r_job_attribute` VALUES ('232', '2', '0', 'JOB_LOG_TABLE_FIELD_NAME20', '0', 'CLIENT');
INSERT INTO `r_job_attribute` VALUES ('233', '2', '0', 'JOB_LOG_TABLE_FIELD_ENABLED20', '0', 'N');
INSERT INTO `r_job_attribute` VALUES ('234', '2', '0', 'JOBLOG_TABLE_INTERVAL', '0', null);
INSERT INTO `r_job_attribute` VALUES ('235', '2', '0', 'JOBLOG_TABLE_SIZE_LIMIT', '0', null);
INSERT INTO `r_job_attribute` VALUES ('236', '2', '0', 'JOB_ENTRY_LOG_TABLE_CONNECTION_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('237', '2', '0', 'JOB_ENTRY_LOG_TABLE_SCHEMA_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('238', '2', '0', 'JOB_ENTRY_LOG_TABLE_TABLE_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('239', '2', '0', 'JOB_ENTRY_LOG_TABLE_TIMEOUT_IN_DAYS', '0', null);
INSERT INTO `r_job_attribute` VALUES ('240', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID0', '0', 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES ('241', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME0', '0', 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES ('242', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED0', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('243', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID1', '0', 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('244', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME1', '0', 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('245', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED1', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('246', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID2', '0', 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES ('247', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME2', '0', 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES ('248', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED2', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('249', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID3', '0', 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES ('250', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME3', '0', 'TRANSNAME');
INSERT INTO `r_job_attribute` VALUES ('251', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED3', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('252', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID4', '0', 'JOBENTRYNAME');
INSERT INTO `r_job_attribute` VALUES ('253', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME4', '0', 'STEPNAME');
INSERT INTO `r_job_attribute` VALUES ('254', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED4', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('255', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID5', '0', 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES ('256', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME5', '0', 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES ('257', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED5', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('258', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID6', '0', 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES ('259', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME6', '0', 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES ('260', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED6', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('261', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID7', '0', 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES ('262', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME7', '0', 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES ('263', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED7', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('264', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID8', '0', 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES ('265', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME8', '0', 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES ('266', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED8', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('267', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID9', '0', 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES ('268', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME9', '0', 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES ('269', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED9', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('270', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID10', '0', 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES ('271', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME10', '0', 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES ('272', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED10', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('273', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID11', '0', 'ERRORS');
INSERT INTO `r_job_attribute` VALUES ('274', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME11', '0', 'ERRORS');
INSERT INTO `r_job_attribute` VALUES ('275', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED11', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('276', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID12', '0', 'RESULT');
INSERT INTO `r_job_attribute` VALUES ('277', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME12', '0', 'RESULT');
INSERT INTO `r_job_attribute` VALUES ('278', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED12', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('279', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID13', '0', 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES ('280', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME13', '0', 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES ('281', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED13', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('282', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID14', '0', 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES ('283', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME14', '0', 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES ('284', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED14', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('285', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID15', '0', 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES ('286', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME15', '0', 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES ('287', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED15', '0', 'N');
INSERT INTO `r_job_attribute` VALUES ('288', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID16', '0', 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES ('289', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME16', '0', 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES ('290', '2', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED16', '0', 'N');
INSERT INTO `r_job_attribute` VALUES ('291', '2', '0', 'CHANNEL_LOG_TABLE_CONNECTION_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('292', '2', '0', 'CHANNEL_LOG_TABLE_SCHEMA_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('293', '2', '0', 'CHANNEL_LOG_TABLE_TABLE_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('294', '2', '0', 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', '0', null);
INSERT INTO `r_job_attribute` VALUES ('295', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID0', '0', 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES ('296', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME0', '0', 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES ('297', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('298', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID1', '0', 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('299', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME1', '0', 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('300', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('301', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID2', '0', 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES ('302', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME2', '0', 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES ('303', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('304', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID3', '0', 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES ('305', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME3', '0', 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES ('306', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('307', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID4', '0', 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES ('308', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME4', '0', 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES ('309', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('310', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID5', '0', 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES ('311', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME5', '0', 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES ('312', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('313', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID6', '0', 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES ('314', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME6', '0', 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES ('315', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('316', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID7', '0', 'FILENAME');
INSERT INTO `r_job_attribute` VALUES ('317', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME7', '0', 'FILENAME');
INSERT INTO `r_job_attribute` VALUES ('318', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('319', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID8', '0', 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES ('320', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME8', '0', 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES ('321', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('322', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID9', '0', 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES ('323', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME9', '0', 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES ('324', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('325', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID10', '0', 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('326', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME10', '0', 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('327', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('328', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID11', '0', 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('329', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME11', '0', 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('330', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('331', '1', '0', 'LOG_SIZE_LIMIT', '0', null);
INSERT INTO `r_job_attribute` VALUES ('332', '1', '0', 'JOB_LOG_TABLE_CONNECTION_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('333', '1', '0', 'JOB_LOG_TABLE_SCHEMA_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('334', '1', '0', 'JOB_LOG_TABLE_TABLE_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('335', '1', '0', 'JOB_LOG_TABLE_TIMEOUT_IN_DAYS', '0', null);
INSERT INTO `r_job_attribute` VALUES ('336', '1', '0', 'JOB_LOG_TABLE_FIELD_ID0', '0', 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES ('337', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME0', '0', 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES ('338', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED0', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('339', '1', '0', 'JOB_LOG_TABLE_FIELD_ID1', '0', 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('340', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME1', '0', 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('341', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED1', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('342', '1', '0', 'JOB_LOG_TABLE_FIELD_ID2', '0', 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES ('343', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME2', '0', 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES ('344', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED2', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('345', '1', '0', 'JOB_LOG_TABLE_FIELD_ID3', '0', 'STATUS');
INSERT INTO `r_job_attribute` VALUES ('346', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME3', '0', 'STATUS');
INSERT INTO `r_job_attribute` VALUES ('347', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED3', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('348', '1', '0', 'JOB_LOG_TABLE_FIELD_ID4', '0', 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES ('349', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME4', '0', 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES ('350', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED4', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('351', '1', '0', 'JOB_LOG_TABLE_FIELD_ID5', '0', 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES ('352', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME5', '0', 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES ('353', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED5', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('354', '1', '0', 'JOB_LOG_TABLE_FIELD_ID6', '0', 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES ('355', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME6', '0', 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES ('356', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED6', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('357', '1', '0', 'JOB_LOG_TABLE_FIELD_ID7', '0', 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES ('358', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME7', '0', 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES ('359', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED7', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('360', '1', '0', 'JOB_LOG_TABLE_FIELD_ID8', '0', 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES ('361', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME8', '0', 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES ('362', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED8', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('363', '1', '0', 'JOB_LOG_TABLE_FIELD_ID9', '0', 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES ('364', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME9', '0', 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES ('365', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED9', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('366', '1', '0', 'JOB_LOG_TABLE_FIELD_ID10', '0', 'ERRORS');
INSERT INTO `r_job_attribute` VALUES ('367', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME10', '0', 'ERRORS');
INSERT INTO `r_job_attribute` VALUES ('368', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED10', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('369', '1', '0', 'JOB_LOG_TABLE_FIELD_ID11', '0', 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES ('370', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME11', '0', 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES ('371', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED11', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('372', '1', '0', 'JOB_LOG_TABLE_FIELD_ID12', '0', 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES ('373', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME12', '0', 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES ('374', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED12', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('375', '1', '0', 'JOB_LOG_TABLE_FIELD_ID13', '0', 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES ('376', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME13', '0', 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES ('377', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED13', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('378', '1', '0', 'JOB_LOG_TABLE_FIELD_ID14', '0', 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES ('379', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME14', '0', 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES ('380', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED14', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('381', '1', '0', 'JOB_LOG_TABLE_FIELD_ID15', '0', 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES ('382', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME15', '0', 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES ('383', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED15', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('384', '1', '0', 'JOB_LOG_TABLE_FIELD_ID16', '0', 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES ('385', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME16', '0', 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES ('386', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED16', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('387', '1', '0', 'JOB_LOG_TABLE_FIELD_ID17', '0', 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES ('388', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME17', '0', 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES ('389', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED17', '0', 'N');
INSERT INTO `r_job_attribute` VALUES ('390', '1', '0', 'JOB_LOG_TABLE_FIELD_ID18', '0', 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES ('391', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME18', '0', 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES ('392', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED18', '0', 'N');
INSERT INTO `r_job_attribute` VALUES ('393', '1', '0', 'JOB_LOG_TABLE_FIELD_ID19', '0', 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES ('394', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME19', '0', 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES ('395', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED19', '0', 'N');
INSERT INTO `r_job_attribute` VALUES ('396', '1', '0', 'JOB_LOG_TABLE_FIELD_ID20', '0', 'CLIENT');
INSERT INTO `r_job_attribute` VALUES ('397', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME20', '0', 'CLIENT');
INSERT INTO `r_job_attribute` VALUES ('398', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED20', '0', 'N');
INSERT INTO `r_job_attribute` VALUES ('399', '1', '0', 'JOBLOG_TABLE_INTERVAL', '0', null);
INSERT INTO `r_job_attribute` VALUES ('400', '1', '0', 'JOBLOG_TABLE_SIZE_LIMIT', '0', null);
INSERT INTO `r_job_attribute` VALUES ('401', '1', '0', 'JOB_ENTRY_LOG_TABLE_CONNECTION_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('402', '1', '0', 'JOB_ENTRY_LOG_TABLE_SCHEMA_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('403', '1', '0', 'JOB_ENTRY_LOG_TABLE_TABLE_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('404', '1', '0', 'JOB_ENTRY_LOG_TABLE_TIMEOUT_IN_DAYS', '0', null);
INSERT INTO `r_job_attribute` VALUES ('405', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID0', '0', 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES ('406', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME0', '0', 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES ('407', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED0', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('408', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID1', '0', 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('409', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME1', '0', 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('410', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED1', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('411', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID2', '0', 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES ('412', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME2', '0', 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES ('413', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED2', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('414', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID3', '0', 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES ('415', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME3', '0', 'TRANSNAME');
INSERT INTO `r_job_attribute` VALUES ('416', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED3', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('417', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID4', '0', 'JOBENTRYNAME');
INSERT INTO `r_job_attribute` VALUES ('418', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME4', '0', 'STEPNAME');
INSERT INTO `r_job_attribute` VALUES ('419', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED4', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('420', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID5', '0', 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES ('421', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME5', '0', 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES ('422', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED5', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('423', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID6', '0', 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES ('424', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME6', '0', 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES ('425', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED6', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('426', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID7', '0', 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES ('427', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME7', '0', 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES ('428', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED7', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('429', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID8', '0', 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES ('430', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME8', '0', 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES ('431', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED8', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('432', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID9', '0', 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES ('433', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME9', '0', 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES ('434', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED9', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('435', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID10', '0', 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES ('436', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME10', '0', 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES ('437', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED10', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('438', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID11', '0', 'ERRORS');
INSERT INTO `r_job_attribute` VALUES ('439', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME11', '0', 'ERRORS');
INSERT INTO `r_job_attribute` VALUES ('440', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED11', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('441', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID12', '0', 'RESULT');
INSERT INTO `r_job_attribute` VALUES ('442', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME12', '0', 'RESULT');
INSERT INTO `r_job_attribute` VALUES ('443', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED12', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('444', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID13', '0', 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES ('445', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME13', '0', 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES ('446', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED13', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('447', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID14', '0', 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES ('448', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME14', '0', 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES ('449', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED14', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('450', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID15', '0', 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES ('451', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME15', '0', 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES ('452', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED15', '0', 'N');
INSERT INTO `r_job_attribute` VALUES ('453', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID16', '0', 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES ('454', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME16', '0', 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES ('455', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED16', '0', 'N');
INSERT INTO `r_job_attribute` VALUES ('456', '1', '0', 'CHANNEL_LOG_TABLE_CONNECTION_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('457', '1', '0', 'CHANNEL_LOG_TABLE_SCHEMA_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('458', '1', '0', 'CHANNEL_LOG_TABLE_TABLE_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('459', '1', '0', 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', '0', null);
INSERT INTO `r_job_attribute` VALUES ('460', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID0', '0', 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES ('461', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME0', '0', 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES ('462', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('463', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID1', '0', 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('464', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME1', '0', 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('465', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('466', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID2', '0', 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES ('467', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME2', '0', 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES ('468', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('469', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID3', '0', 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES ('470', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME3', '0', 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES ('471', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('472', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID4', '0', 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES ('473', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME4', '0', 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES ('474', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('475', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID5', '0', 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES ('476', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME5', '0', 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES ('477', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('478', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID6', '0', 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES ('479', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME6', '0', 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES ('480', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('481', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID7', '0', 'FILENAME');
INSERT INTO `r_job_attribute` VALUES ('482', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME7', '0', 'FILENAME');
INSERT INTO `r_job_attribute` VALUES ('483', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('484', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID8', '0', 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES ('485', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME8', '0', 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES ('486', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('487', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID9', '0', 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES ('488', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME9', '0', 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES ('489', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('490', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID10', '0', 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('491', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME10', '0', 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('492', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('493', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID11', '0', 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('494', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME11', '0', 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('495', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', '0', 'Y');
INSERT INTO `r_job_hop` VALUES ('2', '2', '3', '4', '1', '1', '1');
INSERT INTO `r_job_hop` VALUES ('3', '1', '5', '7', '1', '1', '1');
INSERT INTO `r_job_hop` VALUES ('4', '1', '7', '6', '1', '1', '0');
INSERT INTO `r_jobentry` VALUES ('3', '2', '74', 'START', null);
INSERT INTO `r_jobentry` VALUES ('4', '2', '21', '成功', null);
INSERT INTO `r_jobentry` VALUES ('5', '1', '74', 'START', null);
INSERT INTO `r_jobentry` VALUES ('6', '1', '21', '成功', null);
INSERT INTO `r_jobentry` VALUES ('7', '1', '18', 'tran01', null);
INSERT INTO `r_jobentry_attribute` VALUES ('11', '2', '3', '0', 'start', '0', 'Y');
INSERT INTO `r_jobentry_attribute` VALUES ('12', '2', '3', '0', 'dummy', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('13', '2', '3', '0', 'repeat', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('14', '2', '3', '0', 'schedulerType', '0', null);
INSERT INTO `r_jobentry_attribute` VALUES ('15', '2', '3', '0', 'intervalSeconds', '0', null);
INSERT INTO `r_jobentry_attribute` VALUES ('16', '2', '3', '0', 'intervalMinutes', '60', null);
INSERT INTO `r_jobentry_attribute` VALUES ('17', '2', '3', '0', 'hour', '12', null);
INSERT INTO `r_jobentry_attribute` VALUES ('18', '2', '3', '0', 'minutes', '0', null);
INSERT INTO `r_jobentry_attribute` VALUES ('19', '2', '3', '0', 'weekDay', '1', null);
INSERT INTO `r_jobentry_attribute` VALUES ('20', '2', '3', '0', 'dayOfMonth', '1', null);
INSERT INTO `r_jobentry_attribute` VALUES ('21', '1', '5', '0', 'start', '0', 'Y');
INSERT INTO `r_jobentry_attribute` VALUES ('22', '1', '5', '0', 'dummy', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('23', '1', '5', '0', 'repeat', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('24', '1', '5', '0', 'schedulerType', '0', null);
INSERT INTO `r_jobentry_attribute` VALUES ('25', '1', '5', '0', 'intervalSeconds', '0', null);
INSERT INTO `r_jobentry_attribute` VALUES ('26', '1', '5', '0', 'intervalMinutes', '60', null);
INSERT INTO `r_jobentry_attribute` VALUES ('27', '1', '5', '0', 'hour', '12', null);
INSERT INTO `r_jobentry_attribute` VALUES ('28', '1', '5', '0', 'minutes', '0', null);
INSERT INTO `r_jobentry_attribute` VALUES ('29', '1', '5', '0', 'weekDay', '1', null);
INSERT INTO `r_jobentry_attribute` VALUES ('30', '1', '5', '0', 'dayOfMonth', '1', null);
INSERT INTO `r_jobentry_attribute` VALUES ('31', '1', '7', '0', 'specification_method', '0', 'rep_name');
INSERT INTO `r_jobentry_attribute` VALUES ('32', '1', '7', '0', 'trans_object_id', '0', null);
INSERT INTO `r_jobentry_attribute` VALUES ('33', '1', '7', '0', 'name', '0', 'tran01');
INSERT INTO `r_jobentry_attribute` VALUES ('34', '1', '7', '0', 'dir_path', '0', '/');
INSERT INTO `r_jobentry_attribute` VALUES ('35', '1', '7', '0', 'file_name', '0', null);
INSERT INTO `r_jobentry_attribute` VALUES ('36', '1', '7', '0', 'arg_from_previous', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('37', '1', '7', '0', 'params_from_previous', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('38', '1', '7', '0', 'exec_per_row', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('39', '1', '7', '0', 'clear_rows', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('40', '1', '7', '0', 'clear_files', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('41', '1', '7', '0', 'set_logfile', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('42', '1', '7', '0', 'add_date', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('43', '1', '7', '0', 'add_time', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('44', '1', '7', '0', 'logfile', '0', null);
INSERT INTO `r_jobentry_attribute` VALUES ('45', '1', '7', '0', 'logext', '0', null);
INSERT INTO `r_jobentry_attribute` VALUES ('46', '1', '7', '0', 'loglevel', '0', 'Basic');
INSERT INTO `r_jobentry_attribute` VALUES ('47', '1', '7', '0', 'cluster', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('48', '1', '7', '0', 'slave_server_name', '0', null);
INSERT INTO `r_jobentry_attribute` VALUES ('49', '1', '7', '0', 'set_append_logfile', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('50', '1', '7', '0', 'wait_until_finished', '0', 'Y');
INSERT INTO `r_jobentry_attribute` VALUES ('51', '1', '7', '0', 'follow_abort_remote', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('52', '1', '7', '0', 'create_parent_folder', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('53', '1', '7', '0', 'logging_remote_work', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('54', '1', '7', '0', 'pass_all_parameters', '0', 'Y');
INSERT INTO `r_jobentry_copy` VALUES ('3', '3', '2', '74', '0', '224', '160', '1', '0');
INSERT INTO `r_jobentry_copy` VALUES ('4', '4', '2', '21', '0', '640', '144', '1', '0');
INSERT INTO `r_jobentry_copy` VALUES ('5', '5', '1', '74', '0', '192', '224', '1', '0');
INSERT INTO `r_jobentry_copy` VALUES ('6', '6', '1', '21', '0', '352', '224', '1', '0');
INSERT INTO `r_jobentry_copy` VALUES ('7', '7', '1', '18', '0', '272', '336', '1', '0');
INSERT INTO `r_jobentry_type` VALUES ('1', 'DELAY', '等待');
INSERT INTO `r_jobentry_type` VALUES ('2', 'HTTP', 'HTTP');
INSERT INTO `r_jobentry_type` VALUES ('3', 'UNZIP', '解压缩文件');
INSERT INTO `r_jobentry_type` VALUES ('4', 'FILES_EXIST', '检查多个文件是否存在');
INSERT INTO `r_jobentry_type` VALUES ('5', 'HL7MLLPInput', 'HL7 MLLP Input');
INSERT INTO `r_jobentry_type` VALUES ('6', 'DataRefineryBuildModel', 'Build Model');
INSERT INTO `r_jobentry_type` VALUES ('7', 'GET_POP', 'POP 收信');
INSERT INTO `r_jobentry_type` VALUES ('8', 'MAIL', '发送邮件');
INSERT INTO `r_jobentry_type` VALUES ('9', 'EMRJobExecutorPlugin', 'Amazon EMR Job Executor');
INSERT INTO `r_jobentry_type` VALUES ('10', 'WRITE_TO_FILE', '写入文件');
INSERT INTO `r_jobentry_type` VALUES ('11', 'EVAL_FILES_METRICS', '计算文件大小或个数');
INSERT INTO `r_jobentry_type` VALUES ('12', 'HadoopTransJobExecutorPlugin', 'Pentaho MapReduce');
INSERT INTO `r_jobentry_type` VALUES ('13', 'FILE_EXISTS', '检查一个文件是否存在');
INSERT INTO `r_jobentry_type` VALUES ('14', 'WAIT_FOR_SQL', '等待SQL');
INSERT INTO `r_jobentry_type` VALUES ('15', 'SFTP', 'SFTP 下载');
INSERT INTO `r_jobentry_type` VALUES ('16', 'SET_VARIABLES', '设置变量');
INSERT INTO `r_jobentry_type` VALUES ('17', 'MS_ACCESS_BULK_LOAD', 'MS Access Bulk Load');
INSERT INTO `r_jobentry_type` VALUES ('18', 'TRANS', '转换');
INSERT INTO `r_jobentry_type` VALUES ('19', 'XML_WELL_FORMED', 'Check if XML file is well formed');
INSERT INTO `r_jobentry_type` VALUES ('20', 'SEND_NAGIOS_PASSIVE_CHECK', '发送Nagios 被动检查');
INSERT INTO `r_jobentry_type` VALUES ('21', 'SUCCESS', '成功');
INSERT INTO `r_jobentry_type` VALUES ('22', 'FTP_DELETE', 'FTP 删除');
INSERT INTO `r_jobentry_type` VALUES ('23', 'SQL', 'SQL');
INSERT INTO `r_jobentry_type` VALUES ('24', 'HiveJobExecutorPlugin', 'Amazon Hive Job Executor');
INSERT INTO `r_jobentry_type` VALUES ('25', 'EVAL_TABLE_CONTENT', '计算表中的记录数');
INSERT INTO `r_jobentry_type` VALUES ('26', 'PALO_CUBE_CREATE', 'Palo Cube Create');
INSERT INTO `r_jobentry_type` VALUES ('27', 'SqoopExport', 'Sqoop Export');
INSERT INTO `r_jobentry_type` VALUES ('28', 'COPY_FILES', '复制文件');
INSERT INTO `r_jobentry_type` VALUES ('29', 'DELETE_FILE', '删除一个文件');
INSERT INTO `r_jobentry_type` VALUES ('30', 'MOVE_FILES', '移动文件');
INSERT INTO `r_jobentry_type` VALUES ('31', 'CONNECTED_TO_REPOSITORY', '检查是否连接到资源库');
INSERT INTO `r_jobentry_type` VALUES ('32', 'MSGBOX_INFO', '显示消息对话框');
INSERT INTO `r_jobentry_type` VALUES ('33', 'PALO_CUBE_DELETE', 'Palo Cube Delete');
INSERT INTO `r_jobentry_type` VALUES ('34', 'FTPS_GET', 'FTPS 下载');
INSERT INTO `r_jobentry_type` VALUES ('35', 'DATASOURCE_PUBLISH', 'Publish Model');
INSERT INTO `r_jobentry_type` VALUES ('36', 'EXPORT_REPOSITORY', '导出资源库到XML文件');
INSERT INTO `r_jobentry_type` VALUES ('37', 'PGP_VERIFY_FILES', '用PGP验证文件签名');
INSERT INTO `r_jobentry_type` VALUES ('38', 'TELNET', '远程登录一台主机');
INSERT INTO `r_jobentry_type` VALUES ('39', 'ABORT', '中止作业');
INSERT INTO `r_jobentry_type` VALUES ('40', 'DELETE_RESULT_FILENAMES', '从结果文件中删除文件');
INSERT INTO `r_jobentry_type` VALUES ('41', 'CHECK_FILES_LOCKED', '检查文件是否被锁');
INSERT INTO `r_jobentry_type` VALUES ('42', 'DELETE_FOLDERS', '删除目录');
INSERT INTO `r_jobentry_type` VALUES ('43', 'FILE_COMPARE', '比较文件');
INSERT INTO `r_jobentry_type` VALUES ('44', 'SIMPLE_EVAL', '检验字段的值');
INSERT INTO `r_jobentry_type` VALUES ('45', 'WRITE_TO_LOG', '写日志');
INSERT INTO `r_jobentry_type` VALUES ('46', 'WAIT_FOR_FILE', '等待文件');
INSERT INTO `r_jobentry_type` VALUES ('47', 'TRUNCATE_TABLES', '清空表');
INSERT INTO `r_jobentry_type` VALUES ('48', 'CHECK_DB_CONNECTIONS', '检查数据库连接');
INSERT INTO `r_jobentry_type` VALUES ('49', 'SparkSubmit', 'Spark Submit');
INSERT INTO `r_jobentry_type` VALUES ('50', 'ZIP_FILE', 'Zip 压缩文件');
INSERT INTO `r_jobentry_type` VALUES ('51', 'COPY_MOVE_RESULT_FILENAMES', '复制/移动结果文件');
INSERT INTO `r_jobentry_type` VALUES ('52', 'HadoopCopyFilesPlugin', 'Hadoop Copy Files');
INSERT INTO `r_jobentry_type` VALUES ('53', 'FTP_PUT', 'FTP 上传');
INSERT INTO `r_jobentry_type` VALUES ('54', 'JOB', '作业');
INSERT INTO `r_jobentry_type` VALUES ('55', 'OozieJobExecutor', 'Oozie Job Executor');
INSERT INTO `r_jobentry_type` VALUES ('56', 'WEBSERVICE_AVAILABLE', '检查web服务是否可用');
INSERT INTO `r_jobentry_type` VALUES ('57', 'DummyJob', 'Example Job');
INSERT INTO `r_jobentry_type` VALUES ('58', 'TALEND_JOB_EXEC', 'Talend 作业执行');
INSERT INTO `r_jobentry_type` VALUES ('59', 'MSSQL_BULK_LOAD', 'SQLServer 批量加载');
INSERT INTO `r_jobentry_type` VALUES ('60', 'FOLDER_IS_EMPTY', '检查目录是否为空');
INSERT INTO `r_jobentry_type` VALUES ('61', 'HadoopJobExecutorPlugin', 'Hadoop Job Executor ');
INSERT INTO `r_jobentry_type` VALUES ('62', 'MAIL_VALIDATOR', '邮件验证');
INSERT INTO `r_jobentry_type` VALUES ('63', 'HL7MLLPAcknowledge', 'HL7 MLLP Acknowledge');
INSERT INTO `r_jobentry_type` VALUES ('64', 'HadoopPigScriptExecutorPlugin', 'Pig Script Executor');
INSERT INTO `r_jobentry_type` VALUES ('65', 'CREATE_FOLDER', '创建一个目录');
INSERT INTO `r_jobentry_type` VALUES ('66', 'DELETE_FILES', '删除多个文件');
INSERT INTO `r_jobentry_type` VALUES ('67', 'SHELL', 'Shell');
INSERT INTO `r_jobentry_type` VALUES ('68', 'ADD_RESULT_FILENAMES', '添加文件到结果文件中');
INSERT INTO `r_jobentry_type` VALUES ('69', 'XSD_VALIDATOR', 'XSD Validator');
INSERT INTO `r_jobentry_type` VALUES ('70', 'PING', 'Ping 一台主机');
INSERT INTO `r_jobentry_type` VALUES ('71', 'FTP', 'FTP 下载');
INSERT INTO `r_jobentry_type` VALUES ('72', 'MYSQL_BULK_FILE', '从 Mysql 批量导出到文件');
INSERT INTO `r_jobentry_type` VALUES ('73', 'XSLT', 'XSL Transformation');
INSERT INTO `r_jobentry_type` VALUES ('74', 'SPECIAL', '特殊作业项');
INSERT INTO `r_jobentry_type` VALUES ('75', 'EVAL', '使用 JavaScript 脚本验证');
INSERT INTO `r_jobentry_type` VALUES ('76', 'COLUMNS_EXIST', '检查列是否存在');
INSERT INTO `r_jobentry_type` VALUES ('77', 'SqoopImport', 'Sqoop Import');
INSERT INTO `r_jobentry_type` VALUES ('78', 'DOS_UNIX_CONVERTER', 'DOS和UNIX之间的文本转换');
INSERT INTO `r_jobentry_type` VALUES ('79', 'CREATE_FILE', '创建文件');
INSERT INTO `r_jobentry_type` VALUES ('80', 'PGP_DECRYPT_FILES', '用PGP解密文件');
INSERT INTO `r_jobentry_type` VALUES ('81', 'SYSLOG', '用 Syslog 发送信息');
INSERT INTO `r_jobentry_type` VALUES ('82', 'FOLDERS_COMPARE', '比较目录');
INSERT INTO `r_jobentry_type` VALUES ('83', 'FTPS_PUT', 'FTPS 上传');
INSERT INTO `r_jobentry_type` VALUES ('84', 'SFTPPUT', 'SFTP 上传');
INSERT INTO `r_jobentry_type` VALUES ('85', 'DTD_VALIDATOR', 'DTD Validator');
INSERT INTO `r_jobentry_type` VALUES ('86', 'SNMP_TRAP', '发送 SNMP 自陷');
INSERT INTO `r_jobentry_type` VALUES ('87', 'TABLE_EXISTS', '检查表是否存在');
INSERT INTO `r_jobentry_type` VALUES ('88', 'MYSQL_BULK_LOAD', 'Mysql 批量加载');
INSERT INTO `r_jobentry_type` VALUES ('89', 'PGP_ENCRYPT_FILES', '用PGP加密文件');
INSERT INTO `r_loglevel` VALUES ('1', 'Error', '错误日志');
INSERT INTO `r_loglevel` VALUES ('2', 'Minimal', '最小日志');
INSERT INTO `r_loglevel` VALUES ('3', 'Basic', '基本日志');
INSERT INTO `r_loglevel` VALUES ('4', 'Detailed', '详细日志');
INSERT INTO `r_loglevel` VALUES ('5', 'Debug', '调试');
INSERT INTO `r_loglevel` VALUES ('6', 'Rowlevel', '行级日志(非常详细)');
INSERT INTO `r_repository_log` VALUES ('1', '5.0', '2016-06-24 10:16:28', 'admin', 'Creation of the Kettle repository');
INSERT INTO `r_repository_log` VALUES ('2', '5.0', '2016-06-24 13:04:47', 'admin', 'Upgrade of the Kettle repository');
INSERT INTO `r_repository_log` VALUES ('3', '5.0', '2016-06-27 09:31:01', 'admin', 'Upgrade of the Kettle repository');
INSERT INTO `r_repository_log` VALUES ('4', '5.0', '2016-06-27 09:32:02', 'admin', 'save job \'job01\'');
INSERT INTO `r_repository_log` VALUES ('5', '5.0', '2016-06-27 09:32:12', 'admin', 'save job \'job01\'');
INSERT INTO `r_repository_log` VALUES ('6', '5.0', '2016-06-27 09:32:14', 'admin', 'save job \'job01\'');
INSERT INTO `r_repository_log` VALUES ('7', '5.0', '2016-06-27 09:32:16', 'admin', 'save job \'job01\'');
INSERT INTO `r_repository_log` VALUES ('8', '5.0', '2016-06-27 09:32:29', 'admin', 'save transformation \'tran01\'');
INSERT INTO `r_repository_log` VALUES ('9', '5.0', '2016-06-27 09:32:30', 'admin', 'save transformation \'tran01\'');
INSERT INTO `r_repository_log` VALUES ('10', '5.0', '2016-06-27 09:32:49', 'admin', 'save job \'job02\'');
INSERT INTO `r_repository_log` VALUES ('11', '5.0', '2016-06-27 09:32:50', 'admin', 'save job \'job02\'');
INSERT INTO `r_repository_log` VALUES ('12', '5.0', '2016-06-27 09:32:57', 'admin', 'save job \'job02\'');
INSERT INTO `r_repository_log` VALUES ('13', '5.0', '2016-06-27 09:33:12', 'admin', 'save transformation \'tran02\'');
INSERT INTO `r_repository_log` VALUES ('14', '5.0', '2016-06-27 09:33:13', 'admin', 'save transformation \'tran02\'');
INSERT INTO `r_repository_log` VALUES ('15', '5.0', '2016-06-27 10:29:37', 'admin', 'save job \'job02\'');
INSERT INTO `r_repository_log` VALUES ('16', '5.0', '2016-06-27 10:31:20', 'admin', 'save job \'job02\'');
INSERT INTO `r_repository_log` VALUES ('17', '5.0', '2016-06-27 10:37:44', 'admin', 'save transformation \'tran01\'');
INSERT INTO `r_repository_log` VALUES ('18', '5.0', '2016-06-27 10:38:23', 'admin', 'save job \'job01\'');
INSERT INTO `r_repository_log` VALUES ('19', '5.0', '2016-06-27 10:41:17', 'admin', 'save transformation \'tran01\'');
INSERT INTO `r_repository_log` VALUES ('20', '5.0', '2016-06-27 10:41:40', 'admin', 'save transformation \'tran01\'');
INSERT INTO `r_repository_log` VALUES ('21', '5.0', '2016-06-27 10:42:25', 'admin', 'save transformation \'tran01\'');
INSERT INTO `r_repository_log` VALUES ('22', '5.0', '2016-06-27 10:43:13', 'admin', 'save transformation \'tran01\'');
INSERT INTO `r_repository_log` VALUES ('23', '5.0', '2016-06-27 10:54:21', 'admin', 'save transformation \'tran01\'');
INSERT INTO `r_repository_log` VALUES ('24', '5.0', '2016-06-27 11:08:36', 'admin', 'save transformation \'tran01\'');
INSERT INTO `r_repository_log` VALUES ('25', '5.0', '2016-06-27 12:03:06', 'admin', 'save transformation \'tran01\'');
INSERT INTO `r_repository_log` VALUES ('26', '5.0', '2016-06-27 12:07:26', 'admin', 'save transformation \'tran01\'');
INSERT INTO `r_repository_log` VALUES ('27', '5.0', '2016-06-27 12:07:40', 'admin', 'save transformation \'tran01\'');
INSERT INTO `r_repository_log` VALUES ('28', '5.0', '2016-06-27 12:08:02', 'admin', 'save transformation \'tran01\'');
INSERT INTO `r_repository_log` VALUES ('29', '5.0', '2016-06-27 12:08:41', 'admin', 'save transformation \'tran01\'');
INSERT INTO `r_repository_log` VALUES ('30', '5.0', '2016-06-27 12:09:45', 'admin', 'save transformation \'tran01\'');
INSERT INTO `r_step` VALUES ('1', '1', '文本文件输入', null, '67', '1', '1', '192', '208', '1', '1');
INSERT INTO `r_step` VALUES ('2', '1', '文本文件输出', null, '36', '1', '1', '304', '208', '1', '1');
INSERT INTO `r_step_attribute` VALUES ('1', '1', '1', '0', 'PARTITIONING_SCHEMA', '0', null);
INSERT INTO `r_step_attribute` VALUES ('2', '1', '1', '0', 'PARTITIONING_METHOD', '0', 'none');
INSERT INTO `r_step_attribute` VALUES ('3', '1', '1', '0', 'accept_filenames', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('4', '1', '1', '0', 'passing_through_fields', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('5', '1', '1', '0', 'accept_field', '0', null);
INSERT INTO `r_step_attribute` VALUES ('6', '1', '1', '0', 'accept_stepname', '0', null);
INSERT INTO `r_step_attribute` VALUES ('7', '1', '1', '0', 'separator', '0', ':');
INSERT INTO `r_step_attribute` VALUES ('8', '1', '1', '0', 'enclosure', '0', '\"');
INSERT INTO `r_step_attribute` VALUES ('9', '1', '1', '0', 'enclosure_breaks', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('10', '1', '1', '0', 'escapechar', '0', null);
INSERT INTO `r_step_attribute` VALUES ('11', '1', '1', '0', 'header', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('12', '1', '1', '0', 'nr_headerlines', '1', null);
INSERT INTO `r_step_attribute` VALUES ('13', '1', '1', '0', 'footer', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('14', '1', '1', '0', 'nr_footerlines', '1', null);
INSERT INTO `r_step_attribute` VALUES ('15', '1', '1', '0', 'line_wrapped', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('16', '1', '1', '0', 'nr_wraps', '1', null);
INSERT INTO `r_step_attribute` VALUES ('17', '1', '1', '0', 'layout_paged', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('18', '1', '1', '0', 'nr_lines_per_page', '80', null);
INSERT INTO `r_step_attribute` VALUES ('19', '1', '1', '0', 'nr_lines_doc_header', '0', null);
INSERT INTO `r_step_attribute` VALUES ('20', '1', '1', '0', 'noempty', '0', 'Y');
INSERT INTO `r_step_attribute` VALUES ('21', '1', '1', '0', 'include', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('22', '1', '1', '0', 'include_field', '0', null);
INSERT INTO `r_step_attribute` VALUES ('23', '1', '1', '0', 'rownum', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('24', '1', '1', '0', 'rownumByFile', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('25', '1', '1', '0', 'rownum_field', '0', null);
INSERT INTO `r_step_attribute` VALUES ('26', '1', '1', '0', 'format', '0', 'mixed');
INSERT INTO `r_step_attribute` VALUES ('27', '1', '1', '0', 'encoding', '0', 'UTF-8');
INSERT INTO `r_step_attribute` VALUES ('28', '1', '1', '0', 'add_to_result_filenames', '0', 'Y');
INSERT INTO `r_step_attribute` VALUES ('29', '1', '1', '0', 'limit', '0', null);
INSERT INTO `r_step_attribute` VALUES ('30', '1', '1', '0', 'file_name', '0', 'D:\\pdi-ce-6.1.0.1-196\\log.txt');
INSERT INTO `r_step_attribute` VALUES ('31', '1', '1', '0', 'file_mask', '0', null);
INSERT INTO `r_step_attribute` VALUES ('32', '1', '1', '0', 'exclude_file_mask', '0', null);
INSERT INTO `r_step_attribute` VALUES ('33', '1', '1', '0', 'file_required', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('34', '1', '1', '0', 'include_subfolders', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('35', '1', '1', '0', 'file_type', '0', 'CSV');
INSERT INTO `r_step_attribute` VALUES ('36', '1', '1', '0', 'compression', '0', 'None');
INSERT INTO `r_step_attribute` VALUES ('37', '1', '1', '0', 'field_name', '0', 'm1');
INSERT INTO `r_step_attribute` VALUES ('38', '1', '1', '0', 'field_type', '0', 'String');
INSERT INTO `r_step_attribute` VALUES ('39', '1', '1', '0', 'field_format', '0', null);
INSERT INTO `r_step_attribute` VALUES ('40', '1', '1', '0', 'field_currency', '0', null);
INSERT INTO `r_step_attribute` VALUES ('41', '1', '1', '0', 'field_decimal', '0', null);
INSERT INTO `r_step_attribute` VALUES ('42', '1', '1', '0', 'field_group', '0', null);
INSERT INTO `r_step_attribute` VALUES ('43', '1', '1', '0', 'field_nullif', '0', null);
INSERT INTO `r_step_attribute` VALUES ('44', '1', '1', '0', 'field_ifnull', '0', null);
INSERT INTO `r_step_attribute` VALUES ('45', '1', '1', '0', 'field_position', '-1', null);
INSERT INTO `r_step_attribute` VALUES ('46', '1', '1', '0', 'field_length', '-1', null);
INSERT INTO `r_step_attribute` VALUES ('47', '1', '1', '0', 'field_precision', '-1', null);
INSERT INTO `r_step_attribute` VALUES ('48', '1', '1', '0', 'field_trim_type', '0', 'none');
INSERT INTO `r_step_attribute` VALUES ('49', '1', '1', '0', 'field_repeat', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('50', '1', '1', '1', 'field_name', '0', 'm2');
INSERT INTO `r_step_attribute` VALUES ('51', '1', '1', '1', 'field_type', '0', 'String');
INSERT INTO `r_step_attribute` VALUES ('52', '1', '1', '1', 'field_format', '0', null);
INSERT INTO `r_step_attribute` VALUES ('53', '1', '1', '1', 'field_currency', '0', null);
INSERT INTO `r_step_attribute` VALUES ('54', '1', '1', '1', 'field_decimal', '0', null);
INSERT INTO `r_step_attribute` VALUES ('55', '1', '1', '1', 'field_group', '0', null);
INSERT INTO `r_step_attribute` VALUES ('56', '1', '1', '1', 'field_nullif', '0', null);
INSERT INTO `r_step_attribute` VALUES ('57', '1', '1', '1', 'field_ifnull', '0', null);
INSERT INTO `r_step_attribute` VALUES ('58', '1', '1', '1', 'field_position', '-1', null);
INSERT INTO `r_step_attribute` VALUES ('59', '1', '1', '1', 'field_length', '-1', null);
INSERT INTO `r_step_attribute` VALUES ('60', '1', '1', '1', 'field_precision', '-1', null);
INSERT INTO `r_step_attribute` VALUES ('61', '1', '1', '1', 'field_trim_type', '0', 'none');
INSERT INTO `r_step_attribute` VALUES ('62', '1', '1', '1', 'field_repeat', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('63', '1', '1', '0', 'error_ignored', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('64', '1', '1', '0', 'skip_bad_files', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('65', '1', '1', '0', 'file_error_field', '0', null);
INSERT INTO `r_step_attribute` VALUES ('66', '1', '1', '0', 'file_error_message_field', '0', null);
INSERT INTO `r_step_attribute` VALUES ('67', '1', '1', '0', 'error_line_skipped', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('68', '1', '1', '0', 'error_count_field', '0', null);
INSERT INTO `r_step_attribute` VALUES ('69', '1', '1', '0', 'error_fields_field', '0', null);
INSERT INTO `r_step_attribute` VALUES ('70', '1', '1', '0', 'error_text_field', '0', null);
INSERT INTO `r_step_attribute` VALUES ('71', '1', '1', '0', 'bad_line_files_dest_dir', '0', null);
INSERT INTO `r_step_attribute` VALUES ('72', '1', '1', '0', 'bad_line_files_ext', '0', 'warning');
INSERT INTO `r_step_attribute` VALUES ('73', '1', '1', '0', 'error_line_files_dest_dir', '0', null);
INSERT INTO `r_step_attribute` VALUES ('74', '1', '1', '0', 'error_line_files_ext', '0', 'error');
INSERT INTO `r_step_attribute` VALUES ('75', '1', '1', '0', 'line_number_files_dest_dir', '0', null);
INSERT INTO `r_step_attribute` VALUES ('76', '1', '1', '0', 'line_number_files_ext', '0', 'line');
INSERT INTO `r_step_attribute` VALUES ('77', '1', '1', '0', 'date_format_lenient', '0', 'Y');
INSERT INTO `r_step_attribute` VALUES ('78', '1', '1', '0', 'date_format_locale', '0', 'zh_CN');
INSERT INTO `r_step_attribute` VALUES ('79', '1', '1', '0', 'shortFileFieldName', '0', null);
INSERT INTO `r_step_attribute` VALUES ('80', '1', '1', '0', 'pathFieldName', '0', null);
INSERT INTO `r_step_attribute` VALUES ('81', '1', '1', '0', 'hiddenFieldName', '0', null);
INSERT INTO `r_step_attribute` VALUES ('82', '1', '1', '0', 'lastModificationTimeFieldName', '0', null);
INSERT INTO `r_step_attribute` VALUES ('83', '1', '1', '0', 'uriNameFieldName', '0', null);
INSERT INTO `r_step_attribute` VALUES ('84', '1', '1', '0', 'rootUriNameFieldName', '0', null);
INSERT INTO `r_step_attribute` VALUES ('85', '1', '1', '0', 'extensionFieldName', '0', null);
INSERT INTO `r_step_attribute` VALUES ('86', '1', '1', '0', 'sizeFieldName', '0', null);
INSERT INTO `r_step_attribute` VALUES ('87', '1', '1', '0', 'cluster_schema', '0', null);
INSERT INTO `r_step_attribute` VALUES ('88', '1', '1', '0', 'row_distribution_code', '0', null);
INSERT INTO `r_step_attribute` VALUES ('89', '1', '2', '0', 'PARTITIONING_SCHEMA', '0', null);
INSERT INTO `r_step_attribute` VALUES ('90', '1', '2', '0', 'PARTITIONING_METHOD', '0', 'none');
INSERT INTO `r_step_attribute` VALUES ('91', '1', '2', '0', 'separator', '0', ':');
INSERT INTO `r_step_attribute` VALUES ('92', '1', '2', '0', 'enclosure', '0', '\"');
INSERT INTO `r_step_attribute` VALUES ('93', '1', '2', '0', 'enclosure_forced', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('94', '1', '2', '0', 'enclosure_fix_disabled', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('95', '1', '2', '0', 'header', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('96', '1', '2', '0', 'footer', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('97', '1', '2', '0', 'format', '0', 'DOS');
INSERT INTO `r_step_attribute` VALUES ('98', '1', '2', '0', 'compression', '0', 'None');
INSERT INTO `r_step_attribute` VALUES ('99', '1', '2', '0', 'encoding', '0', null);
INSERT INTO `r_step_attribute` VALUES ('100', '1', '2', '0', 'file_name', '0', 'D:\\pdi-ce-6.1.0.1-196\\result');
INSERT INTO `r_step_attribute` VALUES ('101', '1', '2', '0', 'file_is_command', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('102', '1', '2', '0', 'file_servlet_output', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('103', '1', '2', '0', 'do_not_open_new_file_init', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('104', '1', '2', '0', 'file_extention', '0', 'txt');
INSERT INTO `r_step_attribute` VALUES ('105', '1', '2', '0', 'file_append', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('106', '1', '2', '0', 'file_split', '0', null);
INSERT INTO `r_step_attribute` VALUES ('107', '1', '2', '0', 'file_add_stepnr', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('108', '1', '2', '0', 'file_add_partnr', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('109', '1', '2', '0', 'file_add_date', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('110', '1', '2', '0', 'date_time_format', '0', null);
INSERT INTO `r_step_attribute` VALUES ('111', '1', '2', '0', 'create_parent_folder', '0', 'Y');
INSERT INTO `r_step_attribute` VALUES ('112', '1', '2', '0', 'SpecifyFormat', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('113', '1', '2', '0', 'add_to_result_filenames', '0', 'Y');
INSERT INTO `r_step_attribute` VALUES ('114', '1', '2', '0', 'file_add_time', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('115', '1', '2', '0', 'file_pad', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('116', '1', '2', '0', 'file_fast_dump', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('117', '1', '2', '0', 'fileNameInField', '0', 'N');
INSERT INTO `r_step_attribute` VALUES ('118', '1', '2', '0', 'fileNameField', '0', null);
INSERT INTO `r_step_attribute` VALUES ('119', '1', '2', '0', 'field_name', '0', 'm1');
INSERT INTO `r_step_attribute` VALUES ('120', '1', '2', '0', 'field_type', '0', 'String');
INSERT INTO `r_step_attribute` VALUES ('121', '1', '2', '0', 'field_format', '0', null);
INSERT INTO `r_step_attribute` VALUES ('122', '1', '2', '0', 'field_currency', '0', null);
INSERT INTO `r_step_attribute` VALUES ('123', '1', '2', '0', 'field_decimal', '0', null);
INSERT INTO `r_step_attribute` VALUES ('124', '1', '2', '0', 'field_group', '0', null);
INSERT INTO `r_step_attribute` VALUES ('125', '1', '2', '0', 'field_trim_type', '0', 'none');
INSERT INTO `r_step_attribute` VALUES ('126', '1', '2', '0', 'field_nullif', '0', null);
INSERT INTO `r_step_attribute` VALUES ('127', '1', '2', '0', 'field_length', '-1', null);
INSERT INTO `r_step_attribute` VALUES ('128', '1', '2', '0', 'field_precision', '-1', null);
INSERT INTO `r_step_attribute` VALUES ('129', '1', '2', '1', 'field_name', '0', 'm2');
INSERT INTO `r_step_attribute` VALUES ('130', '1', '2', '1', 'field_type', '0', 'String');
INSERT INTO `r_step_attribute` VALUES ('131', '1', '2', '1', 'field_format', '0', null);
INSERT INTO `r_step_attribute` VALUES ('132', '1', '2', '1', 'field_currency', '0', null);
INSERT INTO `r_step_attribute` VALUES ('133', '1', '2', '1', 'field_decimal', '0', null);
INSERT INTO `r_step_attribute` VALUES ('134', '1', '2', '1', 'field_group', '0', null);
INSERT INTO `r_step_attribute` VALUES ('135', '1', '2', '1', 'field_trim_type', '0', 'none');
INSERT INTO `r_step_attribute` VALUES ('136', '1', '2', '1', 'field_nullif', '0', null);
INSERT INTO `r_step_attribute` VALUES ('137', '1', '2', '1', 'field_length', '-1', null);
INSERT INTO `r_step_attribute` VALUES ('138', '1', '2', '1', 'field_precision', '-1', null);
INSERT INTO `r_step_attribute` VALUES ('139', '1', '2', '0', 'endedLine', '0', null);
INSERT INTO `r_step_attribute` VALUES ('140', '1', '2', '0', 'cluster_schema', '0', null);
INSERT INTO `r_step_attribute` VALUES ('141', '1', '2', '0', 'row_distribution_code', '0', null);
INSERT INTO `r_step_type` VALUES ('1', 'MappingInput', '映射输入规范', '指定一个映射的字段输入');
INSERT INTO `r_step_type` VALUES ('2', 'SystemInfo', '获取系统信息', '获取系统信息，例如时间、日期.');
INSERT INTO `r_step_type` VALUES ('3', 'OpenERPObjectOutputImport', 'OpenERP Object Output', 'Writes data into OpenERP objects using the object import procedure');
INSERT INTO `r_step_type` VALUES ('4', 'SASInput', 'SAS 输入', 'This step reads files in sas7bdat (SAS) native format');
INSERT INTO `r_step_type` VALUES ('5', 'GPBulkLoader', 'Greenplum Bulk Loader', 'Greenplum Bulk Loader');
INSERT INTO `r_step_type` VALUES ('6', 'MergeJoin', '记录集连接', 'Joins two streams on a given key and outputs a joined set. The input streams must be sorted on the join key');
INSERT INTO `r_step_type` VALUES ('7', 'ExecSQLRow', '执行SQL脚本(字段流替换)', 'Execute SQL script extracted from a field\ncreated in a previous step.');
INSERT INTO `r_step_type` VALUES ('8', 'TableExists', '检查表是否存在', 'Check if a table exists on a specified connection');
INSERT INTO `r_step_type` VALUES ('9', 'GetFileNames', '获取文件名', 'Get file names from the operating system and send them to the next step.');
INSERT INTO `r_step_type` VALUES ('10', 'SocketWriter', 'Socket 写', 'Socket writer.  A socket server that can send rows of data to a socket reader.');
INSERT INTO `r_step_type` VALUES ('11', 'HadoopFileInputPlugin', 'Hadoop File Input', 'Process files from an HDFS location');
INSERT INTO `r_step_type` VALUES ('12', 'Injector', '记录注射', 'Injector step to allow to inject rows into the transformation through the java API');
INSERT INTO `r_step_type` VALUES ('13', 'SingleThreader', 'Single Threader', 'Executes a transformation snippet in a single thread.  You need a standard mapping or a transformation with an Injector step where data from the parent transformation will arive in blocks.');
INSERT INTO `r_step_type` VALUES ('14', 'MailValidator', '检验邮件地址', 'Check if an email address is valid.');
INSERT INTO `r_step_type` VALUES ('15', 'AutoDoc', '自动文档输出', 'This step automatically generates documentation based on input in the form of a list of transformations and jobs');
INSERT INTO `r_step_type` VALUES ('16', 'PropertyOutput', '配置文件输出', 'Write data to properties file');
INSERT INTO `r_step_type` VALUES ('17', 'UniqueRowsByHashSet', '唯一行 (哈希值)', 'Remove double rows and leave only unique occurrences by using a HashSet.');
INSERT INTO `r_step_type` VALUES ('18', 'CheckSum', '增加校验列', 'Add a checksum column for each input row');
INSERT INTO `r_step_type` VALUES ('19', 'FilesFromResult', '从结果获取文件', 'This step allows you to read filenames used or generated in a previous entry in a job.');
INSERT INTO `r_step_type` VALUES ('20', 'OraBulkLoader', 'Oracle 批量加载', 'Use Oracle Bulk Loader to load data');
INSERT INTO `r_step_type` VALUES ('21', 'FieldMetadataAnnotation', 'Annotate Stream', 'Add more details to describe data for published models used by the Streamlined Data Refinery.');
INSERT INTO `r_step_type` VALUES ('22', 'GetTableNames', '获取表名', 'Get table names from database connection and send them to the next step');
INSERT INTO `r_step_type` VALUES ('23', 'SocketReader', 'Socket 读', 'Socket reader.  A socket client that connects to a server (Socket Writer step).');
INSERT INTO `r_step_type` VALUES ('24', 'DataGrid', '自定义常量数据', 'Enter rows of static data in a grid, usually for testing, reference or demo purpose');
INSERT INTO `r_step_type` VALUES ('25', 'XBaseInput', 'XBase输入', '从一个XBase类型的文件(DBF)读取记录');
INSERT INTO `r_step_type` VALUES ('26', 'SyslogMessage', '发送信息至Syslog', 'Send message to Syslog server');
INSERT INTO `r_step_type` VALUES ('27', 'ExcelInput', 'Excel输入', '从一个微软的Excel文件里读取数据. 兼容Excel 95, 97 and 2000.');
INSERT INTO `r_step_type` VALUES ('28', 'SapInput', 'SAP 输入', 'Read data from SAP ERP, optionally with parameters');
INSERT INTO `r_step_type` VALUES ('29', 'InfobrightOutput', 'Infobright 批量加载', 'Load data to an Infobright database table');
INSERT INTO `r_step_type` VALUES ('30', 'CassandraInput', 'Cassandra Input', 'Reads data from a Cassandra table');
INSERT INTO `r_step_type` VALUES ('31', 'SelectValues', '字段选择', '选择或移除记录里的字。{0}此外，可以设置字段的元数据: 类型, 长度和精度.');
INSERT INTO `r_step_type` VALUES ('32', 'MonetDBAgileMart', 'MonetDB Agile Mart', 'Load data into MonetDB for Agile BI use cases');
INSERT INTO `r_step_type` VALUES ('33', 'ChangeFileEncoding', '改变文件编码', 'Change file encoding and create a new file');
INSERT INTO `r_step_type` VALUES ('34', 'Script', 'Script', 'Calculate values by scripting in Ruby, Python, Groovy, JavaScript, ... (JSR-223)');
INSERT INTO `r_step_type` VALUES ('35', 'PrioritizeStreams', '数据流优先级排序', 'Prioritize streams in an order way.');
INSERT INTO `r_step_type` VALUES ('36', 'TextFileOutput', '文本文件输出', '写记录到一个文本文件.');
INSERT INTO `r_step_type` VALUES ('37', 'FixedInput', '固定宽度文件输入', 'Fixed file input');
INSERT INTO `r_step_type` VALUES ('38', 'CouchDbInput', 'CouchDb Input', 'Reads from a Couch DB view');
INSERT INTO `r_step_type` VALUES ('39', 'XSDValidator', 'XSD Validator', 'Validate XML source (files or streams) against XML Schema Definition.');
INSERT INTO `r_step_type` VALUES ('40', 'XMLOutput', 'XML Output', 'Write data to an XML file');
INSERT INTO `r_step_type` VALUES ('41', 'HTTP', 'HTTP client', 'Call a web service over HTTP by supplying a base URL by allowing parameters to be set dynamically');
INSERT INTO `r_step_type` VALUES ('42', 'Unique', '去除重复记录', '去除重复的记录行，保持记录唯一{0}这个仅仅基于一个已经排好序的输入.{1}如果输入没有排序, 仅仅两个连续的记录行被正确处理.');
INSERT INTO `r_step_type` VALUES ('43', 'PGPDecryptStream', 'PGP Decrypt stream', 'Decrypt data stream with PGP');
INSERT INTO `r_step_type` VALUES ('44', 'SortedMerge', '排序合并', 'Sorted Merge');
INSERT INTO `r_step_type` VALUES ('45', 'OpenERPObjectInput', 'OpenERP Object Input', 'Reads data from OpenERP objects');
INSERT INTO `r_step_type` VALUES ('46', 'StringCut', '剪切字符串', 'Strings cut (substring).');
INSERT INTO `r_step_type` VALUES ('47', 'SampleRows', '样本行', 'Filter rows based on the line number.');
INSERT INTO `r_step_type` VALUES ('48', 'ExecProcess', '启动一个进程', 'Execute a process and return the result');
INSERT INTO `r_step_type` VALUES ('49', 'HBaseOutput', 'HBase Output', 'Writes data to an HBase table according to a mapping');
INSERT INTO `r_step_type` VALUES ('50', 'XMLInputStream', 'XML Input Stream (StAX)', 'This step is capable of processing very large and complex XML files very fast.');
INSERT INTO `r_step_type` VALUES ('51', 'StreamLookup', '流查询', '从转换中的其它流里查询值.');
INSERT INTO `r_step_type` VALUES ('52', 'HadoopFileOutputPlugin', 'Hadoop File Output', 'Create files in an HDFS location ');
INSERT INTO `r_step_type` VALUES ('53', 'Sequence', '增加序列', '从序列获取下一个值');
INSERT INTO `r_step_type` VALUES ('54', 'YamlInput', 'Yaml 输入', 'Read YAML source (file or stream) parse them and convert them to rows and writes these to one or more output. ');
INSERT INTO `r_step_type` VALUES ('55', 'TableInput', '表输入', '从数据库表里读取信息.');
INSERT INTO `r_step_type` VALUES ('56', 'SetSessionVariableStep', 'Set session variables', 'Set session variables in the current user session.');
INSERT INTO `r_step_type` VALUES ('57', 'RowsToResult', '复制记录到结果', '使用这个步骤把记录写到正在执行的任务.{0}信息将会被传递给同一个任务里的下一个条目.');
INSERT INTO `r_step_type` VALUES ('58', 'JsonInput', 'JSON Input', 'Extract relevant portions out of JSON structures (file or incoming field) and output rows');
INSERT INTO `r_step_type` VALUES ('59', 'SymmetricCryptoTrans', '对称加密', 'Encrypt or decrypt a string using symmetric encryption.\nAvailable algorithms are DES, AES, TripleDES.');
INSERT INTO `r_step_type` VALUES ('60', 'SSTableOutput', 'SSTable Output', 'Writes to a filesystem directory as a Cassandra SSTable');
INSERT INTO `r_step_type` VALUES ('61', 'SalesforceUpdate', 'Salesforce Update', 'Update records in Salesforce module.');
INSERT INTO `r_step_type` VALUES ('62', 'MetaInject', 'ETL元数据注入', 'This step allows you to inject metadata into an existing transformation prior to execution.  This allows for the creation of dynamic and highly flexible data integration solutions.');
INSERT INTO `r_step_type` VALUES ('63', 'MondrianInput', 'Mondrian 输入', 'Execute and retrieve data using an MDX query against a Pentaho Analyses OLAP server (Mondrian)');
INSERT INTO `r_step_type` VALUES ('64', 'RandomValue', '生成随机数', 'Generate random value');
INSERT INTO `r_step_type` VALUES ('65', 'PGPEncryptStream', 'PGP Encrypt stream', 'Encrypt data stream with PGP');
INSERT INTO `r_step_type` VALUES ('66', 'LDAPOutput', 'LDAP 输出', 'Perform Insert, upsert, update, add or delete operations on records based on their DN (Distinguished  Name).');
INSERT INTO `r_step_type` VALUES ('67', 'TextFileInput', '文本文件输入', '从一个文本文件（几种格式）里读取数据{0}这些数据可以被传递到下一个步骤里...');
INSERT INTO `r_step_type` VALUES ('68', 'Update', '更新', '基于关键字更新记录到数据库');
INSERT INTO `r_step_type` VALUES ('69', 'SwitchCase', 'Switch / Case', 'Switch a row to a certain target step based on the case value in a field.');
INSERT INTO `r_step_type` VALUES ('70', 'SFTPPut', 'SFTP Put', 'Upload a file or a stream file to remote host via SFTP');
INSERT INTO `r_step_type` VALUES ('71', 'ValueMapper', '值映射', 'Maps values of a certain field from one value to another');
INSERT INTO `r_step_type` VALUES ('72', 'GetVariable', '获取变量', 'Determine the values of certain (environment or Kettle) variables and put them in field values.');
INSERT INTO `r_step_type` VALUES ('73', 'DynamicSQLRow', '执行Dynamic SQL', 'Execute dynamic SQL statement build in a previous field');
INSERT INTO `r_step_type` VALUES ('74', 'TypeExitExcelWriterStep', 'Microsoft Excel 输出', 'Writes or appends data to an Excel file');
INSERT INTO `r_step_type` VALUES ('75', 'AvroInput', 'Avro Input', 'Reads data from an Avro file');
INSERT INTO `r_step_type` VALUES ('76', 'MergeRows', '合并记录', '合并两个数据流, 并根据某个关键字排序.  这两个数据流被比较，以标识相等的、变更的、删除的和新建的记录.');
INSERT INTO `r_step_type` VALUES ('77', 'PaloDimInput', 'Palo Dim Input', 'Reads data from a defined Palo Dimension');
INSERT INTO `r_step_type` VALUES ('78', 'Rest', 'REST Client', 'Consume RESTfull services.\nREpresentational State Transfer (REST) is a key design idiom that embraces a stateless client-server\narchitecture in which the web services are viewed as resources and can be identified by their URLs');
INSERT INTO `r_step_type` VALUES ('79', 'NumberRange', '数值范围', 'Create ranges based on numeric field');
INSERT INTO `r_step_type` VALUES ('80', 'Mapping', '映射 (子转换)', '运行一个映射 (子转换), 使用MappingInput和MappingOutput来指定接口的字段');
INSERT INTO `r_step_type` VALUES ('81', 'ExcelOutput', 'Excel输出', 'Stores records into an Excel (XLS) document with formatting information.');
INSERT INTO `r_step_type` VALUES ('82', 'AnalyticQuery', '分析查询', 'Execute analytic queries over a sorted dataset (LEAD/LAG/FIRST/LAST)');
INSERT INTO `r_step_type` VALUES ('83', 'Mail', '发送邮件', 'Send eMail.');
INSERT INTO `r_step_type` VALUES ('84', 'ProcessFiles', '处理文件', 'Process one file per row (copy or move or delete).\nThis step only accept filename in input.');
INSERT INTO `r_step_type` VALUES ('85', 'ColumnExists', '检查表里的列是否存在', 'Check if a column exists in a table on a specified connection.');
INSERT INTO `r_step_type` VALUES ('86', 'GPLoad', 'Greenplum Load', 'Greenplum Load');
INSERT INTO `r_step_type` VALUES ('87', 'RegexEval', '正则表达式', 'Regular expression Evaluation\nThis step uses a regular expression to evaluate a field. It can also extract new fields out of an existing field with capturing groups.');
INSERT INTO `r_step_type` VALUES ('88', 'FuzzyMatch', '模糊匹配', 'Finding approximate matches to a string using matching algorithms.\nRead a field from a main stream and output approximative value from lookup stream.');
INSERT INTO `r_step_type` VALUES ('89', 'SplitFieldToRows3', '列拆分为多行', 'Splits a single string field by delimiter and creates a new row for each split term');
INSERT INTO `r_step_type` VALUES ('90', 'ReplaceString', '字符串替换', 'Replace all occurences a word in a string with another word.');
INSERT INTO `r_step_type` VALUES ('91', 'TableAgileMart', 'Table Agile Mart', 'Load data into a table for Agile BI use cases');
INSERT INTO `r_step_type` VALUES ('92', 'MemoryGroupBy', '在内存中分组', 'Builds aggregates in a group by fashion.\nThis step doesn\'t require sorted input.');
INSERT INTO `r_step_type` VALUES ('93', 'WriteToLog', '写日志', 'Write data to log');
INSERT INTO `r_step_type` VALUES ('94', 'IfNull', '替换NULL值', 'Sets a field value to a constant if it is null.');
INSERT INTO `r_step_type` VALUES ('95', 'TeraFast', 'Teradata Fastload 批量加载', 'The Teradata Fastload Bulk loader');
INSERT INTO `r_step_type` VALUES ('96', 'FilterRows', '过滤记录', '使用简单的相等来过滤记录');
INSERT INTO `r_step_type` VALUES ('97', 'GetSlaveSequence', 'Get ID from slave server', 'Retrieves unique IDs in blocks from a slave server.  The referenced sequence needs to be configured on the slave server in the XML configuration file.');
INSERT INTO `r_step_type` VALUES ('98', 'GetRepositoryNames', '获取资源库配置', 'Lists detailed information about transformations and/or jobs in a repository');
INSERT INTO `r_step_type` VALUES ('99', 'Denormaliser', '列转行', 'Denormalises rows by looking up key-value pairs and by assigning them to new fields in the输出 rows.{0}This method aggregates and needs the输入 rows to be sorted on the grouping fields');
INSERT INTO `r_step_type` VALUES ('100', 'PaloCellInput', 'Palo Cell Input', 'Reads data from a defined Palo Cube ');
INSERT INTO `r_step_type` VALUES ('101', 'XMLJoin', 'XML Join', 'Joins a stream of XML-Tags into a target XML string');
INSERT INTO `r_step_type` VALUES ('102', 'Dummy', '空操作 (什么也不做)', '这个步骤类型什么都不作.{0} 当你想测试或拆分数据流的时候有用.');
INSERT INTO `r_step_type` VALUES ('103', 'ZipFile', 'Zip 文件', 'Zip a file.\nFilename will be extracted from incoming stream.');
INSERT INTO `r_step_type` VALUES ('104', 'SecretKeyGenerator', '生成密钥', 'Generate secret key for algorithms such as DES, AES, TripleDES.');
INSERT INTO `r_step_type` VALUES ('105', 'SetValueField', '设置字段值', 'Set value of a field with another value field');
INSERT INTO `r_step_type` VALUES ('106', 'HL7Input', 'HL7 Input', 'Reads and parses HL7 messages and outputs a series of values from the messages');
INSERT INTO `r_step_type` VALUES ('107', 'Delay', '延迟行', 'Output each input row after a delay');
INSERT INTO `r_step_type` VALUES ('108', 'S3FileOutputPlugin', 'S3 File Output', 'Create files in an S3 location');
INSERT INTO `r_step_type` VALUES ('109', 'OpenERPObjectDelete', 'OpenERP Object Delete', 'Deletes OpenERP objects');
INSERT INTO `r_step_type` VALUES ('110', 'UserDefinedJavaClass', 'Java 代码', 'This step allows you to program a step using Java code');
INSERT INTO `r_step_type` VALUES ('111', 'RssInput', 'RSS 输入', 'Read RSS feeds');
INSERT INTO `r_step_type` VALUES ('112', 'SQLFileOutput', 'SQL 文件输出', 'Output SQL INSERT statements to file');
INSERT INTO `r_step_type` VALUES ('113', 'DetectLastRow', '识别流的最后一行', 'Last row will be marked');
INSERT INTO `r_step_type` VALUES ('114', 'HBaseRowDecoder', 'HBase Row Decoder', 'Decodes an incoming key and HBase result object according to a mapping ');
INSERT INTO `r_step_type` VALUES ('115', 'OldTextFileInput', 'Old Text file input', '从一个文本文件（几种格式）里读取数据{0}这些数据可以被传递到下一个步骤里...');
INSERT INTO `r_step_type` VALUES ('116', 'SetValueConstant', '将字段值设置为常量', 'Set value of a field to a constant');
INSERT INTO `r_step_type` VALUES ('117', 'PGBulkLoader', 'PostgreSQL 批量加载', 'PostgreSQL Bulk Loader');
INSERT INTO `r_step_type` VALUES ('118', 'OlapInput', 'OLAP 输入', 'Execute and retrieve data using an MDX query against any XML/A OLAP datasource using olap4j');
INSERT INTO `r_step_type` VALUES ('119', 'HadoopEnterPlugin', 'MapReduce Input', 'Enter a Hadoop Mapper or Reducer transformation');
INSERT INTO `r_step_type` VALUES ('120', 'InsertUpdate', '插入 / 更新', '基于关键字更新或插入记录到数据库.');
INSERT INTO `r_step_type` VALUES ('121', 'CreditCardValidator', '检验信用卡号码是否有效', 'The Credit card validator step will help you tell:\n(1) if a credit card number is valid (uses LUHN10 (MOD-10) algorithm)\n(2) which credit card vendor handles that number\n(VISA, MasterCard, Diners Club, EnRoute, American Express (AMEX),...)');
INSERT INTO `r_step_type` VALUES ('122', 'TransExecutor', 'Transformation Executor', 'This step executes a Pentaho Data Integration transformation, sets parameters and passes rows.');
INSERT INTO `r_step_type` VALUES ('123', 'Calculator', '计算器', '通过执行简单的计算创建一个新字段');
INSERT INTO `r_step_type` VALUES ('124', 'JavaFilter', '根据Java代码过滤记录', 'Filter rows using java code');
INSERT INTO `r_step_type` VALUES ('125', 'TypeExitEdi2XmlStep', 'Edi to XML', 'Converts Edi text to generic XML');
INSERT INTO `r_step_type` VALUES ('126', 'CreateSharedDimensions', 'Shared Dimension', 'Create shared dimensions for use with Streamlined Data Refinery.');
INSERT INTO `r_step_type` VALUES ('127', 'CloneRow', '克隆行', 'Clone a row as many times as needed');
INSERT INTO `r_step_type` VALUES ('128', 'Normaliser', '行转列', 'De-normalised information can be normalised using this step type.');
INSERT INTO `r_step_type` VALUES ('129', 'DetectEmptyStream', '检测空流', 'This step will output one empty row if input stream is empty\n(ie when input stream does not contain any row)');
INSERT INTO `r_step_type` VALUES ('130', 'LDAPInput', 'LDAP 输入', 'Read data from LDAP host');
INSERT INTO `r_step_type` VALUES ('131', 'TableOutput', '表输出', '写信息到一个数据库表');
INSERT INTO `r_step_type` VALUES ('132', 'FieldSplitter', '拆分字段', '当你想把一个字段拆分成多个时，使用这个类型.');
INSERT INTO `r_step_type` VALUES ('133', 'MonetDBBulkLoader', 'MonetDB 批量加载', 'Load data into MonetDB by using their bulk load command in streaming mode.');
INSERT INTO `r_step_type` VALUES ('134', 'CubeOutput', 'Cube输出', '把数据写入一个cube');
INSERT INTO `r_step_type` VALUES ('135', 'Janino', '利用Janino计算Java表达式', 'Calculate the result of a Java Expression using Janino');
INSERT INTO `r_step_type` VALUES ('136', 'SynchronizeAfterMerge', '数据同步', 'This step perform insert/update/delete in one go based on the value of a field. ');
INSERT INTO `r_step_type` VALUES ('137', 'BlockUntilStepsFinish', '阻塞数据直到步骤都完成', 'Block this step until selected steps finish.');
INSERT INTO `r_step_type` VALUES ('138', 'JsonOutput', 'JSON Output', 'Create JSON block and output it in a field or a file.');
INSERT INTO `r_step_type` VALUES ('139', 'SortRows', '排序记录', '基于字段值把记录排序(升序或降序)');
INSERT INTO `r_step_type` VALUES ('140', 'LucidDBStreamingLoader', 'LucidDB Streaming Loader', 'Load data into LucidDB by using Remote Rows UDX.');
INSERT INTO `r_step_type` VALUES ('141', 'VectorWiseBulkLoader', 'Ingres VectorWise 批量加载', 'This step interfaces with the Ingres VectorWise Bulk Loader \"COPY TABLE\" command.');
INSERT INTO `r_step_type` VALUES ('142', 'TableCompare', '比较表', 'Compares 2 tables and gives back a list of differences');
INSERT INTO `r_step_type` VALUES ('143', 'PentahoReportingOutput', 'Pentaho 报表输出', 'Executes an existing report (PRPT)');
INSERT INTO `r_step_type` VALUES ('144', 'SSH', '运行SSH命令', 'Run SSH commands and returns result.');
INSERT INTO `r_step_type` VALUES ('145', 'S3CSVINPUT', 'S3 CSV Input', 'Is capable of reading CSV data stored on Amazon S3 in parallel');
INSERT INTO `r_step_type` VALUES ('146', 'TypeExitGoogleAnalyticsInputStep', 'Google Analytics', 'Fetches data from google analytics account');
INSERT INTO `r_step_type` VALUES ('147', 'Formula', '公式', '使用 Pentaho 的公式库来计算公式');
INSERT INTO `r_step_type` VALUES ('148', 'SetVariable', '设置变量', 'Set environment variables based on a single input row.');
INSERT INTO `r_step_type` VALUES ('149', 'CassandraOutput', 'Cassandra Output', 'Writes to a Cassandra table');
INSERT INTO `r_step_type` VALUES ('150', 'JoinRows', '记录关联 (笛卡尔输出)', '这个步骤的输出是输入流的笛卡尔的结果.{0} 输出结果的记录数是输入流记录之间的乘积.');
INSERT INTO `r_step_type` VALUES ('151', 'DBJoin', '数据库连接', '使用数据流里的值作为参数执行一个数据库查询');
INSERT INTO `r_step_type` VALUES ('152', 'ReservoirSampling', '数据采样', '[Transform] Samples a fixed number of rows from the incoming stream');
INSERT INTO `r_step_type` VALUES ('153', 'RandomCCNumberGenerator', '生成随机的信用卡号', 'Generate random valide (luhn check) credit card numbers');
INSERT INTO `r_step_type` VALUES ('154', 'MailInput', '邮件信息输入', 'Read POP3/IMAP server and retrieve messages');
INSERT INTO `r_step_type` VALUES ('155', 'GetFilesRowsCount', '获取文件行数', 'Returns rows count for text files.');
INSERT INTO `r_step_type` VALUES ('156', 'LDIFInput', 'LDIF 输入', 'Read data from LDIF files');
INSERT INTO `r_step_type` VALUES ('157', 'DBLookup', '数据库查询', '使用字段值在数据库里查询值');
INSERT INTO `r_step_type` VALUES ('158', 'SimpleMapping', 'Simple Mapping (sub-transformation)', 'Run a mapping (sub-transformation), use MappingInput and MappingOutput to specify the fields interface.  This is the simplified version only allowing one input and one output data set.');
INSERT INTO `r_step_type` VALUES ('159', 'WebServiceAvailable', '检查web服务是否可用', 'Check if a webservice is available');
INSERT INTO `r_step_type` VALUES ('160', 'SalesforceDelete', 'Salesforce Delete', 'Delete records in Salesforce module.');
INSERT INTO `r_step_type` VALUES ('161', 'MongoDbInput', 'MongoDB Input', 'Reads from a Mongo DB collection');
INSERT INTO `r_step_type` VALUES ('162', 'WebServiceLookup', 'Web 服务查询', '使用 Web 服务查询信息');
INSERT INTO `r_step_type` VALUES ('163', 'MongoDbOutput', 'MongoDB Output', 'Writes to a Mongo DB collection');
INSERT INTO `r_step_type` VALUES ('164', 'ClosureGenerator', 'Closure Generator', 'This step allows you to generates a closure table using parent-child relationships.');
INSERT INTO `r_step_type` VALUES ('165', 'HBaseInput', 'HBase Input', 'Reads data from a HBase table according to a mapping ');
INSERT INTO `r_step_type` VALUES ('166', 'UnivariateStats', '单变量统计', 'This step computes some simple stats based on a single input field');
INSERT INTO `r_step_type` VALUES ('167', 'VerticaBulkLoader', 'Vertica Bulk Loader', 'Bulk load data into a Vertica database table');
INSERT INTO `r_step_type` VALUES ('168', 'MySQLBulkLoader', 'MySQL 批量加载', 'MySQL bulk loader step, loading data over a named pipe (not available on MS Windows)');
INSERT INTO `r_step_type` VALUES ('169', 'RowGenerator', '生成记录', '产生一些空记录或相等的行.');
INSERT INTO `r_step_type` VALUES ('170', 'GroupBy', '分组', '以分组的形式创建聚合.{0}这个仅仅在一个已经排好序的输入有效.{1}如果输入没有排序, 仅仅两个连续的记录行被正确处理.');
INSERT INTO `r_step_type` VALUES ('171', 'Constant', '增加常量', '给记录增加一到多个常量');
INSERT INTO `r_step_type` VALUES ('172', 'StringOperations', '字符串操作', 'Apply certain operations like trimming, padding and others to string value.');
INSERT INTO `r_step_type` VALUES ('173', 'Validator', '数据检验', 'Validates passing data based on a set of rules');
INSERT INTO `r_step_type` VALUES ('174', 'CombinationLookup', '联合查询/更新', '更新数据仓库里的一个junk维 {0} 可选的, 科研查询维里的信息.{1}junk维的主键是所有的字段.');
INSERT INTO `r_step_type` VALUES ('175', 'PaloCellOutput', 'Palo Cell Output', 'Writes data to a defined Palo Cube');
INSERT INTO `r_step_type` VALUES ('176', 'Delete', '删除', '基于关键字删除记录');
INSERT INTO `r_step_type` VALUES ('177', 'DummyStep', 'Example Step', 'This is a plugin example step');
INSERT INTO `r_step_type` VALUES ('178', 'NullIf', '设置值为NULL', '如果一个字段值等于某个固定值，那么把这个字段值设置成null');
INSERT INTO `r_step_type` VALUES ('179', 'HadoopExitPlugin', 'MapReduce Output', 'Exit a Hadoop Mapper or Reducer transformation ');
INSERT INTO `r_step_type` VALUES ('180', 'SalesforceInput', 'Salesforce Input', 'Extract data from Salesforce');
INSERT INTO `r_step_type` VALUES ('181', 'CallEndpointStep', 'Call endpoint', 'Call an endpoint of the BA Server.');
INSERT INTO `r_step_type` VALUES ('182', 'StepMetastructure', '流的元数据', 'This is a step to read the metadata of the incoming stream.');
INSERT INTO `r_step_type` VALUES ('183', 'Append', '追加流', 'Append 2 streams in an ordered way');
INSERT INTO `r_step_type` VALUES ('184', 'RowsFromResult', '从结果获取记录', '这个允许你从同一个任务的前一个条目里读取记录.');
INSERT INTO `r_step_type` VALUES ('185', 'DBProc', '调用DB存储过程', '通过调用数据库存储过程获得返回值.');
INSERT INTO `r_step_type` VALUES ('186', 'Flattener', '行扁平化', 'Flattens consequetive rows based on the order in which they appear in the输入 stream');
INSERT INTO `r_step_type` VALUES ('187', 'PropertyInput', '配置文件输入', 'Read data (key, value) from properties files.');
INSERT INTO `r_step_type` VALUES ('188', 'FilesToResult', '复制文件到结果', 'This step allows you to set filenames in the result of this transformation.\nSubsequent job entries can then use this information.');
INSERT INTO `r_step_type` VALUES ('189', 'ExecSQL', '执行SQL脚本', '执行一个SQL脚本, 另外，可以使用输入的记录作为参数');
INSERT INTO `r_step_type` VALUES ('190', 'getXMLData', 'Get data from XML', 'Get data from XML file by using XPath.\n This step also allows you to parse XML defined in a previous field.');
INSERT INTO `r_step_type` VALUES ('191', 'DimensionLookup', '维度查询/更新', '在一个数据仓库里更新一个渐变维 {0} 或者在这个维里查询信息.');
INSERT INTO `r_step_type` VALUES ('192', 'FieldsChangeSequence', '根据字段值来改变序列', 'Add sequence depending of fields value change.\nEach time value of at least one field change, PDI will reset sequence. ');
INSERT INTO `r_step_type` VALUES ('193', 'FileLocked', '检查文件是否已被锁定', 'Check if a file is locked by another process');
INSERT INTO `r_step_type` VALUES ('194', 'GetSubFolders', '获取子目录名', 'Read a parent folder and return all subfolders');
INSERT INTO `r_step_type` VALUES ('195', 'SalesforceUpsert', 'Salesforce Upsert', 'Insert or update records in Salesforce module.');
INSERT INTO `r_step_type` VALUES ('196', 'CsvInput', 'CSV文件输入', 'Simple CSV file input');
INSERT INTO `r_step_type` VALUES ('197', 'RssOutput', 'RSS 输出', 'Read RSS stream.');
INSERT INTO `r_step_type` VALUES ('198', 'LoadFileInput', '文件内容加载至内存', 'Load file content in memory');
INSERT INTO `r_step_type` VALUES ('199', 'AccessOutput', 'Access 输出', 'Stores records into an MS-Access database table.');
INSERT INTO `r_step_type` VALUES ('200', 'AccessInput', 'Access 输入', 'Read data from a Microsoft Access file');
INSERT INTO `r_step_type` VALUES ('201', 'StepsMetrics', '转换步骤信息统计', 'Return metrics for one or several steps');
INSERT INTO `r_step_type` VALUES ('202', 'MappingOutput', '映射输出规范', '指定一个映射的字段输出');
INSERT INTO `r_step_type` VALUES ('203', 'MultiwayMergeJoin', 'Multiway Merge Join', 'Multiway Merge Join');
INSERT INTO `r_step_type` VALUES ('204', 'AddXML', 'Add XML', 'Encode several fields into an XML fragment');
INSERT INTO `r_step_type` VALUES ('205', 'ParallelGzipCsvInput', 'GZIP CSV Input', 'Parallel GZIP CSV file input reader');
INSERT INTO `r_step_type` VALUES ('206', 'RuleExecutor', 'Rules Executor', 'Rules Executor Step');
INSERT INTO `r_step_type` VALUES ('207', 'RuleAccumulator', 'Rules Accumulator', 'Rules Accumulator Step');
INSERT INTO `r_step_type` VALUES ('208', 'SalesforceInsert', 'Salesforce Insert', 'Insert records in Salesforce module.');
INSERT INTO `r_step_type` VALUES ('209', 'CubeInput', 'Cube 文件输入', '从一个cube读取记录.');
INSERT INTO `r_step_type` VALUES ('210', 'ScriptValueMod', 'JavaScript代码', 'This is a modified plugin for the Scripting Values with improved interface and performance.\nWritten & donated to open source by Martin Lange, Proconis : http://www.proconis.de');
INSERT INTO `r_step_type` VALUES ('211', 'Abort', '中止', 'Abort a transformation');
INSERT INTO `r_step_type` VALUES ('212', 'XSLT', 'XSL Transformation', 'Make an XSL Transformation');
INSERT INTO `r_step_type` VALUES ('213', 'TeraDataBulkLoader', 'Teradata TPT Bulk Loader', 'Teradata TPT bulkloader, using tbuild command');
INSERT INTO `r_step_type` VALUES ('214', 'ElasticSearchBulk', 'ElasticSearch Bulk Insert', 'Performs bulk inserts into ElasticSearch');
INSERT INTO `r_step_type` VALUES ('215', 'HTTPPOST', 'HTTP Post', 'Call a web service request over HTTP by supplying a base URL by allowing parameters to be set dynamically');
INSERT INTO `r_step_type` VALUES ('216', 'GetSessionVariableStep', 'Get session variables', 'Get session variables from the current user session.');
INSERT INTO `r_step_type` VALUES ('217', 'PaloDimOutput', 'Palo Dim Output', 'Writes data to defined Palo Dimension');
INSERT INTO `r_step_type` VALUES ('218', 'JobExecutor', '执行作业', 'This step executes a Pentaho Data Integration job, sets parameters and passes rows.');
INSERT INTO `r_step_type` VALUES ('219', 'FileExists', '检查文件是否存在', 'Check if a file exists');
INSERT INTO `r_step_type` VALUES ('220', 'BlockingStep', '阻塞数据', 'This step blocks until all incoming rows have been processed.  Subsequent steps only recieve the last input row to this step.');
INSERT INTO `r_step_type` VALUES ('221', 'ShapeFileReader', 'ESRI Shapefile Reader', 'Reads shape file data from an ESRI shape file and linked DBF file');
INSERT INTO `r_step_type` VALUES ('222', 'ConcatFields', 'Concat Fields', 'Concat fields together into a new field (similar to the Text File Output step)');
INSERT INTO `r_trans_attribute` VALUES ('223', '2', '0', 'UNIQUE_CONNECTIONS', '0', 'N');
INSERT INTO `r_trans_attribute` VALUES ('224', '2', '0', 'FEEDBACK_SHOWN', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('225', '2', '0', 'FEEDBACK_SIZE', '50000', null);
INSERT INTO `r_trans_attribute` VALUES ('226', '2', '0', 'USING_THREAD_PRIORITIES', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('227', '2', '0', 'SHARED_FILE', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('228', '2', '0', 'CAPTURE_STEP_PERFORMANCE', '0', 'N');
INSERT INTO `r_trans_attribute` VALUES ('229', '2', '0', 'STEP_PERFORMANCE_CAPTURING_DELAY', '1000', null);
INSERT INTO `r_trans_attribute` VALUES ('230', '2', '0', 'STEP_PERFORMANCE_CAPTURING_SIZE_LIMIT', '0', '100');
INSERT INTO `r_trans_attribute` VALUES ('231', '2', '0', 'STEP_PERFORMANCE_LOG_TABLE', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('232', '2', '0', 'LOG_SIZE_LIMIT', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('233', '2', '0', 'LOG_INTERVAL', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('234', '2', '0', 'TRANSFORMATION_TYPE', '0', 'Normal');
INSERT INTO `r_trans_attribute` VALUES ('235', '2', '0', 'SLEEP_TIME_EMPTY', '50', null);
INSERT INTO `r_trans_attribute` VALUES ('236', '2', '0', 'SLEEP_TIME_FULL', '50', null);
INSERT INTO `r_trans_attribute` VALUES ('237', '2', '0', 'TRANS_LOG_TABLE_CONNECTION_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('238', '2', '0', 'TRANS_LOG_TABLE_SCHEMA_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('239', '2', '0', 'TRANS_LOG_TABLE_TABLE_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('240', '2', '0', 'TRANS_LOG_TABLE_TIMEOUT_IN_DAYS', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('241', '2', '0', 'TRANS_LOG_TABLE_FIELD_ID0', '0', 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES ('242', '2', '0', 'TRANS_LOG_TABLE_FIELD_NAME0', '0', 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES ('243', '2', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED0', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('244', '2', '0', 'TRANS_LOG_TABLE_FIELD_ID1', '0', 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES ('245', '2', '0', 'TRANS_LOG_TABLE_FIELD_NAME1', '0', 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES ('246', '2', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED1', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('247', '2', '0', 'TRANS_LOG_TABLE_FIELD_ID2', '0', 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES ('248', '2', '0', 'TRANS_LOG_TABLE_FIELD_NAME2', '0', 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES ('249', '2', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED2', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('250', '2', '0', 'TRANS_LOG_TABLE_FIELD_ID3', '0', 'STATUS');
INSERT INTO `r_trans_attribute` VALUES ('251', '2', '0', 'TRANS_LOG_TABLE_FIELD_NAME3', '0', 'STATUS');
INSERT INTO `r_trans_attribute` VALUES ('252', '2', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED3', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('253', '2', '0', 'TRANS_LOG_TABLE_FIELD_ID4', '0', 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES ('254', '2', '0', 'TRANS_LOG_TABLE_FIELD_NAME4', '0', 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES ('255', '2', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED4', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('256', '2', '0', 'TRANS_LOG_TABLE_FIELD_SUBJECT4', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('257', '2', '0', 'TRANS_LOG_TABLE_FIELD_ID5', '0', 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES ('258', '2', '0', 'TRANS_LOG_TABLE_FIELD_NAME5', '0', 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES ('259', '2', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED5', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('260', '2', '0', 'TRANS_LOG_TABLE_FIELD_SUBJECT5', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('261', '2', '0', 'TRANS_LOG_TABLE_FIELD_ID6', '0', 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES ('262', '2', '0', 'TRANS_LOG_TABLE_FIELD_NAME6', '0', 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES ('263', '2', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED6', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('264', '2', '0', 'TRANS_LOG_TABLE_FIELD_SUBJECT6', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('265', '2', '0', 'TRANS_LOG_TABLE_FIELD_ID7', '0', 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES ('266', '2', '0', 'TRANS_LOG_TABLE_FIELD_NAME7', '0', 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES ('267', '2', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED7', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('268', '2', '0', 'TRANS_LOG_TABLE_FIELD_SUBJECT7', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('269', '2', '0', 'TRANS_LOG_TABLE_FIELD_ID8', '0', 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES ('270', '2', '0', 'TRANS_LOG_TABLE_FIELD_NAME8', '0', 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES ('271', '2', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED8', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('272', '2', '0', 'TRANS_LOG_TABLE_FIELD_SUBJECT8', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('273', '2', '0', 'TRANS_LOG_TABLE_FIELD_ID9', '0', 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES ('274', '2', '0', 'TRANS_LOG_TABLE_FIELD_NAME9', '0', 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES ('275', '2', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED9', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('276', '2', '0', 'TRANS_LOG_TABLE_FIELD_SUBJECT9', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('277', '2', '0', 'TRANS_LOG_TABLE_FIELD_ID10', '0', 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES ('278', '2', '0', 'TRANS_LOG_TABLE_FIELD_NAME10', '0', 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES ('279', '2', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED10', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('280', '2', '0', 'TRANS_LOG_TABLE_FIELD_ID11', '0', 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES ('281', '2', '0', 'TRANS_LOG_TABLE_FIELD_NAME11', '0', 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES ('282', '2', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED11', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('283', '2', '0', 'TRANS_LOG_TABLE_FIELD_ID12', '0', 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES ('284', '2', '0', 'TRANS_LOG_TABLE_FIELD_NAME12', '0', 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES ('285', '2', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED12', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('286', '2', '0', 'TRANS_LOG_TABLE_FIELD_ID13', '0', 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES ('287', '2', '0', 'TRANS_LOG_TABLE_FIELD_NAME13', '0', 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES ('288', '2', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED13', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('289', '2', '0', 'TRANS_LOG_TABLE_FIELD_ID14', '0', 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES ('290', '2', '0', 'TRANS_LOG_TABLE_FIELD_NAME14', '0', 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES ('291', '2', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED14', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('292', '2', '0', 'TRANS_LOG_TABLE_FIELD_ID15', '0', 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES ('293', '2', '0', 'TRANS_LOG_TABLE_FIELD_NAME15', '0', 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES ('294', '2', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED15', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('295', '2', '0', 'TRANS_LOG_TABLE_FIELD_ID16', '0', 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES ('296', '2', '0', 'TRANS_LOG_TABLE_FIELD_NAME16', '0', 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES ('297', '2', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED16', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('298', '2', '0', 'TRANS_LOG_TABLE_FIELD_ID17', '0', 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES ('299', '2', '0', 'TRANS_LOG_TABLE_FIELD_NAME17', '0', 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES ('300', '2', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED17', '0', 'N');
INSERT INTO `r_trans_attribute` VALUES ('301', '2', '0', 'TRANS_LOG_TABLE_FIELD_ID18', '0', 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES ('302', '2', '0', 'TRANS_LOG_TABLE_FIELD_NAME18', '0', 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES ('303', '2', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED18', '0', 'N');
INSERT INTO `r_trans_attribute` VALUES ('304', '2', '0', 'TRANS_LOG_TABLE_FIELD_ID19', '0', 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES ('305', '2', '0', 'TRANS_LOG_TABLE_FIELD_NAME19', '0', 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES ('306', '2', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED19', '0', 'N');
INSERT INTO `r_trans_attribute` VALUES ('307', '2', '0', 'TRANSLOG_TABLE_INTERVAL', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('308', '2', '0', 'TRANSLOG_TABLE_SIZE_LIMIT', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('309', '2', '0', 'STEP_LOG_TABLE_CONNECTION_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('310', '2', '0', 'STEP_LOG_TABLE_SCHEMA_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('311', '2', '0', 'STEP_LOG_TABLE_TABLE_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('312', '2', '0', 'STEP_LOG_TABLE_TIMEOUT_IN_DAYS', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('313', '2', '0', 'STEP_LOG_TABLE_FIELD_ID0', '0', 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES ('314', '2', '0', 'STEP_LOG_TABLE_FIELD_NAME0', '0', 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES ('315', '2', '0', 'STEP_LOG_TABLE_FIELD_ENABLED0', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('316', '2', '0', 'STEP_LOG_TABLE_FIELD_ID1', '0', 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES ('317', '2', '0', 'STEP_LOG_TABLE_FIELD_NAME1', '0', 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES ('318', '2', '0', 'STEP_LOG_TABLE_FIELD_ENABLED1', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('319', '2', '0', 'STEP_LOG_TABLE_FIELD_ID2', '0', 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES ('320', '2', '0', 'STEP_LOG_TABLE_FIELD_NAME2', '0', 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES ('321', '2', '0', 'STEP_LOG_TABLE_FIELD_ENABLED2', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('322', '2', '0', 'STEP_LOG_TABLE_FIELD_ID3', '0', 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES ('323', '2', '0', 'STEP_LOG_TABLE_FIELD_NAME3', '0', 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES ('324', '2', '0', 'STEP_LOG_TABLE_FIELD_ENABLED3', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('325', '2', '0', 'STEP_LOG_TABLE_FIELD_ID4', '0', 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES ('326', '2', '0', 'STEP_LOG_TABLE_FIELD_NAME4', '0', 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES ('327', '2', '0', 'STEP_LOG_TABLE_FIELD_ENABLED4', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('328', '2', '0', 'STEP_LOG_TABLE_FIELD_ID5', '0', 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES ('329', '2', '0', 'STEP_LOG_TABLE_FIELD_NAME5', '0', 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES ('330', '2', '0', 'STEP_LOG_TABLE_FIELD_ENABLED5', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('331', '2', '0', 'STEP_LOG_TABLE_FIELD_ID6', '0', 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES ('332', '2', '0', 'STEP_LOG_TABLE_FIELD_NAME6', '0', 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES ('333', '2', '0', 'STEP_LOG_TABLE_FIELD_ENABLED6', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('334', '2', '0', 'STEP_LOG_TABLE_FIELD_ID7', '0', 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES ('335', '2', '0', 'STEP_LOG_TABLE_FIELD_NAME7', '0', 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES ('336', '2', '0', 'STEP_LOG_TABLE_FIELD_ENABLED7', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('337', '2', '0', 'STEP_LOG_TABLE_FIELD_ID8', '0', 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES ('338', '2', '0', 'STEP_LOG_TABLE_FIELD_NAME8', '0', 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES ('339', '2', '0', 'STEP_LOG_TABLE_FIELD_ENABLED8', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('340', '2', '0', 'STEP_LOG_TABLE_FIELD_ID9', '0', 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES ('341', '2', '0', 'STEP_LOG_TABLE_FIELD_NAME9', '0', 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES ('342', '2', '0', 'STEP_LOG_TABLE_FIELD_ENABLED9', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('343', '2', '0', 'STEP_LOG_TABLE_FIELD_ID10', '0', 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES ('344', '2', '0', 'STEP_LOG_TABLE_FIELD_NAME10', '0', 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES ('345', '2', '0', 'STEP_LOG_TABLE_FIELD_ENABLED10', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('346', '2', '0', 'STEP_LOG_TABLE_FIELD_ID11', '0', 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES ('347', '2', '0', 'STEP_LOG_TABLE_FIELD_NAME11', '0', 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES ('348', '2', '0', 'STEP_LOG_TABLE_FIELD_ENABLED11', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('349', '2', '0', 'STEP_LOG_TABLE_FIELD_ID12', '0', 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES ('350', '2', '0', 'STEP_LOG_TABLE_FIELD_NAME12', '0', 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES ('351', '2', '0', 'STEP_LOG_TABLE_FIELD_ENABLED12', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('352', '2', '0', 'STEP_LOG_TABLE_FIELD_ID13', '0', 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES ('353', '2', '0', 'STEP_LOG_TABLE_FIELD_NAME13', '0', 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES ('354', '2', '0', 'STEP_LOG_TABLE_FIELD_ENABLED13', '0', 'N');
INSERT INTO `r_trans_attribute` VALUES ('355', '2', '0', 'PERFORMANCE_LOG_TABLE_CONNECTION_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('356', '2', '0', 'PERFORMANCE_LOG_TABLE_SCHEMA_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('357', '2', '0', 'PERFORMANCE_LOG_TABLE_TABLE_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('358', '2', '0', 'PERFORMANCE_LOG_TABLE_TIMEOUT_IN_DAYS', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('359', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID0', '0', 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES ('360', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME0', '0', 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES ('361', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED0', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('362', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID1', '0', 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES ('363', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME1', '0', 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES ('364', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED1', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('365', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID2', '0', 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES ('366', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME2', '0', 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES ('367', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED2', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('368', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID3', '0', 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES ('369', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME3', '0', 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES ('370', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED3', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('371', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID4', '0', 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES ('372', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME4', '0', 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES ('373', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED4', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('374', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID5', '0', 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES ('375', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME5', '0', 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES ('376', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED5', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('377', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID6', '0', 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES ('378', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME6', '0', 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES ('379', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED6', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('380', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID7', '0', 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES ('381', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME7', '0', 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES ('382', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED7', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('383', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID8', '0', 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES ('384', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME8', '0', 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES ('385', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED8', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('386', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID9', '0', 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES ('387', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME9', '0', 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES ('388', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED9', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('389', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID10', '0', 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES ('390', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME10', '0', 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES ('391', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED10', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('392', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID11', '0', 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES ('393', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME11', '0', 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES ('394', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED11', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('395', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID12', '0', 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES ('396', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME12', '0', 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES ('397', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED12', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('398', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID13', '0', 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES ('399', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME13', '0', 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES ('400', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED13', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('401', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID14', '0', 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES ('402', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME14', '0', 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES ('403', '2', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED14', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('404', '2', '0', 'PERFORMANCELOG_TABLE_INTERVAL', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('405', '2', '0', 'CHANNEL_LOG_TABLE_CONNECTION_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('406', '2', '0', 'CHANNEL_LOG_TABLE_SCHEMA_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('407', '2', '0', 'CHANNEL_LOG_TABLE_TABLE_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('408', '2', '0', 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('409', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID0', '0', 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES ('410', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME0', '0', 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES ('411', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('412', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID1', '0', 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES ('413', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME1', '0', 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES ('414', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('415', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID2', '0', 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES ('416', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME2', '0', 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES ('417', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('418', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID3', '0', 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES ('419', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME3', '0', 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES ('420', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('421', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID4', '0', 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES ('422', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME4', '0', 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES ('423', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('424', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID5', '0', 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES ('425', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME5', '0', 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES ('426', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('427', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID6', '0', 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES ('428', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME6', '0', 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES ('429', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('430', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID7', '0', 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES ('431', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME7', '0', 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES ('432', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('433', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID8', '0', 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES ('434', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME8', '0', 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES ('435', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('436', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID9', '0', 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES ('437', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME9', '0', 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES ('438', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('439', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID10', '0', 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES ('440', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME10', '0', 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES ('441', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('442', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ID11', '0', 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES ('443', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME11', '0', 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES ('444', '2', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('445', '1', '0', 'UNIQUE_CONNECTIONS', '0', 'N');
INSERT INTO `r_trans_attribute` VALUES ('446', '1', '0', 'FEEDBACK_SHOWN', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('447', '1', '0', 'FEEDBACK_SIZE', '50000', null);
INSERT INTO `r_trans_attribute` VALUES ('448', '1', '0', 'USING_THREAD_PRIORITIES', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('449', '1', '0', 'SHARED_FILE', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('450', '1', '0', 'CAPTURE_STEP_PERFORMANCE', '0', 'N');
INSERT INTO `r_trans_attribute` VALUES ('451', '1', '0', 'STEP_PERFORMANCE_CAPTURING_DELAY', '1000', null);
INSERT INTO `r_trans_attribute` VALUES ('452', '1', '0', 'STEP_PERFORMANCE_CAPTURING_SIZE_LIMIT', '0', '100');
INSERT INTO `r_trans_attribute` VALUES ('453', '1', '0', 'STEP_PERFORMANCE_LOG_TABLE', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('454', '1', '0', 'LOG_SIZE_LIMIT', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('455', '1', '0', 'LOG_INTERVAL', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('456', '1', '0', 'TRANSFORMATION_TYPE', '0', 'Normal');
INSERT INTO `r_trans_attribute` VALUES ('457', '1', '0', 'SLEEP_TIME_EMPTY', '50', null);
INSERT INTO `r_trans_attribute` VALUES ('458', '1', '0', 'SLEEP_TIME_FULL', '50', null);
INSERT INTO `r_trans_attribute` VALUES ('459', '1', '0', 'TRANS_LOG_TABLE_CONNECTION_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('460', '1', '0', 'TRANS_LOG_TABLE_SCHEMA_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('461', '1', '0', 'TRANS_LOG_TABLE_TABLE_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('462', '1', '0', 'TRANS_LOG_TABLE_TIMEOUT_IN_DAYS', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('463', '1', '0', 'TRANS_LOG_TABLE_FIELD_ID0', '0', 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES ('464', '1', '0', 'TRANS_LOG_TABLE_FIELD_NAME0', '0', 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES ('465', '1', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED0', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('466', '1', '0', 'TRANS_LOG_TABLE_FIELD_ID1', '0', 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES ('467', '1', '0', 'TRANS_LOG_TABLE_FIELD_NAME1', '0', 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES ('468', '1', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED1', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('469', '1', '0', 'TRANS_LOG_TABLE_FIELD_ID2', '0', 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES ('470', '1', '0', 'TRANS_LOG_TABLE_FIELD_NAME2', '0', 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES ('471', '1', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED2', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('472', '1', '0', 'TRANS_LOG_TABLE_FIELD_ID3', '0', 'STATUS');
INSERT INTO `r_trans_attribute` VALUES ('473', '1', '0', 'TRANS_LOG_TABLE_FIELD_NAME3', '0', 'STATUS');
INSERT INTO `r_trans_attribute` VALUES ('474', '1', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED3', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('475', '1', '0', 'TRANS_LOG_TABLE_FIELD_ID4', '0', 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES ('476', '1', '0', 'TRANS_LOG_TABLE_FIELD_NAME4', '0', 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES ('477', '1', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED4', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('478', '1', '0', 'TRANS_LOG_TABLE_FIELD_SUBJECT4', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('479', '1', '0', 'TRANS_LOG_TABLE_FIELD_ID5', '0', 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES ('480', '1', '0', 'TRANS_LOG_TABLE_FIELD_NAME5', '0', 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES ('481', '1', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED5', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('482', '1', '0', 'TRANS_LOG_TABLE_FIELD_SUBJECT5', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('483', '1', '0', 'TRANS_LOG_TABLE_FIELD_ID6', '0', 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES ('484', '1', '0', 'TRANS_LOG_TABLE_FIELD_NAME6', '0', 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES ('485', '1', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED6', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('486', '1', '0', 'TRANS_LOG_TABLE_FIELD_SUBJECT6', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('487', '1', '0', 'TRANS_LOG_TABLE_FIELD_ID7', '0', 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES ('488', '1', '0', 'TRANS_LOG_TABLE_FIELD_NAME7', '0', 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES ('489', '1', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED7', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('490', '1', '0', 'TRANS_LOG_TABLE_FIELD_SUBJECT7', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('491', '1', '0', 'TRANS_LOG_TABLE_FIELD_ID8', '0', 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES ('492', '1', '0', 'TRANS_LOG_TABLE_FIELD_NAME8', '0', 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES ('493', '1', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED8', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('494', '1', '0', 'TRANS_LOG_TABLE_FIELD_SUBJECT8', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('495', '1', '0', 'TRANS_LOG_TABLE_FIELD_ID9', '0', 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES ('496', '1', '0', 'TRANS_LOG_TABLE_FIELD_NAME9', '0', 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES ('497', '1', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED9', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('498', '1', '0', 'TRANS_LOG_TABLE_FIELD_SUBJECT9', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('499', '1', '0', 'TRANS_LOG_TABLE_FIELD_ID10', '0', 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES ('500', '1', '0', 'TRANS_LOG_TABLE_FIELD_NAME10', '0', 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES ('501', '1', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED10', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('502', '1', '0', 'TRANS_LOG_TABLE_FIELD_ID11', '0', 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES ('503', '1', '0', 'TRANS_LOG_TABLE_FIELD_NAME11', '0', 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES ('504', '1', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED11', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('505', '1', '0', 'TRANS_LOG_TABLE_FIELD_ID12', '0', 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES ('506', '1', '0', 'TRANS_LOG_TABLE_FIELD_NAME12', '0', 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES ('507', '1', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED12', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('508', '1', '0', 'TRANS_LOG_TABLE_FIELD_ID13', '0', 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES ('509', '1', '0', 'TRANS_LOG_TABLE_FIELD_NAME13', '0', 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES ('510', '1', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED13', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('511', '1', '0', 'TRANS_LOG_TABLE_FIELD_ID14', '0', 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES ('512', '1', '0', 'TRANS_LOG_TABLE_FIELD_NAME14', '0', 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES ('513', '1', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED14', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('514', '1', '0', 'TRANS_LOG_TABLE_FIELD_ID15', '0', 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES ('515', '1', '0', 'TRANS_LOG_TABLE_FIELD_NAME15', '0', 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES ('516', '1', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED15', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('517', '1', '0', 'TRANS_LOG_TABLE_FIELD_ID16', '0', 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES ('518', '1', '0', 'TRANS_LOG_TABLE_FIELD_NAME16', '0', 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES ('519', '1', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED16', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('520', '1', '0', 'TRANS_LOG_TABLE_FIELD_ID17', '0', 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES ('521', '1', '0', 'TRANS_LOG_TABLE_FIELD_NAME17', '0', 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES ('522', '1', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED17', '0', 'N');
INSERT INTO `r_trans_attribute` VALUES ('523', '1', '0', 'TRANS_LOG_TABLE_FIELD_ID18', '0', 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES ('524', '1', '0', 'TRANS_LOG_TABLE_FIELD_NAME18', '0', 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES ('525', '1', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED18', '0', 'N');
INSERT INTO `r_trans_attribute` VALUES ('526', '1', '0', 'TRANS_LOG_TABLE_FIELD_ID19', '0', 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES ('527', '1', '0', 'TRANS_LOG_TABLE_FIELD_NAME19', '0', 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES ('528', '1', '0', 'TRANS_LOG_TABLE_FIELD_ENABLED19', '0', 'N');
INSERT INTO `r_trans_attribute` VALUES ('529', '1', '0', 'TRANSLOG_TABLE_INTERVAL', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('530', '1', '0', 'TRANSLOG_TABLE_SIZE_LIMIT', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('531', '1', '0', 'STEP_LOG_TABLE_CONNECTION_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('532', '1', '0', 'STEP_LOG_TABLE_SCHEMA_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('533', '1', '0', 'STEP_LOG_TABLE_TABLE_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('534', '1', '0', 'STEP_LOG_TABLE_TIMEOUT_IN_DAYS', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('535', '1', '0', 'STEP_LOG_TABLE_FIELD_ID0', '0', 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES ('536', '1', '0', 'STEP_LOG_TABLE_FIELD_NAME0', '0', 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES ('537', '1', '0', 'STEP_LOG_TABLE_FIELD_ENABLED0', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('538', '1', '0', 'STEP_LOG_TABLE_FIELD_ID1', '0', 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES ('539', '1', '0', 'STEP_LOG_TABLE_FIELD_NAME1', '0', 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES ('540', '1', '0', 'STEP_LOG_TABLE_FIELD_ENABLED1', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('541', '1', '0', 'STEP_LOG_TABLE_FIELD_ID2', '0', 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES ('542', '1', '0', 'STEP_LOG_TABLE_FIELD_NAME2', '0', 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES ('543', '1', '0', 'STEP_LOG_TABLE_FIELD_ENABLED2', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('544', '1', '0', 'STEP_LOG_TABLE_FIELD_ID3', '0', 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES ('545', '1', '0', 'STEP_LOG_TABLE_FIELD_NAME3', '0', 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES ('546', '1', '0', 'STEP_LOG_TABLE_FIELD_ENABLED3', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('547', '1', '0', 'STEP_LOG_TABLE_FIELD_ID4', '0', 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES ('548', '1', '0', 'STEP_LOG_TABLE_FIELD_NAME4', '0', 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES ('549', '1', '0', 'STEP_LOG_TABLE_FIELD_ENABLED4', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('550', '1', '0', 'STEP_LOG_TABLE_FIELD_ID5', '0', 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES ('551', '1', '0', 'STEP_LOG_TABLE_FIELD_NAME5', '0', 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES ('552', '1', '0', 'STEP_LOG_TABLE_FIELD_ENABLED5', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('553', '1', '0', 'STEP_LOG_TABLE_FIELD_ID6', '0', 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES ('554', '1', '0', 'STEP_LOG_TABLE_FIELD_NAME6', '0', 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES ('555', '1', '0', 'STEP_LOG_TABLE_FIELD_ENABLED6', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('556', '1', '0', 'STEP_LOG_TABLE_FIELD_ID7', '0', 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES ('557', '1', '0', 'STEP_LOG_TABLE_FIELD_NAME7', '0', 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES ('558', '1', '0', 'STEP_LOG_TABLE_FIELD_ENABLED7', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('559', '1', '0', 'STEP_LOG_TABLE_FIELD_ID8', '0', 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES ('560', '1', '0', 'STEP_LOG_TABLE_FIELD_NAME8', '0', 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES ('561', '1', '0', 'STEP_LOG_TABLE_FIELD_ENABLED8', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('562', '1', '0', 'STEP_LOG_TABLE_FIELD_ID9', '0', 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES ('563', '1', '0', 'STEP_LOG_TABLE_FIELD_NAME9', '0', 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES ('564', '1', '0', 'STEP_LOG_TABLE_FIELD_ENABLED9', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('565', '1', '0', 'STEP_LOG_TABLE_FIELD_ID10', '0', 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES ('566', '1', '0', 'STEP_LOG_TABLE_FIELD_NAME10', '0', 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES ('567', '1', '0', 'STEP_LOG_TABLE_FIELD_ENABLED10', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('568', '1', '0', 'STEP_LOG_TABLE_FIELD_ID11', '0', 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES ('569', '1', '0', 'STEP_LOG_TABLE_FIELD_NAME11', '0', 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES ('570', '1', '0', 'STEP_LOG_TABLE_FIELD_ENABLED11', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('571', '1', '0', 'STEP_LOG_TABLE_FIELD_ID12', '0', 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES ('572', '1', '0', 'STEP_LOG_TABLE_FIELD_NAME12', '0', 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES ('573', '1', '0', 'STEP_LOG_TABLE_FIELD_ENABLED12', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('574', '1', '0', 'STEP_LOG_TABLE_FIELD_ID13', '0', 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES ('575', '1', '0', 'STEP_LOG_TABLE_FIELD_NAME13', '0', 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES ('576', '1', '0', 'STEP_LOG_TABLE_FIELD_ENABLED13', '0', 'N');
INSERT INTO `r_trans_attribute` VALUES ('577', '1', '0', 'PERFORMANCE_LOG_TABLE_CONNECTION_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('578', '1', '0', 'PERFORMANCE_LOG_TABLE_SCHEMA_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('579', '1', '0', 'PERFORMANCE_LOG_TABLE_TABLE_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('580', '1', '0', 'PERFORMANCE_LOG_TABLE_TIMEOUT_IN_DAYS', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('581', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID0', '0', 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES ('582', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME0', '0', 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES ('583', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED0', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('584', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID1', '0', 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES ('585', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME1', '0', 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES ('586', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED1', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('587', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID2', '0', 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES ('588', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME2', '0', 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES ('589', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED2', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('590', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID3', '0', 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES ('591', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME3', '0', 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES ('592', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED3', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('593', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID4', '0', 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES ('594', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME4', '0', 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES ('595', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED4', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('596', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID5', '0', 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES ('597', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME5', '0', 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES ('598', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED5', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('599', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID6', '0', 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES ('600', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME6', '0', 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES ('601', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED6', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('602', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID7', '0', 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES ('603', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME7', '0', 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES ('604', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED7', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('605', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID8', '0', 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES ('606', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME8', '0', 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES ('607', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED8', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('608', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID9', '0', 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES ('609', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME9', '0', 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES ('610', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED9', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('611', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID10', '0', 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES ('612', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME10', '0', 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES ('613', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED10', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('614', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID11', '0', 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES ('615', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME11', '0', 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES ('616', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED11', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('617', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID12', '0', 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES ('618', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME12', '0', 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES ('619', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED12', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('620', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID13', '0', 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES ('621', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME13', '0', 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES ('622', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED13', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('623', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ID14', '0', 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES ('624', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_NAME14', '0', 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES ('625', '1', '0', 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED14', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('626', '1', '0', 'PERFORMANCELOG_TABLE_INTERVAL', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('627', '1', '0', 'CHANNEL_LOG_TABLE_CONNECTION_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('628', '1', '0', 'CHANNEL_LOG_TABLE_SCHEMA_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('629', '1', '0', 'CHANNEL_LOG_TABLE_TABLE_NAME', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('630', '1', '0', 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', '0', null);
INSERT INTO `r_trans_attribute` VALUES ('631', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID0', '0', 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES ('632', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME0', '0', 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES ('633', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('634', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID1', '0', 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES ('635', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME1', '0', 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES ('636', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('637', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID2', '0', 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES ('638', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME2', '0', 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES ('639', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('640', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID3', '0', 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES ('641', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME3', '0', 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES ('642', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('643', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID4', '0', 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES ('644', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME4', '0', 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES ('645', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('646', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID5', '0', 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES ('647', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME5', '0', 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES ('648', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('649', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID6', '0', 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES ('650', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME6', '0', 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES ('651', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('652', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID7', '0', 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES ('653', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME7', '0', 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES ('654', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('655', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID8', '0', 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES ('656', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME8', '0', 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES ('657', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('658', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID9', '0', 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES ('659', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME9', '0', 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES ('660', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('661', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID10', '0', 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES ('662', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME10', '0', 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES ('663', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', '0', 'Y');
INSERT INTO `r_trans_attribute` VALUES ('664', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID11', '0', 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES ('665', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME11', '0', 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES ('666', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', '0', 'Y');
INSERT INTO `r_trans_hop` VALUES ('1', '1', '1', '2', '1');
INSERT INTO `r_transformation` VALUES ('1', '0', 'tran01', null, null, null, '0', null, null, null, null, null, '-1', null, '1', '1', '-1', null, null, '0', '0', '-', '2016-06-27 09:32:20', 'admin', '2016-06-27 12:09:44', '10000');
INSERT INTO `r_transformation` VALUES ('2', '1', 'tran02', null, null, null, '0', null, null, null, null, null, '-1', null, '1', '1', '-1', null, null, '0', '0', '-', '2016-06-27 09:33:01', 'admin', '2016-06-27 09:33:13', '10000');
INSERT INTO `r_user` VALUES ('1', 'admin', '2be98afc86aa7f2e4cb79ce71da9fa6d4', 'Administrator', 'User manager', '1');
INSERT INTO `r_user` VALUES ('2', 'guest', '2be98afc86aa7f2e4cb79ce77cb97bcce', 'Guest account', 'Read-only guest account', '1');
INSERT INTO `r_version` VALUES ('1', '5', '0', '2016-06-24 10:16:28', '0');
INSERT INTO `r_version` VALUES ('2', '5', '0', '2016-06-24 13:04:47', '1');
INSERT INTO `r_version` VALUES ('3', '5', '0', '2016-06-27 09:31:01', '1');
