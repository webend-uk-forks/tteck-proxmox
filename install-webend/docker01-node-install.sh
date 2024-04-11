#!/usr/bin/env bash
LXC_CONFIG=/etc/pve/lxc/${CTID}.conf
cat <<EOF >>$LXC_CONFIG
mp0: /b_apps/pve01-docker,mp=/b_apps
mp1: /var/log,mp=/h_logs,ro=1
EOF
