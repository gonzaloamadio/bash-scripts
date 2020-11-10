#!/bin/bash 

# DOC
# Function of global exit. Pass to it the program name and an error message.

##NOTA 
# command1 || command2
# command2 is executed if, and only if, command1 returns a non-zero exit status

#USAGE: We will call this exit function from other script, passing program name and exit message.
#But also, to make the caller exit, we have to append "|| exit 1"
# EXAMPLE:   exit_err.sh $PRGNAME "Everything wrong" || exit 1

echo "${1:-""}: ${2:-"Unknown Error"}" 1>&2
exit 1


# In if : without brackets, the 0 is OK and other num is false.
#if  0; then
#    echo "IF CON PARAM 0"
#fi

