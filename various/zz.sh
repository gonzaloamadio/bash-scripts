#!/bin/bash

# REF: https://gist.github.com/JamieMason/4761049

# Functions ==============================================

# return 1 if global command line program installed, else 0
# example
# echo "node: $(program_is_installed node)"
function program_is_installed2 {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=0; }
  # return value
  echo "$return_"
}

# equivalent
program_is_installed(){
	type $1 >/dev/null 2>&1 && echo "1" || echo "0"
}

function program_doesnt_exist {
  local return_=1
  type $1 >/dev/null 2>&1 || { local return_=0; }
  # return $return_ instead of printing
  return $return_
}


if [ $(program_is_installed not_existent_program) -eq "0" ]; then
    echo "see commands to install node 1"
fi


 exit

if program_is_installed2 nodew; then
    echo "see commands to install node 2"
fi

echo "progr"
echo "$(program_doesnt_exist node)"
if program_doesnt_exist nodeee; then
    echo "see commands to install node 3"
fi

