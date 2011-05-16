\i defaults.cfg

CREATE TABLE tools (
       toolid serial,
       tool varchar(10) not null,
       tool_desc varchar(80),
       primary key(toolid)
);

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

CREATE TABLE userdevice (
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
    userid id_t,
    name varchar(100) DEFAULT NULL,
    email varchar(80) DEFAULT NULL,
    street varchar(80) DEFAULT NULL,
    city varchar(80) DEFAULT NULL,
    state varchar(30) DEFAULT NULL,
    postalcode varchar(30) DEFAULT NULL,
    country varchar(2) DEFAULT NULL,
    phone varchar(20) DEFAULT NULL,
    skype varchar(80) DEFAULT NULL,
    sip varchar(80) DEFAULT NULL,
    primary key (userid)
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

