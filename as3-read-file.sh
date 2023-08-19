#!/bin/bash
    FILENAME=/home/centos/roy/dilli.txt

    while IFS=' ' read in line -n1 character
    uniq -c $line
    do 

    echo "$line"
    echo "$character"

    done < $FILENAME