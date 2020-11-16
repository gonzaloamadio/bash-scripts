#!/bin/bash

#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
# Usage function.
f_usage(){
echo ""
echo "Usage: `basename $0` INTEGER" 
echo ""
 } 

if [ $# -lt 1 ]; then
   f_usage
   exit $FAILURE
fi

f_checkInt(){
res=`[[ $1 =~ ^-?[0-9]+$ ]] && echo true`
if [ ! $res ]
then
     echo "First parameter not integer"
     exit $FAILURE
fi
}

f_checkInt $1

echo "PASS TEST"

#$ ./checkIfIsInteger.sh 2.2
# First parameter not integer
#$ ./checkIfIsInteger.sh 2
# PASS TEST
#$ ./checkIfIsInteger.sh "2"
# PASS TEST
