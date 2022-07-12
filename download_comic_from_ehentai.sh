#!/usr/bin/env bash
function download()
{
    local html="$(curl $1)"
    local img=$(echo "${html}"|hxselect -c  '#img::attr(src)')
    local name=$(echo "${html}"|hxselect -c '#i1 > h1:nth-child(1)')
    local file="${name}/$(basename $1).$(basename ${img})"
    mkdir -p "${name}"
    curl "${img}" -o "${file}"
    local next=$(echo "${html}"|hxselect -c 'div.sn:nth-child(1) > a:nth-child(4)::attr(href)')
    echo "${next}"
}

url="$1"
next_url="$(download "$url")"
echo ${next_url}
while [[ "${url}" != "${next_url}" ]];do
      if [[ "" != "${next_url}" ]];then
         url="${next_url}"
      fi
      echo downloading ${url}
      next_url="$(download "$url")"
done

