#!/bin/bash

# http://stackoverflow.com/questions/2853803/in-a-shell-script-echo-shell-commands-as-they-are-executed
# http://unix.stackexchange.com/questions/106776/how-can-i-print-only-certain-commands-from-a-bash-script-as-they-are-run

#echo "-----------set -x y ejecuto ls"
#set -x #echo on
#ls /tmp

#echo; echo "-----------set +x y ls"
#set +x #echo on
#ls /tmp

#echo; echo "-----------set -vx y ls"
#set -vx #echo on
#ls /tmp

#function to display commands
exe() { echo "\$ $@" ; "$@" ; }
exe echo "hello world"

echo "-------------------------------"
VAR='echo "helloo"'
echo $VAR
$VAR

echo "-------------------------------"
echo "getting URL..."
( set -x ; curl -s --fail "URL" -o /tmp/tempcurl )

if [ $? -eq 0 ] ; then
    echo "curl failed"
    exit 1
fi

echo "------------------------------- runthis"
#When I write more complex bash scripts, I use a little function to run commands that will also print the commands run into a logfile:
# http://unix.stackexchange.com/questions/106776/how-can-i-print-only-certain-commands-from-a-bash-script-as-they-are-run

runthis(){
    ## print the command to the logfile
#    echo "$@" >> $LOG
    echo "$@" 
    ## run the command and redirect it's error output
    ## to the logfile
#    eval "$@" 2>> $LOG 
    eval "$@"
}

#Then, in my script, I run commands like this:
#runthis "cp /foo/bar /baz/"
runthis "ls /tmp"
#If you don't want a command printed, just run it normally.
#You can either set the $LOG to a filename or just remove it and print to stdout or stderr.

echo "------------------------------- exe printf"
#SCRIPT_LOG="\home\buddy\logfile.txt"
exe () {
  params="$@"                       # Put all of the command-line into "params"
#  printf "%s\t$params" "$(date)" >> "$SCRIPT_LOG"   # Print the command to the log file
  printf "%s\t$params" "$(date)" 
  $params                           # Execute the command
}

exe ls /tmp
