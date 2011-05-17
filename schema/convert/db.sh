#!/bin/sh

if [ -f ~/.dbdashboardmysql ]
then
. ~/.dbdashboardmysql
fi

mysql "-h $DBHOST -u $DBUSER -p$DBPASS $DB"

