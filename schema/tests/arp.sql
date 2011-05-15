
CREATE TABLE arp_logs (
    deviceid deviceid_t,
    eventstamp eventstamp_t,
    macid macaddr_t,
    ip inet
);

CREATE TABLE ip (
    cip cidr,
    sip inet
);
