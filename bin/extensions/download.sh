
# Handles some downloads
dlhelp() {

    printf "\n"
    printf "\t File Download\n"
    printf "\t - dl <url>\n"


    printf "\t Media\n"
    printf "\t - audiobook <youtube-url>\n"
    printf "\t - youtube <youtube-url>\n"
    printf "\t - mp3 <youtube-url>\n"
    printf "\t - vl \n"


    printf "\n"
}
alias helpdl=dlhelp
alias ytact=". ~/.ytdl/bin/activate"

# curl - doenload as
alias dl="curl -LO ${1}"


# Download and convert video to mp3 and put it to mp3 folder.
mp4(){
     ytact && yt-dlp -f 22 -o '%(title)s.%(ext)s' $1
}

# Download and convert video to mp3 and put it to mp3 folder.
mp3(){
     yt-dlp -o '%(playlist_index)s %(title)s.%(ext)s'  \
        --extract-audio \
        --audio-format mp3 \
        $1
}

# Download and convert video to mp3 and put it to mp3 folder.
linkedin(){
    # alternative
    # yt-dlp  --cookies linkedin.com_cookies.txt  -o '%(playlist_title)s/%(playlist_index)s ( %(chapter)s )  %(title)s.%(ext)s.mp4' --verbose --add-metadata --write-sub --limit-rate 2M --min-sleep-interval 5 --max-sleep-interval 10 https://www.linkedin.com/learning/monitoring-aws-with-cloudwatch

     yt-dlp -o "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" \
      --username $LINKEDIN_USER \
      --password $LINKEDIN_PASS \
      --retries 10 \
      --verbose \
      --limit-rate 250K \
      --sleep-interval 30 \
      $1
}


# Simple audiobook creation.
audiobook_make() {
    # generating random name
    local NAME=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 6 | head -n 1)

    # generating book
    ls -1 *.[Mm][Pp]3 | sed "s/\(.*\)/file '\1' /" > "${NAME}.txt" \
        && ffmpeg -f concat -safe 0 -i "${NAME}.txt" -c copy "${NAME}.mp3" \
        && ffmpeg -i "${NAME}.mp3" "${NAME}.m4a" \
        && mv "${NAME}.m4a" "audiobook.m4b"

    # Cleanup
    unlink "${NAME}.txt"
    unlink "${NAME}.mp3"
}


# Download Playlist and Audiobook Conversion
audiobook() {

    # dlownload mp3s
    mp3 $1

    # make a book
    audiobook_make
    # Mp3files aren't cleaned-up.
    # Sometimes I like to hear separate stories.
}

# Download YouTube videos in HQ
youtube() {
    URL=$1
    IDX=1
    # you can additionaly add
    # --playlist-reverse
    for video in $( yt-dlp --flat-playlist -j $URL | \
                    jq -r '.id' | \
                    sed 's_^_https://youtube.com/v/_'); do

        # calling youtubedl for video allows us to skip if any
        # video of playlist failed
        # additional options
        # -r 700K // speed limit
        yt-dlp -f 22 \
                   --write-info-json \
                   -o "${IDX} %(title)s.%(ext)s" $video
        if [[ $? == 0 ]]; then
            IDX=$(($IDX+1))
        fi

        sleep 2
        # just in case if we want to kill it.
    done
}


# converts seconds to time
# https://stackoverflow.com/questions/12199631
function convertsecs() {
    h=$(bc <<< "${1}/3600")
    m=$(bc <<< "(${1}%3600)/60")
    s=$(bc <<< "${1}%60")
    printf "%02d:%02d:%05.2f\n" $h $m $s
}

# calculate video lenght of the video course
vl(){
    echo ${1}
    SEC=$(find . -name "*mp4" -print0 | xargs -0 -I {} sh -c 'ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "{}"' | awk '{ sum += $1; } END { print sum; }' "$@" );
    printf "Total Time of course is : %s\n" $(convertsecs $SEC)
}

