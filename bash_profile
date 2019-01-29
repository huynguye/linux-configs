# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

PATH=$PATH:$HOME/bin:/usr/local/bin
export PATH

# setup vim as default editor for git and other programs
export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR="$VISUAL"

