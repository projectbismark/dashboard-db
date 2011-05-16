\i defaults.cfg
delete from tools;
insert into tools(tool,version,tool_desc) values ('PING','1.0','The busybox ping tool');
insert into tools(tool,version,tool_desc) values ('FPING','1.0','The fping tool');
insert into tools(tool,version,tool_desc) values ('DNSLOOKUP','1.0','The busybox dnslook tool');
delete from users;
insert into users(name,email,street,city,state,postalcode,phone,skype,sip) values('Dave Täht','d+postgres@taht.net','40 mt norte del mercado',
       'San Juan Del Sur','','Nicaragua','001-239-2000-2200','davetaht','d@taht.net');

-- this should fail
insert into users(name,email,street,city,state,postalcode,phone,skype,sip) values('Dave Täht','d+postgres@taht.net','40 mt norte del mercado',
       'San Juan Del Sur','','Nicaragua','001-239-2000-2200','davetaht','d@taht.net');
-- this should succeed
insert into users(name,email,street,city,state,postalcode,phone,skype,sip) values('Dave Täht','d+postgres2@taht.net','40 mt norte del mercado',
       'San Juan Del Sur','','Nicaragua','001-239-2000-2200','davetaht','d@taht.net');

