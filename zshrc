# Aliases
alias c=clear
alias l='ls -Flash'
alias ll='eza -Blah --group-directories-first'
alias gco='git checkout'
alias gst='git status'
alias nv=nvim
alias p3=python3
alias python=python3.12
alias pip=pip3.12

export EDITOR="nvim"

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY

# Up/down arrow searches history by the prefix already typed at the prompt
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
[[ -n "${terminfo[kcuu1]}" ]] && bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
[[ -n "${terminfo[kcud1]}" ]] && bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

# Completion
autoload -Uz compinit
# Rebuild completion dump at most once per day
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' rehash true

# cd - goes back one dir, cd -2 goes back two, etc.
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# nvm — lazy loaded so shell startup stays fast
export NVM_DIR="$HOME/.nvm"

_nvm_load() {
  unfunction nvm node npm npx 2>/dev/null
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

nvm()  { _nvm_load; nvm  "$@"; }
node() { _nvm_load; node "$@"; }
npm()  { _nvm_load; npm  "$@"; }
npx()  { _nvm_load; npx  "$@"; }

eval "$(starship init zsh)"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

fpath+=~/.zfunc; autoload -Uz compinit; compinit
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/mike/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
