#!/bin/bash

# essential
sudo aptitude -y install kde-plasma-desktop plasma-nm
sudo apt-get -y install kde-config-sddm kde-config-sddm
sudo apt-get -y install nvidia-driver firmware-misc-nonfree mesa-utils dev-essentials python-pip
sudo apt -y install ratbagd

# install packages
sudo apt-get -y install zsh firefox keepassxc qbitorrent guake vlc calibre neovim hplip thunderbird tree htop
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#==== add repository ====#
# Appimagelauncher
sudo add-apt-repository -y ppa:appimagelauncher-team/stable
# spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
# codium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

# === update repo === #
sudo apt-get update

sudo apt -y install codium
sudo apt-get -y install spotify-client

# Appimagelauncher
curl -sS https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
sudo dpkg -i appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
rm -f appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
# Slack
curl -sS https://downloads.slack-edge.com/releases/linux/4.23.0/prod/x64/slack-desktop-4.23.0-amd64.deb -o ~/Debian-stb/desktop-4.23.0-amd64.deb
sudo dpkg -i desktop-4.23.0-amd64.deb
rm -f desktop-4.23.0-amd64.deb
# lsd
curl -sS https://github.com/Peltoche/lsd/releases/download/0.21.0/lsd_0.21.0_amd64.deb -o ~/Debian-stb/lsd_0.21.0_amd64.deb
sudo dpkg -i lsd_0.21.0_amd64.deb
rm -f lsd_0.21.0_amd64.deb

# norminette
python3 -m pip install --upgrade pip setuptools
python3 -m pip install norminette

# qemu
sudo aptitude -y install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager
sudo systemctl start libvirtd.service
sudo virsh net-start default
sudo virsh net-autostart default
sudo virsh net-list --all
sudo adduser $USER libvirt
sudo adduser $USER libvirt-qemu

ln -s /media/stb47/nexus/Bibliothèque\ calibre .
ln -s /media/stb47/nexus/Bibliothèque\ lolo .
ln -s /media/stb47/nexus/Application .
ln -s /media/stb47/nexus/Photos Images/
ln -s /media/stb47/nexus/Wallpaper Images/
ln -s /media/stb47/nexus/Documents\ Administratifs Documents/
ln -s /media/stb47/nexus/Projects/ .

cp -fR /media/stb47/nexus/Linux-config/.* /home/stb47/

# closing
sudo apt-get update && sudo apt-get upgrade
sudo reboot
