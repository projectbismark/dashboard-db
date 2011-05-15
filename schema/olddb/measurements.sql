DROP TABLE IF EXISTS MEASUREMENTS;
CREATE TABLE MEASUREMENTS (
  id integer NOT NULL,
  deviceid varchar(15) default NULL,
  userid integer default NULL,
  srcip numeric(16) default NULL,
  dstip numeric(16) default NULL,
  timestamp numeric(20) default NULL,
  param varchar(20) default NULL,
  avg double precision default NULL,
  std double precision default NULL,
  min double precision default NULL,
  max double precision default NULL,
  med double precision default NULL,
  iqr double precision default NULL,
  tool varchar(20) default NULL,
  PRIMARY KEY  (id)
);
