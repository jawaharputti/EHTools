#!/bin/bash

CE="\033[0m"
RS="\033[1;31m"
YS="\033[1;33m"
WHS="\033[1;37m"

printf '\033]2;install.sh\a'

if [[ $EUID -ne 0 ]]
then
   sleep 1
   echo -e "["$RS"*"$CE"] "$RS"This script must be run as root!"$CE"" 1>&2
   sleep 1
   exit
fi

{
ASESR="$(ping -c 1 -q www.google.com >&/dev/null; echo $?)"
} &> /dev/null
if [[ "$ASESR" != 0 ]]
then 
   sleep 1
   echo -e "["$RS"*"$CE"] "$RS"No Internet connection!"$CE""
   sleep 1
   exit
fi

clear

if [[ -d /root/ehtools ]]
then
sleep 0.5
else
if [[ -d /root ]]
then
cd /root
{
git clone https://github.com/entynetproject/ehtools.git
} &> /dev/null
cd /root/ehtools
chmod +x install.sh
cd /root/ehtools
else
mkdir /root
{
git clone https://github.com/entynetproject/ehtools.git
} &> /dev/null
cd /root/ehtools
chmod +x install.sh
cd /root/ehtools
fi
fi

clear
printf '\033]2;select ehtools\a'
sleep 3
echo -e "What version of Ehtools Framework you want to install?(\033[1;33mpro\033[0m/\033[1;33mlite\033[0m):"
echo -e "If you did not buy Ehtools Framework PRO, select \033[1;33mlite\033[0m!"
echo -e "If you bought Ehtools Framework PRO, select \033[1;33mpro\033[0m!"
read -e -p $'(\033[1;33mversion\033[0m)> ' CONFIGURATION

if [[ $CONFIGURATION = "pro" ]]
then

{
rm -rf /root/ehtools/etc/lite
rm /root/ehtools/install.sh
cp /root/ehtools/etc/pro/install.sh /root/ehtools
cp /root/ehtools/etc/pro/uninstall.sh /root/ehtools
chmod +x /root/ehtools/install.sh
rm -rf /root/ehtools/etc/pro
} &> /dev/null
cd /root/ehtools
./install.sh
exit
fi

cd /root/ehtools/etc
cp -r lite /root
cd /root
rm -rf ehtools
mv lite ehtools
cd /root/ehtools
chmod +x install.sh
./install.sh
exit
