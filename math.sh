#!/bin/bash

z=5
z=$((z+3))
z=$((z+3))
z=$((z*100))
echo $z
p=$((33145736/1024/1024))
echo $p

asd=$((1434748 / 1000))
echo $asd

echo "--------"
a="3"
b="4"
res=$((a+b))
echo $res

echo "----"
x="foo bar"
echo "${x%?}"

#COMPARE FLOATING POINTS
echo "........ compare floatin points"
num1="2.5"
num2=1
num3=4
if (( $(echo "$num1 > $num2" |bc -l) )); then
        echo "mas grande"
else
    echo "mas chico"
fi


if (( $(echo "$num1 > $num2" |bc -l) && $(echo "$num1 < $num3" |bc -l) )); then
    echo "esta en el medio"
else
    echo "no esta en el medio"
fi

echo "----------------------------"
#Vemos si un numero es entero
var=5
res=`[[ $var =~ ^-?[0-9]+$ ]] && echo true`
echo $res

if [ $res ] 
then
    echo "es entero"
else
    echo "no"
fi

echo "----------------------------"
item=30
total=100
total=90
percent=$(awk "BEGIN { pc=100*${item}/${total}; i=int(pc); print (pc-i<0.5)?i:i+1 }")
#percent=$(( 100 * item / total + (1000 * item / total % 10 >= 5 ? 1 : 0) ))

echo "porcentaja $item de $total : $percent"

echo "suma gigas"
num="1.2G"
num2=$(echo "$num" | sed 's:\(.*\).$:\1:' | sed 's:\,:\.:' ) #Sacamos la G del final, reemplazamos , por .
res=$(echo "$num2 + 1.3" | bc)
res2=$(echo "$num2 + 1.3" | bc  | sed 's/\./\,/')
echo $res
echo $res2
#2.5
