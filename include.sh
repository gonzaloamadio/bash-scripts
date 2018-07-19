#!/bin/bash

# This file is included in include2.sh
# Also, we will include another , see if it works whats included here in include2.sh

VAR="VAR GLOBAL"

runinclude(){
    echo "Normal included" 
}

. include-nested.sh
