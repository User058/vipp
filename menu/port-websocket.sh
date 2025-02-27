#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="arismaramar"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# Valid Script
VALIDITY () {
    today=`date -d "0 days" +"%Y-%m-%d"`
    Exp1=$(curl https://raw.githubusercontent.com/User058/permission/main/Regist | grep $MYIP | awk '{print $4}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mYOUR SCRIPT ACTIVE..\e[0m"
    else
    echo -e "\e[31mYOUR SCRIPT HAS EXPIRED!\e[0m";
    echo -e "\e[31mPlease renew your ipvps first\e[0m"
    exit 0
fi
}
echo -e "\e[32mloading...\e[0m"
clear
ssl2="$(cat /etc/stunnel/stunnel.conf | grep -i accept | head -n 2 | cut -d= -f2 | sed 's/ //g' | tr '\n' ' ' | awk '{print $2}')"
portsshws="$(cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2|sed 's/ //g')"
wsstunnel="$(cat ~/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2|sed 's/ //g')"
wsovpn="$(cat ~/log-install.txt | grep -w "Websocket OpenVPN" | cut -d: -f2|sed 's/ //g')"
echo -e "\e[0;31m.-----------------------------------------.\e[0m"
echo -e "\e[0;31m|      \e[0;36mCHANGE PORT WEBSOCKET OPENSSH\e[m      \e[0;31m|\e[0m"
echo -e "\e[0;31m'-----------------------------------------'\e[0m"
echo -e " \e[1;31m>>\e[0m\e[1;33mChange Port For SSH & OVPN WS:\e[0m"
echo -e "     [1]  Change Port Websocket SSH(HTTP) $portsshws"
echo -e "     [2]  Change Port Websocket SSL(HTTPS) $wsstunnel"
echo -e "======================================"
echo -e "     [x]  Back To Menu Change Port"
echo -e "     [y]  Go To Main Menu"
echo -e ""
read -p "     Select From Options [1-3 or x & y] :  " prot
echo -e ""
case $prot in
1)
read -p "New Port Websocket SSH(HTTP) : " vpn
if [ -z $vpn ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $vpn)
if [[ -z $cek ]]; then
rm -f /etc/systemd/system/ws-dropbear.service
cat > /etc/systemd/system/ws-dropbear.service <<END
[Unit]
Description=Python WS-Dropbear
Documentation=https://panel.starttunnelling.my.id
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-dropbear $vpn
Restart=on-failure
[Install]
WantedBy=multi-user.target
END
systemctl daemon-reload
systemctl enable ws-dropbear
systemctl start ws-dropbear
systemctl restart ws-dropbear
sed -i "s/   - Websocket SSH(HTTP)     : $portsshws/   - Websocket SSH(HTTP)     : $vpn/g" /root/log-install.txt
echo -e "\e[032;1mPort $vpn modified successfully\e[0m"
else
echo -e "\e[1;31mPort Websocket SSH(HTTP) $vpn is used\e[0m"
fi
;;
2)
read -p "New Port Websocket SSL(HTTPS) : " vpn
if [ -z $vpn ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $vpn)
if [[ -z $cek ]]; then
sed -i "s/$wsstunnel/$vpn/g" /etc/stunnel/stunnel.conf
sed -i "s/   - Stunnel4                : $wsstunnel, $ssl2/   - Stunnel4                : $vpn, $ssl2/g" /root/log-install.txt
sed -i "s/   - Websocket SSL(HTTPS)    : $wsstunnel/   - Websocket SSL(HTTPS)    : $vpn/g" /root/log-install.txt
/etc/init.d/stunnel4 restart > /dev/null
echo -e "\e[032;1mPort $vpn modified successfully\e[0m"
else
echo -e "\e[1;31mPort Websocket SSL(HTTPS) $vpn is used\e[0m"
fi
;;
3)
read -p "New Port Ovpn Websocket: " vpn
if [ -z $vpn ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $vpn)
if [[ -z $cek ]]; then
rm -f /etc/systemd/system/cdn-ovpn.service
cat > /etc/systemd/system/cdn-ovpn.service <<END
[Unit]
Description=Python WS-Ovpn 
Documentation=https://starttunnelling.my.id
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/cdn-ovpn $vpn
Restart=on-failure
[Install]
WantedBy=multi-user.target
END
systemctl daemon-reload
systemctl enable cdn-ovpn
systemctl start cdn-ovpn
systemctl restart cdn-ovpn
sed -i "s/   - OpenVPN-WS              : $wsovpn/   - OpenVPN-WS              : $vpn/g" /root/log-install.txt
echo -e "\e[032;1mPort $vpn modified successfully\e[0m"
else
echo -e "\e[1;31mPort Ovpn Websocket $vpn is used\e[0m"
fi
;;
x)
clear
change-port
;;
y)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
