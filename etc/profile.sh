# Add to .bashrc or .zshrc like so:
# . ~/.config/nvim/etc/profile.sh

export EDITOR=nvim
if [ -n "$ZSH_VERSION" ]; then
  bindkey -e
fi

alias go-nvim='nvim -u ~/.config/nvim/init_go.lua'
alias py-nvim='nvim -u ~/.config/nvim/init_python.lua'

