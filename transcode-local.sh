#!/bin/bash
mkvfile=$1
shift
options="$@"
# crop_result=$(detect-crop $mkvfile)
# crop=$(grep -e '--crop' - <<< ${crop_result} | sed 's/.*--crop //' | cut -d ' ' -f 1) && echo $crop
transcode-video --crop detect --fallback-crop minimal --add-audio all --mp4 ${options} "${mkvfile}" && notify "Transcode done" "${moviename-${mkvfile}} is done transcoding" || (notify "Transcode failed" "${moviename-${mkvfile}} did not transcode"; exit 1)
