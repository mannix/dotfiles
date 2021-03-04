# .zshrc
ZSH_BASE=$HOME/.dotfiles

source $ZSH_BASE/antigen/antigen.zsh

source ~/.zsh-aliases
source ~/.zsh-junkdrawer
source ~/.zsh-private

antigen use oh-my-zsh

antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle z

case `uname` in
  Darwin)
    # Commands for OS X go here
    antigen bundle osx
  ;;
  Linux)
    # Commands for Linux go here
  ;;
esac

antigen apply

