#!/usr/bin/env bash
if [[ -z "$*" ]];then
    container="$(basename -s .docker $0)"
    exec $0 "${container}"
fi
container="$1"
shift
# search if then container exist
if [[ -n "$(docker container ls -qa -f name=${container})" ]];then
    docker start -i $@ ${container}
    exit 0
fi
image="lujun9972/${container}"
docker run -it --name ${container} --device /dev/dri -v /dev/shm:/dev/shm --device /dev/snd -v /tmp/.X11-unix/:/tmp/.X11-unix -e DISPLAY=${DISPLAY}  -v /run/user/${UID}/pulse:/run/user/${UID}/pulse -v /etc/machine-id:/etc/machine-id -v /usr/share/fonts/:/usr/share/fonts/ $@ "${image}"
