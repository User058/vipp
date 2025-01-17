#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")

BURIQ () {
    curl -sS https://raw.githubusercontent.com/User058/permission/main/Regist > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/User058/permission/main/Regist | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/User058/permission/main/Regist | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}

x="ok"


PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
rm -f /home/needupdate > /dev/null 2>&1
else
Exp=$(curl -sS https://raw.githubusercontent.com/User058/permission/main/Regist | grep $MYIP | awk '{print $3}')
fi
# =========================================
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"

trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let tra=$trx/2
ssx=$(grep -c -E "^## " "/etc/xray/config.json")
let ssa=$ssx/2
# =========================================

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

#// Expiery
d2=$(date -d "$date_list" +"+%s")
d1=$(date -d "$Exp" +"+%s")
dayleft=$(( ($d1 - $d2) / 86400 ))

# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws-epro | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws="${GREEN}ON${NC}"
else
    status_ws="${RED}OFF${NC}"
fi

# // nginx
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${RED}OFF${NC}"
fi

# // SSH Websocket Proxy
xray=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray == "running" ]]; then
    status_xray="${GREEN}ON${NC}"
else
    status_xray="${RED}OFF${NC}"
fi
clear
clear
echo -e "$COLOR1┌────────────────────────────────────────────────────────────┐${NC}"
echo -e "                <<USER058 VPS SERVICE>>                  \E[0m"
echo -e "$COLOR1└────────────────────────────────────────────────────────────┘${NC}"
echo -e "  ${BLUE}• ${GREEN}Sever Uptime        ${NC}= $( uptime -p  | cut -d " " -f 2-10000 ) "
echo -e "  ${BLUE}• ${GREEN}Current Time        ${NC}= $( date -d "0 days" +"%d-%m-%Y | %X" )"
echo -e "  ${BLUE}• ${GREEN}Operating System    ${NC}= $( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g')( $(uname -m))"
echo -e "  ${BLUE}• ${GREEN}Current Domain      ${NC}= $( cat /etc/xray/domain )"
echo -e "  ${BLUE}• ${GREEN}Server IP           ${NC}= ${ipsaya}"
echo -e "  ${BLUE}• ${GREEN}ISP-VPS             ${NC}= $(cat /root/.myisp)"
echo -e "  ${BLUE}• ${GREEN}City                ${NC}= $(cat /root/.mycity)"
echo -e "  ${BLUE}• ${GREEN}Clients Name        ${NC}= ${YELLOW}$Name ${NC}"
echo -e "  ${BLUE}• ${GREEN}Script Expire       ${NC}= ${YELLOW}$Exp (${NC}${RED} $dayleft Days ${NC}${YELLOW})${NC}"
echo -e "  ${BLUE}• ${GREEN}Developer           ${NC}= USER058 ${NC}"
echo -e "$COLOR1┌────────────────────────────────────────────────────────────┐${NC}"
echo -e "                          << STATUS>>                    \E[0m" |lolcat
echo -e "$COLOR1┌────────────────────────────────────────────────────────────┐${NC}"
echo -e "      ${COLOR2}[ SSH Websocket${NC}: ${GREEN}ON ${NC}]  [ NGINX${NC}:${status_nginx} ] [ XRAY${NC} : ${status_xray} ] "
echo -e "$COLOR1└────────────────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│  \033[0m ${BOLD}${YELLOW}SSH     VMESS       VLESS      TROJAN       SHADOWSOCKS$NC  $COLOR1│"
echo -e "$COLOR1│  \033[0m ${Blue} $ssh1      $vma           $vla          $tra                $ssa   $NC    $COLOR1│"
echo -e "$COLOR1└────────────────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────────────────────────────────────────────┐${NC}"
echo -e "                          <<MAIN MENU>>                    \E[0m"  |lolcat
echo -e "$COLOR1└────────────────────────────────────────────────────────────┘${NC}"
echo -e "  ${CYAN}[01]${NC} • ${RED}[${NC}${PURPLE} SSH MENU ${NC}${RED}]${NC}             ${CYAN}[08]${NC} • ${RED}[${NC}${PURPLE} BACKUP MENU ${NC}${RED}]${NC} "
echo -e "  ${CYAN}[02]${NC} • ${RED}[${NC}${PURPLE} VMESS MENU ${NC}${RED}]${NC}           ${CYAN}[09]${NC} • ${RED}[${NC}${PURPLE} SETTING MENU${NC}${RED}]${NC}  "
echo -e "  ${CYAN}[03]${NC} • ${RED}[${NC}${PURPLE} VLESS MENU ${NC}${RED}]${NC}           ${CYAN}[10]${NC} • ${RED}[${NC}${PURPLE} CHANGE HOST ${NC}${RED}]${NC}     "
echo -e "  ${CYAN}[04]${NC} • ${RED}[${NC}${PURPLE} TROJAN MENU ${NC}${RED}]${NC}          ${CYAN}[11]${NC} • ${RED}[${NC}${PURPLE} RUNNING SERVICE ${NC}${RED}]${NC}    "
echo -e "  ${CYAN}[05]${NC} • ${RED}[${NC}${PURPLE} SSWS MENU ${NC}${RED}]${NC}            ${CYAN}[12]${NC} • ${RED}[${NC}${PURPLE} UPDATE SCRIPT${NC}${RED}]${NC}    "
echo -e "  ${CYAN}[06]${NC} • ${RED}[${NC}${PURPLE} BAND-WITH INFO${NC}${RED}]${NC}        ${CYAN}[13]${NC} • ${RED}[${NC}${PURPLE} RESTART ${NC}${RED}]${NC}     "
echo -e "  ${CYAN}[07]${NC} • ${RED}[${NC}${PURPLE} REBOOT ${NC}${RED}]${NC}               ${CYAN}[14]${NC} • ${RED}[${NC}${PURPLE} EXIT ${NC}${RED}]${NC} "
echo -e "$COLOR1┌────────────────────────────────────────────────────────────┐${NC}"
echo -e ""
echo -ne " Select menu : "; read opt
case $opt in
01 | 1) clear ; menu-ssh ;;
02 | 2) clear ; menu-vmess ;;
03 | 3) clear ; menu-vless ;;
04 | 4) clear ; menu-trojan ;;
05 | 5) clear ; menu-ss ;;
06 | 6) clear ; cek-bandwidth ;;
07 | 7) clear ; reboot ;;
08 | 8) clear ; menu-backup ;;
09 | 9) clear ; menu-set ;;
10) clear ; addhost ;;
11) clear ; running ;;
12) clear ; update ;;
13) clear ; restart ;;
14) clear ; exit ;;
999) clear ; $up2u ;;
00 | 0) clear ; menu ;;
*) clear ; menu ;;
esac
