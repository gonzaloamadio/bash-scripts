#!/bin/bash

OLD2=`cat arclog.log | cut -d/ -f7 | cut -d_ -f4 | sort -n | tail -1`
NEW=2


if [ $OLD2 -ge $NEW ]; then
	echo "ENTRE"
fi
