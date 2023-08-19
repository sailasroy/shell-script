#!/bin/bash
    FILENAME=/home/centos/roy/dilli.txt

    while read in line
    do 
    echo "$line"

    done <<< $FILENAME