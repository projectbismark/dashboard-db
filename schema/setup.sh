#!/bin/sh


if [ "$1" != "" ]
then
DB="--dbname $1"
fi

CONTRIBDIR=/usr/share/postgresql/8.4/contrib

# fixme, you need perms to create databases
# You need:
# pgplang
# pgcrypto
# createdb $DB
# pg_buffercache.sql
# postgis (for geoip)

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

TESTS="bismark_active/*.sql bismark_passive/*.sql"
FILES="init.sql types.sql functions.sql table_templates.sql mgmt.sql compat.sql $TESTS constraints.sql triggers.sql permissions.sql views.sql mgmt_data.sql"
for i in $FILES
do
#cat defaults.sql $i | psql $DB
psql -f $i $DB
done

