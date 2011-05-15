\i defaults.sql

CREATE TABLE tools (
       toolid integer not null,
       tool_desc varchar(80)
);

CREATE TABLE sla (
    id id_t,
    isp character varying(30) DEFAULT NULL::character varying,
    sla character varying(50) DEFAULT NULL::character varying,
    dl bigint DEFAULT NULL::numeric,
    ul bigint DEFAULT NULL::numeric,
    primary key(id)
);

CREATE TABLE userdevice (
    userid idref_t,
    deviceid deviceid_t,
    startdt timestamp,
    enddt timestamp
);

CREATE TABLE devices (
    deviceid deviceid_t,
    macid macaddr_t,
    device_type device_type_t,
    os osname_t,
    version version_t
);

CREATE TABLE users (
    userid id_t,
    name character varying(100) DEFAULT NULL::character varying,
    email character varying(30) DEFAULT NULL::character varying,
    address character varying(300) DEFAULT NULL::character varying,
    phone character varying(20) DEFAULT NULL::character varying,
    primary key (userid)
);

CREATE TABLE usersla (
    userid idref_t,
    slaid idref_t,
    startdt numeric(20,0) DEFAULT NULL::numeric,
    enddt numeric(20,0) DEFAULT NULL::numeric
);

