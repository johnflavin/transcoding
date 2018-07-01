options="$@"
# crop_result=$(detect-crop $mkvfile)
# crop=$(grep -e '--crop' - <<< ${crop_result} | sed 's/.*--crop //' | cut -d ' ' -f 1) && echo $crop
transcode-video --crop detect --mp4 ${options} ${mkvfile} && notify "Transcode done" "${moviename} is done transcoding" || (notify "Transcode failed" "${moviename} did not transcode"; exit 1)
