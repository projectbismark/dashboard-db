
CREATE TABLE tools (
       toolid integer not null,
       tool_desc varchar(80)
);

CREATE TABLE sla (
    slaid numeric(11,0) NOT NULL,
    isp character varying(30) DEFAULT NULL::character varying,
    sla character varying(50) DEFAULT NULL::character varying,
    dl numeric(11,0) DEFAULT NULL::numeric,
    ul numeric(11,0) DEFAULT NULL::numeric
);

CREATE TABLE userdevice (
    userid numeric(11,0) DEFAULT NULL::numeric,
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
    userid numeric(11,0) NOT NULL,
    name character varying(100) DEFAULT NULL::character varying,
    email character varying(30) DEFAULT NULL::character varying,
    address character varying(300) DEFAULT NULL::character varying,
    phone character varying(20) DEFAULT NULL::character varying
);

CREATE TABLE usersla (
    userid numeric(11,0) DEFAULT NULL::numeric,
    slaid numeric(11,0) DEFAULT NULL::numeric,
    startdt numeric(20,0) DEFAULT NULL::numeric,
    enddt numeric(20,0) DEFAULT NULL::numeric
);

