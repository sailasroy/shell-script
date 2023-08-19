#!/bin/bash
    FILENAME=/home/centos/roy/dillis.txt

    while read -n character
    do 

    ## echo "$line"
    echo "$character"

    done <$FILENAME