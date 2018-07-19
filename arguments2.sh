#!/bin/bash

# Call basj scripts with parameters

SUCCESS=0
FAILURE=1

 # Usage function.
 f_usage(){
  echo ""
  echo "Uso: `basename $0` SOME_PARAMETER"
  echo ""
  echo "Pass one parameter to script"
  echo ""
}

# Test if number of parameters $#, is equal to 1
if [ ! $# -eq 1 ]; then
  f_usage
  exit $FAILURE
fi

echo "$1" >> zz.txt

