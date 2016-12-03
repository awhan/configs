# if no target then create a regular symlink if target is a normal
# file. mv that file with same name + new suffix if target is a
# symlink then create a backup symlink that points to the old file but
# the name is a last name + new suffix

doit = ln -fsv --suffix=__$$(date +%F_%T) $(src) $(dst)

vimrc: src = $(realpath vim/vimrc)
vimrc: dst = ~/.vimrc
vimrc:
	$(doit)


bash_functions: src = $(realpath bash/bash_functions)
bash_functions: dst = ~/.bash_functions
bash_functions:
	$(doit)


bashrc: src = $(realpath bash/dot_bashrc)
bashrc:  dst = ~/.bashrc
bashrc:
	$(doit)


bash_aliases: src = $(realpath bash/bash_aliases)
bash_aliases: dst = ~/.bash_aliases
bash_aliases:
	$(doit)

h: bash/h.sh
	$(call myinstall, $(realpath $<), ~/.h.sh)

bash: bashrc bash_functions bash_aliases h


dotemacs: src := $(realpath emacs/dot_emacs)
dotemacs: dst := ~/.emacs
dotemacs:
	$(doit)


tmux: src := $(realpath tmux.conf)
tmux: dst := ~/.tmux.conf
tmux:
	$(doit)

print-%:
	echo $* = $($*)
