#!/usr/bin/env bash
LXC_CONFIG=/etc/pve/lxc/${CTID}.conf
cat <<EOF >>$LXC_CONFIG
mp0: /b_apps/pve01-pialert,mp=/b_apps
EOF