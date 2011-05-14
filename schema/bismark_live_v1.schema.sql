-- MySQL dump 10.11
--
-- Host: localhost    Database: bismark_live_v1
-- ------------------------------------------------------
-- Server version	5.0.51a-24+lenny2+spu1
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,POSTGRESQL' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table "APPS"
--

DROP TABLE IF EXISTS "APPS";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "APPS" (
  "appid" smallint(5) unsigned NOT NULL,
  "subid" smallint(3) unsigned NOT NULL,
  "catid" smallint(3) unsigned NOT NULL,
  "app" varchar(20) NOT NULL,
  "subapp" varchar(30) NOT NULL,
  "description" text NOT NULL,
  PRIMARY KEY  ("appid","subid")
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "ARP_LOGS"
--

DROP TABLE IF EXISTS "ARP_LOGS";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "ARP_LOGS" (
  "deviceid" varchar(15) default NULL,
  "timestamp" bigint(20) default NULL,
  "macid" varchar(20) default NULL,
  "ip" bigint(20) default NULL,
  UNIQUE KEY "deviceid" ("deviceid","timestamp","macid","ip"),
  KEY "arp_logs_macid" ("macid")
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "DEVICES"
--

DROP TABLE IF EXISTS "DEVICES";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "DEVICES" (
  "deviceid" varchar(15) NOT NULL default '',
  "macid" varchar(20) default NULL,
  "type" varchar(20) default NULL,
  "os" varchar(10) default NULL,
  "version" varchar(10) default NULL,
  PRIMARY KEY  ("deviceid")
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "DHCP_LOGS"
--

DROP TABLE IF EXISTS "DHCP_LOGS";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "DHCP_LOGS" (
  "DEVICEID" varchar(15) default NULL,
  "TIMESTAMP" bigint(20) default NULL,
  "ACTION" varchar(20) default NULL,
  "IP" bigint(20) default NULL,
  "MACID" varchar(20) default NULL,
  "CLIENT" varchar(50) default NULL,
  UNIQUE KEY "DEVICEID" ("DEVICEID","TIMESTAMP","ACTION","IP","MACID","CLIENT"),
  KEY "dhcp_logs_event" ("ACTION"),
  KEY "dhcp_logs_macid" ("MACID"),
  KEY "dhcp_logs_client" ("CLIENT")
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "EVENTS"
--

DROP TABLE IF EXISTS "EVENTS";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "EVENTS" (
  "eventid" int(11) NOT NULL,
  "event" varchar(50) default NULL,
  PRIMARY KEY  ("eventid")
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "EVENT_LOGS"
--

DROP TABLE IF EXISTS "EVENT_LOGS";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "EVENT_LOGS" (
  "deviceid" varchar(15) default NULL,
  "timestamp" bigint(20) default NULL,
  "eventid" int(11) default NULL,
  UNIQUE KEY "deviceid" ("deviceid","timestamp","eventid"),
  KEY "event_logs_event" ("eventid")
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "FLOWS"
--

DROP TABLE IF EXISTS "FLOWS";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "FLOWS" (
  "uid" bigint(20) unsigned NOT NULL,
  "flowid" bigint(20) unsigned NOT NULL,
  "deviceid" varchar(15) NOT NULL,
  "srcip" int(10) unsigned NOT NULL,
  "dstip" int(10) unsigned NOT NULL,
  "proto" smallint(3) unsigned NOT NULL,
  "srcport" smallint(5) unsigned NOT NULL,
  "dstport" smallint(5) unsigned NOT NULL,
  "uppkts" bigint(20) unsigned NOT NULL,
  "dwpkts" bigint(20) unsigned NOT NULL,
  "upbytes" bigint(20) unsigned NOT NULL,
  "dwbytes" bigint(20) unsigned NOT NULL,
  "tsstart" numeric(17,6) unsigned NOT NULL,
  "tsend" numeric(17,6) unsigned NOT NULL,
  "appid" smallint(5) unsigned NOT NULL,
  PRIMARY KEY  ("uid"),
  UNIQUE KEY "NODUPS" ("flowid","deviceid","tsstart"),
  KEY "startidx" ("tsstart"),
  KEY "dstipidx" ("dstip"),
  KEY "srcipidx" ("srcip"),
  KEY "dstportidx" ("dstport"),
  KEY "srcportidx" ("srcport"),
  KEY "appidx" ("appid"),
  KEY "index_flows_deviceid" ("deviceid")
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "FLOWS_17jul_26oct_2010"
--

DROP TABLE IF EXISTS "FLOWS_17jul_26oct_2010";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "FLOWS_17jul_26oct_2010" (
  "uid" bigint(20) NOT NULL,
  "flowid" bigint(20) unsigned NOT NULL,
  "deviceid" varchar(15) NOT NULL,
  "srcip" bigint(20) NOT NULL,
  "dstip" bigint(20) NOT NULL,
  "proto" int(11) NOT NULL,
  "srcport" int(11) NOT NULL,
  "dstport" int(11) NOT NULL,
  "uppkts" int(11) NOT NULL,
  "dwpkts" int(11) NOT NULL,
  "upbytes" int(11) NOT NULL,
  "dwbytes" int(11) NOT NULL,
  "tsstart" double NOT NULL,
  "tsend" double NOT NULL,
  "app" varchar(20) NOT NULL,
  PRIMARY KEY  ("uid"),
  UNIQUE KEY "NODUPS" ("flowid","deviceid","tsstart"),
  KEY "deviceid" ("deviceid","srcip","dstip","proto","dstport","app")
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "FLOWS_26oct_7dec_2010"
--

DROP TABLE IF EXISTS "FLOWS_26oct_7dec_2010";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "FLOWS_26oct_7dec_2010" (
  "uid" bigint(20) NOT NULL,
  "flowid" bigint(20) unsigned NOT NULL,
  "deviceid" varchar(15) NOT NULL,
  "srcip" bigint(20) NOT NULL,
  "dstip" bigint(20) NOT NULL,
  "proto" int(11) NOT NULL,
  "srcport" int(11) NOT NULL,
  "dstport" int(11) NOT NULL,
  "uppkts" int(11) NOT NULL,
  "dwpkts" int(11) NOT NULL,
  "upbytes" int(11) NOT NULL,
  "dwbytes" int(11) NOT NULL,
  "tsstart" bigint(20) unsigned NOT NULL,
  "tsend" bigint(20) unsigned NOT NULL,
  "app" varchar(20) NOT NULL,
  PRIMARY KEY  ("uid"),
  UNIQUE KEY "NODUPS" ("flowid","deviceid","tsstart"),
  KEY "deviceid" ("deviceid","srcip","dstip","proto","dstport","app"),
  KEY "index_flows_srcip" ("srcip")
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "FLOWS_SAMPLES"
--

DROP TABLE IF EXISTS "FLOWS_SAMPLES";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "FLOWS_SAMPLES" (
  "uid" bigint(11) unsigned NOT NULL,
  "uppkts" int(11) unsigned NOT NULL,
  "dwpkts" int(11) unsigned NOT NULL,
  "upbytes" int(11) unsigned NOT NULL,
  "dwbytes" int(11) unsigned NOT NULL,
  "tsstart" numeric(17,6) unsigned NOT NULL,
  "tsend" numeric(17,6) unsigned NOT NULL,
  UNIQUE KEY "uid" ("uid","tsend"),
  KEY "tsstartidx" ("tsstart")
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "FLOWS_SAMPLES_17jul_26oct_2010"
--

DROP TABLE IF EXISTS "FLOWS_SAMPLES_17jul_26oct_2010";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "FLOWS_SAMPLES_17jul_26oct_2010" (
  "uid" bigint(11) NOT NULL,
  "uppkts" int(11) NOT NULL,
  "dwpkts" int(11) NOT NULL,
  "upbytes" int(11) NOT NULL,
  "dwbytes" int(11) NOT NULL,
  "tsstart" double NOT NULL,
  "tsend" double NOT NULL,
  UNIQUE KEY "uid" ("uid","tsend"),
  CONSTRAINT "FLOWS_SAMPLES_17jul_26oct_2010_ibfk_1" FOREIGN KEY ("uid") REFERENCES "FLOWS_17jul_26oct_2010" ("uid") ON DELETE CASCADE ON UPDATE CASCADE
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "FLOWS_SAMPLES_26oct_7dec_2010"
--

DROP TABLE IF EXISTS "FLOWS_SAMPLES_26oct_7dec_2010";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "FLOWS_SAMPLES_26oct_7dec_2010" (
  "uid" bigint(11) NOT NULL,
  "uppkts" int(11) NOT NULL,
  "dwpkts" int(11) NOT NULL,
  "upbytes" int(11) NOT NULL,
  "dwbytes" int(11) NOT NULL,
  "tsstart" bigint(20) unsigned NOT NULL,
  "tsend" bigint(20) unsigned NOT NULL,
  UNIQUE KEY "uid" ("uid","tsend"),
  CONSTRAINT "FLOWS_SAMPLES_26oct_7dec_2010_ibfk_1" FOREIGN KEY ("uid") REFERENCES "FLOWS_26oct_7dec_2010" ("uid") ON DELETE CASCADE ON UPDATE CASCADE
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "FLOWS_SAMPLES_newformat"
--

DROP TABLE IF EXISTS "FLOWS_SAMPLES_newformat";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "FLOWS_SAMPLES_newformat" (
  "uid" bigint(11) unsigned NOT NULL,
  "uppkts" int(11) unsigned NOT NULL,
  "dwpkts" int(11) unsigned NOT NULL,
  "upbytes" int(11) unsigned NOT NULL,
  "dwbytes" int(11) unsigned NOT NULL,
  "tsstart" numeric(17,6) unsigned NOT NULL,
  "tsend" numeric(17,6) unsigned NOT NULL,
  UNIQUE KEY "uid" ("uid","tsend"),
  KEY "tsstartidx" ("tsstart")
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "FLOWS_newformat"
--

DROP TABLE IF EXISTS "FLOWS_newformat";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "FLOWS_newformat" (
  "uid" bigint(20) unsigned NOT NULL,
  "flowid" bigint(20) unsigned NOT NULL,
  "deviceid" varchar(15) NOT NULL,
  "srcip" int(10) unsigned NOT NULL,
  "dstip" int(10) unsigned NOT NULL,
  "proto" smallint(3) unsigned NOT NULL,
  "srcport" smallint(5) unsigned NOT NULL,
  "dstport" smallint(5) unsigned NOT NULL,
  "uppkts" bigint(20) unsigned NOT NULL,
  "dwpkts" bigint(20) unsigned NOT NULL,
  "upbytes" bigint(20) unsigned NOT NULL,
  "dwbytes" bigint(20) unsigned NOT NULL,
  "tsstart" numeric(17,6) unsigned NOT NULL,
  "tsend" numeric(17,6) unsigned NOT NULL,
  "appid" smallint(5) unsigned NOT NULL,
  "subid" smallint(3) unsigned NOT NULL,
  PRIMARY KEY  ("uid"),
  UNIQUE KEY "NODUPS" ("flowid","deviceid","tsstart"),
  KEY "startidx" ("tsstart"),
  KEY "dstipidx" ("dstip"),
  KEY "srcipidx" ("srcip"),
  KEY "dstportidx" ("dstport"),
  KEY "srcportidx" ("srcport"),
  KEY "appidx" ("appid"),
  KEY "subidx" ("subid"),
  KEY "deviceidx" ("deviceid")
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "MEASUREMENTS"
--

DROP TABLE IF EXISTS "MEASUREMENTS";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "MEASUREMENTS" (
  "id" int(11) NOT NULL,
  "deviceid" varchar(15) default NULL,
  "userid" int(11) default NULL,
  "srcip" bigint(20) default NULL,
  "dstip" bigint(20) default NULL,
  "timestamp" bigint(20) default NULL,
  "param" varchar(20) default NULL,
  "avg" double default NULL,
  "std" double default NULL,
  "min" double default NULL,
  "max" double default NULL,
  "med" double default NULL,
  "iqr" double default NULL,
  "tool" varchar(20) default NULL,
  PRIMARY KEY  ("id"),
  UNIQUE KEY "nodup" ("deviceid","srcip","timestamp","param"),
  KEY "measurements_deviceid" ("deviceid"),
  KEY "measurements_userid" ("userid"),
  KEY "measurements_srcip" ("srcip"),
  KEY "measurements_dstip" ("dstip"),
  KEY "measurements_param" ("param")
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "SLA"
--

DROP TABLE IF EXISTS "SLA";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "SLA" (
  "slaid" int(11) NOT NULL,
  "isp" varchar(30) default NULL,
  "sla" varchar(50) default NULL,
  "dl" int(11) default NULL,
  "ul" int(11) default NULL,
  PRIMARY KEY  ("slaid")
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "TRACEROUTES"
--

DROP TABLE IF EXISTS "TRACEROUTES";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "TRACEROUTES" (
  "id" int(11) NOT NULL,
  "deviceid" varchar(15) default NULL,
  "userid" int(11) default NULL,
  "srcip" bigint(20) default NULL,
  "dstip" bigint(20) default NULL,
  "timestamp" bigint(20) default NULL,
  "hops" bigint(20) default NULL,
  PRIMARY KEY  ("id"),
  KEY "traceroutes_deviceid" ("deviceid"),
  KEY "traceroutes_userid" ("userid"),
  KEY "traceroutes_srcip" ("srcip"),
  KEY "traceroutes_dstip" ("dstip")
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "TRACEROUTE_HOPS"
--

DROP TABLE IF EXISTS "TRACEROUTE_HOPS";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "TRACEROUTE_HOPS" (
  "tid" int(11) default NULL,
  "id" int(11) default NULL,
  "ip" bigint(20) default NULL,
  "rtt" double default NULL,
  KEY "traceroute_hops_tid" ("tid")
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "USERDEVICE"
--

DROP TABLE IF EXISTS "USERDEVICE";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "USERDEVICE" (
  "userid" int(11) default NULL,
  "deviceid" varchar(15) default NULL,
  "start" bigint(20) default NULL,
  "end" bigint(20) default NULL
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "USERS"
--

DROP TABLE IF EXISTS "USERS";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "USERS" (
  "userid" int(11) NOT NULL,
  "name" varchar(100) default NULL,
  "email" varchar(30) default NULL,
  "address" varchar(300) default NULL,
  "phone" varchar(20) default NULL,
  PRIMARY KEY  ("userid")
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "USERSLA"
--

DROP TABLE IF EXISTS "USERSLA";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "USERSLA" (
  "userid" int(11) default NULL,
  "slaid" int(11) default NULL,
  "start" bigint(20) default NULL,
  "end" bigint(20) default NULL
);
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view "VIEW_MEASUREMENTS"
--

DROP TABLE IF EXISTS "VIEW_MEASUREMENTS";
/*!50001 DROP VIEW IF EXISTS "VIEW_MEASUREMENTS"*/;
/*!50001 CREATE TABLE "VIEW_MEASUREMENTS" (
  "slaid" int(11),
  "isp" varchar(30),
  "sla" varchar(50),
  "sla_start" bigint(20),
  "sla_end" bigint(20),
  "id" int(11),
  "deviceid" varchar(15),
  "userid" int(11),
  "srcip" bigint(20),
  "dstip" bigint(20),
  "timestamp" bigint(20),
  "param" varchar(20),
  "avg" double,
  "std" double,
  "min" double,
  "max" double,
  "med" double,
  "iqr" double,
  "tool" varchar(20)
) */;

--
-- Table structure for table "WIFI_ASSOC"
--

DROP TABLE IF EXISTS "WIFI_ASSOC";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "WIFI_ASSOC" (
  "STATIONMAC" varchar(20) default NULL,
  "FIRSTSEEN" bigint(20) default NULL,
  "LASTSEEN" bigint(20) default NULL,
  "POWER" int(11) default NULL,
  "NUMPKTS" int(11) default NULL,
  "BSSID" varchar(20) default NULL,
  "PROBEDESSID" varchar(50) default NULL,
  "DEVICEID" varchar(15) default NULL,
  KEY "index_wifi_assoc_deviceid" ("DEVICEID")
);
SET character_set_client = @saved_cs_client;

--
-- Table structure for table "WIFI_SCAN"
--

DROP TABLE IF EXISTS "WIFI_SCAN";
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE "WIFI_SCAN" (
  "DEVICEID" varchar(15) default NULL,
  "BSSID" varchar(20) default NULL,
  "FIRSTSEEN" bigint(20) default NULL,
  "LASTSEEN" bigint(20) default NULL,
  "CHANNEL" int(11) default NULL,
  "SPEED" int(11) default NULL,
  "PRIVACY" varchar(50) default NULL,
  "CIPHER" varchar(50) default NULL,
  "AUTH" varchar(50) default NULL,
  "POWER" int(11) default NULL,
  "NUMBEACONS" int(11) default NULL,
  "NUMIV" int(11) default NULL,
  "IDLEN" int(11) default NULL,
  "ESSID" varchar(50) default NULL,
  KEY "index_wifi_scan_deviceid" ("DEVICEID")
);
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view "VIEW_MEASUREMENTS"
--

/*!50001 DROP TABLE "VIEW_MEASUREMENTS"*/;
/*!50001 DROP VIEW IF EXISTS "VIEW_MEASUREMENTS"*/;
/*!50001 CREATE VIEW "VIEW_MEASUREMENTS" AS select "USERSLA"."slaid" AS "slaid","SLA"."isp" AS "isp","SLA"."sla" AS "sla","USERSLA"."start" AS "sla_start","USERSLA"."end" AS "sla_end","MEASUREMENTS"."id" AS "id","MEASUREMENTS"."deviceid" AS "deviceid","MEASUREMENTS"."userid" AS "userid","MEASUREMENTS"."srcip" AS "srcip","MEASUREMENTS"."dstip" AS "dstip","MEASUREMENTS"."timestamp" AS "timestamp","MEASUREMENTS"."param" AS "param","MEASUREMENTS"."avg" AS "avg","MEASUREMENTS"."std" AS "std","MEASUREMENTS"."min" AS "min","MEASUREMENTS"."max" AS "max","MEASUREMENTS"."med" AS "med","MEASUREMENTS"."iqr" AS "iqr","MEASUREMENTS"."tool" AS "tool" from (((("USERS" join "USERSLA") join "USERDEVICE") join "SLA") join "MEASUREMENTS") where (("USERS"."userid" = "USERSLA"."userid") and ("USERDEVICE"."userid" = "USERSLA"."userid") and ("SLA"."slaid" = "USERSLA"."slaid") and ("USERSLA"."userid" = "MEASUREMENTS"."userid")) */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-04-06 21:42:42
