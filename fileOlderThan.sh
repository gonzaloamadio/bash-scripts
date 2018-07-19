#!/bin/bash

# Date to timestamp formate YYYY-MM-DD
date2stamp () {
        date --utc --date "$1" +%s
    }

    # DIFF in days of two dates in format YYYY-MM-DD
    dateDiff(){
        sec=86400
        dte1=$(date2stamp $1)
        dte2=$(date2stamp $2)
        diffSec=$((dte2-dte1))
        if ((diffSec < 0)); then abs=-1; else abs=1; fi
        echo $((diffSec/sec*abs))
    }

    # Get last file of some folder (the newest file)
    LASTFILE=`find /srv/respaldos/pop/ -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" "`
    #LASTFILE:  /srv/respaldos/pop/Social DB_backup_2016_05_22_010016_3251811.bak

    # Get its TIMESTAMP
    YYYYMMDD=`stat -c %y "$LASTFILE"  | sed 's/^\([0-9\-]*\).*/\1/'`
    #YYYYMMDD:  2016-05-22

    TODAY=`date +%Y-%m-%d`

    DIFF=`dateDiff $TODAY $YYYYMMDD`

    if [ $DIFF -gt 8 ]
    then
        echo "ERROR IN BACKUPS"
    fi

