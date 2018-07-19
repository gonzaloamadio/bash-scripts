#!/bin/bash

date2stamp () {
   date --utc --date "$1" +%s
}

dateDiff (){
        case $1 in
                    -s)   sec=1;      shift;;
                    -m)   sec=60;     shift;;
                    -h)   sec=3600;   shift;;
                    -d)   sec=86400;  shift;;
                     *)    sec=86400;;
        esac
        dte1=$(date2stamp $1)
        dte2=$(date2stamp $2)
        diffSec=$((dte2-dte1))
        if ((diffSec < 0)); then abs=-1; else abs=1; fi
        echo $((diffSec/sec*abs))
}

dateDiff -d "2006-10-29" "2006-10-29"


date --date="$(date +%Y-1-15) -1 month" +'Last month was %m!'
# In order not to be problems with months of 30, 31, 28, etc.. We use day 15 y substract one month.
MONTH=`date +%m --date="$(date +%Y-%m-15) -1 month"`
echo $MONTH

