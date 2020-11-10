#!/bin/bash
 

# When you want getopts to expect an argument for an option, just place a : (colon) after the proper option flag. 
# If you want -A to expect an argument (i.e. to become -A SOMETHING) just do:
# getopts fA:x VARNAME

#If the very first character of the option-string is a : (colon), which would normally be nonsense because there's no option letter preceding it, 
#getopts switches to "silent error reporting mode". 
#In productive scripts, this is usually what you want because it allows you to handle errors yourself without being disturbed by annoying messages. 

#Si no le ponemos los 1eros :, y ejecutamos -a sin argumento nos imprime ademas de nuestro error:
# ./params1.sh: la opción requiere un argumento -- s
while getopts ":a:" opt; do
  case $opt in
    a)
      echo "-a was triggered, Parameter: $OPTARG" >&2
      exit 0
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

