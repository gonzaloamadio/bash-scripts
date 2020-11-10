#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# add_config_per_user_to_ocserc_for_user.sh - Create ocserv config per user configuration file

# Copyright 2020,  <gamadio@onalap1242>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License at <http://www.gnu.org/licenses/> for
# more details.

# Usage: add_config_per_user_to_ocserc_for_user.sh [-h|--help]
#        add_config_per_user_to_ocserc_for_user.sh [-p|--ipv4network] [-r|--routes] [-i|--iroutes]

# Revision history:
# 2020-11-09 Created
# ---------------------------------------------------------------------------

PROGNAME=${0##*/}
VERSION="0.1"


error_exit() {

  local error_message="$1"
  printf "%s: %s\n" "${PROGNAME}" "${error_message:-"Unknown Error"}" >&2
  exit 1
}

graceful_exit() {
  exit
}

signal_exit() { # Handle trapped signals
  local signal="$1"
  case "$signal" in
    INT)
      error_exit "Program interrupted by user" ;;
    TERM)
      error_exit "Program terminated" ;;
    *)
      error_exit "Terminating on unknown signal" ;;
  esac
}


usage() {
  printf "%s\n" "Usage: ${PROGNAME} [-h|--help]"
  printf "%s\n" "       ${PROGNAME} [-p|--ipv4network] [-r|--routes] [-i|--iroutes]"
}

help_message() {
  cat <<- _EOF_
$PROGNAME ver. $VERSION
Create ocserv config per user configuration file

$(usage)

  Options:
  -h, --help                  Display this help message and exit.
  -p, --ipv4network           Pool of IPs that server deliver. For example: 172.31.239.0/30
  -r, --routes                Routes injected to user. Ej: 172.31.94.55/32,172.31.89.78/32
  -i, --iroutes               Routes routed through this vpn server. Ej: 192.168.0.0/16,10.0.0.0/8

  NOTE: You must be the superuser to run this script.

_EOF_
  return
}

# Trap signals
trap "signal_exit TERM" TERM HUP
trap "signal_exit INT"  INT

# Check for root UID, commands executed needs root permission
if [[ $(id -u) != 0 ]]; then
  error_exit "You must be the superuser to run this script."
fi

# Check if script is called with args
if [  $# -eq 0 ]
then
    usage >&2
    error_exit "Called without arguments"
fi


# Parse command-line
while [[ -n "$1" ]]; do
  case "$1" in
    -h | --help)
      help_message
      graceful_exit
      ;;
    -p | --ipv4network)
      POOL=$1
      ;;
    -r | --routes)
      ROUTES=$1
      ;;
    -i | --iroutes)
      IROUTES=$1
      ;;
    -* | --*)
      usage >&2
      error_exit "Unknown option $1"
      ;;
  esac
  shift
done

# Main logic
# Use comma as separator and apply as pattern
for val in ${stringList//,/ }
do
   echo $val
done

graceful_exit

