#!/bin/bash


# crop="$1"
# moviename="$2"
# mkvfile=$(ls *.mkv)

# Transcode
docker run -v $(pwd):/data ntodd/video-transcoding:latest transcode-video --crop ${crop} --mp4 /data/${mkvfile} && notify "Transcode done" "${moviename} is ready to rsync" || notify "Transcode failed" "${moviename} did not transcode"

# TODO only rm if transcode succeeded
# rm ${moviedir}/${mkvfile}
