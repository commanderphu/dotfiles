#!/bin/bash

# Session name and SSH target
SESSION="work_space"
SSH_WEB="web-01"

# Check if session already exists
if ! tmux has-session -t "$SESSION" 2>/dev/null; then
    # Create detached session
    tmux new-session -d -s "$SESSION" -n "System Monitor"
    tmux send-keys -t "$SESSION:0" 'btop' C-m

    # Docker window with 3 panes
    tmux new-window -t "$SESSION":1 -n "Docker"
    tmux send-keys -t "$SESSION":1 'docker ps' C-m
    tmux split-window -h -t "$SESSION":1
    tmux send-keys -t "$SESSION":1.1 'docker images' C-m
    tmux split-window -v -t "$SESSION":1.1
    tmux send-keys -t "$SESSION":1.2 'cid=$(docker ps --format "{{.ID}} {{.Names}}" | fzf | cut -d " " -f1) && docker logs -f "$cid"' C-m
    tmux select-pane -t "$SESSION":1.0
    tmux send-keys -t "$SESSION":1.0 'watch -n 1 "docker stats --no-stream"' C-m
    tmux select-layout -t "$SESSION":1 tiled

    # SSH window
    tmux new-window -t "$SESSION":2 -n "SSH to Web Server"
    tmux send-keys -t "$SESSION":2 "ssh $SSH_WEB" C-m
fi

# Attach to session
tmux attach-session -t "$SESSION"
