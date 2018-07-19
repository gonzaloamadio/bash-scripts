#!/bin/bash

echo "see comments inside script for recursive search and more"

# Basically command is like this, we can see examples below
## grep -r -i --include \*.cfg turnos /OVS/Repositories/


#[root@ovspri ~]# ls /OVS/Repositories/
#0004fb000003000048e2d615f24d6d79  0004fb0000030000c27b593c5acb9ba4  0004fb0000030000f5e8b4cca1944618
#0004fb000003000075f5d96ce0a3c619  0004fb0000030000d760d527bf7a4506
#[root@ovspri ~]# grep turnos /OVS/Repositories/*.cfg
#grep: /OVS/Repositories/*.cfg: No such file or directory
#[root@ovspri ~]# grep -r -i --include \*.cfg turnos /OVS/Repositories/
#/OVS/Repositories/0004fb0000030000c27b593c5acb9ba4/VirtualMachines/0004fb00000600003114ee2da8afa5b7/vm.cfg:OVM_simple_name = 'Turnos.Online'

palabras="uno@|dos|tres"
palabras2="tres|cuatro"
echo 'Search not taking into account words: "$palabras"'
grep -vE "$palabras" palabras.txt | grep -vE "$palabras2"
