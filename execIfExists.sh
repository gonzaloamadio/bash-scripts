#!/bin/bash

#http://www.cyberciti.biz/faq/unix-linux-test-existence-of-file-in-bash/

#Ejeuta archivo si existe, sino imprime mesaje de que no existe
#function runscr {
#    [ -f $1 ] && $1 || echo "File $1 does not exists"
#}

[ -f $1 ] &&  $@ || echo "File $1 does not exists"

