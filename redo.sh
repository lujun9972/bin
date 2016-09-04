#! /bin/bash


delay=15
count=-1
while getopts d:c: OPTION
do
    case $OPTION in
	d) delay=$OPTARG
	    ;;
	c) count=$OPTARG
	    ;;
    esac
done

shift $(expr $OPTIND - 1)
i=0
while [ $i -ne $count ]
do
    clear
    echo "command:" $@
    echo "count:" $i
    echo "delay:" $delay
    eval $@
    i=$(expr $i + 1)
    sleep $delay
done
