#!/bin/bash

# This is not good practive, because if we call it from cron, the path is other, not where the script is located.
# We would have to make cd /path/to/script in cron before exec, or put full path here. Second choice like me more.
PATH=`pwd -P`
ME="$PATH/${0##*/}"
GLOBALVARS="$PATH/globalVars.sh"


echo "# Real path...............->   $PATH    "
echo "# Real path of script (no care if we call with absolut or from local folder as ./), only care they are in same folder ------"
echo " $ME "
echo "------------------------------"

echo
echo "# arguments called with ---->  ${@}     "
echo "# \$1 ---------------------->  $1       "
echo "# \$2 ---------------------->  $2       "
echo "# path to me --------------->  ${0}     "
echo "# parent path -------------->  ${0%/*}  "
echo "# my name ------------------>  ${0##*/} "
echo

###########################################################################
## EN RESUMEN##########################

PATH=`pwd -P`
GLOBALVARS="$PATH/globalVars.sh"

if [ -f $GLOBALVARS ] ; then
	. $GLOBALVARS
else
   echo "Variables not defined"
   exit 0
fi

echo "----------------------"
echo $VAR
echo "----------------------"
