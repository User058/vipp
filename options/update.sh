#!/bin/bash
#wget https://github.com/${GitUser}/
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'
GitUser="User058"

echo ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                 PROSES UPDATE                   │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e "\e[0;32mNew Version Downloading started!\e[0m"
cd /usr/bin
wget -q -O /usr/bin/add-ws "https://raw.githubusercontent.com/User058/vipp/main/menu/add-ws.sh" && chmod +x /usr/bin/add-ws
wget -q -O /usr/bin/add-ssws "https://raw.githubusercontent.com/User058/vipp/main/menu/add-ssws.sh" && chmod +x /usr/bin/add-ssws
wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/User058/vipp/main/menu/add-vless.sh" && chmod +x /usr/bin/add-vless
wget -q -O /usr/bin/add-tr "https://raw.githubusercontent.com/User058/vipp/main/menu/add-tr.sh" && chmod +x /usr/bin/add-tr
wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/User058/vipp/main/menu/usernew.sh" && chmod +x /usr/bin/usernew
wget -q -O /usr/bin/autoreboot "https://raw.githubusercontent.com/User058/vipp/main/options/autoreboot.sh" && chmod +x /usr/bin/autoreboot
wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/User058/vipp/main/options/restart.sh" && chmod +x /usr/bin/restart
wget -q -O /usr/bin/tendang "https://raw.githubusercontent.com/User058/vipp/main/options/tendang.sh" && chmod +x /usr/bin/tendang
wget -q -O /usr/bin/clearlog "https://raw.githubusercontent.com/User058/vipp/main/options/clearlog.sh" && chmod +x /usr/bin/clearlog
wget -q -O /usr/bin/running "https://raw.githubusercontent.com/User058/vipp/main/options/running.sh" && chmod +x /usr/bin/running
wget -q -O /usr/bin/port-websocket "https://raw.githubusercontent.com/User058/vipp/main/menu/port-websocket.sh" && chmod +x /usr/bin/port-websocket
wget -q -O /usr/bin/cek-bandwidth "https://raw.githubusercontent.com/User058/vipp/main/options/cek-bandwidth.sh" && chmod +x /usr/bin/cek-bandwidth
wget -q -O /usr/bin/limitspeed "https://raw.githubusercontent.com/User058/vipp/main/options/limitspeed.sh" && chmod +x /usr/bin/limitspeed
wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/User058/vipp/main/menu/menu-vless.sh" && chmod +x /usr/bin/menu-vless
wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/User058/vipp/main/menu/menu-vmess.sh" && chmod +x /usr/bin/menu-vmess
wget -q -O /usr/bin/menu-ss "https://raw.githubusercontent.com/User058/vipp/main/menu/menu-ss.sh" && chmod +x /usr/bin/menu-ss
wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/User058/vipp/main/menu/menu-trojan.sh" && chmod +x /usr/bin/menu-trojan
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/User058/vipp/main/menu/menu-ssh.sh" && chmod +x /usr/bin/menu-ssh
wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/User058/vipp/main/menu/menu-backup.sh" && chmod +x /usr/bin/menu-backup
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/User058/vipp/main/menu/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/webmin "https://raw.githubusercontent.com/User058/vipp/main/options/webmin.sh" && chmod +x /usr/bin/webmin
wget -q -O /usr/bin/xp "https://raw.githubusercontent.com/User058/vipp/main/menu/xp.sh" && chmod +x /usr/bin/xp
wget -q -O /usr/bin/update "https://raw.githubusercontent.com/User058/vipp/main/options/update.sh" && chmod +x /usr/bin/update
wget -q -O /usr/bin/info "https://raw.githubusercontent.com/User058/vipp/main/options/info.sh" && chmod +x /usr/bin/info
wget -q -O /usr/bin/infoserv "https://raw.githubusercontent.com/User058/vipp/main/options/infoserv.sh" && chmod +x /usr/bin/infoserv
wget -q -O /usr/bin/menu-set "https://raw.githubusercontent.com/User058/vipp/main/menu/menu-set.sh" && chmod +x /usr/bin/menu-set
wget -q -O /usr/bin/about "https://raw.githubusercontent.com/User058/vipp/main/options/about.sh" && chmod +x /usr/bin/about
clear
echo ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                 SCRIPT UPDATED                  │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
