#!/bin/bash

# Create z1.txt, and delete while executing
x=1
while [ -a z1.txt ]
do
    if [ $x -eq 6 ]
    then
        exit 0
    fi
    sleep 5
    x=$(( $x + 1 ))
done

echo "pass"

