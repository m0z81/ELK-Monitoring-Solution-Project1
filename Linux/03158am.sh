#!/bin/bash
#Run script by typing sh 03158am.sh
#This script will give the name of the rogue dealer at that table during that time 

cat 0315_Dealer_schedule | grep -i "08:00:00 AM" | awk '{print $1,$2,$5,$6}' >> Dealers_working_during_losses
