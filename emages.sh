#!/bin/bash

if [ $# -eq 1 ];then
    file=$(pwd)
else
    file=$1
fi

if [ -d $file ];then
    emacs -q --eval "(image-dired \"${file}\")"
else
    emacs -q $file
fi
