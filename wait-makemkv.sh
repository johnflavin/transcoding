#!/bin/bash
#
# moviename=$1
# mkvfile=$(ls *.mkv)
size=$(stat -f %z ${mkvfile})
sleep 10
while ((size < $(stat -f %z ${mkvfile}) )); do
    size=$(stat -f %z ${mkvfile})
    echo "size=${size}"
    sleep 30
done

echo 'Done!'

notify "Rip done" "${moviename} has finished ripping. Check on it."