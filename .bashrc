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

# Functions
wttr() {
  local request="wttr.in/${1-Copenhagen}"
  [ " $(tput cols)" -lt 125 ] && request+='?n'
  curl -H "Accept-Language: ${LANG%_*}" --compressed "$request"
}


# Export settings
export EDITOR="nvim"
export PAGER="less"
export BROWSER="qutebrowser"
export BROWSERCLI="w3m"
export MOVPLAY="mpv"
export PICVIEW="feh"
export SNDPLAY="mpv"
export PULSE_LATENCY_MSEC=60
export COLORTERM="truecolor"
export TERMINAL="alacritty"
export TERM="xterm-256color"
export WM="i3wm"

# Aliases
alias vi='/usr/bin/nvim'
alias ls='ls'
alias la='ls -lhtra'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color=auto'
alias code='code-insiders'
alias cdc='cd ~/code'
alias codeenv='sh ~/bin/tmux.sh'
alias updateSSHShared='sh ~/bin/sshSharedUpdate.sh'
alias pastebin='sh ~/bin/pastbin.sh'
alias awslogin='sh ~/bin/awslogin.sh'
alias fix_keyboard='sh ~/bin/keyboard.sh'
alias weather='curl wttr.in'
alias wallpaper='sh ~/bin/wallpaper.sh'
alias mount_nas='sh ~/bin/mount_nas.sh'
alias umount_nas='sh ~/bin/umount_nas.sh'
alias getexternalip='sh ~/bin/externalip.sh'
alias externalip='w3m -dump whatismyip.akamai.com'

#alias ssh='kitty +kitten ssh'

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
#  ssh-add -q ~/.ssh/*.pem
  ssh-add -q ~/.ssh/id_rsa
fi

source <(kitty + complete setup bash)
# Kubernetes / k8s
# source <(kubectl completion bash)
# alias k8c='kubectl'
# alias kctl='kubectl'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
