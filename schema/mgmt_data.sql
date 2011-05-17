\i defaults.cfg
-- delete from tools;
-- tool types

insert into tools(tool,version,tool_desc) values ('PING','1.0','The busybox ping test');
insert into tools(tool,version,tool_desc) values ('DITG','1.0','The ditg test');
insert into tools(tool,version,tool_desc) values ('CURL','1.0','The curl test');
insert into tools(tool,version,tool_desc) values ('SP','1.0','The sp test');
insert into tools(tool,version,tool_desc) values ('MDNS','1.0','The mdns test');
insert into tools(tool,version,tool_desc) values ('IFACE','1.0','The interface test');
insert into tools(tool,version,tool_desc) values ('HOST','1.0','test via bind host');
insert into tools(tool,version,tool_desc) values ('TCPDUMP','1.0','Tcpdump test');
insert into tools(tool,version,tool_desc) values ('FPING','1.0','The fping test');
insert into tools(tool,version,tool_desc) values ('NSLOOKUP','1.1','Busybox nslookup test');
insert into tools(tool,version,tool_desc) values ('FPING','1.1','Fping test');

-- Basic User info

insert into users(name,email,street,city,state,postalcode,phone,skype,sip) values('Dave Täht','d+postgres@taht.net','40 mt norte del mercado', 'San Juan Del Sur','','Nicaragua','001-239-2000-2200','davetaht','d@taht.net');

