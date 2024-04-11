#!/usr/bin/env bash
source <(curl -s https://raw.githubusercontent.com/tteck/Proxmox/main/misc/build.func)
source <(curl -s https://raw.githubusercontent.com/webend-uk-forks/tteck-proxmox/webend-homelab/misc-webend/build.func)

function header_info {
  clear
  cat <<"EOF"
    ______     _             __
   / ____/____(_)___ _____ _/ /____
  / /_  / ___/ / __ `/ __ `/ __/ _ \
 / __/ / /  / / /_/ / /_/ / /_/  __/
/_/   /_/  /_/\__, /\__,_/\__/\___/
             /____/

EOF
}
header_info
echo -e "Loading..."
APP="Frigate"
var_disk="20"
var_cpu="4"
var_ram="4096"
var_os="debian"
var_version="11"
variables_webend 141 "frigate"
variables
color
catch_errors

function default_settings() {
  CT_TYPE="0"
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
  if [[ ! -f /etc/systemd/system/frigate.service ]]; then msg_error "No ${APP} Installation Found!"; exit; fi
  msg_error "There is currently no update path available."
  exit  
}

start
build_container
description

post_install_webend

msg_info "Setting Container to Normal Resources"
pct set $CTID -memory 1024
msg_ok "Set Container to Normal Resources"
msg_ok "Completed Successfully!\n"
echo -e "${APP} should be reachable by going to the following URL.
         ${BL}http://${IP}:5000${CL} \n"
echo -e "go2rtc should be reachable by going to the following URL.
         ${BL}http://${IP}:1984${CL} \n"
