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
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

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
clear
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domen=`cat /etc/xray/domain`
else
domen=`cat /etc/v2ray/domain`
fi
portsshws=`cat /root/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\\E[0;41;97m      ADD SSH Account              \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expirey  : " masaaktif

IP=$(curl -sS ifconfig.me);
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null | tee -a /etc/log-create-ssh.log 
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log 
echo -e "\E[40;1;37m            SSH ACCOUNT           \E[0m" | tee -a /etc/log-create-ssh.log 
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log 
echo -e "Username    : $Login" | tee -a /etc/log-create-ssh.log  | tee -a /etc/log-create-ssh.log
echo -e "Password    : $Pass"  | tee -a /etc/log-create-ssh.log
echo -e "Expired On  : $exp"  | tee -a /etc/log-create-ssh.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log 
echo -e "IP          : $IP" | tee -a /etc/log-create-ssh.log 
echo -e "Host        : $(cat /etc/xray/domain)"  | tee -a /etc/log-create-ssh.log
echo -e "OpenSSH     : 22" | tee -a /etc/log-create-ssh.log 
echo -e "SSH-WS      : 80" | tee -a /etc/log-create-ssh.log 
echo -e "SSH-SSL-WS  : 443" | tee -a /etc/log-create-ssh.log 
echo -e "SSL/TLS     : 447 , 777" | tee -a /etc/log-create-ssh.log 
echo -e "SlowDNS     : 443,80,8080,53,5300" | tee -a /etc/log-create-ssh.log 
echo -e "UDPGW       : 7100-7300" | tee -a /etc/log-create-ssh.log 
echo -e "SSH-80      : $(cat /etc/xray/domain):80@$Login:$Pass" | tee -a /etc/log-create-ssh.log
echo -e "SSH-443     : $(cat /etc/xray/domain):443@$Login:$Pass" | tee -a /etc/log-create-ssh.log
echo -e "OVPN TCP    : http://$(cat /etc/xray/domain):89/tcp.ovpn"  | tee -a /etc/log-create-ssh.log
echo -e "OVPN UDP    : http://$(cat /etc/xray/domain):89/udp.ovpn" | tee -a /etc/log-create-ssh.log 
echo -e "SETING-UDP  : $(cat /etc/xray/domain):1-65535@$Login:$Pass" | tee -a /etc/log-create-ssh.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log 
echo -e "Expired On     : $exp" | tee -a /etc/log-create-ssh.log 
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log 
echo -e "Payload WSS" | tee -a /etc/log-create-ssh.log 
echo -e "
GET wss://isi_bug_disini [protocol][crlf]Host: $(cat /etc/xray/domain)[crlf]Upgrade: websocket[crlf][crlf]
"| tee -a /etc/log-create-ssh.log 
echo -e "Payload WS" | tee -a /etc/log-create-ssh.log 
echo -e " 
GET / HTTP/1.1[crlf]Host: $(cat /etc/xray/domain)[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-ssh.log 
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log 
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
