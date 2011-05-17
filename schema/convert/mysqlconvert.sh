#!/bin/sh
# Convert from the mysql database to the postgres one
echo "
| APPS                           |
| ARP_LOGS                       |
| DEVICES                        |
| DHCP_LOGS                      |
| EVENTS                         |
| EVENT_LOGS                     |
| FLOWS                          |
| FLOWS_17jul_26oct_2010         |
| FLOWS_26oct_7dec_2010          |
| FLOWS_SAMPLES                  |
| FLOWS_SAMPLES_17jul_26oct_2010 |
| FLOWS_SAMPLES_26oct_7dec_2010  |
| FLOWS_SAMPLES_newformat        |
| FLOWS_newformat                |
| MEASUREMENTS                   |
| SLA                            |
| TRACEROUTES                    |
| TRACEROUTE_HOPS                |
| USERDEVICE                     |
| USERS                          |
| USERSLA                        |
| WIFI_ASSOC                     |
| WIFI_SCAN          
"

TEMP=/tmp/idashboard
#TABLES="USERSLA USERDEVICE DEVICES SLA USERS DHCP_LOGS ARP_LOGS EVENTS EVENT_LOGS TRACEROUTES TRACEROUTE_HOPS WIFI_ASSOC WIFI_SCAN"
#TABLES="USERSLA USERDEVICE DEVICES SLA USERS TRACEROUTES TRACEROUTE_HOPS WIFI_ASSOC WIFI_SCAN"
TABLES="SLA USERSLA USERDEVICE DEVICES USERS"

if [ -f ~/.dbdashboardmysql ]
then
. ~/.dbdashboardmysql
fi

mkdir $TEMP
export MARGS="-h $DBHOST -u $DBUSER -p$DBPASS $DB"

for i in $TABLES
do
mysqldump $MARGS --quick --single-transaction --compact --no-create-info --compatible=postgresql --tables $i > $TEMP/$i.sql
sed -i "s/\\\'/\'\'/g" $TEMP/$i.sql
sed -i "s/INSERT INTO \"$i\"/INSERT INTO $i/g" $TEMP/$i.sql
done

echo "if no errors, you can try to import the processed data"
