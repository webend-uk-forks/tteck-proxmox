#!/usr/bin/env bash
LXC_CONFIG=/etc/pve/lxc/${CTID}.conf
cat <<EOF >>$LXC_CONFIG
mp0: /b_apps/pve02-audiobookshelf,mp=/b_apps
mp1: /mnt/nas02-nfs-books,mp=/mb_nas02,ro=1
EOF