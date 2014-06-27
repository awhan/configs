# -*- mode:Shell-script -*-

# Check for an interactive session
[ -z "$PS1" ] && return

#source /usr/etc/profile.d/autojump.bash

# Set some colors
BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'
NC='\e[0m' # No Color
und='\e[4m' # underline
nrm='\e[0m' # normal

source ~/.aliases
source ~/.functions

source /usr/share/git/completion/git-prompt.sh
#PS1="$\u@\h:\w$GREEN]]$NC\n\$"
PS1='[\u@\h \w$(__git_ps1 " (%s)")]\n\$ '


#http://stackoverflow.com/questions/103944/real-time-history-export-amongst-bash-terminal-windows
#export PROMPT_COMMAND='history -a; history -n; history -w'
#export PROMPT_COMMAND="$PROMPT_COMMAND; history -a; history -n; history -w"
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="pwd:ls:cd:l:e:yy:yu"
export HISTSIZE=50000
export HISTFILESIZE=50000
shopt -s histappend
shopt -s dotglob
shopt -s extglob
shopt -s globstar
shopt -s checkwinsize

export EDITOR=~/bin/e

PATH=$PATH:~/bin:/opt/MATLAB/R2011a/bin:~/.gem/ruby/2.0.0/bin

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/ap_root/lib

