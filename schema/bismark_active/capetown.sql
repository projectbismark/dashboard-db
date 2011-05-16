\i defaults.cfg

-- NOTE TRIGGERS MUST BE CREATED FOR EACH TABLE FOR DJANGO TO PLAY BALL

CREATE TABLE m_aggl3bitrate (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE m_bitrate (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE m_capacity (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE m_jitter (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE m_lmrtt (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE m_pktloss (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE m_rtt (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE m_shaperate (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE m_ulrttdw (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE m_ulrttup (like measurements_tmpl including defaults including constraints including indexes);

CREATE TABLE m_dnsdelay (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE m_dnsdelayc (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE m_dnsdelaync (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE m_dnsfail (like measurements_tmpl including defaults including constraints including indexes);
CREATE TABLE m_dnsfailc (like measurements_tmpl including defaults including constraints including indexes);

CREATE TABLE m_dnsfailnc (like measurements_tmpl including defaults including constraints including indexes);

-- Now we have to cope with !@#!@ django for each table
-- not done yet, just testing

create trigger gen_id_dnsfailnc_update before update on m_dnsfailnc
	for each row execute procedure gen_id_measurement_update();

create trigger gen_id_dnsfailnc_insert before insert on m_dnsfailnc
	for each row execute procedure gen_id_measurement_insert();

-- And we should alter storage to being external for the !@#!@ ids
-- but premature optimization is the root of all evil. Test.

alter TABLE m_dnsfailnc ALTER COLUMN toolid set storage EXTERNAL;
alter TABLE m_dnsfailnc ALTER COLUMN id set storage EXTERNAL;
