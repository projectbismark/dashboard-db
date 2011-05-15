create domain deviceid_t as macaddr not null;
create domain eventstamp_t as numeric(20,0) DEFAULT NULL::numeric NOT NULL;
create domain macaddr_t as macaddr;
create domain osname_t as varchar(10) DEFAULT NULL::varchar;
create domain version_t as varchar(10) DEFAULT NULL::varchar;
create domain device_type_t as varchar(10) DEFAULT NULL::varchar;
create domain eventid_t as numeric(11,0) DEFAULT NULL::numeric;
create domain event_t as varchar(50) DEFAULT NULL::varchar;

-- This is old syntax and I can't remember the new syntax
-- CREATE DOMAIN us_postal_code AS TEXT
-- CHECK(
--   VALUE ~ '^\\d{5}$'
-- OR VALUE ~ '^\\d{5}-\\d{4}$'
--);
