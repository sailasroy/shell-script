#!/bin/bash
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR :: sign in with root access $N "
    exit 1
fi