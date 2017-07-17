#!/bin/bash

crop_result=$(docker run -v $(pwd):/data ntodd/video-transcoding:latest detect-crop /data)
crop=$(grep -e '--crop' - <<< ${crop_result} | sed 's/.*--crop //' | sed 's| /data||')
# echo ${crop_result}
echo "export crop=${crop}"
echo "echo crop=${crop}"