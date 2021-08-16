#!/bin/bash
#Run script by typing sh 03105am.sh
#This script will give the name of the rogue dealer at that table during that time 

cat 0310_Dealer_schedule | grep -i "05:00:00 AM" | awk '{print $1,$2,$5,$6}' >> Dealers_working_during_losses
