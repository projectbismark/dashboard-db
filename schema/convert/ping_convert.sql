\i ../defaults.sql
drop table t3; drop table t4; drop table t5; 
create temp table t3 as select id, 
				deviceid, 
				1 as toolid, 
				to_char(srcip,'99999999999') as src,
				to_char(dstip,'99999999999') as dst, 
				timestamp as eventtimestamp, avg as average, std, min,max,med,iqr from measurements;

create temp table t4 as select id, deviceid, toolid, convert_to_integer(src) as src,convert_to_integer(dst) as dst, eventtimestamp, average, std, min,max,med,iqr from t3;

-- I thought deviceids where the mac addr?
-- insert into pings(deviceid,toolid,src,dst,eventstamp, average, std, minimum, maximum, median, iqr) select deviceid, toolid, convert2inet(src) as src,convert2inet(dst) as dst, eventtimestamp, average, std, min,max,med,iqr from t4;

insert into pings(deviceid, toolid,src,dst,eventstamp, average, std, minimum, maximum, median, iqr) select 'AA:BB:CC:DD:EE:FF', toolid, convert2inet(src) as src,convert2inet(dst) as dst, eventtimestamp, average, std, min,max,med,iqr from t4 where convert2inet(src) is not null and convert2inet(dst) is not null;

--select id, deviceid, toolid, convert2inet(src) as src,convert2inet(dst) as dst, eventtimestamp, average, std, min,max,median,iqr from t4;

-- select distinct src from t5;

