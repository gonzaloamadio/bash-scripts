#!/bin/bash

#!/bin/bash
numchoice=1
while [ $numchoice != 0 ]; do
 echo -n "
 1. healthchk
 2. bpipwd
 3. cust_usage_check
 4. other scripts automatic
 0. Exit

 enter choice [1 | 2 | 3 | 4 ]: "
 read numchoice
 case $numchoice in
        "1" ) echo "menu uno";;
        "2" ) echo "menu dos";;
        "3" ) echo "menu tres";;
        "4" ) echo "menu cuatro";;
        "0" ) break ;;
        * ) echo -n "You entered an incorrect option. Please try again." ;;
 esac
done