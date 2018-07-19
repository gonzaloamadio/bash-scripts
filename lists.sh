#!/bin/bash


YEAR=$(date +%Y)

# Pass kay and value, from which we construct a list and add a value to the end. Also we pass file where to do it (full path)
#EJ:   add_to_list 1 "ST01-vol01" /logs/valores.log
# In file we have lines like KEY=[1,2,4]
function add_to_list {
    LIST=$(grep $2 $3)
    #Si la lista es vacia
    if [ `echo $LIST | grep '\[\]' |  wc -l` -eq "1" ]; then
        LIST_=$(echo $LIST | sed 's/\s\+$//g' | sed 's:\(.*\).$:\1:') # Take space at end of line, and then last character, i.e. "]"
        NEW_LIST="${LIST_}$1]"   
    else
        LIST_=$(echo $LIST | sed 's/\s\+$//g' | sed 's:\(.*\).$:\1:')
        NEW_LIST="${LIST_},$1]"
    fi

    sed -i "/$2/d" $3 # Delete inplace
    echo $NEW_LIST >> $3 # Reinsert new list with added value
}

#  $1 = KEY -- EJEMPLO :  "##${YEAR}##${1}##USED"
# $2 = full path of log file
function create_list {
    MONTH=$(date +%m)
    if [ $MONTH -eq "0" ];then
        echo "$1[]"  >> $2
    else
        echo "$1[]" >> $2
        T2=$(($MONTH - 1))
        # If we exec this script for thefirst time in month 6, create a list with 5 zeroes (Because we do not have values for that months)
        for i in $(seq 1 $T2)
        do
            add_to_list 0 $1 $2
        done
    fi
}

function del-empty-lines {
  sed -i '/^\s*$/d' $1 
}

VOL="SSD01"
KEY="##${YEAR}##${VOL}##AVAILABLE="
if [ `cat /tmp/listas.log | grep $KEY |  wc -l` -eq "0" ]; then
        create_list $KEY /tmp/listas.log
        add_to_list 3 $KEY /tmp/listas.log
else
        add_to_list 3 $KEY /tmp/listas.log
fi


