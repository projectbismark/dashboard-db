\i defaults.cfg

CREATE TABLE dhcp_logs (
    deviceid deviceid_t,
    eventstamp eventstamp_t,
    dhcp_action dhcp_action_t,
    ip inet,
    macid macaddr_t,
    client dnsname_t,
    id id_t,
    primary key(deviceid, eventstamp, dhcp_action, ip, macid, client), 
    unique(id)
);

CREATE TABLE event_logs (
    deviceid deviceid_t,
    eventstamp eventstamp_t,
    eventid eventid_t,
    id id_t,
    primary key (eventstamp,deviceid,eventid),
    unique(id)
);

CREATE TABLE events (
    eventid eventid_t,
    event event_t,
    primary key(eventid)
);
