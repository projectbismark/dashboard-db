CREATE TABLE pings (
    id numeric(11,0) NOT NULL,
    deviceid character varying(15) DEFAULT NULL::character varying,
    srcip ipaddr NOT NULL,
    dstip ipaddr NOT NULL,
    "timestamp" numeric(20,0) DEFAULT NULL::numeric,
    avg double precision,
    std double precision,
    min double precision,
    max double precision,
    med double precision,
    iqr double precision,
    toolid integer;
);
