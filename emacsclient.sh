#!/bin/bash

if [ -z $DISPLAY ];then
    emacsclient -a "" -t "$@"
else
    emacsclient -a "" -c -n "$@"
fi
