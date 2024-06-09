# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zsh_profile

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/lib/snapd/snap/bin"
export PATH=$PATH:~/.cargo/bin
fpath=(~/.config/zsh $fpath)

# The following lines were added by compinstall
autoload -U colors && colors  # Load colors
setopt autocd # Automatically cd into typed directory.
#stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

HISTFILE=~/.cache/histfile
HIST_STAMPS="mm-dd-yyyy"
HISTSIZE=9000
SAVEHIST=9000

# vi mode
bindkey -v
#zstyle ':autocomplete:*' default-context history-incremental-search-backward
#bindkey '^R' history-incremental-search-backward
export KEYTIMEOUT=10


# Set to this to use case-sensitive completion
CASE_SENSITIVE='true'
COMPLETION_WAITING_DOTS='true'

## Alias
##alias cd='z'
alias lla='ls -lhtra'
alias ls='ls --color=auto'
alias exa='eza'
alias ls='eza'
alias ll='exa --header --icons --long --all --sort type'
alias la='exa --header --icons --long --all --sort type'
alias lg='exa --header --group --long --icons --all --git'
alias l.='ls -A | grep -E "^\."'
alias git='noglob git'
alias cat='bat -p'
alias catn='bat -n'
alias codeenv='sh ~/bin/tmux'
alias weather='weatherfunc'
alias wallpaper='sh ~/bin/wallpaper'
alias updateAWSCDK='sh ~/bin/update_awscdk'
alias updateSSHShared='sh ~/bin/UpdateSSHShared'
alias pastebin='sh ~/bin/pastbin'
alias awslogin='sh ~/bin/awslogin'
alias fix_keyboard='sh ~/bin/keyboard'
alias mount_nas='sh ~/bin/mount_nas.sh'
alias umount_nas='sh ~/bin/umount_nas.sh'
alias externalip='w3m -dump whatismyip.akamai.com'
alias tf='terraform'
alias fcd='cd ~ && cd $(fd --type d | fzf)'

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
alias vzP='nvim ~/.zsh_profile'
alias reloadZ='source ~/.zshrc'

## Bash Stuff
alias vB='nvim ~/.bashrc'
alias vBP='nvim ~/.bash_profile'

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


## SSH
alias vsC='nvim ~/.ssh/config'
alias vsK='nvim ~/.ssh/known_hosts'
alias sshp='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no'

## Navigation
alias cdc='cd ~/code'
alias cdd='cd ~/.dotfiles'
alias cdn='cd ~/.config/nvim'
alias router='sh ~/bin/configrouter.sh'

# Exit terminal
alias k='exit'

## Net
alias yt="youtube-dl --add-metadata -ic" # Downloads video link
alias yta="youtube-dl --add-metadata -xic" # Downloads only audio

## Apps
alias irc='weechat-curses'
alias r='ranger'

## Tmux
alias tnew='tmux new -s'
alias tath='tmux a -t'
alias vT='vim ~/.tmux.conf'

# tmux-sessionizer
#bindkey -s ^f "tmux-sessionizer\n"

# SSH-agent
#if [ -z $SSH_AGENT_PID ] && [ -z $SSH_TTY ]; then  # if no agent & not in ssh
#  eval `ssh-agent -s` > /dev/null
##  ssh-add -q ~/.ssh/*.pem
#  ssh-add -q ~/.ssh/id_ed25519
#fi


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
# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

export MANPATH="/usr/local/man:$MANPATH"

# loading zsh theme and addons
source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
#eval "$(starship init zsh)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# -- Use fd instead of fzf --

#export FZF_DEFAULT_COMMAND="fd . $HOME"
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_ALT_C_COMMAND="fd -t d . $HOME"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# ------ Bat (better cat) ---------
export BAT_THEME=tokyonight_night

