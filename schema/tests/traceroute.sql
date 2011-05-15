CREATE TABLE traceroute_hops (
    tid numeric(11,0) DEFAULT NULL::numeric,
    hop_id numeric(11,0) DEFAULT NULL::numeric,
    ip inet,
    rtt double precision
);

CREATE TABLE traceroutes (
    id numeric(11,0) NOT NULL,
    deviceid deviceid_t,
    srcip inet DEFAULT NULL,
    dstip inet DEFAULT NULL,
    eventstamp eventstamp_t,
    hops integer(2) DEFAULT 0
);

