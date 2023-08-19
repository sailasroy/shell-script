#!/bin/bash
    FILENAME=/home/centos/roy/dillis.txt
    #n=1
    FILE_FREQUENCY=$(cat $FILENAME | tr -s ' ' '\n' | awk '{nums[$1]++}END{for(word in nums) print word, nums[word]}' | sort -rn -k2)
    number_of_lines=`wc --lines < $FILENAME`
    while read line
    do 
    ##echo "Line no. $n : $line"

    echo "$line"
    #echo "$character"
    ##n=$((n+1))

    done <$FILE_FREQUENCY 

        echo "number of lines =$number_of_lines"