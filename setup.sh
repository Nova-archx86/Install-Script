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
}

function install_aur_packages() {
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    paru -S $(awk '{print $1}' aur_pkgs.txt)
}

function install_vim_plugin_manager() {
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

echo "Installing packages...\n"
install_packages
echo "Installing paru and AUR packages...\n"
install_aur_packages
echo "Grabbing Configuration files...\n"
get_dotfiles
echo "Installing vim plugged for neovim..."
install_vim_plugin_manager
