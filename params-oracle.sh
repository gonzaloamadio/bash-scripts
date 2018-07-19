#!/bin/bash

#PARAMETROS: 
#Queremos que si ejecuta el script sin parametros, ejecute todo.
#Queremos tener la opcion de ejecutar el script sin enviar mails
#Queremos tener la opcion de ejecutar en modo test, sin modificar nada, solo reporting local
#Lo logramos respectivamente sin parametros, con el parametro "-m 0", y con "-t"
# Notar que si ponemos ambos "-m 0 -t", solo reportara localmente.

ERR=1
OK=0
TEST=0
M_ON=1

usage() { 
    echo 
    echo "Usage: $0 [-m <0|1>] [-t] [-h]" 1>&2;
    echo
    echo "If no paramas are specified, script execute all sentences and it will send mails"
    echo "  -m Activate (1) or deactivate (0) mail reports sending. Default value: 1"
    echo "  -t Test mode. Do not execute actions (delete, update, etc). Only read action and console reporting. Default: no test mode"
    echo "  -h Display usage"
    echo
    exit $OK;
}

#First semicolon : not verbose mode
#Semicolon after letter indicate that must have optional argument.
while getopts ":m:th" o; do
    case "${o}" in
        m)
            M_ON=${OPTARG}
            ((M_ON == 0 || M_ON == 1)) || usage
            ;;
        t)
            TEST=1
            ;;
        *)#Cualquier otra bandera que no sea -s o -p imprimir uso. O si un parametro requiere argumento tambien entra aca.
          # O sea reemplazamos el casi de ? y de : por el * (Si es que no necesitamos dar un error tan preciso y solo imprimimos el uso
            usage
            ;;
    esac
done
shift $((OPTIND-1))

echo "M_ON:  $M_ON"
echo "TEST: $TEST"


#$ ./params-oracle.sh 
#M_ON:  1
#TEST: 0
#$ ./params-oracle.sh -m 0
#M_ON:  0
#TEST: 0
#$ ./params-oracle.sh -m 0 -t
#M_ON:  0
#TEST: 1
