#!/bin/sh

if [ -f ~/.dbdashboardmysql ]
then
. ~/.dbdashboardmysql
fi

mysql "$DBHOST -u $DBUSER -p$DBPASS $DB"

