#!/bin/bash
if ! tmux has-session -t router; then
    cd
    tmux new -s router -nowned -d
    tmux new-window -nhhhranch -t router:2
    tmux new-window -ngarage -t router:3
#    tmux send-keys -t router:1 vim Enter
fi
tmux attach -t router \; select-window -t owned \;
