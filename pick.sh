#!/bin/bash

if [ $# -eq 0 ];then
    set $(cat -)                # 用stdin中的内容设置参数
fi

for i in "$@"                  # 循环各参数
do
    echo -n "$i? " >/dev/tty
    read response
    case $response in
        [yY]*) echo $i;;
        [qQ]*) break
    esac
done </dev/tty
