#!/bin/bash

TO_ADDRESS=$1
SUBJECT=$2
BODY=$(sed -e 's/[]\/$*.^[]/\\&/g' <<< $3)
ALERT_TYPE=$4
TEAM_NAME=$5

##FINAL_BODY=$(sed -e "s/TEAM_NAME/$TEAM_NAME/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -r "s/MESSAGE/$BODY/g" template.html)
##echo ("all args : $@")
FINAL_BODY=$(sed -e "s/TEAM_NAME/$TEAM_NAME/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -e "s/MESSAGE/$BODY/g" template.html)


##echo "$FINAL_BODY" | mail -s "$(echo -e "$SUBJECT \n Content-Type: text/html")" "$TO_ADDRESS"

######echo "$FINAL_BODY" | mail -s "$(echo -e "$SUBJECT")" "$TO_ADDRESS"
echo "$FINAL_BODY" | mail -s "$(echo -e "$SUBJECT\nContent-Type: text/html")" "$TO_ADDRESS"