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
# ls related
if ! command -v eza &> /dev/null
then
	echo "\"eza\" is not installed. Falling back to \"ls\"."
	alias ls="ls --color=auto --group-directories-first"
	alias lsa="ls --almost-all"
	alias la="ls --almost-all"
	alias ll="la -l --human-readable --time-style=long-iso --file-type"
	alias l="la -g -G --human-readable --time-style=long-iso --file-type"
	alias l.="ls --directory .*"
elif ! command -v git &> /dev/null
then
	echo "\"git\" is not installed."
	alias ls="eza --classify --group-directories-first"
	alias lsa="eza --classify --all --group-directories-first"
	alias la="eza --classify --all --group-directories-first"
	alias ll="eza --long --header --group --classify --all --group-directories-first"
	alias l="eza --long --header --no-user --classify --all --group-directories-first"
	alias l.="eza --classify --group-directories-first --list-dirs .*"
else
	alias ls="eza --classify --group-directories-first"
	alias lsa="eza --classify --all --group-directories-first"
	alias la="eza --classify --all --group-directories-first"
	alias ll="eza --long --header --git --group --classify --all --group-directories-first"
	alias l="eza --long --header --git --no-user --classify --all --group-directories-first"
	alias l.="eza --classify --group-directories-first --list-dirs .*"
fi

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
alias vim="nvim"

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
function parse_git_dirty {
  [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ [\1$(parse_git_dirty)]/"
}

PS1="\[$GRAY\]\t \[$CYAN\]\w\[$RED\]\$(parse_git_branch)\[$RESET_COLOR\]\n> "
