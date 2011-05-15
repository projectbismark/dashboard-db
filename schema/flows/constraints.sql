\i defaults.cfg

ALTER TABLE ONLY flows_newformat
    ADD CONSTRAINT flows_newformat_flowid_key UNIQUE (flowid, deviceid, tsstart);

ALTER TABLE ONLY flows_newformat
    ADD CONSTRAINT flows_newformat_pkey PRIMARY KEY (uid);

ALTER TABLE ONLY flows_samples_newformat
    ADD CONSTRAINT flows_samples_newformat_pkey PRIMARY KEY (uid, tsend);

