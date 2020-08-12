#!/bin/bash

#yellow start 
	YS="\033[1;33m"
#blue start 
	BS="\033[0;34m"
#color end
	CE="\033[0m"
#red start
	RS="\033[1;31m"
#black start
	BLS="\033[0;30m"
#dark gray start
	DGYS="\033[1;30m"
#light blue start
	LBS="\033[1;34m"
#green start
	GNS="\033[0;32m"
#light green start
	LGNS="\033[1;32m"
#cyan start
	CYS="\033[0;36m"
#light cyan start
	LCYS="\033[1;36m"
#light red start
	DRS="\033[0;31m"
#purple start
	PS="\033[0;35m"
#light purple start
	LPS="\033[1;35m"
#brown start
	BRS="\033[0;33m"
#light gray start
	LGYS="\033[0;37m"
#white start
	WHS="\033[1;37m"
	
printf '\033]2;uninstall.sh\a'

if [[ $EUID -ne 0 ]]
then
   sleep 1
   echo -e "["$RS"*"$CE"] "$RS"This script must be run as root!"$CE"" 1>&2
   sleep 1
   exit
fi

{
chattr -i /dev/config
chattr -i /dev/config/config.txt
chattr -i /dev/config/configure.txt
} &> /dev/null

{
mkdir /dev/config
echo 0 >> /dev/config/config.txt
echo 1 >> /dev/config/configure.txt
} &> /dev/null

{
chattr +i /dev/config
chattr +i /dev/config/config.txt
chattr +i /dev/config/configure.txt
} &> /dev/null


{
SERSE="$( cat /dev/config/config.txt | head -n 1 )"
ESRES="$( cat /dev/config/configure.txt | head -n 1 )"
} &> /dev/null

if [[ "$SERSE" != "$ESRES" ]]
then

{
ASESR="$(ping -c 1 -q www.google.com >&/dev/null; echo $?)"
KEYEK="$( cat /etc/ehtools/root/service/ehtkey.txt )"
} &> /dev/null

if [[ "$ASESR" = 0 ]]
then 

KEYKE="$( timeout -s SIGTERM 40 curl "https://pastebin.com/raw/k8D7RBtC" 2>/dev/null )"

if [[ "$KEYEK" != "$KEYKE" ]]
then

sleep 1
echo -e "["$RS"*"$CE"] "$RS"Failed to open session for uninstall.sh!"$CE""

sleep 1
exit

fi

else
sleep 1
echo -e "["$RS"*"$CE"] "$RS"No Internet connection!"$CE""
sleep 1
exit
fi
fi

clear
CAT="$( cat /etc/ehtools/password )"
if [[ "$CAT" = "" ]]
then
clear
else
cd /root/ehtools/lib
chmod +x libdec
passcode="$(cat /root/ehtools/etc/.config)"
echo $passcode | ./libdec
logins="$(cat /etc/ehtools/login)"
cd /root/ehtools/lib
chmod +x libenc
passcode="$(cat /root/ehtools/etc/.config)"
echo $passcode | ./libenc
printf '\033]2;Ehtools Authentication\a'
echo -e "$YS"Ehtools Authentication:"$CE"

sleep 0.5
read -e -p $'(\033[4;93mlogin\033[0m\en)> ' loginer


while [ "$loginer" = "root" ]
do
sleep 0.5
echo -e "["$RS"*"$CE"] "$RS"Failed to open session for root!"$CE""
sleep 0.5
read -e -p $'(\033[4;93mlogin\033[0m\en)> ' loginer
done

while [ "$loginer" != "$logins" ]
do
echo -e "["$RS"*"$CE"] "$RS"Wrong login!"$CE""
sleep 3
sleep 0
read -e -p $'(\033[4;93mlogin\033[0m\en)> ' loginer

done

sleep 0.5
cd /root/ehtools/lib
chmod +x libdec
passcode="$(cat /root/ehtools/etc/.config)"
echo $passcode | ./libdec
passwords="$(cat /etc/ehtools/password)"
cd /root/ehtools/lib
chmod +x libenc
passcode="$(cat /root/ehtools/etc/.config)"
echo $passcode | ./libenc
read -s -p $'(\033[4;93mpassword\033[0m\en)> ' passworder
while [ "$passworder" != "$passwords" ]
do
echo -e
echo -e "["$RS"*"$CE"] "$RS"Wrong password!"$CE""
sleep 3
sleep 0
read -s -p $'(\033[4;93mpassword\033[0m\en)> ' passworder
done
fi

printf '\033]2;Uninstalling...\a'

{
              cd /root/ehtools/lib
	      chmod +x libunchattr
	      passcode="$(cat /root/ehtools/etc/.config)"
echo $passcode | ./libunchattr
	      cd /root/ehtools/lib
	      chmod +x libunconf
	      passcode="$(cat /root/ehtools/etc/.config)"
echo $passcode | ./libunconf
              cd /root/ehtools/lib
              chmod +x liunlogin
              passcode="$(cat /root/ehtools/etc/.config)"
echo $passcode | ./libunlogin
	      chattr -i /dev/config
              chattr -i /dev/config/config.txt
              chattr -i /dev/config/configure.txt
	      chattr -i /etc/ehtools/root/service
              chattr -i /etc/ehtools/root/service/late
              chattr -i /etc/ehtools/root/service/ehtkey.txt
              chattr -i /etc/ehtools/root/service/late/ehtkey.txt
	      rm /usr/share/applications/ehtools.desktop
	      rm /root/Desktop/ehtools.desktop
	      rm -rf /dev/config
	      rm -rf /root/ehtools
	      rm -rf /etc/ehtools
	      rm -rf /root/handshakes
	      rm -rf /root/wordlists
} &> /dev/null

echo -e
echo -e

function ProgressBar {

    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done

    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

                         
        
printf "\rUninstalling: [${_fill// /\#}${_empty// /-}] ${_progress}%%"

}


_start=1

_end=100

for number in $(seq ${_start} ${_end})
do
    sleep 0.2
    ProgressBar ${number} ${_end}
done

echo -e
echo -e
		echo -e "["$YS"inf"$CE"] "$YS"Done"$CE""
		sleep 2
		echo -e "Press "$YS"any key"$CE" to exit..."
		read
		clear
		exit
