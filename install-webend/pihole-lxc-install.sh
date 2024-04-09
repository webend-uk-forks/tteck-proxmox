#!/usr/bin/env bash
echo "Add custom hosts entries"
LXC_DNS_CONFIG=/etc/hosts
cat <<EOF >>$LXC_DNS_CONFIG
# --- BEGIN LOKAL ---
192.168.1.200 edge-office-intranet
192.168.64.1 edge-office-router
192.168.64.11 deco-office-mesh
192.168.64.12 deco-livingroom-mesh
192.168.64.13 deco-bedroom-mesh
192.168.64.21 tplink-office-main
192.168.64.22 netgear-office-desk
192.168.64.41 netgear-living-media
192.168.64.50 hp-office-printer
192.168.64.51 qnap-office-ts130
192.168.64.52 qnap-office-ts431p-01
192.168.64.53 qnap-office-ts431p-02
192.168.64.54 qnap-office-nas3-01
192.168.64.55 qnap-office-nas3-02
192.168.64.101 pve01
192.168.64.102 pve02
192.168.64.103 rpi01
192.168.64.104 rpi02
192.168.64.2 pve01-pihole01
192.168.64.3 pve02-pihole02
192.168.64.4 pve01-pialert
192.168.64.9 pve01-halab
192.168.64.10 pve01-ha
192.168.64.111 pve01-docker01
192.168.64.112 pve02-docker02
192.168.64.113 pve03-docker02
192.168.64.191 pve02-plex
192.168.64.192 pve02-tautulli
192.168.64.193 pve02-ombi
192.168.64.120 pve01-z2m
192.168.64.121 pve01-mqtt01
192.168.64.122 pve01-mqtt02
192.168.64.125 pve01-grafana
192.168.64.126 pve01-influx01
192.168.64.127 pve01-influx02
192.168.64.128 pve01-prometheus
192.168.64.129 pve01-mysql
192.168.64.130 pve01-postgres
192.168.65.11 tado-office-hub
192.168.65.12 fire-office-hub
192.168.65.13 philips-office-hub
192.168.65.14 tapo-office-hub
192.168.65.15 coral-office-hub
192.168.65.21 tapo-outdoor-cam1-C510W
192.168.65.24 tapo-indoor-cam1-living
192.168.65.51 govee-outdoor-back
192.168.65.53 govee-halwaydown-bulb1
192.168.65.54 govee-halwaydown-bulb2
192.168.65.55 govee-halwayup-bulb1
192.168.65.56 govee-halwayup-bulb2
192.168.65.57 govee-pantry-bulb
192.168.65.58 govee-storage-bulb
192.168.65.59 meross-plug1
192.168.65.60 meross-plug2
192.168.65.61 meross-plug3
192.168.65.62 meross-plug4
192.168.65.99 lg-tech-washingmachine
192.168.65.98 midea-kitchen-dishwasher
192.168.65.101 meross-livingroom-tv
192.168.65.102 meross-livingroom-shelf
192.168.65.103 govee-livingroom-floorlight
192.168.65.131 meross-bedroom-bedside
192.168.65.161 govee-craft-bulb
192.168.65.162 govee-craft-cloud
192.168.65.163 meross-craft-extension
192.168.65.201 govee-office-hexa
192.168.65.202 govee-office-wall
192.168.65.203 govee-office-floor
192.168.65.204 tuya-office-neon
192.168.66.11 amazon-kitchen-echo5
192.168.66.51 amazon-livingroom-echo
192.168.66.52 amazon-livingroom-firecube-wifi
192.168.66.53 amazon-livingroom-firecube-cable
192.168.66.54 xbox-livingroom-seriesx-wifi
192.168.66.55 xbox-livingroom-seriesx-cable
192.168.66.101 amazon-bedroom-echo
192.168.66.102 amazon-bedroom-firecube-wifi
192.168.66.103 amazon-bedroom-firecube-cable
192.168.66.152 samsung-craft-note10
192.168.66.153 samsung-craft-old
192.168.66.154 hp-craft-wifi
192.168.66.155 amazon-craft-kindle
192.168.66.199 ardonagh-laptop-wifi
192.168.66.201 amazon-office-echoR
192.168.66.202 amazon-office-echoL
192.168.66.203 xbox-office-seriess-wifi
192.168.66.204 xbox-office-seriess-cable
192.168.66.211 dell-office-5540-wifi
192.168.66.212 dell-office-5540-cable
192.168.66.213 apple-office-iphone
192.168.66.214 apple-office-ipad
192.168.66.215 sony-office-xperia
192.168.66.216 amazon-office-kindle
192.168.66.248 flutter-C02G3938MD6M-wifi
192.168.66.249 flutter-C02G3938MD6M-cable
# --- END LOKAL ---
EOF

echo "Flush Network Table"
pihole arpflush

echo "Restart DNS Resolver"
pihole restartdns

echo "Flush Logs"
pihole flush
