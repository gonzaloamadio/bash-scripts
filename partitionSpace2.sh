#!/bin/bash
# set -x
# Shell script to monitor or watch the disk space
# It will send an email to $ADMIN, if the (free available) percentage of space is >= 90%.
# -------------------------------------------------------------------------
# Set admin email so that you can get email.
ADMIN="root"
# set alert level 90% is default
ALERT=97
# Exclude list of unwanted monitoring, if several partions then use "|" to separate the partitions.
# An example: EXCLUDE_LIST="/dev/hdd1|/dev/hdc5"
EXCLUDE_LIST=""
#
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#

if [ "$EXCLUDE_LIST" != "" ] ; then
  df -H | grep -vE "^Filesystem|tmpfs|cdrom|${EXCLUDE_LIST}" | awk '{print $5 " " $6}' > /tmp/checkDiskSpace
else
  df -H | grep -vE "^Filesystem|tmpfs|cdrom" | awk '{print $5 " " $6}' > /tmp/checkDiskSpace
fi

while read /tmp/checkDiskSpace;
do
#echo $output
  usep=$(echo $1 | awk '{ print $1}' | cut -d'%' -f1)
  partition=$(echo $1 | awk '{print $2}')
  if [ $usep -ge $ALERT ] ; then
     echo "Running out of space \"$partition ($usep%)\" on server $(hostname), $(date)" 
     #mail -s "Alert: Almost out of disk space $usep%" $ADMIN
  fi
done

