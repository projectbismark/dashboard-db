#!/bin/sh


if [ "$1" != "" ]
then
DB="--dbname $1"
fi

PVER=`psql --version | head -1 | awk '{print $3;}' | cut -f1-2 -d.`
CONTRIBDIR=/usr/share/postgresql/$PVER/contrib

# fixme, you need perms to create databases
# You need:
# pgplang
# pgcrypto
# createdb $DB
# pg_buffercache.sql
# postgis (for geoip)
psql $DB -f init.sql
createlang plpgsql $DB
psql $DB -f $CONTRIBDIR/pgcrypto.sql
psql $DB -f $CONTRIBDIR/pg_buffercache.sql

# FIXME Use bytea for ids as sha1 hashes to make the db replicatable
# FIXME Why use ids at all? DJANGO requires them until after GSOC 2011

# createdb perms
# FIXME set defaults right in defaults.sql and enforce
# FIXME: thoroughly review indexes.sql  before using it
# (it also helps to have no indexes during imports)
# Similarly permissions and triggers

bismark_active/gen_capetown.sh

TESTS="bismark_active/*.sql bismark_active/triggers/*.sql \
	*.gsql \
	bismark_passive/*.sql bismark_passive/triggers/*.sql"
FILES="types.sql functions.sql mgmt.sql table_templates.sql compat.sql $TESTS constraints.sql triggers.sql permissions.sql views.sql django_support.sql mgmt_data.sql"
for i in $FILES
do
psql -f $i $DB
done

