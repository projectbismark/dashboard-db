#!/bin/sh

if [ -x ~/.dbdashboardmysql ]
then
. ~/.dbdashboardmysql
f

mysql "$DBHOST" -u $DBUSER -p$DBPASS $DB

