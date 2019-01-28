#!/usr/bin/env bash

while getopts :sh OPT; do
    case $OPT in
        s|+s)
            soft_link="true"
            ;;
        h|+h)
            hard_link="true"
            ;;
        *)
            echo "usage: ${0##*/} [+-sh} [--] FILES..."
            exit 2
    esac
done
shift $(( OPTIND - 1 ))
OPTIND=1

TMPMD5FILE=$(mktemp)
echo "$TMPMD5FILE"
trap "rm ${TMPMD5FILE}" EXIT


md5sum "$@" |sort >${TMPMD5FILE}
for md5 in $(cut -d" " -f1 ${TMPMD5FILE}|uniq)
do
    i=0
    files=()                    # 空数组
    while read -r file;do
        printf " %3d. %s\n" $i "${file}"
        files[$i]="$file"
        i=$((i+1))
    done< <(grep "${md5}" ${TMPMD5FILE} |sed "s/^${md5}[[:blank:]]*//")

    # 没有重复不用处理，直接进入下一个循环
    if [[ ${#files[@]} -eq 1 ]];then
        echo "没有重复文件，无需处理"
        continue
    fi

    # 处理重复的文件
    read -r -p "input the article number you want to keep: " num
    keep_file="${files[$num]}"
    # echo "I'wll keep ${keep_file}"

    for file in "${files[@]}";do
        if [[ "${file}" != "${keep_file}" ]];then
            if [[ -n "${soft_link}" ]];then
                ln -s "${keep_file}" "${file}"
            elif [[ -n "${hard_link}" ]];then
                ln "${keep_file}" "${file}"
            else
                rm "${file}"
            fi
        fi
    done
done
