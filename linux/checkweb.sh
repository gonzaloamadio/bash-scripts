#!/bin/bash

# In web server, we check if some website is down, and reinit apache y/o sql

cd /tmp
wget -T 25 -t 3 http://www.rizobacter.com/argentina/ >/dev/null 2>&1

FLAG1=$?;

touch /var/log/checksitio.log
if [ $FLAG1 -gt 0 ] ; then
   echo -n "Apache not responding:" >>/var/log/checksitio.log
   echo -n "Apache not responding - Reinit"| mail -s "Apache not responding - Reinit" mail1@gmail.com mail2@hotmail.com
   date  >>/var/log/checksitio.log
/etc/init.d/apache2 stop
sleep 4
killall apache2
sleep 4
killall -9 apache2
/etc/init.d/apache2 start
fi

if nc -w1 -z localhost 3306 >/dev/null 2>/dev/null
then
 echo -n ""
else
 /etc/init.d/mysql restart
 echo -n "Mysql not responding:" >>/var/log/checksitio.log
 echo -n "Mysql not responding - Reinit"| mail -s "Mysql not responding - Reinit" alertas@itecnis.com
 date  >>/var/log/checksitio.log
fi

