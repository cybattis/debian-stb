#!/bin/bash

# Change Debian to SID Branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp source/sources.list /etc/apt/sources.list

username=$(id -u -n 1000)
builddir=$(pwd)

apt update && apt -y upgrade
apt install -y sudo
apt install -y util-linux
apt install unzip neofetch xorg curl aptitude wget fonts-firacode fonts-font-awesome fonts-hack -y
usermod -aG sudo $USER
echo "stb47 ALL=(ALL) NOPASSWD:ALL" | (EDITOR="tee -a" visudo)

cd $builddir
mkdir -p /home/$username/.config
cp -Rf dotfiles/.* /home/$username/
chown -R $username:$username /home/$username
