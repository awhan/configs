# specs

# no output target is to be produced just linked with the source, we
# will take care of timestamps using the .ts hack

# want to name all the rules - i don't want to say "make ~/.vimrc", i
# would much prefer an easier name like "make vimrc"

# i don't want to type too much or repeat target and prereqs names all
# over the makefile, i want make to do a lot of things for me.

# basic idea is this: take a rule such as follows:
# <target>: <source>
# which is basically a map from source to targets and then come up with a new rule
# name: <target>.ts
# <target>.ts: <source>

# I am not there yet but this will have to do for now

all: vim bash tmux emacs

# vim
vim: vimrc

vimrc: ~/.vimrc.ts
~/.vimrc.ts: vim/vimrc


# bash
bash: bashrc bash.functions bash.aliases

bashrc: ~/.bashrc.ts
~/.bashrc.ts: bash/bashrc

bash.functions: ~/.bash.functions.ts
~/.bash.functions.ts: bash/bash.functions

bash.aliases: ~/.bash.aliases.ts
~/.bash.aliases.ts: bash/bash.aliases

# tmux
tmux: ~/.tmux.conf.ts
~/.tmux.conf.ts: tmux.conf


# emacs
emacs: dot.emacs

dot.emacs: ~/.emacs.ts
~/.emacs.ts: emacs/dot.emacs


# general recipe
%.ts:
	ln -fsv --suffix=__$$(date +%F_%T) $(realpath $<) $*
	touch $@


print-%:; echo $* = $($*)

