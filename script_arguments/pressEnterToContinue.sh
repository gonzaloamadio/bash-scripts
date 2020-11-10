#!/bin/bash

#http://unix.stackexchange.com/questions/134437/press-space-to-continue

read -n1 -r -p "Press space to continue..." key

if [ "$key" = '' ]; then
    # Space pressed, do something
     echo [$key] is empty when SPACE is pressed # uncomment to trace
else
    # Anything else pressed, do whatever else.
     echo [$key] not empty
fi


read -n1 -r -p "Press enter to continue..." key

echo; echo "Press any key and it continues"
