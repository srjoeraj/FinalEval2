#!/bin/bash
echo " "
echo " █████╗ ██████╗ ██████╗  ██████╗ ██╗    ██╗   ██████╗  █████╗ ███████╗██╗  ██╗";
echo "██╔══██╗██╔══██╗██╔══██╗██╔═══██╗██║    ██║   ██╔══██╗██╔══██╗██╔════╝██║  ██║";
echo "███████║██████╔╝██████╔╝██║   ██║██║ █╗ ██║   ██████╔╝███████║███████╗███████║";
echo "██╔══██║██╔══██╗██╔══██╗██║   ██║██║███╗██║   ██╔══██╗██╔══██║╚════██║██╔══██║";
echo "██║  ██║██║  ██║██║  ██║╚██████╔╝╚███╔███╔╝██╗██████╔╝██║  ██║███████║██║  ██║";
echo "╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚══╝╚══╝ ╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝";
echo "                                                                              ";
echo " "
echo "Made by srjoeraj for CSN400 Final Evaluation 2"
echo " "
echo "Note: I am not responsible if this script falls in the hands of wrong people."
echo "Note: The script does not do validation checks!!. I am lazy, did not wanna waste my time."
echo "		That propably is a good thing ;)"
echo "------------------------------------------------------------------------------"
echo " "
echo " Please take a snapshot of your vm before running this script!!!."
read -p " Press 'Y' if snapshot taken or 'N' : " ans

if [ "$ans" != "Y" ]; then
	echo " "
	echo "Please take a snapshot and rerun the script. "
	echo " "
	
	exit
fi
echo " "
echo "------------------------------------------------------------------------------"
echo " "
read -p "Enter your uid: " uid

ssh-keygen -f /home/csn400/.ssh/key_$uid -q -N ""

echo "SSH key key_$uid generated"
echo " "
echo "------------------------------------------------------------------------------"

echo " "
read -p "Enter ip address for Partner1 : " paddr1
read -p "Enter ssh port on $puid1 : " p1
puid1=$(echo "$paddr1" | cut -d '.' -f 3)
echo " "
echo "Please confirm the below information: "
echo "---> Partner's uid entered: $puid1"
echo "---> IP addrs of PC-$puid1: $paddr1"
echo "---> SSH port on PC-$puid1 is: $p1"

echo " "
read -rsn1 -p"Press Ctrl+D to exit if above input is incorrect. Else Press Enter.";echo

echo "------------------------------------------------------------------------------"

echo " "
read -p "Enter ip address for Partner2 : " paddr2
read -p "Enter ssh port on $puid3 : " p2
puid2=$(echo "$paddr2" | cut -d '.' -f 3)
echo " "
echo "Please confirm the below information: "
echo "---> Partner's uid entered: $puid2"
echo "---> IP addrs of PC-$puid2: $paddr2"
echo "---> SSH port on PC-$puid2 is: $p2"

echo " "
read -rsn1 -p"Press Ctrl+D to exit if above input is incorrect. Else Press Enter.";echo


echo "------------------------------------------------------------------------------"

echo " "
read -p "Enter ip address for Partner3 : " paddr3
read -p "Enter ssh port on $puid3 : " p3
puid3=$(echo "$paddr3" | cut -d '.' -f 3)
echo " "
echo "Please confirm the below information: "
echo "---> Partner's uid entered: $puid3"
echo "---> IP addrs of PC-$puid3: $paddr3"
echo "---> SSH port on PC-$puid3 is: $p3"

echo " "
read -rsn1 -p"Press Ctrl+D to exit if above input is incorrect. Else Press Enter.";echo




echo "------------------------------------------------------------------------------"
echo " "
ssh-copy-id -i /home/csn400/.ssh/key_$uid.pub -p $p1 -f scott$uid@$paddr1
echo "SSH key 'key_$uid.pub' copied over to scott$uid at $paddr1"
read -rsn1 -p"Press any key to continue....";echo
echo " "
echo "------------------------------------------------------------------------------"

echo " "
ssh-copy-id -i /home/csn400/.ssh/key_$uid.pub -p $p2 -f scott$uid@$paddr2
echo "SSH key 'key_$uid.pub' copied over to scott$uid at $paddr2"
read -rsn1 -p"Press any key to continue....";echo
echo " "
echo "------------------------------------------------------------------------------"

echo " "
ssh-copy-id -i /home/csn400/.ssh/key_$uid.pub -p $p3 -f scott$uid@$paddr3
echo "SSH key 'key_$uid.pub' copied over to scott$uid at $paddr3"
read -rsn1 -p"Press any key to continue....";echo
echo " "
echo "------------------------------------------------------------------------------"




echo " "
echo " ██▓ ██▓███  ▄▄▄█████▓ ▄▄▄       ▄▄▄▄    ██▓    ▓█████   ██████ ";
echo "▓██▒▓██░  ██▒▓  ██▒ ▓▒▒████▄    ▓█████▄ ▓██▒    ▓█   ▀ ▒██    ▒ ";
echo "▒██▒▓██░ ██▓▒▒ ▓██░ ▒░▒██  ▀█▄  ▒██▒ ▄██▒██░    ▒███   ░ ▓██▄   ";
echo "░██░▒██▄█▓▒ ▒░ ▓██▓ ░ ░██▄▄▄▄██ ▒██░█▀  ▒██░    ▒▓█  ▄   ▒   ██▒";
echo "░██░▒██▒ ░  ░  ▒██▒ ░  ▓█   ▓██▒░▓█  ▀█▓░██████▒░▒████▒▒██████▒▒";
echo "░▓  ▒▓▒░ ░  ░  ▒ ░░    ▒▒   ▓▒█░░▒▓███▀▒░ ▒░▓  ░░░ ▒░ ░▒ ▒▓▒ ▒ ░";
echo " ▒ ░░▒ ░         ░      ▒   ▒▒ ░▒░▒   ░ ░ ░ ▒  ░ ░ ░  ░░ ░▒  ░ ░";
echo " ▒ ░░░         ░        ░   ▒    ░    ░   ░ ░      ░   ░  ░  ░  ";
echo " ░                          ░  ░ ░          ░  ░   ░  ░      ░  ";
echo "                                      ░                         ";
echo " "

read -p "Enter fist and last digit of your uid: " port

read -p "Enter partner 1 first and last digit uid: " x1
read -p "Enter partner 2 first and last digit uid: " x2
read -p "Enter partner 3 first and last digit uid: " x3

echo "#!/bin/bash" > iptables_$uid.bash
echo "#Author: srjoeraj" >> iptables_$uid.bash
echo " " >> iptables_$uid.bash

echo "iptables -F" >> iptables_$uid.bash


echo "iptables -X" >> iptables_$uid.bash
echo "iptables -t nat -F" >> iptables_$uid.bash

echo " " >> iptables_$uid.bash

echo 'iptables -P INPUT DROP' >> iptables_$uid.bash
echo 'iptables -P FORWARD DROP' >> iptables_$uid.bash
echo 'iptables -P OUTPUT ACCEPT' >> iptables_$uid.bash

echo " "
echo 'iptables -N SSH-ACCEPT' >> iptables_$uid.bash
echo 'iptables -N APACHE-ACCEPT' >> iptables_$uid.bash
echo 'iptables -N MARIADB-ACCEPT' >> iptables_$uid.bash
echo " "  >> iptables_$uid.bash
echo "iptables -A INPUT -p tcp -m state --state NEW --dport 22$port -j SSH-ACCEPT" >> iptables_$uid.bash
echo "iptables -A INPUT -p tcp -m state --state NEW --dport 88$port -j APACHE-ACCEPT" >> iptables_$uid.bash
echo "iptables -A INPUT -p tcp -m state --state NEW,ESTABLISHED --dport 33$port -j MARIADB-ACCEPT" >> iptables_$uid.bash

echo "iptables -A INPUT -p tcp -m state --state NEW,RELATED,ESTABLISHED --sport 22$x1 -j ACCEPT" >> iptables_$uid.bash
echo "iptables -A INPUT -p tcp -m state --state NEW,RELATED,ESTABLISHED --sport 22$x2 -j ACCEPT" >> iptables_$uid.bash
echo "iptables -A INPUT -p tcp -m state --state NEW,RELATED,ESTABLISHED --sport 22$x3 -j ACCEPT" >> iptables_$uid.bash
echo "iptables -A INPUT -p tcp -m state --state NEW,RELATED,ESTABLISHED --sport 88$x2 -j ACCEPT" >> iptables_$uid.bash
echo "iptables -A INPUT -p tcp -m state --state NEW,RELATED,ESTABLISHED --sport 88$x3 -j ACCEPT" >> iptables_$uid.bash
echo "iptables -A INPUT -p tcp -m state --state NEW,RELATED,ESTABLISHED --sport 88$x1 -j ACCEPT" >> iptables_$uid.bash
echo "iptables -A INPUT -p tcp -m state --state NEW,RELATED,ESTABLISHED --sport 3306 -j ACCEPT" >> iptables_$uid.bash
echo " " >> iptables_$uid.bash
echo 'iptables -A INPUT -j LOG --log-prefix " INPUT-DROP"' >> iptables_$uid.bash
echo 'iptables -A SSH-ACCEPT -j LOG --log-prefix " SSH-ACCEPTED"' >> iptables_$uid.bash
echo 'iptables -A SSH-ACCEPT -j ACCEPT' >> iptables_$uid.bash
echo " " >> iptables_$uid.bash
echo 'iptables -A APACHE-ACCEPT -j LOG --log-prefix " APACHE-ACCEPTED"' >> iptables_$uid.bash
echo 'iptables -A APACHE-ACCEPT -j ACCEPT' >> iptables_$uid.bash
echo " "  >> iptables_$uid.bash
echo 'iptables -A MARIADB-ACCEPT -j LOG --log-prefix " MARIADB-ACCEPTED"' >> iptables_$uid.bash
echo 'iptables -A MARIADB-ACCEPT -j ACCEPT'>> iptables_$uid.bash
echo " " >> iptables_$uid.bash
echo "iptables -t nat -A PREROUTING -p tcp --dport 3306 -j REDIRECT --to-port 33$port" >> iptables_$uid.bash
echo " " >> iptables_$uid.bash
echo "iptables -I INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT" >> iptables_$uid.bash

echo "------------------------------------------------------------------------------"
echo "Run the iptables_UID.bash script!"
echo "------------------------------------------------------------------------------"
