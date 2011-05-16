\i defaults.cfg

-- NOTE TRIGGERS MUST BE CREATED FOR EACH TABLE FOR DJANGO TO PLAY BALL

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

-- Now we have to cope with !@#!@ django for each table
-- not done yet, just testing

create trigger gen_id_dnsfailnc_update before update on dnsfailnc
	for each row execute procedure gen_id_measurement_update();

create trigger gen_id_dnsfailnc_insert before insert on dnsfailnc
	for each row execute procedure gen_id_measurement_insert();

-- And we should alter storage to being external for the !@#!@ ids
-- but premature optimization is the root of all evil. Test.

alter TABLE dnsfailnc ALTER COLUMN toolid set storage EXTERNAL;
alter TABLE dnsfailnc ALTER COLUMN id set storage EXTERNAL;
