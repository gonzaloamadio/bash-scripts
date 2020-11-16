#!/bin/bash

usage(){
cat <<- _EOF_

  Usage: `basename $0` interface_name

  Examples:
      `basename $0` eth0
      `basename $0` vpns0
_EOF_
}


if [ ! $# -eq 1 ]; then
  usage
  exit $FAILURE
fi

ip addr show dev "${1}" | awk '/^ +inet / {split($2,a,"/"); print a[1]}'
