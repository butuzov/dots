
# Prints Download Options

dlhelp() {

    printf "\n"
    printf "\t File Download (save)\n"
    printf "\t - dl <url>\n"


    printf "\t Media\n"
    printf "\t - audiobook <youtube-url>\n"
    printf "\t - youtube <youtube-url>\n"
    printf "\t - coursehunters <coursehunters-url>\n"
    printf "\t - mp3 <youtube-url>\n"

    printf "\n"
}

# curl - doenload as
alias dl="curl -LO ${1}"


# Download and convert video to mp3 and put it to mp3 folder.
mp3(){
     youtube-dl -o '%(playlist_index)s %(title)s.%(ext)s'  \
        --extract-audio \
        --audio-format mp3 \
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

# CourseHunters
coursehunters() {
    # https://coursehunters.net/archive
    URL=$1

	OUT="$(basename $URL).html"
	if [[ ! -f $OUT ]]; then
		curl -L $URL -o $OUT
	fi


	for file in $(cat $OUT | \
                    grep lesson | \
                    grep mp4 | \
                    grep '"file"' | \
                    awk '{print $2}' | \
                    sed -e 's/",//' | \
                    sed -e 's/"//'); do

	    __DIR__=$(basename $(dirname $file ))

        if [[ ! -d "${__DIR__}" ]]; then
            mkdir "${__DIR__}"
        fi

        if [[ ! -f "${__DIR__}/$(basename $file)" ]]; then
            echo "Downloading: ${__DIR__}/$(basename $file)"
            curl -L  $file -o "${__DIR__}/$(basename $file)"
        fi
    done

    mv $OUT "${__DIR__}/$OUT"
}


# Download YouTube videos in HQ
youtube() {
    URL=$1
    IDX=1
    # you can additionaly add
    # --playlist-reverse
    for video in $( youtube-dl --playlist-reverse --flat-playlist -j $URL | \
                    jq -r '.id' | \
                    sed 's_^_https://youtube.com/v/_'); do

        # calling youtubedl for video allows us to skip if any
        # video of playlist failed
        # additional options
        # -r 700K // speed limit
        youtube-dl -f 22 \
                   --write-info-json \
                   -o "${IDX} %(title)s.%(ext)s" $video
        if [[ $? == 0 ]]; then
            IDX=$(($IDX+1))
        fi

        sleep 2
        # just in case if we want to kill it.
    done
}

## pl check
## .view_count
