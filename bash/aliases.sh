# Realod Config
alias reload='source ~/.bash_profile'

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias home="cd ~"
alias desktop="cd ~/Desktop"

# Download something from youtube
alias pldl="youtube-dl -o '%(playlist_index)s %(title)s.%(ext)s' $1" # playlist
alias pldlh="youtube-dl -f 22 -o '%(playlist_index)s %(title)s.%(ext)s' $1" # playlist
# calculate video langht of the video course
function vl(){
    SEC=$(find . -name "*mp4" | xargs -I {} sh -c 'ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "{}"' | awk '{ sum += $1; } END { print sum; }' "$@" );
    printf "Total Time of course is : %s\n" $(convertsecs $SEC)
}

# Download and convert video to mp3 and put it to mp3 folder.
function mp3dl(){
    local URL=$1
    cd /tmp
    youtube-dl -o '%(title)s.%(ext)s' --extract-audio --audio-format mp3 $1
    find /tmp/ -name "*.mp3" | xargs -I {} sh -c 'mv -f "{}" ~/Music/'
    cd -
}


# Time and Date
#   Get week number
alias week='date +%V'
# Stopwatch
alias timer='echo "Timer started. <crtl+d> to breack." && date && time cat && date'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig | grep inet | grep -v inet6 | awk '{print $2}'"

# Always enable colored `grep` output
alias grep='grep --color=auto '

# Enable aliases to be sudo’ed
alias sudo='sudo '
