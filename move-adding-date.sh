#!/bin/bash

#http://www.unix.com/unix-for-dummies-questions-and-answers/225287-move-multiple-files-adding-date-timestamp-before-file-type.html

# This case will move pdf files
function movef {
    destdir="${2}"
    srcdir="${1}"
    if [ ! -d "$srcdir" ] || [ ! -d "$destdir" ]
    then    
            printf "Source (%s) and target(%s) directories must exist.\n" "$srcdir" "$destdir" >/tmp/err.move.log #>&2
            printf "Usage: %s source_directory target_directory\n" "${0##*/}" >&2
            exit 1
    fi
    
    cd "$srcdir"
    ts=$(date +%F_%R)
    for file in *.pdf
      do      mv "$file" "$destdir/${file%.*}_$ts.pdf"
    done
}

srcdir=/tmasdp/
destdir=/tmp/tmp/

movef $srcdir $destdir 
