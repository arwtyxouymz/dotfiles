DOTPATH        := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOT_CANDIDATES := $(wildcard .??*)
EXCLUSIONS     := .DS_Store .git .gitignore .github .config
DOTFILES       := $(filter-out $(EXCLUSIONS), $(DOT_CANDIDATES))
CONFIG_DIRS    := $(wildcard .config/*)

all: install

help:
	@echo "make list         #=> Show dotfiles in this repo"
	@echo "make deploy       #=> Create symlink to home directory"
	@echo "make init         #=> Setup environment settings"
	@echo "make test         #=> Test dotfiles and init scripts"
	@echo "make update       #=> Fetch changes for this repo"
	@echo "make install      #=> Run make update, deploy, and init"
	@echo "make clean        #=> Remove the dotfiles and this repo"

list:
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)
	@$(foreach val, $(CONFIG_DIRS), /bin/ls -dF $(val);)

deploy:
	@echo 'Copyright (c) 2019-2020 arwtyxouymz All Rights Reserved.'
	@echo '==> Start to deploy dotfiles to home directory'
	@echo ''
	@$(foreach val, $(DOTFILES), ln -snfv $(abspath $(val)) $(HOME)/$(val);)
	@$(foreach val, $(CONFIG_DIRS), ln -snfv $(abspath $(val)) $(HOME)/$(val);)

init:
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/init/init.sh

test:
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/test/test.sh

update:
	git pull origin master

install: update deploy init
	@exec $$SHELL

clean:
	@echo "Remove dotfiles in your home directory ....."
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)
	-rm -rf $(DOTPATH)
