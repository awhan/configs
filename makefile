all:

emacs:
	@install -m 0600 --suffix="_backup_$$(date +%F_%T)" -v -- dot_emacs ~/.emacs


xresources:
	@install -m 0600 --suffix="_backup_$$(date +%F_%T)" -v -- xresources ~/.Xresources


bash: bashrc aliases functions


bashrc:
	@install -m 0600 --suffix="_backup_$$(date +%F_%T)" -v -- bashrc ~/.bashrc


aliases:
	@install -m 0600 --suffix="_backup_$$(date +%F_%T)" -v -- aliases ~/.aliases


functions:
	@install -m 0600 --suffix="_backup_$$(date +%F_%T)" -v -- functions ~/.functions


tmux:
	@install -m 0600 --suffix="_backup_$$(date +%F_%T)" -v -- tmux.conf ~/.tmux.conf


vimrc:
	@install -m 0600 --suffix="_backup_$$(date +%F_%T)" -v -- vim/vimrc ~/.vimrc


vifmrc:
	@install -D -m 0600 --suffix="_backup_$$(date +%F_%T)" -v -- vifm/vifmrc ~/.vifm/vifmrc


inputrc:
	@install -m 0600 --suffix="_backup_$$(date +%F_%T)" -v -- inputrc ~/.inputrc


xkbmap:
	@install -m 0600 --suffix="_backup_$$(date +%F_%T)" -v -- Xkbmap ~/.Xkbmap


.PHONY: bashrc aliases functions emacs vifmrc inputrc xresources
