# -*- mode:Shell-script -*-

# Check for an interactive session
[ -z "$PS1" ] && return

#source /usr/etc/profile.d/autojump.bash

source ~/.aliases
source ~/.functions

source /usr/share/git/completion/git-prompt.sh
TITLEBAR="\e]2\u@\h:\w\a"
PS1='\e]2\u@\h:\w\a\u@\h \w$(__git_ps1 " (%s)")\n\$ '
#PS1="[\u@\h \w$(__git_ps1 " (%s)")]$(tput sgr0)\n\$ "


#http://stackoverflow.com/questions/103944/real-time-history-export-amongst-bash-terminal-windows
#export PROMPT_COMMAND='history -a; history -n; history -w'
#export PROMPT_COMMAND="$PROMPT_COMMAND; history -a; history -n; history -w"
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="pwd:ls:cd:l:e:yy:yu"
export HISTSIZE=100000
export HISTFILESIZE=100000
HISTTIMEFORMAT='%F %T  '
shopt -s histappend
shopt -s dotglob
shopt -s extglob
shopt -s globstar
shopt -s checkwinsize

#export EDITOR=~/bin/e

PATH=$PATH:~/bin:/usr/local/MATLAB/R2011a/bin:~/.gem/ruby/2.0.0/bin

export LESSOPE='| src-hilite-lesspipe.sh %s'
export LESS=' -R'

#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/ap_root/lib

# vim: ft=sh syn=sh
