#!/bin/bash


find /o2/flash_recovery_area/UAACLDB/archivelog/ -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" "
