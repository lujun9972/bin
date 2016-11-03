#!/bin/bash

graphic_p=$(emacsclient -a "" --eval "(display-graphic-p)")

if [ $graphic_p = "t" ];then
    emacsclient -a "" -c -n "$@"
else
    emacsclient -a "" -t "$@"
fi
