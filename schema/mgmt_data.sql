\i defaults.cfg
delete from tools;
-- fixme, delete sequence, recreate
insert into tools(tool,tool_desc) values ('PING','The busybox ping tool');
insert into tools(tool,tool_desc) values ('FPING','The fping tool');
insert into tools(tool,tool_desc) values ('DNSLOOKUP','The busybox dnslook tool');
delete from users;
insert into users(name,email,street,city,state,postalcode,phone,skype,sip) values('Dave Täht','d+postgres@taht.net','40 mt norte del mercado',
       'San Juan Del Sur','','Nicaragua','001-239-2000-2200','davetaht','d@taht.net');