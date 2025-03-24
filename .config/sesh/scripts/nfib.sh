#!/bin/bash

tmux rename-window 'nvim'
tmux send-keys "nvim -c ':SessionManager load_current_dir_session'" C-m

tmux new-window -n 'run'
tmux split-window -h 
tmux send-keys -t 1 'cd nfib_server' C-m
tmux send-keys -t 1 'mix phx.server' C-m
tmux send-keys -t 2 'cd runner_server && sleep 5' C-m
tmux send-keys -t 2 './run_local.sh' C-m

tmux select-window -t 1
