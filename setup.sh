#!/bin/sh
clone_repos() {
    git clone https://github.com/Nova-archx86/dotfiles
    git clone https://github.com/Nova-archx86/Scripts
    git clone https://github.com/Nova-archx86/Dwm-build
    git clone https://github.com/Nova-archx86/slock-build 
    git clone https://aur.archlinux.org/paru.git
}

get_dotfiles() {
    cp -r dotfiles/.config $HOME 
    cp -r dotfiles/Wallpapers $HOME
    cp -r Scripts $HOME
    cp dotfiles/.bash_profile $HOME
    cp dotfiles/.bashrc $HOME
    cp dotfiles/.xinitrc $HOME 
    cp dotfiles/.vimrc $HOME
}

install_packages() {
    cd Dwm-build && sudo make install 
    cd ../slock-build && sudo make install 
    cd ..
    sudo pacman -S $(awk '{print $1}'  packages.txt)
}

install_aur_packages() {
    cd paru
    makepkg -si 
    cd ..
    paru -S $(awk '{print $1}' aur_pkgs.txt)
}

install_vim_plugin_manager() {
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

clone_repos
install_packages
install_aur_packages
get_dotfiles
install_vim_plugin_manager
