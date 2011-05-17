CREATE TABLE DEVICES (
  deviceid varchar(15) NOT NULL default '',
  macid varchar(20) default NULL,
  type varchar(20) default NULL,
  os varchar(10) default NULL,
  version varchar(10) default NULL,
  PRIMARY KEY  (deviceid)
);
