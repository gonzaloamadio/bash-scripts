#!/bin/bash

foo()
{
echo "hola"
echo $1
echo "---"
echo $output
}

logG() { while read data; do echo "G:$data";                    done; }

echo "hi" | logG
#foo
#foo "alo"

#http://www.linuxjournal.com/content/return-values-bash-functions
#http://stackoverflow.com/questions/16338086/bash-return-value-from-subscript-to-parent-script

