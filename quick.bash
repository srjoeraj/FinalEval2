#!/bin/bash

sudo useradd -m scott100 -s /bin/bash
sudo usermod -aG sudo scott100
sudo echo "scott100:password" | chpasswd

sudo useradd -m scott106 -s /bin/bash
sudo usermod -aG sudo scott106
sudo echo "scott106:password" | chpasswd

sudo useradd -m scott72 -s /bin/bash
sudo usermod -aG sudo scott72
sudo echo "scott72:password" | chpasswd

sudo useradd -m scott98 -s /bin/bash
sudo usermod -aG sudo scott98
sudo echo "scott98:password" | chpasswd
