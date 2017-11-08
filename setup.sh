#!/bin/bash

# install binaries
/bin/bash bin/debs-setup.sh

# install fonts
mkdir ~/.fonts
cp bin/fonts/*.otf ~/.fonts
fc-cache -f -v "~/.fonts"

# configure firefox
mkdir -p ~/.mozilla/firefox
mkdir -p ~/.mozilla/extensions
tar xzf lib/base.mozilla.tar.gz -C ~/.mozilla/firefox

# configure git
git config --global user.name s-c-p
git config --global user.email prasadsatish45@binkmail.com

# configure vim
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/plugged
mkdir -p ~/.vim/autoload
cp config/vimrc ~/.vimrc
cp config/vim-plug ~/.vim/autoload/plug.vim
cp config/vim-colorscheme ~/.vim/colors/aristocrat.vim
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
echo "alias py2=python2" >> ~/.zshrc

# easy gitlab
wmctrl -ia $WINDOWID
mkdir -p ~/.ssh   # because sometimes this folder is not created
openssl enc -d -aes-256-cbc -salt -base64 -in config/gitlab_auth -out ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/id_rsa

# change wallpapers
gsettings set org.gnome.desktop.background picture-uri  file:///usr/share/backgrounds/gnome/Road.jpg
gsettings set org.gnome.desktop.screensaver picture-uri file:///usr/share/backgrounds/ubuntu-gnome/pexels-fruit.jpg

# initialized pomodoro sw
/usr/bin/gnome-pomodoro --no-default-window &
