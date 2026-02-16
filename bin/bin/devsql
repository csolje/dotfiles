#!/bin/bash
if ! tmux has-session -t sql; then
    tmux new -s sql -ncode -d
    tmux new-window -ndiff -t sql:2
    tmux new-window -nbuild -t sql:3
    tmux split-window -t sql:diff -h
    tmux send-keys -t sql:1 vim Enter
#    tmux send-keys -t sql:diff.0 cdc Enter
#    tmux send-keys -t sql:diff.1 cdc Enter
fi
tmux attach -t sql \; select-window -t code \;
