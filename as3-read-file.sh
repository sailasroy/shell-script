#!/bin/bash
    FILENAME=/home/centos/roy/dillis.txt
    #n=1
    FILE_FREQUENCY=$(awk '{words[$1]+=1} END{for(word in words){print word,words[word]}}' RS="[ \n]+" $FILENAME  | sort -nrk2)
    number_of_lines=`wc --words < $FILENAME`
    while read line
    do 
    ##echo "Line no. $n : $line"

    echo "$line"
    #echo "$character"
    ##n=$((n+1))

    done <$FILE_FREQUENCY 

        echo "number of words =$number_of_lines"