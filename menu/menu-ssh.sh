#!/bin/bash
#Script By Effata

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
purple="\033[1;95m"
r="\033[1;31m"  #REDTERANG
Blue="\033[0;34m"
y='\033[1;33m' #yellow
g="\033[1;92m"
clear
function trialssh(){
clear
domen=`cat /etc/xray/domain`
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`
clear
IP=$(curl -sS ifconfig.me);
ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
sqd="$(cat /root/log-install.txt | grep -w "Squid" | cut -d: -f2)"
OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`


Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
echo Ping Host &> /dev/null
echo Create Akun: $Login &> /dev/null
sleep 0.5
echo Setting Password: $Pass &> /dev/null
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`

if [[ ! -z "${PID}" ]]; then
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│                   SSH ACCOUNT                   │" 
echo -e "└─────────────────────────────────────────────────┘"                 
echo -e ""
echo -e "Username     : $Login"
echo -e "Password     : $Pass"        
echo -e "CITY         : $(cat /root/.mycity)"
echo -e "ISP          : $(cat /root/.myisp)"
echo -e "Host/IP      : $(cat /etc/xray/domain)"
echo -e "NSDOMAIN     : $(cat /etc/xray/dns)"
echo -e "PUBKEY       : $(cat /etc/slowdns/server.pub)"
echo -e "Slowdns      : 53, 5300"
echo -e "Udp Custom   : 1-65535"
echo -e "Port ssl/tls : 443, 441, 445, 777"
echo -e "Port non tls : 8880, 109, 143, 80"   
echo -e "OpenSSH      : $opensh"
echo -e "Dropbear     : $db" 
echo -e "SSH-WS       : $portsshws" 
echo -e "SSH WS SSL   : $wsssl" 
echo -e "SSL/TLS      : $ssl"         
echo -e "OVPN TCP     : http://$domain:89/tcp.ovpn"
echo -e "OVPN UDP     : http://$domain:89/udp.ovpn"
echo -e "BadVpn       : 7300"      
echo -e ""  
echo -e "─────────────────────────────────────────────────" 
echo -e "Payload WS"
echo -e "GET / HTTP/1.1[crlf]Host: $domen[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: ws[crlf][crlf]"
echo -e "─────────────────────────────────────────────────" 
echo -e "Payload WSS"
echo -e "GET wss://[host] HTTP/1.1[crlf]Host: bug.com[crlf]Connection: Arz-Alive[crlf]User-Agent: [ua][crlf]Upgrade: ws[crlf][crlf]"
echo -e "─────────────────────────────────────────────────" 
echo -e ""  
echo -e "─────────────────────────────────────────────────"               
echo -e "      Expired => $exp"
echo -e "─────────────────────────────────────────────────" 
echo -e ""  
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│               USER058STR                        │" 
echo -e "└─────────────────────────────────────────────────┘" 
else
clear
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│                   SSH ACCOUNT                   │" 
echo -e "└─────────────────────────────────────────────────┘"                 
echo -e ""
echo -e "Username     : $Login"
echo -e "Password     : $Pass"        
echo -e "CITY         : $(cat /root/.mycity)"
echo -e "ISP          : $(cat /root/.myisp)"
echo -e "Host/IP      : $(cat /etc/xray/domain)"
echo -e "NSDOMAIN     : $(cat /etc/xray/dns)"
echo -e "PUBKEY       : $(cat /etc/slowdns/server.pub)"
echo -e "Slowdns      : 53, 5300"
echo -e "Udp Custom   : 1-65535"
echo -e "Port ssl/tls : 443, 441, 445, 777"
echo -e "Port non tls : 8880, 109, 143, 80"   
echo -e "OpenSSH      : $opensh"
echo -e "Dropbear     : $db" 
echo -e "SSH-WS       : $portsshws" 
echo -e "SSH WS SSL   : $wsssl" 
echo -e "SSL/TLS      : $ssl"         
echo -e "OVPN TCP     : http://$domain:89/tcp.ovpn"
echo -e "OVPN UDP     : http://$domain:89/udp.ovpn"
echo -e "BadVpn       : 7300"      
echo -e ""  
echo -e "─────────────────────────────────────────────────" 
echo -e "Payload WS"
echo -e "GET / HTTP/1.1[crlf]Host: $domen[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: ws[crlf][crlf]"
echo -e "─────────────────────────────────────────────────" 
echo -e "Payload WSS"
echo -e "GET wss://[host] HTTP/1.1[crlf]Host: bug.com[crlf]Connection: Arz-Alive[crlf]User-Agent: [ua][crlf]Upgrade: ws[crlf][crlf]"
echo -e "─────────────────────────────────────────────────" 
echo -e ""  
echo -e "─────────────────────────────────────────────────"               
echo -e "      Expired => $exp"
echo -e "─────────────────────────────────────────────────" 
echo -e ""  
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│               USER058STR                        │" 
echo -e "└─────────────────────────────────────────────────┘" 
fi
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ssh
}
function del(){
clear
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│               DELETE SSH ACCOUNT                │" 
echo -e "└─────────────────────────────────────────────────┘"  
echo "    USERNAME          EXP DATE          STATUS"
echo -e "    ${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "    %-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "LOCKED${NORMAL}"
else
printf "    %-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "UNLOCKED${NORMAL}"
fi
fi
done < /etc/passwd
echo ""
read -p "Username SSH to Delete : " Pengguna

if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna > /dev/null 2>&1
        echo -e "User $Pengguna was removed."
else
        echo -e "Failure: User $Pengguna Not Exist."
fi

read -n 1 -s -r -p "Press any key to back on menu"

menu-ssh
}
function autodel(){
clear
               hariini=`date +%d-%m-%Y`
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│                   AUTO DELETE                   │" 
echo -e "└─────────────────────────────────────────────────┘"  
               echo "Thank you for removing the EXPIRED USERS"
               echo -e "$BIBlue━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"  
               cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
               totalaccounts=`cat /tmp/expirelist.txt | wc -l`
               for((i=1; i<=$totalaccounts; i++ ))
               do
               tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
               username=`echo $tuserval | cut -f1 -d:`
               userexp=`echo $tuserval | cut -f2 -d:`
               userexpireinseconds=$(( $userexp * 86400 ))
               tglexp=`date -d @$userexpireinseconds`             
               tgl=`echo $tglexp |awk -F" " '{print $3}'`
               while [ ${#tgl} -lt 2 ]
               do
               tgl="0"$tgl
               done
               while [ ${#username} -lt 15 ]
               do
               username=$username" " 
               done
               bulantahun=`echo $tglexp |awk -F" " '{print $2,$6}'`
               echo "echo "Expired- User : $username Expire at : $tgl $bulantahun"" >> /usr/local/bin/alluser
               todaystime=`date +%s`
               if [ $userexpireinseconds -ge $todaystime ] ;
               then
                        :
               else
               echo "echo "Expired- Username : $username are expired at: $tgl $bulantahun and removed : $hariini "" >> /usr/local/bin/deleteduser
                   echo "Username $username that are expired at $tgl $bulantahun removed from the VPS $hariini"
               userdel $username
               fi
               done
               echo " "
               echo -e "$BIBlue━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"  
               
               read -n 1 -s -r -p "Press any key to back on menu"
               menu-ssh
        
}
function ceklim(){
clear
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│            CHECK USER MULTILOGIN                │" 
echo -e "└─────────────────────────────────────────────────┘"  
if [ -e "/root/log-limit.txt" ]; then
echo "User Who Violate The Maximum Limit";
echo "Time - Username - Number of Multilogin"
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
cat /root/log-limit.txt
else
echo " No user has committed a violation"
echo " "
echo " or"
echo " "
echo " The user-limit script not been executed."
fi
echo " ";
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo " ";
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
function cek(){
if [ -e "/var/log/auth.log" ]; then
        LOG="/var/log/auth.log";
fi
if [ -e "/var/log/secure" ]; then
        LOG="/var/log/secure";
fi
               
data=( `ps aux | grep -i dropbear | awk '{print $2}'`);
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│               DROPBEAR USER LOGIN               │" 
echo -e "└─────────────────────────────────────────────────┘"  
echo "ID  |  Username  |  IP Address";
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" > /tmp/login-db.txt;
for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "dropbear\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $10}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $12}'`;
        if [ $NUM -eq 1 ]; then
                echo "$PID - $USER - $IP";
        fi
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

done
echo " "
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│               OPENSSH USER LOGIN                │" 
echo -e "└─────────────────────────────────────────────────┘"  
echo "ID  |  Username  |  IP Address";
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
cat $LOG | grep -i sshd | grep -i "Accepted password for" > /tmp/login-db.txt
data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);

for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "sshd\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $9}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $11}'`;
        if [ $NUM -eq 1 ]; then
                echo "$PID - $USER - $IP";
        fi
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

done
if [ -f "/etc/openvpn/server/openvpn-tcp.log" ]; then
        echo " "
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│               OpenVPN TCP LOGIN                 │" 
echo -e "└─────────────────────────────────────────────────┘"  
        echo "Username  |  IP Address  |  Connected Since";
        echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        cat /etc/openvpn/server/openvpn-tcp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-tcp.txt
        cat /tmp/vpn-login-tcp.txt
fi
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

if [ -f "/etc/openvpn/server/openvpn-udp.log" ]; then
        echo " "
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│               OpenVPN UDP LOGIN                 │" 
echo -e "└─────────────────────────────────────────────────┘"  
        echo "Username  |  IP Address  |  Connected Since";
        echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        cat /etc/openvpn/server/openvpn-udp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-udp.txt
        cat /tmp/vpn-login-udp.txt
fi
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo "";

rm -f /tmp/login-db-pid.txt
rm -f /tmp/login-db.txt
rm -f /tmp/vpn-login-tcp.txt
rm -f /tmp/vpn-login-udp.txt
read -n 1 -s -r -p "Press any key to back on menu"

menu-ssh
}
function member(){
clear
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│                   MEMBER SSH                    │" 
echo -e "└─────────────────────────────────────────────────┘"       
echo "USERNAME          EXP DATE          STATUS"
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "LOCKED${NORMAL}"
else
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "UNLOCKED${NORMAL}"
fi
fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo "Account number: $JUMLAH user"
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│               USER058STR                    	   │" 
echo -e "└─────────────────────────────────────────────────┘" 
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
}
function renew(){
clear
clear
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│                  RENEW USER                     │" 
echo -e "└─────────────────────────────────────────────────┘"    
echo "    USERNAME          EXP DATE          STATUS"
echo -e "    ${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "    %-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "LOCKED${NORMAL}"
else
printf "    %-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "UNLOCKED${NORMAL}"
fi
fi
done < /etc/passwd
echo
read -p "    Username : " User
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "Day Extend : " Days
Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
passwd -u $User
usermod -e  $Expiration $User
egrep "^$User" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
clear
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│                   MEMBER SSH                    │" 
echo -e "└─────────────────────────────────────────────────┘"   
echo -e ""
echo -e " Username : $User"
echo -e " Days Added : $Days Days"
echo -e " Expires on :  $Expiration_Display"
echo -e ""
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│               USER058STR                        │" 
echo -e "└─────────────────────────────────────────────────┘" 
echo -e ""
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
else
clear
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│                   MEMBER SSH                    │" 
echo -e "└─────────────────────────────────────────────────┘"   
echo -e ""
echo -e "   Username Doesnt Exist      "
echo -e ""
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│               USER058STR                        │" 
echo -e "└─────────────────────────────────────────────────┘" 
echo -e ""
fi
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
}
function autokill(){
clear
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(grep -c -E "^# Autokill" /etc/cron.d/tendang)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│                 AUTO KILL SSH                   │" 
echo -e "└─────────────────────────────────────────────────┘"  
echo -e "Status Autokill : $sts        "
echo -e ""
echo -e "[1]  AutoKill After 5 Minutes"
echo -e "[2]  AutoKill After 10 Minutes"
echo -e "[3]  AutoKill After 15 Minutes"
echo -e "[4]  Turn Off AutoKill/MultiLogin"
echo -e "[x]  Menu"
echo ""
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -p "Select From Options [1-4 or x] :  " AutoKill
read -p "Multilogin Maximum Number Of Allowed: " max
echo -e ""
case $AutoKill in
                1)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "# Autokill" >/etc/cron.d/tendang
                echo "*/5 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang && chmod +x /etc/cron.d/tendang
                echo "" > /root/log-limit.txt
                echo -e ""
echo -e "┌─────────────────────────────────────────────────┐" 
                echo -e ""
                echo -e "      Allowed MultiLogin : $max"
                echo -e "      AutoKill Every     : 5 Minutes"      
                echo -e ""
echo -e "└─────────────────────────────────────────────────┘"  
                service cron reload >/dev/null 2>&1
                service cron restart >/dev/null 2>&1                                                                 
                ;;
                2)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "# Autokill" >/etc/cron.d/tendang
                echo "*/10 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang && chmod +x /etc/cron.d/tendang
                echo "" > /root/log-limit.txt
                echo -e ""
echo -e "┌─────────────────────────────────────────────────┐" 
                echo -e ""
                echo -e "      Allowed MultiLogin : $max"
                echo -e "      AutoKill Every     : 10 Minutes"
                echo -e ""
echo -e "└─────────────────────────────────────────────────┘"  
                service cron reload >/dev/null 2>&1
                service cron restart >/dev/null 2>&1
                ;;
                3)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "# Autokill" >/etc/cron.d/tendang
                echo "*/15 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang && chmod +x /etc/cron.d/tendang
                echo "" > /root/log-limit.txt
                echo -e ""
echo -e "┌─────────────────────────────────────────────────┐" 
                echo -e ""
                echo -e "      Allowed MultiLogin : $max"
                echo -e "      AutoKill Every     : 15 Minutes"
                echo -e ""
echo -e "└─────────────────────────────────────────────────┘"  
                service cron reload >/dev/null 2>&1
                service cron restart >/dev/null 2>&1          
                ;;
                4)
                rm -fr /etc/cron.d/tendang
                echo "" > /root/log-limit.txt
                echo -e ""
echo -e "┌─────────────────────────────────────────────────┐" 
                echo -e ""
                echo -e "      AutoKill MultiLogin Turned Off"
                echo -e ""
echo -e "└─────────────────────────────────────────────────┘"  
                service cron reload >/dev/null 2>&1
                service cron restart >/dev/null 2>&1
                ;;
                x)
                menu
                ;;
                *)
                echo "Please enter an correct number"
                ;;
        esac
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
}
clear
echo -e "   \033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "   \\E[0;41;97m           SSH MENU             \E[0m"
echo -e "   \033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "  ┌─────────────────────────────────┐"
echo -e "   $y 1.${BIGreen} Create SSH Account ${NC}    "
echo -e "   $y 2.${BIGreen} Trial SSH Acoount  ${NC}    "
echo -e "   $y 3.${BIGreen} Delete SSH Acoount  ${NC}    "
echo -e "   $y 4.${BIGreen} Renew SSH Account    ${NC}  "
echo -e "   $y 5.${BIGreen} Check User Login  ${NC}   "
echo -e "   $y 6.${BIGreen} MultiLogin SSH   ${NC}  "
echo -e "   $y 7.${BIGreen} Auto Del user Exp  ${NC}   "
echo -e "   $y 8.${BIGreen} Auto Kill user SSH ${NC}   "
echo -e "   $y 9.${BIGreen} Check SSH Accounts ${NC}"
echo -e "   $y 10.${BIGreen} Check Username & Pass SSH ${NC}"
echo -e "   $y 0.${BIGreen} Back To Menu  ${NC}    "
echo -e "   $y x.${BIGreen} Exit ${NC}"
echo -e "  └──────────────────────────────────┘" 
echo ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; usernew ;;
2) clear ; trialssh ;;
3) clear ; del ;;
4) clear ; renew;;
5) clear ; cek ;;
6) clear ; ceklim ;;
7) clear ; autodel ;;
8) clear ; autokill ;;
9) clear ; member ;;
10)clear ; cat /etc/log-create-ssh.log ;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press 0 for main menu" ; sleep 0 ; menu-ssh ;;
esac
