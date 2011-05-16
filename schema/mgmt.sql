\i defaults.cfg

CREATE TABLE tools (
       id toolid_t,
       tool varchar(10) not null,
       version varchar(10) not null,
       tool_desc varchar(80),
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
    id id_t,
    isp varchar(30) DEFAULT NULL,
    sla varchar(30) DEFAULT NULL, 
    dl bigint DEFAULT 0,
    ul bigint DEFAULT 0,
    primary key(id)
);

CREATE TABLE testseries (
    id testseries_t,
    testname varchar(40),
    shortcode varchar(4),
    primary key(shortcode),
    unique(id)
);

CREATE TABLE userdevices (
    userid idref_t,
    deviceid deviceid_t,
    startdt eventstamp_t,
    enddt eventstamp_t,
    testseries testseriesref_t,
    id id_t,
    primary key(userid, deviceid, testseries),
    unique(id)
);

CREATE TABLE devices (
    deviceid deviceid_t,
    macid macaddr_t,
    device_type device_type_t,
    os osname_t,
    version version_t,
    primary key(deviceid)
);

CREATE TABLE users (
    id id_t,
    name varchar(100) NOT NULL,
    email varchar(80) NOT NULL,
    street varchar(80) DEFAULT NULL,
    city varchar(80) DEFAULT NULL,
    state varchar(30) DEFAULT NULL,
    postalcode varchar(30) DEFAULT NULL,
    country varchar(2) DEFAULT NULL,
    phone varchar(20) DEFAULT NULL,
    skype varchar(80) DEFAULT NULL,
    sip varchar(80) DEFAULT NULL,
    primary key (id)
);

CREATE TABLE usersla (
    userid idref_t,
    slaid idref_t,
    startdt numeric(20,0) DEFAULT NULL::numeric,
    enddt numeric(20,0) DEFAULT NULL::numeric,
    id id_t,
    primary key(userid,slaid),
    unique(id)
);

