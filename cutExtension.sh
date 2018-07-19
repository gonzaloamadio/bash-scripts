#!/bin/bash

VAR=algoalgo.sh

E="${VAR##*.}"
F="${VAR%.*}"

echo $E
echo $F
echo "------------"
FILE="example.tar.gz"
echo "${FILE%%.*}"
#example
echo "${FILE%.*}"
#example.tar
echo "${FILE#*.}"
#tar.gz
echo "${FILE##*.}"
#gz

echo "--------"
VAR2=/path/to/folder/file.log
FOLDER="${VAR2%/*}"
echo $FOLDER
echo "--------"
VAR3=/home/oracle/test/archivo.log
echo "PATH: $VAR3"
echo "--all after last /"
echo ${VAR3##*/}
#archivo.log
echo "--All after first /"
echo ${VAR3#*/}
#home/oracle/test/archivo.log
echo "--path"
echo ${VAR3%/*}
#/home/oracle/test
echo "-- everything before last dot"
echo "${VAR3%.*}"
#/home/oracle/test/archivo
echo "-- name of file without extension"
TMP=`echo "${VAR3##*/}"`
echo "${TMP%.*}"
