\i defaults.cfg

CREATE TABLE dhcp_logs (
    deviceid deviceid_t,
    eventstamp eventstamp_t,
    action dhcp_action_t,
character varying(20) DEFAULT NULL::character varying NOT NULL,
    ip inet,
    macid macaddr_t,
    client dnsname_t
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
