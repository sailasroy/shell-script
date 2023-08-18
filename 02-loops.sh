#!/bin/bash

USERID=$(id -u)
   
if [ $USERID -ne 0 ]
    then
    echo "ERROR :: sign in with root access"
    exit 1
    fi 

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "Installing $2 ....$R FAILURE $N"
         exit 1
    else
         echo -e " Installing $2 ....$G SUCCESS $N"
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
yum list installed $i >>$LOGFILE
if [ $? -ne 0 ]
then
echo "There is no $i package , needs to install"
yum install $i -y >>$LOGFILE
VALIDATE $? "$i"
else
echo "the package $i already existing"
fi

 
done

