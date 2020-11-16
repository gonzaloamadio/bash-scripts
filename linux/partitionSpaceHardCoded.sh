#!/bin/bash
# set -x
# Shell script to monitor or watch the disk space

USEP=`df -H | grep -vE "^Filesystem|tmpfs|cdrom" | awk '{print $5 " " $6}'  | grep -vE "dev|cgroup|run|Monta" | awk '{ print $1}' | cut -d'%' -f1`
PART=`df -H | grep -vE "^Filesystem|tmpfs|cdrom" | awk '{print $5 " " $6}'  | grep -vE "dev|cgroup|run|Monta" | awk '{ print $2}'`
  if [ $USEP -gt 10 ]
  then
        if [ ! -f /tmp/particion_barra_excedida ]
        then
      	   echo "Disk partition running out of space, \"$PART ($USEP%)\" in server NAME, [$(date)]"
           touch /tmp/particion_barra_excedida
           # May send mail or do another action
        fi
  else
	rm -f /tmp/particion_barra_excedida
  fi
