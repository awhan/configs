all: bash

xresources:
	@./doit $(realpath Xresources) ~/.Xresources

bash: bashrc aliases functions

bashrc:
	@./doit $(realpath bashrc) ~/.bashrc

aliases:
	@./doit $(realpath aliases) ~/.aliases

functions:
	@./doit $(realpath functions) ~/.functions

tmux:
	@./doit $(realpath tmux.conf) ~/.tmux.conf

vimrc:
	@./doit $(realpath vimrc) ~/.vimrc

.PHONY: bashrc aliases functions
