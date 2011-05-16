#!/bin/sh
# Generate all the needed tables via a script
# requires the database argument

DB="$*"

TABLES="m_aggl3bitrate m_bitrate m_capacity m_jitter m_lmrtt m_pktloss m_rtt m_shaperate m_ulrttdw m_ulrttup m_dnsdelay m_dnsdelayc m_dnsdelaync m_dnsfail m_dnsfailc m_dnsfailnc"

echo "-- And we should alter storage to being external for the !@#!@ ids"
echo "-- but premature optimization is the root of all evil. Test."

for i in $TABLES
do
	echo "drop table $i cascade;"
	echo "drop trigger if exists gen_id_${i}_update on $i cascade;"
	echo "drop trigger if exists gen_id_${i}_insert on $i cascade;"
	echo "create table $i (like measurements_tmpl including defaults including constraints including indexes);"
	echo "create trigger gen_id_${i}_update before update on $i
	for each row execute procedure gen_id_measurement_update();"
	echo "create trigger gen_id_${i}_insert before insert on $i for each row execute procedure gen_id_measurement_insert();"
	echo "alter TABLE $i ALTER COLUMN toolid set storage EXTERNAL;"
	echo "alter TABLE $i ALTER COLUMN id set storage EXTERNAL;"
done | psql $DB
