#!/bin/bash

# var for session name (to avoid repeated occurences)
sn=$RANDOM

# 1st session
cd $HOME
tmux new-session -s "code" -n cranaback -d -c "/home/crana-admin/workspace/crana/backend/www"

tmux new-window -t "code:2" -n PHPUnit    -c "/home/crana-admin/workspace/crana/backend/www/tests"
tmux new-window -t "code:3" -n cranafront    -c "/home/crana-admin/workspace/crana/frontend/www"
tmux new-window -t "code:0" -n bash -c "$HOME"

# 2nd session for server and apidocs
cd $HOME
tmux new-session -s "server" -n docker -d -c "/home/crana-admin/workspace/crana/docker"
tmux splitw -v -p 30 -t 0
tmux new-window -t "server:2" -n apidocs -c "/home/crana-admin/workspace/crana/apidocs"
tmux splitw -v -p 30 -t 0

# link bash window between session
# tmux kill-window -t "code:1"			# kill off code's bash
tmux link-window -s code:0 -t server:0	# share bash

# select window and attach session
tmux select-window -t "code:1"
tmux -2 attach-session -t "code"

