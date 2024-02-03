#!/usr/bin/env bash

PERSONAL_SESSION="vimdeathmatch"
SQL="~/code/personal/SqlScripts"
TVUI="~/work/sql"
TVUI_AUTOMATION="~/work/sql-automation"
MILO="~/work/milo"
WORK_BUILD="~/code/work/builds"
NRDP="~/code/work/nrdp"

createWindow() {
    session=$1
    window=$2
    shift
    shift
    hasWindow=$(tmux list-windows -t $session | grep "$window")
    if [ -z "$hasWindow" ]; then
        cmd="tmux neww -t $session: -n $window -d"
        if [ $# -gt 1 ]; then
            cmd="$cmd $@"
        fi
        echo "Creating Window(\"$hasWindow\"): $cmd"
        eval $cmd
    fi
}

createSession() {
    session=$1
    window=$2
    shift
    shift
    cmd="tmux new -s $session -d -n $window $@ > /dev/null 2>&1"

    echo "Creating Session: $cmd"
    eval $cmd
}

while [ "$#" -gt 0 ]; do
    curr=$1
    shift

    case "$curr" in
    "-m")
        createSession code primary
        createWindow code code
        createWindow code build
        ;;
    "-n")
        eval cd $SQL
        createSession sql primary
        # This is used if you would like to have more options
        #version=$1
        #if [ -z $version ]; then
        #    echo "-n should have the next argument contain a number"
        #    exit 1
        #fi
        #shift
        eval cd $WORK_BUILD
        createWindow sql build_work
        # Creates the window and runs a command
        #createWindow sql vim_nrdp -c $NRDP
        ;;

    "-ta")
        createSession sql primary -c $TVUI_AUTOMATION
        createWindow sql sql_automation -c $TVUI_AUTOMATION
        createWindow sql sql_automation_vim -c $TVUI_AUTOMATION
        ;;

    "-t")
        createSession sql primary -c $TVUI
        createWindow sql sql_server -c $TVUI "./sql server"
        createWindow sql sql_client -c $TVUI "./sql client"
        ;;

    "--vwm")
        createSession $PERSONAL_SESSION primary -c $VWM
        createWindow $PERSONAL_SESSION vwm -c $VWM "NVIM_LISTEN_ADDRESS=/tmp/nvim2 go run main.go"
        ;;

    "--deathmatch")
        createSession $PERSONAL_SESSION primary -c $DEATHMATCH
        createWindow $PERSONAL_SESSION server -c $DEATHMATCH/server "docker-compose up --build"
        ;;

    "--dm-logging")
        createSession $PERSONAL_SESSION primary -c $DEATHMATCH
        tmux split-window -t $PERSONAL_SESSION:primary -p 35 -h tail -F ~/.local/share/nvim/VimDeathmatch.log
        ;;

    *) echo "Unavailable command... $curr"
    esac
done
