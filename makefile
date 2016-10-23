# if no target then create a regular symlink if target is a normal
# file. mv that file with same name + new suffix if target is a
# symlink then create a backup symlink that points to the old file but
# the name is a last name + new suffix

doit=ln -fsv --suffix=__$$(date +%F_%T) $(realpath $^) $@

vimperatorrc: ~/.vimperatorrc
~/.vimperatorrc: vimperator/dot_vimperatorrc
	$(doit)

vimrc: ~/.vimrc
~/.vimrc: vim/vimrc
	$(doit)
