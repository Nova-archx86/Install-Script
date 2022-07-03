#!/bin/bash 

function get_dotfiles() {
    git clone https://github.com/Nova-archx86/dotfiles
    cp -r dotfiles/.config $HOME 
    cp -r dotfiles/.fonts $HOME
    cp dotfiles/.bash_profile
    cp dotfiles/.bashrc $HOME
    cp dotfiles/.xinitrc $HOME 
    cp dotfiles/.vimrc $HOME
}

function install_packages() {
    sudo pacman -S $(awk '{print $1}'  packages.txt)
}

install_packages
get_dotfiles
