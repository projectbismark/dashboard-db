\i defaults.cfg

CREATE TABLE traceroutes (
    deviceid deviceid_t NOT NULL,
    srcip inet NOT NULL,
    dstip inet NOT NULL,
    eventstamp eventstamp_t NOT NULL,
    hops integer DEFAULT 0,
    id id_t,
    primary key(deviceid,eventstamp,dstip,srcip),
    unique(id)
);

CREATE TABLE traceroute_hops (
    id idref_t NOT NULL references traceroutes(id),
    hop smallint NOT NULL,
    ip inet,
    rtt double precision,
    django_bs id_t,
    primary key(id,hop),
    unique(django_bs)
);

