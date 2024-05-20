#!/usr/bin/env bash

# prepare destinations
mkdir -p /b_apps/pve3-docker
chmod -R a+w /b_apps/

LXC_CONFIG=/etc/pve/lxc/${CTID}.conf
cat <<EOF >>$LXC_CONFIG
mp0: /b_apps/pve3-docker,mp=/b_apps
mp1: /var/log,mp=/h_logs,ro=1
EOF
