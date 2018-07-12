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

## To install library to system python
```sh
$ ~/Library/Python/2.7/bin/pip2.7 install --user
```
