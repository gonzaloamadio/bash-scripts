#!/bin/bash

VAR=`. exit-01.sh 1`
echo "VAR"
echo $VAR
echo "------------------"

echo

echo "### CODE 1"
./exit-01.sh 1 1>/dev/null 2>&1
echo $?

echo "### CODE 0"
./exit-01.sh 0 1>/dev/null 2>&1
echo $?

echo
echo "DIRECTLY WITH IF"

./exit-01.sh 1 1>/dev/null 2>&1 || echo "Yes, executed"
./exit-01.sh 0 1>/dev/null 2>&1 || echo "No executed"

if ./exit-01.sh 0 >/dev/null
then
    echo "IF OK"
else
    echo "IF NO OK"
fi


# VAR
# exit 1
# ------------------

### CODE 1
# 1
### CODE 0
# 0

# DIRECTLY WITH IF
# Yes, executed
# IF OK
