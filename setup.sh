#!/bin/bash 

function get_dotfiles() {
    git clone https://github.com/Nova-archx86/dotfiles
    cp -r dotfiles/.config $HOME 
    cp -r dotfiles/.fonts $HOME
    cp dotfiles/.bash_profile
    cp dotfiles/.bashrc $HOME
    cp .xinitrc $HOME 
    cp .vimrc $HOME
}

function install_packages() {
    sudo pacman -S $(awk '{print $1}'  input_file)
}

install_packages
get_dotfiles
