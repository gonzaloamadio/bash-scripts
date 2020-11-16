#!/bin/bash

date2stamp () {
    date --utc --date "$1" +%s
}

stamp2date (){
    date --utc --date "1970-01-01 $1 sec" "+%Y-%m-%d %T"
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


# USAGE # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# convert a date into a UNIX timestamp
stamp=$(date2stamp "2006-10-01 15:00")
echo $stamp

# from timestamp to date
stamp2date $stamp


# calculate the number of days between 2 dates
# -s in sec. | -m in min. | -h in hours  | -d in days (default)
echo "NUMBER OF DAYS in: seconds, minuts, hours, days, days"
dateDiff -s "2006-10-01" "2006-10-31"
dateDiff -m "2006-10-01" "2006-10-31"
dateDiff -h "2006-10-01" "2006-10-31"
dateDiff -d "2006-10-01" "2006-10-31"
dateDiff -d "2006-10-01" "2006-10-01"
dateDiff  "2006-10-01" "2006-10-31"

# number of seconds between two times
echo "NUMBER OF SECONDS"
dateDiff -s "22:55" "22:56:07"
dateDiff -m "17:55" "23:15:07"
dateDiff -h "17:55" "23:15:07"
echo "......."

echo "number of minutes entre dia y hora"
dateDiff -s "2006-10-01 23:15:07" "2006-10-02 23:16:27"
dateDiff -m "2006-10-01 23:15:07" "2006-10-02 23:16:07"
dateDiff -d "2006-10-01 23:15:07" "2006-10-02 23:15:07"
echo "........"

echo "number of minutes hora"
dateDiff -m "23:15:07" "23:16:27"
echo "........"

# number of minutes from now until the end of the year
dateDiff -m "now" "2006-12-31 24:00:00 CEST"

# Other standard goodies from GNU date not too well documented in the man pages
# assign a value to the variable dte for the examples below
dte="2006-10-01 06:55:55"
dte2="2006-10-11 06:55:55"
echo $dte
echo $dte2

# add 2 days, one hour and 5 sec to any date
date --date "$dte  2 days 1 hour 5 sec"

# substract from any date
date --date "$dte 3 days 5 hours 10 sec ago"
date --date "$dte -3 days -5 hours -10 sec"

# or any mix of +/-. What will be the date in 3 months less 5 days
date --date "now +3 months -5 days"

# time conversions into ISO-8601 format (RFC-3339 internet recommended format)
date --date "sun oct 1 5:45:02PM" +%FT%T%z
date --iso-8601=seconds --date "sun oct 1 5:45:02PM"
date --iso-8601=minutes

# time conversions into RFC-822 format
date --rfc-822 --date "sun oct 1 5:45:02PM"

