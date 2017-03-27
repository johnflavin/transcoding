#!/bin/bash

moviedir=$1
mkvfile=$(ls $moviedir *.mkv)
moviename="$2"

# Figure out crop
docker run -v ${moviedir}:/data ntodd/video-transcoding:latest detect-crop /data

# TODO parse output for crop
crop=""

# Transcode
docker run -v ${moviedir}:/data ntodd/video-transcoding:latest transcode-video --crop ${crop} --mp4 /data/${mkvfile} && notify "Transcode done" "${moviename} is ready to rsync" || notify "Transcode failed" "${moviename} did not transcode"

# TODO only rm if transcode succeeded
rm ${moviedir}/${mkvfile}
