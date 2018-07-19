#!/bin/bash

dt=$(date +%F_%R)
files="/tmp/*.pdf"
for i in $files
do
    echo "I: $i"
done

