#!/bin/bash
R="\e[31m" 
G="\e[32m"
N="\e[0m"
Y="\e[33m"

LOG_DIR=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGDIR/$SCRIPT_NAME-$DATE.log
DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesysytem')
DISK_USAGE_THRESHOLD=1

while IFS= read line
do
##echp "output : $line"
usage=$(echo $line | awk '{print $6}' )

done <<< $DISK_USAGE

