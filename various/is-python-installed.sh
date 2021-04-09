#!/bin/bash


FAILURE=1
SUCCESS=0

# Usage function.
f_usage(){
  echo "Usage: `basename $0` version"
  echo "       version = python version. E.g. 3.6, 3.7, 2.7"
}


if [ $# -ne 1 ]; then
  f_usage
  exit $FAILURE
fi

PYTHON="python${1}"
var=$(ls /usr/bin/ | grep "^$PYTHON$")

if [ -z "$var" ]; then echo "var is unset"; else echo "var is set to '$var'"; fi
