#!/bin/sh
#
# Script that analyse nginx access logs

LOG=nginx-access.log

######################################################
echo Top 5 IP addresses with the most requests:
awk '{print $1}' $LOG | sort | uniq -c | sort -nr | head -5 \
	| awk '{printf "%s - %d requests\n", $2, $1}'

######################################################
echo
echo Top 5 most requested paths:
grep -o '\w\s/.*\sHTTP' $LOG | awk '{print $2}' | sort | uniq -c | sort -nr | head -5 \
	| awk '{printf "%s - %d requests\n", $2, $1}'




