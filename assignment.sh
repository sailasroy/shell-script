#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
echo "ERROR :: sign in with root access "
exit 1
fi