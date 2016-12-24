#!/bin/bash
while [[ $# -ne 0  ]]
do
    case $1 in
        -[fd])
            check_method=$1
            shift;
            check_path=$1
            shift
            ;;
        -[-c])
            shift
            commands=$*
            break
            ;;
        *)
            commands=$*
            break

    esac
done

if ! test $check_method $check_path ;then
    if [ -z "$commands" ];then
        $SHELL <<EOF
$(cat -)
EOF
    else
        $commands
    fi
fi

