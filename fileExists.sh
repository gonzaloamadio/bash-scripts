#!/bin/bash

if [ ! -f zz.txt ]; then
    echo "File not found!"
else
   echo "file found"
fi

VAR=zz.txt

[ -f /home/lenovo/Playground/bash-tests/$VAR ] || echo "File not found!"

if [ -a zz.txt ]; then
    echo "existe"
fi
