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
alias mp3dl="youtube-dl --extract-audio --audio-format mp3 $1"       # video2mp3

# Cideo compressing
alias video='cd /Volumes/Developer/Video-Library/Videos'
alias video_convert='video && go run converter.go -directory=__converting'

# Spinup wp-dev env
alias web='/Volumes/Developer/WordPress/.settings/commander.sh $1 $(pwd)'
