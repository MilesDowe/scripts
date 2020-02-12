#!/bin/bash

#************************************************#
# Name  : countdown.sh
# Author: Miles Dowe
# Date  : Feb. 3, 2020
#
# Description:
#   A simple script to parse a CSV of event and 
#   time and report time until then.
#************************************************#

COUNTDOWNS=/mnt/c/Users/Miles/.apps/countdowns

while read -r line; do
    title=$(echo "${line}" | cut -f 1 -d ',')
    datetime=$(echo "${line}" | cut -f 2 -d ',')

    time_til=$(($(date -d "${datetime}" +%s) - $(date +%s)))

    echo "  $((${time_til} / 60 / 60 / 24)) days left until ${title}"

done <${COUNTDOWNS}
