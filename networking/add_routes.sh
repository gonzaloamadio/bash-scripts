#!/bin/bash

set -e

SUCCESS=0
FAILURE=1

CONSOLE='3.3.3.3'
SENSOR2='3.34.3.0'
OPENCONNECT='3.3.1.1'


usage(){
  echo "Usage: `basename $0` -m [add|del]  -i <string_interface_name> [-h]"
  echo "       -m = Mandatory action to perform. It can be any of [add|del]"
  echo "       -i = Mandatory interface name, to route through"
  echo "       -h = Optional help mode."
  echo
  echo "Examples:"
  echo "    `basename $0` -m add -i gpd0"
  echo "    `basename $0` -m del -i gpd0"
}


if [ $# -lt 2 ]; then
  usage
  exit $FAILURE
fi


while getopts ":m:i:" opt; do
       case $opt in
         m)
             ACTION=${OPTARG}
             ((m == "add" || m == "del")) || usage
             ;;
         i)
             IFACE=${OPTARG}
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

shift $((OPTIND-1))

# Check if both arguments are passed
if [ -z "${ACTION}" ] || [ -z "${IFACE}" ]; then
    usage
    exit $FAILURE
fi
# Check values of action are accepted ones
if [  "${ACTION}" != "add"  ] && [ "${ACTION}" != "del" ]; then
    echo "action: ${ACTION}" >&2
    usage
    exit $FAILURE
fi



sudo ip route $ACTION $CONSOLE dev $IFACE
sudo ip route $ACTION $SENSOR2 dev $IFACE
sudo ip route $ACTION $OPENCONNECT dev $IFACE

# TODO: Check if they exists first? with a grep. Do it with a for loop.
# echo "3.34.3.0 sensor1" | sudo tee -a /etc/hosts
