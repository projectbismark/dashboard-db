drop schema import cascade;
create schema import;

set search_path = import, pg_catalog;
\i DEVICES.sql
\i /tmp/idashboard/DEVICES.sql

-- \i USERDEVICE.sql
-- \i USERS.sql
-- \i DEVICES.sql
-- \i SLA.sql
-- \i USERSLA.sql

delete from devices where macid = '00:00:00:00:00:00';
delete from devices where deviceid = 'NB1';

set search_path = public, pg_catalog;

insert into devices (deviceid,name,device_type,os,version) select macid, deviceid, type, os, version from import.devices;


