#!/usr/bin/env bash
LXC_CONFIG=/etc/pve/lxc/${CTID}.conf
cat <<EOF >>$LXC_CONFIG
mp0: /b_apps/pve02-plex,mp=/b_apps
mp1: /mnt/nas02-nfs-media,mp=/m_nas02,ro=1
mp2: /mnt/nas03-nfs-media,mp=/m_nas03,ro=1
EOF
