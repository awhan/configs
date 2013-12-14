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

source /usr/share/git/completion/git-prompt.sh
#PS1="$\u@\h:\w$GREEN]]$NC\n\$"
PS1='[\u@\h \w$(__git_ps1 " (%s)")]\n\$ '

alias l='ls --color=always'
alias lrt='\ls --color=always -1rt'

alias m='mplayer'
alias win='rdesktop -u m win -a 16 -k en-us -f &'
alias v='vim'

alias yy='sudo pacman --color=always -Syy'
alias yu='sudo pacman --color=always -Syu'
alias ss='pacman --color=always -Ss'
alias q='pacman --color=always -Q'
alias qi='pacman --color=always -Qi'
alias qo='pacman --color=always -Qo'
alias ql='pacman --color=always -Ql'
alias qm='pacman --color=always -Qm'

# Display information about a given package in the repositories
#Display information about a package (e.g. size, dependencies) in the repositories: 
alias si='pacman --color=always -Si'
alias r='sudo pacman --color=always -R'

alias val='valgrind -v --leak-check=full --show-reachable=yes --track-origins=yes'
alias ..='cd ..'

# safety features
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias ln='ln -i'

alias cls='clear && tmux clearhist'
alias sb='. ~/.bashrc'
alias eb='e ~/.bashrc'
alias ee='e ~/.emacs'

# copy pwd
alias cpd='pwd|xsel'
alias cdd='cd "$(xsel)"'

#export EDITOR="emacsclient --alternate-editor=emacs --no-wait +%l %f"
#http://emacs-fu.blogspot.com/2009/02/emacs-daemon.html
#export EDITOR='emacsclient -n -c -a ""'

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

#function e()
#{
 #   # i was advised to not use $*
 #   emacs --maximized "$@" &
#}

# http://www.thegeekstuff.com/2010/05/bash-shell-special-parameters/#more-4383
# To access the whole list of positional parameters, the two special
# parameters $* and $@ are available. Outside of double quotes, these
# two are equivalent: Both expand to the list of positional parameters
# starting with $1 (separated by spaces).

# Within double quotes, however, they differ: $* within a pair of double
# quotes is equivalent to the list of positional parameters, separated
# by the first character of IFS “$1c$2c$3…”.

# $@ within a pair of double quotes is equivalent to the list of
# positional parameters, separated by unquoted spaces, i.e., “$1″
# “$2″..”$N”.


#alias xfig='xfig -specialtext -latexfonts -startlatexFont default'

#$_ Gives the last argument to the previous command. At the shell
#startup, it gives the absolute filename of the shell script being
#executed.
mkcd() { mkdir -p "$@" && cd "$_"; }

proxy() {
    echo -n "password:"
    read -es pass
    export all_proxy="http://$1:$pass@$2"
}


man() {
    env \
	LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	LESS_TERMCAP_md=$(printf "\e[1;31m") \
	LESS_TERMCAP_me=$(printf "\e[0m") \
	LESS_TERMCAP_se=$(printf "\e[0m") \
	LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	LESS_TERMCAP_ue=$(printf "\e[0m") \
	LESS_TERMCAP_us=$(printf "\e[1;32m") \
	man "$@"
}

sanitize() {
    local x="$1"
    x="${x//[^[:alnum:]]/ }"
    x="${x##+([[:space:]])}"    # trim leading whitespace
    x="${x%%+([[:space:]])}"    # trim trailing whitespace
    x="${x//+([[:space:]])/_}"  # space(s) to underscore
    x="${x,,}"  # lower case
    echo "$x"
}


fix() {
    # http://mywiki.wooledge.org/BashSheet#Parameter_Operations
    # http://mywiki.wooledge.org/BashFAQ/030
    # extglob is needed

    # problems
    # filename is file.tar.gz
    # c++ in the filename

    echo "old :: $1"

    # extension
    # if no extension is found then ${1##*.} expands so "$1" Refer http://mywiki.wooledge.org/BashFAQ/073
    local fix_ext="${1##*.}"
    fix_ext="$(sanitize "$fix_ext")"

    # filename
    local fix_fn="${1%.*}"                 
    fix_fn="$(sanitize "$fix_fn")";

    if [[ $fix_fn == $fix_ext ]];
    then
        # no extension
        local fix_newname="$fix_fn"
    else
        # has extension
        fix_newname="$fix_fn.$fix_ext"
    fi
    
    echo "new :: $fix_newname"
    
    read -p 'change name (y/n)? '
    if [[ $REPLY == y ]];
    then
        mv -iv "$1" "$fix_newname"
    fi
}

#function show()
#{
#	b=$(echo $1 | tr "[:lower:]" "[:upper:]")
#	echo ${b^^*}
#}

# thanks to prince_jammys on #bash
show() { declare -p "${1^^}"; }

#export ALTERNATE_EDITOR=emacs EDITOR="emacsclient -n" VISUAL="emacsclient -n"
#export EDITOR="emacsclient -n -a \"\""
#export EDITOR="emacsclient -a\"\""
#export ALTERNATE_EDITOR="emacs --eval '(server-start)' $* &"


#alias e='emacsclient --no-wait --alternate-editor ~/.emacs.d/start.sh'

#export EDITOR='emacsclient --alternate-editor ~/.emacs.d/start.sh'
#export ALTERNATE_EDITOR='emacs -mm'
#export EDITOR="emacsclient -n --alternate-editor=emacs" 

export EDITOR=~/bin/e

# find files
ff()
{
    local p
    local a
    for p in "${@:2}"; do a+=( -iname "*$p*" ); done
    find "$1" "${a[@]}" 
}

# http://phraktured.net/config/.bashrc
function findf() { find . -type f -iname '*'$*'*' -ls; }


today () { \date +%Y_%m_%d; }
now () { \date +%H_%M_%S; }
datetime () { \date +%Y_%m_%d_%H_%M_%S; }

backnew() {
    backnew_filename=$(basename $@)
    #echo $backnew_filename_$(today)
    if [[ -f $@ ]]; then
        cp -piv $@ /home/m/pacnew/"$backnew_filename"_$(today)
    else
        echo "not found"
    fi

    if [[ -f $@.pacnew ]]; then
        cp -piv $@.pacnew /home/m/pacnew/"$backnew_filename".pacnew_$(today)
    else
        echo ".pacnew not found"
    fi
}

ytdl () {
    youtube-dl --title --no-mtime --no-overwrites \
        --restrict-filenames --continue --format 18 "$1" ;
}

# change software cursor in virtual terminal
#echo -e '\033[?17;0;64c'

#eval "$(fasd --init auto)"

PATH=$PATH:~/bin:/opt/MATLAB/R2011a/bin:~/.gem/ruby/2.0.0/bin

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/ap_root/lib

findsort () {
    find . -iname "$1" -printf '%T@ \t %p\n'
}

