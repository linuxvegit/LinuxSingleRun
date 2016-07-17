#!/bin/sh

PROGRAM=$1

PID=$(ps ax | grep -v "$(basename $0) \+$1" | grep -v grep | grep "$PROGRAM" | grep -o '^[ ]*[0-9]*' | head -1 | grep -o '[0-9]\+')

if [ -z "$PID" ]; then
    $PROGRAM 
else
    wmctrl -i -a $(wmctrl -l -p | awk '/^[^ ]+ +[^ ]+ +'"$PID"'/ {print $PID}')
fi
