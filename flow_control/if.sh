#!/bin/bash

[ "1" -eq "1" ] && echo "Comando para ejecutar" || echo "Menasaje  error"
#Comando para no ejecutar
[ "0" -eq "1" ] && echo "Comando para no ejecutar" || echo "Menasaje error"
#Menasaje que esta modo test

[ "1" -eq "1" ] && echo "do something on Saturdays" || echo "do different things on other days"
#EQUIVALENT  BLOCK WOULD BE
if [ "1" -eq "1" ]; then
    echo "do something on Saturdays"
else
    echo "do different things on other days"
fi

#If more commands are needed 
[ "1" -eq "1" ] && { echo "do something on Saturdays"; echo "otra cosa";  } || echo "do different things on other days"

[ -f /etc/hosts ]  || echo "Not found"
[ -f /etc/hostssss ]  || echo "Not found"
#Not found

if "0";then
    echo "if cero con comillas"
else
    echo "else cero con comillas"
fi

if 0;then
    echo "if cero sin comillas"
else
    echo "else cero sin comillas"
fi
