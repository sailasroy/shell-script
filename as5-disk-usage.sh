# #!/bin/bash
# R="\e[31m" 
# G="\e[32m"
# N="\e[0m"
# Y="\e[33m"

# LOG_DIR=/tmp
# DATE=$(date +%F:%H:%M:%S)
# SCRIPT_NAME=$0
# LOGFILE=$LOGDIR/$SCRIPT_NAME-$DATE.log
# DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesysytem')
# DISK_USAGE_THRESHOLD=1
# message=""

# while IFS= read line
# do
# ##echp "output : $line"
# ##usage=$(echo $line | awk '{print $6}' | cut -d % -f1)
# usage=$(echo $line | awk '{print $6}' | cut -d % -f1)

# partition=$(echo $line| awk '{print $1}')
# ##echo "$usage"
# ####if [ $usage -gt $DISK_USAGE_THRESHOLD ];
# if [ $usage -gt $DISK_USAGE_THRESHOLD ];
# then 
#   message+="High Disk Usage on $partition : $usage \n"
# fi

# done <<< $DISK_USAGE
# echo -e "message: $message "

#!bin/bash
R="\e[31m" 
G="\e[32m"
N="\e[0m"
Y="\e[33m"

LOG_DIR=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGDIR/$SCRIPT_NAME-$DATE.log

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=1
message=""
while IFS= read line
do 
 usage=$(echo $line | awk '{print $6}' | cut -d % -f1)
 partition=$(echo $line | awk '{print $1}')

 if [ $usage -gt $DISK_USAGE_THRESHOLD ];
 then 
 message+="HIGH DISK USAGE ON $partition : $usage \n"
 fi
done <<< $DISK_USAGE

echo -e "message: $message"
###echo "$message" | mail -s "message" sailasroy123@gmail.com

sh mail.sh sailasroy123@gmail.com "High Disk Usage" "$message" "DEVOPS TEAM" "High Disk usage"






