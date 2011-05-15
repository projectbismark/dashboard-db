--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: arp_logs; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE arp_logs (
    deviceid character varying(15) DEFAULT NULL::character varying NOT NULL,
    "timestamp" numeric(20,0) DEFAULT NULL::numeric NOT NULL,
    macid character varying(20) DEFAULT NULL::character varying NOT NULL,
    ip numeric(20,0) DEFAULT NULL::numeric NOT NULL
);


ALTER TABLE public.arp_logs OWNER TO srikanth;

--
-- Name: devices; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE devices (
    deviceid character varying(15) DEFAULT ''::character varying NOT NULL,
    macid character varying(20) DEFAULT NULL::character varying,
    type character varying(20) DEFAULT NULL::character varying,
    os character varying(10) DEFAULT NULL::character varying,
    version character varying(10) DEFAULT NULL::character varying
);


ALTER TABLE public.devices OWNER TO srikanth;

--
-- Name: dhcp_logs; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE dhcp_logs (
    deviceid character varying(15) DEFAULT NULL::character varying NOT NULL,
    "timestamp" numeric(20,0) DEFAULT NULL::numeric NOT NULL,
    action character varying(20) DEFAULT NULL::character varying NOT NULL,
    ip numeric(20,0) DEFAULT NULL::numeric NOT NULL,
    macid character varying(20) DEFAULT NULL::character varying NOT NULL,
    client character varying(50) DEFAULT NULL::character varying NOT NULL
);


ALTER TABLE public.dhcp_logs OWNER TO srikanth;

--
-- Name: event_logs; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE event_logs (
    deviceid character varying(15) DEFAULT NULL::character varying,
    "timestamp" numeric(20,0) DEFAULT NULL::numeric,
    eventid numeric(11,0) DEFAULT NULL::numeric
);


ALTER TABLE public.event_logs OWNER TO srikanth;

--
-- Name: events; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE events (
    eventid numeric(11,0) NOT NULL,
    event character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.events OWNER TO srikanth;

--
-- Name: flows; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE flows (
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
    appid smallint NOT NULL
);


ALTER TABLE public.flows OWNER TO srikanth;

--
-- Name: flows_17jul_26oct_2010; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE flows_17jul_26oct_2010 (
    uid numeric(20,0) NOT NULL,
    flowid numeric(20,0) NOT NULL,
    deviceid character varying(15) NOT NULL,
    srcip numeric(20,0) NOT NULL,
    dstip numeric(20,0) NOT NULL,
    proto numeric(11,0) NOT NULL,
    srcport numeric(11,0) NOT NULL,
    dstport numeric(11,0) NOT NULL,
    uppkts numeric(11,0) NOT NULL,
    dwpkts numeric(11,0) NOT NULL,
    upbytes numeric(11,0) NOT NULL,
    dwbytes numeric(11,0) NOT NULL,
    tsstart double precision NOT NULL,
    tsend double precision NOT NULL,
    app character varying(20) NOT NULL
);


ALTER TABLE public.flows_17jul_26oct_2010 OWNER TO srikanth;

--
-- Name: flows_26oct_7dec_2010; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE flows_26oct_7dec_2010 (
    uid numeric(20,0) NOT NULL,
    flowid numeric(20,0) NOT NULL,
    deviceid character varying(15) NOT NULL,
    srcip numeric(20,0) NOT NULL,
    dstip numeric(20,0) NOT NULL,
    proto numeric(11,0) NOT NULL,
    srcport numeric(11,0) NOT NULL,
    dstport numeric(11,0) NOT NULL,
    uppkts numeric(11,0) NOT NULL,
    dwpkts numeric(11,0) NOT NULL,
    upbytes numeric(11,0) NOT NULL,
    dwbytes numeric(11,0) NOT NULL,
    tsstart numeric(20,0) NOT NULL,
    tsend numeric(20,0) NOT NULL,
    app character varying(20) NOT NULL
);


ALTER TABLE public.flows_26oct_7dec_2010 OWNER TO srikanth;

--
-- Name: flows_newformat; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

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


ALTER TABLE public.flows_newformat OWNER TO srikanth;

--
-- Name: flows_samples; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE flows_samples (
    uid numeric(11,0) NOT NULL,
    uppkts numeric(11,0) NOT NULL,
    dwpkts numeric(11,0) NOT NULL,
    upbytes numeric(11,0) NOT NULL,
    dwbytes numeric(11,0) NOT NULL,
    tsstart numeric(17,6) NOT NULL,
    tsend numeric(17,6) NOT NULL
);


ALTER TABLE public.flows_samples OWNER TO srikanth;

--
-- Name: flows_samples_17jul_26oct_2010; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE flows_samples_17jul_26oct_2010 (
    uid numeric(11,0) NOT NULL,
    uppkts numeric(11,0) NOT NULL,
    dwpkts numeric(11,0) NOT NULL,
    upbytes numeric(11,0) NOT NULL,
    dwbytes numeric(11,0) NOT NULL,
    tsstart double precision NOT NULL,
    tsend double precision NOT NULL
);


ALTER TABLE public.flows_samples_17jul_26oct_2010 OWNER TO srikanth;

--
-- Name: flows_samples_26oct_7dec_2010; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE flows_samples_26oct_7dec_2010 (
    uid numeric(11,0) NOT NULL,
    uppkts numeric(11,0) NOT NULL,
    dwpkts numeric(11,0) NOT NULL,
    upbytes numeric(11,0) NOT NULL,
    dwbytes numeric(11,0) NOT NULL,
    tsstart numeric(20,0) NOT NULL,
    tsend numeric(20,0) NOT NULL
);


ALTER TABLE public.flows_samples_26oct_7dec_2010 OWNER TO srikanth;

--
-- Name: flows_samples_newformat; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE flows_samples_newformat (
    uid numeric(11,0) NOT NULL,
    uppkts numeric(11,0) NOT NULL,
    dwpkts numeric(11,0) NOT NULL,
    upbytes numeric(11,0) NOT NULL,
    dwbytes numeric(11,0) NOT NULL,
    tsstart numeric(17,6) NOT NULL,
    tsend numeric(17,6) NOT NULL
);


ALTER TABLE public.flows_samples_newformat OWNER TO srikanth;

--
-- Name: ip; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE ip (
    cip cidr,
    sip inet
);


ALTER TABLE public.ip OWNER TO srikanth;

--
-- Name: measurements; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE VIEW measurements as select *, or(param="ping",param="dns") from ping p, dnsqueries d where p.id = d.id;


CREATE TABLE measurements (
    id numeric(11,0) NOT NULL,
    deviceid character varying(15) DEFAULT NULL::character varying,
    srcip numeric(20,0) DEFAULT NULL::numeric,
    dstip numeric(20,0) DEFAULT NULL::numeric,
    "timestamp" numeric(20,0) DEFAULT NULL::numeric,
    param character varying(20) DEFAULT NULL::character varying,
    avg double precision,
    std double precision,
    min double precision,
    max double precision,
    med double precision,
    iqr double precision,
    tool character varying(20) DEFAULT NULL::character varying
);



ALTER TABLE public.measurements OWNER TO srikanth;

CREATE TABLE tools (
       toolid integer not null,
       tool_desc varchar(10)
);

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


--
-- Name: sla; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE sla (
    slaid numeric(11,0) NOT NULL,
    isp character varying(30) DEFAULT NULL::character varying,
    sla character varying(50) DEFAULT NULL::character varying,
    dl numeric(11,0) DEFAULT NULL::numeric,
    ul numeric(11,0) DEFAULT NULL::numeric
);


ALTER TABLE public.sla OWNER TO srikanth;

--
-- Name: traceroute_hops; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE traceroute_hops (
    tid numeric(11,0) DEFAULT NULL::numeric,
    hop_id numeric(11,0) DEFAULT NULL::numeric,
    ip ipaddr DEFAULT NULL::numeric,
    rtt double precision
);


ALTER TABLE public.traceroute_hops OWNER TO srikanth;

--
-- Name: traceroutes; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE traceroutes (
    id numeric(11,0) NOT NULL,
    deviceid character varying(15) DEFAULT NULL::character varying,
    srcip ipaddr DEFAULT NULL,
    dstip ipaddr DEFAULT NULL,
    "timestamp" numeric(20,0) DEFAULT NULL::numeric,
    hops integer(2) DEFAULT 0
);


ALTER TABLE public.traceroutes OWNER TO srikanth;

--
-- Name: userdevice; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE userdevice (
    userid numeric(11,0) DEFAULT NULL::numeric,
    deviceid character varying(15) DEFAULT NULL::character varying,
    startdt numeric(20,0) DEFAULT NULL::numeric,
    enddt numeric(20,0) DEFAULT NULL::numeric
);


ALTER TABLE public.userdevice OWNER TO srikanth;

--
-- Name: users; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE users (
    userid numeric(11,0) NOT NULL,
    name character varying(100) DEFAULT NULL::character varying,
    email character varying(30) DEFAULT NULL::character varying,
    address character varying(300) DEFAULT NULL::character varying,
    phone character varying(20) DEFAULT NULL::character varying
);


ALTER TABLE public.users OWNER TO srikanth;

--
-- Name: usersla; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE usersla (
    userid numeric(11,0) DEFAULT NULL::numeric,
    slaid numeric(11,0) DEFAULT NULL::numeric,
    startdt numeric(20,0) DEFAULT NULL::numeric,
    enddt numeric(20,0) DEFAULT NULL::numeric
);


ALTER TABLE public.usersla OWNER TO srikanth;

--
-- Name: wifi_assoc; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE wifi_assoc (
    stationmac character varying(20) DEFAULT NULL::character varying,
    firstseen numeric(20,0) DEFAULT NULL::numeric,
    lastseen numeric(20,0) DEFAULT NULL::numeric,
    power numeric(11,0) DEFAULT NULL::numeric,
    numpkts numeric(11,0) DEFAULT NULL::numeric,
    bssid character varying(20) DEFAULT NULL::character varying,
    probedessid character varying(50) DEFAULT NULL::character varying,
    deviceid character varying(15) DEFAULT NULL::character varying
);


ALTER TABLE public.wifi_assoc OWNER TO srikanth;

--
-- Name: wifi_scan; Type: TABLE; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE TABLE wifi_scan (
    deviceid character varying(15) DEFAULT NULL::character varying,
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


ALTER TABLE public.wifi_scan OWNER TO srikanth;

--
-- Name: arp_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY arp_logs
    ADD CONSTRAINT arp_logs_pkey PRIMARY KEY (deviceid, "timestamp", macid, ip);


--
-- Name: devices_pkey; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (deviceid);


--
-- Name: dhcp_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY dhcp_logs
    ADD CONSTRAINT dhcp_logs_pkey PRIMARY KEY (deviceid, "timestamp", action, ip, macid, client);


--
-- Name: event_logs_deviceid_key; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY event_logs
    ADD CONSTRAINT event_logs_deviceid_key UNIQUE (deviceid, "timestamp", eventid);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (eventid);


--
-- Name: flows_17jul_26oct_2010_flowid_key; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY flows_17jul_26oct_2010
    ADD CONSTRAINT flows_17jul_26oct_2010_flowid_key UNIQUE (flowid, deviceid, tsstart);


--
-- Name: flows_17jul_26oct_2010_pkey; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY flows_17jul_26oct_2010
    ADD CONSTRAINT flows_17jul_26oct_2010_pkey PRIMARY KEY (uid);


--
-- Name: flows_26oct_7dec_2010_flowid_key; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY flows_26oct_7dec_2010
    ADD CONSTRAINT flows_26oct_7dec_2010_flowid_key UNIQUE (flowid, deviceid, tsstart);


--
-- Name: flows_26oct_7dec_2010_pkey; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY flows_26oct_7dec_2010
    ADD CONSTRAINT flows_26oct_7dec_2010_pkey PRIMARY KEY (uid);


--
-- Name: flows_flowid_key; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY flows
    ADD CONSTRAINT flows_flowid_key UNIQUE (flowid, deviceid, tsstart);


--
-- Name: flows_newformat_flowid_key; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY flows_newformat
    ADD CONSTRAINT flows_newformat_flowid_key UNIQUE (flowid, deviceid, tsstart);


--
-- Name: flows_newformat_pkey; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY flows_newformat
    ADD CONSTRAINT flows_newformat_pkey PRIMARY KEY (uid);


--
-- Name: flows_pkey; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY flows
    ADD CONSTRAINT flows_pkey PRIMARY KEY (uid);


--
-- Name: flows_samples_17jul_26oct_2010_pkey; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY flows_samples_17jul_26oct_2010
    ADD CONSTRAINT flows_samples_17jul_26oct_2010_pkey PRIMARY KEY (uid, tsend);


--
-- Name: flows_samples_26oct_7dec_2010_pkey; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY flows_samples_26oct_7dec_2010
    ADD CONSTRAINT flows_samples_26oct_7dec_2010_pkey PRIMARY KEY (uid, tsend);


--
-- Name: flows_samples_newformat_pkey; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY flows_samples_newformat
    ADD CONSTRAINT flows_samples_newformat_pkey PRIMARY KEY (uid, tsend);


--
-- Name: flows_samples_uid_key; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY flows_samples
    ADD CONSTRAINT flows_samples_uid_key UNIQUE (uid, tsend);


--
-- Name: measurements_deviceid_key; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY measurements
    ADD CONSTRAINT measurements_deviceid_key UNIQUE (deviceid, srcip, "timestamp", param);


--
-- Name: measurements_pkey; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY measurements
    ADD CONSTRAINT measurements_pkey PRIMARY KEY (id);


--
-- Name: sla_pkey; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY sla
    ADD CONSTRAINT sla_pkey PRIMARY KEY (slaid);


--
-- Name: traceroutes_pkey; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY traceroutes
    ADD CONSTRAINT traceroutes_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: srikanth; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- Name: arp_logs_macid; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX arp_logs_macid ON arp_logs USING btree (macid);


--
-- Name: deviceid; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX deviceid ON flows_17jul_26oct_2010 USING btree (deviceid, srcip, dstip, proto, dstport, app);


--
-- Name: deviceidx; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX deviceidx ON flows_26oct_7dec_2010 USING btree (deviceid, srcip, dstip, proto, dstport, app);


--
-- Name: dhcp_logs_client; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX dhcp_logs_client ON dhcp_logs USING btree (client);


--
-- Name: dhcp_logs_event; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX dhcp_logs_event ON dhcp_logs USING btree (action);


--
-- Name: dhcp_logs_macid; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX dhcp_logs_macid ON dhcp_logs USING btree (macid);


--
-- Name: event_logs_event; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX event_logs_event ON event_logs USING btree (eventid);


--
-- Name: fl_appidx; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX fl_appidx ON flows USING btree (appid);


--
-- Name: fl_dstipidx; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX fl_dstipidx ON flows USING btree (dstip);


--
-- Name: fl_dstportidx; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX fl_dstportidx ON flows USING btree (dstport);


--
-- Name: fl_index_flows_deviceid; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX fl_index_flows_deviceid ON flows USING btree (deviceid);


--
-- Name: fl_nf_appidx; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX fl_nf_appidx ON flows_newformat USING btree (appid);


--
-- Name: fl_nf_deviceidx; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX fl_nf_deviceidx ON flows_newformat USING btree (deviceid);


--
-- Name: fl_nf_dstipidx; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX fl_nf_dstipidx ON flows_newformat USING btree (dstip);


--
-- Name: fl_nf_dstportidx; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX fl_nf_dstportidx ON flows_newformat USING btree (dstport);


--
-- Name: fl_nf_srcipidx; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX fl_nf_srcipidx ON flows_newformat USING btree (srcip);


--
-- Name: fl_nf_srcportidx; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX fl_nf_srcportidx ON flows_newformat USING btree (srcport);


--
-- Name: fl_nf_startidx; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX fl_nf_startidx ON flows_newformat USING btree (tsstart);


--
-- Name: fl_nf_subidx; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX fl_nf_subidx ON flows_newformat USING btree (subid);


--
-- Name: fl_sam_tsstartidx; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX fl_sam_tsstartidx ON flows_samples USING btree (tsstart);


--
-- Name: fl_samp_nf_tsstartidx; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX fl_samp_nf_tsstartidx ON flows_samples_newformat USING btree (tsstart);


--
-- Name: fl_srcipidx; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX fl_srcipidx ON flows USING btree (srcip);


--
-- Name: fl_srcportidx; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX fl_srcportidx ON flows USING btree (srcport);


--
-- Name: fl_startidx; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX fl_startidx ON flows USING btree (tsstart);


--
-- Name: index_flows_srcip; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX index_flows_srcip ON flows_26oct_7dec_2010 USING btree (srcip);


--
-- Name: index_wifi_assoc_deviceid; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX index_wifi_assoc_deviceid ON wifi_assoc USING btree (deviceid);


--
-- Name: index_wifi_scan_deviceid; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX index_wifi_scan_deviceid ON wifi_scan USING btree (deviceid);


--
-- Name: measurements_deviceid; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX measurements_deviceid ON measurements USING btree (deviceid);


--
-- Name: measurements_dstip; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX measurements_dstip ON measurements USING btree (dstip);


--
-- Name: measurements_param; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX measurements_param ON measurements USING btree (param);


--
-- Name: measurements_srcip; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX measurements_srcip ON measurements USING btree (srcip);


--
-- Name: measurements_userid; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX measurements_userid ON measurements USING btree (userid);


--
-- Name: traceroute_hops_tid; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX traceroute_hops_tid ON traceroute_hops USING btree (tid);


--
-- Name: traceroutes_deviceid; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX traceroutes_deviceid ON traceroutes USING btree (deviceid);


--
-- Name: traceroutes_dstip; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX traceroutes_dstip ON traceroutes USING btree (dstip);


--
-- Name: traceroutes_srcip; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX traceroutes_srcip ON traceroutes USING btree (srcip);


--
-- Name: traceroutes_userid; Type: INDEX; Schema: public; Owner: srikanth; Tablespace: 
--

CREATE INDEX traceroutes_userid ON traceroutes USING btree (userid);


--
-- Name: flows_samples_17jul_26oct_2010_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: srikanth
--

ALTER TABLE ONLY flows_samples_17jul_26oct_2010
    ADD CONSTRAINT flows_samples_17jul_26oct_2010_ibfk_1 FOREIGN KEY (uid) REFERENCES flows_17jul_26oct_2010(uid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: flows_samples_26oct_7dec_2010_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: srikanth
--

ALTER TABLE ONLY flows_samples_26oct_7dec_2010
    ADD CONSTRAINT flows_samples_26oct_7dec_2010_ibfk_1 FOREIGN KEY (uid) REFERENCES flows_26oct_7dec_2010(uid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

