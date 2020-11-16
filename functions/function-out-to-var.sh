#!/bin/bash

# Por ejemplo ejecutamos ese .sh q esta en la misma carpeta.
# Obvio q es mejor pasar el full path
VER=$(./get-oracle-home.sh)

echo "$VER"
exit


#http://www.linuxjournal.com/content/return-values-bash-functions
#http://stackoverflow.com/questions/16338086/bash-return-value-from-subscript-to-parent-script

