#!/bin/bash
    FILENAME=/home/centos/roy/dillis.txt
    #n=1
    FILE_FREQUENCY=$(cat $FILENAME | awk '{for(i=1;i<=NF;++i) { arr[$i]++; } } END { x=0; for(var in arr) {newarr[arr[var]]=var; if(arr[var]>x) x=arr[var];} for(i=x;i>0;--i) if (newarr[i] > 0) print newarr[i] " "i; }')
    number_of_lines=`wc --words < $FILENAME`
    while read line
    do 
    ##echo "Line no. $n : $line"

    echo "$line"
    #echo "$character"
    ##n=$((n+1))

    done <$FILE_FREQUENCY 

        echo "number of words =$number_of_lines"