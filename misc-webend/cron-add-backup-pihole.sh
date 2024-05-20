#!/usr/bin/env bash

clear
cat <<"EOF"
   ______                 
  / ____/________  ____   
 / /   / ___/ __ \/ __ \  
/ /___/ /  / /_/ / / / /  
\____/_/   \____/_/ /_/   
                          
EOF

add() {
  while true; do
    read -p "This script will add a crontab schedule that is creating a backup of PiHole configuration every night at 1 AM. Proceed(y/n)?" yn
    case $yn in
    [Yy]*) break ;;
    [Nn]*) exit ;;
    *) echo "Please answer yes or no." ;;
    esac
  done
  sh -c '(crontab -l -u root 2>/dev/null; echo "0 1 * * * PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin /bin/bash -c \"\$(wget -qLO - https://github.com/webend-uk-forks/tteck-proxmox/raw/webend-homelab/misc-webend/cron-exec-pve-backup-pihole)\" >>/var/log/cron-exec-pve-backup-pihole.log 2>/dev/null") | crontab -u root -'
  clear
  echo -e "\n To view Cron Backup PiHole logs: cat /var/log/cron-exec-pve-backup-pihole.log"
}

remove() {
  (crontab -l | grep -v "github.com/webend-uk-forks/tteck-proxmox/raw/webend-homelab/misc-webend/cron-exec-pve-backup-pihole.sh") | crontab -
  rm -rf /var/log/cron-exec-pve-backup-pihole.log
  echo "Removed Crontab Schedule from Proxmox VE"
}

OPTIONS=(Add "Add Crontab Schedule"
  Remove "Remove Crontab Schedule")

CHOICE=$(whiptail --backtitle "Proxmox VE Helper Scripts" --title "Cron Backup PiHole" --menu "Select an option:" 10 58 2 \
  "${OPTIONS[@]}" 3>&1 1>&2 2>&3)

case $CHOICE in
"Add")
  add
  ;;
"Remove")
  remove
  ;;
*)
  echo "Exiting..."
  exit 0
  ;;
esac
