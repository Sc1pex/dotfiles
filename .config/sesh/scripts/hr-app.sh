#!/bin/bash

tmux rename-window 'fe'
tmux send-keys "cd fe" C-m
tmux send-keys "nvim -c ':FormatDisable | SessionManager load_current_dir_session'" C-m

tmux new-window -n 'be'
tmux send-keys 'cd be' C-m
tmux send-keys "nvim -c ':FormatDisable | SessionManager load_current_dir_session'" C-m

tmux new-window -n 'run'
tmux split-window -h 
tmux send-keys -t 1 'cd fe' C-m
tmux send-keys -t 1 'npm run dev' C-m
tmux send-keys -t 2 'cd be' C-m
tmux send-keys -t 2 'docker compose up -d database' C-m
tmux send-keys -t 2 'npm run dev' C-m

tmux select-window -t 1
