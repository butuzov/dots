# Realod Config
alias reload='source ~/.bash_profile'
alias edit='code ~/.dotfiles'
alias notes='code ~/Users/butuzov/Desktop/today.md'
alias today='code ~/Dropbox/Dev-Projects/todayilearned'

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias home="cd ~"
alias desktop="cd ~/Desktop"

# Download playlist something from youtube
alias pldl="youtube-dl -o '%(playlist_index)s %(title)s.%(ext)s' $1"
alias pldlh="youtube-dl -f 22 -o '%(playlist_index)s %(title)s.%(ext)s' $1"

# calculate video langht of the video course
vl(){
    SEC=$(find . -name "*mp4" -print0 | xargs -0 -I {} sh -c 'ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "{}"' | awk '{ sum += $1; } END { print sum; }' "$@" );
    printf "Total Time of course is : %s\n" $(convertsecs $SEC)
}

# Download and convert video to mp3 and put it to mp3 folder.
mp3dl(){
    youtube-dl -o '%(title)s.%(ext)s' --extract-audio --audio-format mp3 $1
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
# Creates RAM disk of 8gb (default value) with a name ram (default value)
# usage ramdisk 8
# usage ramdisk 10 ramka_na_stinky
ram(){
    diskutil erasevolume HFS+ "${2:-ram}" $(hdiutil attach -nomount ram://$((2*1000*1000*${1:-8})))
    open "/Volumes/${2:-ram}"
}
