#!/bin/bash


#Esta si var es "", te da como SET
if [ -z ${var+x} ]; then echo "var is unset"; else echo "var is set to '$var'"; fi

#where ${var+x} is a parameter expansion which evaluates to the null if var is unset and substitutes the string "x" otherwise,
#and then where the quotes can be omitted (so here say we can say ${var+x} instead of "${var+x}") because this syntax & usage guarantees this will only expand to something not needing quotes (as since it either expands to x (which contains no word breaks so it needs no quotes) or to nothing (which results in [ -z ] which handily also evaluates to the same value (true) as [ -z "" ] does)), however as the fact the quotes can be safely omitted here is not immediately obvious to all (indeed it wasn't to the first author of this quotes explanation who is also a major Bash coder), it would sometimes be better to write the solution with quotes, as [ -z "${var+x}" ] at the possible cost of very small O(1) speed penalty, or/and (what the first author did:) next to the code using this solution put a comment giving the URL to this answer which now also includes the explanation for why the quotes can be safely omitted.

if [ -z "$var" ]; then echo "var is unset"; else echo "var is set to '$var'"; fi
#This is because it doesn't distinguish between a variable that is unset and a variable that is set to the empty string. 
