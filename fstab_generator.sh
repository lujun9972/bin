#!/usr/bin/env bash

function help()
{
    cat<<EOF
生成 fstab 挂载项
usage: ${0##*/} [+-o options] [+-dp} [--] device dir
EOF
}
option="defaults,noatime"
dump=0
pass=0
while getopts :o:dp OPT; do
    case $OPT in
        o|+o)
            option="$OPTARG"
            ;;
        d|+d)
            dump=1
            ;;
        p|+p)
            pass=2
            ;;
        *)
            help
            exit 2
    esac
done
shift $(( OPTIND - 1 ))
OPTIND=1
if [[ $# -ne 2 ]];then
    help
    exit 2
fi

device="$1"
dir="$(realpath "$2")"

uuid=$(blkid -s UUID -o value "$device")
type=$(blkid -s TYPE -o value "$device")
echo "UUID=${uuid}	${dir}	${type}	${option}	${dump}	${pass}"
