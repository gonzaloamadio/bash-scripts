#!/bin/bash

if [ "$1" = "--child" ]; then
  sleep 5
elif [ "$1" = "--parent" ]; then
  "$0" --child &
  for child in $(jobs -p); do
    echo "$child" 
    echo kill "$child" && kill "$child"
  done
  wait $(jobs -p)

  else
  echo "Must be invoked with --child or --parent."
fi
