#!/bin/bash


#VAR=`ping -c 5 10.85.1.59 > /dev/null 2>&1`
VAR=`ping -c 2 -q as10.85.1.59 2>/dev/null`
if [ $? -ne 0 ] ; then
	echo "fail : $?"
    echo "VAR: $VAR"
else
	echo "no fail : $?"
    echo "VAR: $VAR"
fi