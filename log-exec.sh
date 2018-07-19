#!/bin/bash 

#DOCUMENTACION
# Log messages, to use inside another script
# If we call it with param -s, log a line

#Params
# $1 : Name of calling script
# $2 : Message to log

# Banderas
# -s : Log a separator

#### --------------------------------------------------------- ####
# Flag letures
#### --------------------------------------------------------- ####
while getopts ":s" opt; do
  case $opt in
    s)
      echo "-----------------------------------------------------" >> $LOG 
      exit 0
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

#### --------------------------------------------------------- ####
# ppal exec
#### --------------------------------------------------------- ####

# If notcalled with any flag
# Log timestamp, name of the program and message

echo "[$TSTAMP][${1:-""}] - ${2:-"Unknown Message"}" 

params="$@"
printf "%s\t$params" "$(date) "
echo
