\i defaults.cfg

CREATE TABLE arp_logs (
    deviceid deviceid_t,
    eventstamp eventstamp_t,
    macid macaddr_t,
    ip inet,
    id id_t unique,
    primary key(deviceid, eventstamp, macid, ip)
);

CREATE TABLE ip (
    cip cidr,
    sip inet,
    id id_t unique
);
