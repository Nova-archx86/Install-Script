#!/bin/bash 

function get_dotfiles() {
    git clone https://github.com/Nova-archx86/dotfiles
    cp -r dotfiles/.config $HOME 
    cp -r dotfiles/.fonts $HOME
    cp -r dotfiles/Wallpapers $HOME
    cp dotfiles/.bash_profile $HOME
    cp dotfiles/.bashrc $HOME
    cp dotfiles/.xinitrc $HOME 
    cp dotfiles/.vimrc $HOME
}

function install_packages() {
    sudo pacman -S $(awk '{print $1}'  packages.txt)
    # Compiles my build of dwm 
    git clone https://github.com/Nova-archx86/Dwm-build
    cd Dwm-build && sudo make install 
    cd ..
}

function install_aur_packages() {
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si 
    cd ..
    paru -S $(awk '{print $1}' aur_pkgs.txt)
}

function install_vim_plugin_manager() {
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

install_packages
install_aur_packages
get_dotfiles
install_vim_plugin_manager
