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

SERSE="$( cat /dev/config/config.txt | head -n 1 )"
ESRES="$( cat /dev/config/configure.txt | head -n 1 )"

if [[ "$SERSE" != "$ESRES" ]]
then

ASESR="$(ping -c 1 -q google.com >&/dev/null; echo $?)"

if [[ "$ASESR" = 0 ]]
then 

clear

cd /root/ehtools/lib
chmod +x libactiv
passcode="$(cat /root/ehtools/etc/.config)"
./libactiv

if [[ -f /etc/ehtools/root/service/late/ehtkey.txt ]]
then

EHTKEY="$( cat /etc/ehtools/root/service/late/ehtkey.txt )"
sleep 1

else
exit
fi

else
sleep 1
echo -e "["$RS"*"$CE"] "$RS"No Internet connection!"$CE""
sleep 1
exit
fi
fi

printf '\033]2;install.sh\a'

clear
chmod +x /root/ehtools/eht/eht1
chmod +x /root/ehtools/eht/eht2
chmod +x /root/ehtools/eht/eht3
chmod +x /root/ehtools/eht/eht21
chmod +x /root/ehtools/eht/eht31
chmod +x /root/ehtools/bin/ehtools
chmod +x /root/ehtools/eht/eht4
chmod +x /root/ehtools/eht/eht41
chmod +x /root/ehtools/eht/eht42
chmod +x /root/ehtools/eht/eht43
chmod +x /root/ehtools/dev/dev1
chmod +x /root/ehtools/dev/dev2
chmod +x /root/ehtools/dev/dev21
chmod +x /root/ehtools/uninstall.sh
chmod +x /root/ehtools/bin/ehtmod
chmod +x /root/ehtools/bin/ehtkey
chmod +x /root/ehtools/bin/ehtconsole
chmod +x /root/ehtools/bin/ehtapp
chmod +x /root/ehtools/bin/epasswd
cd /root/ehtools
cp /root/ehtools/bin/ehtools /bin
chmod +x /bin/ehtools
cp /root/ehtools/bin/ehtkey /bin
chmod +x /bin/ehtkey
cp /root/ehtools/bin/ehtapp /bin
chmod +x /bin/ehtapp
cp /root/ehtools/bin/epasswd /bin
chmod +x /bin/epasswd
cp /root/ehtools/bin/ehtmod /bin
chmod +x /bin/ehtmod
cp /root/ehtools/etc/root/password /etc/ehtools/root
mkdir /etc/ehtools/app
cp /root/ehtools/app/ehtools.png /etc/ehtools/app
mkdir /etc/ehtools/ehtoold
cp /root/ehtools/bin/ehtconsole /etc/ehtools/ehtoold
chmod +x /etc/ehtools/ehtoold/ehtconsole

clear
if [[ ! -d /root/handshakes ]]
then
	mkdir /root/handshakes
	sleep 0
else
	sleep 0
fi
if [[ ! -d /root/wordlists ]]
then
	mkdir /root/wordlists
	sleep 0
else
	sleep 0
fi
clear
printf '\033]2;install.sh\a'
sleep 3
echo -e "What desktop shell do you use?"
echo -e
echo -e ""$YS"1"$CE") Gnome"
echo -e ""$YS"2"$CE") Xfce"
echo -e ""$YS"3"$CE") KDE"
echo -e
read -e -p $'(\033[4;93mdesktop\033[0m\en)> ' xdesk

if [[ $xdesk = "1" ]]
then
{
chattr -i /etc/ehtools
mkdir /etc/ehtools/xdesktop
echo "gnome-terminal" >> /etc/ehtools/xdesktop/config.txt
chattr +i /etc/ehtools
} &> /dev/null

elif [[ $xdesk = "2" ]]
then
{
chattr -i /etc/ehtools
mkdir /etc/ehtools/xdesktop
echo "xfce4-terminal" >> /etc/ehtools/xdesktop/config.txt
chattr +i /etc/ehtools
} &> /dev/null

elif [[ $xdesk = "3" ]]
then
{
chattr -i /etc/ehtools
mkdir /etc/ehtools/xdesktop
echo "konsole" >> /etc/ehtools/xdesktop/config.txt
chattr +i /etc/ehtools
} &> /dev/null
fi

clear
printf '\033]2;install.sh\a'
sleep 3
echo -e "Do you want to install ehtools modules now?(\033[1;33myes\033[0m/\033[1;33mno\033[0m):"
echo -e "So without thinking install them now!"
echo -e "Only use 'yes' for the best way!"
read -e -p $'(\033[4;93minstall\033[0m\en)> ' UORI

if [[ "$UORI" = "no" ]]
then 
	clear
	echo -e "OK..."
	sleep 1
	echo -e "To install ehtools modules, run '"$YS"ehtmod -i"$CE"'"
	sleep 3
	clear
        
elif [[ "$UORI" = "yes" ]]
then
      clear
      echo -e "OK..."
      sleep 1
      echo -e "Please wait..."
      sleep 1
      echo -e "Launching..."
      sleep 1
      ehtmod -i
fi

clear
printf '\033]2;install.sh\a'
sleep 3
echo -e "Do you want to protect ehtools with password?(\033[1;33myes\033[0m/\033[1;33mno\033[0m):"
echo -e "This function will protect ehtools with login and password!"
echo -e "So without thinking protect ehtools now!"
echo -e "Only use 'yes' for the best way!"
read -e -p $'(\033[4;93mprotect\033[0m\en)> ' WQE


if [[ "$WQE" = "no" ]]
then
clear
	echo -e "OK..."
	sleep 1
	echo -e "To protect ehtools, run '"$YS"epasswd"$CE"'"
	touch /etc/ehtools/login
        touch /etc/ehtools/password
        sleep 3
	clear
fi

if [[ "$WQE" = "yes" ]]
then
if [[ -f /etc/ehtools/login ]]
then
sleep 0
else
clear
printf '\033]2;install.sh\a'
sleep 3
echo -e "Set ehtools login and password!"
echo -e "Ehtools Password Protection:"

sleep 0.5
read -e -p $'(\033[4;93m(new)login\033[0m\en)> ' logins
while [ "$logins" = "root" ]
do
sleep 0.5
echo -e "["$RS"*"$CE"] "$RS"This user is reserved by the ehtools system!"$CE""
sleep 0.5
read -e -p $'(\033[4;93m(new)login\033[0m\en)> ' logins
done

echo $logins >> /etc/ehtools/login

sleep 0.5
read -s -p $'(\033[4;93m(new)password\033[0m\en)> ' passwords

echo $passwords >> /etc/ehtools/password

cd /root/ehtools/lib
chmod +x liblogin
passcode="$(cat /root/ehtools/etc/.config)"
echo $passcode | ./liblogin

cd /root/ehtools/lib
chmod +x libchattr
passcode="$(cat /root/ehtools/etc/.config)"
echo $passcode | ./libchattr


echo -e
echo -e

printf '\033]2;Configuring...\a'

function ProgressBar {

    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done

    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

                         
        
printf "\rConfiguring: [${_fill// /\#}${_empty// /-}] ${_progress}%%"

}


_start=1

_end=100

for number in $(seq ${_start} ${_end})
do
    sleep 0.2
    ProgressBar ${number} ${_end}
done

sleep 5
fi
fi

clear
printf '\033]2;install.sh\a'
sleep 3
echo -e "Create your ehtools config key for "$YS"/etc/ehtools/.config"$CE""
echo -e "The ehtools config key is intended to protect ehtools boot!"
echo -e "It is recommended to create a strong ehtools config key!"
read -e -p $'(\033[4;93mconfig_key\033[0m\en)> ' DADI
if [[ "$DADI" = "" ]]
then
sleep 0
else
{
rm /root/ehtools/etc/.config
} &> /dev/null
echo $DADI >> /root/ehtools/etc/.config
fi

cd /root/ehtools/lib
chmod +x libconf
passcode="$(cat /root/ehtools/etc/.config)"
echo $passcode | ./libconf

if [[ "$(cat /etc/ehtools/login)" = "" ]]
then
sleep 0
else
cd /root/ehtools/lib
chmod +x libenc
passcode="$(cat /root/ehtools/etc/.config)"
echo $passcode | ./libenc
fi

clear
printf '\033]2;install.sh\a'
sleep 3
echo -e "Do you want to create ehtools application(\033[1;33myes\033[0m/\033[1;33mno\033[0m):"
echo -e "This will allow you to run ehtools via the application!"
echo -e "Ehtools application will be created in the applications!"
read -e -p $'(\033[4;93mcreate\033[0m\en)> ' ES

if [[ "$ES" = "yes" ]]
then
cp /root/ehtools/app/ehtools.desktop /usr/share/applications
chmod +x /usr/share/applications/ehtools.desktop
fi

if [[ "$ES" = "no" ]]
then
clear
	echo -e "OK..."
	sleep 1
	echo -e "To create ehtools application, run '"$YS"ehtapp -c"$CE"'"
        sleep 3
fi


clear
printf '\033]2;install.sh\a'
sleep 3
echo -e "Open a NEW terminal and type '"$YS"ehtools"$CE"' to launch the framework"
sleep 0.5
echo -e "If you want to configure ehtools application, run '"$YS"ehtapp"$CE"'"
sleep 0.5
echo -e "If you want to change ehtools config key, run '"$YS"ehtkey"$CE"'"
sleep 0.5
echo -e "If you want to configure ehtools modules, run '"$YS"ehtmod"$CE"'"
sleep 0.5
echo -e "If you want to change ehtools password, run '"$YS"epasswd"$CE"'"
sleep 1
exit
