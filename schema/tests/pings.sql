CREATE TABLE pings (
    deviceid deviceid_t,
    toolid integer,
    src inet NOT NULL,
    dst inet NOT NULL,
    eventstamp eventstamp_t,
    average double precision,
    std double precision,
    minimum double precision,
    maximum double precision,
    median double precision,
    iqr double precision,
    primary key (deviceid, eventstamp, dst, src) -- dst,src maybe not needed
);
