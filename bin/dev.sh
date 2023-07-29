#!/bin/bash
if ! tmux has-session -t code; then
    tmux new -s code -ncode -d
    tmux new-window -ndiff -t code:2
    tmux new-window -nbuild -t code:3
    tmux split-window -t code:diff -h
    tmux send-keys -t code:1 vim Enter
fi
tmux attach -t code
