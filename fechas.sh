#!/bin/bash

date -r $file | awk '{ printf $1 "\n"}'
stat -c %y grep.sh | awk '{ printf $1 "\n"}'
ls -l  | grep grep |  awk '{print $6, " ", $7, " ", $8, " ", $9 }'

DATE=`date +"%F_%T"`
echo $DATE
