#!/bin/bash


DIRECTORY="$HOME/.virtualnvs"
if [ -d "$HOME/.virtualenvs" ]; then
  # Control will enter here if $DIRECTORY exists.
  echo "si"
else
  echo "no"
fi
echo "aca"
exit

#http://stackoverflow.com/questions/59838/check-if-a-directory-exists-in-a-shell-script
if [ -d "$DIRECTORY" ]; then
  # Control will enter here if $DIRECTORY exists.
fi
