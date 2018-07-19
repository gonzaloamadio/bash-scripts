#!/bin/bash

IFS='
'
exec 4< pruebas           # opening  file via descriptor
while read LINE <&4; do
#     echo "++++++++++++++++++++++++++++++++++++++++++++++++" >> log
#     printf "%s\n" "$LINE" >> log  
#     $LINE > /tmp/salida.log
#     grep copiados /tmp/salida.log >> log 
    $LINE
 done
