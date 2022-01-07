#!/bin/bash

if [ $SPIN ]; then
  cp ~/dotfiles/.gitconfig ~
  cp ~/dotfiles/.vimrc ~
  cp ~/dotfiles/.zsh_prompt ~
  cp ~/dotfiles/.zshrc ~
  cp -r ~/dotfiles/.zsh ~

  cat ~/dotfiles/spin.sh >> ~/.zshrc
fi
