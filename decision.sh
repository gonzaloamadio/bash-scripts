#!/bin/bash

read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
        # do dangerous stuff
        echo "apretaste y"
fi

#NEGATED FORM
#read -p "Are you sure? " -n 1 -r
#echo    # (optional) move to a new line
#if [[ ! $REPLY =~ ^[Yy]$ ]]
#then
#        exit 1
#fi
