#!/bin/bash
    FILENAME=/home/centos/roy/dilli.txt

    while read -n1 character
    do 

    ##echo "$line"
    echo "$character"

    done < $FILENAME