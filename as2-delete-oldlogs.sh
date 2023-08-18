#!/bin /bash
DATE=$(date +%F)

APPS_DIR_FOLDER=/home/centos/app-logs
LOGDIR=/home/centos/script-logs
SCRIPT_NAME=$0
LOGFILE=$LOGDIR/$SCRIPT_NAME-$DATE.log


FILES_TO_DELETE=$(find $APPS_DIR_FOLDER -name "*.log" -type f -mname +14)

echo "$FILES_TO_DELETE"



