#!/bin/sh
# Convert from the mysql database to the postgres one

TEMP=/tmp/idashboard
TABLES="USERSLA USERDEVICE DEVICES SLA USERS"

if [ -x ~/.dbdashboardmysql ]
then
. ~/.dbdashboardmysql
f

mkdir -f $TEMP
export MARGS="$DBHOST" -u $DBUSER -p$DBPASS $DB

#export MARGS="-h networkdashboard.org -u bismark_live_ro bismark_live_v1 -pf8d74cf689"

for i in $TABLES
do
mysqldump $MARGS --quick --single-transaction --compact --no-create-info --compatible=postgresql --tables $i > $TEMP/$i.sql
sed -i "s/\\\'/\'\'/g" $TEMP/$i.sql
sed -i "s/INSERT INTO \"$i\"/INSERT INTO $i/g" $TEMP/$i.sql
done

echo "if no errors, you can try to import the processed data"
