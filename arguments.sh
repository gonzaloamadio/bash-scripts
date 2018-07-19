#!/bin/bash

# Call a script with parameters and use it inside script

echo $1

# Pass a dat as argument : dd/mm/YYYY and parse it
DIA=`echo $1 | cut -d / -f1`
MES=`echo $1 | cut -d / -f2`
ANIO=`echo $1 | cut -d / -f3`
TYPE=".txt"
echo $DIA$MES$ANIO$TYPE

NAME="zzz.txt"
rm $NAME