#!/usr/bin/env bash
source <(curl -s https://raw.githubusercontent.com/tteck/Proxmox/main/misc/build.func)
source <(curl -s https://raw.githubusercontent.com/webend-uk-forks/tteck-proxmox/webend-homelab/misc-webend/build.func)

function header_info {
clear
cat <<"EOF"
   ____            __    _ 
  / __ \____ ___  / /_  (_)
 / / / / __ `__ \/ __ \/ /
/ /_/ / / / / / / /_/ / /
\____/_/ /_/ /_/_.___/_/

EOF
}
header_info
echo -e "Loading..."
APP="Ombi"
var_disk="4"
var_cpu="1"
var_ram="1024"
var_os="debian"
var_version="12"
variables_webend 193 "ombi"
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
if [[ ! -d /opt/ombi ]]; then msg_error "No ${APP} Installation Found!"; exit; fi
msg_error "There is currently no update path available."
exit
}

start
build_container
description

post_install_webend

msg_ok "Completed Successfully!\n"
echo -e "${APP} should be reachable by going to the following URL.
         ${BL}http://${IP}:5000${CL} \n"