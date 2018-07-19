#!/bin/bash

#USAR VARIABLE EN AWK
LINE="one two three four"
VAR=2
VALUE=$(echo $LINE | awk -v my_var=$VAR '{print $my_var}')

echo $VALUE