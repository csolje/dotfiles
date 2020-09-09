#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export OSH=/home/chrs/.oh-my-bash

#OSH_THEME="modern"
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

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

# Path
export PATH=$PATH:~/bin:/home/chrs/.local/bin/

# Aliases
alias vi='/usr/bin/vim'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Autocomplete
source  /usr/share/bash-complete-alias/complete_alias 
complete -F _complete_alias config

# History
export HISTSIZE=10000
export HISTTIMEFORMAT='%F %T - '
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend

# Default apps
export TERMINAL=urxvt
export VISUAL=vim
export EDITOR=vim
export BROWSER=firefox

# Lang
export LANG=en_US.UTF-8
export GDM_LANG=en_US.UTF-8

# SSH-agent
if [ -z $SSH_AGENT_PID ] && [ -z $SSH_TTY ]; then  # if no agent & not in ssh
  eval `ssh-agent -s` > /dev/null
fi

# Kubernetes / k8s
# source <(kubectl completion bash)
# alias k8c='kubectl'
# alias kctl='kubectl'
