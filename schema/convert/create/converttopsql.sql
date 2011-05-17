set path import, pg_catalog;

\i olddata.sql

insert into temp table newusers2 select * from users;
insert into temp table sla2 select * from sla;
insert into temp table userdevices2 select * from userdevice;
select * from users into temp table userdevicefix;

set path = public, pg_catalog;
