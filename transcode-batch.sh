# Declaring a veriable an integer and using i+=1 is the fastest way to increment.
# See https://askubuntu.com/posts/706683/revisions
options="$@"

declare -i failed; failed=0
find . -type f -name '*.mkv' | while read f; do transcode-local.sh "$f"; done

if (($failed>0)); then
    notify "$failed failed" "There were $failed failed transcodes in this batch"
else
    notify "All good" "All done. Everything went fine."
fi