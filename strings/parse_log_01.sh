#!/bin/bash

# This script pareses a REVERSED output from datadog logs of the adhoc job:
# bin/adhoc_jobs/jobs/payments/aft/reconcile_aft_txns_bt_incident_multiple_dates.py
# You can download the logs from datadog as a CSV file and then reverse it with bash tac command
# $ tac dd_logs.csv > dd_logs_reversed.csv
#
# Then execute $ bash $0 dd_logs_reversed.csv, for a report of the transactions


# Check if the required number of arguments are provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

input_file="$1"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file not found: $input_file"
    exit 1
fi


while read line;
do
   if [[ $line == *"Reconcile txn with paypal request id "* ]]
   then
       # Get world after request id 
       val1=`echo $line | grep -Po '(?<=request id\s)\w+'`
   fi
   if [[ $line == *"'currency_code': 'USD', 'value':"* ]]
   then
     # grep: Extracts the portion of the line starting from '"value": "' until the next }
     # Splits the result using space as the delimiter and prints the 2nd field, which is the extracted number.
     val2=`echo $line | grep -Po "'value': '[^}]*" | awk -F ' ' '{print $2}'`
   fi
   if [[ $line == *"[reconcile_transactions] Reversal Result: PaymentNetworksGatewayResult: Success: True"* ]]
   then
       echo $val1,$val2,OK,APPROVED
       #echo OK
       #echo APPROVED
   fi
   if [[ $line == *"[reconcile_transactions] Reversal Result: PaymentNetworksGatewayResult: Success: False, Response code:"* ]]
   then
       #echo FAILED
       val3=`echo $line | grep -Po '(?<=Response code:\s)\w+'`
       echo $val1,$val2,FAILED,$val3
   fi
done < "$input_file"
