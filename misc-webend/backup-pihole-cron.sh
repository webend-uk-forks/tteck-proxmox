#!/usr/bin/env bash

PIHOLE_CTID=101
echo "$(date)"

containercount=$( pct list | grep "$PIHOLE_CTID" | wc -l )
if [ "$containercount" -lt "1" ]; then
  echo "LXC with ID $PIHOLE_CTID not located!!"
else
  echo "Config backup - START"
  lxc-attach -n "$PIHOLE_CTID" -- bash -c "cd /b_apps;pihole -a -t;find /b_apps -type f -mtime +7 -delete" 
  echo "Config backup - END"
fi
echo -e "Finished \n"
