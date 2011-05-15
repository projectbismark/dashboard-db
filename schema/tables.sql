SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;
SET search_path = public, pg_catalog;
SET default_tablespace = '';
SET default_with_oids = false;

CREATE TABLE arp_logs (
    deviceid deviceid_t,
    eventstamp eventstamp_t,
    macid macaddr_t,
    ip inet
);

CREATE TABLE devices (
    deviceid deviceid_t,
    macid macaddr_t,
    device_type device_type_t,
    os osname_t,
    version version_t
);

CREATE TABLE dhcp_logs (
    deviceid deviceid_t,
    eventstamp eventstamp_t,
    action character varying(20) DEFAULT NULL::character varying NOT NULL,
    ip inet,
    macid macaddr_t,
    client character varying(50) DEFAULT NULL::character varying NOT NULL
);

CREATE TABLE event_logs (
    deviceid deviceid_t,
    eventstamp eventstamp_t,
    eventid eventid_t
);

CREATE TABLE events (
    eventid eventid_t,
    event event_t
);

CREATE TABLE ip (
    cip cidr,
    sip inet
);

CREATE TABLE tools (
       toolid integer not null,
       tool_desc varchar(80)
);

CREATE TABLE pings (
    id numeric(11,0) NOT NULL,
    deviceid deviceid_t,
    toolid integer,
    srcip inet NOT NULL,
    dstip inet NOT NULL,
    eventstamp eventstamp_t,
    average double precision,
    std double precision,
    minimum double precision,
    maximum double precision,
    median double precision,
    iqr double precision
);

CREATE TABLE sla (
    slaid numeric(11,0) NOT NULL,
    isp character varying(30) DEFAULT NULL::character varying,
    sla character varying(50) DEFAULT NULL::character varying,
    dl numeric(11,0) DEFAULT NULL::numeric,
    ul numeric(11,0) DEFAULT NULL::numeric
);
CREATE TABLE traceroute_hops (
    tid numeric(11,0) DEFAULT NULL::numeric,
    hop_id numeric(11,0) DEFAULT NULL::numeric,
    ip inet,
    rtt double precision
);

CREATE TABLE traceroutes (
    id numeric(11,0) NOT NULL,
    deviceid character varying(15) DEFAULT NULL::character varying,
    srcip ipaddr DEFAULT NULL,
    dstip ipaddr DEFAULT NULL,
    "timestamp" numeric(20,0) DEFAULT NULL::numeric,
    hops integer(2) DEFAULT 0
);

CREATE TABLE userdevice (
    userid numeric(11,0) DEFAULT NULL::numeric,
    deviceid deviceid_t,
    startdt timestamp,
    enddt timestamp
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

CREATE TABLE wifi_assoc (
    stationmac character varying(20) DEFAULT NULL::character varying,
    firstseen numeric(20,0) DEFAULT NULL::numeric,
    lastseen numeric(20,0) DEFAULT NULL::numeric,
    power numeric(11,0) DEFAULT NULL::numeric,
    numpkts numeric(11,0) DEFAULT NULL::numeric,
    bssid character varying(20) DEFAULT NULL::character varying,
    probedessid character varying(50) DEFAULT NULL::character varying,
    deviceid character varying(15) DEFAULT NULL::character varying
);


CREATE TABLE wifi_scan (
    deviceid deviceid_t,
    bssid character varying(20) DEFAULT NULL::character varying,
    firstseen numeric(20,0) DEFAULT NULL::numeric,
    lastseen numeric(20,0) DEFAULT NULL::numeric,
    channel numeric(11,0) DEFAULT NULL::numeric,
    speed numeric(11,0) DEFAULT NULL::numeric,
    privacy character varying(50) DEFAULT NULL::character varying,
    cipher character varying(50) DEFAULT NULL::character varying,
    auth character varying(50) DEFAULT NULL::character varying,
    power numeric(11,0) DEFAULT NULL::numeric,
    numbeacons numeric(11,0) DEFAULT NULL::numeric,
    numiv numeric(11,0) DEFAULT NULL::numeric,
    idlen numeric(11,0) DEFAULT NULL::numeric,
    essid character varying(50) DEFAULT NULL::character varying
);

