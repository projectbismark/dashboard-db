drop table arp_logs;

CREATE TABLE arp_logs (
    deviceid deviceid_t,
    eventstamp eventstamp_t,
    macid macaddr_t,
    ip inet
);

drop table ip;

CREATE TABLE ip (
    cip cidr,
    sip inet
);
