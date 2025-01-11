#!/bin/bash


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

BURIQ () {
    curl -sS https://raw.githubusercontent.com/User058/permission/main/Regist> /root/tmp
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
Name=$(curl -sS https://raw.githubusercontent.com/User058/permission/main/Regist| grep $MYIP | awk '{print $2}')
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
    IZIN=$(curl -sS https://raw.githubusercontent.com/User058/permission/main/Regist| awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
echo -e ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                 BANDWITH MONITOR                │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e "  ${BICyan}[${BIGreen}1${BICyan}]${BIGreen}   View Total Remaining Bandwidth${NC}"

echo -e "  ${BICyan}[${BIGreen}2${BICyan}]${BIGreen}   Usage Every 5 Minutes${NC}"

echo -e "  ${BICyan}[${BIGreen}3${BICyan}]${BIGreen}   Hourly Usage${NC}"

echo -e "  ${BICyan}[${BIGreen}4${BICyan}]${BIGreen}   Daily Usage${NC}"

echo -e "  ${BICyan}[${BIGreen}5${BICyan}]${BIGreen}   Monthly Usage${NC}"
echo -e "  ${BICyan}[${BIGreen}6${BICyan}]${BIGreen}   Annual Usage${NC}"
echo -e "  ${BICyan}[${BIGreen}7${BICyan}]${BIGreen}   Highest Usage${NC}"

echo -e "  ${BICyan}[${BIGreen}8${BICyan}]${BIGreen}   Hourly Usage${NC}"

echo -e "  ${BICyan}[${BIGreen}9${BICyan}]${BIGreen}   View Current Active Usage${NC}"

echo -e "  ${BICyan}[${BIGreen}10${BICyan}]${BIGreen}  View Current Active Usage Traffic [5s]${NC}"

echo -e "  ${BICyan}[${BIGreen}0${BICyan}]${BIGreen}   Back To Menu${NC}"

echo -e "  ${BICyan}[${BIGreen}x${BICyan}]${BIGreen}   Exit${NC}"
echo -e "${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${green}"
read -p "     [#]  Enter Number :  " noo
echo -e "${off}"

case $noo in
1)
echo -e ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│        TOTAL BANDWITH SERVER REMAINING          │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e ""

vnstat

echo -e ""
echo -e "${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$baris2" | lolcat
;;

2)
echo -e ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│              USAGE EVERY 5 MINUTES              │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e ""

vnstat -5

echo -e ""
echo -e "${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$baris2" | lolcat
;;

3)
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│             HOURLY BANDWITH USAGE            │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e ""

vnstat -h

echo -e ""
echo -e "${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$baris2" | lolcat
;;

4)
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                 DAILY BANDWITH USE           │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e ""

vnstat -d

echo -e ""
echo -e "${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$baris2" | lolcat
;;

5)
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│              BANDWITH USE EVERY MONTH        │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e ""

vnstat -m

echo -e ""
echo -e "${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$baris2" | lolcat
;;

6)
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│         	BANDWITH USAGE EACH YEAR    	    │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e ""

vnstat -y

echo -e ""
echo -e "${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$baris2" | lolcat
;;

7)
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│         	 HIGHEST BANDWITH USE	            │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e ""

vnstat -t

echo -e ""
echo -e "${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$baris2" | lolcat
;;

8)
echo -e ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│      	 HOURLY USAGE BANDWITH CHART        │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e ""

vnstat -hg

echo -e ""
echo -e "${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$baris2" | lolcat
;;

9)
echo -e ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│            LIVE BANDWITH USAGE               │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e " ${green}CTRL+C Untuk Berhenti!${off}"
echo -e ""

vnstat -l

echo -e ""
echo -e "${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$baris2" | lolcat
;;

10)
echo -e ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│     LIVE CURRENT BANDWITH USAGE TRAFFIC	    │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e ""

vnstat -tr

echo -e ""
echo -e "${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$baris2" | lolcat
;;

0)
sleep 1
menu
;;


0)
sleep 1
exit
;;

*)
sleep 1
echo -e "${red}The number you entered is wrong!${off}"
;;
esac
read -n 1 -s -r -p "Press any key to back on menu"

menu
