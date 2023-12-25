###################
##### .bashrc #####
###################

# VARIABLES
HISTSIZE=
HISTFILESIZE=
export EDITOR=nvim
export VISUAL=nvim

# Disable flow control and allow ctrl-s for history navigation (with ctrl-r)
stty -ixon

# Show auto-completion list automatically, without double tab
bind "set show-all-if-ambiguous on"

# Change the bell style to visual
bind "set bell-style visible"

# Make auto-completion ignore case
bind "set completion-ignore-case on"

### ALIASES ###
# vim related
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# ls related
if ! command -v exa &> /dev/null
then
	echo "\"exa\" is not installed. Falling back to \"ls\"."
	alias ls="ls --color=auto --group-directories-first"
	alias lsa="ls --almost-all"
	alias la="ls --almost-all"
	alias ll="la -l --human-readable --time-style=long-iso --file-type"
	alias l="la -g -G --human-readable --time-style=long-iso --file-type"
	alias l.="ls --directory .*"
elif ! command -v git &> /dev/null
then
	echo "\"git\" is not installed."
	alias ls="exa --classify --group-directories-first"
	alias lsa="exa --classify --all --group-directories-first"
	alias la="exa --classify --all --group-directories-first"
	alias ll="exa --long --header --group --classify --all --group-directories-first"
	alias l="exa --long --header --no-user --classify --all --group-directories-first"
	alias l.="exa --classify --group-directories-first --list-dirs .*"
else
	alias ls="exa --classify --group-directories-first"
	alias lsa="exa --classify --all --group-directories-first"
	alias la="exa --classify --all --group-directories-first"
	alias ll="exa --long --header --git --group --classify --all --group-directories-first"
	alias l="exa --long --header --git --no-user --classify --all --group-directories-first"
	alias l.="exa --classify --group-directories-first --list-dirs .*"
fi

# cd related
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

alias c="clear"
alias f="find . 2>/dev/null | grep " # Search files in the current folder
alias h="history | grep " # Search command line history
alias p="ps -o user,ppid,pid,cmd -A | grep " # Search running processes
alias r=". ranger"
alias lg="lazygit"

alias datef='date "+%A, %T %d.%m.%Y (%Z)"'
alias diskusage="du -h --max-depth=1 | sort -h -r"
alias lsip="ip -br -c address"
alias lsbd="lsblk --output HOTPLUG,RO,TYPE,FSTYPE,SIZE,MOUNTPOINTS,NAME,FSSIZE,FSAVAIL,FSUSED,FSUSE%"

alias myip="curl https://ifconfig.me/ip && echo"
alias myipcc="curl https://api.myip.com && echo"

# archive related
alias mktar="tar -cvf"
alias mkbz2="tar -cvjf"
alias mktgz="tar -cvzf"
alias untar="tar -xvf"
alias unbz2="tar -xvjf"
alias untgz="tar -xvzf"

# COLORS
RESET_COLOR="\033[m"

BLACK="\033[00;30m"
RED="\033[00;31m"
GREEN="\033[00;32m"
YELLOW="\033[00;33m"
BLUE="\033[00;34m"
PURPLE="\033[00;35m"
CYAN="\033[00;36m"
WHITE="\033[00;37m"

GRAY="\033[00;90m"
BRIGHTRED="\033[00;91m"
BRIGHTGREEN="\033[00;92m"
BRIGHTYELLOW="\033[00;93m"
BRIGHTBLUE="\033[00;94m"
BRIGHTPURPLE="\033[00;95m"
BRIGHTCYAN="\033[00;96m"
BRIGHTWHITE="\033[00;97m"

# PROMPT
function check_if_clean() {
	[[ $(git status 2> /dev/null | tail -n1) != *"working tree clean"* ]] && echo "*"
}

function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(check_if_clean)/"
}

PS1="\[$GREEN\]\u \[$GRAY\]at \[$CYAN\]\H \[$GRAY\]in \[$YELLOW\]\W\[$GRAY\]\$([[ -n \$(git branch 2>/dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$RESET_COLOR\]\n\$ > "
