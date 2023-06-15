#!/bin/sh

if ! [ -f ~/.tmux.conf ]
then
  ln -s ~/.config/nvim/etc/tmux.conf ~/.tmux.conf
fi

if ! [ -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]
then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

. ~/.profile
if [ "$EDITOR" != "nvim" ]
then
  echo 'export EDITOR=nvim' >> ~/.profile
fi
