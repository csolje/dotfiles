# Path to your oh-my-zsh installation.
export ZSH="/home/chrs/.oh-my-zsh"

#ZSH_THEME="Soliah"
ZSH_THEME="juanghurtado"
#ZSH_THEME="amuse"
#ZSH_THEME="bira"
#ZSH_THEME="lambda-mod"


# The following lines were added by compinstall
autoload -U colors && colors  # Load colors
setopt autocd # Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+r:|[._-]=** r:|=** l:|=*'
zstyle ':completion:*' menu select #=1
#zstyle ':completion:*' preserve-prefix '//[^/]##/'
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' special-dirs true
zstyle :compinstall filename '$HOME/.zshrc'
zmodload zsh/complist

autoload -Uz compinit
compinit
_comp_options+=(globdots)		# Include hidden files.

# History in cache directory:
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
#function zle-keymap-select () {
#    case $KEYMAP in
#        vicmd) echo -ne '\e[1 q';;      # block
#        viins|main) echo -ne '\e[5 q';; # beam
#    esac
#}
#zle -N zle-keymap-select
#
#zle-line-init() {
#    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#    echo -ne "\e[5 q"
#}
#zle -N zle-line-init
#echo -ne '\e[5 q' # Use beam shape cursor on startup.
#preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
#
# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'


# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

COMPLETION_WAITING_DOTS="true"
# User configuration

export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/lib/snapd/snap/bin"
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
export COLORTERM="truecolor"
export TERMINAL="alacritty"
export TERM="xterm-256color"
export WM="i3wm"

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
alias la='ls -lhtra'
alias ls='ls --color=auto'
alias git='noglob git'
alias code='code-insiders'
alias cdc='cd ~/code'
alias codeenv='sh ~/bin/tmux.sh'
alias starwars='telnet towel.blinkenlights.nl'
alias weather='weatherfunc'
alias wallpaper='sh ~/bin/wallpaper.sh'
alias updateAWSCDK='sh ~/bin/update_awscdk.sh'
alias updateSSHShared='sh ~/bin/UpdateSSHShared.sh'
alias updateOMZSH='omz update'
alias pastebin='sh ~/bin/pastebin.sh'
alias awslogin='sh ~/bin/awslogin.sh'
alias fix_keyboard='sh ~/bin/keyboard.sh'
alias mount_nas='sh ~/bin/mount_nas.sh'
alias umount_nas='sh ~/bin/umount_nas.sh'
alias getexternalip='sh ~/bin/externalip.sh'
alias externalip='w3m -dump whatismyip.akamai.com'
alias screen_saving_on='xset +dpms'
alias screen_saving_off='xset -dpms'
alias home='autorandr -l home'
alias work='autorandr -l work'
alias sshp='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no'

# Dotfiles handeling
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config status.showUntrakedFiles no

## Vim stuff
alias vim='nvim'
alias v='nvim'
#alias vi='nvim'
#alias vV='vim ~/.vimrc'
alias vV='nvim ~/.config/nvim/init.vim'
alias cdn='cd ~/.config/nvim'

## Zsh Stuff
alias vZ='nvim ~/.zshrc'
alias reloadZ='source ~/.zshrc'

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
alias p='paru -S'
alias pac='sudo pacman -S'
alias pac-r='sudo pacman -Rcns'
alias pac-s='sudo pacman -Ss'
#alias Upgrade='sudo pacman -Syu'
alias Update='paru -Syu'
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


## Tmux and Byobu
alias tnew='tmux new -s'
alias tattach='tmux a -t'
alias b='byobu'

# Ensure DK modifiers
xmodmap ~/.Xmodmapus

# SSH-agent
if [ -z $SSH_AGENT_PID ] && [ -z $SSH_TTY ]; then  # if no agent & not in ssh
  eval `ssh-agent -s` > /dev/null
#  ssh-add -q ~/.ssh/*.pem
  ssh-add -q ~/.ssh/id_rsa
fi

export PATH=$PATH:~/.npm-global/bin:/usr/local/go/bin
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git archlinux vi-mode themes tmux zsh-completions colorize)
plugins=(git git-extras aws archlinux ansible branch fzf vi-mode npm node nmap themes colorize sudo tmux)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFUALT_OPS="--extended"
export FZF_BASE='/usr/bin/fzf'
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit
source $ZSH/oh-my-zsh.sh

# User configuration
for al in ${${${(0)"$(git config -z --get-regexp '^alias.')"}%%$'\n'*}#alias.}; do
  alias g$al="git $al"
done
function weatherfunc() {
    if [[ -z "$1" ]]
    then
        curl wttr.in
    else
        curl wttr.in/$1
    fi
}
. ~/bin/z.sh

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

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

alias luamake=/home/chrs/GitHub/lua-language-server/3rd/luamake/luamake

