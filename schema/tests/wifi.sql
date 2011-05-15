drop table wifi_assoc;

CREATE TABLE wifi_assoc (
    stationmac character varying(20) DEFAULT NULL::character varying,
    firstseen numeric(20,0) DEFAULT NULL::numeric,
    lastseen numeric(20,0) DEFAULT NULL::numeric,
    power numeric(11,0) DEFAULT NULL::numeric,
    numpkts numeric(11,0) DEFAULT NULL::numeric,
    bssid character varying(20) DEFAULT NULL::character varying,
    probedessid character varying(50) DEFAULT NULL::character varying,
    deviceid deviceid_t
);

drop table wifi_scan;

CREATE TABLE wifi_scan (
    deviceid deviceid_t,
    bssid character varying(20) DEFAULT NULL::character varying,
    firstseen numeric(20,0) DEFAULT NULL::numeric,
    lastseen numeric(20,0) DEFAULT NULL::numeric,
    channel numeric(11,0) DEFAULT NULL::numeric,
    speed numeric(11,0) DEFAULT NULL::numeric,
    privacy character varying(50) DEFAULT NULL::character varying,
    cipher character varying(50) DEFAULT NULL::character varying,
    auth character varying(50) DEFAULT NULL::character varying,
    power numeric(11,0) DEFAULT NULL::numeric,
    numbeacons numeric(11,0) DEFAULT NULL::numeric,
    numiv numeric(11,0) DEFAULT NULL::numeric,
    idlen numeric(11,0) DEFAULT NULL::numeric,
    essid character varying(50) DEFAULT NULL::character varying
);

