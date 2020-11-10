#!/bin/bash

usage() { echo "Usage: $0 [-s <45|90>] [-p <string>]" 1>&2; exit 1; }

while getopts ":s:p" opt; do
       case $opt in
         s)
             s=${OPTARG}
             ((s == 45 || s == 90)) || usage
             echo "param s: $s"
             ;;
         p)
             p=${OPTARG}
             echo "param p: $p"
             ;;
         \?)
             echo "Invalid option: -$OPTARG" >&2
             exit 1
             ;;
         :)
             echo "Option -$OPTARG requires an argument." >&2
             exit 1
             ;;
       esac
done

while getopts ":s:p:" o; do
    case "${o}" in
        s)
            s=${OPTARG}
          #  ((s == 45 || s == 90)) || usage
            ;;
        p)
            p=${OPTARG}
            ;;
        *) # Any other flag that is not -s or -p , print usage. If a parameter requres an argument, also in here.
        # i.e replace the case of ? and : , for *, if we do not need to print precise error and print usage.
            usage
            ;;
    esac
done
shift $((OPTIND-1))

#if [ -z "${s}" ] || [ -z "${p}" ]; then
#    usage
#fi

echo "s = ${s}"
echo "p = ${p}"


# $ ./myscript.sh
# Usage: ./myscript.sh [-s <45|90>] [-p <string>]

# $ ./myscript.sh -h
# Usage: ./myscript.sh [-s <45|90>] [-p <string>]

# $ ./myscript.sh -s "" -p ""
# Usage: ./myscript.sh [-s <45|90>] [-p <string>]

# $ ./myscript.sh -s 10 -p foo
# Usage: ./myscript.sh [-s <45|90>] [-p <string>]

# $ ./myscript.sh -s 45 -p foo
# s = 45
# p = foo

# $ ./myscript.sh -s 90 -p bar
# s = 90
# p = bar
