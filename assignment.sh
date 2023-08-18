#!/bin/bash
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
DATE=$(date +%F)
USERID=$(id -u)
if [ $USERID -ne 0 ]
    then
        echo -e "$R ERROR :: sign in with root access $N "
        exit 1
fi

VALIDATE(){
if [ $1 -ne 0]
    then
        echo "Insatallation of $2 ....$R FAILURE $N "
        exit 1
    else     
        echo "Insatallation of $2 ....$G SUCCESS $N "   
fi        
}

SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

for i in $@
do 
     yum list installed $i &>>$LOGFILE
if [ $? -ne 0 ]
    then
        echo "The package $i is not installed"
      yum install $i -y &>>$LOGFILE
VALIDATE $? "$i"    
    else
        echo -e "$Y The package $i is already installed $N"
fi
done
