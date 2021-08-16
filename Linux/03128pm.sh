#!/bin/bash
#Run script by typing sh 03128pm.sh
#This script will give the name of the rogue dealer at that table during that time 

cat 0312_Dealer_schedule | grep -i "08:00:00 PM" | awk '{print $1,$2,$5,$6}' >> Dealers_working_during_losses
