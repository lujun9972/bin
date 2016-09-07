#!/bin/bash

function download_imgs
{
    url=$1
    html=$(curl -s --socks5 127.0.0.1:1080 $url)
    entry_content=$(echo $html|grep -Po -e '<div class="entry-content clearfix".+?</div>' )
    imgs=$(echo $entry_content |grep -Eo 'src="[^"]+"' |grep -Eo '".+"' |grep -Eo '[^"]+')
    for img in $imgs;do
        curl -s --socks5 127.0.0.1:1080 --create-dirs -o $(basename $img) $img
    done
    # url=$(echo $html|grep -Eo '<a href="[^"]+">下一頁</a>' |grep -Eo '".+"') |grep -Eo '[^"]+'
    url=$(echo $html|grep -Eo '<a href="[^"]+">下一頁</a>' |grep -Eo '".+"' |grep -Eo '[^"]+')
    echo $url
}


url=$1
html=$(curl -s --socks5 127.0.0.1:1080 $url)
title=$(echo $html |egrep -o "<title>.+</title>"|sed 's/<title>\|<\/title>//g')
mkdir "$title"
cd "$title"
while [ "$url" != "" ];do
    url=$(download_imgs $url)
done
