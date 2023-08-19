#!/bin/bash
    FILENAME=/home/centos/roy/dilli.txt

    while read in line
    do 

     echo "$line"
    ##echo "$character"

    done < $FILENAME