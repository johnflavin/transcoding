#!/bin/bash

mp4file="${mkvfile%mkv}mp4"
# moviename="$1"

rsync -vv $(pwd)/${mp4file} john@diskstation.local:/volume1/video/Movies/${mp4file} && notify "Rsync done" "${moviename} is on Diskstation" || notify "Rsync failed" "${moviename} was not copied to Diskstation"

# TODO only rm if rsync succeeded
# rm ${moviedir}/${mkvfile}