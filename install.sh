#!/bin/bash

# System
sudo cp -a ./etc/. /etc/
sudo chown -R root:root /etc/
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Packages
sudo pacman -S $(cat pacman.txt)
yay -S $(cat aur.txt)
pacman -Qdtq | sudo pacman -Rns -

# User
cp -a ./home/. ~/
chsh -s /bin/fish

# Apache
sudo chmod 777 /srv/http

# MariaDB
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl start mysqld
sudo mariadb-secure-installation

# Rust
rustup default stable

# Folders
mkdir ~/.path
mkdir ~/Downloads
mkdir ~/Documents
mkdir ~/Projects
mkdir ~/Pictures
mkdir ~/Videos
mkdir ~/Music
