#!/bin/bash

TO_ADDRESS=$!
SUBJECT=$2
 BODY=$(sed -e 's/[]\/$*.^[]/\\&/g' <<< $3)
ALERT_TYPE=$4
TEAM_NAME=$5

FINAL_BODY=$(sed -e "s/TEAM_NAME/$TEAMNAME/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -r "s/MESSAGE/$BODY/g" template.html)
##echo ("all args : $@")
echo "$FINAL_BODY" | mail -s "$(echo -e "$SUBJECT \n Content-Type: text/html")" "$TO_ADDRESS"