#!/bin/bash

n=1
case $1 in
-[0-9]*) n=$(expr 0 - $1)
        shift
esac
re=${1:?"缺少待查寻的正则表达式"}
shift

# 找到符合正则的地方
places=$(grep -nH -e $re $@)
echo $places
export IFS="\
"                               # 设置以回车为分隔符
for place in $places
do
    file=$(echo $place |cut -d ":" -f1)
    line=$(echo $place |cut -d ":" -f2)
    echo $file ":"
    begin_line=$(expr $line - $n)
    if [ $begin_line -le 0 ]
    then
        begin_line=1
    fi

    end_line=$(expr $line + $n)
    sed -n "$begin_line,${end_line}p" $file
done
