create type deviceid_t macaddr not null;
create type eventstamp_t numeric(20,0) DEFAULT NULL::numeric NOT NULL;
create type macaddr_t macaddr;
create type osname_t character varying(10) DEFAULT NULL::character varying;
create type version_t character varying(10) DEFAULT NULL::character varying;
-- create type _t character varying(20) DEFAULT NULL::character varying;
create type eventid_t numeric(11,0) DEFAULT NULL::numeric;
