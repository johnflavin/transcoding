# Declaring a veriable an integer and using i+=1 is the fastest way to increment.
# See https://askubuntu.com/posts/706683/revisions
options="$@"

declare -i failed; failed=0
for mkvfile in $(ls *.mkv); do
    export mkvfile
    export moviename=$mkvfile
    transcode-local.sh ${options} || failed+=1
done

if (($failed>0)); then
    notify "$failed failed" "There were $failed failed transcodes in this batch"
else
    notify "All good" "All done. Everything went fine."
fi