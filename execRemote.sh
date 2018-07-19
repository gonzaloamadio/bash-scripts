#!/bin/bash

#If Machine A is a Windows box, you can use Plink (part of PuTTY) with the -m parameter, and it will execute the local script on the remote server.
#plink root@MachineB -m local_script.sh

#If Machine A is a Unix-based system, you can use:
#ssh root@MachineB 'bash -s' < local_script.sh

#You shouldn't have to copy the script to the remote server to run it.


###########Habiendo hecho rsa autentication
#ssh systemsboy@rhost.systemsboy.edu 'ls -l; ps -aux; whoami'

#WITH USER INTERACTION
#ssh -t systemsboy@rhost.systemsboy.edu 'top'

#Note the -t flag. That tells ssh that you'll be interacting with remote shell. Without the -t flag top will return results after which ssh will log you out of the remote host immediately. With the -t flag, ssh keeps you logged in until you exit the interactive command. The -t flag can be used with most interactive commands, including text editors like pico and vi.


#$ cat remote-box-commands.bash | ssh user@nas02nixcrafthomeserver

#ssh -t vivek@server1.cyberciti.biz << EOF
# sync
# sync
# sudo /sbin/shutdown -h 0
#EOF
