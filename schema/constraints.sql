\i defaults.sql

ALTER TABLE ONLY arp_logs
    ADD CONSTRAINT arp_logs_pkey PRIMARY KEY (deviceid, eventstamp, macid, ip);

ALTER TABLE ONLY devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (deviceid);

ALTER TABLE ONLY dhcp_logs
    ADD CONSTRAINT dhcp_logs_pkey PRIMARY KEY (deviceid, eventstamp, action, ip, macid, client);

ALTER TABLE ONLY event_logs
    ADD CONSTRAINT event_logs_deviceid_key UNIQUE (deviceid, eventstamp, eventid);

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (eventid);

ALTER TABLE ONLY flows_17jul_26oct_2010
    ADD CONSTRAINT flows_17jul_26oct_2010_flowid_key UNIQUE (flowid, deviceid, tsstart);

ALTER TABLE ONLY flows
    ADD CONSTRAINT flows_flowid_key UNIQUE (flowid, deviceid, tsstart);

ALTER TABLE ONLY flows_newformat
    ADD CONSTRAINT flows_newformat_flowid_key UNIQUE (flowid, deviceid, tsstart);


ALTER TABLE ONLY flows_newformat
    ADD CONSTRAINT flows_newformat_pkey PRIMARY KEY (uid);


ALTER TABLE ONLY flows
    ADD CONSTRAINT flows_pkey PRIMARY KEY (uid);

ALTER TABLE ONLY flows_samples_17jul_26oct_2010
    ADD CONSTRAINT flows_samples_17jul_26oct_2010_pkey PRIMARY KEY (uid, tsend);

ALTER TABLE ONLY flows_samples_newformat
    ADD CONSTRAINT flows_samples_newformat_pkey PRIMARY KEY (uid, tsend);

ALTER TABLE ONLY flows_samples
    ADD CONSTRAINT flows_samples_uid_key UNIQUE (uid, tsend);


ALTER TABLE ONLY measurements
    ADD CONSTRAINT measurements_deviceid_key UNIQUE (deviceid, srcip, eventstamp, param);


ALTER TABLE ONLY measurements
    ADD CONSTRAINT measurements_pkey PRIMARY KEY (id);


ALTER TABLE ONLY sla
    ADD CONSTRAINT sla_pkey PRIMARY KEY (slaid);


ALTER TABLE ONLY traceroutes
    ADD CONSTRAINT traceroutes_pkey PRIMARY KEY (id);

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


