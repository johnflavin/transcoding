#!/bin/bash

moviedir=$1
mp4file=$(ls $moviedir *.mp4)
moviename="$2"

rsync -vv ${moviedir}/${mp4file} john@diskstation.local:/volume1/video/Movies/${mp4file} && notify "Rsync done" "${moviename} is on Diskstation" || notify "Rsync failed" "${moviename} was not copied to Diskstation"

# TODO only rm if rsync succeeded
# rm ${moviedir}/${mkvfile}