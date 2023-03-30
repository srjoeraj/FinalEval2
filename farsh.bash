#!/bin/bash
echo " "
echo "███████╗ █████╗ ██████╗ ███████╗██╗  ██╗   ██████╗  █████╗ ███████╗██╗  ██╗";
echo "██╔════╝██╔══██╗██╔══██╗██╔════╝██║  ██║   ██╔══██╗██╔══██╗██╔════╝██║  ██║";
echo "█████╗  ███████║██████╔╝███████╗███████║   ██████╔╝███████║███████╗███████║";
echo "██╔══╝  ██╔══██║██╔══██╗╚════██║██╔══██║   ██╔══██╗██╔══██║╚════██║██╔══██║";
echo "██║     ██║  ██║██║  ██║███████║██║  ██║██╗██████╔╝██║  ██║███████║██║  ██║";
echo "╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝";
echo "                                                                           ";
echo "Made by ArshCodes20 for CSN400 Final Evaluation 2. "
echo "Modified by srjoeraj."
echo " "
echo "Note: I am not responsible if this script falls in the hands of wrong people."
echo "Note: The script does not do validation checks!!. I am lazy, did not wanna waste my time."
echo "          That propably is a good thing ;)"
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

# Check if ports were passed as arguments
if [ $# -ne 4 ]; then
    echo "Usage: $0 <apachePort> <mariadbPort> <sshPort> <username>"
    exit 1
fi

apachePort=$1
mariadbPort=$2
sshPort=$3
username=$4

# Update the system
sudo apt update

# Install the services
sudo apt install -y apache2 mariadb-server openssh-server vim

# Enable and start the services
sudo systemctl enable apache2
sudo systemctl start apache2

sudo systemctl enable mariadb
sudo systemctl start mariadb

sudo systemctl enable ssh
sudo systemctl start ssh

# Change Apache2 port
sudo sed -i "s/Listen 80/Listen $apachePort/g" /etc/apache2/ports.conf
sudo sed -i "s/:80/:$apachePort/g" /etc/apache2/sites-enabled/000-default.conf

# Change MariaDB port
if grep -q "^port" /etc/mysql/mariadb.conf.d/50-server.cnf; then
    sudo sed -i "s/^port\s*=\s*[0-9]*/port = $mariadbPort/" /etc/mysql/mariadb.conf.d/50-server.cnf
else
    echo -e "\n[mysqld]\nport = $mariadbPort" | sudo tee -a /etc/mysql/mariadb.conf.d/50-server.cnf > /dev/null
fi

# mysql secure installation duh..
mysql_secure_installation <<EOF

n
y
password
password
n
y
n
n
n
EOF

# allowing remote mariadb connections
sudo sed -i "s/= 127.0.0.1/= 0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf


# Change SSH port
sudo sed -i "s/#Port 22/Port $sshPort/g" /etc/ssh/sshd_config

# Restart the services to apply changes
sudo systemctl restart apache2
sudo systemctl restart mariadb
sudo systemctl restart ssh


# Apache web page
sudo chown csn400:csn400 /var/www/html/index.html
echo "<h1>$username</h1>" > /var/www/html/index.html


sudo useradd -m 


# Create the new user
useradd -m $username -s /bin/bash

# Set the user's password
echo  "$username:password" | chpasswd 

# Add the user to the wheel group
usermod -aG sudo $username

echo "User '$username' created and added to the sudo group."

# Setup a read only user in MariaDB and a new user on Ubuntu
mysql -u root -ppassword <<EOF
CREATE USER '$username'@'%' IDENTIFIED BY 'password';
GRANT SELECT ON *.* TO '$username'@'%';
FLUSH PRIVILEGES;
EOF
echo " "
echo "┌─┐┌─┐┌┬┐┌─┐┬  ┌─┐┌┬┐┌─┐┬┬";
echo "│  │ ││││├─┘│  ├┤  │ ├┤ ││";
echo "└─┘└─┘┴ ┴┴  ┴─┘└─┘ ┴ └─┘oo";

