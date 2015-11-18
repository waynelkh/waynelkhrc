# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="powerline-modified"
ZSH_THEME="half-life"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
 DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

export PATH=$PATH":/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/usr/local/mysql/bin:/Users/waynelkh/gradle/bin:/Users/waynelkh/android-sdks/tools"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git-flow tmux brew osx node npm nvm sublime composer zsh-syntax-highlighting zsh-autosuggestions docker docker-compose)

source $ZSH/oh-my-zsh.sh

# Enable autosuggestions automatically.
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init
# User configuration
DEFAULT_USER="waynelkh"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export ANDROID_HOME=/Users/waynelkh/android-sdks/

#let man page colorful
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


# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias l='colourify ls -lhp'
alias ll='colourify ls -lhAp'
unalias la
unalias lsa
alias linux="mosh wnlee@linux4.cs.nctu.edu.tw"
alias bsd="ssh wnlee@bsd4.cs.nctu.edu.tw"
alias scplinux='tmpfun(){ scp -r wnlee@linux4.cs.nctu.edu.tw:~/myFile/$1 ./ };tmpfun'
alias delds='sudo find . -name .DS_Store -exec rm {} \; '
alias cctunnel='ssh -NC -D 127.0.0.1:19999 wnlee@linux4.cs.nctu.edu.tw'
alias wintunnel='ssh -NC -D 127.0.0.1:19999 wnlee@pc.wnlee.xyz'
alias vim='/usr/local/bin/vim'

# nvm
export NODE_PATH=/usr/local/lib/node_modules
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
