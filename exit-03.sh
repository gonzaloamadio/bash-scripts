#!/bin/bash

VAR=`. exit-01.sh 1`
echo "Out of exe of script of echo"
echo $VAR

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

#cat exit-01.sh
#!/bin/bash

#if [ $1 -eq 0 ]
#then
#    echo "exit 0"
#    exit 0
#else 
#    echo "exit 1"
#    exit 1
#fi

#$ ./exit-03.sh 
# Out of exe of script of echo
#exit 1
#### CODE 1
#exit 1
#1
#### CODE 0
#0

