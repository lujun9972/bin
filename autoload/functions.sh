#!/bin/echo Warinng: this library should be sourced!

function ostype()
{
    local osname=$(uname -s)
    case $osname in
        "FreeBSD") echo "FREEBSD"
                   ;;
        "SunOS") echo "SOLARIS"
                 ;;
        "Linux") echo "LINUX"
                 ;;
        "CYGWIN*") echo "CYGWIN"
                   ;;
    esac
    return 0
}

function iseven()
{
    local last_digit=$(echo $1 | sed 's/\(.*\)\(.\)$/\2/')
    case $last_digit in
        0|2|4|6|8 ) return 0
                    ;;
        *) return 1
           ;;
    esac
}

function isalive()
{
    local node=$1
    ping -c 3 $node >/dev/null 2>&1
}

function verify_user()
{
    local expect_user=$1
    local actual_user=$(whoami)

    if [[ $expect_user != $actual_user ]];then
        echo "EXPECT $expect_user,not $actual_user"
        exit 1;
    fi
}

function continue_p()
{ read -p "$*,CONTINUE? [y/n]" CONT
  case $CONT in
      [nN]*)
          exit 1
          ;;
  esac
}

function repeat
{
    local interval=10
    local max_count
    local clear_flag
    while [[ $# -ne 0 ]]
    do
        case $1 in
            -t ) interval=$2
                 shift;shift
                 ;;
            -c ) max_count=$2
                 shift;shift
                 ;;
            -C ) clear_flag=true
                 shift
                 ;;
            *) break
               ;;
        esac
    done

    local count=0

    while :
    do
	if [[ -n "$max_count" && "$count" -ge "$max_count" ]];then
		break
	fi
        if [[ ! -z "$clear_flag" ]];then
            clear
        fi
        "$@"
	count=$(expr $count + 1)
        sleep $interval
    done
}
