#!/bin/bash

USERID=$(id -u)
   
if [ $USERID -ne 0 ]
    then
    echo "ERROR :: sign in with root access"
    exit 1
    fi 


VALIDATE(){
    if [ $@ -ne 0 ]
    then
        echo -e "Installing $i ....$R FAILURE $N"
         exit 1
    else
         echo -e " Installing $i ....$G SUCCESS $N"
    fi

}
    DATE=$(date +%F)
    SCRIPT_NAME=$0
    LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
    R="\e[31m"
    G="\e[32m"
    N="\e[0m"



for i in $@
do 
 
yum install $i -y >>$LOGFILE
VALIDATE $? "$i"
done