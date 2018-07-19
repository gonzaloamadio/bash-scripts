#!/bin/bash

echo "hola" &
pid[0]=$!
#echo "${pid[0]}"
#trap "kill ${pid[0]} ${pid[1]}; exit 1" INT
