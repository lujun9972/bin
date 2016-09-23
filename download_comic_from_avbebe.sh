#!/bin/bash

function download_imgs_from
{
    html="$@"
    entry_content=$(echo $html|grep -Po -e '<div class="entry-content clearfix".+?</div>' )
    imgs=$(echo $entry_content |grep -Eo 'src="[^"]+"' |grep -Eo '".+"' |grep -Eo '[^"]+')
    for img in $imgs;do
        echo "downloading $img"
        curl -s --socks5 127.0.0.1:1080 --create-dirs -o $(basename $img) $img &
    done
    wait
}

function get_next_url_from
{
    html="$@"
    url=$(echo $html|grep -Eo '<a href="[^"]+">下一頁</a>' |grep -Eo '".+"' |grep -Eo '[^"]+')
    echo $url
}

url=$1
title=""
while [ "$url" != "" ];do
    html=$(curl -s --socks5 127.0.0.1:1080 $url)
    if [ "$title" == "" ];then
        title=$(echo $html |egrep -o "<title>.+</title>"|sed 's/<title>\|<\/title>//g')
        mkdir "$title"
        cd "$title"
    fi
    download_imgs_from $html
    url=$(get_next_url_from $html)
done
