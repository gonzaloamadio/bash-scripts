#!/bin/bash

# Convert a path, changing bars for dots, and if it is only a bar, harcode
FILE=""
if [ $# -eq 0 ] || [ $# -gt 1 ]; then
   echo "Must pass one parameter, partition to convert"
   exit 1
fi

if [ $1 == "/" ]; then
#    echo "particion barra"
    FILE="part_barra"
else
    FILE=$(echo $1 | sed  's/\//./g')
fi

echo $FILE

