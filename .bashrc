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
alias code='code-insiders'
alias cdc='cd ~/code'
#PS1='[\u@\h \W]\$ '

# Path
export PATH=$PATH:~/bin:/home/chrs/.local/bin/

# Aliases
alias vi='/usr/bin/vim'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ls='ls'
alias la='ls -alh'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

## Vim stuff
alias v='vim'
alias vV='vim ~/.vimrc'

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
## SSH alias
alias vsC='vim ~/.ssh/config'
alias vsK='vim ~/.ssh/known_hosts'

## Exit terminal
alias k='exit'

## Apps
alias reloadV='source ~/.vimrc'
alias reloadB='source ~/.bashrc'
alias irc='weechat-curses'
alias startkvm='wakeonlan 44:1e:a1:3b:78:66'
alias tor='ssh -L 8080:localhost:8080 odin'

## Tmux
alias t='tmux'
alias tn='tmux new -s'
alias ta='tmux a -t'

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
