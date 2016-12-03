DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*) bin
EXCLUSIONS := .DS_Store .git .gitmodules .travis.yml
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

.DEFAULT_GOAL := help

all:

list: ## Show dot files in this repo
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

deploy: ## Create symlink to home directory
	@echo '==> Start deploy dotfiles'
	@echo ''
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@echo ''
	@echo '==> End deploy dotfiles'

link_brewfile:
	@echo '==> Start link brewfile'
	@echo ''
	@ln -sfnv $(abspath _brewfile) $(HOME)/.brewfile
	@echo ''
	@echo '==> End link brewfile'

unlink_brewfile:
	@echo '==> Start unlink brewfile'
	@echo ''
	@rm -vrf $(HOME)/.brewfile
	@echo ''
	@echo '==> End unlink brewfile'

clean: ## Remove the dot files and this repo
	@echo '==> Start clean dotfiles'
	@echo ''
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)
	@echo ''
	@echo '==> End clean dotfiles'

help:
	@echo '==> Start unlink brewfile'
	@echo ' - deploy'
	@echo ' - clean'
	@echo ' - link_brewfile'
	@echo ' - unlink_brewfile'
