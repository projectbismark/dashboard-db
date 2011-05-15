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

CREATE TABLE measurements_old (
    id numeric(11,0) NOT NULL,
    deviceid character varying(15) DEFAULT NULL::character varying,
    srcip numeric(20,0) DEFAULT NULL::numeric,
    dstip numeric(20,0) DEFAULT NULL::numeric,
    "timestamp" numeric(20,0) DEFAULT NULL::numeric,
    param character varying(20) DEFAULT NULL::character varying,
    avg double precision,
    std double precision,
    min double precision,
    max double precision,
    med double precision,
    iqr double precision,
    tool character varying(20) DEFAULT NULL::character varying
);



