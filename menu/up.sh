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
echo -e "\e[0;32mNew Updating Script Please Be Patient!\e[0m"
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/User058/vipp/main/backup/menu.sh" && chmod +x /usr/bin/menu

clear
rm -f up.sh
echo ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                 SCRIPT UPDATED                  │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
