#!/bin/sh

#copiamos archivo actual por si cambia durante la ejecucion
cp /path/to/file/log /path/to/file/log_new
new='/path/to/file/log_new'
old='/path/to/file/log'

# Count amount of line of new log (probably updated in last minutes)
# May have equal or more than old log
l1=$(wc -l $new | awk '{print $1}')
l2=$(wc -l $old | awk '{print $1}')

dif=$(($l1 - $l2))

# If they are different
if [ $dif -gt 0 ]; then

    # Do something, for example in this case, look for Oracle errors

	err_count=$(tail -n $dif $new | grep -c "ORA-")
	# If errors,  send mail and save in log
	if [ $err_count -gt 0 ]; then
		err=$(tail -n $dif $new | grep "ORA-")
		echo $err | mail -v -s "Revisar alert_UAACLDB.log 10.85.1.71" -S smtp=10.85.1.104 -S from="alertas@itecnis.com(oracle - uaa)"   alertas@itecnis.com	
		echo $err >> /path/to/log/log.txt
	fi
	# Make this last log, be the "old" or original, so in next iteration the process works ok
	cp $new $old
fi
