#!/bin/bash

VAR=`. exit-01.sh 1`
echo "salida de la ejecucion del script de los echo"
echo $VAR

echo

echo "### CODIGO 1"
./exit-01.sh 1 1>/dev/null 2>&1
echo $?

echo "### CODIGO 0"
./exit-01.sh 0 1>/dev/null 2>&1
echo $?


##################################
# command1 && command2
# command2 is executed if, and only if, command1 returns an exit status of zero.

# command1 || command2
# command2 is executed if, and only if, command1 returns a non-zero exit status

# The return status of AND and OR lists is the exit status of the last command executed in the list."

./exit-01.sh 1 1>/dev/null 2>&1 || echo "Si se ejecuta"
./exit-01.sh 0 1>/dev/null 2>&1 || echo "No se ejecuta"

##################################################
echo
echo "DIRECTAMENTE CON IF"
# EN EL IF: SIN CORCHETES, EL 0 ESTA OK Y OTRO NUM FALSE
if  ./exit-01.sh 1 1>/dev/null 2>&1; then
    echo "IF CON PARAM 1"
fi

if  ./exit-01.sh 0 1>/dev/null 2>&1; then 
    echo "IF CON PARAM 0"
fi

if  ./exit-ok-fc.sh 1>/dev/null 2>&1; then 
    echo "exit ok CON PARAM 0"
fi

echo "paso"
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


#$ ./exit-status-02.sh 
#salida de la ejecucion del script de los echo
#exit 1
#
#### CODIGO 1
#1
#### CODIGO 0
#0
#
#DIRECTAMENTE CON IF
#Si se ejecuta
#IF CON PARAM 0
