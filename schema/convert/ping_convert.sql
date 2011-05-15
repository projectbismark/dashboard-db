insert into table pings select id, deviceid, toolid, int2inet(srcip) as srcip, int2inet(dstip) as dstip, timestamp as eventtimestamp, avg as average, std, min,max,med,iqr;
