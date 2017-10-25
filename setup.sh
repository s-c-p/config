#!/bin/bash

# install binaries
/bin/bash bin/debs-setup.sh

# install fonts
mkdir ~/.fonts
cp bin/fonts/*.otf ~/.fonts
fc-cache -f -v "~/.fonts"

# configure firefox
mkdir ~/.mozilla
tar xzf lib/base.mozilla.tar.gz -C ~/.mozilla

# configure git
git config --global user.name s-c-p
git config --global user.email prasadsatish45@binkmail.com

# configure vim
mkdir -p ~/.vim/plugged
mkdir -p ~/.vim/autoload
cp config/vimrc ~/.vimrc
cp config/vim-plug ~/.vim/autoload/plug.vim
tar xzf lib/vim-plug.tar.gz -C ~/.vim/plugged

# configure terminator
mkdir -p ~/.config/terminator
cp config/terminator.config ~/.config/terminator/config

# configure zsh
mkdir -p ~/.oh-my-zsh
tar xzf lib/oh-my-zsh.tar.gz -C ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sed -i -e 's/robbyrussell/ys/g' ~/.zshrc
echo "export TERM=xterm-256color" >> ~/.zshrc
echo "alias py=python3" >> ~/.zshrc

# change wallpapers
gsettings set org.gnome.desktop.background picture-uri  file:///usr/share/backgrounds/gnome/Road.jpg
gsettings set org.gnome.desktop.screensaver picture-uri file:///usr/share/backgrounds/ubuntu-gnome/pexels-fruit.jpg
