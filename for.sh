#!/bin/bash

IFS="
"
for word in $(cat asd.txt); do 
    [ "$word" == 2131 ] && continue
    echo $word; 
done
