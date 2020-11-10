#!/bin/bash

# http://linuxcommand.org/wss0150.php

#true; echo $? # 0

#false; echo $? # 1

##################################
# Check the exit status

some_directory=/tmppppp
cd $some_directory
if [ "$?" == "0" ]; then
#        rm *
    echo "entre al if ok"
else
        echo "Cannot change directory!" 1>&2
#        exit 1
fi

cd $some_directory
STATUS=$?
if [ "$STATUS" -eq "0" ]; then
#        rm *
    echo "entre al if ok"
else
        echo "Cannot change directory! [STATUS]" 1>&2
        exit 1
fi

exit
##################################
# A better way

#sin los corchetes asi es true cuando es cero
if cd $some_directory; then
 #   rm *
    echo "entre el if OK, sin corchetes"
else
    echo "Could not change directory! Aborting." 1>&2
    #exit 1
fi

##################################
# An error exit function

function error_exit
{
    echo "$1" 1>&2
    exit 1
}

# Using error_exit

if cd $some_directory; then
 #   rm *
    echo "entre al if ok siun corchetes y con fc"
else
    error_exit "Cannot change directory!  Aborting."
fi


##################################
# command1 && command2
# command2 is executed if, and only if, command1 returns an exit status of zero.

# command1 || command2
# command2 is executed if, and only if, command1 returns a non-zero exit status

# The return status of AND and OR lists is the exit status of the last command executed in the list."
