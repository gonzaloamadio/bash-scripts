#!/bin/bash

#http://stackoverflow.com/questions/9772036/pass-all-variables-from-one-shellscript-to-another

GLOBALVARS="/home/lenovo/Playground/bash-tests/globalVars.sh"
# If file exists
if [ -f $GLOBALVARS ] ; then
    . $GLOBALVARS 
else
   exit 1
fi


##########################################
echo $VAR

##########################################
# Is like executing inside same exec
# NOTE: If we make exit inside script, will cut all exec

# Inside here we use VAR as well
. ./globalVars-load2.sh

##########################################
CMD='ls /tmp'
run $CMD
runtest $CMD
echo
$CMD
##########################################
echo "Use a function inside GLOBALVARS with parameters and variables from here and GLOBALVARS"
VARLOCAL="VARLOCAL"
echovars "parameter 1"

##########################################
echo ; echo;
error_exit "Exit message"

#########################################
echo "RUNSRC test"
UPATH=/home/lenovo/Playground/bash-tests/utils
runscr $UPATH/test2.sh

echo "Pass besides file does not exists"
