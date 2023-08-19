#!/bin/bash
    FILENAME=/home/centos/roy/dillis.txt
    #n=1
    FILE_FREQUENCY=$(cat $FILENAME | tr -s ' ' '\n' | awk '{nums[$1]++}END{for(word in nums) print word, nums[word]}' | sort -rn -k2)
    number_of_lines=`wc --words < $FILENAME`
    REPLACE_WORD=$(sed -i 's/anoop/srikanth/g' $FILENAME)
#     REPLACE(){
#         read -p "Enter the search string: " search

# # Take the replace string
# read -p "Enter the replace string: " replace

# if [[ $search != "" && $replace != "" ]]; then
#   sed -i "s/$search/$replace/" $FILENAME
# fi
#     }

    while read line
    do 
    # REPLACE $
    ##echo "Line no. $n : $line"

    echo "$REPLACE_WORD $line"
    
    #echo "$character"
    ##n=$((n+1))

    done <$FILENAME

        echo "number of words =$number_of_lines"
        echo "$FILE_FREQUENCY"