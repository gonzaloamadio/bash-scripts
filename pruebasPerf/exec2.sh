#!/bin/bash

export PATH=$PATH:/bin:/usr/local/bin

which ls
while read -r line; do command "$line"; done <pruebas
