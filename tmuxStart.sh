#!/bin/bash

# 1st session (crana/gemini/aa)
cd $HOME
tmux new-session -s "crana" -n gemini -d -c "/home/debian-admin/repositories/ld-api/api/www"
tmux split-window -d -p 30 -h -c "/home/debian-admin/repositories/ld-api/api/www"
tmux split-window -d -p 25 -v -t 1 -c "/home/debian-admin/repositories/ld-api/api/www"
tmux new-window -t "crana:2" -n crana -c "/home/debian-admin/repositories/crana/frontend/www"
tmux new-window -t "crana:3" -n angular-backend -c "/home/debian-admin/repositories/angular-admin/backend/www"
tmux new-window -t "crana:4" -n angular-frontend -c "/home/debian-admin/repositories/angular-admin/frontend/www"
tmux new-window -t "crana:0" -n bash -c $HOME

# 2nd session (ocelot/varien/gov-quote)
cd $HOME
tmux new-session -s "aa" -n ocelot -d -c "/home/debian-admin/repositories/ocelot-main"
tmux new-window -t "aa:2" -n varien -c "/home/debian-admin/repositories/4ink-main"
tmux new-window -t "aa:3" -n hydra -c "/home/debian-admin/repositories/hydra/www"
tmux new-window -t "aa:4" -n gov-quote -c "/home/debian-admin/repositories/gov-quote"

# 3rd session (qst)
cd $HOME
tmux new-session -s "qst" -n qst -d -c "/home/debian-admin/repositories/qst/quikshiptoner.com/www"

# 4th session (docker)
tmux new-session -s "docker" -n docker -d -c "/home/debian-admin/repositories/ld-api/docker"
tmux split-window -d -p 50 -c "/home/debian-admin/repositories/4ink-main/docker"
tmux split-window -d -p 50 -t 0 -c "/home/debian-admin/repositories/crana/docker"
tmux split-window -d -p 50 -t 2 -c "/home/debian-admin/repositories/qst/docker2"

# 5th session (for debugging live magento site)
tmux new-session -s "live-magento" -n frontend-code -d
tmux split-window -d -p 50 \; split-window -d -p 50 -t 0 \; split-window -d -p 50 -t 2
tmux new-window -t "live-magento:2" -n frontend-log
tmux split-window -d -p 50 \; split-window -d -p 50 -t 0 \; split-window -d -p 50 -t 2
tmux new-window -t "live-magento:3" -n backend-code \; split-window -d -p 50
tmux new-window -t "live-magento:4" -n backend-log \; split-window -d -p 50

# options
# [-dhvP] [-c start-directory] [-F format] [-p percentage|-l size] [-t target-pane] [command] 

# share bash
tmux link-window -s crana:0 -t aa:0
tmux link-window -s crana:0 -t qst:0
tmux link-window -s crana:0 -t docker:0
tmux link-window -s crana:0 -t live-magento:0

# select window and attach session
tmux select-window -t "crana:1"
tmux -2 attach-session -t "crana"

