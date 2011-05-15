#!/bin/sh

# You need:
# pgplang
# pgcrypto
# geoip

if [ "$1" -ne "" ]
then
DB="--dbname $1"
fi

# fixme, you need perms to create databases

# createdb $DB
# createlang plpgsql
# create pgcrypto
# create pggeoip

# FIXME Use bytea for ids as sha1 hashes to make the db replicatable
# FIXME Why use ids at all?

# createdb perms
# FIXME set defaults right in defaults.sql and enforce
# FIXME: thoroughly review indexes.sql  before using it
# (it also helps to have no indexes during imports)
# Similarly permissions and triggers

TESTS=bismark_tests/*.sql
FILES="types.sql functions.sql mgmt.sql compat.sql $TESTS constraints.sql triggers.sql permissions.sql views.sql"
for i in $FILES
do
#cat defaults.sql $i | psql $DB
psql -f $i $DB
done

