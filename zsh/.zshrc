fpath=(~/.config/zsh $fpath)
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::azure
zinit snippet OMZP::brew

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# The following lines were added by compinstall
autoload -U colors && colors	# Load colors
setopt autocd			# Automatically cd into typed directory.
#stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History
HISTFILE=~/.cache/histfile
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
# vi mode
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^y' autosuggest-accept
#bindkey '^R' history-incremental-search-backward

export KEYTIMEOUT=20

## Alias
alias cd='z'
alias lla='ls -lhtra'
#alias ls='ls --color=auto'
alias exa='eza'
alias ls='eza'
alias lt='eza --tree --level=2 --long --icons --git'
alias ll='exa --header --icons --long --sort=type'
alias la='exa --header --icons --long --all --sort=type'
alias lg='exa --header --group --long --icons --all --git'
alias l.='ls -A | grep -E "^\."'
alias git='noglob git'
alias cat='bat -p'
alias catf='bat'
alias catn='bat -n'
alias diff='delta'
alias weather='weatherfunc'
alias externalip='w3m -dump whatismyip.akamai.com'
alias tf='terraform'
alias frcd='cd ~ && cd $(fd --type d | fzf)'
alias fcd='cd $(fd --type d | fzf)'

## editor stuff
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias nf='vi $(fd --type f | fzf)'
alias em='emacsclient -c -a "emacs"'

## Shell profiles and rc's
alias vZ='nvim ~/.zshrc'
alias vzP='nvim ~/.zsh_profile'
alias reloadZ='source ~/.zshrc'
alias vB='nvim ~/.bashrc'
alias vBP='nvim ~/.bash_profile'
alias vwC='nvim ~/.config/wezterm/wezterm.lua'
alias vgC='nvim ~/.config/ghostty/config'
alias vaC='nvim ~/.config/alacritty/alacritty.toml'

## Git Stuff
alias vgC='vim ~/.gitconfig'
alias g='git'
alias gs='git status --short'
alias gst='git st'
alias gd='git diff --output-indicator-new=" " --output-indicator-old=" "'
alias gds='gd --staged'
alias ga='git add'
alias gap='ga --patch'
alias gc='git commit'
alias gsc='git commit -S'
alias gca='gc --amend --no-edit'
alias gce='gc --amend'
alias gP='git push'
alias gp='git pull'
alias gr='git reset'
alias gl='git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an %ar%C(auto) %D%n%s%n"'
alias gm='git merge'
alias gn='git checkout -b' # New branch
alias gb='git branch'
alias gba='git branch --all'
alias gco='git checkout'
alias gi='git init'
alias gcl='git clone --recursive'
alias glg='lazygit'

gcm() { git commit -m "$*" }
## SSH
alias vsC='nvim ~/.ssh/config'
alias vsK='nvim ~/.ssh/known_hosts'
alias sshp='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no'

## Navigation
alias cdc='cd ~/code'
alias cdcc='cd ~/.config'
alias cdd='cd ~/.dotfiles'
alias cdD='cd $HOME/Developer/'
alias cdn='cd ~/.config/nvim'
alias router='sh ~/bin/configrouter.sh'

# Exit terminal
alias k='exit'

## Net
alias yt='yt-dlp -f "bv+ba/b"'  # Downloads video link
alias yta='yt-dlp -f "ba"' # Downloads only audio

## Apps
alias r='ranger'
alias y='yazi'

## Tmux
alias tnew='tmux new -s'
alias tath='tmux a -t'
alias vT='vim ~/.config/tmux/tmux.conf'

# SSH-agent
if [ -z $SSH_AGENT_PID ] && [ -z $SSH_TTY ]; then  # if no agent & not in ssh
  eval `ssh-agent -s` > /dev/null
#  ssh-add -q ~/.ssh/*.pem
#  ssh-add -q ~/.ssh/id_ed25519
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
# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}
# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

export MANPATH="/usr/local/man:$MANPATH"

# loading zsh theme and addons
eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# --- setup fzf theme ---
#fg="#CBE0F0"
#bg="#011628"
#bg_highlight="#143652"
#purple="#B388FF"
#blue="#06BCE4"
#cyan="#2CF9ED"

##export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--multi"

#export FZF_DEFAULT_OPTS=" \
#--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
#--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
#--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
#--color=selected-bg:#45475a \
#--multi"
# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

# fzf preview for tmux
export FZF_TMUX_OPTS=" -p90%,70% "
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

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

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
# Make all kubectl completion fzf
command -v fzf >/dev/null 2>&1 && {
	source <(kubectl completion zsh | sed 's#${requestComp} 2>/dev/null#${requestComp} 2>/dev/null | head -n -1 | fzf  --multi=0 #g')
}
# ------ Bat (better cat) ---------
#export BAT_THEME="Catppuccin Mocha"
##eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/zen.toml)"
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/zen_v2.toml)"
#compdef gt
###-begin-gt-completions-###
#
# yargs command completion script
#
# Installation: gt completion >> ~/.zshrc
#    or gt completion >> ~/.zprofile on OSX.
#
_gt_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" gt --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _gt_yargs_completions gt
###-end-gt-completions-###
# ------ yazi  ---------
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
source $HOME/.zsh_profile
source <(jj util completion zsh)
# Atuin config
eval "$(atuin init zsh)"
#bindkey '^r' atuin-search-viins # Ctrl-r starts Atuin in insert mode

. "$HOME/.atuin/bin/env"
