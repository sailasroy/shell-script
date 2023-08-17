#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
    then
    echo "ERROR :: sign in with root access"
    exit 1
    fi 

    yum install mysql -y

    if [ $? -ne 0 ]
    then
    echo "Mysql installation error"
    exit 1
    else
    echo "Mysql istallation success"
    fi

 yum install postfix -y

 if [ $? -ne 0 ]
    then
    echo "Postfix installation error"
    exit 1
    else
    echo "Postfix istallation success"
    fi