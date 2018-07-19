#!/bin/bash

#http://wiki.bash-hackers.org/howto/getopts_tutorial
#http://stackoverflow.com/questions/16483119/example-of-how-to-use-getopts-in-bash

TODAY=`date +%Y%m%d`

# Usage function.
f_usage(){
  echo "Usage: `basename $0` -d DAYS [-a DAYS] [-t] [-h]"
  echo "       -d = Mandatory default number of days to keep log files that are not explicitly passed as parameters."
  echo "       -a = Optional number of days to keep audit logs."
  echo "       -h = Optional help mode."
  echo "       -t = Optional test mode. Does not delete any files."
}

if [ $# -lt 1 ]; then
  f_usage
  exit $FAILURE
fi

# Parse the command line options.
#When you want getopts to expect an argument for an option, just place a : (colon) after the proper option flag. If you want -A to expect an argument (i.e. to become -A SOMETHING) just do: "getopts fA:x VARNAME"
# Adentro de OPTARG esta el argumento que acompaña a la bandera
# Es decir si le pasamos -d 50 .... VARNAME va a ser -d y OPTARG va a ser 50.
while getopts a:b:c:d:n:r:u:th OPT; do
  case $OPT in
    a) ADAYS=$OPTARG
        echo "parametro a : $ADAYS"
       ;;
    d) DDAYS=$OPTARG
        echo "parametro d : $DDAYS"
       ;;
    t) TEST=1
       ;;
    h) f_usage
       exit 0
       ;;
    *) #Si no ponene ningun parametro, imprime el uso, y sale.
        f_usage
       exit 2
       ;;
  esac
done
#RESETEAMOS EL CURSOR
shift $(($OPTIND - 1))

# Ensure the default number of days is passed.
if [ -z "$DDAYS" ]; then
  echo "ERROR: The default days parameter is mandatory."
  f_usage
  exit $FAILURE
fi
#f_checkdays $DDAYS

# Set the number of days to the default if not explicitly set.
#ADAYS=${ADAYS:-$DDAYS}; echo "Keeping audit logs for $ADAYS days."; f_checkdays $ADAYS
