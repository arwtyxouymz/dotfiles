#!/bin/bash

# Caps => Ctrl
echo $PASSWORD | sudo -S sed -ie '8s/""/"ctrl:nocaps"/g' /etc/default/keyboard

# touchpad
echo $PASSWORD | sudo -S echo 'blacklist i2c_hid' >> /etc/modprobe.d/blacklist.conf
depmod -a
update-initramfs -u

# backslash => underscore
echo $PASSWORD | sudo -S sed -ie '72s/backslash/underscore/g' /usr/share/X11/xkb/symbols/jp

# display suspend fix for nvidia-driver => たぶんこれ違う
echo $PASSWORD | sudo -S sed -i 's/quiet splash/quiet splash nonveau.modeset=0/g' /etc/default/grub
echo $PASSWORD | sudo grub-update

# to more cool
echo $PASSWORD | sudo -S add-apt-repository ppa:papirus/papirus
echo $PASSWORD | sudo -S apt update && sudo apt -y install \
    gnome-tweak-tool
    papirus-icon-theme
    materia-gtk-theme

# nerd-fonts
git clone https://github.com/ryanoasis/nerd-fonts $HOME/.fonts/nerd-fonts
fc-cache -fv

# yarn install
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
echo $PASSWORD | sudo -S apt update && sudo apt -y install yarn
yarn global add bash-language-server yaml-language-server
