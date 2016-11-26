# if no target then create a regular symlink if target is a normal
# file. mv that file with same name + new suffix if target is a
# symlink then create a backup symlink that points to the old file but
# the name is a last name + new suffix

# doit=ln -fsv --suffix=__$$(date +%F_%T) $(realpath $^) $@

doit=ln -fsv --suffix=__$$(date +%F_%T) $(SRC) $(DEST)

# vimperatorrc: ~/.vimperatorrc
# ~/.vimperatorrc: vimperator/dot_vimperatorrc
# 	$(doit)

# vimrc: ~/.vimrc
# ~/.vimrc: vim/vimrc
# 	$(doit)


vimrc: SRC = $(realpath vim/vimrc)
vimrc: DST = ~/.vimrc
vimrc:
	$(doit)


bash_functions: SRC = $(realpath bash/bash_functions)
bash_functions:  DEST = ~/.bash_functions
bash_functions:
	$(doit)


bashrc: SRC = $(realpath bash/dot_bashrc)
bashrc:  DEST = ~/.bashrc
bashrc:
	$(doit)


bash_aliases: SRC = $(realpath bash/bash_aliases)
bash_aliases:  DEST = ~/.bash_aliases
bash_aliases:
	$(doit)


bash: bashrc bash_functions bash_aliases
