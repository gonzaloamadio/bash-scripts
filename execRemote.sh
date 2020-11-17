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

# ref: https://zaiste.net/posts/few-ways-to-execute-commands-remotely-ssh/

# S permission: https://www.toolbox.com/tech/programming/question/ssh-running-script-on-remote-machine-with-root-privileges-032612/


##### RUN SCRIPT THAT NEEDS ROOT
# In machine that needs to be run

# Give the user "username" permission to execute that script and route command as sudo.
# If inside the script you executo only route command as sudo, only second line would be necessary
cat /etc/sudoers
replace_this_with_user_username ALL=(root)NOPASSWD:/home/username/route.sh
replace_this_with_user_username ALL=(root)NOPASSWD:/sbin/route

cat /home/username/routes.sh
sudo ip route add 192.168.0.0/16 via 172.31.82.131
sudo ip route add 172.31.239.0/29 via 172.31.82.131

Then if you have ssh key in place. Just use one of the above methors:

    ssh usr@remote_host 'bash /home/user/route.sh' # this one should work
    ssh usr@remote_host 'sudo nohup bash -c "/home/user/route.sh > /dev/null 2>&1 &"'

##### PASANDO PASSWORD
#!/bin/bash

sshpass -p angrys370 ssh superuser@10.85.1.60 << EOF
svctask startrcconsistgrp -force 0
svctask startrcconsistgrp -force 1
svctask startrcconsistgrp -force 2
exit
EOF


