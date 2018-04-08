#!/bin/bash

set -e

echo "Updating and Upgrading apt................"
sudo apt update && sudo apt upgrade -y

echo "Create Symbolic Links .............."
sh ./SymLink.sh

echo "Installing packages for linuxbrew................"
sudo apt install -y build-essential curl file git python-setuptools

echo "Cloning the LinuxBrew................"
git clone https://github.com/Linuxbrew/brew.git ${HOME}/.linuxbrew

echo "Adding the PATH to ~/.bash_profile"
if [ ! -e ${HOME}/.bash_profile ]; then
    touch ${HOME}/.bash_profile
fi

echo export PATH='$HOME/.linuxbrew/bin:$PATH' >> ~/.bash_profile
echo export MANPATH='$HOME/.linuxbrew/share/man:$PATH' >> ~/.bash_profile
echo export INFOPATH='$HOME/.linuxbrew/share/info:$PATH' >> ~/.bash_profile
echo export XDG_DATA_DIRS='$HOME/.linuxbrew/share:$PATH' >> ~/.bash_profile


echo "rebooting bash....."
exec $SHELL -l

echo "LinuxBrew Setup Finished!"


# This is GUI Setup
echo "GUI Setting is Start!"

###### Ubuntu Theme #######
# Theme change tool
echo "Installing Theme Change Tool .................."
sudo apt install -y unity-tweak-tool

# Flat design theme
echo "Installing Flat Design Theme .................."
sudo add-apt-repository ppa:dyatlov-igor/materia-theme
sudo apt update
sudo apt install materia-gtk-theme

###### Icom Theme ######
echo "Installing Icon Theme .................."
sudo add-apt-repository ppa:papirus/papirus
sudo apt update
sudo apt install papirus-icon-theme

###### Dock #######
echo "Installing Dock Theme .................."
sudo apt install -y plank
plank --preference

###### Spotlight ########
echo "Installing Spotlight Theme .................."
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo apt update
sudo apt install -y albert

echo "GUI Setup Finished!"


###### Installing the Packages ########
echo "Installing the Packages"
echo "Tapping the homebrew/bundle"
brew tap homebrew/bundle

echo "Installing fomulas by using Budle .........."
brew bundle --file=~/Brewfile

