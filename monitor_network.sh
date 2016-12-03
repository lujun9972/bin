#!/bin/bash
target="www.baidu.com"
port=80
interval=60                     # 秒

function live_p()
{
    local remote=$1
    local port=$2
    if echo >/dev/tcp/$remote/$port;then
        echo "网络通了!"
    else
        echo "网络不通了!"
    fi
}

old_state=$(live_p $target $port)

while :
do
      sleep $interval
      current_state=$(live_p $target $port)
      if [ $current_state != $old_state ];then
          notify_send $current_state
      fi
      old_state=$current_state;
done
