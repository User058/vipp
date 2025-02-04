#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
IP=$(wget -qO- ipinfo.io/ip);
domain=$(cat /etc/xray/domain)
date=$(date +"%Y-%m-%d")
apt install wget -y
apt install curl -y
apt install ruby -y
gem install lolcat -y
# // Root Checking
if [ "${EUID}" -ne 0 ]; then
                echo -e "${EROR} Please Run This Script As Root User !"
                exit 1
fi
clear
# // Exporting Language to UTF-8
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
BIRed='\033[1;91m'
red='\e[1;31m'
bo='\e[1m'
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
# // Export Banner Status Information
export EROR="[${RED} ERROR ${NC}]"
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
    rm -f  /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f  /root/tmp
}
# https://raw.githubusercontent.com/User058/permission/main/Regist 
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

clear
#System version number
if [ "${EUID}" -ne 0 ]; then
                echo "You need to run this script as root"
                exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
                echo "OpenVZ is not supported"
                exit 1
fi

localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
mkdir -p /etc/xray

echo -e "${tyblue} Welcome To Script Premium USER058 VPN ${NC} "
sleep 2
echo -e "[ ${green}INFO${NC} ] Preparing to Install Files"
apt install git curl -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Script Installation Ready"
sleep 2
echo -ne "[ ${green}INFO${NC} ] Checking your permission : "

PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
tyblue "Permission Accepted!"
else
red "Permission Denied!
Please Buy AutoScript Premium
Whatsapp : 0768381055
Telegram : t.me/User058"
rm setup.sh > /dev/null 2>&1
sleep 10
exit 0
fi
sleep 3

# // cek old script
if [[ -r /etc/xray/domain ]]; then
clear
echo -e "${INFO} Script Alredy Installed !"
echo -e "${INFO} If You Replacing Script, All Client Data On This VPS Will Be Deleted !"
read -p "Are You Sure Wanna Replace Script ? (Y/N) " josdong
if [[ $josdong == "Y" ]]; then
clear
echo -e "${INFO} Starting Replacing Script !"
elif [[ $josdong == "y" ]]; then
clear
echo -e "${INFO} Starting Replacing Script !"
rm -rf /var/lib/scrz-prem 
elif [[ $josdong == "N" ]]; then
echo -e "${INFO} Action Canceled !"
exit 1
elif [[ $josdong == "n" ]]; then
echo -e "${INFO} Action Canceled !"
exit 1
else
echo -e "${EROR} Your Input Is Wrong !"
exit 1
fi
clear
fi
echo -e "${GREEN} Installation Starting............${NC}"
# // Go To Root Directory
cd /root/
# // Remove
apt-get remove --purge nginx* -y
apt-get remove --purge nginx-common* -y
apt-get remove --purge nginx-full* -y
apt-get remove --purge dropbear* -y
apt-get remove --purge stunnel4* -y
apt-get remove --purge apache2* -y
apt-get remove --purge ufw* -y
apt-get remove --purge firewalld* -y
apt-get remove --purge exim4* -y
apt autoremove -y

# // Update
apt update -y

# // Install Requirement Tools
apt-get --reinstall --fix-missing install -y sudo dpkg psmisc socat jq ruby wondershaper python2 tmux nmap bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget vim net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential gcc g++ automake make autoconf perl m4 dos2unix dropbear libreadline-dev zlib1g-dev libssl-dev dirmngr libxml-parser-perl neofetch git lsof iptables iptables-persistent
apt-get --reinstall --fix-missing install -y libreadline-dev zlib1g-dev libssl-dev python2 screen curl jq bzip2 gzip coreutils rsyslog iftop htop zip unzip net-tools sed gnupg gnupg1 bc sudo apt-transport-https build-essential dirmngr libxml-parser-perl neofetch screenfetch git lsof openssl easy-rsa fail2ban tmux vnstat dropbear libsqlite3-dev socat cron bash-completion ntpdate xz-utils sudo apt-transport-https gnupg2 gnupg1 dnsutils lsb-release chrony
gem install lolcat

# // Update & Upgrade
apt update -y
apt upgrade -y
apt dist-upgrade -y

# // Clear
clear
clear && clear && clear
clear;clear;clear
# // Reading Your Input
read -p "Input Your Domain : " domain
if [[ $domain == "" ]]; then
    clear
    echo -e "${EROR} No Input Detected !"
    exit 1
fi

# // Folder Sistem Yang Tidak Boleh Di Hapus
mkdir -p /usr/bin
# // Remove File & Directory
rm -fr /usr/local/bin/xray
rm -fr /usr/local/bin/stunnel
rm -fr /usr/local/bin/stunnel5
rm -fr /etc/nginx
rm -fr /var/lib/scrz-prem/
rm -fr /usr/bin/xray
rm -fr /etc/xray
rm -fr /usr/local/etc/xray
# // Making Directory 
mkdir -p /etc/nginx
mkdir -p /var/lib/scrz-prem/
mkdir -p /usr/bin/xray
mkdir -p /etc/xray
mkdir -p /usr/local/etc/xray


# // Input Domain TO VPS
echo "$domain" > /etc/${Auther}/domain.txt
echo "IP=$domain" > /var/lib/scrz-prem/ipvps.conf
echo "$domain" > /root/domain
domain=$(cat /root/domain)

#SETUP ALL INFORMATION
cp -r /root/domain /etc/xray/domain
curl ipinfo.io/org?token=7ce50028ba7184 > /root/.isp
curl ipinfo.io/city?token=7ce50028ba7184 > /root/.city
curl ipinfo.io/org?token=7ce50028ba7184 > /root/.myisp
curl ipinfo.io/city?token=7ce50028ba7184 > /root/.mycity
curl ifconfig.me > /root/.ip
curl ipinfo.io/region?token=7ce50028ba7184 > /root/.region
curl ifconfig.me > /root/.myip
wget -q https://raw.githubusercontent.com/User058/vipp/main/tools/log-install.txt > /root
neofetch | grep "CPU" | cut -d: -f2 | sed 's/ //g' > /root/.cpu
# // Making Certificate
clear
echo -e "[ ${GREEN}INFO${NC} ] Starting renew cert... " 
sleep 2
echo -e "${OKEY} Starting Generating Certificate"
rm -fr /root/.acme.sh
mkdir -p /root/.acme.sh
curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
chmod +x /root/.acme.sh/acme.sh
/root/.acme.sh/acme.sh --upgrade
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
# // Success
echo -e "${OKEY} Your Domain : $domain"
sleep 2
function make_folder_xray() {
#mkdir folder
 mkdir -p /etc/cobek
 mkdir -p /etc/cobek/limit
 mkdir -p /etc/cobek/limit/trojan
 mkdir -p /etc/cobek/limit/vless
 mkdir -p /etc/cobek/limit/vmess
 mkdir -p /etc/cobek/limit/ssh
 mkdir -p /etc/cobek/limit/ssh/ip
 mkdir -p /etc/cobek/limit/trojan/ip
 mkdir -p /etc/cobek/limit/trojan/quota
 mkdir -p /etc/cobek/limit/vless/ip
 mkdir -p /etc/cobek/limit/vless/quota
 mkdir -p /etc/cobek/limit/vmess/ip
 mkdir -p /etc/cobek/limit/vmess/quota
 mkdir -p /etc/cobek/trojan
 mkdir -p /etc/cobek/vless
 mkdir -p /etc/cobek/vmess
 mkdir -p /etc/cobek/log
 mkdir -p /etc/cobek/log/trojan
 mkdir -p /etc/cobek/log/vless
 mkdir -p /etc/cobek/log/vmess
 mkdir -p /etc/cobek/log/ssh
 mkdir -p /etc/cobek/cache
 mkdir -p /etc/cobek/cache/trojan-tcp
 mkdir -p /etc/cobek/cache/trojan-ws
 mkdir -p /etc/cobek/cache/trojan-grpc
 mkdir -p /etc/cobek/cache/vless-ws
 mkdir -p /etc/cobek/cache/vless-grpc
 mkdir -p /etc/cobek/cache/vmess-ws
 mkdir -p /etc/cobek/cache/vmess-grpc
 mkdir -p /etc/cobek/cache/vmess-ws-orbit
 mkdir -p /etc/cobek/cache/vmess-ws-orbit1
    }
	
#install arzsource
echo -e "┌─────────────────────────────────────────┐"
echo -e " \E[41;1;39m           >>> Install Source <<<        \E[0m$NC"
echo -e "└─────────────────────────────────────────┘"
wget -q https://raw.githubusercontent.com/User058/vipp/main/tools/anggunsource.sh && chmod +x anggunsource.sh && ./anggunsource.sh
#install ssh-vpn
echo -e "┌─────────────────────────────────────────┐"
echo -e " \E[41;1;39m          >>> Install SSH WS <<<        \E[0m$NC"
echo -e "└─────────────────────────────────────────┘"
wget -q https://raw.githubusercontent.com/User058/vipp/main/tools/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
#install ins-xray
echo -e "┌─────────────────────────────────────────┐"
echo -e " \E[41;1;39m            >>> Install Xray <<<         \E[0m$NC"
echo -e "└─────────────────────────────────────────┘"
wget -q https://raw.githubusercontent.com/User058/vipp/main/tools/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh

#install ins-xray
echo -e "┌─────────────────────────────────────────┐"
echo -e " \E[41;1;39m            >>> Install BR <<<           \E[0m$NC"
echo -e "└─────────────────────────────────────────┘"
wget -q https://raw.githubusercontent.com/User058/vipp/main/backup/set-br.sh && chmod +x set-br.sh && ./set-br.sh

# // Download Data
echo -e "${GREEN}Download Menu${NC}"
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
wget -q -O /usr/bin/addhost "https://raw.githubusercontent.com/User058/vipp/main/menu/addhost.sh" && chmod +x /usr/bin/addhost
wget -q -O /usr/bin/jam "https://raw.githubusercontent.com/User058/vipp/main/options/jam.sh" && chmod +x /usr/bin/jam
wget -q -O /usr/bin/up "https://raw.githubusercontent.com/User058/vipp/main/backup/up.sh" && chmod +x /usr/bin/up
cd /usr/sbin
wget -q -O /usr/bin/mesinssh "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/mesinssh.sh"
wget -q -O /usr/bin/cek-ssh "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/cek-ssh.sh"
chmod +x *
chmod +x /usr/sbin/*
cd /usr/bin
wget -q -O /usr/bin/loop "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/loop.sh"
wget -q -O /usr/bin/matikan "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/matikan.sh"
wget -q -O /usr/bin/limit "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/limit.sh"
wget -q -O /usr/bin/limit-ip-ssh "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/limit-ip-ssh.sh"
wget -q -O /usr/bin/limit-ip-trojan "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/limit-ip-trojan.sh"
wget -q -O /usr/bin/limit-ip-vless "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/limit-ip-vless.sh"
wget -q -O /usr/bin/limit-ip-vmess "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/limit-ip-vmess.sh"
wget -q -O /usr/bin/limit-quota-trojan "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/limit-quota-trojan.sh"
wget -q -O /usr/bin/limit-quota-vmess "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/limit-quota-vmess.sh"
wget -q -O /usr/bin/limit-quota-vless "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/limit-quota-vless.sh"
wget -q -O /usr/bin/quota "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/quota.sh"
wget -q -O /usr/bin/quota-trojan-grpc "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/quota-trojan-grpc.sh"
wget -q -O /usr/bin/quota-trojan-ws "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/quota-trojan-ws.sh"
wget -q -O /usr/bin/quota-vmess-grpc "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/quota-vmess-grpc.sh"
wget -q -O /usr/bin/quota-vmess-ws "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/quota-vmess-ws.sh"
wget -q -O /usr/bin/quota-vless-ws "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/quota-vless-ws.sh"
wget -q -O /usr/bin/quota-vless-grpc "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/quota-vless-grpc.sh"
wget -q -O /usr/bin/quota-vmess-orbit "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/quota-vmess-ws-orbit.sh"
wget -q -O /usr/bin/quota-vmess-orbit1 "https://raw.githubusercontent.com/User058/vipp/main/tools/limit/quota-vmess-ws-orbit1.sh"
chmod +x /usr/bin/*

#cat > /etc/cron.d/re_otm <<-END
#SHELL=/bin/sh
#PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
#0 7 * * * root /sbin/reboot
#END

cat > /etc/cron.d/xp_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
2 0 * * * root /usr/bin/xp
END

cat > /etc/cron.d/cl_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
2 1 * * * root /usr/bin/clearlog
END

cat > /home/re_otm <<-END
7
END

service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1

clear
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.
if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
mesg n || true
clear
menu
END
chmod 644 /root/.profile

if [ -f "/etc/afak.conf" ]; then
rm -fr /etc/afak.conf 
fi
if [ ! -f "/etc/log-create-user.log" ]; then
echo "Log All Account " > /etc/log-create-user.log
fi
history -c
serverV=$( curl -sS https://raw.githubusercontent.com/User058/vipp/main/newversion  )
echo $serverV > /opt/.ver
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi
rm -fr /root/limit
rm -fr /root/weleh.sh 
rm -fr /root/arzsource.sh 
rm -fr /root/ssh-vpn.sh
rm -fr /root/ins-xray.sh
rm -fr /root/setup.sh
rm -fr /root/domain
rm -fr /root/ssh-vpn.sh
rm -fr /root/ins-xray.sh
rm -fr /root/install.sh
systemctl daemon-reload
systemctl enable client
systemctl enable nginx
systemctl enable quota
systemctl enable ws-stunnel
systemctl enable stunnel5
systemctl enable xray
systemctl enable udp-custom
systemctl start client
systemctl start nginx
systemctl start quota
systemctl start ws-stunnel
systemctl start stunnel5
systemctl start xray
systemctl start udp-custom
clear
echo -e "

TEXT="
==================================
Detail Install Script
==================================
IP VPS: $ip_vps
Domain: $(cat /etc/xray/domain)
Waktu Install: $date
Client Name: $Name
==================================


clear
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
echo -e 
==================================
Detail Install Script
==================================
IP VPS        : $ip_vps
Domain        : $(cat /etc/xray/domain)
Date & Time   : $date
Client Name   : $Name
==================================
curl -sS ipv4.icanhazip.com > /etc/myipvps
echo  " "
echo "=====================-[ PREMIUM VVIP ]-===================="
echo  ""
echo  "------------------------------------------------------------"
echo  ""
echo  "   >>> Service & Port"  | tee -a log-install.txt
echo  "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo  "   - SSH Websocket           : 80" | tee -a log-install.txt
echo  "   - SSH SSL Websocket       : 443" | tee -a log-install.txt
echo  "   - Stunnel5                : 447, 777" | tee -a log-install.txt
echo  "   - Dropbear                : 109, 143" | tee -a log-install.txt
echo  "   - Badvpn                  : 7100-7300" | tee -a log-install.txt
echo  "   - Nginx                   : 81" | tee -a log-install.txt
echo  "   - XRAY  Vmess TLS         : 443" | tee -a log-install.txt
echo  "   - XRAY  Vmess None TLS    : 80" | tee -a log-install.txt
echo  "   - XRAY  Vless TLS         : 443" | tee -a log-install.txt
echo  "   - XRAY  Vless None TLS    : 80" | tee -a log-install.txt
echo  "   - Trojan GRPC             : 443" | tee -a log-install.txt
echo  "   - Trojan WS               : 443" | tee -a log-install.txt
echo  "   - Sodosok WS/GRPC         : 443" | tee -a log-install.txt
echo  ""  | tee -a log-install.txt
echo  "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo  "   - Timezone                : Africa/Nairobi (EAT-3)"  | tee -a log-install.txt
echo  "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo  "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo  "   - IPtables                : [ON]"  | tee -a log-install.txt
echo  "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo  "   - Autoreboot              : 00.00 EAT-3" | tee -a log-install.txt
echo  "   - AutoKill Multi Login User" | tee -a log-install.txt
echo  "   - Auto Delete Expired Account" | tee -a log-install.txt
echo  "   - Fully automatic script" | tee -a log-install.txt
echo  "   - VPS settings" | tee -a log-install.txt
echo  "   - Restore Data" | tee -a log-install.txt
echo  "   - Full Orders For Various Services" | tee -a log-install.txt
echo ""
echo  ""
echo  "------------------------------------------------------------"
echo  ""
echo  "================-[ SCRIPT PREMIUM VVIP ]-================"
echo -e ""
echo  ""
echo  "" | tee -a log-install.txt
echo -e "Instal sukses proses reboot selama 5 detik !!"
sleep 5
reboot
