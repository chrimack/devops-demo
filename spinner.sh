#!/bin/bash
# https://github.com/wcarhart/willcarh.art-snippets/blob/master/how-to-write-better-bash-spinners/snippet.bash
# https://github.com/heroku/heroku-cli-util/blob/master/lib/spinners.json

spinner_pid=

function start_spinner {
    set +m
    echo -n "$1         "
    { while : ; do for X in '  •     ' '   •    ' '    •   ' '     •  ' '      • ' '     •  ' '    •   ' '   •    ' '  •     ' ' •      ' ; do echo -en "\b\b\b\b\b\b\b\b$X" ; sleep 0.1 ; done ; done & } 2>/dev/null
    spinner_pid=$!
}

function stop_spinner {
    { kill -9 $spinner_pid && wait; } 2>/dev/null
    set -m
    echo -en "\033[2K\r"
}

trap stop_spinner EXIT

start_spinner "Doing stuff... "
sleep 4
stop_spinner
