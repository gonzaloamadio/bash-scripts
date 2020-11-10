#!/bin/bash


title() {
  echo;echo;echo
  echo "----------------------------------"
  echo "${1}"
  echo "----------------------------------"
}


#################################################################
# A string value with spaces is used within for loop. By default, string value is separated by space. For loop will split the string into words and print each word by adding a newline.

cat <<- _EOF_
$(title "Iterating a string of multiple words within for loop")
for value in I like programming
do
    echo \$value
done

"--Output---"
_EOF_

for value in I like programming
do
    echo $value
done


#################################################################
# This example will also work like the previous example and divide the value of the variable into words based on the space.

cat <<- _EOF_
$(title "Iterating a string variable within for loop")
# Define a string variable with a value
StringVal="Welcome to linuxhint"

# Iterate the string variable using for loop
for val in \$StringVal; do
    echo \$val
done

"--Output---"
_EOF_

StringVal="Welcome to linuxhint"
for val in $StringVal; do
    echo $val
done


#################################################################
# An array of string values is declared with type in this script. need to enclose the array variable with double quotation within for loop.
# If not enclosed, words inside each array value will be splitted to.
cat <<- _EOF_
$(title "Print multiple words string value as a single value")
# Declare a string array with type
declare -a StringArray=("Windows XP" "Windows 10" "Windows ME" "Windows 8.1"
"Windows Server 2016" )

# Read the array values with space
for val in "\${StringArray[@]}"; do
  echo \$val
done

"--Output---"
_EOF_

declare -a StringArray=("Windows XP" "Windows 10" "Windows ME" "Windows 8.1" "Windows Server 2016" )
for val in "${StringArray[@]}"; do
  echo $val
done

#################################################################
# Here, ‘*’ symbol is used to read all string values of the array. The first for loop is used to display array 
# values in multiple lines and the second for loop is used to display array values in a single line.
cat <<- _EOF_
$(title "Iterating string values of an array using ‘*’")
#Declare a string array
LanguageArray=("PHP"  "Java"  "C#"  "C++"  "VB.Net"  "Python"  "Perl")

# Print array values in  lines
echo "Print every element in new line"
for val1 in \${LanguageArray[*]}; do
     echo \$val1
done

echo ""

# Print array values in one line
echo "Print all elements in a single line"
for val2 in "\${LanguageArray[*]}"; do
    echo \$val2
done
echo ""

"--Output---"
_EOF_

LanguageArray=("PHP"  "Java"  "C#"  "C++"  "VB.Net"  "Python"  "Perl")
echo "Print every element in new line"
for val1 in ${LanguageArray[*]}; do
     echo $val1
done
echo ""
echo "Print all elements in a single line"
for val2 in "${LanguageArray[*]}"; do
    echo $val2
done
echo ""


#################################################################
# comma (,) is used to split the string values.  IFS variable is used to set the field separator.

cat <<- _EOF_
$(title "Iterating comma separated string values")
#!/bin/bash
DataList=" HTML5, CCS3, BootStrap, JQuery "
Field_Separator=\$IFS
 
# set comma as internal field separator for the string list
IFS=,
for val in \$DataList;
do
echo \$val
done
 
IFS=\$Field_Separator

"--Output---"
_EOF_

DataList=" HTML5   ,    CCS3, BootStrap, JQuery "
Field_Separator=$IFS
IFS=,
for val in $DataList;
do
echo $val
done
IFS=$Field_Separator



#################################################################
# Here, ‘/, /’ pattern is used to split the string values based on comma.

cat <<- _EOF_
$(title "Using pattern to read the list of strings")

# Define a list of string variable
stringList=WordPress,Joomla,Magento

# Use comma as separator and apply as pattern
for val in \${stringList//,/ }
do
   echo \$val
done

"--Output---"
_EOF_

stringList="WordPress,Joomla,   Magento"
for val in ${stringList//,/ }
do
   echo $val
done



#################################################################
#  In this example, two string arrays are defined and combined into another array. The outer for loop is used 
# to read the combined array and the inner for loop is used to read each inner array.

cat <<- _EOF_
$(title "Reading multiple string arrays together")
str_array1=("Magento 2.2.4" "WooCommerce")
str_array2=("CodeIgnitor" "Laravel")
combine=(str_array1 str_array2)
for arrItem in \${combine[@]}
do
   eval 'for val in "\${'\$arrItem'[@]}";do echo "\$val";done'
done

"--Output---"
_EOF_

str_array1=("Magento 2.2.4" "WooCommerce")
str_array2=("CodeIgnitor" "Laravel")
combine=(str_array1 str_array2)
for arrItem in ${combine[@]}
do
   eval 'for val in "${'$arrItem'[@]}";do echo "$val";done'
done

