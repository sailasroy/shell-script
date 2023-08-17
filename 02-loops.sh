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

# if [ $1 -ne 0 ]
# then
# echo "Package $i already installed"
# elso
# echo "Install $i the package"
# fi

pkg="$i"
if rpm -q $pkg
then
    echo "$pkg installed"
else
    echo "$pkg NOT installed"
fi