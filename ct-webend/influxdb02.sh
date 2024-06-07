#!/usr/bin/env bash
source <(curl -s https://raw.githubusercontent.com/tteck/Proxmox/main/misc/build.func)
source <(curl -s https://raw.githubusercontent.com/webend-uk-forks/tteck-proxmox/webend-homelab/misc-webend/build.func)

function header_info {
clear
cat <<"EOF"
    ____      ______           ____  ____ 
   /  _/___  / __/ /_  ___  __/ __ \/ __ )
   / // __ \/ /_/ / / / / |/_/ / / / __  |
 _/ // / / / __/ / /_/ />  </ /_/ / /_/ / 
/___/_/ /_/_/ /_/\__,_/_/|_/_____/_____/  
 
EOF
}
header_info
echo -e "Loading..."
APP="InfluxDB"
var_disk="8"
var_cpu="2"
var_ram="2048"
var_os="debian"
var_version="12"
variables_webend 163 "influxdb02"
variables
color
catch_errors

function default_settings() {
  CT_TYPE="1"
  PW=""
  CT_ID=$NEXTID
  HN=$NSAPP
  DISK_SIZE="$var_disk"
  CORE_COUNT="$var_cpu"
  RAM_SIZE="$var_ram"
  BRG="vmbr0"
  NET="dhcp"
  GATE=""
  APT_CACHER=""
  APT_CACHER_IP=""
  DISABLEIP6="no"
  MTU=""
  SD=""
  NS=""
  MAC=""
  VLAN=""
  SSH="no"
  VERB="no"
  echo_default
  default_settings_webend
}

function update_script() {
header_info
if [[ ! -f /etc/apt/sources.list.d/influxdata.list ]]; then msg_error "No ${APP} Installation Found!"; exit; fi
msg_info "Updating ${APP}"
apt-get update &>/dev/null
apt-get -y upgrade &>/dev/null
msg_ok "Updated Successfully"
exit
}

start
build_container
description

post_install_webend

msg_ok "Completed Successfully!\n"