\i defaults.cfg

CREATE TABLE tools (
       tool varchar(10) not null,
       version varchar(10) not null,
       tool_desc varchar(80),
       id toolid_t,
       primary key(id)
);

CREATE OR REPLACE function gen_id_tools_update() returns trigger as $gen_id_tools_update$
       BEGIN
       IF (new.tool !=
       	   old.tool OR 
       	   new.version !=
	   old.version)
	  THEN
	  new.id = sha1( new.tool || new.version );
	  END IF;
       return NEW;
       END;
$gen_id_tools_update$
language plpgsql strict immutable;


CREATE OR REPLACE function gen_id_tools_insert() returns trigger as $gen_id_tools_insert$
       BEGIN
	  new.id = sha1( new.tool || new.version );
       return NEW;
       END;
$gen_id_tools_insert$
language plpgsql strict immutable;

create trigger gen_id_tools_update before update on tools
	for each row execute procedure gen_id_tools_update();

create trigger gen_id_tools_insert before insert on tools
	for each row execute procedure gen_id_tools_insert();

CREATE TABLE sla (
    isp varchar(30) NOT NULL,
    sla varchar(30) NOT NULL, 
    dl bigint DEFAULT 0,
    ul bigint DEFAULT 0,
    id id_t,
    primary key(id)
);

CREATE TABLE testseries (
    shortcode varchar(4),
    testname varchar(40),
    id testseries_t,
    primary key(shortcode),
    unique(id)
);

CREATE TABLE userdevices (
    deviceid deviceid_t,
    startdt eventstamp_t,
    enddt eventstamp_t,
    testseries testseriesref_t,
    userid idref_t,
    id id_t,
    primary key(userid, deviceid, testseries),
    unique(id)
);

CREATE TABLE devices (
    deviceid deviceid_t,
    name dnsname_t,
    device_type device_type_t,
    os osname_t,
    version version_t,
    primary key(deviceid)
);

CREATE TABLE users (
    name varchar(100) NOT NULL,
    email email_t NOT NULL CHECK (LENGTH(email) > 0),
    street varchar(80) DEFAULT NULL,
    city varchar(80) DEFAULT NULL,
    state varchar(30) DEFAULT NULL,
    postalcode varchar(30) DEFAULT NULL,
    country varchar(2) DEFAULT NULL,
    phone varchar(20) DEFAULT NULL,
    skype varchar(80) DEFAULT NULL,
    sip varchar(80) DEFAULT NULL,
    id id_t,
    primary key (id)
);

CREATE TABLE usersla (
    startdt numeric(20,0) DEFAULT NULL::numeric,
    enddt numeric(20,0) DEFAULT NULL::numeric,
    userid idref_t,
    slaid idref_t,
    id id_t,
    primary key(userid,slaid),
    unique(id)
);

