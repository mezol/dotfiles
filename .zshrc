# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="fwalch"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

unsetopt BEEP

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
	alias l.="ls --color=auto --group-directories-first --directory .*"
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
