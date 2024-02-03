[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/bin/z.sh
source ~/.zsh_profile
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/lib/snapd/snap/bin"
export PATH=$PATH:~/.npm-global/bin:/usr/local/go/bin:~/.emacs.d/bin/
export PATH=$PATH:~/.cargo/bin
export FZF_DEFUALT_OPS="--extended"
export FZF_BASE='/usr/bin/fzf'
export FZF_DEFAULT_COMMAND='fd --type f --type d --type l'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fpath=(~/.zsh $fpath)

# The following lines were added by compinstall
autoload -U colors && colors  # Load colors
setopt autocd # Automatically cd into typed directory.
#stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

HISTFILE=~/.cache/histfile
HISTSIZE=9000
SAVEHIST=9000

# vi mode
bindkey -v
#zstyle ':autocomplete:*' default-context history-incremental-search-backward
bindkey '^R' history-incremental-search-backward
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char

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
COMPLETION_WAITING_DOTS="true"

## Alias
alias lla='ls -lhtra'
##alias ls='ls --color=auto'
alias ls='exa'
alias ll='exa --header --icons --long --all --sort type'
alias la='exa --header --icons --long --all --sort type'
alias lg='exa --header --group --long --icons --all --git'
alias l.="ls -A | grep -E '^\.'"
alias las='find . maxdepth 1 -type l -printf "%p -> %l\n" | sort'
alias git='noglob git'
alias cat='bat -p'
alias catn='bat -n'
alias codeenv='sh ~/bin/tmux.sh'
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
alias externalip='w3m -dump whatismyip.akamai.com'
alias screen_saving_on='xset +dpms'
alias screen_saving_off='xset -dpms'
alias home='autorandr -l home'
alias work='autorandr -l work'
alias sshp='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no'

# Dotfiles handeling
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config status.showUntrakedFiles no

## editor stuff
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias emacsc='emacsclient -c -a "emacs"'

## Zsh Stuff
alias vZ='nvim ~/.zshrc'
alias vZP='nvim ~/.zshrc'
alias reloadZ='source ~/.zshrc'

## Bash Stuff
alias vB='nvim ~/.bashrc'
alias vBP='nvim ~/.bash_profile'

## Configurations i3wm
alias vi3C='nvim ~/.config/i3/config'
alias vi3S='nvim ~/.config/i3/i3status.conf'
#alias vi3S='vim ~/.config/i3/status.toml'
## Configurations Xmonad
alias vxC='nvim ~/.xmonad/xmonad.hs'
alias vxB='nvim ~/.config/xmobar/xmobarrc'

## Git Stuff
alias vgC='vim ~/.gitconfig'
alias g='git'
alias gsh='git push'
alias gll='git pull'
alias gst='git st'
alias ga='git add'
alias gP='git push'
alias gp='git pull'
alias gc='git commit -m'

## coding folders
alias cdc='cd ~/code'
alias cdg='cd ~/git'
alias cdd='cd ~/.dotfiles'
alias cdn='cd ~/.config/nvim'
#alias dev='sh ~/bin/dev'
#alias devcode='sh ~/bin/devcode'
#alias devsql='sh ~/bin/devsql'
alias router='sh ~/bin/configrouter.sh'

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
alias tath='tmux a -t'
alias vT='vim ~/.tmux.conf'
alias b='byobu'

# Ensure DK modifiers
xmodmap ~/.Xmodmapus

# SSH-agent
if [ -z $SSH_AGENT_PID ] && [ -z $SSH_TTY ]; then  # if no agent & not in ssh
  eval `ssh-agent -s` > /dev/null
#  ssh-add -q ~/.ssh/*.pem
  ssh-add -q ~/.ssh/id_rsa
fi


# User configuration
#for al in ${${${(0)"$(git config -z --get-regexp '^alias.')"}%%$'\n'*}#alias.}; do
#  alias g$al="git $al"
#done
function weatherfunc() {
    if [[ -z "$1" ]]
    then
        curl wttr.in
    else
        curl wttr.in/$1
    fi
}

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
