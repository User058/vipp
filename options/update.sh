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
# UPDATE RUN-UPDATE
cd /usr/bin
wget -O run-update "https://raw.githubusercontent.com/User058/vipp/main/options/update.sh"
chmod +x run-update
# RUN UPDATE
echo ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                 PROSES UPDATE                   │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e "\e[0;32mNew Version Downloading started!\e[0m"
cd /usr/bin
wget -q -O /usr/bin/add-ws "https://raw.githubusercontent.com/User058/vipp/main/add-ws.sh"
wget -q -O /usr/bin/add-ssws "https://raw.githubusercontent.com/User058/vipp/main/add-ssws.sh"
wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/User058/vipp/main/add-vless.sh"
wget -q -O /usr/bin/add-tr "https://raw.githubusercontent.com/User058/vipp/main/add-tr.sh"
wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/User058/vipp/main/usernew.sh"
wget -q -O /usr/bin/autoreboot "https://raw.githubusercontent.com/User058/vipp/main/options/autoreboot.sh"
wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/User058/vipp/main/options/restart.sh"
wget -q -O /usr/bin/tendang "https://raw.githubusercontent.com/User058/vipp/main/options/tendang.sh"
wget -q -O /usr/bin/clearlog "https://raw.githubusercontent.com/User058/vipp/main/options/clearlog.sh"
wget -q -O /usr/bin/running "https://raw.githubusercontent.com/User058/vipp/main/options/running.sh"
wget -q -O /usr/bin/cek-trafik "https://raw.githubusercontent.com/User058/vipp/main/menu/port-websocket.sh"
wget -q -O /usr/bin/cek-bandwidth "https://raw.githubusercontent.com/User058/vipp/main/options/cek-bandwidth.sh"
wget -q -O /usr/bin/limitspeed "https://raw.githubusercontent.com/User058/vipp/main/options/limitspeed.sh"
wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/User058/vipp/main/menu/menu-vless.sh"
wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/User058/vipp/main/menu/menu-vmess.sh"
wget -q -O /usr/bin/menu-ss "https://raw.githubusercontent.com/User058/vipp/main/menu/menu-ss.sh"
wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/User058/vipp/main/menu/menu-trojan.sh"
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/User058/vipp/main/menu/menu-ssh.sh"
wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/User058/vipp/main/menu/menu-backup.sh"
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/User058/vipp/main/menu/menu.sh"
wget -q -O /usr/bin/webmin "https://raw.githubusercontent.com/User058/vipp/main/options/webmin.sh"
wget -q -O /usr/bin/xp "https://raw.githubusercontent.com/User058/vipp/main/xp.sh"
wget -q -O /usr/bin/update "https://raw.githubusercontent.com/User058/vipp/main/options/update.sh"
#wget -q -O /usr/bin/menu-theme "https://raw.githubusercontent.com/User058/vipp/main/menu/menu-theme.sh"
wget -q -O /usr/bin/info "https://raw.githubusercontent.com/User058/vipp/main/options/info.sh"
wget -q -O /usr/bin/infoserv "https://raw.githubusercontent.com/User058/vipp/main/options/infoserv.sh"
wget -q -O /usr/bin/menu-set "https://raw.githubusercontent.com/User058/vipp/main/menu/menu-set.sh"
wget -q -O /usr/bin/about "https://raw.githubusercontent.com/User058/vipp/main/options/about.sh"
chmod +x /usr/bin/add-ws
chmod +x /usr/bin/add-ssws
chmod +x /usr/bin/add-vless
chmod +x /usr/bin/add-tr
chmod +x /usr/bin/usernew
chmod +x /usr/bin/autoreboot
chmod +x /usr/bin/restart
chmod +x /usr/bin/tendang
chmod +x /usr/bin/clearlog
chmod +x /usr/bin/running
chmod +x /usr/bin/port-websocket
chmod +x /usr/bin/cek-speed
chmod +x /usr/bin/cek-bandwidth
chmod +x /usr/bin/limitspeed
chmod +x /usr/bin/menu-vless
chmod +x /usr/bin/menu-vmess
chmod +x /usr/bin/menu-ss
chmod +x /usr/bin/menu-trojan
chmod +x /usr/bin/menu-ssh
chmod +x /usr/bin/menu-backup
chmod +x /usr/bin/menu
chmod +x /usr/bin/webmin
chmod +x /usr/bin/xp
chmod +x /usr/bin/update
#chmod +x /usr/bin/menu-theme
chmod +x /usr/bin/info
chmod +x /usr/bin/infoserv
chmod +x /usr/bin/menu-set
chmod +x /usr/bin/about
clear
rm -f update.sh
clear
echo ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                 SCRIPT UPDATED                  │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
