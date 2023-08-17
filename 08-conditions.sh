#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]
    then
    echo "ERROR :: sign in with root access"
    fi 