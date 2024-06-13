#!/bin/bash

# System
sudo cp -a ./etc/. /etc/
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo pacman -Syu

# Packages
sudo pacman -S $(cat pacman.txt)
yay -S $(cat yay.txt)
pacman -Qdtq | sudo pacman -Rns -

# User
cp -a ./home/. ~/
chsh -s /bin/fish

# Rust
rustup default stable

# Apache
sudo chmod 777 /srv/http

# MariaDB
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl start mysqld
sudo mariadb -u root -p"12345678"
sudo mariadb-secure-installation

# Folders
mkdir ~/.path
mkdir ~/Downloads
mkdir ~/Documents
mkdir ~/Projects
mkdir ~/Pictures
mkdir ~/Videos
