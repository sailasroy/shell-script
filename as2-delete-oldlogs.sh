#!/bin /bash
DATE=$(date +%F)

APPS_DIR_FOLDER=/home/centos/app-logs
LOGDIR=/home/centos/script-logs
SCRIPT_NAME=$0
LOGFILE=$LOGDIR/$SCRIPT_NAME-$DATE.log

# finding the specified files/logs at the given time or date

FILES_TO_DELETE=$(find $APPS_DIR_FOLDER -name "*.log" -type f -mtime +14)

echo "$FILES_TO_DELETE" # prints the old logs 

## TO Delete the log files we will use while loop

while read line

    do 
    # write statements here
        echo " Deleting $line" &>>$LOGFILE
        rm -rf $line

    done <<< $FILES_TO_DELETE




