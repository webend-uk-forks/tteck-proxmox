#!/usr/bin/env bash
LXC_CONFIG=/etc/pve/lxc/${CTID}.conf
cat <<EOF >>$LXC_CONFIG
mp0: /b_apps/pve02-frigate,mp=/b_apps
mp1: /mnt/nas03-nfs-frigate,mp=/d_frigate
EOF
