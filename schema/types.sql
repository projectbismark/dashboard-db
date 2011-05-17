\i defaults.cfg

-- goof

--UPDATE - 2010-08-21 as noted by a user below. In newer versions to_timestamp is shorter and easier:
--SELECT to_timestamp(1195374767);
--To convert back to unix timestamp you can use date_part:
--SELECT date_part('epoch',CURRENT_TIMESTAMP)::int 

create domain deviceid_t as macaddr not null;
create domain deviceidref_t as macaddr;
create domain eventstamp_t as timestamp;
create domain macaddr_t as macaddr;
create domain osname_t as varchar(10) DEFAULT NULL::varchar;
create domain version_t as varchar(10) DEFAULT NULL::varchar;
create domain device_type_t as varchar(10) DEFAULT NULL::varchar;
create domain eventid_t as numeric(11,0) DEFAULT NULL::numeric;
create domain event_t as varchar(50) DEFAULT NULL::varchar;
create domain bssid_t as macaddr;
create domain essid_t as varchar(32);
create domain ssid_t as varchar(32) NOT NULL;
create domain inetn_t as inet NOT NULL;
create domain dnsname_t as varchar(255);
create domain dhcp_action_t varchar(4) DEFAULT NULL;
create domain email_t varchar(80) DEFAULT NULL;

-- NULL is handled by the trigger in this case.

create domain sha1_t as bytea;
create domain sha1ref_t as bytea;
create domain id_t as sha1_t; 
create domain idref_t as sha1ref_t; 
create domain toolid_t as sha1_t; 
create domain toolidref_t as sha1ref_t; 
create domain testseries_t as sha1_t ; 
create domain testseriesref_t as sha1ref_t; 

-- Need some regexes for other validation
-- This is old syntax and I can't remember the new syntax
-- CREATE DOMAIN us_postal_code AS TEXT
-- CHECK(
--   VALUE ~ '^\\d{5}$'
-- OR VALUE ~ '^\\d{5}-\\d{4}$'
--);
