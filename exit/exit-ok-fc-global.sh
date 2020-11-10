#!/bin/bash 

#DOCUMENTACION
# Funcion de exit global. Le pasamos el nombre del programa y un mensaje de error.

##################################
# command1 && command2
# command2 is executed if, and only if, command1 returns an exit status of zero.

#USAGE: We will call this exit function from other script, passing program name and exit message.
#But also, to make the caller exit, we have to append "&& exit 0"
# EXAMPLE:   exit_ok.sh $PRGNAME "Everything OK" && exit 0

# http://linuxcommand.org/wss0150.php

echo "${1:-""}: ${2:-"Exit Ok"}" 1>&2
exit 0

#echo "Example of error with line number and message"
#ok_exit $PROGNAME "$LINENO: Esta todo en orden"
#ok_exit "$LINENO: Esta todo en orden"



# EN EL IF: SIN CORCHETES, EL 0 ESTA OK Y OTRO NUM FALSE
#if  ./exit-01.sh 0 1>/dev/null 2>&1; then
#    echo "IF CON PARAM 0"
#fi 

