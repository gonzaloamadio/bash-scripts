#!/bin/bash

input=mapfiles.txt

while read file key log lat
do
  echo $key $log $lat $file
done < "$input"

echo "---------------------------"
while read line; do echo $cmd $line; done < "$input"
echo "---------------------------"
while read line; do echo $cmd ; done < "$input"

#echo "---------------------------"
#while read line; 
#do
#    echo $line;
#    PRI=$(echo $line | awk '{print $1}')
#    echo "PRIMER COMPONENTE: $PRI" 
#
#done < "$input"

echo "---------------------------FOR 1"
for word in $(cat mapfiles.txt); do echo $word; done

echo "---------------------------FOR 2"
#http://stackoverflow.com/questions/1521462/looping-through-the-content-of-a-file-in-bash
# With IFS, we tell that only a new line is a separator.. if not will be space as well, and will print word by word instead line by line
IFS="
"
for word in $(cat mapfiles.txt); do echo $word; done
