#!/bin/bash
# Menu For Script
# Edition : Stable Edition V1.0
# Auther  : AWALUDIN FERIYANTO
# (C) Copyright 2021-2022 By LynzTmvn
# =========================================

# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'

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

# // Exporting URL Host
export Server_URL="autosc.me/aio"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="XdrgVPN"

# // Root Checking
if [ "${EUID}" -ne 0 ]; then
		echo -e "${EROR} Please Run This Script As Root User !"
		exit 1
fi

# // Exporting IP Address
export IP=$( curl -s https://ipinfo.io/ip/ )

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
xray=$( systemctl status xray | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $xray == "running" ]]; then
    status_xray="${GREEN}ON${NC}"
else
    status_xray="${RED}OFF${NC}"
fi


clear
clear
clear
clear
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m                     ⇱ INFORMASI VPS ⇲                        \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"

echo -e "Sever Uptime        = $( uptime -p  | cut -d " " -f 2-10000 ) "
echo -e "Current Time        = $( date -d "0 days" +"%d-%m-%Y | %X" )"
echo -e "Operating System    = $( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' ) ( $( uname -m) )"
echo -e "Current Domain      = $( cat /etc/xray/domain )"
echo -e "Server IP           = ${IP}"
echo -e "License Key Status  = AKTIF"
echo -e "License Issued to   = LynzTmvn"
echo -e "License Start       = ON TIME"
echo -e "License Limit       = Lifetime"

echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m                     ⇱ STATUS LAYANAN ⇲                       \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e " [ ${GREEN}SSH WebSocket${NC} : ${status_ws} ]     [ ${GREEN}XRAY${NC} : ${status_xray} ]      [ ${GREEN}NGINX${NC} : ${status_nginx} ]"
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m                     ⇱ MENU LAYANAN ⇲                         \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e " [${GREEN}01${NC}]${RED} •${NC} SSH-WS Manager  $NC   [${GREEN}08${NC}]${RED} • ${NC}Info Manager $NC"
echo -e " [${GREEN}02${NC}]${RED} •${NC} Vmess Manager    $NC  [${GREEN}09${NC}]${RED} • ${NC}Speedtest Manager $NC"
echo -e " [${GREEN}03${NC}]${RED} •${NC} Trojan Manager   $NC  [${GREEN}10${NC}]${RED} • ${NC}Ssws Manager $NC"
echo -e " [${GREEN}04${NC}]${RED} •${NC} Shdw Manager   $NC    [${GREEN}11${NC}]${RED} • ${NC}Change Banner $NC"
echo -e " [${GREEN}05${NC}]${RED} •${NC} Add Domain    $NC     [${GREEN}12${NC}]${RED} • ${NC}Cek Bandwith User Xray $NC"
echo -e " [${GREEN}06${NC}]${RED} •${NC} Running Service $NC   [${GREEN}13${NC}]${RED} • ${NC}BACKUP $NC"
echo -e " [${GREEN}07${NC}]${RED} •${NC} Certificate SSL $NC   [${GREEN}14${NC}]${RED} • ${NC}RESTORE DATA $NC"
echo -e " ${RED}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m                     ⇱ Lynz PROJECT ⇲                      \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"

echo -e ""

read -p "Select From Options [ 1 - 13 ] : " menu
case $menu in
1)
clear
ssh-menu
;;
2)
clear
v2ray-menu
;;
3)
clear
trojan-menu
;;
4)
clear
ssgrpc-menu
;;
5)
clear
add-host
;;
6)
clear
running
;;
7)
clear
crtv2ray
;;
8)
clear
about
;;
9)
clear
speedtest
;;
10)
clear
add-ssws
;;
11)
clear
banner
;;
12)
clear
running
;;
13)
clear
setmenu
;;
14)
reboot
exit
;;
*)
clear
menu
;;
esac
