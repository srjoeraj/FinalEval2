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
read -p "Enter your UID: " uid

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
echo "---> Partner's UID entered: $puid1"
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
echo "---> Partner's UID entered: $puid2"
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
echo "---> Partner's UID entered: $puid3"
echo "---> IP addrs of PC-$puid3: $paddr3"
echo "---> SSH port on PC-$puid3 is: $p3"

echo " "
read -rsn1 -p"Press Ctrl+D to exit if above input is incorrect. Else Press Enter.";echo




echo "------------------------------------------------------------------------------"
echo " "
ssh-copy-id -i /home/csn400/.ssh/key_$uid.pub -p $p1 -f scott$puid1@$paddr1
echo "SSH key 'key_$uid.pub' copied over to scott$puid1 at $paddr1"
read -rsn1 -p"Press any key to continue....";echo
echo " "
echo "------------------------------------------------------------------------------"

echo " "
ssh-copy-id -i /home/csn400/.ssh/key_$uid.pub -p $p2 -f scott$puid2@$paddr2
echo "SSH key 'key_$uid.pub' copied over to scott$puid2 at $paddr2"
read -rsn1 -p"Press any key to continue....";echo
echo " "
echo "------------------------------------------------------------------------------"

echo " "
ssh-copy-id -i /home/csn400/.ssh/key_$uid.pub -p $p3 -f scott$puid3@$paddr3
echo "SSH key 'key_$uid.pub' copied over to scott$puid3 at $paddr3"
read -rsn1 -p"Press any key to continue....";echo
echo " "
echo "------------------------------------------------------------------------------"





