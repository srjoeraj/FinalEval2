#!/bin/bash

# Check if ports were passed as arguments
if [ $# -ne 3 ]; then
    echo "Usage: $0 <apachePort> <mariadbPort> <sshPort>"
    exit 1
fi

apachePort=$1
mariadbPort=$2
sshPort=$3

# Update the system
sudo apt update

# Install the services
sudo apt install -y apache2 mariadb-server openssh-server

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

# Change SSH port
sudo sed -i "s/#Port 22/Port $sshPort/g" /etc/ssh/sshd_config

# Restart the services to apply changes
sudo systemctl restart apache2
sudo systemctl restart mariadb
sudo systemctl restart ssh

# Automate mysql_secure_installation
mysql_secure_installation <<EOF

y
password
password
y
y
y
y
EOF

# Setup a read only user in MariaDB and a new user on Ubuntu
mysql -u root -ppassword <<EOF
CREATE USER 'scott72'@'%' IDENTIFIED BY 'password';
GRANT SELECT ON *.* TO 'scott72'@'%';
FLUSH PRIVILEGES;
EOF

sudo adduser scott72 --gecos "Scott,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "scott72:password" | sudo chpasswd

echo "Script completed successfully!"
