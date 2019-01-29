#!/bin/bash

################################################################
# (OPTIONAL) Install VIM with Python3 and LUA support
# - make sure to update python config path (or verify it exists)
################################################################
# sudo apt remove vim vim-runtime gvim
# echo "Installing VIM"
# cd ~/Downloads
# if [ ! -d "vim" ] ; then git clone https://github.com/vim/vim.git ; fi
# cd vim && git pull --all
# ./configure --with-features=huge \
#     --enable-multibyte \
#     --enable-rubyinterp=yes \
#     --enable-pythoninterp=yes \
#     --enable-python3interp=yes \
#     --with-python3-config-dir=/usr/lib/python3.4/config-3.4m-x86_64-linux-gnu \
#     --enable-perlinterp=yes \
#     --enable-luainterp=yes \
#     --enable-gui=gtk2 \
#     --enable-cscope \
#     --prefix=/usr/local
# sudo make install
# sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
# sudo update-alternatives --set editor /usr/local/bin/vim
# sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
# sudo update-alternatives --set vi /usr/local/bin/vim


######################
# install vim packages
######################
echo "Install VIM packages"
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle

if [ ! -d "ctrlp.vim" ] ; then git clone https://github.com/kien/ctrlp.vim.git ; fi
if [ ! -d "indentLine" ] ; then git clone https://github.com/Yggdroot/indentLine.git ; fi
if [ ! -d "nerdtree" ] ; then git clone git://github.com/scrooloose/nerdtree.git ; fi
if [ ! -d "php.vim" ] ; then git clone https://github.com/StanAngeloff/php.vim.git ; fi
if [ ! -d "snipmate.vim" ] ; then git clone git://github.com/msanders/snipmate.vim.git ; fi
if [ ! -d "syntastic" ] ; then git clone https://github.com/vim-syntastic/syntastic.git ; fi
if [ ! -d "tabular" ] ; then git clone https://github.com/godlygeek/tabular.git ; fi
if [ ! -d "tagbar" ] ; then git clone https://github.com/majutsushi/tagbar.git ; fi
if [ ! -d "tcomment_vim" ] ; then git clone https://github.com/tomtom/tcomment_vim.git ; fi
if [ ! -d "tmuxline.vim" ] ; then git clone https://github.com/edkolev/tmuxline.vim.git ; fi
if [ ! -d "typescript-vim" ] ; then git clone https://github.com/leafgarland/typescript-vim.git ; fi
if [ ! -d "vim-airline" ] ; then git clone https://github.com/bling/vim-airline.git ; fi
if [ ! -d "vim-autoclose" ] ; then git clone https://github.com/Townk/vim-autoclose.git ; fi
if [ ! -d "vim-easymotion" ] ; then git clone https://github.com/Lokaltog/vim-easymotion.git ; fi
if [ ! -d "vim-gitgutter" ] ; then git clone git://github.com/airblade/vim-gitgutter.git ; fi
if [ ! -d "vim-gutentags" ] ; then git clone https://github.com/ludovicchabant/vim-gutentags.git ; fi
if [ ! -d "vim-nerdtree-tabs" ] ; then git clone https://github.com/jistr/vim-nerdtree-tabs.git ; fi
if [ ! -d "vim-tmux-navigator" ] ; then git clone https://github.com/christoomey/vim-tmux-navigator.git ; fi
if [ ! -d "vim-twig" ] ; then git clone https://github.com/evidens/vim-twig.git ; fi
if [ ! -d "yaml-vim" ] ; then git clone https://github.com/mrk21/yaml-vim.git ; fi
if [ ! -d "YouCompleteMe" ] ; then git clone https://github.com/Valloric/YouCompleteMe.git ; fi

# update all repos
find . -name .git -type d | xargs -n1 -P4 -I% git --git-dir=% --work-tree=%/.. remote update -p


##########################################
# (optional) Configure/setup YouCompleteMe
##########################################
# echo "Configure VIM package - YouCompleteMe"
# cd ~/.vim/bundle/YouCompleteMe
# sudo apt install build-essential cmake3 python3-dev
# python3 install.py


########################################
# (optional) install fonts for powerline
########################################
# echo "Install Powerline fonts"
# cd ~/Downloads
# git clone https://github.com/powerline/fonts.git
# cd fonts
# ./install.sh


echo ""
echo "Files to take care of manually:"
echo " - ~/.vimrc "
echo " - ~/.bash_ps1 "
echo " - ~/.bash_profile "
echo " - ~/.bashrc "
echo " - ~/.git-prompt "
echo " - ~/.gitconfig "
echo " - ~/.tmux.conf "
echo ""


