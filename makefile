all:

emacs:
	@./doit $(realpath emacs) ~/.emacs

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

vifmrc:
	@./doit $(realpath dot-vifm/vifmrc) ~/.vifm/vifmrc


.PHONY: bashrc aliases functions emacs vifmrc
