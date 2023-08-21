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
usage=$(echo $line| awk '{print $6}' | cut -d % -f1 )
partition=(echo $line| awk '{print $1}')
##echo "$usage"
if [ $usage -gt $DISK_USAGE_THRESHOLD]
then 
echo "High Disk Usage on $partition : $usage"

done <<< $DISK_USAGE

