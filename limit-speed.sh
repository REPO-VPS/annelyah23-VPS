#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : JsPhantom
# (C) Copyright 2022
# =========================================
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
purple='\e[0;35m'
NC='\e[0m'
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(cat /home/limit)
NIC=$(ip -o $ANU -4 route show to default | awk '{print $5}');
function start () {
clear
echo -e "Limit Speed All Service"
read -p "Set maximum download rate (in Kbps): " down
read -p "Set maximum upload rate (in Kbps): " up
if [[ -z "$down" ]] && [[ -z "$up" ]]; then
echo > /dev/null 2>&1
else
echo "Start Configuration"
sleep 0.5
wondershaper -a $NIC -d $down -u $up > /dev/null 2>&1
systemctl enable --now wondershaper.service
echo "start" > /home/limit
echo "Done"
sleep 1
clear
menu
fi
}
function stop () {
clear
wondershaper -ca $NIC
systemctl stop wondershaper.service
echo "Stop Configuration"
sleep 0.5
echo > /home/limit
echo "Done"
sleep 1
clear
menu
}
if [[ "$cek" = "start" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
echo -e "\e[36m╔===========================================╗\033[0m"
echo -e " \e[0;35m            LIMIT BANDWITH SPEED            \033[0m"
echo -e "\e[36m╚===========================================╝\033[0m
\e[1;31mLimit Bandwith Speed${NC} \e[1;33mJsPhantom\033[0m
\033[1;37mTelegram : https://t.me/JsPhantom / @JsPhantom\033[0m"
echo ""
echo -e "   Status : $sts"
echo -e "[\033[1;36m•1 \033[0m]  ${NC}\e[0;32mStart Limit\033[0m"
echo -e "[\033[1;36m•2 \033[0m]  ${NC}\e[0;32mStop Limit\033[0m"
echo -e "[\033[1;36m•3 \033[0m]  ${NC}\e[0;32mBack To Main Menu\033[0m"
echo ""
echo -e " \033[1;37mPress [ Ctrl+C ] • To-Exit-Script\033[0m"
echo ""
read -rp "Select menu : " -e num
if [[ "$num" = "1" ]]; then
start
elif [[ "$num" = "2" ]]; then
stop
elif [[ "$num" = "3" ]]; then
menu
else
clear
echo " Please Enter The Correct Number!"
sleep 0.5
limit
fi
