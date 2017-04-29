#!/bin/bash
# you-play.sh跟w3m配合用来看youku视频
you-get --player "mplayer -vo fbdev2 -x 1024 -y 768 -zoom" "$@"
