CREATE TABLE "SLA" (
  "slaid" int(11) NOT NULL,
  "isp" varchar(30) default NULL,
  "sla" varchar(50) default NULL,
  "dl" int(11) default NULL,
  "ul" int(11) default NULL,
  PRIMARY KEY  ("slaid")
);
