#!/bin/bash
#Run script by typing sh roulette_dealer_finder_by_time.sh 
#After .sh input the date: month followed by day. Example 0310
#After that Type time example: 01:00:00 AM
#Should look like this : sh roulette_dealer_finder_by_time.sh 0310 1:00:00 AM
#Dealer output should be Saima Mcdermott


cat $1_Dealer_schedule | grep "$2 $3" | awk '{print $1,$2,$5,$6}' 
