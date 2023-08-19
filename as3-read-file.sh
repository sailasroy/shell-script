#!/bin/bash
    FILENAME=/home/centos/roy/dillis.txt
    #n=1

    
    while read line
    do 
    ##echo "Line no. $n : $line"

    echo "$line"
    #echo "$character"
    ##n=$((n+1))

    done <$FILENAME