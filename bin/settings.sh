#!/bin/bash

# Caps => Ctrl
echo $PASSWORD | sudo -S sed -ie '8s/""/"ctrl:nocaps"/g' /etc/default/keyboard

# touchpad
echo $PASSWORD | sudo -S echo 'blacklist i2c_hid' >> /etc/modprobe.d/blacklist.conf
depmod -a
update-initramfs -u

# backslash => underscore
echo $PASSWORD | sudo -S sed -ie '72s/backslash/underscore/g' /usr/share/X11/xkb/symbols/jp

# display suspend fix for nvidia-driver
echo $PASSWORD | sudo -S sed -i 's/quiet splash/quiet splash nonveau.modeset=0/g' /etc/default/grub
echo $PASSWORD | sudo grub-update
