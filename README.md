# Install Command

```sh
$ curl -L raw.github.com/arwtyxouymz/dotfiles/master/install.sh | bash
```

or

```sh
$ wget -L raw.github.com/arwtyxouymz/dotfiles/master/install.sh | bash
```
then

```sh
$ open code-signing.webarchive
```
and follow the instructions.


after that

```sh
$ chmod +x $HOME/dotfiles/Setup.sh
$ sh $HOME/dotfiles//Setup.sh
```

## ssh key-gen

```sh
$ mkdir -p $HOME/.ssh && cd $HOME/.ssh
$ ssh-keygen -t rsa
$ pbcopy < ~/.ssh/id_rsa.pub
```

## upgrade neovim module of system python
```sh
$ sudo /System/Library/Frameworks/Python.framework/Versions/2.7/bin/python -m easy_install -U neovim
```

## Install cuDNN

Access [cuDNN download page](https://developer.nvidia.com/rdp/form/cudnn-download-survey).
Then Download
- cuDNN Runtime Library
- cuDNN Developer Library
- cuDNN Code Samples and User Guide

After that, install these `.deb` packages via `dpkg` command.
