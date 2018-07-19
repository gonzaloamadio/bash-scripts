#!/bin/bash

VAR="VAR GLOBAL"

runtest(){
    echo "$@" 
}

run(){
   eval "$@"
}

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

#Ejeuta archivo si existe, sino imprime mesaje de que no existe
function runscr {
    [ -f $1 ] && $1 || echo "File $1 does not exists"
}

function echovars {
echo $VAR
echo $VARLOCAL
echo "PARAM 1: $1"
}
