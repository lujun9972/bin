#!/bin/bash

if [ $# -eq 1 ];then
    file=$(pwd)
else
    file=$1
fi

if [ -d $file ];then
    emacsclient.sh --eval "(image-dired \"${file}\")"
else
    emacsclient.sh $file
fi
