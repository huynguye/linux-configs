#!/bin/bash

# install vim packages (remove neocomplete)
tar xv -C ~/ -f vim.tar.gz
rm -rf ~/.vim/bundle/neocomplete.vim

# setup vim
cat vimrc >> ~/.vimrc
cat gvimrc >> ~/.gvimrc

# setup bash
cat bash_ps1 >> ~/.bash_ps1
cat bash_profile >> ~/.bash_profile
cat bashrc >> ~/.bashrc
source ~/.bashrc

# setup gitconfig file
cat gitconfig >> ~/.gitconfig

# setup tmux and necessary font files
cat tmux.conf >> ~/.tmux.conf
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh

# install meld, chrome, wine
sudo apt-get -y install meld chromium chromium-l10n

# remove sl
sudo apt-get remove sl

