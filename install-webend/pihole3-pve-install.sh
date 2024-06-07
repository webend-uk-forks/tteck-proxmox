#!/usr/bin/env bash
# prepare destinations
mkdir -p /b_apps/pve3-pihole
chmod -R a+w /b_apps/

# add configuration - mapped folders
LXC_CONFIG=/etc/pve/lxc/${CTID}.conf
cat <<EOF >>$LXC_CONFIG
mp0: /b_apps/pve3-pihole,mp=/b_apps
EOF