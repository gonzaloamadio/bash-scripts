#!/bin/bash

# http://www.cyberciti.biz/faq/unix-linux-test-existence-of-file-in-bash/

# PASS FULL PATH

# Execute file if exits, else print message that the file does not exists
#  function runscr {
#      [ -f $1 ] && $1 || echo "File $1 does not exists"
#  }

[ -f $1 ] &&  $@ || echo "File $1 does not exists"

# $ ./execIfExists.sh /path/to/script/test.sh 1 "2" 3
# ENTRE
#Parametro pasado 1: 1
#Parametro pasado 2: 2

#########

#cat test.sh

#!/bin/bash
#echo "ENTRE"
#echo "Parametro pasado 1: $1"
#echo "Parametro pasado 2: $2"
