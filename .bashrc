export OSH=/home/chrs/.oh-my-bash

#OSH_THEME="mbriggs"
OSH_THEME="slick"

competions=(
	git
	composer
	ssh
)
aliases=(
	general
	chmod
	ls
	misc
)
plugins=(
	git
	bashmarks
	aws
	ansible
	npm
)
source $OSH/oh-my-bash.sh

#PS1='[\u@\h \W]\$ '

# Path
export PATH=$PATH:~/bin:/home/chrs/.local/bin/

# Aliases
alias vi='/usr/bin/vim'
alias ls='ls'
alias la='ls -alh'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color=auto'
alias code='code-insiders'
alias cdc='cd ~/code'
alias sshSharedUpdate='sh ~/bin/sshSharedUpdate.sh'
alias ssh='kitty +kitten ssh'

# Dotfiles handeling
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config status.showUntrakedFiles no

## Vim stuff
alias vim='nvim'
alias v='nvim'
#alias vi='nvim'
#alias vV='vim ~/.vimrc'
alias vV='nvim ~/.config/nvim/init.vim'

## Zsh Stuff
alias vZ='vim ~/.zshrc'
alias nvZ='nvim ~/.zshrc'
alias Z='source ~/.zshrc'

## Bash Stuff
alias vB='vim ~/.bashrc'
alias vP='vim ~/.bash_profile'

## Configurations
alias vi3C='vim ~/.config/i3/config'
alias vi3S='vim ~/.config/i3/status.toml'
alias gitconfig='vim ~/.gitconfig'

## SSH alias
alias vsC='vim ~/.ssh/config'
alias vsK='vim ~/.ssh/known_hosts'

## Exit terminal
alias k='exit'

## Apps
alias reloadV='source ~/.vimrc'
alias reloadB='source ~/.bashrc'

## Tmux
alias t='tmux'
alias tn='tmux new -s'
alias ta='tmux a -t'

# Ensure DK modifiers
xmodmap ~/.Xmodmapus

# Autocomplete
source  /usr/share/bash-complete-alias/complete_alias
complete -F _complete_alias config

# History
export HISTSIZE=10000
export HISTFILESIZE=$HISTSIZE
export HISTTIMEFORMAT='%F %T - '
export HISTCONTROL=ignoredups:erasedups
#shopt -s histappend

# Default apps
export TERMINAL=st
export VISUAL=vim
export EDITOR=vim
export BROWSER=firefox

# Lang
export LANG=en_US.UTF-8
export GDM_LANG=en_US.UTF-8

# X Terminal titles
#case "$TERM" in
#	xterm*|rxvt*|st-*)
#		PROMPT_COMMAND='echo -ne "\033]0;${USER}@{HOSTNAME}: ${PWD}\007"'
#		;;
#	*)
#		;;
#esac

# SSH-agent
if [ -z $SSH_AGENT_PID ] && [ -z $SSH_TTY ]; then  # if no agent & not in ssh
  eval `ssh-agent -s` > /dev/null
  ssh-add -q ~/.ssh/*.pem
  ssh-add -q ~/.ssh/id_rsa
fi

source <(kitty + complete setup bash)
# Kubernetes / k8s
# source <(kubectl completion bash)
# alias k8c='kubectl'
# alias kctl='kubectl'
