#!/bin/bash 

PROGNAME=$(basename $0)
# As I do not have definition in here, the exit comes from other file.
# And in here, I have to force it with  "&& exit 0" --> MMM NOT GOOD
./exit-ok-fc-global.sh $PROGNAME "Mensaje que todo ok" && exit 0

echo "Esto no se imprime"

 #./exit-ok-fc-global-caller.sh 
 #exit-ok-fc-global-caller.sh: Mensaje que todo ok

