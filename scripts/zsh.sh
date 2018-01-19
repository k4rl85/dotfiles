#!/bin/bash

function set_zsh_shell(){
  run "install zsh"
  brew install zsh

  run "cloning zgen"
	git clone https://github.com/tarjoilija/zgen.git ~/.zgen

  run "setting zsh as default shell"
  if ! grep -q "/usr/local/bin/zsh" "/etc/shells"; then
    sudo bash -c 'printf "/usr/local/bin/zsh\n" >> /etc/shells'
    chsh -s $(which zsh)
  fi
}
