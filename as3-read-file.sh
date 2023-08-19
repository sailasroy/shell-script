#!/bin/bash
    FILENAME=/home/centos/roy/dilli.txt

    while IFS= read in line
    do 
    echo "$line"

    done <$FILENAME