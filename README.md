## ssh key-gen
```sh
$ mkdir -p $HOME/.ssh && cd $HOME/.ssh
$ ssh-keygen -t rsa
$ pbcopy < ~/.ssh/id_rsa.pub
```

## Nvidia GPU graphic settings

```bash
# nouveauの確認
$ lsmod | grep -i nouveau
# もしあったら/etc/modprobe.d/blacklist-nouveau.confに以下を追記
blacklist nouveau
options nouveau modeset=0
# その後
$ sudo update-initramfs -u
# 再起動
```
Then, install cuda
```
# /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nvidia.NVreg_EnableBacklightHandler=1"
# その後
$ sudo update-grub
```

## Keyboard

### caps => ctrl
```
# /etc/default/keyboard
XKBMODEL="pc105"
XKBLAYOUT="jp"
XKBVARIANT=""
XKBOPTIONS="ctrl:nocaps"

BACKSPACE="guess"

```
### backslash => underscore

```diff
# /usr/share/X11/xkb/symbols/jp
-key <AB11> { [ backslash, underscore] };
+key <AB11> { [ underscore, underscore] };
```

## Touchpad

```bash
# /etc/modprobe.d/blacklist.conf
blacklist i2c_hid
$ depmod -a
$ update-initramfs -u
```


## Install cuDNN

Access [cuDNN download page](https://developer.nvidia.com/rdp/form/cudnn-download-survey).
Then Download
- cuDNN Runtime Library
- cuDNN Developer Library
- cuDNN Code Samples and User Guide

After that, install these `.deb` packages via `dpkg` command.
