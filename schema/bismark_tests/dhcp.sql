\i ../defaults.sql
drop table dhcp_logs;

CREATE TABLE dhcp_logs (
    deviceid deviceid_t,
    eventstamp eventstamp_t,
    action character varying(20) DEFAULT NULL::character varying NOT NULL,
    ip inet,
    macid macaddr_t,
    client character varying(50) DEFAULT NULL::character varying NOT NULL
);

drop table event_logs;

CREATE TABLE event_logs (
    deviceid deviceid_t,
    eventstamp eventstamp_t,
    eventid eventid_t
);

drop table events;

CREATE TABLE events (
    eventid eventid_t,
    event event_t
);
