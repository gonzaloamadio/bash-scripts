#!/bin/bash

#We have a file with lines like this:
# Something other other2 etc

# We want to keep just with some of the words
##Sed
#sed 's/\s.*$//'
##Grep
#grep -o '^\S*'
##Awk
#awk '{print $1}'


#USAGE:
#./cutEverythingAfterFirstSpace.sh wasap-ips.txt
cat $1 | awk '{print $1}' > /tmp/ips.txt
cat /tmp/ips.txt
