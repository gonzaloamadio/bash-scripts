#!/bin/bash 

# http://linuxcommand.org/wss0150.php

# A slicker error handling routine

# I put a variable in my scripts named PROGNAME which
# holds the name of the program being run.  You can get this
# value from the first item on the command line ($0).

PROGNAME=$(basename $0)

function error_exit
{

#   ----------------------------------------------------------------
#   Function for exit due to fatal program error
#       Accepts 1 argument:
#           string containing descriptive error message
#   ----------------------------------------------------------------


    echo "${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
    exit 1
}

# Example call of the error_exit function.  Note the inclusion
# of the LINENO environment variable.  It contains the current
# line number.

#echo "Example of error with line number and message"
error_exit "$LINENO: An error has occurred."

#The use of the curly braces within the error_exit function is an example of parameter expansion. You can surround a variable name with curly braces (as with ${PROGNAME}) if you need to be sure it is separated from surrounding text. Some people just put them around every variable out of habit. That usage is simply a style thing. The second use, ${1:-"Unknown Error"} means that if parameter 1 ($1) is undefined, substitute the string "Unknown Error" in its place


# EN EL IF: SIN CORCHETES, EL 0 ESTA OK Y OTRO NUM FALSE
#if  ./exit-01.sh 0 1>/dev/null 2>&1; then
#    echo "IF CON PARAM 0"
#fi

