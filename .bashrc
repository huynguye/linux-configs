# .bashrc

# export TERM="xterm-256color"
export TERM=xterm-color

# Make basic commands more error proof or useful
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias du='du -kh'
alias df='df -kTh'

# Ease of use shortcuts
alias vi='vim'
alias vrc='vi ~/.vimrc'
alias brc='vi ~/.bashrc'
alias src='source ~/.bashrc'
alias ys='sudo yum search'
alias yi='sudo yum install'
alias h='history'
alias his='history | grep '
alias cl='clear; pwd'
alias j='jobs -l'
alias ..='cd ..; pwd'
alias c='cd ..; pwd'

# increase bash history
HISTSIZE=10000
HISTFILESIZE=10000

# Disable annoying freezing of screen by mis-typing Ctrl-s while terminal
stty stop ''
stty start ''
stty -ixon
stty -ixoff

# Personal directory navigation
alias ticks='cd ~/tickets; ls'
alias html='cd ~/tickets/html; ls'
alias ldp='cd app/code/local/LDP'
alias fldp='cd app/design/frontend/ldp'
alias pong='cd ~/html/pong; ls'

# tmux shortcuts
alias tmux='tmux -2'
alias tk='tmux kill-session -t'
alias tl='tmux ls'
alias ta='tmux attach'

# dbsync (behrad) script
alias pull-mage-cms='transfer-mage-cms --pull --db=ocelot_beta --dbhost=db4'
alias pull-mage-landingpages='transfer-mage-landingpages --pull --db=ocelot_beta --dbhost=db4'
alias pull-mage-nocms='transfer-mage-nocms --pull --db=ocelot_beta --dbhost=db4'
alias qa-push-cms='transfer-mage-cms --out'

# color for output
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
purple='\033[0;35m'
orange='\033[0;33m'
orange='\033[0;33m'
NC='\033[0m' # No Color
DEFAULT='\033[39m' # Default

# hg shortcuts
alias hgr='hg revert'
alias hgc='hg commit -m'
alias hgp='hg push'
function hgi() {
    echo -e "${orange}incoming changeset(s):${DEFAULT}"
    hg in -v
}
function hgo() {
    echo -e "${green}outgoing changeset(s): ${DEFAULT}"
    hg out -v
}
function hgb() {
    if [ -z "$1" ]
    then
        branch=$(hg branch)
        echo -e "  ${red}current branch: ${green}$branch${DEFAULT}"
    else
        hg branch $1
        branch=$(hg branch)
        echo -e "  ${red}current branch: ${green}$branch${DEFAULT}"
    fi
}
function hgbs() {
    branch=$(hg branch)
    hg branches
    echo -e "  ${red}current branch: ${green}$branch${DEFAULT}"
}
function hgs() {
    branch=$(hg branch)
    hg stat
    echo -e "  ${red}current branch: ${green}$branch${DEFAULT}"
}
function hgu() {
    if [ -z "$1" ]
    then
        echo "please specify a branch name"
    else
        hg update --check $1
        branch=$(hg branch)
        echo -e "  ${red}current branch: ${green}$branch${DEFAULT}"
    fi
}


# quick access code functions
function ocelot() {
    cd ~/tickets/ocelot-main
    branch=$(hg branch)
    dir=$(pwd)
    echo -e "  ${red}directory: ${green}$dir"
    echo -e "  ${purple}branch: ${green}$branch ${DEFAULT}"
}
function varien() {
    cd ~/tickets/4ink-main
    branch=$(hg branch)
    dir=$(pwd)
    echo -e "  ${red}directory: ${green}$dir "
    echo -e "  ${purple}branch: ${green}$branch${DEFAULT}"
}


# Shelve using current branch's name
function shelve() {
    branch=$(hg branch)
    echo "hg shelve --name $branch"
    hg shelve --name $branch
}

# List available shelves
function shelves() {
    echo "hg shelve --list"
    hg shelve --list
}

# Unshelve using current branch's name
function unshelve() {
    branch=$(hg branch)
    echo "hg unshelve --name $branch"
    hg unshelve --name $branch
}


# Custom variables (change as needed)
HOME_DIR='/home/user'	# home directory
TICKET_DIR='tickets'	# directory of where all the tickets to be stored


#
# LinkTicket: Create symbolic link (labeled '4ink-active') in /home/user/ for directory name $1
#
function lt () {
	if [[ "$@" != "" ]]; then
		if [ -d "$HOME_DIR/$TICKET_DIR/4ink-$1" ]; then
			# Delete old link; create new symbolic link
			rm -f "$HOME_DIR/4ink-active";
			ln -s "$HOME_DIR/$TICKET_DIR/4ink-$1" "$HOME_DIR/4ink-active";
			echo "Symbolic link created for $HOME_DIR/$TICKET_DIR/4ink-$1";
		else
			echo "4ink directory not found at '$HOME_DIR/$TICKET_DIR/4ink-$1'";
		fi
	else
		echo "Correct usage: lt [ticket number]";
	fi
}

#
# GotoTicket: Go to directory $1
#
function gt () {
	if [[ "$1" != "" ]]; then
		if [ -d "$HOME_DIR/$TICKET_DIR/4ink-$1" ]; then
			cd "$HOME_DIR/$TICKET_DIR/4ink-$1";
			pwd;
		else
			echo "4ink directory not found at '$HOME_DIR/$TICKET_DIR/4ink-$1'";
		fi
	else
		echo "Correct usage: gt [ticket number]";
	fi
}

#
# CreateTicket: Copy original, cloned directory to new directory $1
#
function ct () {
	if [[ "$1" != "" ]]; then
		if [ ! -d "$HOME_DIR/$TICKET_DIR/4ink-$1" ]; then
			echo "Creating new ticket ($1) directory.  Hang on...";
			cp -a "$HOME_DIR/$TICKET_DIR/4ink-main" "$HOME_DIR/$TICKET_DIR/4ink-$1";
			cd "$HOME_DIR/$TICKET_DIR/4ink-$1";
			#ln -s . ldproducts;
			#ln -s . simplyink;
			#ln -s . 123inkjets;
			#ln -s . inkcartridges;
			#ln -s . 4inkjets;
			pwd;
		else
			echo "$1 already exists.  Going there now...";
			cd "$HOME_DIR/$TICKET_DIR/4ink-$1";
			pwd;
		fi
	else
		echo "Correct usage: ct [ticket number]";
	fi
}


#
# ocelot: LinkTicket: Create symbolic link (labeled 'ocelot-active') in /home/user/ for directory name $1
#
function olt () {
	if [[ "$@" != "" ]]; then
		if [ -d "$HOME_DIR/$TICKET_DIR/ocelot-$1" ]; then
			# Delete old link; create new symbolic link
			rm -f "$HOME_DIR/ocelot-active";
			ln -s "$HOME_DIR/$TICKET_DIR/ocelot-$1" "$HOME_DIR/ocelot-active";
			echo "Symbolic link created for $HOME_DIR/$TICKET_DIR/ocelot-$1";
		else
			echo "Ocelot directory not found at '$HOME_DIR/$TICKET_DIR/ocelot-$1'";
		fi
	else
		echo "Correct usage: olt [ticket number]";
	fi
}

#
# ocelot: GotoTicket: Go to directory $1
#
function ogt () {
	if [[ "$1" != "" ]]; then
		if [ -d "$HOME_DIR/$TICKET_DIR/ocelot-$1" ]; then
			cd "$HOME_DIR/$TICKET_DIR/ocelot-$1";
			pwd;
		else
			echo "Ocelot directory not found at '$HOME_DIR/$TICKET_DIR/ocelot-$1'";
		fi
	else
		echo "Correct usage: ogt [ticket number]";
	fi
}

#
# ocelot: CreateTicket: Copy original, cloned directory to new directory $1
#
function oct () {
	if [[ "$1" != "" ]]; then
		if [ ! -d "$HOME_DIR/$TICKET_DIR/ocelot-$1" ]; then
			echo "Creating new ticket ($1) directory.  Hang on...";
			cp -a "$HOME_DIR/$TICKET_DIR/ocelot-main" "$HOME_DIR/$TICKET_DIR/ocelot-$1";
			cd "$HOME_DIR/$TICKET_DIR/ocelot-$1";
			pwd;
		else
			echo "$1 already exists.  Going there now...";
			cd "$HOME_DIR/$TICKET_DIR/ocelot-$1";
			pwd;
		fi
	else
		echo "Correct usage: oct [ticket number]";
	fi
}


#
# testsite (testing area)
#
function tgt () {
	if [[ "$1" != "" ]]; then
		if [ -d "$HOME_DIR/testsite/$1" ]; then
			cd "$HOME_DIR/testsite/$1";
			pwd;
		else
			echo "testsite directory not found at '$HOME_DIR/testsite/$1'";
		fi
	else
		echo "Correct usage: tgt [folder name]";
	fi
}


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
