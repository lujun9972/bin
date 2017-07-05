#!/bin/bash
net_stat=1
while true
do
    PINGRET=$( ping 8.8.8.8 -c 4 | grep "ttl=" )
    
    [ -z "$PINGRET"  ] &&
        {
            if [ $net_stat -eq 1 ]; then
                notify-send -i /usr/share/icons/oxygen/48x48/actions/dialog-cancel.png "Warning" "Bad connection"
                net_stat=0
            fi
            echo Bad connection
        }||
            {
                if [ $net_stat -eq 0 ]; then
                    notify-send -i /usr/share/icons/oxygen/48x48/actions/dialog-ok-apply.png "Congrats" "Network connected"
                    net_stat=1
                fi
                echo Network connected
            }
    sleep 5
done
