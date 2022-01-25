#!/bin/bash

# Change Debian to SID Branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp source/sources.list /etc/apt/sources.list
cp source/sources.list.d/* /etc/apt/sources.list.d/

username=$(id -u -n 1000)
builddir=$(pwd)

apt update
apt install fonts-firacode fonts-font-awesome fonts-hack unzip neofetch git xorg sudo curl aptitude wget util-linux -y
usermod -aG sudo $USER
echo "stb47 ALL=(ALL) NOPASSWD:ALL" | (EDITOR="tee -a" visudo)

cd $builddir
mkdir -p /home/$username/.config
cp -Rf dotfiles/.* /home/$username/
cp -Rf dotfiles/nvim /home/$username/.config
chown -R $username:$username /home/$username

sudo mkdir -p /media/stb47/nexus
echo "# data drive
UUID=207585614243FC99 /media/stb47/nexus   ntfs    defaults        0       0" | tee -a /etc/fstab
mount -a
