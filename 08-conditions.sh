#!/bin/bash

USERID=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 .... FAILURE"
         exit 1
    else
         echo "$2 .... SUCCESS"
    fi

}

if [ $USERID -ne 0 ]
    then
    echo "ERROR :: sign in with root access"
    exit 1
    fi 

    yum install mysql -y
    VALIDATE $? "Installing Mysql"
    # if [ $? -ne 0 ]
    # then
    # echo "Mysql installation error"
    # exit 1
    # else
    # echo "Mysql istallation success"
    # fi

 yum install postfix -y
    VALIDATE $? "Installing Postfix"

#  if [ $? -ne 0 ]
#     then
#     echo "Postfix installation error"
#     exit 1
#     else
#     echo "Postfix istallation success"
#     fi