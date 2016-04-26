#!/bin/bash

# install vim packages (remove neocomplete)
tar xv -C ~/ -f vim.tar.gz
rm -rf ~/.vim/bundle/neocomplete.vim

# setup vimrc
cat .vimrc >> ~/.vimrc

# setup personal command line prompt
cat .bash_ps1 >> ~/.bash_ps1

# setup bashrc
cat .bashrc >> ~/.bashrc

# setup tmux conf
cat .tmux.conf >> ~/.tmux.conf

# clone/install powerline font repo
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh

