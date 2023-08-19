#!/bin/bash
    FILENAME=/home/centos/roy/dilli.txt

    while IFS=' ' read in line
    uniq -c $line
    do 

    echo "$line"

    done < $FILENAME