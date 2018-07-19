#!/bin/bash

  #USAGE

  #En el ESX hay que poner un script con el siguiente codigo:
  #Lo que hace, es devolvernos la carga primedio de 1 minuto.
  #!/bin/bash
  #esxtop -b -c /tmp/esxcfglight -d 5 -n 1 > /tmp/esxcfglight.csv
  #cat /tmp/esxcfglight.csv  | awk -F "," {'print $5'} | tail -1  > /tmp/load.log

  #Como la consola de ESX es bastante limitada, nos traeremo el resultado y realizaremos todo el trabajo localmente.

  #Parametros: IP umbral_warning umbral_critical

#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
# Usage function.
f_usage(){
echo ""
#echo "Usage: `basename $0` -d DAYS [-a DAYS] [-b DAYS] [-c DAYS] [-n DAYS] [-r DAYS] [-u DAYS] [-t] [-h]"
echo "Usage: `basename $0` IP UMBRAL_WARNING UMBRAL_CRITICAL"
echo ""
 } 

if [ $# -lt 3 ]; then
   f_usage
   exit $FAILURE
fi

#Chequeamos si los parametros de umbrales son enteros
res=`[[ $2 =~ ^-?[0-9]+$ ]] && echo true`
if [ ! $res ]
then
    echo "el segundo parametro no es entero"
    exit $FAILURE 
fi

res=`[[ $3 =~ ^-?[0-9]+$ ]] && echo true`
if [ ! $res ]
then
    echo "el tercer parametro no es entero"
    exit $FAILURE 
fi

#VER TAMBIEN ACA: http://www.gorepair.pt/imgs/testemunhos/Donnazmi.txt/usr/local/nagios/libexec/check_ovz
