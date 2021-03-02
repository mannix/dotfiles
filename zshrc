# Use Neovim
export VISUAL=nvim
export EDITOR='nvim'
alias vim=nvim
alias vi=nvim

# General Aliases
alias c='clear'
alias l='ls -FlAh'

# Prompt
PROMPT='
%1~ %# '

RPROMPT='%*'

# Handy Functions
# make a directory and cd into it
function mkd() {
  mkdir -p "$@" && cd "$_";
}
