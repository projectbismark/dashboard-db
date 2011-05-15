
CREATE TABLE flows (
    uid numeric(20,0) NOT NULL,
    flowid numeric(20,0) NOT NULL,
    deviceid deviceid_t,
    srcip inet,
    dstip inet,
    proto smallint NOT NULL,
    srcport numeric(11,0) NOT NULL,
    dstport numeric(11,0) NOT NULL,
    uppkts numeric(20,0) NOT NULL,
    dwpkts numeric(20,0) NOT NULL,
    upbytes numeric(20,0) NOT NULL,
    dwbytes numeric(20,0) NOT NULL,
    tsstart numeric(17,6) NOT NULL,
    tsend numeric(17,6) NOT NULL,
    appid smallint NOT NULL
);

CREATE TABLE flows_newformat (
    uid numeric(20,0) NOT NULL,
    flowid numeric(20,0) NOT NULL,
    deviceid character varying(15) NOT NULL,
    srcip numeric(10,0) NOT NULL,
    dstip numeric(10,0) NOT NULL,
    proto smallint NOT NULL,
    srcport numeric(11,0) NOT NULL,
    dstport numeric(11,0) NOT NULL,
    uppkts numeric(20,0) NOT NULL,
    dwpkts numeric(20,0) NOT NULL,
    upbytes numeric(20,0) NOT NULL,
    dwbytes numeric(20,0) NOT NULL,
    tsstart numeric(17,6) NOT NULL,
    tsend numeric(17,6) NOT NULL,
    appid smallint NOT NULL,
    subid smallint NOT NULL
);

CREATE TABLE flows_samples (
    uid numeric(11,0) NOT NULL,
    uppkts numeric(11,0) NOT NULL,
    dwpkts numeric(11,0) NOT NULL,
    upbytes numeric(11,0) NOT NULL,
    dwbytes numeric(11,0) NOT NULL,
    tsstart numeric(17,6) NOT NULL,
    tsend numeric(17,6) NOT NULL
);
CREATE TABLE flows_samples_newformat (
    uid numeric(11,0) NOT NULL,
    uppkts numeric(11,0) NOT NULL,
    dwpkts numeric(11,0) NOT NULL,
    upbytes numeric(11,0) NOT NULL,
    dwbytes numeric(11,0) NOT NULL,
    tsstart numeric(17,6) NOT NULL,
    tsend numeric(17,6) NOT NULL
);
