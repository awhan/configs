all: bash

bash: bashrc aliases functions

bashrc:
	@./doit $(realpath bashrc) ~/.bashrc

aliases:
	@./doit $(realpath aliases) ~/.aliases

functions:
	@./doit $(realpath functions) ~/.functions


.PHONY: bashrc aliases functions
