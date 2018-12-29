#!/bin/bash
player="mpg123"
ext="mp3"
while getopts :p:e: OPT; do
    case $OPT in
        p|+p)
            player="$OPTARG"
            ;;
        e|+e)
            ext="$OPTARG"
            ;;
        *)
            echo "usage: ${0##*/} [+-p player] [+-e ext} [--] music_directory"
            exit 2
    esac
done
shift $(( OPTIND - 1 ))
OPTIND=1
if [[ $# -eq 0 ]];then
    music_dir=$(pwd)
else
    music_dir=$1
fi
cd ${music_dir}

count=$(find ./ -name "*.${ext}"|wc -l)
index_file=".index"
function read_index()
{
	local index=""
	if [[ -r ${index_file} ]];then
		index=$(cat ${index_file})
	fi
	if [[ -z "${index}" ]];then
		index="1"
	fi
	echo $((${index} % ${count}))
}

function write_index()
{
	local index=$1
	echo "$index" > ${index_file}
}

index=$(read_index)
music_file=$(find ./ -name "*.${ext}"|head -n $index |tail -n 1)
${player} "${music_file}"
write_index $((${index} + 1))
