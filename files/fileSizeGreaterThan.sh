#!/bin/bash


You can do this using the find command and the [[ builtin,
wrapped in a one-liner like this:

[[ $(find /path/to/file -type f -size +51200c 2>/dev/null) ]] && echo true || echo false

The find takes care of two things at once: checks if file exists and size is greater than 51200 bytes.
We redirect stderr to /dev/null to hide the error message when the file doesn't exist.
The output of find will be non-blank if the file matched both conditions, otherwise it will be blank.
The [[ ... ]] evaluates to true or false if the output of find is non-blank or blank, respectively.


You can use this in if conditions, for example:

if [[ $(find /path/to/file -type f -size +51200c 2>/dev/null) ]]; then
        somecmd
fi


----------------- OTROS

find /path/to/file -type f -size +100M   // si pesa mas de 100 te lo devuelve y sino, vacio

find -maxdepth 1 -name "file.txt" -size -90k
This will output file.txt to stdout if and only if the size of file.txt is less than 90k. To execute a script script if file.txt has a size less than 90k:
find -maxdepth 1 -name "file.txt" -size -90k -exec script \;




To get a file's size, you can use wc -c to get the size (file length) in bytes:

file=file.txt
minimumsize=90000
actualsize=$(wc -c <"$file")
if [ $actualsize -ge $minimumsize ]; then
    echo size is over $minimumsize bytes
else
    echo size is under $minimumsize bytes
fi
In this case, it sounds like that's what you want.

But FYI, if you want to know how much disk space the file is using, you could use du -k to get the size (disk space used) in kilobytes:

file=file.txt
minimumsize=90
actualsize=$(du -k "$file" | cut -f 1)
if [ $actualsize -ge $minimumsize ]; then
    echo size is over $minimumsize kilobytes
else
    echo size is under $minimumsize kilobytes
fi
If you need more control over the output format, you can also look at stat. On Linux, you'd start with something like stat -c '%s' file.txt, and on BSD/Mac OS X, something like stat -f '%z' file.txt.
