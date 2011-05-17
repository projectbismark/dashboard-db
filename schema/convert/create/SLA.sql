CREATE TABLE SLA (
  slaid integer NOT NULL,
  isp varchar(30) default NULL,
  sla varchar(50) default NULL,
  dl integer default NULL,
  ul integer default NULL,
  PRIMARY KEY  (slaid)
);
