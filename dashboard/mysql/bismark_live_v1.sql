-- MySQL dump 10.11
--
-- Host: localhost    Database: bismark_live_v1
-- ------------------------------------------------------
-- Server version	5.0.51a-24+lenny5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `APPS`
--

DROP TABLE IF EXISTS `APPS`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `APPS` (
  `appid` smallint(5) unsigned NOT NULL,
  `subid` tinyint(3) unsigned NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL,
  `app` varchar(20) NOT NULL,
  `subapp` varchar(30) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY  (`appid`,`subid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ARP_LOGS`
--

DROP TABLE IF EXISTS `ARP_LOGS`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ARP_LOGS` (
  `deviceid` varchar(15) default NULL,
  `timestamp` bigint(20) default NULL,
  `macid` varchar(20) default NULL,
  `ip` bigint(20) default NULL,
  UNIQUE KEY `deviceid` (`deviceid`,`timestamp`,`macid`,`ip`),
  KEY `arp_logs_macid` (`macid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `DEVICES`
--

DROP TABLE IF EXISTS `DEVICES`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `DEVICES` (
  `deviceid` varchar(15) NOT NULL default '',
  `macid` varchar(20) default NULL,
  `type` varchar(20) default NULL,
  `os` varchar(10) default NULL,
  `version` varchar(10) default NULL,
  PRIMARY KEY  (`deviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `DHCP_LOGS`
--

DROP TABLE IF EXISTS `DHCP_LOGS`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `DHCP_LOGS` (
  `DEVICEID` varchar(15) default NULL,
  `TIMESTAMP` bigint(20) default NULL,
  `ACTION` varchar(20) default NULL,
  `IP` bigint(20) default NULL,
  `MACID` varchar(20) default NULL,
  `CLIENT` varchar(50) default NULL,
  UNIQUE KEY `DEVICEID` (`DEVICEID`,`TIMESTAMP`,`ACTION`,`IP`,`MACID`,`CLIENT`),
  KEY `dhcp_logs_event` (`ACTION`),
  KEY `dhcp_logs_macid` (`MACID`),
  KEY `dhcp_logs_client` (`CLIENT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `EVENTS`
--

DROP TABLE IF EXISTS `EVENTS`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `EVENTS` (
  `eventid` int(11) NOT NULL auto_increment,
  `event` varchar(50) default NULL,
  PRIMARY KEY  (`eventid`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `EVENT_LOGS`
--

DROP TABLE IF EXISTS `EVENT_LOGS`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `EVENT_LOGS` (
  `deviceid` varchar(15) default NULL,
  `timestamp` bigint(20) default NULL,
  `eventid` int(11) default NULL,
  UNIQUE KEY `deviceid` (`deviceid`,`timestamp`,`eventid`),
  KEY `event_logs_event` (`eventid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `FLOWS`
--

DROP TABLE IF EXISTS `FLOWS`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `FLOWS` (
  `uid` bigint(20) unsigned NOT NULL auto_increment,
  `flowid` bigint(20) unsigned NOT NULL,
  `deviceid` varchar(15) NOT NULL,
  `srcip` int(10) unsigned NOT NULL,
  `dstip` int(10) unsigned NOT NULL,
  `proto` tinyint(3) unsigned NOT NULL,
  `srcport` smallint(5) unsigned NOT NULL,
  `dstport` smallint(5) unsigned NOT NULL,
  `uppkts` bigint(20) unsigned NOT NULL,
  `dwpkts` bigint(20) unsigned NOT NULL,
  `upbytes` bigint(20) unsigned NOT NULL,
  `dwbytes` bigint(20) unsigned NOT NULL,
  `tsstart` double(17,6) unsigned NOT NULL,
  `tsend` double(17,6) unsigned NOT NULL,
  `appid` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`uid`),
  UNIQUE KEY `NODUPS` (`flowid`,`deviceid`,`tsstart`),
  KEY `startidx` (`tsstart`),
  KEY `dstipidx` (`dstip`),
  KEY `srcipidx` (`srcip`),
  KEY `dstportidx` (`dstport`),
  KEY `srcportidx` (`srcport`),
  KEY `appidx` (`appid`),
  KEY `index_flows_deviceid` (`deviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=5384332 DEFAULT CHARSET=latin1 COMMENT='Newest flow data';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `FLOWS_17jul_26oct_2010`
--

DROP TABLE IF EXISTS `FLOWS_17jul_26oct_2010`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `FLOWS_17jul_26oct_2010` (
  `uid` bigint(20) NOT NULL auto_increment,
  `flowid` bigint(20) unsigned NOT NULL,
  `deviceid` varchar(15) NOT NULL,
  `srcip` bigint(20) NOT NULL,
  `dstip` bigint(20) NOT NULL,
  `proto` int(11) NOT NULL,
  `srcport` int(11) NOT NULL,
  `dstport` int(11) NOT NULL,
  `uppkts` int(11) NOT NULL,
  `dwpkts` int(11) NOT NULL,
  `upbytes` int(11) NOT NULL,
  `dwbytes` int(11) NOT NULL,
  `tsstart` double NOT NULL,
  `tsend` double NOT NULL,
  `app` varchar(20) NOT NULL,
  PRIMARY KEY  (`uid`),
  UNIQUE KEY `NODUPS` (`flowid`,`deviceid`,`tsstart`),
  KEY `deviceid` (`deviceid`,`srcip`,`dstip`,`proto`,`dstport`,`app`)
) ENGINE=InnoDB AUTO_INCREMENT=5448557 DEFAULT CHARSET=latin1 COMMENT='Oldest flow data';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `FLOWS_26oct_7dec_2010`
--

DROP TABLE IF EXISTS `FLOWS_26oct_7dec_2010`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `FLOWS_26oct_7dec_2010` (
  `uid` bigint(20) NOT NULL auto_increment,
  `flowid` bigint(20) unsigned NOT NULL,
  `deviceid` varchar(15) NOT NULL,
  `srcip` bigint(20) NOT NULL,
  `dstip` bigint(20) NOT NULL,
  `proto` int(11) NOT NULL,
  `srcport` int(11) NOT NULL,
  `dstport` int(11) NOT NULL,
  `uppkts` int(11) NOT NULL,
  `dwpkts` int(11) NOT NULL,
  `upbytes` int(11) NOT NULL,
  `dwbytes` int(11) NOT NULL,
  `tsstart` bigint(20) unsigned NOT NULL,
  `tsend` bigint(20) unsigned NOT NULL,
  `app` varchar(20) NOT NULL,
  PRIMARY KEY  (`uid`),
  UNIQUE KEY `NODUPS` (`flowid`,`deviceid`,`tsstart`),
  KEY `deviceid` (`deviceid`,`srcip`,`dstip`,`proto`,`dstport`,`app`),
  KEY `index_flows_srcip` (`srcip`)
) ENGINE=InnoDB AUTO_INCREMENT=20505849 DEFAULT CHARSET=latin1 COMMENT='Intermediate flow data';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `FLOWS_SAMPLES`
--

DROP TABLE IF EXISTS `FLOWS_SAMPLES`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `FLOWS_SAMPLES` (
  `uid` bigint(11) unsigned NOT NULL,
  `uppkts` int(11) unsigned NOT NULL,
  `dwpkts` int(11) unsigned NOT NULL,
  `upbytes` int(11) unsigned NOT NULL,
  `dwbytes` int(11) unsigned NOT NULL,
  `tsstart` double(17,6) unsigned NOT NULL,
  `tsend` double(17,6) unsigned NOT NULL,
  UNIQUE KEY `uid` (`uid`,`tsend`),
  KEY `tsstartidx` (`tsstart`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Newest sampled flow data';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `FLOWS_SAMPLES_17jul_26oct_2010`
--

DROP TABLE IF EXISTS `FLOWS_SAMPLES_17jul_26oct_2010`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `FLOWS_SAMPLES_17jul_26oct_2010` (
  `uid` bigint(11) NOT NULL,
  `uppkts` int(11) NOT NULL,
  `dwpkts` int(11) NOT NULL,
  `upbytes` int(11) NOT NULL,
  `dwbytes` int(11) NOT NULL,
  `tsstart` double NOT NULL,
  `tsend` double NOT NULL,
  UNIQUE KEY `uid` (`uid`,`tsend`),
  CONSTRAINT `FLOWS_SAMPLES_17jul_26oct_2010_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `FLOWS_17jul_26oct_2010` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Oldest sampled flow data';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `FLOWS_SAMPLES_26oct_7dec_2010`
--

DROP TABLE IF EXISTS `FLOWS_SAMPLES_26oct_7dec_2010`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `FLOWS_SAMPLES_26oct_7dec_2010` (
  `uid` bigint(11) NOT NULL,
  `uppkts` int(11) NOT NULL,
  `dwpkts` int(11) NOT NULL,
  `upbytes` int(11) NOT NULL,
  `dwbytes` int(11) NOT NULL,
  `tsstart` bigint(20) unsigned NOT NULL,
  `tsend` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `uid` (`uid`,`tsend`),
  CONSTRAINT `FLOWS_SAMPLES_26oct_7dec_2010_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `FLOWS_26oct_7dec_2010` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Intermediate sampled flow data';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `FLOWS_SAMPLES_newformat`
--

DROP TABLE IF EXISTS `FLOWS_SAMPLES_newformat`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `FLOWS_SAMPLES_newformat` (
  `uid` bigint(11) unsigned NOT NULL,
  `uppkts` int(11) unsigned NOT NULL,
  `dwpkts` int(11) unsigned NOT NULL,
  `upbytes` int(11) unsigned NOT NULL,
  `dwbytes` int(11) unsigned NOT NULL,
  `tsstart` double(17,6) unsigned NOT NULL,
  `tsend` double(17,6) unsigned NOT NULL,
  UNIQUE KEY `uid` (`uid`,`tsend`),
  KEY `tsstartidx` (`tsstart`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Newest sampled flow data';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `FLOWS_newformat`
--

DROP TABLE IF EXISTS `FLOWS_newformat`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `FLOWS_newformat` (
  `uid` bigint(20) unsigned NOT NULL auto_increment,
  `flowid` bigint(20) unsigned NOT NULL,
  `deviceid` varchar(15) NOT NULL,
  `srcip` int(10) unsigned NOT NULL,
  `dstip` int(10) unsigned NOT NULL,
  `proto` tinyint(3) unsigned NOT NULL,
  `srcport` smallint(5) unsigned NOT NULL,
  `dstport` smallint(5) unsigned NOT NULL,
  `uppkts` bigint(20) unsigned NOT NULL,
  `dwpkts` bigint(20) unsigned NOT NULL,
  `upbytes` bigint(20) unsigned NOT NULL,
  `dwbytes` bigint(20) unsigned NOT NULL,
  `tsstart` double(17,6) unsigned NOT NULL,
  `tsend` double(17,6) unsigned NOT NULL,
  `appid` smallint(5) unsigned NOT NULL,
  `subid` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`uid`),
  UNIQUE KEY `NODUPS` (`flowid`,`deviceid`,`tsstart`),
  KEY `startidx` (`tsstart`),
  KEY `dstipidx` (`dstip`),
  KEY `srcipidx` (`srcip`),
  KEY `dstportidx` (`dstport`),
  KEY `srcportidx` (`srcport`),
  KEY `appidx` (`appid`),
  KEY `subidx` (`subid`),
  KEY `deviceidx` (`deviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=113899906 DEFAULT CHARSET=latin1 COMMENT='Newest flow data';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `MEASUREMENTS`
--

DROP TABLE IF EXISTS `MEASUREMENTS`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `MEASUREMENTS` (
  `id` int(11) NOT NULL auto_increment,
  `deviceid` varchar(15) default NULL,
  `userid` int(11) default NULL,
  `srcip` bigint(20) default NULL,
  `dstip` bigint(20) default NULL,
  `timestamp` bigint(20) default NULL,
  `param` varchar(20) default NULL,
  `avg` double default NULL,
  `std` double default NULL,
  `min` double default NULL,
  `max` double default NULL,
  `med` double default NULL,
  `iqr` double default NULL,
  `tool` varchar(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `nodup` (`deviceid`,`srcip`,`timestamp`,`param`),
  KEY `measurements_deviceid` (`deviceid`),
  KEY `measurements_userid` (`userid`),
  KEY `measurements_srcip` (`srcip`),
  KEY `measurements_dstip` (`dstip`),
  KEY `measurements_param` (`param`)
) ENGINE=MyISAM AUTO_INCREMENT=4903384 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `SLA`
--

DROP TABLE IF EXISTS `SLA`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `SLA` (
  `slaid` int(11) NOT NULL auto_increment,
  `isp` varchar(30) default NULL,
  `sla` varchar(50) default NULL,
  `dl` int(11) default NULL,
  `ul` int(11) default NULL,
  PRIMARY KEY  (`slaid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `TRACEROUTES`
--

DROP TABLE IF EXISTS `TRACEROUTES`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `TRACEROUTES` (
  `id` int(11) NOT NULL auto_increment,
  `deviceid` varchar(15) default NULL,
  `userid` int(11) default NULL,
  `srcip` bigint(20) default NULL,
  `dstip` bigint(20) default NULL,
  `timestamp` bigint(20) default NULL,
  `hops` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `traceroutes_deviceid` (`deviceid`),
  KEY `traceroutes_userid` (`userid`),
  KEY `traceroutes_srcip` (`srcip`),
  KEY `traceroutes_dstip` (`dstip`)
) ENGINE=MyISAM AUTO_INCREMENT=369687 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `TRACEROUTE_HOPS`
--

DROP TABLE IF EXISTS `TRACEROUTE_HOPS`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `TRACEROUTE_HOPS` (
  `tid` int(11) default NULL,
  `id` int(11) default NULL,
  `ip` bigint(20) default NULL,
  `rtt` double default NULL,
  KEY `traceroute_hops_tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `USERDEVICE`
--

DROP TABLE IF EXISTS `USERDEVICE`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `USERDEVICE` (
  `userid` int(11) default NULL,
  `deviceid` varchar(15) default NULL,
  `start` bigint(20) default NULL,
  `end` bigint(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `USERS` (
  `userid` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `email` varchar(30) default NULL,
  `address` varchar(300) default NULL,
  `phone` varchar(20) default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `USERSLA`
--

DROP TABLE IF EXISTS `USERSLA`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `USERSLA` (
  `userid` int(11) default NULL,
  `slaid` int(11) default NULL,
  `start` bigint(20) default NULL,
  `end` bigint(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `VIEW_MEASUREMENTS`
--

DROP TABLE IF EXISTS `VIEW_MEASUREMENTS`;
/*!50001 DROP VIEW IF EXISTS `VIEW_MEASUREMENTS`*/;
/*!50001 CREATE TABLE `VIEW_MEASUREMENTS` (
  `slaid` int(11),
  `isp` varchar(30),
  `sla` varchar(50),
  `sla_start` bigint(20),
  `sla_end` bigint(20),
  `id` int(11),
  `deviceid` varchar(15),
  `userid` int(11),
  `srcip` bigint(20),
  `dstip` bigint(20),
  `timestamp` bigint(20),
  `param` varchar(20),
  `avg` double,
  `std` double,
  `min` double,
  `max` double,
  `med` double,
  `iqr` double,
  `tool` varchar(20)
) */;

--
-- Table structure for table `WIFI_ASSOC`
--

DROP TABLE IF EXISTS `WIFI_ASSOC`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `WIFI_ASSOC` (
  `STATIONMAC` varchar(20) default NULL,
  `FIRSTSEEN` bigint(20) default NULL,
  `LASTSEEN` bigint(20) default NULL,
  `POWER` int(11) default NULL,
  `NUMPKTS` int(11) default NULL,
  `BSSID` varchar(20) default NULL,
  `PROBEDESSID` varchar(50) default NULL,
  `DEVICEID` varchar(15) default NULL,
  KEY `index_wifi_assoc_deviceid` (`DEVICEID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `WIFI_SCAN`
--

DROP TABLE IF EXISTS `WIFI_SCAN`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `WIFI_SCAN` (
  `DEVICEID` varchar(15) default NULL,
  `BSSID` varchar(20) default NULL,
  `FIRSTSEEN` bigint(20) default NULL,
  `LASTSEEN` bigint(20) default NULL,
  `CHANNEL` int(11) default NULL,
  `SPEED` int(11) default NULL,
  `PRIVACY` varchar(50) default NULL,
  `CIPHER` varchar(50) default NULL,
  `AUTH` varchar(50) default NULL,
  `POWER` int(11) default NULL,
  `NUMBEACONS` int(11) default NULL,
  `NUMIV` int(11) default NULL,
  `IDLEN` int(11) default NULL,
  `ESSID` varchar(50) default NULL,
  KEY `index_wifi_scan_deviceid` (`DEVICEID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_a7792de1` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `auth_message_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_f0ee9890` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_67e79cb` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL auto_increment,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) default NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `django_admin_log_user_id` (`user_id`),
  KEY `django_admin_log_content_type_id` (`content_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY  (`session_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL auto_increment,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `VIEW_MEASUREMENTS`
--

/*!50001 DROP TABLE `VIEW_MEASUREMENTS`*/;
/*!50001 DROP VIEW IF EXISTS `VIEW_MEASUREMENTS`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VIEW_MEASUREMENTS` AS select `USERSLA`.`slaid` AS `slaid`,`SLA`.`isp` AS `isp`,`SLA`.`sla` AS `sla`,`USERSLA`.`start` AS `sla_start`,`USERSLA`.`end` AS `sla_end`,`MEASUREMENTS`.`id` AS `id`,`MEASUREMENTS`.`deviceid` AS `deviceid`,`MEASUREMENTS`.`userid` AS `userid`,`MEASUREMENTS`.`srcip` AS `srcip`,`MEASUREMENTS`.`dstip` AS `dstip`,`MEASUREMENTS`.`timestamp` AS `timestamp`,`MEASUREMENTS`.`param` AS `param`,`MEASUREMENTS`.`avg` AS `avg`,`MEASUREMENTS`.`std` AS `std`,`MEASUREMENTS`.`min` AS `min`,`MEASUREMENTS`.`max` AS `max`,`MEASUREMENTS`.`med` AS `med`,`MEASUREMENTS`.`iqr` AS `iqr`,`MEASUREMENTS`.`tool` AS `tool` from ((((`USERS` join `USERSLA`) join `USERDEVICE`) join `SLA`) join `MEASUREMENTS`) where ((`USERS`.`userid` = `USERSLA`.`userid`) and (`USERDEVICE`.`userid` = `USERSLA`.`userid`) and (`SLA`.`slaid` = `USERSLA`.`slaid`) and (`USERSLA`.`userid` = `MEASUREMENTS`.`userid`)) */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-04-22  4:28:09
