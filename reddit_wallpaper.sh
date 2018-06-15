#!/bin/bash

function get_image_url()
{
    url=$(wget  https://www.reddit.com/r/wallpapers -O - |grep -o -E 'href="([^"#]+)"' |grep -o -E 'https://www.reddit.com/r/wallpapers/comments/[^"]+/' |shuf |head -1)
    wget ${url} -O - |grep -o -E 'href="([^"#]+)"' |grep -E "\.jpg|\.jpeg|\.png" |grep -v -E "www.redditstatic.com|resi.ze-robot.com" |shuf |head -1 |grep -o -E 'http[^"]+'
}

image_url=$(get_image_url)

while [[ -z "${image_url}" ]];do
    image_url=$(get_image_url)
done

wget ${image_url} -O - |feh --bg-scale -
