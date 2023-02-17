#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : JsPhantom
# (C) Copyright 2022
# =========================================
yell='\e[1;33m'
red='\e[1;31m'
P='\e[0;35m'
B='\033[0;36m'
G='\033[0;32m'
NC='\e[0m'
N='\e[0m'
clear
echo -e "\e[36m╔===========================================╗\033[0m"
echo -e " \e[0;35m                DNS CHANGER                \033[0m"
echo -e "\e[36m╚===========================================╝\033[0m
\033[0;32mDNS Changer By${NC} \e[1;33mJsPhantom\033[0m
\033[1;37mTelegram : https://t.me/JsPhantom / @JsPhantom\033[0m"
dnsfile="/root/dns"
if test -f "$dnsfile"; then
udns=$(cat /root/dns)
echo -e ""
echo -e "   Active DNS : \033[1;37m$udns\033[0m"
fi
 echo -e "[\033[1;36m•1 \033[0m]  \033[0;32mTemporary DNS\033[0m"
 echo -e "[\033[1;36m•2 \033[0m]  \033[0;32mPermanent DNS\033[0m"
 echo -e "[\033[1;36m•3 \033[0m]  \033[0;32mReset DNS To Default\033[0m"
 echo -e "[\033[1;36m•4 \033[0m]  \033[0;32mBack To Main Menu\033[0m"
echo ""
echo -e "\033[1;37mPress [ Ctrl+C ] • To-Exit-Script\033[0m"
echo ""
read -p "Select From Options [ 1 - 4 ] :  " dns
echo -e ""
case $dns in
1)
clear
echo -e "\033[1;37mTemporary DNS - Back To Default DNS After Rebooting VPS\033[0m"
echo ""
read -p "Please Insert DNS : " dns1
if [ -z $dns1 ]; then
echo ""
echo "Please Insert DNS !"
sleep 1
clear
dns
fi
rm /etc/resolv.conf
touch /etc/resolv.conf
echo "$dns1" > /root/dns
echo "nameserver $dns1" >> /etc/resolv.conf
systemctl restart resolvconf.service
echo ""
echo -e "\e[032;1mDNS $dns1 sucessfully insert in VPS\e[0m"
echo ""
cat /etc/resolv.conf
sleep 1
clear
dns
;;
2)
clear
echo ""
read -p "Please Insert DNS : " dns2
if [ -z $dns2 ]; then
echo ""
echo "Please Insert DNS !"
sleep 1
clear
dns
fi
rm /etc/resolv.conf
rm /etc/resolvconf/resolv.conf.d/head
touch /etc/resolv.conf
touch /etc/resolvconf/resolv.conf.d/head
echo "$dns2" > /root/dns
echo "nameserver $dns2" >> /etc/resolv.conf
echo "nameserver $dns2" >> /etc/resolvconf/resolv.conf.d/head
systemctl restart resolvconf.service
echo ""
echo -e "\e[032;1mDNS $dns2 sucessfully insert in VPS\e[0m"
echo ""
cat /etc/resolvconf/resolv.conf.d/head
sleep 1
clear
dns
;;
3)
clear
echo ""
read -p "Reset To Default DNS [Y/N]: " -e answer
if [ "$answer" = 'y' ] || [ "$answer" = 'Y' ]; then
rm /root/dns
echo ""
echo -e "[ ${G}INFO${NC} ] Delete Resolv.conf DNS"
echo "nameserver 8.8.8.8" > /etc/resolv.conf
sleep 1
echo -e "[ ${G}INFO${NC} ] Delete Resolv.conf.d/head DNS"
echo "nameserver 8.8.8.8" > /etc/resolvconf/resolv.conf.d/head
sleep 1
else if [ "$answer" = 'n' ] || [ "$answer" = 'N' ]; then
echo -e ""
echo -e "[ ${G}INFO${NC} ] Operation Cancelled By User"
sleep 1
fi
fi
clear
dns
;;
4)
clear
menu
;;
*)
echo "Please enter an correct number"
clear
dns
;;
esac
