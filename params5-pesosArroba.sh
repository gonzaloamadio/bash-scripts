#!/bin/bash

# ANOTHER WAY OF USING SCRIPT PARAMETERS.

#http://stackoverflow.com/questions/12314451/accessing-bash-command-line-args-vs

set -- "arg  1" "arg  2" "arg  3"

for word in $*; do echo "$word"; done
#arg
#1
#arg
#2
#arg
#3

for word in $@; do echo "$word"; done
#arg
#1
#arg
#2
#arg
#3

for word in "$*"; do echo "$word"; done
#arg  1 arg  2 arg  3

for word in "$@"; do echo "$word"; done
#arg  1
#arg  2
#arg  3

#one further example on the importance of quoting: note there are 2 spaces between "arg" and the number, but if I fail to quote $word:

for word in "$@"; do echo $word; done
#arg 1
#arg 2
#arg 3

#and in bash, "$@" is the "default" list to iterate over:

for word; do echo "$word"; done
#arg  1
#arg  2
#arg  3
