#!/bin/bash

sshpass -p angrys370 ssh superuser@10.85.1.60 << EOF
svctask startrcconsistgrp -force 0
svctask startrcconsistgrp -force 1
svctask startrcconsistgrp -force 2
exit
EOF
