\i defaults.sql

CREATE TABLE aggl3bitrate (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE bitrate (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE capacity (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE jitter (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE lmrtt (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE pktloss (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE rtt (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE shaperate (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE ulrttdw (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE ulrttup (like measurements_tmpl including defaults including constraints including indexes);

CREATE TABLE dnsdelay (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE dnsdelayc (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE dnsdelaync (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE dnsfail (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE dnsfailc (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE dnsfailnc (like measurements_tmpl including defaults including constraints including indexes);
