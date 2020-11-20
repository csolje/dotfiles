# Path to your oh-my-zsh installation.
export ZSH="/home/chrs/.oh-my-zsh"

#ZSH_THEME="Soliah"
ZSH_THEME="juanghurtado"

#POWERLINE_RIGHT_A="date"
#POWERLINE_RIGHT_A="exit-status"
#POWERLINE_FULL_CURRENT_PATH="true"
#POWERLINE_SHOW_GIT_ON_RIGHT="true"
POWERLINE_DETECT_SSH="true"
POWERLINE_DATE_FORMAT="%D{%d-%m}"
POWERLINE_HIDE_HOST_NAME="true"
POWERLINE_DETECT_SSH="true"
POWERLINE_GIT_CLEAN="✔"
POWERLINE_GIT_DIRTY="✘"
POWERLINE_GIT_ADDED="%F{green}✚%F{black}"
POWERLINE_GIT_MODIFIED="%F{blue}✹%F{black}"
POWERLINE_GIT_DELETED="%F{red}✖%F{black}"
POWERLINE_GIT_UNTRACKED="%F{cyan}✭%F{black}"
POWERLINE_GIT_RENAMED="➜"
POWERLINE_GIT_UNMERGED="═"

# The following lines were added by compinstall

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+r:|[._-]=** r:|=** l:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' special-dirs true
zstyle :compinstall filename '/home/chrs/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=9000
SAVEHIST=9000
bindkey -v
# End of lines configured by zsh-newuser-install

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

COMPLETION_WAITING_DOTS="true"
# User configuration

export PATH="~/bin:/home/chrs/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# Export settings
export EDITOR="nvim"
export PAGER="less"
export BROWSER="qutebrowser"
export BROWSERCLI="w3m"
export MOVPLAY="mpv"
export PICVIEW="feh"
export SNDPLAY="mpv"
export PULSE_LATENCY_MSEC=60
export TERM="xterm-256color"
#export TERM="st"

# File Extensions
for ext in html org php com net no;    do alias -s $ext=$BROWSER; done
for ext in txt tex py PKGBUID;        do alias -s $ext=$EDITOR; done
for ext in png jpg gif;            do alias -s $ext=$PICVIEW; done
for ext in mpg wmv avi mkv;        do alias -s $ext=$MOVPLAY; done
for ext in wav mp3 ogg;            do alias -s $ext=$SNDPLAY; done

## Alias
#alias vi='/usr/bin/vim'
alias vi='nvim'
alias ls='ls'
alias la='ls -alh'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color=auto'
alias git='noglob git'
alias code='code-insiders'
alias cdc='cd ~/code'
alias codeenv='sh ~/bin/tmux.sh'
alias UpdateSSHShared='sh ~/bin/UpdateSSHShared.sh'
alias starwars='telnet towel.blinkenlights.nl'
alias weather='curl wttr.in'
alias wallpaper='sh ~/bin/wallpaper.sh'
alias updateAWSCDK='sh ~/bin/update_awscdk.sh'
alias pastebin='sh ~/bin/pastebin.sh'
alias awslogin='sh ~/bin/awslogin.sh'
alias fix_keyboard='sh ~/bin/keyboard.sh'


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
alias vZ='nvim ~/.zshrc'
alias reloadZ='source ~/.zshrc'
alias reloadV='source ~/.config/nvim/init.vim'

## Bash Stuff
alias vB='nvim ~/.bashrc'
alias vP='nvim ~/.bash_profile'

## Configurations
alias vi3C='nvim ~/.config/i3/config'
alias vi3S='nvim ~/.config/i3/i3status.conf'
#alias vi3S='vim ~/.config/i3/status.toml'
alias gitconfig='nvim ~/.gitconfig'

## SSH alias
alias vsC='nvim ~/.ssh/config'
alias vsK='nvim ~/.ssh/known_hosts'

## Navigation
alias cdc='cd ~/code'
alias cdI='cd ~/.config/i3'

# Exit terminal
alias k='exit'

## Net
alias NM='sudo /etc/init.d/NetworkManager restart'
alias yt="youtube-dl --add-metadata -ic" # Downloads video link
alias yta="youtube-dl --add-metadata -xic" # Downloads only audio

## Pacman
alias y='yay'
alias p='sudo pacman'
alias pac='sudo pacman -S'
alias pac-r='sudo pacman -Rcns'
alias pac-s='sudo pacman -Ss'
#alias Upgrade='sudo pacman -Syu'
alias Update='sudo pacman -Syu'
alias Sync='sudo pacman -Syy'
alias pacLog='tail -f /var/log/pacman.log'
alias Unlock='sudo rm /var/lib/pacman/db.lck'

## Apps
alias irc='weechat-curses'
alias r='ranger'

## News and Music
alias MP='ncmpcpp'
alias news='newsbeuter'
alias M='mpv'

# SSH Tunnels
alias ryper='ssh -fNR 7777:localhost:22 tunnel@ryper.org'


## Tmux
alias tnew='tmux new -s'
alias tattach='tmux a -t'

# Ensure DK modifiers
xmodmap ~/.Xmodmapus

# SSH-agent
if [ -z $SSH_AGENT_PID ] && [ -z $SSH_TTY ]; then  # if no agent & not in ssh
  eval `ssh-agent -s` > /dev/null
  ssh-add -q ~/.ssh/*.pem
  ssh-add -q ~/.ssh/id_rsa
fi

# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git archlinux vi-mode themes tmux zsh-completions colorize)
plugins=(git aws archlinux ansible vi-mode npm node nmap themes colorize)
source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

# User configuration
for al in ${${${(0)"$(git config -z --get-regexp '^alias.')"}%%$'\n'*}#alias.}; do
  alias g$al="git $al"
done



# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
