drop schema import;
create schema import;

set search_path = import, pg_catalog;
\i DEVICES.sql
\i /tmp/idashboard/DEVICES.sql

set search_path = public, pg_catalog;

insert into devices (deviceid,name,device_type,os,version) select macid, deviceid, type, os, version from import.devices;

