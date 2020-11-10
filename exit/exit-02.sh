#!/bin/bash

if [ $1 -eq 0 ]
then
   . exit-01.sh 0
else 
   . exit-01.sh 1
fi

echo "paso"

# $ ./exit-02.sh 1
#exit 1
# $ ./exit-02.sh 0
#exit 0

